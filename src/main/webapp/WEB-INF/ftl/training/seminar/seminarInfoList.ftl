<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="${rc.contextPath}/css/bdp_comp.css" type="text/css" />
</head>
<body>
<div id="contentwrapper">
	<div class="main_content">
		<div class="row-fluid">
			<form id="semInfoList" action="" method="post">
				<input id="params" name="params" value="" type="hidden"/>
				<div class="span12">
					<div class="row">
						<div class="span4">
							<span class="formTitle">讲座名称</span>
				   			<input class="span6" id="seminarName" name="seminarName" value="${((po.seminarName)!"")?html}" />
						</div>
						<div class="span4">
							<span class="formTitle">主讲人</span>
							<input class="span6" id="outerUserId.userName" name="outerUserId.userName" value="${((po.outerUserId.userName)!"")?html}" />
						</div>
						<div class="span4">
							<span class="formTitle">讲座状态</span>
							<select class="span6" id="seminarStatus.id" name="seminarStatus.id" aria-controls="dt_gal" >
								<option value="">请选择</option>
								<#if seminarStatus??>
									<#list seminarStatus as ss>
										<#if po?? && po.seminarStatus?? && po.seminarStatus.id == ss.id>
											<option value="${ss.id}" selected="selected">${ss.name}</option>
										<#else>
											<option value="${ss.id}">${ss.name}</option>
										</#if>
									</#list>
								</#if>
							</select>
						</div>
					</div>
				</div>
				<div class="span12">
					<div class="row">
						<div class="btnCenter">
							<button class="btn btn-info" type="button" onClick="querySeminarInfo();">查 询</button>
							<button class="btn btn-info" type="button" onclick="comp.clearForm('semInfoList')">清 空</button>
						</div>
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
									<div class="btn-group">
										<#if user_key.optMap?? && user_key.optMap['add']??>
											<button class="btn btn-info" type="button" onclick="addSeminarInfo()">新 增</button>
										</#if>
									</div>
								</div>
							</div>
						</div>
					<table class="table table-bordered table-striped tablecut" id="smpl_tbl" >
						<thead>
							<tr>
								<th width="5%">序号</th>
								<th width="25%">讲座名称</th>
								<th width="15%">主讲人</th>
								<th width="15%">讲座时间</th>
								<th width="15%">讲座地点</th>
								<th width="15%">讲座状态</th>
								<th width="10%">操作</th>
							</tr>
						</thead>
						<tbody>
							<#if page??>
								<#list page.result as p>
									<tr>
										<td class="autocut">${p_index+1}</td>
										<td class="autocut"><#if p.seminarName??>${p.seminarName!""}</#if></td>
										<td class="autocut">
											<span>
												<#if p.outerUserId??><a href="#" onClick="viewTeacherInfo('${(p.outerUserId.id)!""}', '${(p.outerUserId.userName)!""}');">${(p.outerUserId.userName)!""}</a></#if>
											</span>
										</td>
										<td class="autocut">${((p.seminarDate?string("yyyy-MM-dd"))!"")?html} ${(p.beginDate)!""}至${(p.endDate)!""}</td>
										<td class="autocut">${(p.appointPlace)!""}</td>
										<td class="autocut"><#if p.seminarStatus?? && p.seminarStatus.name??>${p.seminarStatus.name!""}</#if></td>
										<td class="autocut">
										<a href="${rc.contextPath}/training/seminar/opt-view/seminarInfo.do?id=${p.id}" class="sepV_a" title="查看" target="_blank"><i class="icon-list-alt"></i></a>
											<#if p.seminarStatus?? && p.seminarStatus.name="已保存">
												<#if user_key.optMap??>
													<#if user_key.optMap['update']??>
														<a href="${rc.contextPath}/training/seminar/opt-update/seminarInfo.do?id=${p.id}" class="sepV_a" title="修改"><i class="icon-edit"></i></a>
													</#if>
													<#if user_key.optMap['del']??>
													<a href="#" onclick="delSeminarInfo('${p.id}')" title="删除"><i class="icon-trash"></i></a>
													</#if>
												</#if>
											</#if>
											<#if p.seminarStatus?? && p.seminarStatus.name="已提交">
												<a href="${rc.contextPath}/training/seminar/opt-pub/pubSeminarInfoEdit.do?id=${p.id}" title="发布"><i class="icon-eye-open"></i></a>
											</#if>
										</td>
									</tr>
								</#list>
							</#if>
						</tbody>
					</table>
					 <#assign pageTagformId="semInfoList"/>
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
function querySeminarInfo() {
	$("#semInfoList").attr("action", "${rc.contextPath}/training/seminar/opt-query/querySeminarInfoPage.do");
	$("#semInfoList").attr("method", "post");
	$("#semInfoList").submit();
}

//新增讲座信息
function addSeminarInfo() {
	window.location.href="${rc.contextPath}/training/seminar/opt-add/seminarInfo.do";
}

//业务删除
function delSeminarInfo(id){
	comp.confirm("确认要删除吗？", function(result){
		if(!result){
			return; }
			$.post(
				"${rc.contextPath}/training/seminar/opt-del/delSeminarInfo.do",
				{id:id},
				function(data){
					window.location.href="${rc.contextPath}/training/seminar/opt-query/querySeminarInfoPage.do";
				},
				"text"
			);
	});
}
</script>
</body>
</html>