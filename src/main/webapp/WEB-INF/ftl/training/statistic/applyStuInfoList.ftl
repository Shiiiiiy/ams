<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="${rc.contextPath}/css/bdp_comp.css" type="text/css" />
	<script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
</head>
<body>
<div id="contentwrapper">
	<div class="main_content">
		<div class="row-fluid">
			<div class="span12">
				<#if classInfo??>
					<#if flag=='complete'>
						<h3 class="heading">${classInfo.growthClassName!""}的结业学生明细</h3>
					<#else>
						<h3 class="heading">${classInfo.growthClassName!""}的未结业学生明细</h3>
					</#if>
				</#if>
				<#if seminarManage??>
					<h3 class="heading">${(seminarManage.seminarDate?string("yyyy-MM-dd"))!""}&nbsp;${seminarManage.seminarName!""}的报名学生明细</h3>
				</#if>
				<#if ai??>
					<h3 class="heading">${(advisorInfo.advisorDate?string("yyyy-MM-dd"))!""}&nbsp;${advisorInfo.outerUserInfo.userName!""}老师签到的学生明细</h3>
				</#if>
				
			</div>
			<form id="_apply_student"  action="${rc.contextPath}/training/seminarApply/opt-view/viewStudentInfo.do" method="post">
			<input name="id" value="<#if po?? && po.id??>${po.id!""}</#if>" type="hidden"/>
			<#if seminarId??>
				<input name="seminarId" value="${seminarId!""}" type="hidden"/>
			</#if>
			<#if growthId??>
				<input name="growthId" value="${growthId!""}" type="hidden"/>
			</#if>
			<#if flag??>
				<input name="flag" value="${flag!""}" type="hidden"/>
			</#if>
			<#if advisorId??>
				<input name="advisorId" value="${advisorId!""}" type="hidden"/>
			</#if>
			<div class="span12">
				<div class="row-fluid">
					<div class="span4">
						<span class="formTitle">学院</span>
						<select id="college" name="college.id" aria-controls="dt_gal" class="span6" onchange="cascade.changeCollage('college','major', 'klass');">
							<option value="">请选择</option>
							<#if collegeList??>
							<#list collegeList as college>
								<#if (po.college)?? && po.college.id == college.id>
									<option value="${college.id}" selected="selected">${college.name}</option>
								<#else>
									<option value="${college.id}">${college.name}</option>
								</#if>
							</#list>
							</#if>
						</select>
					</div>
				
					<div class="span4">
						<span class="formTitle">专业</span>
						<select id="major" name="major.id" aria-controls="dt_gal" class="span6 emptySelect" onchange="cascade.changeMajor('major','klass');">
							<option value="">请选择</option>
							<#if majorList??>
							<#list majorList as major>
								<#if po.major?? && po.major.id == major.id>
									<option value="${major.id}" selected="selected">${major.majorName}</option>
								<#else>
									<option value="${major.id}">${major.majorName}</option>
								</#if>
							</#list>
							</#if>
						</select>
					</div>
				
					<div class="span4">
						<span class="formTitle">班级</span>
						<select id="klass" name="klass.id" size="1" aria-controls="dt_gal" class="span6 emptySelect">
							<option value="">请选择</option>
							<#if klassList??>
							<#list klassList as klass>
								<#if po.klass?? && po.klass.id == klass.id>
									<option value="${klass.id}" selected="selected">${klass.className}</option>
								<#else>
									<option value="${klass.id}">${klass.className}</option>
								</#if>
							</#list>
							</#if>
						</select>
					</div>
				</div>
				<div class="btnCenter">	
					<input type="button" class="btn btn-info" onclick="_queryApplyStudent()" value="查 询"/>
					<input type="button" class="btn btn-info" onclick="comp.clearForm('_apply_student')" value="清 空"/>	
				</div>
			</div>
			</form>
			<div class="row-fluid">
				<div class="span12">
					<h5 class="heading"></h5>
					<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
							<thead>
								<tr>
									<th width="10%">序号</th>
									<th width="15%">姓名</th>
									<th width="15%">学号</th>
									<th width="15%">性别</th>
									<th width="15%">手机</th>
									<th width="15%">邮箱</th>
									<th width="15%">QQ</th>
								</tr>
							</thead>
							<tbody>
								<#if page??>
									<#list page.result as p>
										<tr>
											<td class="autocut">${p_index+1}</td>
											<td class="autocut tipTag" data="学院：${(p.studentId.college.name)!''}<br/>专业：${(p.studentId.major.majorName)!''}<br/>班级：${(p.studentId.classId.className)!''}<br/>"> ${p.studentId.name!""}</td>
											<td class="autocut">${p.studentId.stuNumber!""}</td>
											<td class="autocut">${p.studentId.genderDic.name!""}</td>
											<td class="autocut">${p.studentId.phone1!""}</td>
											<td class="autocut">${p.studentId.email!""}</td>
											<td class="autocut">${p.studentId.qq!""}</td>
										</tr>
									</#list>
								</#if>
							</tbody>
						</table>
						<#assign pageTagformId="_apply_student"/>
						<#include "/page.ftl">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
function _queryApplyStudent() {
	$("#_apply_student").attr("action", "${rc.contextPath}/training/apply/opt-view/viewStudentInfo.do");
	$("#_apply_student").attr("method", "post");
	$("#_apply_student").submit();
}
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