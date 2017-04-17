<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
<div id="contentwrapper">
   <div class="row-fluid">
   		<input type="hidden" id="studentId" name="studentId" value="${(leaveInfo.student.id)!""}">
		<div class="formSep">
			<div class="row-fluid">
				<div class="span6">
					<div class="span4" >
						<label class="span12">姓名</label>
					</div>
					<div class="span5">
						<label class="span12">${(leaveInfo.student.name)!""}</label>
					</div>
				</div>
				<div class="span6">
					<div class="span4">
						<label class="control-label">学号 </label>
					</div>
					<div class="span5">
						<label class="span12">${(leaveInfo.student.stuNumber)!""}</label>
					</div>
				</div>
			</div>
		</div>
		<div class="formSep">
			<div class="row-fluid">
				<div class="span6">
					<div class="span4">
						<label >学院</label>
					</div>
					<div class="span5">
						    <label class="span12">${(leaveInfo.student.college.name)!""}</label>
					</div>
				</div>
				<div class="span6">
					<div class="span4">
						<label >专业</label>
					</div>
					<div class="span5">
						    <label class="span12">${(leaveInfo.student.major.majorName)!""}</label>
					</div>
				</div>
			</div>
		</div>
		<div class="formSep">
			<div class="row-fluid">
			    <div class="span6">
					<div class="span4">
						<label >班级</label>
					</div>
					<div class="span5">
					    <label class="span12">${(leaveInfo.student.classId.className)!""}</label>
					</div>
				</div>
				<div class="span6">
					<div class="span4">
						<label >身份证号</label>
					</div>
					<div class="span5">
						<label class="span12">${(leaveInfo.student.certificateCode)!""}</label>
					</div>
				</div>
			</div>
		</div>
		<div class="formSep">
			<div class="row-fluid">
			    <div class="span6">
					<div class="span4">
						<label >图书信息中心</label>
					</div>
					<div class="span5">
					    <label class="span12"></label>
					</div>
				</div>
				<div class="span6">
					<div class="span4">
						<label >公寓管理中心</label>
					</div>
					<div class="span5">
						<label class="span12">${(leaveInfo.dorm.status.name)!"未办理"}</label>
					</div>
				</div>
			</div>
		</div>
		<div class="formSep">
			<div class="row-fluid">
			    <div class="span6">
					<div class="span4">
						<label >学费</label>
					</div>
					<div class="span5">
					    <label class="span12"></label>
					</div>
				</div>
				<div class="span6">
					<div class="span4">
						<label >校园一卡通</label>
					</div>
					<div class="span5">
						<label class="span12"></label>
					</div>
				</div>
			</div>
		</div>
		<div class="formSep">
			<div class="row-fluid">
			    <div class="span6">
					<div class="span4">
						<label >水电费</label>
					</div>
					<div class="span5">
					    <label class="span12">${(leaveInfo.life.status.name)!"正常"}</label>
					</div>
				</div>
				<div class="span6">
					<div class="span4">
						<label >党团关系</label>
					</div>
					<div class="span5">
						<label class="span12">${(leaveInfo.caucus.handleStatus.name)!"无"}</label>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
