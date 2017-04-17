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
    		<form  id="evaluationQuery"  action="${rc.contextPath}/evaluation/update/opt-query/queryConfirmEvaluationList.do" method="post">
				<div class="span12">			
					<div class="row-fluid">
						<div class="span4">
    				    	<span class="term">学年</span>
							<select size="1" id="year" name="yearId" aria-controls="dt_gal" class="span8 selectoption">
								<option value="" />请选择..</option>
								<#list schoolYearList as d>
									<#if evaluation?? && evaluation.yearId ?? && evaluation.yearId==d.id>
				    	            	<option  value="${d.id}" selected="selected">${d.name?html}</option>
				    	            <#else>
				    	            	<option  value="${d.id}" >${d.name?html}</option>
				    	            </#if>
								</#list>
							</select>
    				    </div>
    				    
    				    <!--div class="span4">
    				    	<span class="term">学期</span>
							<select size="1" id="term" name="termId" aria-controls="dt_gal" class="span8 selectoption">
								<option value="" />请选择..</option>
								<#list termList as d>
									<#if evaluation?? && evaluation.termId ?? && evaluation.termId==d.id>
				    	            	<option  value="${d.id}" selected="selected">${d.name?html}</option>
				    	            <#else>
				    	            	<option  value="${d.id}" >${d.name?html}</option>
				    	            </#if>
								</#list>
							</select>
    				    </div-->
		    				    
						<div class="span4">
							<span class="formTitle">&nbsp;&nbsp;&nbsp;学院</span>
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
						
						<div class="span4">
							<span class="formTitle">&nbsp;&nbsp;&nbsp;状态</span>
							<select size="1" id="status.id" name="status.id" aria-controls="dt_gal" class="span8">
								<option value="" >请选择..</option>
								<#if statusList ?? >
									<#list statusList as c>
										<#if evaluation?? && evaluation.status ?? && evaluation.status.id == c.id >
											<option value="${c.id}" selected >${c.name}</option>
										<#else>
											<option value="${c.id}">${c.name}</option>
										</#if>
									</#list>
								</#if>
							</select>
						</div>
						
						<div class="span4">
							<span class="formTitle">姓名</span>
							<input id="student.name" name="student.name" class="span8"  value="<#if evaluation.student??>${evaluation.student.name!""}</#if>" />
						</div>
						
					</div>
					
					<div class="row-fluid">
						<div class="span12">
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
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl" >
							<thead>
								<tr>
									<th width="6%">序号</th>
									<th width="8%">姓名</th>
									<th width="10%">学号</th>
									<th width="10%">学年</th>
									<th width="10%">学期</th>
									<th width="10%">测评月份</th>
									<#--
									<th width="8%">学院</th>
									<th width="8%">专业</th>
									<th width="8%">班级</th>-->
									<th width="8%">测评员</th>
									<th width="20%">测评确认起止时间</th>
									<th width="8%">状态</th>
									<th width="8%">操作</th>
								</tr>
							</thead>
							<tbody>
								<#if page??>	
									<#list page.result as p>
										<tr>
											<td>${p_index+1}</td>
											<td class="autocut tipTag" data="学院：${(p.student.college.name)!""}<br/>专业：${(p.student.major.majorName)!""}<br/>班级：${(p.student.classId.className)!""}">${(p.student.name)!""}</td>
											<td class="autocut">${(p.student.stuNumber)!""}</td>
											<td class="autocut">${(p.year.name)!""}</td>
											<td class="autocut">${(p.term.name)!""}</td>
											<td class="autocut">${(p.month.name)!""}</td>
											<#--
											<td class="autocut">${(p.student.college.name)!""}</td>
											<td class="autocut">${(p.student.major.majorName)!""}</td>
											<td class="autocut">${(p.student.classId.className)!""}</td>--->
											<td class="autocut">${(p.assist.name)!""}</td>
											<td class="autocut">${(p.evaluationTime.updateStartTime?string('yyyy-MM-dd'))!""}至${(p.evaluationTime.updateEndTime?string('yyyy-MM-dd'))!""}</td>
											<td class="autocut">${(p.status.name)!""}</td>
											<td>
												<#if p.status.code=='TO_CONFIRMED' || p.status.code=='CONFIRMED'>
													<a href="###" class="sepV_a" title="查看" onclick="viewEvaluationDetailList('${(p.id)!""}')"><i class="icon-list-alt"></i></a>
												</#if>
												<#if user_key.optMap['update']?? >
											   		<a href="${rc.contextPath}/evaluation/confirm/opt-update/editEvaluationInfo.do?id=${p.id}" class="sepV_a" title="修改评分"><i class="icon-edit"></i></a>
												</#if>
											</td>
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
<#-- 脚本开始 -->
<script>
	 
    <!--显示提示框-->
	$(function(){
		$('.tipTag').poshytip({
			className: 'tip-yellowsimple',
			alignTo: 'target',
			alignX: 'right',
			alignY: 'center',
			offsetX: -10
		});
	});
	
	function query(){//查询
		$("#evaluationQuery").submit();
	}
	
	function viewEvaluationDetailList(id){//查看明细
		window.open("${rc.contextPath}/evaluation/score/opt-query/queryEvaluationDetail.do?id="+id);
	}
</script>
</body>
</html>