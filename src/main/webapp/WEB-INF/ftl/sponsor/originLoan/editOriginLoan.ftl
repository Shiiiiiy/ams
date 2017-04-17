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
			修改生源地助学贷款
	    </h3>
		<form id="originLoanForm" class="form_validation_reg" action="${rc.contextPath}/sponsor/originLoan/opt-update/updateOriginLoan.do" method="post">
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
							<input id="studentInfo.classId.grade" name="studentInfo.classId.grade"  value="${(originLoan.studentInfo.classId.grade)!""}"  readOnly/>
						 </div>
					</div>	
					<div class="span6">
						<div class="span3">
							<label>毕业日期<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="graduationDate" name="graduationDate" class="Wdate "  style="cursor:pointer" 
								onclick="WdatePicker({skin:'whyGreen', dateFmt:'yyyy-MM-dd'});" 
								<#if originLoan?? && originLoan.graduationDate??> value="${(originLoan.graduationDate)?string('yyyy-MM-dd')}" </#if> />
						</div>
					 </div>
				</div>
			</div>		
					
			<div class="formSep">
				<div class="row-fluid">
					<div class="span6">
					  	<div class="span3">
						  	<label>贷款学年<span class="f_req">*</span></label>
						</div>
						<div class="span9">
							<select size="1" id="loanYear" name="loanYear.id" aria-controls="dt_gal" >
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
							<label>贷款银行<span class="f_req">*</span></label>
						</div>
						<div class="span9">
							<input id="loanBank" name="loanBank" value="${(originLoan.loanBank)!''}"/>
						</div>
					 </div>	
				 </div>	
			  </div>	
				 
			<div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>合同金额<span class="f_req">*</span></label>
						</div>
						<div class="span9">
						<#if originLoan?? && originLoan.contractAmount??> 
							<input id="contractAmount" name="contractAmount"  value="${(originLoan.contractAmount ! "")?string('0.00')}" />
						</#if> 
						</div>
					</div>	
					<div class="span6">
						<div class="span3">
							<label>欠缴费用总额<span class="f_req"></span></label>
						</div>
						<div class="span9">
						<#if originLoan?? && originLoan.paymentAmount??>
							<input id="paymentAmount" name="paymentAmount"  value="${(originLoan.paymentAmount!"")?string('0.00')}" onchange="setPayment(this);"/>
						 </#if> 
						</div>
					</div>
				</div>
			</div> 
					
			<div class="formSep">
				<div class="row-fluid">
					
					<div class="span6">
					  	<div class="span3">
						  	<label>贷款次数<span class="f_req">*</span></label>
						</div>
						<div class="span9">
							<input id="countLoan" name="countLoan" <#if originLoan?? && originLoan.countLoan??> value="${(originLoan.countLoan!"")?html}" </#if> />
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
			            <button class="btn btn-info" onclick="javascript:$('#originLoanForm').submit();">保存</button>
			  			<button class="btn" type="button" onclick="javascript:window.history.back(-1);">取消</button>
				  	</div>
				</div>
			</div>
				
	</div>
</div>
	 
<script>
	 
	 	function setPayment(obj){
	 		if(obj.value == ""){
	 			$(obj).val(0.00);
	 		}
	 	}
		//页面校验 第一个表单校验
		$("#originLoanForm").compValidate({
			rules:{
				
				"loanYear.id":{required:true},
				loanBank:{required:true, maxlength:10},
				contractAmount:{required:true, number:true, maxlength:8},
				paymentAmount:{required:false, number:true, maxlength:8},
				countLoan:{required:true, digits:true, maxlength:3}
			},
			messages:{
				"loanYear.id":{required:'贷款学年不能为空'},
				loanBank:{required:'贷款银行不能为空', maxlength:'输入长度过长，最多为长度为10 的字符串'},
				contractAmount:{required:'合同金额不能为空',  number: "请输入合法的数字", maxlength:'输入长度最多是8位数字,小数点记作一位' },
				paymentAmount:{number: "请输入合法的数字", maxlength:'输入长度最多是8位数字，小数点记作一位' },
				countLoan:{required:'贷款次数不能为空', digits: "请输入整数", maxlength:'输入长度最多为3位数字'},
			}
		});
			
	 </script>
</body>
</html>
