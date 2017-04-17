<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="${rc.contextPath}/css/starSelect.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${rc.contextPath}/js/common/cascadecommon.js"></script>
        <script>
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
    </head>
    <body>
		<div id="contentwrapper">
   		<div class="main_content">   
    	   <div class="row-fluid">	
    		<form  id="evaluationQuery"  action="${rc.contextPath}/evaluation/statistics/opt-query/statisticsEvaluation.do" method="post">
				<div class="span12">			
					<div class="row-fluid">
						<div class="span4">
    				    	<span class="term">学年</span>
							<select size="1" id="year" name="yearId" aria-controls="dt_gal" class="span8 selectoption">
								<option value="" >请选择..</option>
								<#list schoolYearList as d>
									<#if evaluation?? && evaluation.yearId ?? && evaluation.yearId==d.id>
				    	            	<option  value="${d.id}" selected="selected">${d.name?html}</option>
				    	            <#else>
				    	            	<option  value="${d.id}" >${d.name?html}</option>
				    	            </#if>
								</#list>
							</select>
    				    </div>
    				    
						<div class="span4">
							<span class="formTitle">学院</span>
							<select size="1" id="collageId" name="collageId" aria-controls="dt_gal" class="span8" onchange="cascade.changeCollage('collageId','majorId','eClassId');" >
								<option value="">请选择..</option>
									<#list collageList as d>
										<#if evaluation?? && evaluation.collageId ?? && evaluation.collageId == d.id >
											<option  value="${d.id}" selected="selected">${d.name?html}</option>
										<#else>
											<option value="${d.id}" >${d.name?html}</option>
										</#if>
									</#list>
							</select>
						 </div>
						 
						 <div class="span4">
							<span class="formTitle">专业</span>
							<select size="1" id="majorId" name="majorId" aria-controls="dt_gal" class="span8 emptySelect"  onchange="cascade.changeMajor('majorId','eClassId');">
								<option value="" >请选择..</option>
								<#if majorList ?? >
									<#list majorList as m>
										<#if evaluation?? && evaluation.majorId ?? && evaluation.majorId== m.id >
											<option value="${m.id}" selected >${m.majorName}</option>
										<#else>
											<option value="${m.id}">${m.majorName}</option>
										</#if>
									</#list>
								</#if>
							</select>
						</div>
					</div>
					
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">班级</span>
							<select size="1" id="eClassId" name="eClassId" aria-controls="dt_gal" class="span8 emptySelect">
								<option value="" >请选择..</option>
								<#if classList ?? >
									<#list classList as c>
										<#if evaluation?? && evaluation.eClassId ?? && evaluation.eClassId == c.id >
											<option value="${c.id}" selected >${c.className}</option>
										<#else>
											<option value="${c.id}">${c.className}</option>
										</#if>
									</#list>
								</#if>
							</select>
						</div>
						
						<div class="span8">
							<span class="">月份</span>
							<#if monthList ?? >
								<#list monthList as c>
									<#if evaluation?? && evaluation.monthId ?? && evaluation.monthId?index_of(c.id)!=-1 >
										<input name="monthId" type="checkbox" value="${c.id}" checked/>${c.name}&nbsp;
									<#else>
										<input name="monthId" type="checkbox" value="${c.id}" />${c.name}&nbsp;
									</#if>
								</#list>
							</#if>
						</div>
					</div>
					 
		            <div class="btnCenter">
		              <input type="button" class="btn btn-info"  onclick="query();" value="查 询"/>
		              <input type="button" class="btn btn-info"  onclick="comp.clearForm('evaluationQuery')" value="清 空"/>
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
				              				<#if user_key.optMap['export']??>
				              					<div class="input-append">
				            					<#--span class="expsingle">单页导出条数:</span--><input id="exportSize" name="exportSize" class="span3"  value="1000" title="单页导出条数" type="hidden" />
				            					&nbsp;<button class="btn btn-info" type="button" onclick="exportEvaluation()">Excel导出</button>
				              					</div>
				              				</#if>
										</#if>
			              			</div>
			                   </div>
			           		</div>
				        </div>
						<table class="table table-bordered table-striped " id="smpl_tbl" >
							<thead>
								<tr>
									<th width="6%">序号</th>
									<th width="8%">学年</th>
									<#--
									<th width="10%">学院</th>
									<th width="10%">专业</th>-->
									<th width="8%">姓名</th>
									<th width="10%">学号</th>
									<th width="12%">班级</th>
									<th width="12%">德育测评分</th>
									<th width="11%">智育测评分</th>
									<th width="11%">文体测评分</th>
									<th width="11%">能力测评分</th>
									<th width="9%">测评总分</th>
								</tr>
							</thead>
							<tbody>
								<#if page??>
									<#list page.result as p>
										<tr>
											<td>${p_index+1}</td>
											<td class="autocut">${p[10]!""?html}</td><#--
											<td class="autocut">${p[1]!""?html}</td>
											<td class="autocut">${p[2]!""?html}</td>-->
											<td class="autocut tipTag" data="学院：${p[1]!''?html}<br/>专业：${p[2]!''?html}" >${p[4]!""?html}</td>
											<td class="autocut">${p[0]!""?html}</td>
											<td class="autocut">${p[3]!""?html}</td>
											<td class="autocut">${p[5]!""?html}</td>
											<td class="autocut">${p[6]!""?html}</td>
											<td class="autocut">${p[7]!""?html}</td>
											<td class="autocut">${p[8]!""?html}</td>
											<td class="autocut">${p[9]!""?html}</td>
										</tr>
									</#list>
								 </#if> 
							</tbody>
						</table>
						 <#assign pageTagformId="evaluationQuery"/>
						 <#include "/page.ftl">
						 <input id="pageTotalCount" name="pageTotalCount" type="hidden"  value="${page.totalCount}"/>
					</div>
				</div>
			</div> 
		</div> 
	</div>
</div>
<div class="modal hide fade" id="exportEvaluation">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3 id="title1">测评统计导出</h3>
	</div>
	<div class="modal-body" id="export_evaluation">
		
	</div>
	<div class="modal-footer">
		<a href="#" class="btn" data-dismiss="modal">关闭</a>
	</div>
</div>
<#-- 脚本开始 -->
<script>

	function query(){//查询
		$("#evaluationQuery").attr("action","${rc.contextPath}/evaluation/statistics/opt-query/statisticsEvaluation.do");
		$("#evaluationQuery").submit();
	}
	
	//弹出导出页
	function exportEvaluation(){
		if($('#pageTotalCount').val()>0){
			var pageTotalCount= $("#pageTotalCount").val();
			var exportSize= $("#exportSize").val();
			var patrn=/^[0-9]{1,20}$/; 
			if(exportSize==""){
				comp.message("请输入大于0的正整数","error");
			}else if(!patrn.exec(exportSize)){
				comp.message("请输入大于0的正整数","error");
			}else if(exportSize<1){
				comp.message("请输入大于0的正整数","error");
			}else if(exportSize>10000){
				comp.message("请输入小于等于10000的正整数","error");
			}else{
				comp.showModal("exportEvaluation","500px","-250px 0 0 -250px");
				$("#export_evaluation").load("${rc.contextPath}/evaluation/statistics/opt-query/nsm/exportEvaluationList.do?pageTotalCount="+pageTotalCount+"&exportSize="+exportSize);
			}
		}else{
			comp.message("暂无数据可导出");		
		}
	}
	
	//导出
	function exportDate(exportSize,exportPage){
		$("#evaluationQuery").attr("action","${rc.contextPath}/evaluation/statistics/opt-query/exportEvaluation.do");
		var fo=$("#evaluationQuery");
		if($("#evaluationQuery_exportPage").length==0){
			fo.append($("<input>",{
				id:'evaluationQuery_exportSize',
				type:'hidden',
				name:'evaluationQuery_exportSize',
				val:exportSize
			}));
			fo.append($("<input>",{
				id:'evaluationQuery_exportPage',
				type:'hidden',
				name:'evaluationQuery_exportPage',
				val:exportPage
			}));
		}else{
			$("#evaluationQuery_exportSize").val(exportSize);
			$("#evaluationQuery_exportPage").val(exportPage);
		}
		fo.submit();
	}
</script>
</body>
</html>