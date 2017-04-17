
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
				报到证信息修改
	    </h3>
		 
		<form id="registerForm"  action="${rc.contextPath}/job/register/opt-update/updateRegister.do" method="post">
			<input id="id" type="hidden" name="id"  value="${(register.id)!""}">
		   	<div class="formSep">
			<div class="row-fluid">
				<div class="span6">
					<div class="span3">
						<label>姓名<span class="f_req">*</span></label>
					</div>
					<div class="span9">
						<input id="name" name="name"  value="${(register.student.name)!""}" readOnly />
					</div>
				</div>
				<div class="span6">
					<div class="span3">
						<label>学号<span class="f_req">*</span></label>
					</div>
					<div class="span9">
						<input id="stuNumber" name="stuNumber" readOnly value="${(register.student.stuNumber)!""}" readOnly />
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
					    			<#if register?? && register.employmentYear?? && register.employmentYear.id == y.id>
					    				<option value="${y.id}" selected="selected" />${y.name?html}</option>
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
						<label>报到证编号<span class="f_req">*</span></label>
					</div>
					<div class="span9">
						<input id="registerCode" name="registerCode"  value="${(register.registerCode)!""}" />
					</div>
				 </div>
			</div>
			</div>
			
			<div class="formSep">
			<div class="row-fluid">
				<div class="span6">
					<div class="span3">
						<label>新报到证编号<span class="f_req"></span></label>
					</div>
					<div class="span9">
						<input id="newRegisterCode" readOnly name="newRegisterCode"  value="${(register.newRegisterCode)!""}" />
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
			if(!$("#registerForm").compValid()) return;
			comp.confirm("确认要保存修改之后的信息吗？", function(result) {
            	if(!result)
            		return;  
			  	$("#registerForm").submit();
			}); 
		}
	 
	 
	 	//页面校验 第一个表单校验
		$("document").ready(function(){
		    var data={id:'${(register.id)!""}',employmentYear:function(){return $("#employmentYear").val()},registerCode:function(){return $("#registerCode").val();}};
		    comp.validate.addRemote("registerCodeCheck","${rc.contextPath}/job/register/opt-query/registerCodeCheck.do",data,"该学年下报到证编号已存在，请重新填写！");
			$("#registerForm").compValidate({
				rules:{
					"employmentYear.id" : {required:true},
					"registerCode" : {required:true, maxlength:20,registerCodeCheck:true},
					"newRegisterCode" : {maxlength:20}
				},
				messages:{
					"employmentYear.id" : {required:'学年不能为空'},
					"registerCode" : {required:'报到证编号不能为空',  maxlength:'报到证编号不能超过20个字符'},
					"newRegisterCode" : { maxlength:'新报到证编号不能超过20个字符'}
				}
			});
		});
	 
	 	
	 </script>
	 
	 
</body>
</html>
