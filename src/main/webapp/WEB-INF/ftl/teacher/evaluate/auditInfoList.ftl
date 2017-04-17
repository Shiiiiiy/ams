<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
	<script src="${rc.contextPath}/js/jquery.form.js"></script>
</head>
<body>
<div id="contentwrapper">
	<div class="main_content">
		<div class="row-fluid">
			<#if permission == '1'>
				<form id="auditList">
					<div class="span12">
						<div class="row-fluid">
								<div class="span4">
									<span class="formTitle">姓名</span>
									<input class="span8" id="teacher.name" name="teacher.name" value="${(po.teacher.name)!""?html}" />
								</div>
								<div class="span4">
									<span class="formTitle">工号</span>
									<input class="span8" id="teacherCode" name="teacher.code" value="${(po.teacher.code)!""?html}" />
								</div>
								<div class="span4">
									<span class="formTitle">状态</span>
									<select class="span8" id="status.id" name="status.id" aria-controls="dt_gal" >
										<option value="">请选择</option>
										<#if statusList??>
										<#list statusList as status>
											<#if po?? && (po.status)?? && po.status.id == status.id>
												<option value="${status.id}" selected="selected">${status.name}</option>
											<#else>
												<option value="${status.id}">${status.name}</option>
											</#if>
										</#list>
										</#if>
									</select>
								</div>
							</div>
							<div class="row-fluid">
								<div class="span4">
									<span class="formTitle">学院</span>
									<#if college??>
										<input class="span8" id="collegeId" value="${college!""}" readonly/>
									</#if>
									<#if collegeList??>
										<select id="" name="college.id" aria-controls="dt_gal" >
											<option value="">请选择</option>
											<#if collegeList??>
											<#list collegeList as college>
												<#if (po.college.id)?? && po.college.id == college.id>
													<option value="${college.id}" selected="selected">${college.name}</option>
												<#else>
													<option value="${college.id}">${college.name}</option>
												</#if>
											</#list>
											</#if>
										</select>
									</#if>
								</div>
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
								<div class="span4" style="padding-left:35px;">
									<button class="btn btn-info" type="button" onClick="queryEvaluateInfoList(${auditStatus!""});">查 询</button>
									<button class="btn btn-info" type="button" onclick="clean()">清 空</button>
								</div>
							</div>
						</div>
				</form>
				<div class="row-fluid">
					<div class="span12">
						<h5 class="heading"></h5>
						<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
							<#if auditStatus=='1'>
								<div class="row">
									<div class="span6">
										<div class="dt_actions">
											<div class="btn-group">
												<button class="btn btn-info" type="button" title="未填写考核信息的教师名单" onclick="restTeacherInfo()" target="_blank">待考核教师</button>
											</div>
										</div>
								    </div>
								</div>
							</#if>
							<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
								<thead>
									<tr>
										<th width="6%">序号</th>
										<th width="12%">学年</th>
										<th width="25%">学院</th>
										<th width="10%">姓名</th>
										<th width="15%">工号</th>
										<th width="10%">性别</th>
										<th width="12%">审核状态</th>
										<th width="10%">操作</th>
									</tr>
								</thead>
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
														<#if auditStatus == '0'>
															<a href="${rc.contextPath}/teacher/evaluate/opt-view/auditInfo.do?id=${p.id}" class="sepV_a" title="查看" target="_blank"><i class="icon-list-alt"></i></a>
															<#if p.status.name == '学院审核'>
																<a href="${rc.contextPath}/teacher/collegeAudit/opt-edit/auditInfo.do?id=${p.id}" class="sepV_a" title="审核"><i class="icon-check"></i></a>
															</#if>
														<#else>
															<a href="${rc.contextPath}/teacher/evaluate/opt-view/auditInfo.do?id=${p.id}" class="sepV_a" title="查看" target="_blank"><i class="icon-list-alt"></i></a>
															<#if p.status.name == '学生处审核'>
																<a href="${rc.contextPath}/teacher/stuAffairAudit/opt-edit/auditInfo.do?id=${p.id}" class="sepV_a" title="审核"><i class="icon-check"></i></a>
															</#if>
														</#if>
													</td>
												</tr>
											</#list>
										</#if>
									</tbody>
							</table>
							<#assign pageTagformId="auditList"/>
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

<#-- 未填写考核信息的教师名单弹出框 begin-->
<div class="modal hide fade" id="teacherInfoBox">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3 id="title1">未填写考核信息教师名单</h3>
	</div>
	<div class="modal-body">
		<#include "restTeacherView.ftl"/>
	</div>
	<div class="modal-footer">
		<a href="#" class="btn btn" data-dismiss="modal">关闭</a>
	</div>
</div>
<#-- 未填写考核信息的教师名单弹出框  end-->
<script>
	//查询，返回查询结果。
	function queryEvaluateInfoList(auditStatus){
		//0是学院审核，1是学生处审核
		if(auditStatus == 0){
			$("#auditList").attr("action", "${rc.contextPath}/teacher/collegeAudit/opt-query/auditInfoList.do");
			$("#auditList").attr("method", "post");
			$("#auditList").submit();
		}else{
			$("#auditList").attr("action", "${rc.contextPath}/teacher/stuAffairAudit/opt-query/auditInfoList.do");
			$("#auditList").attr("method", "post");
			$("#auditList").submit();
		}
		
	}
	//清空查询条件
	function clean(){
		comp.clearForm('auditList');
		$("#collegeId").val("${college!""}");
	}
	//查看未填写考核信息的教师名单
	function restTeacherInfo(){
		comp.showModal("teacherInfoBox", "800px", "-180px 0 0 -380px");
		$("#viewRestTeacherDiv").load("${rc.contextPath}/teacherInfo/view/nsm/ajaxueryOnPage.do",function(){});
	}
</script>
</body>
</html>