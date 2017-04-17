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
					就业协议信息查看
			    </h3>
			</div>
		</div>
		<form id="viewAgreement" class="form_validation_reg" action="" method="post">
			<div class="formSep">
			<div class="row-fluid">
				<div class="span6">
					<div class="span4">
						<label>姓名</label>
					</div>
					<div class="span8">
						<input id="name" name="name"  value="${(agreement.student.name)!""}" readOnly />
					</div>
				</div>
				<div class="span6">
					<div class="span4">
						<label>性别</label>
					</div>
					<div class="span8">
						<input id="stuNumber" name="stuNumber"  value="${(agreement.student.genderDic.name)!""}" readOnly />
					</div>
				</div>
			</div>
			</div>
			
			<div class="formSep">
			<div class="row-fluid">
				<div class="span6">
					<div class="span4">
						<label>学号</label>
					</div>
					<div class="span8">
						<input id="name" name="name"  value="${(agreement.student.stuNumber)!""}" readOnly />
					</div>
				</div>
				<div class="span6">
					<div class="span4">
						<label>学年</label>
					</div>
					<div class="span8">
						<input id="name" name="name"  value="${(agreement.employmentYear.name)!""}" readOnly />
					</div>
				</div>
			</div>
			</div>
			
			<div class="formSep">
			<div class="row-fluid">
				<div class="span6">
					<div class="span4">
						<label>学院</label>
					</div>
					<div class="span8">
						<input id="stuNumber" name="stuNumber" readOnly value="${(agreement.student.college.name)!""}" readOnly />
					</div>
				</div>
				<div class="span6">
					<div class="span4">
						<label>专业</label>
					</div>
					<div class="span8">
						<input id="employmentYear" name="employmentYear" value="${(agreement.student.major.majorName)!""}" readOnly />
					</div>
				</div>
			</div>
			</div>
			
			<div class="formSep">
			<div class="row-fluid">
				<div class="span6">
					<div class="span4">
						<label>班级</label>
					</div>
					<div class="span8">
						<input id="agreementCode" name="agreementCode"  value="${(agreement.student.classId.className)!""}" readOnly/>
					</div>
				</div>
				<div class="span6">
					<div class="span4">
						<label>就业协议书编号</label>
					</div>
					<div class="span8">
						<input id="employmentYear" name="employmentYear" value="${(agreement.agreementCode)!""}" readOnly />
					</div>
				 </div>
			</div>
			</div>
			
			<div class="formSep">
			<div class="row-fluid">
				<div class="span6">
					<div class="span4">
						<label>新就业协议书编号</label>
					</div>
					<div class="span8">
						<input id="agreementCode" name="agreementCode"  value="${(agreement.newAgreementCode)!""}" readOnly/>
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
		  			<button class="btn" type="button" onclick="javascript:window.close()">关 闭</button>
			    	</div>
   				</div>
			</div>
			
	</div>
</div>

</body>
</html>
