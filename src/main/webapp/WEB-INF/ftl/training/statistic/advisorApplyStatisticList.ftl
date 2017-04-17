<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="${rc.contextPath}/css/bdp_comp.css" type="text/css" />
	<link rel="stylesheet" href="${rc.contextPath}/lib/My97DatePicker/skin/WdatePicker.css" />
	<script type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
<div id="contentwrapper">
	<div class="main_content">
		<div class="row-fluid">
			<form id="advisorApplyStatisticList" action="" method="post">
				<div class="span12">
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学年</span>
							<select size="1" id="schoolYear" name="schoolYear.id" aria-controls="dt_gal" class="span6 selectoption" >
								<option value="" />请选择..</option>
								<#list schoolYearList as d>
									<#if po?? && po.schoolYear?? && po.schoolYear.id==d.id>
				    	            	<option  value="${d.id}" selected="selected">${d.name?html}</option>
				    	            <#else>
				    	            	<option  value="${d.id}" >${d.name?html}</option>
				    	            </#if>
								</#list>
							</select>
						</div>
						
						<div class="span4">
							<span class="formTitle">姓名</span>
							<input class="span6" name="outerUserInfo.userName" value="<#if po?? && po.outerUserInfo?? && po.outerUserInfo.userName??>${po.outerUserInfo.userName!""}</#if>"/>
						</div>
						
						<div class="span4">
							<span class="formTitle">性别</span>
							<select size="1" id="gender" name="outerUserInfo.gender.id" aria-controls="dt_gal" class="span6 selectoption" >
								<option value="" />请选择..</option>
								<#list gender as g>
									<#if po?? && po.outerUserInfo?? && po.outerUserInfo.gender?? && po.outerUserInfo.gender.id==g.id>
				    	            	<option  value="${g.id}" selected="selected">${g.name!""}</option>
				    	            <#else>
				    	            	<option  value="${g.id}" >${g.name!""}</option>
				    	            </#if>
								</#list>
							</select>
						</div>
					</div>
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">值班日期</span>
							<input class="span6 Wdate" name="dutyDate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',skin:'whyGreen'});" value="${dutyDate!""}"/>
						</div>
						<div class="span4">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="btn btn-info" type="button" onClick="queryAdvisorApplyStatisticPage();">查 询</button>
							<button class="btn btn-info" type="button" onclick="comp.clearForm('advisorApplyStatisticList')">清 空</button>
						</div>
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
								<th width="5%">序号</th>
								<th width="20%">学年</th>
								<th width="20%">姓名</th>
								<th width="20%">性别</th>
								<th width="20%">值班日期</th>
								<th width="15%">预约人数</th>
							</tr>
						</thead>
						<tbody>
							<#if page??>
								<#list page.result as p>
									<tr>
										<td class="autocut">${p_index+1}</td>
										<td class="autocut">${p.schoolYear.name!""}</td>
										<td class="autocut">
											<span>
												<#if p.outerUserInfo??><a href="#" onClick="viewTeacherInfo('${(p.outerUserInfo.id)!""}', '${(p.outerUserInfo.userType.name)!""}');">${(p.outerUserInfo.userName)!""}</a></#if>
											</span>
										</td>
										<td class="autocut">${p.outerUserInfo.gender.name!""}</td>
										<td class="autocut">${((p.advisorDate)?string("yyyy-MM-dd"))!""}</td>
										<td class="autocut">
											<#if p.advisorStuNum?? && p.advisorStuNum != 0>
												<a href="${rc.contextPath}/training/apply/opt-view/viewStudentInfo.do?advisorId=${(p.id)!""}" title="查看签到学生详情">${p.advisorStuNum!""}</a>
											<#else>
												0
											</#if>
										</td>
									</tr>
								</#list>
							</#if>
						</tbody>
					</table>
					 <#assign pageTagformId="advisorApplyStatisticList"/>
					 <#include "/page.ftl">
				</div>
			</div>
		</div>
	</div>
</div>

<#--讲师信息查看开始-->
<div class="modal hide fade" id="teacher_view_div" style="z-index:99999">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3 id="teacher_title">讲师信息查看</h3>
	</div>
	<div class="modal-body" id="teacher_view_body">
		
	</div>
	<div class="modal-footer">
		<a href="#" class="btn btn" data-dismiss="modal">关 闭</a>
	</div>
</div>
<#--讲师信息查看结束-->

<script>
//讲师信息查看
function viewTeacherInfo(id,name) {
	$("#teacher_view_body").empty();
	$("#teacher_title").html(name+'信息');
	comp.showModal("teacher_view_div","750px","-300px 0 0 -380px"); 
	$("#teacher_view_body").load("${rc.contextPath}/training/seminar/nsm/viewTeacherInfo.do?.temp="+Math.random(),
	{"id":id},
	function(){
	});
}

//统计查询
function queryAdvisorApplyStatisticPage() {
	var advisorDate = $('#advisorDate').val();
	if(advisorDate == "") {
		$('#advisorDate').removeAttr("name");
	}
	$("#advisorApplyStatisticList").attr("action", "${rc.contextPath}/training/advisorApplyStatistic/opt-query/queryAdvisorApplyStatisticPage.do");
	$("#advisorApplyStatisticList").attr("method", "post");
	$("#advisorApplyStatisticList").submit();
}
</script>
</body>
</html>