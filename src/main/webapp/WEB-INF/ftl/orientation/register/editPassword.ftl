<!DOCTYPE html>
<html>
<title>新生注册</title>
<head>
	<!-- ajax form-->
	<script src="${rc.contextPath}/js/jquery.form.js"></script>
	
	<!-- multiselect -->
	<link rel="stylesheet"
		href="${rc.contextPath}/lib/multiselect/css/multi-select.css" />
	<script
		src="${rc.contextPath}/lib/multiselect/js/jquery.multi-select.min.js"></script>
	<!--javascript start-->
	
	<!--validata-->
	<script src="${rc.contextPath}/js/jquery.metadata.js"></script>
	<script src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script>
	<script src="${rc.contextPath}/js/myjs_message_cn.js"></script>
	<script src="${rc.contextPath}/js/educommon/educommon.js"></script>
	<script src="${rc.contextPath}/js/educommon/educommon_validate.js"></script>
	
	<!-- sticky messages -->
	<script src="${rc.contextPath}/lib/sticky/sticky.min.js"></script>
		
	<script>
		$("document").ready(function() {
			$("#editPassWorForm").compValidate();
		});
		
		jQuery.validator.addMethod("uwsUnEqualTo", function(value, element, param) {
			var target = $(param);
			return value != target.val();
		}, "新密码不能与旧密码一致");
		
		jQuery.validator.addMethod("uwsEqualTo", function(value, element, param) {
			var target = $(param);
			return value == target.val();
		}, "两次输入密码不一致");
		
		save = function (){
			var vaild = $("#editPassWorForm").valid();
			if(vaild){
				var options ={
					url:"${rc.contextPath}/newstudent/register/saveNewPassword.do",
					type:'post',                    
					data:null,
					success:function(data) {
						if(data.result=="success") {
							comp.message(data.message,"info");
							comp.resetForm('editPassWorForm');
						}else if (data.result=="error_mmbzq"){
							$("#old_password").val('');
							comp.message(data.message,"error");
						}else{
							comp.message(data.message,"error");
						} 
					},dataType:"json"
				};
				$("#editPassWorForm").ajaxSubmit(options);
			}
		}
	</script>
</head>
<body>
	<div id="contentwrapper">
		<div class="main_content">
			<input name="errorText" id="errorText" type="hidden" value="${errorText!" "}"/>
			<h3 class="heading">修改密码</h3>
			<form id="editPassWorForm" class="form_validation_reg" action="${rc.contextPath}/newstudent/register/savePassWord.do" method="post">
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<label>旧密码 <span class="f_req">*</span></label>
							</div>
							<div class="span8">
								<input type="password" name="oldPassWord" value="" maxLength="15" id="old_password" class="{required:true,rangelength:[6,15],messages:{required:'旧密码不能为空'}}">
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<label>新密码 <span class="f_req">*</span></label>
							</div>
							<div class="span8">
								<input type="password" name="newPassWord" value="" maxLength="15" id="new_password" class="{required:true,rangelength:[6,15],uwsUnEqualTo:'#old_password',messages:{required:'新密码不能为空'}}">
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<label>确认密码 <span class="f_req">*</span></label>
							</div>
							<div class="span8">
								<input type="password" value="" name="verifyPassWord" maxLength="15" id="verify_password" class="{required:true,uwsEqualTo:'#new_password',messages:{required:'确认密码不能为空'}}">
							</div>
						</div>
					</div>
				</div>
				<div id="optButtonDiv" class="span6">
					<p class="btnMargin">
						<button class="btn btn-info" type="button" onclick="save();">保存</button>
						<button class="btn" type="button" onclick="comp.resetForm('editPassWorForm');">重置</button>
					</p>
				</div>
			</form>
		</div>
	<div>
</body>
</html>
