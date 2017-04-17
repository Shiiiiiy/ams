<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<script src="${rc.contextPath}/js/common/common_approve.js"></script>
</head>
<body>
<div id="contentwrapper">
	<div class="main_content">
		<div class="row-fluid">
			<h3 class="heading">审核信息查看</h3>
			<input name="errorText" id="errorText" type="hidden" action="${rc.contextPath}/teacher/evaluate/opt-view/auditInfo.do" value="${errorText!""}"/>
				<form id="auditInfoView" name="auditInfoView" class="form_validation_reg">
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<label>学年</label>
							</div>
							<div class="span9">
								<input id="" name="" value="${(evaluateTeacher.schoolYear.name)!""}" readonly/>
							</div>
						</div>
						<div class="span6">
							<div class="span3">
								<label>学院</label>
							</div>
							<div class="span9">
								<input value="${(evaluateTeacher.teacher.org.name)!""}" readonly/>
							</div>
						</div>
					</div>
				</div>	
				
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<label>姓名</label>
							</div>
							<div class="span9">
								<input value="${(evaluateTeacher.teacher.name)!""}" readonly/>
							</div>
						</div>
						<div class="span6">
							<div class="span3">
								<label>性别</label>
							</div>
							<div class="span9">
								<input value="${(evaluateTeacher.teacher.gender.name)!""}" readonly/>
							</div>
						</div>
					</div>
				</div>
		
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<label>出生年月</label>
							</div>
							<div class="span9">
								<input value="${(evaluateTeacher.teacher.birthday ? string('yyyy-MM-dd'))!""}" readonly/>
							</div>
						</div>
									
						<div class="span6">
							<div class="span3">
								<label>民族</label>
							</div>
							<div class="span9">
								<input value="${(evaluateTeacher.teacher.nation)!""}" readonly>
							</div>
						</div>
					</div>
				</div>
				
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<label>工作时间</label>
							</div>
							<div class="span9">
								<input value="${(evaluateTeacher.workTime)!""}" readonly/>
							</div>
						</div>
						<div class="span6">
							<div class="span3">
								<label>现任职务</label>
							</div>
							<div class="span9">
								<input value="${evaluateTeacher.presentJob!""}" readonly/>
							</div>
						</div>
					</div>
				</div>
					
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<label>工作总结</label>
							</div>
							<div class="span9">
								<textarea readonly rows="5" cols="12" style="width: 775px; height: 134px;"><#if evaluateTeacher.yearWorkSummary??>${evaluateTeacher.yearWorkSummary!""}</#if></textarea>
							</div>
						</div>
					</div>
				</div>
		
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<label>所获荣誉</label>
							</div>
							<div class="span9">
								<textarea readonly rows="5" cols="12" id="approveReason" name="approveReason" style="width: 775px; height: 134px;">${(evaluateTeacher.honour)!""}</textarea>
							</div>
						</div>
					</div>
				</div>
				
				<div class="formSep">
					<div class="row-fluid">
						<div class="span9">
							<div class="span2">
								<label>相关附件</label>
							</div>
							<div class="span10" id="_upload_div">
								<#if uploadFileRefList??>	
									<#list uploadFileRefList as f>
										<div class="fileupload-info">
											<a href="${rc.contextPath}/sys/sysConfig/file.do?id=${f.uploadFile.id}"><strong>${f.uploadFile.name}&nbsp;(${f.uploadFile.fileSize})</strong></a>
										</div>					
									</#list>
								</#if> 
							</div>
						</div>
					</div>
				</div>
			<#if !flag?? || (flag == "true" && passStatus.id = evaluateTeacher.status.id ) >
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<#if evaluateTeacher.stuAffairsAuditScore??>
								<div class="span3">
									<label>学生处审核得分</label>
								</div>
								<div class="span9">
									<input value="${(evaluateTeacher.stuAffairsAuditScore)!""}" readonly/>
								</div>
							<#else>
								<div class="span3">
									<label>学院审核得分</label>
								</div>
								<div class="span9">
									<input value="<#if evaluateTeacher.collegeAuditScroe??>${(evaluateTeacher.collegeAuditScroe)!""}</#if>" readonly/>
								</div>
							</#if>
						</div>
						<div class="span6">
							<#if evaluateTeacher.stuAffairsAuditLevel??>
								<div class="span3">
									<label>学生处审核等级</label>
								</div>
								<div class="span9">
									<input value="${evaluateTeacher.stuAffairsAuditLevel.name!""}" readonly/>
								</div>
							<#else>
								<div class="span3">
									<label>学院审核等级</label>
								</div>
								<div class="span9">
									<input value="<#if evaluateTeacher.collegeAuditLevel??>${evaluateTeacher.collegeAuditLevel.name!""}</#if>" readonly/>
								</div>
							</#if>
						</div>
					</div>
				</div>
				</#if>
				<div class="row-fluid">
					<div class="span6">
						<div class="span3">
						</div>
						<div class="span9" style="padding:10px 0px 0px 0px">
							<button class="btn btn-info" type="button" onclick="approve.showApproveComments('${objectId!""}');">审核历史</button>
							<button class="btn" type="button" onclick="closeWindow();">关闭</button>
						</div>
					</div>
				</div>
			</form>
			<input name="check_error" id="check_error" type="hidden" value="true"/>
		</div>
	</div>
</div>
<#-- 审核历史弹出框 begin-->
<div class="modal hide fade" id="auditHistoryBox">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3 id="title1">审核历史</h3>
	</div>
	<div class="modal-body" id="viewauditHistoryDiv"></div>
	<div class="modal-footer">
		<a href="#" class="btn btn" data-dismiss="modal">关闭</a>
	</div>
</div>
<#-- 审核历史弹出框  end-->
<#include "/common/approve/approveComment.ftl">
<script>
	//关闭页面
	function closeWindow(){   
		window.close();
	}
	//查看审核历史
	function auditHistoryView(){
		comp.showModal("auditHistoryBox", "1000px", "-180px 0 0 -380px");
   	 	$("#viewauditHistoryDiv").load("${rc.contextPath}/teacherInfo/view/nsm/auditHistory.do");
	}
	//审核历史
	function showApproveComments(){
		;
	}
</script>
</body>
</html>