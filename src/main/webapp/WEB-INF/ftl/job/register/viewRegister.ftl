<html>
	<head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    </head>
<body>

<div id="contentwrapper">
	<div class="main_content">
 		<div class="row-fluid">
		  	<div class="span12">
		        <h3 class="heading">
					报到证信息查看
			    </h3>
			</div>
		</div>
		<form id="nationalLoanForm" class="form_validation_reg" action="" method="post">
			<div class="formSep">
			<div class="row-fluid">
				<div class="span6">
					<div class="span3">
						<label>姓名</label>
					</div>
					<div class="span9">
						<input id="name" name="name"  value="${(register.student.name)!""}" readOnly />
					</div>
				</div>
				<div class="span6">
					<div class="span3">
						<label>性别</label>
					</div>
					<div class="span9">
						<input id="stuNumber" name="stuNumber" readOnly value="${(register.student.genderDic.name)!""}" />
					</div>
				</div>
			</div>
			</div>
			
			<div class="formSep">
			<div class="row-fluid">
				<div class="span6">
					<div class="span3">
						<label>学号</label>
					</div>
					<div class="span9">
						<input id="name" name="name"  value="${(register.student.stuNumber)!""}" readOnly />
					</div>
				</div>
				<div class="span6">
					<div class="span3">
						<label>学年</label>
					</div>
					<div class="span9">
						<input id="stuNumber" name="stuNumber" readOnly value="${(register.employmentYear.name)!""}" readOnly />
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
						<input id="name" name="name"  value="${(register.student.college.name)!""}" readOnly />
					</div>
				</div>
				<div class="span6">
					<div class="span3">
						<label>专业</label>
					</div>
					<div class="span9">
						<input id="stuNumber" name="stuNumber" readOnly value="${(register.student.major.majorName)!""}" readOnly />
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
						<input id="registerCode" name="registerCode"  value="${(register.student.classId.className)!""}" readOnly/>
					</div>
				</div>
				<div class="span6">
					<div class="span3">
						<label>报到证编号</label>
					</div>
					<div class="span9">
						<input id="registerCode" name="registerCode"  value="${(register.registerCode)!""}" readOnly/>
					</div>
				 </div>
			</div>
			</div>
			
			
			<div class="formSep">
			<div class="row-fluid">
				<div class="span6">
					<div class="span3">
						<label>新报到证编号</label>
					</div>
					<div class="span9">
						<input id="registerCode" name="registerCode"  value="${(register.newRegisterCode)!""}" readOnly/>
					</div>
				 </div>
			</div>
			</div>
			
			
			
	</from>
		    
	<br/>
	<div class="row-fluid">
		<div class="span6">
 			<div class="span3">
  			</div>
    		<div class="span9">
  			<button class="btn" type="button" onclick="javascript:window.close()">关 闭</button>
	    	</div>
		</div>
	</div>
			
	</div>
</div>

</body>
</html>
