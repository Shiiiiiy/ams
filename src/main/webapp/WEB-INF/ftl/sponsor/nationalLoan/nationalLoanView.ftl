<html>
	<head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- jQuery UI theme-->
        <link rel="stylesheet" href="${rc.contextPath}/lib/jquery-ui/css/Aristo/Aristo.css" />
        <script src="${rc.contextPath}/lib/jquery-ui/jquery-ui-1.8.20.custom.min.js"></script>
        <!-- animated progressbars -->
        <script src="${rc.contextPath}/js/bdp_fileupload.progressbar.js"></script>
        <script src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script>
        <!-- ajax form-->
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
		<!-- multiselect -->
	    <link rel="stylesheet" href="${rc.contextPath}/lib/multiselect/css/multi-select.css" />
		<script src="${rc.contextPath}/lib/multiselect/js/jquery.multi-select.min.js"></script>	
    </head>
<body>

<div id="contentwrapper">
<div class="main_content">
 		<div class="row-fluid">
		  	<div class="span12">
		        <h3 class="heading">
					 查看学生国家助学贷款信息
			    </h3>
			</div>
		</div>
	<form id="nationalLoanForm" class="form_validation_reg" action="" method="post">
		<div class="formSep">
			<div class="row-fluid">
				<div class="span6">
					<div class="span3">
						<label>姓名<span class="f_req">*</span></label>
					</div>
					<div class="span9">
					<input id="name" name="name"  value="${(nationalLoan.studentInfo.name)!""}" readOnly />
					</div>
				</div>
						
				<div class="span6">
					<div class="span3">
						<label>身份证号<span class="f_req"></span></label>
					</div>
					<div class="span9">
						<input id="certificateCode" name="certificateCode"  value="${(nationalLoan.studentInfo.certificateCode)!""}" readOnly/>
					</div>
				</div>
		    </div>
		</div>
			  
		<div class="formSep"> 
			<div class="row-fluid">
				<div class="span6">
					<div class="span3">
						<label>性别<span class="f_req"></span></label>
					</div>
					<div class="span9">
						<input id="genderDic" name="genderDic"  value="${(nationalLoan.studentInfo.genderDic.name)!""}" readOnly />
					</div>
				</div>
						
				<div class="span6">
					<div class="span3">
						<label>出生年月<span class="f_req"></span></label>
					</div>
					<div class="span9">
						<input id="brithDate" name="brithDate"  value="${(nationalLoan.studentInfo.brithDate)!""}" readOnly />
					</div>
				</div>
			</div>
		</div>
			   
		<div class="formSep"> 
			   <div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>学院<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="college" name="college" readOnly value="${(nationalLoan.studentInfo.college.name)!""}"/>
						</div>
					</div>
						
					<div class="span6">
						<div class="span3">
							<label>专业<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="major" name="studentInfo.major" readOnly  value="${(nationalLoan.studentInfo.major.majorName)!""}"/>
						</div>
					</div>
				</div>
			</div>   
			   
			<div class="formSep"> 
				<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>班级<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="classId" name="classId" readOnly value="${(nationalLoan.studentInfo.classId.className)!""}"/>
						</div>
					</div>
					
					<div class="span6">
						<div class="span3">
							<label>学号<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="stuNumber" name="stuNumber" readOnly value="${(nationalLoan.studentInfo.stuNumber)!""}"/>
						</div>
					</div>
				</div>
			</div> 		
					
		<div class="formSep">
			<div class="row-fluid">
				<div class="span6">
					<div class="span3">
						<label>学年<span class="f_req"></span></label>
					</div>
					<div class="span9">
						<input id="loanYear" name="loanYear" value="${(nationalLoan.loanYear.name)!""}" readOnly />
					</div>
				</div>
					  
				<div class="span6">
					<div class="span3">
						<label>借款金额<span class="f_req"></span></label>
					</div>
					<div class="span9">
						<input id="loanAmount" name="loanAmount" value="${(nationalLoan.loanAmount!"")?string('0.00')}" readOnly />
					</div>
				</div>
			</div>	
		</div>	
				 
					
		<div class="formSep">
			<div class="row-fluid">
				<div class="span6">
					<div class="span3">
						<label>学费金额<span class="f_req"></span></label>
					</div>
					<div class="span9">
						<input id="studyFee" name="studyFee" <#if nationalLoan?? && nationalLoan.studyFee??> value="${(nationalLoan.studyFee!"")?string('0.00')}" </#if> readOnly />
					</div>
				</div>	
					
				<div class="span6">
					<div class="span3">
						<label>生活费金额<span class="f_req"></span></label>
					</div>
					<div class="span9">
						<input id="livingFee" name="livingFee" <#if nationalLoan?? && nationalLoan.livingFee??> value="${(nationalLoan.livingFee!"")?string('0.00')}" </#if> readOnly />
					</div>
				</div>
			</div>
		</div> 
					
			
		<div class="formSep">
			<div class="row-fluid">
				<div class="span6">
					<div class="span3">
						<label>贷款年限<span class="f_req"></span></label>
					</div>
					<div class="span9">
						<input id="loanNumYear" name="loanNumYear" value="${(nationalLoan.loanNumYear)!''}" readOnly />
					</div>
				</div>	
					
				<div class="span6">
					<div class="span3">
						<label>银行卡类型<span class="f_req"></span></label>
					</div>
					<div class="span9">
						<input id="cardType" name="cardType" value="${(nationalLoan.cardType.name)}" readOnly />
					</div>
				</div>
			</div>
		</div>	 	
					
		<div class="formSep">
			<div class="row-fluid">
				<div class="span6">
					<div class="span3">
						<label>银行账号<span class="f_req"></span></label>
					</div>
					<div class="span6">
						<input id="cardNum" name="cardNum" value="${(nationalLoan.cardNum)!""}" readOnly />
					</div>
				</div>	
				
				<div class="span6">
					<div class="span3">
						<label>申请日期<span class="f_req"></span></label>
					</div>
					<div class="span9">
						<input id="applyDate" name="applyDate" <#if nationalLoan.applyDate??> value="${(nationalLoan.applyDate)?string('yyyy-MM-dd')!''}" </#if> readOnly />
					</div>
				 </div>
			</div>
		</div>	
	</from>
		<div class="formSep">
			<div class="row-fluid">					
				<div class="span9">
					<div class="span2">
						<label>证明材料<span class="f_req"></span></label>
					</div>
					<div class="span10" id="_upload_div">
						<form  id="fileUploadForm"  action="" method="post"  enctype="multipart/form-data">
							<#if uploadFileRefList??>	
								<#list uploadFileRefList as f>
									<div class="fileupload-info">
										<a href="${rc.contextPath}/sys/sysConfig/file.do?id=${f.uploadFile.id}"><strong>${f.uploadFile.name}&nbsp;(${f.uploadFile.fileSize})</strong></a>
									</div>					
								</#list>
							</#if> 
						</form>	
					</div>
				</div>
			</div>
		</div>
		    
			<div class="row-fluid">
				<div class="span6">
		 			<div class="span3">
		  			</div>
		    		<div class="span9">
		  			<button class="btn" type="button" onclick="javascript:window.close()">关闭</button>
			    	</div>
   				</div>
			</div>
		</div>
	</div>
</div>

</body>
</html>
