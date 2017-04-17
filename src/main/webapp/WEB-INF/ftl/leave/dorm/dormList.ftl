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
			<form id="dormlist" action="${rc.contextPath}/leave/dorm/opt-query/queryDormPage.do" method="post">
				<div class="span12">
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学院</span>
							<select id="college" name="student.college.id" aria-controls="dt_gal" class="span7" onchange="cascade.changeCollage('college','major', 'class');">
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
							<select id="major" name="student.major.id" aria-controls="dt_gal" class="span7 emptySelect" onchange="cascade.changeMajor('major','class');">
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
							<select id="class" name="student.classId.id" size="1" aria-controls="dt_gal" class="span7 emptySelect">
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
							<select size="1" id="year.id" name="year.id" aria-controls="dt_gal" class="span7 selectoption">
								<option value="" >请选择..</option>
								<#list schoolYearList as d>
									<#if leave?? && leave.year ?? && leave.year.id==d.id>
				    	            	<option  value="${d.id}" selected="selected">${d.name?html}</option>
				    	            <#else>
				    	            	<option  value="${d.id}" >${d.name?html}</option>
				    	            </#if>
								</#list>
							</select>
						</div>
					</div>
				</div>
				<div class="row-fluid">
					<div class="span4">
						<span class="formTitle">办理状态</span>
						<select name="status.id" size="1" aria-controls="dt_gal" class="span7">
							<option value="">请选择</option>
							<#if stautsDic??>
							<#list stautsDic as hs>
								<#if (leave.status)?? && leave.status.id == hs.id>
									<option value="${hs.id}" selected="selected">${hs.name}</option>
								<#else>
									<option value="${hs.id}">${hs.name}</option>
								</#if>
							</#list>
							</#if>
						</select>
					</div>
					<div class="span4" style="padding-left:35px;">
						<button class="btn btn-info" type="button" onClick="queryDorm();">查 询</button>
						<button class="btn btn-info" type="button" onclick="comp.clearForm('dormlist')">清 空</button>
					</div>
				</div>
			</form>
			<div class="row-fluid">
				<div class="span12">
					<h5 class="heading"></h5>
					<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
						<div class="row">
							<div class="span6">
								<div class="dt_actions">
									<div class="row-fluid">
										<button class="btn btn-info" type="button" onclick="brushIDCard()">刷身份证</button>
									</div>
								</div>
							</div>
						</div>
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl" >
							<thead>
								<tr>
									<th width="6%">序号</th>
									<th width="8%">姓名</th>
									<th width="10%">学号</th>
									<th width="12%">学院</th>
									<th width="15%">专业</th>
									<th width="18%">班级</th>
									<th width="15%">办理年份</th>
									<th width="12%">办理情况</th>
									<th width="6%">操作</th>
								</tr>
							</thead>
							<tbody>
								<#if page??>
									<#list page.result as p>
										<tr>
											<td class="autocut">${p_index+1}</td>
											<input type="hidden" id="${p_index+1}" name="${p_index+1}" value="${(p[0].stuNumber)!""}">
											<#--
											<td class="autocut tipTag" data="学院：${(p[0].college.name)!""}<br/>专业：${(p[0].major.majorName)!""}<br/>班级：${(p[0].classId.className)!""}<br/>">${(p[0].name)!""}</td>
											-->
											<td class="autocut">${(p[0].name)!""}</td>
											<td class="autocut">${(p[0].stuNumber)!""}</td>
											<td class="autocut">${(p[0].college.name)!""}</td>
											<td class="autocut">${(p[0].major.majorName)!""}</td>
											<td class="autocut">${(p[0].classId.className)!""}</td>
											<td class="autocut">${(p[1].year.name)!""}</td>
											<td class="autocut"><#if p[1]??>${(p[1].status.name)!""}<#else>未办理</#if></td>
											<td class="autocut">
												<#if p[1]?? && p[1].status?? && p[1].status.code=="HANDLE" && user_key.optMap['update']??>
													<a href="###" title="取消办理" onclick="cancelDorm('${p[0].id}','UNHANDLE')"><i class="icon-ban-circle"></i></a>
												<#else>
													<#if user_key.optMap['update']??>
														<a href="###" title="办理" onclick="viewStudentDormInfo('${p[0].id}')"><i class="icon-share"></i></a>
													</#if>
												</#if>
											</td>
										</tr>
									</#list>
									<input type="hidden" id="currentPageNo" name="currentPageNo" value="${page.currentPageNo}">
								</#if>
							</tbody>
						</table>
						<#assign pageTagformId="dormlist"/>
						<#include "/page.ftl">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal hide fade" id="student_view_div" style="z-index:99999">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3 id="student_title">公寓办理学生信息</h3>
	</div>
	<div class="modal-body" id="student_view_body">
		
	</div>
	<div class="modal-footer">
		<input type="hidden" id="studentId" name="studentId" value="">
		<a href="###" class="btn btn-info" onclick="operateDorm($('#studentId').val(),'HANDLE')">确 定</a>
		<a href="#" class="btn btn" data-dismiss="modal">关 闭</a>
	</div>
</div>

<#---脚本开始----->
<script>
function queryDorm(){
	$("#dormlist").submit();
}
function brushIDCard(cardID){//刷身份证
	$("#student_view_body").empty();
	comp.showModal("student_view_div","650px","-300px 0 0 -380px"); 
	$("#student_view_body").load("${rc.contextPath}/leave/dorm/nsm/queryStudentDorm.do?.temp="+Math.random(),
	{"studentId":$("#1").val()},
	//{"cardID":cardID},
	function(){
	});
}
//办理、取消办理
function operateDorm(studentId, command){
	$.post(
		"${rc.contextPath}/leave/dorm/opt-edit/operateDorm.do",
		{studentId: studentId, command:command},
		function(data){
			$("#dormlist").attr("action","${rc.contextPath}/leave/dorm/opt-query/queryDormPage.do?pageNo="+$("#currentPageNo").val());
			$("#dormlist").submit();
		},
		"text"
	);	
}

function cancelDorm(studentId, command){
	var str="确认要取消办理吗？";
	comp.confirm(str, function(result){
		if(!result){
			return; }
		operateDorm(studentId, command);
	});
}

//学生宿舍信息查看
function viewStudentDormInfo(studentId) {
	$("#studentId").val(studentId);
	$("#student_view_body").empty();
	comp.showModal("student_view_div","650px","-300px 0 0 -380px"); 
	$("#student_view_body").load("${rc.contextPath}/leave/dorm/nsm/queryStudentDorm.do?.temp="+Math.random(),
	{"studentId":studentId},
	function(){
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