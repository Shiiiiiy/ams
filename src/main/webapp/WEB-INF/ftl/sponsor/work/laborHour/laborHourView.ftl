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
		<script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
		<script src="${rc.contextPath}/js/common/common_approve.js"></script>
	</head>
	<body>
		<div id="contentwrapper">
			<div class="main_content">
				<input id="id" name="id" type="hidden" value='${(model.id)!""}' />
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<label>姓名</label>
							</div>
							<div class="span9">
								<input value="${(model.studentId.name)!""}"  readonly="readonly"/>
							</div>
						</div>
						<div class="span6">
							<div class="span3">
								<label>学号</label>
							</div>
							<div class="span9">
								<input value="${(model.studentId.stuNumber)!""}"  readonly="readonly"/>
							</div>
						</div>
						
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<label>学院</label>
							</div>
							<div class="span9">
								<input value="${(model.studentId.college.name)!""}"  readonly="readonly"/>
							</div>
						</div>
						<div class="span6">
							<div class="span3">
								<label>专业</label>
							</div>
							<div class="span9">
								<input value="${(model.studentId.major.majorName)!""}"  readonly="readonly"/>
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<label>班级</label>
							</div>
							<div class="span9">
								<input value="${(model.studentId.classId.className)!""}"  readonly="readonly"/>
							</div>
						</div>
						<div class="span6">
							<div class="span3">
								<label>联系电话</label>
							</div>
							<div class="span9">
								<input value="${(model.studentId.phone1)!""}"  readonly="readonly"/>
							</div>
						</div>
					</div>
				</div>
				
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<label>开户行</label>
							</div>
							<div class="span9">
								<input value="${(model.studentId.bank)!""}"  readonly="readonly"/>
							</div>
						</div>
						<div class="span6">
							<div class="span3">
								<label>银行卡号</label>
							</div>
							<div class="span9">
								<input value="${(model.studentId.bankCode)!""}"  readonly="readonly"/>
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<label>年份</label>
							</div>
							<div class="span9">
								<input value="${(model.orgWorkHour.workYear)!""}"  readonly="readonly"/>
							</div>
						</div>
						<div class="span6">
							<div class="span3">
								<label>月份</label>
							</div>
							<div class="span9">
								<input value="${(model.orgWorkHour.workMonth)!""}"  readonly="readonly"/>
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<label>用工部门</label>
							</div>
							<div class="span9">
								<input value="${(model.orgWorkHour.orgId.name)!""}"  readonly="readonly"/>
							</div>
						</div>
						<div class="span6">
							<div class="span3">
								<label>岗位</label>
							</div>
							<div class="span9">
								<input value="${(model.sponsorPosition.workName)!""}"  readonly="readonly"/>
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<label>岗位工资</label>
							</div>
							<div class="span9">
								<input value="${(model.workSalary?string('.00'))!"0.00"}"  readonly="readonly"/>
							</div>
						</div>
						<div class="span6">
							<div class="span3">
								<label>工时</label>
							</div>
							<div class="span9">
								<input value="${(model.workHour)!"0.0"}"  readonly="readonly"/>
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<label>工资总计</label>
							</div>
							<div class="span9">
								<input value="${(model.totalSalary?string('.00'))!"0.00"}"  readonly="readonly"/>
							</div>
						</div>
						
					</div>
				</div>
				<br/>
				<div class="row-fluid" >
					<div class="span6">
						<div class="span3"></div>
						<div class="span6">
							<button class="btn btn-info" type="button" onclick="approve.showHis('${(model.orgWorkHour.id)!""}');">审批历史</button>
							<button class="btn" onclick="window.close();">关 闭</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<#-- 审核历史查看 -->
		<#include "/apw/instance/approveHistory.ftl">
	</body>
</html>