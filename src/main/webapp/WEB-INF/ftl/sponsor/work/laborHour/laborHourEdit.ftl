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
	</head>
	<body>
		<div id="contentwrapper">
			<div class="main_content">
				<h3 class="heading">${(orgWorkHourModelPO.orgId.name)!""} 工时填报</h3>
				<form id="orgWorkHourForm" method="post">
					<input id="orgId" name="orgId.id" type="hidden" value="${(orgWorkHourModelPO.orgId.id)!""}"/>
					<input id="orgName" name="orgId.name" type="hidden" value="${(orgWorkHourModelPO.orgId.name)!""}"/>
					<div class="formSep">
						<div class="row-fluid">
							<div class="span3">
								<div class="span3">
									<span class="formTitle">学年<span class="f_req">*</span></span>
								</div>
								<div class="span9">
									<select size="1" id="year" name="schoolYear.id" aria-controls="dt_gal" <#if isQuery?? && isQuery == "true"> disabled="disabled" </#if> class="span8" onchange="getAllWorkHour();">
										<option value="">请选择..</option>
										<#list years as year>
											<#if (orgWorkHourModelPO.schoolYear)?? && orgWorkHourModelPO.schoolYear.id == year.id>
												<option value="${year.id}" selected="selected">${year.name}</option>
											<#else>
												<option value="${year.id}">${year.name}</option>
											</#if>
										</#list>
									</select>
								</div>
							</div>
							<div class="span3">
								<div class="span3">
									<span class="formTitle">学期<span class="f_req">*</span></span>
								</div>
								<div class="span9">
									<select size="1" id="term" name="schoolTerm.id" aria-controls="dt_gal" class="span8" <#if isQuery?? && isQuery == "true"> disabled="disabled" </#if> onchange="getAllWorkHour();">
										<option value="">请选择..</option>
										<#list terms as term>
											<#if (orgWorkHourModelPO.schoolTerm)?? && orgWorkHourModelPO.schoolTerm.id == term.id>
												<option value="${term.id}" selected="selected">${term.name}</option>
											<#else>
												<option value="${term.id}">${term.name}</option>
											</#if>
										</#list>
									</select>
								</div>
							</div>
							<div class="span3">
								<div class="span3">
									<span class="formTitle">年月<span class="f_req">*</span></span>
								</div>
								<div class="span9">
									<input name="yearAndMonth" class="span8 Wdate" type="text" <#if isQuery?? && isQuery == "true"> disabled="disabled" </#if> value="${(orgWorkHourModelPO.yearAndMonth)!""}" onfocus="WdatePicker({dateFmt:'yyyy-MM',skin:'whyGreen',maxDate:'${nowDate}'});" onchange="getAllWorkHour();"/>
								</div>
							</div>
							<div class="span3">
								<#if isQuery?? && isQuery == "true">
								<#else>
									<input id="saveBtn" class="btn btn-info" type="button" value="填 报" onclick="getAllWorkHour();"/>
								</#if>
							</div>
						</div>
						<input id="isQuery" name="isQuery" type="hidden" value="false"/>
					</div>
				</form>
				<br/>
				<#if isQuery??>
					<form id="editLaborHourInfoForm" method="post">
						<input name="orgWorkHourModel.id" class="span6" type="hidden" value="${(orgWorkHourModelPO.id)!""}"/>
						<input name="orgWorkHourModel.orgId.id" class="span6" type="hidden" value="${(orgWorkHourModelPO.orgId.id)!""}"/>
						<input id="orgWorkYear" name="orgWorkHourModel.workYear" class="span6" type="hidden" value="${(orgWorkHourModelPO.workYear)!""}"/>
						<input id="orgWorkMonth" name="orgWorkHourModel.workMonth" class="span6" type="hidden" value="${(orgWorkHourModelPO.workMonth)!""}"/>
						<input id="schoolYear" name="orgWorkHourModel.schoolYear.id" class="span6" type="hidden" value="${(orgWorkHourModelPO.schoolYear.id)!""}"/>
						<input id="schoolTerm" name="orgWorkHourModel.schoolTerm.id" class="span6" type="hidden" value="${(orgWorkHourModelPO.schoolTerm.id)!""}"/>
						<input id="addOrUpdate" class="span6" type="hidden" value="${addOrUpdate!"add"}"/>
						<div class="row-fluid">
							<div class="span12">
								<table id="dataTable" class="table table-bordered table-striped tablecut">
									<thead>
										<th width="6%">序号</th>
										<th width="8%">姓名</th>
										<th width="12%">学号</th>
										<th width="25%">岗位</th>
										<th width="8%">年份</th>
										<th width="8%">月份</th>
										<th width="10%">岗位工资</th>
										<th width="10%">岗位工时<span class="f_req">*</span></th>
										<th width="10%">工资小计</th>
									</thead>
									<tbody>
										<#if (orgWorkHourModelList)??>
											<#list orgWorkHourModelList as r>
												<tr>
													<input name="workHourList[${r_index}].id" type="hidden" value="${r.id!""}"/>
													<td class="autocut">${r_index+1}</td>
													<td class="autocut tipTag" data="学院：${(r.studentId.college.name)!""}&lt;br/&gt专业：${(r.studentId.major.majorName)!""}&lt;br/&gt班级：${(r.studentId.classId.className)!""}&lt;br/&gt">${(r.studentId.name)!""}</td>
													<td class="autocut">
														<input name="workHourList[${r_index}].studentId.id" type="hidden" value="${(r.studentId.id)!""}"/>
														${(r.studentId.stuNumber)!""}
													</td>
													<td class="autocut">
														<input name="workHourList[${r_index}].sponsorPosition.positionId" type="hidden" value="${(r.sponsorPosition.positionId)!""}"/>
														${(r.sponsorPosition.workName)!""}
													</td>
													<td class="autocut">${(r.orgWorkHour.workYear)!""}</td>
													<td class="autocut">${(r.orgWorkHour.workMonth)!""}</td>
													<td class="autocut">
														<input id="workSalary" name="workHourList[${r_index}].workSalary" type="hidden" value="${(r.workSalary)!""}"/>
														${(r.workSalary?string('.00'))!"0.00"}
													</td>
													<td class="autocut" style="padding:5px;padding-bottom:0px;">
														<input class="workHour span11" name="workHourList[${r_index}].workHour" 
														<#--排除审批结果为驳回状态的结果  让审批结果为驳回的也可修改-->
														<#if (orgWorkHourModelPO.submitStatus.code)?? && orgWorkHourModelPO.submitStatus.code == "SUBMIT">
															<#if (orgWorkHourModelPO.processStatus)??>
																<#if orgWorkHourModelPO.processStatus != 'REJECT'>
																	readonly="readonly"
																</#if>
															<#else>
																readonly="readonly"
															</#if>
														</#if>
														value="${(r.workHour)!''}" onchange="countSalary(this);" />
													</td>
													<td class="autocut" style="padding:5px;padding-bottom:0px;">
														<input name="workHourList[${r_index}].totalSalary" class="span11" 
															<#if (orgWorkHourModelPO.submitStatus.code)?? && orgWorkHourModelPO.submitStatus.code == "SUBMIT"> 
																<#if (orgWorkHourModelPO.processStatus)??>
																	<#if orgWorkHourModelPO.processStatus != 'REJECT'>
																		readonly="readonly"
																	</#if>
																<#else>
																	readonly="readonly"
																</#if>
															</#if>
														value="<#if r.totalSalary==0>0.00<#else>${(r.totalSalary?string('.00'))!""}</#if>"/>
													</td>
												</tr>
												
											</#list>
										</#if>
									</tbody>
								</table>
							</div>
						</div>
						<#--保存按钮-->
						<br/>
						<div class="row-fluid">
							<#if user_key.optMap["add"]??>
								<#if (orgWorkHourModelPO.processStatus)??>
									<#if orgWorkHourModelPO.processStatus == 'REJECT'>
										<button class="btn btn-info" type="button" onclick="onSub(0);">保 存</button>
										<button class="btn btn-info" type="button" onclick="onSub(1)">提 交</button>
									</#if>
								<#else>
									<button class="btn btn-info" type="button" onclick="onSub(0);">保 存</button>
									<button class="btn btn-info" type="button" onclick="onSub(1)">提 交</button>
								</#if>
								<button class="btn" type="button" onclick="backUp()">取 消</button>
							</#if>
						</div>
					</form>
				</#if>
				<#include "/apw/instance/approvers.ftl"/>
				<div id="getWorkHourForm" style="display:none"></div>
			</div>
		</div>
		<#--脚本开始-->
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
			$("#orgWorkHourForm").compValidate({//
				rules:{'yearAndMonth':{required:true},'schoolYear.id':{requiredSelect:'学年'},'schoolTerm.id':{requiredSelect:'学期'}},
				messages:{'yearAndMonth':{required:"年月为必填项"}}
			});
			//当年份和月份改变时重新加载该年和该月需要添加的工时
			function getAllWorkHour(){
				var orgWorkHourForm = $("#orgWorkHourForm");
				var orgId = $("#orgId").val();
				if(orgId == null || orgId == ''){
					//comp.confirm("您所在的部门为空，不能填报工时！",function(){});
					$.sticky("您所在的部门为空，不能填报工时！", {autoclose:5000, position:"top-right", type:"st-error"});
					return;
				}
				if(orgWorkHourForm.compValid()){
					orgWorkHourForm.attr("action","${rc.contextPath}/sponsor/laborHour/opt-add/editLaborHour.do");
					orgWorkHourForm.submit();
				}
			}
			$('#editLaborHourInfoForm').validate({
				onkeyup: false,
				errorClass: 'error',
				validClass: 'valid',
				focusCleanup:true,
				focusInvalid:false,
				highlight: function(element) {
					$(element).closest('td').addClass("f_error");
				},
				unhighlight: function(element) {
					$(element).closest('td').removeClass("f_error");
				},
				errorPlacement: function(error, element) {
					$(element).closest('td').append(error);
				}
			});
			jQuery.validator.addMethod("cRequired",jQuery.validator.methods.required,"工时为必填项!");
			jQuery.validator.addMethod("cNumber",jQuery.validator.methods.number,"工时为数字!");
			jQuery.validator.addMethod("cMaxlength",jQuery.validator.methods.maxlength,"工时数最大位数不超过{0}位!");
			jQuery.validator.addMethod("decimal",function(value,element,param) {
				return /(((^[1-9][0-9]{0,6})|^0)(\.[0-9]{1})?$)|^0$/.test(value);//包括0和0.0
				//return /(^[1-9]\d*$){1,4}|((^[1-9]\d*|0).\d{1}$)/.test(value) || "0"==value;//包括0和0.0
			},"工时为精确到小数点后一位的非负数!");
			jQuery.validator.addMethod("workHourValidate", function(value,element,param) {
				if(value <= 40){
					return true;
				}else{
					return false;
				}
			}, "工时不超过40小时!");
			//验证select是否选择
			jQuery.validator.addMethod("requiredSelect", function(value,element,param) {
				if(value == "" || value == null){
					return false;
				}else{
					return true;
				}
			}, "请选择:{0}");
			jQuery.validator.addClassRules("workHour",{cRequired:true,cNumber:true,decimal:true,workHourValidate:true});
			//验证列表中是否存在数据
			function isDataTable(){
				var length = $("#dataTable tbody tr").length;
				if(length > 0){
					return true;
				}else{
					return false;
				}
			}
			//保存  提交
			function onSub(status){
				var editLaborHourInfoForm = $("#editLaborHourInfoForm");
				var orgWorkHourForm = $("#orgWorkHourForm");
				var isTrue = isDataTable();
				if(!isTrue){
					$.sticky("没有数据！", {autoclose:5000, position:"top-right", type:"st-error"});
					return;
				}
				if(!orgWorkHourForm.compValid()){
					return;
				}
				if(!editLaborHourInfoForm.compValid()){
					return;
				}
				if(status == 1){//提交  
					if(confirm("确定要提交？")){
						apw.selectNextApprover($("#id").val(),'INIT',"SPONSOR_LABOR_WORK_APPROVE",'');
					}
				}
				if(status == 0){
					doAmsAction();//保存
				}
			}
			//初始化当前发起流程【doInitAction方法名不可修改】 提交
			function doInitAction(objectId,userId){
				var editLaborHourInfoForm = $("#editLaborHourInfoForm");
				editLaborHourInfoForm.attr("action","${rc.contextPath}/sponsor/laborHour/opt-save/saveLaborHourList.do?saveState="+1+"&userId="+userId);
				editLaborHourInfoForm.submit();
			}
			//执行业务系统的操作
			function doAmsAction(userId,approveKey,approveStatus,processStatusCode,suggest){
				var editLaborHourInfoForm = $("#editLaborHourInfoForm");
				editLaborHourInfoForm.attr("action","${rc.contextPath}/sponsor/laborHour/opt-save/saveLaborHourList.do?saveState="+0);
				editLaborHourInfoForm.submit();
			}
			//计算工资
			function countSalary(obj){
				var workHour = $(obj).val();
				var workSalary = $("#workSalary").val();
				var totalSalary = $(obj).closest("td").next().children("input")[0];
				$(totalSalary).val((workHour * workSalary).toFixed(2));
			}
			//取消
			function backUp(){
				window.location.href = "${rc.contextPath}/sponsor/addLaborHour/opt-query/queryOrgWorkHourPage.do";
			}
		</script>
		<#--脚本结束-->
	</body>
</html>