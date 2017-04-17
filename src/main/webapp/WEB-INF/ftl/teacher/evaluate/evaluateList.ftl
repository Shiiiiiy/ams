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
			<form id="evaluateList">
				<div class="span12">
					<div class="row-fluid">
							<div class="span4">
								<span class="formTitle">学院</span>
								<select class="span8" name="college.id" aria-controls="dt_gal" >
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
							</div>
							<div class="span4">
								<span class="formTitle">姓名</span>
								<input class="span8" id="teacherName" name="teacher.name" value="${(po.teacher.name)!""?html}" />
							</div>
							<div class="span4">
								<span class="formTitle">工号</span>
								<input class="span8" id="teacherCode" name="teacher.code" value="${(po.teacher.code)!""?html}" />
							</div>
						</div>
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
							<div class="span4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button class="btn btn-info" type="button" onClick="queryEvaluateList();">查 询</button>
								<button class="btn btn-info" type="button" onclick="comp.clearForm('evaluateList');">清 空</button>
							</div>
						</div>
				</div>
			</form>
			<div class="row-fluid">
				<div class="span12">
					<h5 class="heading"></h5>
					<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
					<!--
						<div class="row">
							<div class="span6">
								<div class="dt_actions">
									<div class="btn-group">
										<button class="btn btn-info" type="button" title="未填写考核信息的教师名单" onclick="restTeacherInfo()" target="_blank">未填写考核信息教师名单</button>
									</div>
								</div>
						    </div>
						</div>
					-->
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
							<thead>
								<tr>
									<th width="5%">序号</th>
									<th width="10%">学年</th>
									<th width="15%">学院</th>
									<th width="10%">姓名</th>
									<th width="10%">工号</th>
									<th width="10%">性别</th>
									<th width="10%">考核等级</th>
									<th width="10%">考核得分</th>
									<th width="12%">状态</th>
									<th width="5%">操作</th>
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
												<td class="autocut">
													<#if p.stuAffairsAuditLevel??>
														${(p.stuAffairsAuditLevel.name!"")?html}
													<#elseif p.collegeAuditLevel??>
														${(p.collegeAuditLevel.name!"")?html}
													</#if>
												</td>
												<td class="autocut">
													<#if p.stuAffairsAuditScore??>
														${(p.stuAffairsAuditScore!"")?html}
													<#elseif p.collegeAuditScroe??>
														${(p.collegeAuditScroe!"")?html}
													</#if>
												</td>
												<td class="autocut"><#if p.status??>${p.status.name!""}</#if></td>
												<td class="autocut">
													<a href="${rc.contextPath}/teacher/evaluate/opt-view/auditInfo.do?id=${p.id}" class="sepV_a" title="查看" target="_blank"><i class="icon-list-alt"></i></a>
												</td>
											</tr>
										</#list>
									</#if>
								</tbody>
							</thead>
						</table>
						<#assign pageTagformId="evaluateList"/>
						<#include "/page.ftl">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<#-- 未填写考核信息的教师名单弹出框 begin-->
<div class="modal hide fade" id="teacherInfoBox">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3 id="title1">未填写考核信息教师名单</h3>
	</div>
	<div class="modal-body" id="viewRestTeacherDiv"></div>
	<div class="modal-footer">
		<a href="#" class="btn btn" data-dismiss="modal">关闭</a>
	</div>
</div>
<#-- 未填写考核信息的教师名单弹出框  end-->
<script>
	//查询，返回查询结果。
	function queryEvaluateList(){
		$("#evaluateList").attr("action", "${rc.contextPath}/teacher/system/opt-query/evaluateList.do");
		$("#evaluateList").attr("method", "post");
		$("#evaluateList").submit();
	}
	//查看未填写考核信息的教师名单
	function restTeacherInfo(){
		comp.showModal("teacherInfoBox", "700px", "-180px 0 0 -380px");
   	 	$("#viewRestTeacherDiv").load("${rc.contextPath}/teacherInfo/view/nsm/restTeacherView.do");
		//window.location.href="${rc.contextPath}/teacher/evaluate/opt-query/restTeacherInfo.do";
	}
</script>
</body>
</html>