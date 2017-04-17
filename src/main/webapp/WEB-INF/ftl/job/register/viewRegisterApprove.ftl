<html>
	<head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="${rc.contextPath}/css/bdp_comp.css" type="text/css" />
    </head>
<body>

<div id="contentwrapper">
	<div class="main_content">
 		<div class="row-fluid">
		  	<div class="span12">
		        <h3 class="heading">
					报到证改派审核
			    </h3>
			</div>
		</div>
		<form id="approveSingleRegister" class="form_validation_reg"  method="post">
			<input id="id" type="hidden" name="id"  value="${(register.id)!""}">
			
			<div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span4">
							<label>姓名</label>
						</div>
						<div class="span8">
							<input id="stuName" name="stuName"  value="${(register.student.name)!""}" readOnly />
						</div>
					</div>
					<div class="span6">
						<div class="span4">
							<label>学号</label>
						</div>
						<div class="span8">
							<input id="stuNumber" name="stuNumber"  value="${(register.student.stuNumber)!""}" readOnly />
						</div>
					</div>
				</div>
			</div>
			
			<div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span4">
							<label>学年</label>
						</div>
						<div class="span8">
							<input id="employmentYear" name="employmentYear.id"  value="${(register.employmentYear.name)!""}" readOnly />
						</div>
					</div>
					<div class="span6">
						<div class="span4">
							<label>学院</label>
						</div>
						<div class="span8">
							<input id="college" name="college.id" readOnly value="${(register.student.college.name)!""}" readOnly />
						</div>
					</div>
				</div>
			</div>
			
			<div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span4">
							<label>专业</label>
						</div>
						<div class="span8">
							<input id="major" name="major.majorName" value="${(register.student.major.majorName)!""}" readOnly />
						</div>
					</div>
					<div class="span6">
						<div class="span4">
							<label>班级</label>
						</div>
						<div class="span8">
							<input id="classId" name="classId.className"  value="${(register.student.classId.className)!""}" readOnly  />
						</div>
					</div>
				</div>
			</div>
			
			<div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span4">
							<label>人事主管部门名称</label>
						</div>
						<div class="span8">
							<input id="humanDepartment" name="humanDepartment" value="${(register.humanDepartment)!""}" readOnly />
						</div>
					</div>
					<div class="span6">
						<div class="span4">
							<label>就业单位名称</label>
						</div>
						<div class="span8">
							<input id="employmentDepartment" name="employmentDepartment" value="${(register.employmentDepartment)!""}" readOnly />
						</div>
					 </div>
				</div>
			</div>
			
			
			
			<div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span4">
							<label>报到证编号</label>
						</div>
						<div class="span8">
							<input id="registerCode" name="registerCode" value="${(register.registerCode)!""}" readOnly />
						</div>
					</div>
					<div class="span6">
						<div class="span4">
							<label>新报到证编号</label>
						</div>
						<div class="span8">
							<input id="newRegisterCode" name="newRegisterCode" value="${(register.newRegisterCode)!""}" readOnly/>
						</div>
					 </div>
				</div>
			</div>
			
			<div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span4">
							<label>申请补办理由</label>
						</div>
						<div class="span8">
							<textarea style="width:770px;height:134px;" rows="5" cols="12"  id="applyReason" name="applyReason" readOnly>${(register.applyReason)!""}</textarea>
						</div>
					</div>
				</div>
			</div>
			
	</from>
		    <br/>
			<div class="row-fluid">	        
			<div class="span6">
		  		<div class="span4">
		  		</div>
				<div class="span8">
		  			<button class="btn" type="button" onclick="javascript:window.close();">关 闭</button>
			  	</div>
			</div>
			</div>
			
	</div>
</div>

</body>
</html>
