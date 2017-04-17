<script>
	$("document").ready(function() {
		$("#editNewStudentFamilyForm").compValidate();
	});
	
	function saveFamily(){
		var vaild = $("#editNewStudentFamilyForm").valid();
		if(vaild){
			var options ={
				url:"${rc.contextPath}/newstudent/register/saveNewStudentFamily.do",
				type:'post',                    
				data:{"newStudent.id":$("#newStudentId").val()},
				success:function(data) {
					if(data.result=="success") {
						comp.message(data.message,"info");
						comp.hideModal("editNewStudentFamilyBox");
						$("#familyInfo").load("${rc.contextPath}/newstudent/register/loadNewStudentFamily.do",{"newStudentId":$("#newStudentId").val()},function(){
				
						});
					}else{
						comp.message(data.message,"error");
					} 
				},dataType:"json"
			};
			$("#editNewStudentFamilyForm").ajaxSubmit(options);
		}
	}
</script>
<form  id="editNewStudentFamilyForm" class="form_validation_reg" method="post">
	<input id="id" type="hidden" name="id" value="${(newStudentFamily.id)!""}">
	<div class="row-fluid">
		<div class="span6">
			<div class="span3">
				<label >姓名 <span class="f_req">*</span></label>
			</div>
			<div class="span7">
				<input id="name" name="name"  value="${(newStudentFamily.name)!""}" 
					class="{required:true,minlength:1,maxlength:30,uwsnumcharcn:true,messages:{required:'姓名不能为空'}}" />
			</div>
		</div>
		<div class="span6">
			<div class="span3">
				<label >关系 <span class="f_req">*</span></label>
			</div>
			<div class="span7">
				<input id="type" name="type"  value="${(newStudentFamily.type)!""}" 
					class="{required:true,minlength:1,maxlength:20,uwsnumcharcn:true,messages:{required:'关系不能为空'}}" />
			</div>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span6">
			<div class="span3">
				<label >手机号码 <span class="f_req">*</span></label>
			</div>
			<div class="span7">
				<input id="phone" name="phone"  value="${(newStudentFamily.phone)!""}" 
					class="{required:true,minlength:11,maxlength:11,uwsnumcharcn:true,messages:{required:'手机号码不能为空'}}" />
			</div>
		</div>
		<div class="span6">
			<div class="span3">
				<label >是否监护人 <span class="f_req">*</span></label>
			</div>
			<div class="span7">
				<select name="isGuardian.id">
					<#if isGuardianList??> 
						<#list isGuardianList as dic>
							<#if newStudentFamily?? && newStudentFamily.isGuardian?? && newStudentFamily.isGuardian.id?? && newStudentFamily.isGuardian.id==dic.id>
								<option selected="selected" value="${dic.id}">${dic.name}</option>
							<#else>
								<option value="${dic.id}">${dic.name}</option>
							</#if>
						</#list> 
					</#if>
				</select>
			</div>
		</div>
	</div>
	
	<div class="row-fluid">
		<div class="span6">
			<div class="span3">
				<label >邮政编码<#--<span class="f_req">*</span>--></label>
			</div>
			<div class="span7">
				<input id="zipCode" name="zipCode"  value="${(newStudentFamily.zipCode)!""}" class="{maxlength:6,uwsnumcharcn:true}" />
				
			</div>
		</div>
		<div class="span6">
			<div class="span3">
				<label >邮箱 <#--<span class="f_req">*</span>--></label>
			</div>
			<div class="span7">
				<input id="mail" name="mail"  value="${(newStudentFamily.mail)!""}" class="{maxlength:30}"/>
			</div>
		</div>
	</div>
	
	<div class="row-fluid">
		<div class="span6">
			<div class="span3">
				<label >通讯地址 <span class="f_req">*</span></label>
			</div>
			<div class="span7">
				<input id="address" name="address"  value="${(newStudentFamily.address)!""}" 
					class="input-xlarge {required:true,minlength:1,maxlength:50,uwsnumcharcn:true,messages:{required:'通讯地址不能为空'}}" />
			</div>
		</div>
	</div>
</form>

