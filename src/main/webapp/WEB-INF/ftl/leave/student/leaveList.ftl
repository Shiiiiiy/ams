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
			<form id="collegeList" action="${rc.contextPath}/leave/leave/opt-view/queryLeavePage.do" method="post">
				<div class="span12">
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学院</span>
							<select id="college" name="student.college.id" aria-controls="dt_gal" class="span7" onchange="cascade.changeCollage('college','major', 'classId');">
								<option value="">请选择</option>
								<#if collegeList??>
								<#list collegeList as college>
									<#if (leave.student)?? && (leave.student.college)?? && leave.student.college.id == college.id>
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
							<select id="major" name="student.major.id" aria-controls="dt_gal" class="span7 emptySelect" onchange="cascade.changeMajor('major','classId');">
								<option value="">请选择</option>
								<#if majorList??>
								<#list majorList as major>
									<#if (leave.student)?? && (leave.student.major)?? && leave.student.major.id == major.id>
										<option value="${major.id}" selected="selected">${major.majorName}</option>
									<#else>
										<option value="${major.id}">${major.majorName}</option>
									</#if>
								</#list>
								</#if>
							</select>
						</div>
						<div class="span4">
							<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;班级</span>
							<select id="classId" name="student.classId.id" size="1" aria-controls="dt_gal" class="span7 emptySelect">
								<option value="">请选择</option>
								<#if classList??>
								<#list classList as class>
									<#if (leave.student)?? && (leave.student.classId)?? && leave.student.classId.id == class.id>
										<option value="${class.id}" selected="selected">${class.className}</option>
									<#else>
										<option value="${class.id}">${class.className}</option>
									</#if>
								</#list>
								</#if>
							</select>
						</div>
					</div>
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;姓名</span>
							<input class="span7" name="student.name" value="${(leave.student.name)!""}"/>
						</div>
						<div class="span4">
							<span class="formTitle">学号</span>
							<input class="span7" name="student.stuNumber" value="${(leave.student.stuNumber)!""}"/>
						</div>
						<div class="span4">
							<span class="formTitle">办理年份</span>
							<select size="1" id="yearId" name="yearId" aria-controls="dt_gal" class="span7 selectoption">
								<option value="" >请选择..</option>
								<#list schoolYearList as d>
									<#if leave?? && leave.yearId ?? && leave.yearId==d.id>
				    	            	<option  value="${d.id}" selected="selected">${d.name?html}</option>
				    	            <#else>
				    	            	<option  value="${d.id}" >${d.name?html}</option>
				    	            </#if>
								</#list>
							</select>
						</div>
					</div>
					<div class="btnCenter">
						<button class="btn btn-info" type="button" onClick="queryLeave();">查 询</button>
						<button class="btn btn-info" type="button" onclick="comp.clearForm('collegeList')">清 空</button>
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
									<th width="7%">序号</th>
									<th width="9%">姓名</th>
									<th width="9%">学号</th>
									<th width="9%">办理年份</th>
									<th width="10%">图书信息中心</th>
									<th width="10%">公寓管理中心</th>
									<th width="9%">学费</th>
									<th width="10%">校园一卡通</th>
									<th width="9%">水电费</th>
									<th width="9%">党团关系</th>
									<th width="9%">二级学院</th>
								</tr>
							</thead>
							<tbody>
								<#if page??>
									<#list page.result as p>
										<tr>
											<td class="autocut">${p_index+1}</td>
											<td class="autocut tipTag" data="学院：${(p.student.college.name)!""}<br/>专业：${(p.student.major.majorName)!""}<br/>班级：${(p.student.classId.className)!""}<br/>">${(p.student.name)!""}</td>
											<td class="autocut">${(p.student.stuNumber)!""}</td>
											<td class="autocut">${(p.college.handleYear.name)!""}</td>
											<td class="autocut"></td>
											<td class="autocut">${(p.dorm.status.name)!"未办理"}</td>
											<td class="autocut"></td>
											<td class="autocut"></td>
											<td class="autocut">${(p.life.status.name)!"正常"}</td>
											<td class="autocut">${(p.caucus.handleStatus.name)!"无"}</td>
											<td class="autocut">${(p.college.handleStatus.name)!"未办理"}</td>
										</tr>
									</#list>
									<input type="hidden" id="currentPageNo" name="currentPageNo" value="${page.currentPageNo}">
								</#if>
							</tbody>
						</table>
						<#assign pageTagformId="collegeList"/>
						<#include "/page.ftl">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<#---脚本开始----->
<script>
function queryLeave(){
	$("#collegeList").submit();
}
</script>
</body>
</html>