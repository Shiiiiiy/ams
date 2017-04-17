
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
			<#if nationalLoan?? && nationalLoan.id??>
				国家助学贷款信息修改
			<#else>
				国家助学贷款申请
			</#if>
	    </h3>
		 
		<form id="nationalLoanInfoForm" class="form_validation_reg" action="" method="post">
			<input id="id" type="hidden" name="id"  value="${(nationalLoan.id)!""}">
		   
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
						<label>学号<span class="f_req">*</span></label>
					</div>
					<div class="span9">
						<input id="stuNumber" name="stuNumber" readOnly value="${(studentInfo.stuNumber)!""}"/>
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
							<option value="">请选择..</option>
						    	<#if yearList ??>
									<#list yearList as y>
						    			<#if nationalLoan?? && nationalLoan.loanYear?? && nationalLoan.loanYear.id == y.id>
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
							<label>借款金额<span class="f_req">*</span></label>
						</div>
						<div class="span9">
							<input id="loanAmount" name="loanAmount" <#if nationalLoan?? && nationalLoan.loanAmount??> value="${(nationalLoan.loanAmount!'')?string('0.00')}" </#if> />
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
							<input id="studyFee" name="studyFee" <#if nationalLoan?? && nationalLoan.studyFee??>value="${(nationalLoan.studyFee!"")?string('0.00')}" </#if> />
						</div>
					</div>	
					<div class="span6">
						<div class="span3">
							<label>生活费金额<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="livingFee" name="livingFee" <#if nationalLoan?? && nationalLoan.livingFee??> value="${(nationalLoan.livingFee!"")?string('0.00')}" </#if> />
						</div>
					</div>
				</div>
			</div> 
					
			<div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>贷款年限<span class="f_req">*</span></label>
						</div>
						<div class="span9">
							<input id="loanNumYear" name="loanNumYear" value="${(nationalLoan.loanNumYear)!''}"/>
						</div>
					</div>	
					<div class="span6">
					  	<div class="span3">
						  	<label>银行卡类型<span class="f_req">*</span></label>
						</div>
						<div class="span9">
						   <select size="1" id="cardType" name="cardType.id" aria-controls="dt_gal" >
							  <option value="" />请选择..</option>
								<#if cardList ??>
									<#list cardList as d>
										<#if nationalLoan?? && nationalLoan.cardType ?? && nationalLoan.cardType.id==d.id >
											<option  value="${d.id}" selected="selected" />${d.name?html}</option>
										<#else>
											<option value="${d.id}" >${d.name}</option>	
										</#if>
									</#list>
								</#if>
							</select>
						</div>
					</div>
				</div>
			</div>	 	
					
			<div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>银行账号<span class="f_req">*</span></label>
						</div>
						<div class="span6">
							<input id="cardNum" name="cardNum" value="${(nationalLoan.cardNum)!""}"/>
						</div>
					</div>	
					<div class="span6">
						<div class="span3">
							<label>申请日期<span class="f_req">*</span></label>
						</div>
						<div class="span9">
							<input id="applyDate" name="applyDate" class="Wdate "  style="cursor:pointer" 
								onclick="WdatePicker({skin:'whyGreen', dateFmt:'yyyy-MM-dd'});" 
								<#if nationalLoan?? && nationalLoan.applyDate??> value="${(nationalLoan.applyDate!"")?string('yyyy-MM-dd')}" </#if> />
						</div>
					 </div>
				</div>
			</div>		
		</form>
			
		<div class="formSep">
			<div class="row-fluid">					
				<div class="span9">
				    <div class="span2">
						 <label>证明材料<span class="f_req">*</span></label>
					</div>
					<div class="span10" id="_upload_div">
						<form  id="fileUploadForm"  action="" method="post"  enctype="multipart/form-data">
						<!--					    	 
							 <input type="hidden" name="allowedExt" value="jpg,png,img,gif,txt,iso,zip,rar"/>
							 <input type="hidden" name="maxSize" value="2097152000"/> 
							 <input type="hidden" name="isTempFile" value="false"/>
						-->						
							 <div data-fileupload="file" class="fileupload fileupload-new">
									<span class="btn btn-file"><span class="fileupload-new">选择文件</span><input id="file" type="file" name="file" onchange="uploadfile(this)"></span>
							 </div>
							 <div class="upload-alert-message" style="word-break:break-all;">
			        		        文件只支持：jpg,jpeg,png,gif,txt,ppt,rar,zip,doc,docx,xls,xlsx,ppt,pptx,wps,et,dps且大小不超过10MB。
			        		 </div>
							 <#if uploadFileRefList??>	
								<#list uploadFileRefList as p>
									<div class="fileupload-info">
										<a class="close" data-dismiss="alert">×</a>
										<a href="${rc.contextPath}/sys/sysConfig/file.do?id=${p.uploadFile.id}"><strong>${p.uploadFile.name}&nbsp;(${p.uploadFile.fileSize})</strong></a>
										<input type="hidden" id="fileId" name="fileId" value="${p.uploadFile.id}"/>	
									</div>					
								</#list>
							 </#if> 
						</form>	
					</div>
				</div>
			</div>
		</div>
			<br/> 		
				<div class="row-fluid">
					<div class="span6">
				  		<div class="span3">
				  		</div>
						<div class="span9">
				            <button class="btn btn-info" type="button" id="save-button" >保 存</button>
				        	<button class="btn btn-info" type="button" id="submit-button" >提 交</button>
				  			<button class="btn" type="button" onclick="javascript:window.history.back(-1);">取消</button>
					  	</div>
					</div>
				</div>
				
	</div>
</div>
	 
<script>
		
	 	//附件上传方法
		var tag=0;
		function uploadfile(obj){	
			if($("#fileUploadForm .sepH_b").length>0||tag){//创建进度条以及包括页面中存在进度条时候不能再上传，平台只提供一个用户同时只能上传一个文件
				comp.message("同时只能上传一个文件，待上传完成后，再重试。","error");
				return;
			}
			//if($("#fileUploadForm .alert-info strong:contains('"+$(obj).val()+"')").length>0){
			//	comp.message("提交了重复名称的文件请确认检查，如果确认内容重复可以手动删除。","info");
			//}
			
			//验证文件扩展名,该逻辑根据具体业务可自行调整
			var fileName=$(obj).val();
			fileName=fileName.substring(fileName.lastIndexOf("\\")+1,fileName.length);
			
			if(fileName.indexOf(".")>-1){
				var ext=fileName.substring(fileName.lastIndexOf(".")+1,fileName.length).toLowerCase();
				if("doc,docx,xls,xlsx,ppt,pptx,pdf,jpg,png,img,gif,txt,iso,zip,rar,".indexOf(ext+",")<0){
					comp.message("文件上传类型只能是doc,docx,xls,xlsx,ppt,pptx,pdf,jpg,png,img,gif,txt,iso,zip,rar,请重新选择文件。","error");
					return;
				}
			}
			
			tag=1;
			var div=fileupload.create_fileupload_div($("#fileUploadForm"),$(obj).val());
			tag=0;	
			var param="?maxSize=12102400&isTempFile=false";//设置业务文件大小限制上线不能超过10M
			$("#fileUploadForm").attr("action","${rc.contextPath}/sys/sysConfig/singleFileUpload.do"+param);		
			$("#fileUploadForm").ajaxSubmit(function(data){
				
				try{//ie8才能执行如下代码
					data=$(data).unwrap().text();
					}catch(e){//ff chrome浏览器
					}
					
				try{
					var obj=eval(data)[0];				
					if(obj.fileId==''){
						comp.message(obj.errorInfo,"error");
						$(div).remove();
					}else{
						comp.message("上传文件完成。","info");
						$(div).append($("<input>",{						
							type:'hidden',
							val:obj.fileId,
							name:'fileId',
						}));
						$(div).find("div").remove();
						$(div).find("strong").append(("&nbsp;("+obj.fileSize+")"));
						$(div).find("strong").wrapAll("<a href=\"${rc.contextPath}/sys/sysConfig/file.do?id="+obj.fileId+"\"/>");
					}
				}catch(e){
					comp.message("文件提交服务器失败，请稍后刷新页面重试，如果还未成功请联系管理。","error");
				}				
				//下面代码解决重名文件可以连续上传问题，该功能需要根据实际业务进行调整	
				var file=$("#file");
				file.after(file.clone().val(''));
				file.remove();
			});
		}
		
		//页面校验 第一个表单校验
		$("document").ready(function(){
			var data={id: function(){return $("#id").val();}, loanYear: function(){return $("#loanYear").val();}};
			comp.validate.addRemote("loanYearCheck", "${rc.contextPath}/sponsor/nationalLoan/opt-query/loanYearCheck.do", data, "同一学年学生只能申请一次国家助学贷款！");
			$("#nationalLoanInfoForm").compValidate({
				rules:{
					"loanYear.id":{required:true, loanYearCheck:true},
					loanAmount:{required:true, number:true, maxlength:8},
					"studyFee":{required:false, number:true, maxlength:8},
					"livingFee":{required:false, number:true, maxlength:8},
					"loanNumYear":{required:true, maxlength:10 },
					"cardType.id":{required:true},
					"cardNum":{required:true, maxlength:20, number:true},
					"applyDate":{required:true}
				},
				messages:{
					"loanYear.id":{required:'贷款学年不能为空'},
					loanAmount:{required:'借款金额不能为空',  number: "请输入合法的数字", maxlength:'输入长度最多是8位数字' },
					"studyFee":{  number: "请输入合法的数字", maxlength:'输入长度最多是8位数字'},
					"livingFee":{  number: "请输入合法的数字", maxlength:'输入长度最多是8位数字'},
					"loanNumYear":{required:'贷款年限不能为空',   maxlength:'输入长度最多是10的字符串'},
					"cardType.id":{required:'银行卡类型不能为空'},
					"cardNum":{required:'银行账号不能为空',  maxlength:'银行账号不能超过20个数字',  number: "请输入合法的银行账号"},
					"applyDate":{required:'申请日期不能为空'}
				}
			});
		});
		//保存方法
		$("#save-button").click(function() {
		
			if($("#nationalLoanInfoForm").compValid()){
				$("#nationalLoanInfoForm").append($("#fileUploadForm input[name='fileId']"));
				var  fileValidate = $("#nationalLoanInfoForm input[name='fileId']").size();
				if(fileValidate==0){
					comp.message("请上传附件！");
					return false;
				}
				
				$("#nationalLoanInfoForm").attr("action", "${rc.contextPath}/sponsor/nationalLoan/opt-save/saveNationalLoan.do"); 
				$("#nationalLoanInfoForm").attr("method", "post");
				$("#nationalLoanInfoForm").submit();
			}
		});	
			
			
		//提交方法
		$("#submit-button").click(function() {
		
			if($("#nationalLoanInfoForm").compValid()){
				$("#nationalLoanInfoForm").append($("#fileUploadForm input[name='fileId']"));
				var  fileValidate = $("#nationalLoanInfoForm input[name='fileId']").size();
				if(fileValidate==0){
					comp.message("请上传附件！");
					return false;
				}
				
				$("#nationalLoanInfoForm").attr("action", "${rc.contextPath}/sponsor/nationalLoan/opt-save/submitNationalLoan.do"); 
				$("#nationalLoanInfoForm").attr("method", "post");
				comp.confirm("提交信息后不能修改，确认要提交吗？", function(result) {
		        	if(!result) return;
		        	$("#nationalLoanInfoForm").submit();
				 });
			}
		});	
</script>
</body>
</html>
