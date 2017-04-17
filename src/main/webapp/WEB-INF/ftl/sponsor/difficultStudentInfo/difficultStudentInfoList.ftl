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
    		<form  id="studentInfoQuery"  action="${rc.contextPath}/sponsor/difficultStudent/opt-query/queryDifficultStudentList.do" method="post">
				<div class="span12">			
				   <div class="row-fluid">
					 <div class="span4">
						  <span class="formTitle">学年</span>
						    <select size="1" id="schoolYear" class="span6" name="schoolYear.id" aria-controls="dt_gal" >
					          <option value="" />请选择..</option>
								<#if yearList??>
									<#list yearList as d>
										<#if difficultStudentInfo.schoolYear ?? && difficultStudentInfo.schoolYear.id==d.id >
											<option  value="${d.id}" selected="selected" />${d.name?html}</option>
										<#else>
											<option value="${d.id}" />${d.name?html}</option>
										</#if>
									</#list>
								 </#if>
				         	</select>
						 </div>
						 <div class="span4">
						  <span class="formTitle">推荐档次</span>
						    <select size="1" id="difficultLevel.id" class="span6" name="difficultLevel.id" aria-controls="dt_gal" >
					          <option value="" />请选择..</option>
								 <#if difficultList??>
										<#list difficultList as d>
											<#if difficultStudentInfo.difficultLevel ?? && difficultStudentInfo.difficultLevel.id==d.id >
												<option  value="${d.id}" selected="selected" />${d.name?html}</option>
											<#else>
												<option value="${d.id}" />${d.name?html}</option>
											</#if>
										</#list>
								   </#if>
								</select>
				         	</select>
				         </div>
				          <div class="span4">
						    <input type="button" class="btn btn-info"  onclick="selectStudentInfo();" value="查 询"/>
		                    <input type="button" class="btn btn-info"  onclick="comp.clearForm('studentInfoQuery')" value="清 空"/>
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
											<#if user_key.optMap['add']?? && isSetTime==true>
					                            <button class="btn btn-info" type="button" id="add-button">
				                               		 申 请
					                            </button>
					                            <span id="time">
												<#if timeConfigModel ?? > 
												<font color="red"><b>[${(timeConfigModel.beginDate!"")?string("yyyy-MM-dd")}至  ${(timeConfigModel.endDate!"")?string("yyyy-MM-dd")}]</b></font> 
												</#if> 
											<#else>
											<font color="red"><b>现在未在设定的申请时间范围内</b></font>
											</#if>
										</#if>	
				                    </div>
				                </div>
				            </div>
				        </div>
				        
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl" >
							<thead>
								<tr>
									<th width="6%">序号</th>
									<th width="7%">姓名</th>
									<th width="9%">学号</th>
									<th width="8%">推荐档次</th>
									<th width="8%">学年</th>
									<th width="8%">是否孤儿</th>
									<th width="8%">是否残疾</th>
									<th width="8%">是否单亲</th>
									<th width="8%">村级证明</th>
									<th width="8%">镇级证明</th>
									<th width="8%">县级证明</th>
									<th width="8%">状态</th>
									<th width="8%">操作</th>
								</tr>
							</thead>
							<tbody>
								<#if page??>	
									<#list page.result as p>
										<tr>
											<td>${p_index+1}</td>
											<td class="autocut tipTag" data="学院：${(p.student.college.name)!''}<br/>专业：${(p.student.major.majorName)!''}<br/>班级：${(p.student.classId.className)!''}<br/>"><a target="_blank" href="${rc.contextPath}/sponsor/difficultStudent/opt-view/viewDifficultStudentInfo.do?id=${(p.id)!''}" title="查看困难生信息"> ${(p.student.name)!""}</a></td>
											<td class="autocut">${(p.student.stuNumber)!""}</td>
											<td class="autocut">${(p.difficultLevel.name)!""}</td>
											<td class="autocut">${(p.schoolYear.name)!""}</td>
											<td class="autocut">${(p.isOrphan.name)!""}</td>
											<td class="autocut">${(p.disabilityCertificateKind.name)!""}</td>
											<td class="autocut">${(p.isSingle.name)!""}</td>
											<td class="autocut">${(p.villageProve.name)!""}</td>
											<td class="autocut">${(p.townProve.name)!""}</td>
											<td class="autocut">${(p.countyProve.name)!""}</td>
											<td class="autocut">${(p.status.name)!""}</td>
											<#-->
											<td class="autocut">
											<#if p.processStatus ??>
												<#if currentUserId?? && p.nextApprover?? && p.nextApprover.id==currentUserId>
													审核中
												<#else>
													${processStatusMap[p.processStatus]}
												</#if>
											<#elseif p.status.code="SUBMIT">审核中
											</#if>
											</td>
											-->
											<td>
											<#if user_key.optMap['update']?? && p.status?? && p.status.code="SAVE" || (p.processStatus?? && p.processStatus ="REJECT")>
											   <a href="${rc.contextPath}/sponsor/difficultStudent/opt-update/editStudentInfo.do?id=${p.id}" class="sepV_a" title="编辑困难生信息"><i class="icon-edit"></i></a>
											</#if>
											<#if user_key.optMap['del']??>
											   <#if p.status?? && p.status.code="SUBMIT" ||(p.processStatus?? && (p.processStatus="REJECT" || p.processStatus="PASS"))>
											   <#else>
											   <a href="javascript:void(0);" onclick="deleteStudentInfo('${(p.student.name)!""}','${p.id!""}');" class="sepV_a" title="删除困难生信息"><i class="icon-trash"></i></a>
											   </#if>
											</#if>   
											</td>
										</tr>
									</#list>
								 </#if> 
							</tbody>
						</table>
						 <#assign pageTagformId="studentInfoQuery"/>
						 <#include "/page.ftl">
					</div>
				</div>
			</div> 
		</div> 
	</div>
</div>

<#-- 脚本开始 -->
<script>
	$(document).ready(function(){
	 	
	 	//新增方法 
	 	$("#add-button").click( function () { 
	 		window.location.href="${rc.contextPath}/sponsor/difficultStudent/opt-add/editStudentInfo.do?";
	 	 });
	 	
	});
	
	
	
	//查询
	function selectStudentInfo(){
	    $("#studentInfoQuery").attr("action","${rc.contextPath}/sponsor/difficultStudent/opt-query/queryDifficultStudentList.do");
		$("#studentInfoQuery").submit();
	}
	
	
	//删除操作
	function deleteStudentInfo(name,id)
	{
		comp.confirm("确定要删除【"+name+"】的信息吗？", function(result) {
        	if(!result)
        		return;  
    		$.post("${rc.contextPath}/sponsor/difficultStudent/opt-del/deleteDifficultStudentInfo.do", { id: id }, function(data){
    			if(data === "success")
    			{
    				comp.message(name +"删除成功！","info");
    				window.location.href="${rc.contextPath}/sponsor/difficultStudent/opt-query/queryDifficultStudentList.do";
    			}
			    
			   },"text");
		}); 
	}
	
	
    <!--显示提示框-->
	$(function(){
		$('.tipTag').poshytip({
			className: 'tip-yellowsimple',
			alignTo: 'target',
			alignX: 'right',
			alignY: 'center',
			offsetX: 5
		});
	});
		
	
	
</script>
</body>
</html>