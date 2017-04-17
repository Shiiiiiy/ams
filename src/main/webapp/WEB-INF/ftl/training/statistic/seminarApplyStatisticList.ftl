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
			<form id="seminarApplyStatisticList" action="" method="post">
				<div class="span12">
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">讲座名称</span>
							<input class="span6" name="seminarName" value="${(po.seminarName)!""}"/>
						</div>
						
						<div class="span4">
							<span class="formTitle">主讲人</span>
							<input class="span6" name="outerUserId.userName" value="${(po.outerUserId.userName)!""}"/>
						</div>
						
						<div class="span4">
							<span class="formTitle">讲座日期</span>
							<input class="span6 Wdate" name="seminarDateStr" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',skin:'whyGreen'});" value="${seminarDateStr!""}"/>
						</div>
					</div>
					<div class="row-fluid">
						
						<div class="span4">
							<span class="formTitle">讲座地点</span>
							<input class="span6" name="appointPlace" value="${(po.appointPlace)!""}"/>
						</div>
						
						<div class="span4">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="btn btn-info" type="button" onClick="querySeminarApplyStatisticPage();">查 询</button>
							<button class="btn btn-info" type="button" onclick="comp.clearForm('seminarApplyStatisticList')">清 空</button>
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
								<th width="20%">讲座名称</th>
								<th width="10%">主讲人</th>
								<th width="15%">讲座日期</th>
								<th width="15%">讲座地点</th>
								<th width="15%">预计人数</th>
								<th width="15%">报名人数</th>
							</tr>
						</thead>
						<tbody>
							<#if page??>
								<#list page.result as p>
									<tr>
										<td class="autocut">${p_index+1}</td>
										<td class="autocut">${p.seminarName!""}</td>
										<td class="autocut">
											<span>
												<#if p.outerUserId??><a href="#" onClick="viewTeacherInfo('${(p.outerUserId.id)!""}', '${(p.outerUserId.userType.name)!""}');">${(p.outerUserId.userName)!""}</a></#if>
											</span>
										</td>
										<td class="autocut">${((p.seminarDate)?string("yyyy-MM-dd"))!""}</td>
										<td class="autocut">${p.appointPlace!""}</td>
										<td class="autocut">${p.attendNum!""}</td>
										<td class="autocut">
											<#if p.totalNum!=0>
												<a href="${rc.contextPath}/training/apply/opt-view/viewStudentInfo.do?seminarId=${p.seminarId!""}" title="查看报名学生详情">${p.totalNum!""}</a>
											<#else>
												0
											</#if>
										</td>
									</tr>
								</#list>
							</#if>
						</tbody>
					</table>
					 <#assign pageTagformId="seminarApplyStatisticList"/>
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
function querySeminarApplyStatisticPage() {
	$("#seminarApplyStatisticList").attr("action", "${rc.contextPath}/training/applyStatistic/opt-query/querySeminarApplyStatisticPage.do");
	$("#seminarApplyStatisticList").attr("method", "post");
	$("#seminarApplyStatisticList").submit();
}
</script>
</body>
</html>