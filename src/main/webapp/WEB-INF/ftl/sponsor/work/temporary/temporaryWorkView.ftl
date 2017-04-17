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
		<script src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script>
		<script src="${rc.contextPath}/lib/validation/localization/messages_cn.js"></script> 
		<script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
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
								<input id="studentName" name="studentName" disabled='disabled' value='${(model.studentId.name)!""}' onfocus="selectStudentRadio();"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							</div>
						</div>
						<div class="span6">
							<div class="span3">
								<label>学号</label>
							</div>
							<div class="span9">
								<input id="stuNo" name="studentId.id" value='${(model.studentId.stuNumber)!""}' disabled='disabled'/>
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
								<input id="collegeName" value="${(model.studentId.college.name)!""}" disabled='disabled'/>
							</div>
						</div>
						<div class="span6">
							<div class="span3">
								<label>班级</label>
							</div>
							<div class="span9">
								<input id="className" value='${(model.studentId.classId.className)!""}' disabled='disabled'/>
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
								<input id="bank" name="bank" disabled='disabled' value='${(model.bank)!""}'/>
							</div>
						</div>
						<div class="span6">
							<div class="span3">
								<label>银行卡号</label>
							</div>
							<div class="span9">
								<input id="cardNum" name="cardNum" disabled='disabled' value='${(model.cardNum)!""}'/>
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
								<input id="orgName" name="orgName" disabled='disabled' value='${(model.orgName)!""}'/>
							</div>
						</div>
						<div class="span6">
							<div class="span3">
								<label>学年</label>
							</div>
							<div class="span9">
								<select id="year" name="schoolYear.id" disabled='disabled'>
									<option value="">请选择..</option>
									<#list years as year>
										<#if (model.schoolYear)?? && model.schoolYear.id == year.id>
											<option value="${year.id}" selected="selected">${year.name}</option>
										<#else>
											<option value="${year.id}">${year.name}</option>
										</#if>
									</#list>
								</select>
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<label>学期</label>
							</div>
							<div class="span9">
								<select id="term" name="schoolTerm.id" disabled='disabled'>
									<option value="">请选择..</option>
									<#list terms as term>
										<#if (model.schoolTerm)?? && model.schoolTerm.id == term.id>
											<option value="${term.id}" selected="selected">${term.name}</option>
										<#else>
											<option value="${term.id}">${term.name}</option>
										</#if>
									</#list>
								</select>
							</div>
						</div>
						<div class="span6">
							<div class="span3">
								<label>月份</label>
							</div>
							<div class="span9">
								<input id="workMonth" name="workMonth" class="Wdate" style="cursor:pointer;" disabled='disabled' type="text" value="${(model.workMonth)!""}" onclick="WdatePicker({dateFmt:'MM',skin:'whyGreen'});" />
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<label>月用工时数（小时）</label>
							</div>
							<div class="span9">
								<input id="workHour" name="workHour" disabled='disabled' value='${(model.workHour?string('.0'))!""}'/>
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid" >
						<div class="span6">
							<div class="span3">
								<label>该生在本月勤工助学中的表现</label>
							</div>
							<div class="span9">
								<#if (model.workPerformance)?? >
									<textarea id="workPerformance" rows="5" cols="12" name="workPerformance" disabled='disabled' class="tipTag" data="1.填写学生在勤工助学期间的表现情况&lt;br/&gt;" style="width:773px; height: 134px;">${model.workPerformance!''}</textarea>
								<#else>
									<textarea id="workPerformance" rows="5" cols="12" name="workPerformance" disabled='disabled' class="tipTag" data="1.填写学生在勤工助学期间的表现情况&lt;br/&gt;" style="width:773px; height: 134px;"></textarea>
								</#if>
							</div>
						</div>
					</div>
				</div>
				<br/>
				<div class="row-fluid" >
					<div class="span6">
						<div class="span3">
					</div>
						<div class="span6">
							<button class="btn" onclick="window.close();">关 闭</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>