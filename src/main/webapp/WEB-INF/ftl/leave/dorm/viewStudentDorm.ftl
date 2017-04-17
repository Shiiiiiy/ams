<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
<div id="contentwrapper">
   <div class="row-fluid">
   		<input type="hidden" id="studentId" name="studentId" value="${(studentRoom.student.id)!""}">
		<div class="formSep">
			<div class="row-fluid">
				<div class="span6">
					<div class="span3" >
						<label class="span12">姓名</label>
					</div>
					<div class="span5">
						<label class="span12">${(studentRoom.student.name)!""}</label>
					</div>
				</div>
				<div class="span6">
					<div class="span3">
						<label class="control-label">学号 </label>
					</div>
					<div class="span5">
						<label class="span12">${(studentRoom.student.stuNumber)!""}</label>
					</div>
				</div>
			</div>
		</div>
		<div class="formSep">
			<div class="row-fluid">
				<div class="span6">
					<div class="span3">
						<label >学院</label>
					</div>
					<div class="span5">
						    <label class="span12">${(studentRoom.student.college.name)!""}</label>
					</div>
				</div>
				<div class="span6">
					<div class="span3">
						<label >专业</label>
					</div>
					<div class="span5">
						    <label class="span12">${(studentRoom.student.major.majorName)!""}</label>
					</div>
				</div>
			</div>
		</div>
		<div class="formSep">
			<div class="row-fluid">
			    <div class="span6">
					<div class="span3">
						<label >班级</label>
					</div>
					<div class="span5">
					    <label class="span12">${(studentRoom.student.classId.className)!""}</label>
					</div>
				</div>
				<div class="span6">
					<div class="span3">
						<label >宿舍楼</label>
					</div>
					<div class="span5">
					    <label class="span12">${(studentRoom.building.name)!""}-${(studentRoom.room.name)!""}</label>
					</div>
				</div>
			</div>
		</div>
		<div class="formSep">
			<div class="row-fluid">
				<div class="span6">
					<div class="span3">
						<label >身份证号</label>
					</div>
					<div class="span5">
						<label class="span12">${(studentRoom.student.certificateCode)!""}</label>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
