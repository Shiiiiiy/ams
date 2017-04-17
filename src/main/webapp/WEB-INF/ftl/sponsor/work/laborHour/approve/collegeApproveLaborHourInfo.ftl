<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="${rc.contextPath}/css/bdp_comp.css" type="text/css"/>
		<!-- My97DatePicker -->
    	<link rel="stylesheet" href="${rc.contextPath}/lib/My97DatePicker/skin/WdatePicker.css" />
		<script type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
		
		<script src="${rc.contextPath}/js/jquery.form.js"></script> 
		<script src="${rc.contextPath}/js/apw/apw_check.js"></script>
		<script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
		<script src="${rc.contextPath}/js/common/common_approve.js"></script>
	</head>
	<body>
		<div id="contentwrapper">
			<div class="main_content">
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<span class="formTitle">学年</span>
							</div>
							<div class="span9">
								<input class="span6" type="text" readonly="readonly" value="${(orgWorkHourModelPO.schoolYear.name)!""}"/>
							</div>
						</div>
						<div class="span6">
							<div class="span3">
								<span class="formTitle">学期</span>
							</div>
							<div class="span9">
								<input class="span6" type="text" readonly="readonly" value="${(orgWorkHourModelPO.schoolTerm.name)!""}"/>
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<span class="formTitle">用工部门</span>
							</div>
							<div class="span9">
								<input id="orgName" name="orgId.name" class="span6" type="text" readonly="readonly" value="${(orgWorkHourModelPO.orgId.name)!""}"/>
							</div>
						</div>
						<div class="span6">
							<div class="span3">
								<span class="formTitle">年月</span>
							</div>
							<div class="span9">
								<input name="yearAndMonth" class="span6" type="text" readonly="readonly" value="${(orgWorkHourModelPO.workYear)!""}-${(orgWorkHourModelPO.workMonth)!""}" />
							</div>
						</div>
					</div>
				</div>
				<br/>
				<#include "/sponsor/work/laborHour/laborHourAllList.ftl">
				<#--审核结果和审核页面-->
				<form id="saveApproveLaborHourForm" action="${rc.contextPath}/sponsor/approveLaborHour/opt-save/saveApproveLaborHour.do" method="post">
					<input id="objectId" name="id" type="hidden" value="${(orgWorkHourModelPO.id)!''}"/>
					<input id="nextApproverId" name="nextApproverId" type="hidden"/>
					<input id="apwApproveKey" name="approveKey" type="hidden"/>
					<input id="approveStatus" name="approveStatus" type="hidden"/>
					<input id="processStatusCode" name="processStatusCode" type="hidden"/>
					<div class="formSep" name="endApproveResultDiv">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<label>审核意见<span class="f_req"></span></label>
								</div>
								<div class="span9">
									<textarea rows="5" cols="12" id="approveReason" name="approveReason" style="width: 944px; height: 134px;"></textarea>
								</div>
							 </div>
						</div>
					</div>
				</form>
				<br/>
				<div class="row-fluid" name="endApproveResultDiv">
					<div class="span6">
						<div class="span9">
							<!--判断是通过还是拒绝保存=0   提交=1 -->
							<button class="btn btn-info" type="button" id="save-pass" onclick="doApprove('PASS')">通 过</button>
							<button class="btn btn-info" type="button" id="save-refuse" onclick="doApprove('REJECT')">拒 绝</button>
							<button class="btn btn-info" type="button" onclick="approve.showHis($('#objectId').val());">审批历史</button>
							<button class="btn" type="button" onclick="javascript:window.history.back(-1);">取 消</button>
						</div>
					</div>
					<input name="check_error" id="check_error" type="hidden" value="true"/>
				</div>
			</div>
			<#include "/apw/instance/approvers.ftl"/>
		</div>
		<#-- 审核历史查看 -->
		<#include "/apw/instance/approveHistory.ftl">
		<script type="text/javascript">
			$(function(){
				$('.tipTag').poshytip({
					className: 'tip-yellowsimple',
					alignTo: 'target',
					alignX: 'right',
					alignY: 'center',
					offsetX: 5
				});
			});
			var saveApproveLaborHourForm = $("#saveApproveLaborHourForm");
			saveApproveLaborHourForm.compValidate({
				rules:{approveReason:{maxlength:500}},
				messages:{approveReason:{maxlength:"审核意见最多输入500字"}}
			});
			function doApprove(status){
				var objectId = $("#objectId").val();
				var suggest = $("#approveReason");
				if("PASS"==status){
					fillDefaltMessage("通过");
					if(saveApproveLaborHourForm.compValid()){
						if(confirm("确定要通过？")){
							if(apw.isFinalTask(objectId)){//最后一个节点审批
								//apw.approveCurProcess("SINGLE",$("#id").val(),'',"PASS",$("#approveReason").val());
								apw.approveCurProcess("SINGLE",objectId,'',status,suggest.val());
							}else{//中间节点审批
								apw.selectNextApprover(objectId,"PASS","SPONSOR_LABOR_WORK_APPROVE",suggest.val());
							}
						}
					}
				}else if("REJECT"==status){
					fillDefaltMessage("驳回");
					if(saveApproveLaborHourForm.compValid()){
						if(confirm("确定要驳回？")){
							apw.approveCurProcess("SINGLE",objectId,'',status,suggest.val());
						}
					}
				}
			}
			//执行业务系统操作【doAmsAction方法名不可修改】
			function doAmsAction(userId,approveKey,approveStatus,processStatusCode){
				$("#nextApproverId").val(userId);
				$("#apwApproveKey").val(approveKey);
				$("#approveStatus").val(approveStatus);
				$("#processStatusCode").val(processStatusCode);
				saveApproveLaborHourForm.submit();
			}
			//为审批意见默认赋值
			function fillDefaltMessage(defultMsg){
				var approveReason = $("#approveReason");
				if(comp.isNull(approveReason.val())){
					approveReason.val(defultMsg);
				}
			}
		</script>
	</body>
</html>