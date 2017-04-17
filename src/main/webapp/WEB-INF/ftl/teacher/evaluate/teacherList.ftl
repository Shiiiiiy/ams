<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
</head>
<body>
<div id="contentwrapper">
	<div class="main_content">
		<div class="row-fluid">
			<#if permission=='1'>
				<form id="teacherList">
					<div class="span12">
						<div class="row-fluid">
							<div class="span4">
								<span class="formTitle">学年</span>
								<select class="span8" id="schoolYear.id" name="schoolYear.id" aria-controls="dt_gal" >
									<option value="">请选择</option>
									<#if schoolYearList??>
									<#list schoolYearList as schoolYear>
										<#if po?? && (po.schoolYear)?? && po.schoolYear.id == schoolYear.id>
											<option value="${schoolYear.id}" selected="selected">${schoolYear.name}</option>
										<#else>
											<option value="${schoolYear.id}">${schoolYear.name}</option>
										</#if>
									</#list>
									</#if>
								</select>
							</div>
							<div class="span4">
								<button class="btn btn-info" type="button" onclick="queryTeacherList()">查 询</button>
								<button class="btn btn-info" type="button" onclick="comp.clearForm('teacherList');">清 空</button>
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
											<#if user_key.optMap?? && user_key.optMap['add']?? && isAdd?? && isAdd =='true'>
												<button class="btn btn-info" type="button" onclick="addEvaluateInfo()">新 增</button>
											</#if>
										</div>
									</div>
								</div>
							</div>
							<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
								<thead>
									<tr>
										<th width="6%">序号</th>
										<th width="17%">学年</th>
										<th width="20%">学院</th>
										<th width="12%">姓名</th>
										<th width="15%">工号</th>
										<th width="10%">性别</th>
										<th width="12%">状态</th>
										<th width="10%">操作</th>
									</tr>
									<tbody>
										<#if page??>
											<#list page.result as p>
												<tr>
													<td class="autocut">${p_index+1}</td>
													<td class="autocut"><#if p.schoolYear??>${p.schoolYear.name!""}</#if></td>
													<td class="autocut"><#if p.teacher??>${p.teacher.org.name!""}</#if></td>
													<td class="autocut"><#if p.teacher??>${p.teacher.name!""}</#if></td>
													<td class="autocut"><#if p.teacher??>${p.teacher.code!""}</#if></td>
													<td class="autocut"><#if p.teacher??>${p.teacher.gender.name!""}</#if></td>
													<td class="autocut"><#if p.status??>${p.status.name!""}</#if></td>
													<td class="autocut">
														<a href="${rc.contextPath}/teacher/evaluate/opt-view/auditInfo.do?id=${p.id}&flag=true" target="_blank" class="sepV_a" title="查看"><i class="icon-list-alt"></i></a>
														<#if p.status?? && p.status.name = '已保存' || p.status.name = '已拒绝'>
															<#if user_key.optMap??>
																<#if user_key.optMap['update']??>
																	<a href="${rc.contextPath}/teacher/person/opt-update/editEvaluateInfo.do?id=${p.id}" class="sepV_a" title="修改"><i class="icon-edit"></i></a>
																</#if>
																<#if user_key.optMap['del']??>
																<a href="#" onclick="delEvaluateInfo('${p.id}')" title="删除"><i class="icon-trash"></i></a>
															</#if>
															</#if>
														</#if>
													</td>
												</tr>
											</#list>
										</#if>
									</tbody>
								</thead>
							</table>
							<#assign pageTagformId="teacherList"/>
							<#include "/page.ftl">
						</div>
					</div>
				</div>
			<#else>
				<#include "/common/common/commonMessage.ftl">
			</#if>
		</div>
	</div>
</div>
<script>
	//查询，返回查询结果。
	function queryTeacherList(){
		$("#teacherList").attr("action","${rc.contextPath}/teacher/person/opt-query/teacherList.do");
		$("#teacherList").attr("method", "post");
		$("#teacherList").submit();
	}
	//新增个人考核信息
	function addEvaluateInfo(){
		var flag = ${addJudge!""};
		if(flag == '1'){
			window.location.href="${rc.contextPath}/teacher/person/opt-add/editEvaluateInfo.do";
		}else {
			comp.message("您已经添加了当前学年的考核信息，不能重复添加！",'error')
		}
	}
	//删除个人考核信息
	function delEvaluateInfo(id){
		comp.confirm("确认要删除吗？", function(result){
			if(!result){
				return; }
				$.post(
				"${rc.contextPath}/teacher/person/opt-del/delEvaluateInfo.do",
				{id:id},
				function(data){
					window.location.href="${rc.contextPath}/teacher/person/opt-query/teacherList.do";
				},
				"text"
			);
		});
	}
</script>
</body>
</html>