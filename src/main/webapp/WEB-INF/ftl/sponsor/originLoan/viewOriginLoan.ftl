<html>
 <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- My97DatePicker -->
    	<link rel="stylesheet" href="${rc.contextPath}/lib/My97DatePicker/skin/WdatePicker.css" />
		<script type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
		<!-- ajax form-->
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
		<!-- bootstrap-fileupload -->	
		<link rel="stylesheet" href="${rc.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.min.css" />
		<!-- jQuery UI theme-->
        <link rel="stylesheet" href="${rc.contextPath}/lib/jquery-ui/css/Aristo/Aristo.css" />
        <script src="${rc.contextPath}/lib/jquery-ui/jquery-ui-1.8.20.custom.min.js"></script>
		<!-- animated progressbars -->
        <script src="${rc.contextPath}/js/bdp_fileupload.progressbar.js"></script>
		<!-- jquery.validate -->
		<script src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script>
    </head>
<body>
<div id="contentwrapper">
	<div class="main_content">
	 	<h3 class="heading">
			查看生源地助学贷款
	    </h3>
		<form id="originLoanInfoForm" class="form_validation_reg" action="" method="post">
			<input id="id" type="hidden" name="id"  value="${(originLoan.id)!""}">
		   
			<div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>姓名<span class="f_req">*</span></label>
						</div>
					<div class="span9">
						<input id="name" name="name"  value="${(studentInfo.name)!""}" readOnly />
					</div>
				</div>
				<div class="span6">
					<div class="span3">
						<label>身份证号<span class="f_req"></span></label>
					</div>
					<div class="span9">
						<input id="certificateCode" name="certificateCode"  value="${((studentInfo.certificateCode)!"")?html}" readOnly/>
					</div>
				 </div>
			  </div>
		   	</div>
			  
			<div class="formSep"> 
			   <div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>学号<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="stuNumber" name="stuNumber" readOnly value="${(studentInfo.stuNumber)!""}"/>
						</div>
					</div>
					<div class="span6">
						<div class="span3">
							<label>出生年月<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="brithDate" name="brithDate" readOnly  value="${(studentInfo.brithDate)!""}"/>
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
							<input id="college" name="college" readOnly value="${(studentInfo.college.name)!""}"/>
						</div>
					</div>
					<div class="span6">
						<div class="span3">
							<label>专业<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="major" name="major" readOnly  value="${(studentInfo.major.majorName)!""}"/>
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
							<input id="classId" name="class" readOnly value="${(studentInfo.classId.className)!""}"/>
						</div>
					</div>
					<div class="span6">
						<div class="span3">
							<label>性别<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="genderDic" name="genderDic" readOnly value="${(studentInfo.genderDic.name)!""}"/>
						</div>
					</div>
				</div>
			</div> 	
				
			<div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>入学年份<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="enterYear" name="enterYear"  value="${(originLoan.studentInfo.classId.grade)!""}"  readOnly />
						 </div>
					</div>	
					<div class="span6">
						<div class="span3">
							<label>毕业日期<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="" name="graduationDate" class="Wdate "  style="cursor:pointer" 
								onclick="WdatePicker({skin:'whyGreen', dateFmt:'yyyy-MM-dd'});" 
								<#if originLoan?? && originLoan.graduationDate??> value="${(originLoan.graduationDate!"")?string('yyyy-MM-dd')}" </#if>  readOnly />
						</div>
					 </div>
				</div>
			</div>		
					
			<div class="formSep">
				<div class="row-fluid">
					<div class="span6">
					  	<div class="span3">
						  	<label>贷款学年<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<select size="1" id="loanYear" name="loanYear.id" aria-controls="dt_gal" readOnly >
						    	<option value="" />请选择..</option>
								<#if yearList ??>
									<#list yearList as y>
										<#if originLoan?? && originLoan.loanYear ?? && originLoan.loanYear.id == y.id >
											<option  value="${y.id}" selected="selected" />${y.name?html}</option>
										<#else>
											<option value="${y.id}" >${y.name}</option>	
										</#if>
									</#list>
								</#if>
							</select>
						 </div>
					  </div>
					  <div class="span6">
						<div class="span3">
							<label>贷款银行<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="loanBank" name="loanBank" value="${(originLoan.loanBank)!""}" readOnly />
						</div>
					 </div>	
				 </div>	
			  </div>	
				 
			<div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>合同金额<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="contractAmount" name="contractAmount" <#if originLoan?? && originLoan.contractAmount??> value="${(originLoan.contractAmount ! "")?string('0.00')}"</#if> readOnly />
						</div>
					</div>	
					<div class="span6">
						<div class="span3">
							<label>欠缴费用总额<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="paymentAmount" name="paymentAmount" <#if originLoan?? && originLoan.paymentAmount??> value="${(originLoan.paymentAmount !"" )?string('0.00')}" </#if> readOnly />
						</div>
					</div>
				</div>
			</div> 
					
			<div class="formSep">
				<div class="row-fluid">
					
					<div class="span6">
					  	<div class="span3">
						  	<label>贷款次数<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="countLoan" name="countLoan" <#if originLoan?? && originLoan.countLoan??>  value="${(originLoan.countLoan!"")}" </#if> readOnly />
						</div>
					</div>
				</div>
			</div>	 	
					
			
		</form>
			<br/> 		
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
	 
</body>

</html>
