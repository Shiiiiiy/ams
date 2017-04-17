<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="${rc.contextPath}/css/starSelect.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${rc.contextPath}/js/common/cascadecommon.js"></script>
    </head>
    <body>
		<div id="contentwrapper">
   		<div class="main_content">   
    	   <div class="row-fluid">	
    			<form  id="evaluationTimeQuery"  action="${rc.contextPath}/evaluation/timeSet/opt-query/queryEvaluationTime.do" method="post">
				<div class="span12">			
					<div class="row-fluid"> 
						 <div class="span4">
							<span class="formTitle">学院</span>
							<div class="span8">
								<select size="1" id="collegeId" name="collegeId" aria-controls="dt_gal" class="span10">
									<option value="" >请选择</option>
									<#if collegeList??>
										<#list collegeList as c>
											<#if evaluationTime?? && evaluationTime.collegeId?? && c.id==evaluationTime.collegeId> 
												<option value="${c.id}" selected="selected">${c.name?html}</option>
											<#else>
												<option value="${c.id}">${c.name?html}</option>
											</#if>
										</#list>
									</#if>
								</select>
							</div>
						</div>
						
						<div class="span4">
							<span class="formTitle">月份</span>
							<div class="span8">
								<select size="1" id="monthId" name="monthId" aria-controls="dt_gal" class="span10">
									<option value="" >请选择</option>
									<#if monthList ?? >
										<#list monthList as m>
											<#if evaluationTime?? && evaluationTime.monthId?? && m.id== evaluationTime.monthId >
												<option value="${m.id}" selected >${m.name?html}</option>
											<#else>
												<option value="${m.id}">${m.name?html}</option>
											</#if>
										</#list>
									</#if>
								</select>
							</div>
						</div>
						
						<div class="span4">
			              <input type="button" class="btn btn-info"  onclick="query();" value="查 询"/>
			              <input type="button" class="btn btn-info"  onclick="comp.clearForm('evaluationTimeQuery')" value="清 空"/>
						</div>
					</div>
				</div>
			</form>
				<div class="row-fluid">
					<div class="span12">
						<h5 class="heading"></h5>
						<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
				        <div class="row">
				            <div class="span10">
				                <div class="dt_actions">
				                    <div class="row-fluid">
					                    <#if user_key.optMap??>
											<#if user_key.optMap['add']??>
												<button class="btn btn-info"  onclick="addEvaluationTime()">新 增</button>
											</#if>
										</#if>	
				                    </div>
				                </div>
				            </div>
				        </div>
				        
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl" >
							<thead>
								<tr>
									<th width="5%">序号</th>
									<th width="12%">学院</th>
									<th width="12%">辅导员</th>
									<th width="10%">月份</th>
									<th width="13%">测评申请开始时间</th>
									<th width="13%">测评申请结束时间</th>
									<th width="13%">测评确认开始时间</th>
									<th width="13%">测评确认结束时间</th>
									<th width="9%">操作</th>
								</tr>
							</thead>
							<tbody>
								<#if page??>	
									<#list page.result as p>
										<tr>
											<td>${p_index+1}</td>
											<td class="autocut">${(p.college.name)!""}</td>
											<td class="autocut"><#if map?? && map[p.college.id]??>${map[p.college.id]}</#if></td>
											<td class="autocut">${(p.month.name)!""}</td>
											<td class="autocut">${(p.addStartTime?string('yyyy-MM-dd'))!""}</td>
											<td class="autocut">${(p.addEndTime?string('yyyy-MM-dd'))!""}</td>
											<td class="autocut">${(p.updateStartTime?string('yyyy-MM-dd'))!""}</td>
											<td class="autocut">${(p.updateEndTime?string('yyyy-MM-dd'))!""}</td>
											<td>
											<#if user_key.optMap['update']??>
											   <a href="${rc.contextPath}/evaluation/timeSet/opt-update/editEvaluationTime.do?id=${p.id}" class="sepV_a" title="修改"><i class="icon-edit"></i></a>
											</#if>
											<#if user_key.optMap['del']??>
											   <!--a href="javascript:void(0);" onclick="deleteEvaluationTime('${p.id}');" class="sepV_a" title="删除"><i class="icon-trash"></i></a-->
											</#if>   
											</td>
										</tr>
									</#list>
								 </#if> 
							</tbody>
						</table>
						 <#assign pageTagformId="evaluationTimeQuery"/>
						 <#include "/page.ftl">
					</div>
				</div>
			</div> 
		</div> 
	</div>
</div>

<#-- 脚本开始 -->
<script>
	function query(){//查询
		$("#evaluationTimeQuery").submit();
	}
	
	function addEvaluationTime(){//新增
		window.location.href="${rc.contextPath}/evaluation/timeSet/opt-add/editEvaluationTime.do";
	}
	
	//删除操作
	function deleteEvaluationTime(id){
		comp.confirm("确定要删除吗？", function(result) {
        	if(!result)
        		return;  
    		$.post("${rc.contextPath}/evaluation/timeSet/opt-del/deleteEvaluationTime.do", { id: id }, function(data){
    			if(data === "success"){
    				comp.message("删除成功！","info");
    				window.location.href="${rc.contextPath}/evaluation/timeSet/opt-query/queryEvaluationTime.do";
    			}
			   },"text");
		}); 
	}
</script>
</body>
</html>