<html>
<title>form elements</title>
<head>
<link rel="stylesheet" href="${rc.contextPath}/lib/multiselect/css/multi-select.css" />
<script src="${rc.contextPath}/lib/multiselect/js/jquery.multi-select.min.js"></script>
</head>
<body>
<div id="contentwrapper">
    <div class="main_content">
    	<div class="row-fluid">
	   		 <div class="span12">
	    	<h3 class="heading"><#if resource?? && resource.id?? >修改<#else>新增</#if>应用代理</h3>
	    	</div>
    	</div>
		
		<div class="tabbable ">
			<ul class="nav nav-tabs">
				<#if resource?? && resource.id?? >
					<li class="active"><a href="#resource_base_info" id="app_proxy_tab" data-toggle="tab">基本信息</a></li>
					<li ><a href="#app_proxy_user_group_id" id="app_proxy_user_group_id_tab" data-toggle="tab" >维护用户组</a></li>
				<#else>
					<li class="active"><a href="#tab1" data-toggle="tab">基本信息</a></li>
					<li ><a href="#app_proxy_user_group_id" id="app_proxy_user_group_id_tab" 
						onclick="disabeOther()" ><span style="color:#CDC9A5">维护用户组</span></a></li>
				</#if>
			</ul>
		
			<!-- 基本信息-->
			<div class="tab-content">
				<div class="tab-pane active" id="resource_base_info">
					<input name="errorText" id="errorText" type="hidden" value="${errorText!""}" />
					<form  id="dicCategoryForm" class="form_validation_reg" 
					<#if resource?? && resource.id?? >
						action="${rc.contextPath}/res/appProxy/opt-update/updateAppProxy.do"
					<#else>
						action="${rc.contextPath}/res/appProxy/opt-add/addAppProxy.do" 
					</#if>
					method="post">
					<#if resource?? && resource.id?? >
					<#else>
						<@token/>
					</#if>
					<input id="id" type="hidden" name="id"  value="${(resource.id)!""}">
								
						<div class="formSep">
							<div class="row-fluid">
								<div class="span8">
									<div class="span3">
										<label>应用名称 <span class="f_req">*</span></label>
									</div>
									<div class="span9">
										<input id="name" name="name"  value="${(resource.name)!""}"/>
									</div>
								</div>
							</div>
						</div>
						<div class="formSep">
							<div class="row-fluid">
								<div class="span8">
									<div class="span3">
										<label>应用编码 <span class="f_req">*</span></label>
									</div>
									<div class="span9">
										<input id="code" name="code"  value="${(resource.code)!""}"/>
									</div>
								</div>
							</div>
						</div>
								
						<div class="formSep">
							<div class="row-fluid">
								<div class="span8">
									<div class="span3">
										<label>url地址 <span class="f_req">*</span></label>
									</div>
									<div class="span9">
										<input id="link" name="link"  value="${(resource.link)!""}" />
									</div>
								</div>
							</div>
						</div>
						
						<div class="formSep">
							<div class="row-fluid">	
								<div class="span8">	
									<div class="span3">
										<label>是否启用统一身份认证<span class="f_req">*</span></label>
									</div>
									<div class="span9">						
										<#if resource?? && resource.authStatus??>
											<label class="radio inline">
													<input type="radio" value="ENABLE" name="authStatus.code"
														<#if resource.authStatus.code=="ENABLE">
														checked="checked"
														</#if>
													/>启用									
											</label>
											<label class="radio inline">									
													<input type="radio" value="DISABLE" name="authStatus.code"
														<#if resource.authStatus.code=="DISABLE">
														checked="checked"
														</#if>
													/>停用							
											</label>
										<#else>
											<label class="radio inline">
													<input type="radio" value="ENABLE" name="authStatus.code"   />启用									
											</label>
											<label class="radio inline">									
													<input type="radio" value="DISABLE" name="authStatus.code"  checked="checked" />停用							
											</label>
										</#if>
									</div>
								</div>
							</div>
						</div>
						
						<div class="formSep">
							<div class="row-fluid">		
								<div class="span8">
									<div class="span3">
										<label>是否启用数据交换<span class="f_req">*</span></label>
									</div>
									<div class="span9">						
										<#if resource?? && resource.exchangeStatus??>
											<label class="radio inline">
													<input type="radio" value="ENABLE" name="exchangeStatus.code"   
														<#if resource.exchangeStatus.code=="ENABLE">
														checked="checked"
														</#if>
													/>启用									
											</label>
											<label class="radio inline">									
													<input type="radio" value="DISABLE" name="exchangeStatus.code" 
														<#if resource.exchangeStatus.code=="DISABLE">
														checked="checked"
														</#if>
													/>停用							
											</label>
										<#else>
											<label class="radio inline">
													<input type="radio" value="ENABLE" name="exchangeStatus.code"  />启用									
											</label>
											<label class="radio inline">									
													<input type="radio" value="DISABLE" name="exchangeStatus.code"  checked="checked"/>停用							
											</label>
										</#if>
									</div>
								</div>
							</div>
						</div>
						
						<div class="formSep">
							<div class="row-fluid">
								<div class="span8">
									<div class="span3">
										<label>WEB服务用户名 <span class="f_req">*</span></label>
									</div>
									<div class="span9">
										<input id="username"  name="username"  value="${(resource.username)!""}" />
									</div>
								</div>
							</div>
						</div>
						
						<div class="formSep">
							<div class="row-fluid">
								<div class="span8">
									<div class="span3">
										<label>WEB服务密码<span class="f_req">*</span></label>
									</div>
									<div class="span9">
										<input id="password" type="password"  name="password"  value="${(resource.password)!""}" />
									</div>
								</div>
							</div>
						</div>
						
						<div class="formSep">
							<div class="row-fluid">
								<div class="span8">
									<div class="span3">
										<label>WEB服务确认密码<span class="f_req">*</span></label>
									</div>
									<div class="span9">
										<input id="confirm_password" type="password"  name="confirm_password"  value="${(resource.password)!""}" />
									</div>
								</div>
							</div>
						</div>
						
						
						<div class="formSep">
							<div class="row-fluid">
								<div class="span8">
									<div class="span3">
										<label>备注</label>
									</div>
									<div class="span9">
										<textarea id="comments" name="comments" cols="12" rows="5" class="span6">${((resource.comments)!"")?html}</textarea>
									</div>
								</div>
							</div>
						</div>
									
						
						<div class="span6">
				        	<p class="btnMargin">
				        		<button class="btn btn-info" type="button" onclick="onSub()">
				         		确定
							</button>
						  	<button class="btn" type="button" onclick="cancel()">返回列表</button>
						</p>
					</div>
					</form>
					<input name="check_error" id="check_error" type="hidden" value="true"/>
				</div>
				
				<div class="tab-pane" id="app_proxy_user_group_id">
						<form  id="appProxyUserGroupForm" 
							action="${rc.contextPath}/res/appProxy/opt-update/updateAppUserGroup.do" method="post">
						<input id="resource_id" name="resourceid" type="hidden"   value="${(resource.id)!""}"  />
						<input id="userGroupIds" name="userGroupIds" type="hidden"   value=""  />
						
						<div class="formSep">
							<div class="row-fluid">
								<div class="span5" id="searchable-form">
										<select name="countries[]" multiple="multiple" id="searchable-select" >
											<#if appProxyUserGroupList??>
												<#if userGroupList??>
													<#list userGroupList as role>
														<#assign flage="false"> 
														<#list appProxyUserGroupList as ur>
															<#if role.id==ur.userGroup.id>
																<#assign flage="true"> 
															</#if>
														</#list>
														<#if flage="true">
															<option value="${role.id}" selected="selected" >${role.name}</option> 
														<#else>
															<option value="${role.id}" >${role.name}</option> 
														</#if>
													</#list>
												</#if>
											<#else>
												<#if userGroupList??>
													<#list userGroupList as role>
														<option value="${role.id}" >${role.name}</option> 
													</#list>
												</#if>
											</#if>
										</select>
								</div>
							</div>
						</div>
						<div class="span6">
				        	<p class="btnMargin">
								<button class="btn btn-info" type="button" onclick="userGroupSub()">确 定</button>
								<button class="btn" type="button" onclick="cancel()">返回列表</button>
							</p>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
<script>

	//保存用户组
	function userGroupSub(){
		var v="";
		$("#searchable-select").each(
			function() {
			if (v != '') { v += ',' } v += $(this).val() }
		);
	    $('#userGroupIds').val(v);
	    $("#appProxyUserGroupForm").submit();
	}

	multiselect = {
		init: function(){
			$('#searchable-form').multiSelect({ 
				selectableHeader : '<input type="text" type="button" value="选择用户组"  style="width:160px" disabled="disabled"/></br><input type="text" id="sh" autocomplete="off" placeholder="搜索" style="width:160px"/>',
				selectedHeader	 : '<input type="text" type="button" value="已选用户组"  style="width:160px" disabled="disabled"/></br><a href="javascript:void(0)" id="sForm_deselect" class="btn">全部移除</a>'
			});
			$('#sForm_deselect').on('click', function(){
				$('#searchable-form').multiSelect('deselect_all');
				return false;
			});
			$('input#sh').quicksearch('#ms-searchable-form .ms-selectable li');
			$('#searchable-form').multiSelect();
		}
	};

	function disabeOther(){
		//$.sticky("请先填写基本信息并点击确定！", {autoclose : 5000, position: "top-right", type: "st-info" });
		comp.message("请先填写基本信息并点击确定！","info");
	}

	function cancel(){
		window.location.href="${rc.contextPath}/res/appProxy/opt-query/appProxyList.do";
	}
	function onSub(){
		var check_error=$("#check_error").val();
		if(check_error == "true"){
			$('#dicCategoryForm').submit();
		}
	}
	
	$("document").ready(function(){
	
		comp.validate.addRule("uwsUrl", function(value, element) {
			var strRegex = "^((https|http|ftp|rtsp|mms)?://)"
			+ "?(([0-9a-zA-Z_!~*'().&=+$%-]+: )?[0-9a-zA-Z_!~*'().&=+$%-]+@)?" //ftp的user@
			+ "(([0-9]{1,3}.){3}[0-9]{1,3}" // IP形式的URL- 199.194.52.184
			+ "|" // 允许IP和DOMAIN（域名）
			+ "([0-9a-zA-Z_!~*'()-]+.)*" // 域名- www.
			+ "([0-9a-zA-Z][0-9a-zA-Z-]{0,61})?[0-9a-zA-Z]." // 二级域名
			+ "[a-zA-Z]{2,6})" // first level domain- .com or .museum
			+ "(:[0-9]{1,4})?" // 端口- :80
			+ "((/?)|" // a slash isn't required if there is no file name
			+ "(/[0-9a-zA-Z_!~*'().;?:@&=+$,%#-]+)+/?)$";
			var re=new RegExp(strRegex);
			return this.optional(element) || (re.test(value));
			}, "url地址格式不正确"); 
			
		comp.validate.addRule("uwscharcheck", function(value, element) {
			value = $.trim(value);
			var charRg = "^[0-9a-zA-Z_]*$";
			var charRe=new RegExp(charRg);
			return this.optional(element) || (charRe.test(value));
			}, "只能包括英文字母、数字和下划线");  
			
		comp.validate.addRule("uwsstringcheck", function(value, element) {
			value = $.trim(value);
			var strRegex = "^[\u0391-\uFFE50-9a-zA-Z_]*$";
			var re=new RegExp(strRegex);
			return this.optional(element) || (re.test(value));
			}, "只能包括中文字、英文字母、数字和下划线");
			
		comp.validate.addRule("uwsrepeatcheck", function(value, element) {
			var optionalval = this.optional(element);
			var returnval;
			$.ajax({
				url:"${rc.contextPath}/res/appProxy/opt-query/codeRepeat.do",
				async:false,
				cache: false,
				type: "POST",
				data:{id:'${(resource.id)!""}',code:value},
				success: function(msg){
			    	returnval = optionalval || (msg=='success');
			   }
			});
			return returnval;
			}, "应用编码重复");
			
	
		$('.form_validation_reg').compValidate({
				rules:{     
						code: {required:true,minlength:1,maxlength:32,uwscharcheck:true,uwsrepeatcheck:true},
						name: {required:true,minlength:1,maxlength:30,uwsstringcheck:true},
						link: {required:true,minlength:1,maxlength:255,uwsUrl:true},
						username: {
							required: true,
							minlength:1,
							maxlength:30,
							uwsnumcharcn:true,
							remote:{
				　　 				type:"POST",
				　　 				url:"${rc.contextPath}/res/appProxy/checkloginUserName.do",
				　　 				data:{
				　　 					name:function(){return $("#username").val();},resourceId:function(){return $("#id").val();}
		　　 						}
	　　 						}
						},
						password:{
							required: true,
							rangelength:[8,16]
						},
						confirm_password:{
							required: true,
							rangelength:[8,16],
							equalTo:"#password"
						},
						comments:{maxlength:500}
					},
					messages:{
						code: {required:'应用编码不能为空'},
						username: {required:$.format("WEB服务用户名不能为空"),remote:$.format("WEB服务用户名已经存在")},
						password: {required:$.format("WEB服务密码不能为空")},
						confirm_password: {required:$.format("WEB服务确认登录密码不能为空"),equalTo:"两次密码输入不一致"},
						name: {required:'应用名称不能为空'},
						link: {required:'url地址不能为空'}
					}
        });
        
        
        if($('#errorText').val()!=""){
        	$.sticky($('#errorText').val(), {autoclose : 5000, position: "top-right", type: "st-error" });
        }
        
        multiselect.init();
        
        <#if tabActive??>
			if("${tabActive}"=="app_proxy_user_group"){
				$('#app_proxy_user_group_id_tab').tab("show");
				$("#app_proxy_user_group_id_tab").parent().attr("class","active");
			}else{
				$('#app_proxy_tab').tab("show");
				$("#app_proxy_tab").parent().attr("class","active");
			}
		</#if>
		
		var saveInfo='${saveInfo!""}';
        if(saveInfo!='')
        	comp.message(saveInfo,"info");
	});
	
	 </script>
</body>
</html>
