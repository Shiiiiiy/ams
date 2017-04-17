<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="${rc.contextPath}/lib/My97DatePicker/skin/WdatePicker.css" />
	<script type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
	<link rel="stylesheet" href="${rc.contextPath}/css/bdp_comp.css" type="text/css" />
</head>
<body>
<div id="contentwrapper">
	<div class="main_content">
		<div class="row-fluid">
			<form id="seminarApplyInfoList" action="" method="post">
				<input id="params" name="params" value="" type="hidden"/>
				<div class="span12">
					<div class="row">
						<div class="span4">
							<span class="formTitle">讲座名称</span>
				   			<input class="span6" id="seminarId.seminarName" name="seminarId.seminarName" value="${((po.seminarId.seminarName)!"")?html}" />
						</div>
						<div class="span4">
							<span class="formTitle">主讲人</span>
							<input class="span6" name="seminarId.outerUserId.userName" value="${((po.seminarId.outerUserId.userName)!"")?html}" />
						</div>
						<div class="span4">
							<span class="formTitle">报名状态</span>
							<select class="span6" id="applyStatus.id" name="applyStatus.id" aria-controls="dt_gal" >
								<option value="">请选择</option>
								<#if applyStatus??>
									<#list applyStatus as ss>
										<#if po?? && po.applyStatus?? && po.applyStatus.id == ss.id>
											<option value="${ss.id}" selected="selected">${ss.name}</option>
										<#else>
											<option value="${ss.id}">${ss.name}</option>
										</#if>
									</#list>
								</#if>
							</select>
						</div>
					</div>
					<div class="btnCenter">
						<button class="btn btn-info" type="button" onClick="querySeminarApplyInfo();">查 询</button>
						<button class="btn btn-info" type="button" onclick="comp.clearForm('seminarApplyInfoList')">清 空</button>
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
								<th width="15%">讲座名称</th>
								<th width="25%">讲座地点</th>
								<th width="15%">讲座时间</th>
								<th width="15%">主讲人</th>
								<th width="15%">预约状态</th>
								<th width="10%">操作</th>
							</tr>
						</thead>
						<tbody>
							<#if page??>
								<#list page.result as p>
									<tr>
										<td class="autocut">${p_index+1}</td>
										<td class="autocut"><#if p[0]??>${p[0]!""}</#if></td>
										<td class="autocut"><#if p[1]??>${p[1]!""}</#if></td>
										<td class="autocut">${(p[7])!""}</td>
										<td class="autocut">
											<span>
												<#if p[2]?? && p[3]??><a href="#" onClick="viewTeacherInfo('${p[2]!""}', '${p[3]!""}');">${p[3]!""}</a></#if>
											</span>
										</td>
										<td class="autocut"><#if p[4]??>已报名<#else>未报名</#if></td>
										<td class="autocut">
											<a href="#" onclick="viewApplyInfo('${p[5]}', '${p[6]}')" title="查看"><i class="icon-list-alt"></i></a>
										<#if !p[4]?? && flag?? && flag==true && user_key.optMap['apply']??>
											<a href="#" onclick="confirm('${p[5]}')" title="报名"><i class="icon-eye-open"></i></a>
										</#if>
										</td>
									</tr>
								</#list>
							</#if>
						</tbody>
					</table>
					 <#assign pageTagformId="seminarApplyInfoList"/>
					 <#include "/page.ftl">
				</div>
			</div>
		</div>
	</div>
</div>

<#--学生报名信息查看开始-->
<div class="modal hide fade" id="stuApply_view_div" style="z-index:99999">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3>报名信息</h3>
	</div>
	<div class="modal-body" id="stuApply_view_body">
		
	</div>
	<div class="modal-footer">
		<a href="#" class="btn btn" data-dismiss="modal">关 闭</a>
	</div>
</div>
<#--学生报名信息查看结束-->

<#--学生报名弹出框开始-->
<div class="modal hide fade" id="applyInfoBox">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3 id="title">讲座报名</h3>
	</div>
	<div class="modal-body" id="seminarApplyInfo_edit_body">

	</div>
	<div class="modal-footer">
		<a href="#" class="btn btn-info" onclick="confirm()">确 定</a> 
		<a href="#" class="btn btn" data-dismiss="modal">取 消</a>
	</div>
</div>
<#--学生报名弹出框结束-->

<#--讲师信息查看开始-->
<div class="modal hide fade" id="teacher_view_div" style="z-index:99999">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3 id="teacher_title">讲师信息</h3>
	</div>
	<div class="modal-body" id="teacher_view_body">
		
	</div>
	<div class="modal-footer">
		<a href="#" class="btn btn" data-dismiss="modal">关 闭</a>
	</div>
</div>
<#--讲师信息查看结束-->

<#---脚本开始----->
<script>
//讲师信息查看
function viewTeacherInfo(id,name) {
	$("#teacher_view_body").empty();
	comp.showModal("teacher_view_div","750px","-300px 0 0 -380px"); 
	$("#teacher_view_body").load("${rc.contextPath}/training/seminar/nsm/viewTeacherInfo.do?.temp="+Math.random(),
	{"id":id},
	function(){
	});
}
//业务查询
function querySeminarApplyInfo() {
	$("#seminarApplyInfoList").attr("action", "${rc.contextPath}/training/apply/opt-query/querySeminarApplyPage.do");
	$("#seminarApplyInfoList").attr("method", "post");
	$("#seminarApplyInfoList").submit();
}
//学生报名
function apply(id) {
	$('#params').val(id);
	comp.showModal("applyInfoBox", "800px", "-180px 0 0 -380px");
	$("#seminarApplyInfo_edit_body").load(
		"${rc.contextPath}/training/apply/nsm/seminarApplyInfoEdit.do?.temp="+Math.random(),
		{"seminarId":id, "flag":"apply"},
		function() {}
	);
}

function confirm(seminarId) {
	comp.confirm("确认要报名吗？", function(result) {
		if(!result) {
			return;
		}
//		var seminarId = $('#params').val();
		$.post(
			"${rc.contextPath}/training/apply/opt-apply/seminarApplyInfo.do",
			{seminarId:seminarId},
			function(data) {
				window.location.href="${rc.contextPath}/training/apply/opt-query/querySeminarApplyPage.do";
			},
			"text"
		);
	});
}


//查看学生预约信息
function viewApplyInfo(id, studentId) {
	$("#stuApply_view_body").empty();
	comp.showModal("stuApply_view_div", "800px", "-180px 0 0 -380px");
	$("#stuApply_view_body").load(
		"${rc.contextPath}/training/apply/nsm/viewSeminarApplyInfo.do?.temp="+Math.random(),
		{"seminarId":id, "studentId":studentId},
		function(){}
	);
}

</script>
</body>
</html>