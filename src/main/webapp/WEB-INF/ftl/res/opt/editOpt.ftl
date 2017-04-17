<html>
<title></title>
<head>
</head>
<body>
	<div id="contentwrapper">
	    <div class="main_content">
	    	<div class="row-fluid">
		   		 <div class="span12">
			    	<h3 class="heading">
						<#if opt?? && opt.id?? >
							修改操作
						<#else>
							新增操作
						</#if>
					</h3>
			    </div>
	    	</div>
		
			<form  id="optForm" class="form_validation_reg" 
			<#if opt?? && opt.id?? >
				action="${rc.contextPath}/res/opt/opt-update/submitOpt.do" 
			<#else>
				action="${rc.contextPath}/res/opt/opt-add/submitOpt.do"
			</#if>
			method="post">
			<#if opt?? && opt.id?? >
			<#else>
				<@token/>
			</#if>
			<input id="id" type="hidden" name="id"  value="${(opt.id)!""}">
					
			<div class="formSep">
				<div class="row-fluid">
					<div class="span8">
						<div class="span2">
							<label>名称 <span class="f_req">*</span></label>
						</div>
						<div class="span10">
							<input id="name" name="name"  value="${(opt.name)!}" />
						</div>
					</div>
				</div>
			</div>
			
			<div class="formSep">
				<div class="row-fluid">
					<div class="span8">
						<div class="span2">
							<label>编码 <span class="f_req">*</span></label>
						</div>
						<div class="span10">
							<input id="code" name="code"  value="${(opt.code)!""}"/>
						</div>
					</div>
				</div>
			</div>	
			
			<div class="span6">
	        	<p class="btnMargin">
	        		<button class="btn btn-info" type="submit">确定</button>
			  		<button class="btn" type="button" onclick="cancel()">取消</button>
				</p>
			</div>
			</form>
		</div>
	</div>
	<script>
		function cancel(){
			window.location.href="${rc.contextPath}/res/opt/opt-query/optList.do";
		}
		function onSub(){
			var check_error=$("#check_error").val();
			if(check_error == "true"){
				$('#optForm').submit();
			}
		}
		$('#optForm').compValidate({
			onkeyup: false,
			onfocusout: function(element) {if ($(element).val()) $(element).valid(); },
			debug:false,
			errorClass: 'error',
			validClass: 'valid',
			focusCleanup:true,
			focusInvalid:false,
			rules: {
				name: { 
					required: true,
					minlength:1,
					maxlength:6,
					uwsnumcharcn:true,
					remote:{
	　　 				type:"POST",
	　　 				url:"${rc.contextPath}/res/opt/opt-query/checkOptByName.do",
	　　 				data:{
	　　 					name:function(){return $("#name").val();},
							id:function(){return $("#id").val();}
	　　 				}
　　 				} 
				},
				code: { 
					required: true,
					minlength:1,
					maxlength:32,
					uwsnumchar:true,
					remote:{
	　　 				type:"POST",
	　　 				url:"${rc.contextPath}/res/opt/opt-query/checkOptByCode.do",
	　　 				data:{
	　　 					code:function(){return $("#code").val();},
							id:function(){return $("#id").val();}
	　　 				}
　　 				} 
				}
			},
			messages: {
				name: {required:$.format("名称不能为空."),remote:$.format("名称已经存在.")},
				code: {required:$.format("编码不能为空."),remote:$.format("编码已经存在.")}
			},
			highlight: function(element) {
				$(element).closest('div').addClass("f_error");
			},
			unhighlight: function(element) {
				$(element).closest('div').removeClass("f_error");
			},
			errorPlacement: function(error, element) {
				$(element).closest('div').append(error);
			}
		});
	        
	 </script>
</body>
</html>
