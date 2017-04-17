<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
<div id="contentwrapper">
	<div class="main_content">
		<div class="row-fluid">
			<form id="outerUserInfoForm" action="${rc.contextPath}/training/maintain/opt-query/outerUserInfo.do" method="post">
				<div class="span12">
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;姓名</span>
							<input class="span6" id="userName" name="userName" value="${(po.userName)!""}"/>
						</div>
						<#---
						<div class="span4">
							<span class="formTitle">编号</span>
							<input class="span7" id="userCode" name="userCode" value="<#if po?? && po.userCode??>${po.userCode!""}</#if>" />
						</div>
						---->
						<div class="span4">
							<span class="formTitle">性别</span>
							<select class="span6" id="gender.id" name="gender.id" aria-controls="dt_gal" >
								<option value="">请选择</option>
								<#if gender??>
								<#list gender as gender>
									<#if po?? && (po.gender)?? && po.gender.id == gender.id>
										<option value="${gender.id}" selected="selected">${gender.name}</option>
									<#else>
										<option value="${gender.id}">${gender.name}</option>
									</#if>
								</#list>
								</#if>
							</select>
						</div>
						<div class="span4">
							<span class="formTitle">类型</span>
							<select class="span6" id="userType.id" name="userType.id" aria-controls="dt_gal" >
								<option value="">请选择</option>
								<#if userType??>
								<#list userType as userType>
									<#if po?? && (po.userType)?? && po.userType.id == userType.id>
										<option value="${userType.id}" selected="selected">${userType.name}</option>
									<#else>
										<option value="${userType.id}">${userType.name}</option>
									</#if>
								</#list>
								</#if>
							</select>
						</div>
					</div>
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">启用状态</span>
							<select class="span6" id="userStatus.id" name="userStatus.id" aria-controls="dt_gal" >
								<option value="">请选择</option>
								<#if userStatus??>
								<#list userStatus as userStatus>
									<#if po?? && (po.userStatus)?? && po.userStatus.id == userStatus.id>
										<option value="${userStatus.id}" selected="selected">${userStatus.name}</option>
									<#else>
										<option value="${userStatus.id}">${userStatus.name}</option>
									</#if>
								</#list>
								</#if>
							</select>
						</div>
						<div class="span4">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="btn btn-info" type="button" onClick="queryOuterUserInfo();">查 询</button>
							<button class="btn btn-info" type="button" onclick="comp.clearForm('outerUserInfoForm')">清 空</button>
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
											<button class="btn btn-info" type="button" onclick="addOuterUserInfo()">新 增</button>
										</#if>
									</div>
								</div>
							</div>
						</div>
					<table class="table table-bordered table-striped tablecut" id="smpl_tbl" >
						<thead>
							<tr>
								<th width="5%">序号</th>
								<th width="10%">姓名</th>
								<th width="10%">编号</th>
								<th width="5%">性别</th>
								<th width="8%">类型</th>
								<th width="12%">联系方式</th>
								<th width="10%">职务</th>
								<th width="20%">单位</th>
								<th width="10%">启用状态</th>
								<th width="10%">操作</th>
							</tr>
						</thead>
						<tbody>
							<#if page??>
								<#list page.result as p>
									<tr>
										<td class="autocut">${p_index+1}</td>
										<td class="autocut">${(p.userName)!""}</td>
										<td class="autocut">${(p.userCode)!""}</td>
										<td class="autocut">${(p.gender.name)!""}</td>
										<td class="autocut">${(p.userType.name)!""}</td>
										<td class="autocut">${(p.phoneNum)!""}</td>
										<td class="autocut">${(p.duty)!""}</td>
										<td class="autocut">${(p.unit)!""}</td>
										<td class="autocut">${(p.userStatus.name)!""}</td>
										<td class="autocut">
											<a href="#" onclick="viewTeacherInfo('${(p.id)!""}','${(p.userType.name)!""}')" class="sepV_a" title="查看"><i class="icon-list-alt"></i></a>
											<#if (p.userStatus.name)?? && p.userStatus.name == '禁用'>
												<a href="#" onclick="disable('${p.id}', '0')" title="启用"><i class="icon-green"></i></a>
												<#if user_key.optMap??>
													<#if user_key.optMap['update']??>
														<a href="${rc.contextPath}/training/maintain/opt-update/outerUserInfo.do?id=${p.id}" class="sepV_a" title="修改"><i class="icon-edit"></i></a>
													</#if>
													<#if user_key.optMap['del']??>
													<a href="#" onclick="delInfo('${(p.id)!""}', '${(p.userType.code)!""}')" title="删除"><i class="icon-trash"></i></a>
													</#if>
												</#if>
											<#else>
												<a href="#" onclick="disable('${p.id}', '1')" title="禁用"><i class="icon-red"></i></a>
											</#if>
										</td>
									</tr>
								</#list>
							</#if>
						</tbody>
					</table>
					 <#assign pageTagformId="outerUserInfoForm"/>
					 <#include "/page.ftl">
				</div>
			</div>
		</div>
	</div>
</div>
<#--导师讲师信息查看开始-->
<div class="modal hide fade" id="teacher_view_div" style="z-index:99999">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3 id="teacher_title"></h3>
	</div>
	<div class="modal-body" id="teacher_view_body">
		
	</div>
	<div class="modal-footer">
		<a href="#" class="btn btn" data-dismiss="modal">关 闭</a>
	</div>
</div>
<#--导师讲师信息查看结束-->



<#---脚本开始----->
<script>
//页面查询
function queryOuterUserInfo() {
	$("#outerUserInfoForm").attr("action", "${rc.contextPath}/training/maintain/opt-query/outerUserInfo.do");
	$("#outerUserInfoForm").attr("method", "post");
	$("#outerUserInfoForm").submit();
}

//新增跳转
function addOuterUserInfo() {
	window.location.href="${rc.contextPath}/training/maintain/opt-add/outerUserInfo.do";
}

//禁用
function disable(id, flag) {
	if(flag=='0') {
		comp.confirm("确认要启用吗？", function(r){
			if(r){
				$.post(
					"${rc.contextPath}/training/maintain/opt-dis/disableInfo.do",
					{id:id, useFlag:flag},
					function(data){
						window.location.href="${rc.contextPath}/training/maintain/opt-query/outerUserInfo.do";
					},
					"text"
				);
			}
		});
	}else {
		comp.confirm("确认要禁用吗？", function(r){
			if(r){
				$.post(
					"${rc.contextPath}/training/maintain/opt-dis/disableInfo.do",
					{id:id, useFlag:flag},
					function(data){
						window.location.href="${rc.contextPath}/training/maintain/opt-query/outerUserInfo.do";
					},
					"text"
				);
			}
		});
	}
	
	
	
}

//导师讲师信息查看
function viewTeacherInfo(id,name) {
	$("#teacher_view_body").empty();
	$("#teacher_title").html(name+'信息');
	comp.showModal("teacher_view_div","750px","-300px 0 0 -380px"); 
	$("#teacher_view_body").load("${rc.contextPath}/training/maintain/nsm/outerUserInfo.do?.temp="+Math.random(),
	{"id":id},
	function(){
	});
}
//业务删除
function delInfo(id, teacherType){
	var flag = null;
	$.ajax({
		url:"${rc.contextPath}/training/check/opt-del/delOuterUserInfo.do",
		data:"id="+id+"&teacherType="+teacherType,
		success:function(data){
			if(data==0) {
				flag = true;
			}else{
				flag = false;
				comp.message("已被使用，不能删除！","error");
			}
		},
		dataType:"text",
		async:false
	});
	if(flag == true) {
		comp.confirm("确认要删除吗？", function(r){
			if(r){
				$.ajax({
					url:"${rc.contextPath}/training/maintain/opt-del/delOuterUserInfo.do",
					data:"id="+id,
					success:function(data){
						window.location.href="${rc.contextPath}/training/maintain/opt-query/outerUserInfo.do";
					},
					dataType:"text",
					async:false
				});
			}
		});
	}else {
		return;
	}
}
</script>
</body>
</html>