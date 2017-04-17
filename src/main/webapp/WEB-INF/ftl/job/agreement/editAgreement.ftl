
<html>
	<head>
    	<meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<!-- jquery.validate -->
		<script src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script>
    </head>
<body>
<div id="contentwrapper">
	<div class="main_content">
	 	<h3 class="heading">
				就业协议信息修改
	    </h3>
		 
		<form id="agreementForm"  action="${rc.contextPath}/job/agreement/opt-update/updateAgreement.do" method="post">
			<input id="id" type="hidden" name="id"  value="${(agreement.id)!""}">
		   <div class="formSep">
			<div class="row-fluid">
				<div class="span6">
					<div class="span3">
						<label>姓名<span class="f_req">*</span></label>
					</div>
					<div class="span9">
						<input id="name" name="name"  value="${(agreement.student.name)!""}" readOnly />
					</div>
				</div>
				<div class="span6">
					<div class="span3">
						<label>学号<span class="f_req">*</span></label>
					</div>
					<div class="span9">
						<input id="stuNumber" name="stuNumber" readOnly value="${(agreement.student.stuNumber)!""}" readOnly />
					</div>
				</div>
			</div>
			</div>
			
			<div class="formSep">
			<div class="row-fluid">
				<div class="span6">
					<div class="span3">
						<label>学年<span class="f_req">*</span></label>
					</div>
					<div class="span9">
						<select size="1" id="employmentYear" name="employmentYear.id" aria-controls="dt_gal" >
					    	<#if yearList ??>
								<#list yearList as y>
					    			<#if agreement?? && agreement.employmentYear?? && agreement.employmentYear.id == y.id>
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
						<label>就业协议书编号<span class="f_req">*</span></label>
					</div>
					<div class="span9">
						<input id="agreementCode" name="agreementCode"  value="${(agreement.agreementCode)!""}" />
					</div>
				 </div>
			</div>
			</div>
			
			<div class="formSep">
			<div class="row-fluid">
				<div class="span6">
					<div class="span3">
						<label>新就业协议书编号<span class="f_req"></span></label>
					</div>
					<div class="span9">
						<input id="newAgreementCode" readOnly name="newAgreementCode"  value="${(agreement.newAgreementCode)!""}" />
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
				            <button class="btn btn-info" type="button" onclick="onSub()" >保存</button>
				  			<button class="btn" type="button" onclick="javascript:window.history.back(-1);">取消</button>
					  	</div>
					</div>
				</div>
				
	</div>
</div>
	 
	 <script>
			 
		function onSub(){
			if(!$("#agreementForm").compValid()) return;
			comp.confirm("确认要保存修改之后的信息？", function(result) {
            	if(!result)
            		return;  
			  	$("#agreementForm").submit();
			}); 
		}
	 
	 
	 	//页面校验 第一个表单校验
		$("document").ready(function(){
		    var data={id:'${(agreement.id)!""}',employmentYear:function(){return $("#employmentYear").val()},agreementCode:function(){return $("#agreementCode").val();}};
		    comp.validate.addRemote("agreementCodeCheck","${rc.contextPath}/job/agreement/opt-query/agreementCodeCheck.do",data,"该学年下就业协议书编号已存在，请重新填写！");
			$("#agreementForm").compValidate({
				rules:{
					"employmentYear.id" : {required:true},
					"agreementCode" : {required:true, maxlength:20,agreementCodeCheck:true},
					"newAgreementCode" : { maxlength:20}
				},
				messages:{
					"employmentYear.id" : {required:'学年不能为空'},
					"agreementCode" : {required:'就业协议书编号不能为空', maxlength:'就业协议书编号不能超过20个字符'},
					"newAgreementCode" : { maxlength:'就业协议书编号不能超过20个字符'},
				}
			});
		});
	 
	 	
	 </script>
	 
	 
</body>
</html>

