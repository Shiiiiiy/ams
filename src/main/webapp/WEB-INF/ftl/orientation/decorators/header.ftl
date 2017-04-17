<header>
    <div class="navbar navbar-fixed-top" style="background:#3c7c8c;">
        <div class="navbar-inner">
            <div class="container-fluid">
                <i style="background: url('${rc.contextPath}/img/${_prefix_}logo.png') no-repeat;width:370px;height:40px;display:inline-block; margin:10px 35px 0 10px; float:left"></i>
                <ul class="nav user_menu pull-right">
                    <li class="hidden-phone hidden-tablet">
                        <div class="nb_boxes clearfix">
                            <a data-toggle="dropdown"  data-backdrop="static"  class="label ttip_b" >
                            <span id="Time"></span> <i class="splashy-calendar_week"></i>
                            
                            </a>
                            <span class="dropdown-date">
	                               <font id="roddate"> 
	                               <script type="text/javascript">  
							        function rodDate(){  
							           var date = new Date();
										this.year = date.getFullYear();
										this.month = date.getMonth() + 1;
										this.date = date.getDate();
										this.hour = date.getHours() < 10 ? "0" + date.getHours() : date.getHours();
										this.minute = date.getMinutes() < 10 ? "0" + date.getMinutes() : date.getMinutes();
										//this.second = date.getSeconds() < 10 ? "0" + date.getSeconds() : date.getSeconds();
										var currentTime = this.year + "年" + this.month + "月" + this.date + "日 " + this.hour + ":" + this.minute + " " ;
										roddate.innerHTML=currentTime;  
							            setTimeout("rodDate()",1000);  
							        }  
						        rodDate("rodDate()",1000);  
						      </script>
	                               </font>
	                        </span>
                        </div>
                    </li>
                    <li class="divider-vertical hidden-phone hidden-tablet"></li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown"><#if student_key??>${student_key.name}</#if> <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                        <!--<li><a href="${rc.contextPath}/newstudent/register/editNewStudentInfo.do">个人信息</a></li>
                        <li class="divider"></li>-->
                        <!--<li><a href="javascript:changePassword()">修改密码</a></li>-->
                        <li><a href="${rc.contextPath}/newstudent/register/editPassWord.do">修改密码</a></li>
                        <li class="divider"></li>
                        <li><a href="${rc.contextPath}/newstudent/logout.do">注销</a></li>
                        </ul>
                    </li>
                </ul>
				<a data-target=".nav-collapse" data-toggle="collapse" class="btn_menu">
					<span class="icon-align-justify icon-white"></span>
				</a>
                <nav>
                    <div class="nav-collapse">
                        <ul class="nav">
                            <li id="checkStyle" class="chstyle">
                                <a href="${rc.contextPath}/newstudent/main.do"><i class="icon-xsxx icon-white"></i> 新生信息</a>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
    </div>
    
    <#-- 修改密码弹出框 begin-->
	  <div class="modal hide fade" id="changepasswordbox">
		<div class="modal-header">
			<button class="close" data-dismiss="modal">×</button>
			<h3 id="title1">修改密码</h3>
		</div>
		<div class="modal-body">
			<#--<#include "/user/user/changePassword.ftl">-->
		</div>
		<div class="modal-footer">
			<a href="#" class="btn btn" data-dismiss="modal">取消</a>
			<a href="#" class="btn btn-info" onclick="changePasswordSubmit()">确定</a>
		</div>
	</div>
	<#-- 修改密码弹出框 end-->
    <script>
    $("document").ready(function(){
    	//$("#systemNameSpan").load("${rc.contextPath}/sys/sysConfig/noSecurity/systemName.do",function(){
    	//});
    	var Time=' 星期'+'日一二三四五六'.charAt(new Date().getDay())
		$("#Time").html(Time);
	
    });
    	/*jQuery.validator.addMethod("uwsUnEqualTo", function(value, element, param) {
			var target = $(param);
			//if (this.settings.onfocusout) {
			//	target.unbind(".validate-equalTo").bind("blur.validate-equalTo", function() {
			//		$(element).valid();
			//	});
			//}
			return value != target.val();
		}, "新密码不能与旧密码一致");  
		
		jQuery.validator.addMethod("uwsEqualTo", function(value, element, param) {
			var target = $(param);
			return value == target.val();
		}, "新密码不能与旧密码一致");  */
			
    	function loadSidebar(menuId){
    		$("#asideLeft").load("${rc.contextPath}/security/loadSidebar.do",{"menuId":menuId},function(){
    		var styleid= "checkStyle"+menuId;
    		var styleArray = $("[id^='checkStyle']");
    		for(var i=0;i<styleArray.length;i++){
    			var obj= styleArray[i];
    			$("#"+obj.id+"").removeClass();
    		}
    		$("#"+styleid+"").attr("class","chstyle");
    		loadOutline(menuId);
    		});
    	}
    	function loadOutline(menuId){
    		$("#outline").load("${rc.contextPath}/security/loadOutLine.do",{"menuId":menuId},function(){});
    	}
    	
    	var form_validation_changepassword = $('.form_validation_changepassword').validate({
				onkeyup: false,
				errorClass: 'error',
				validClass: 'valid',
				focusCleanup:true,
				rules:{
						oldpassword:{required:true,rangelength:[8,16]},
						newpassword:{required:true,rangelength:[8,16],uwsUnEqualTo:'#old_password'},
						verifypassword:{required:true,uwsEqualTo:'#new_password',rangelength:[8,16]}
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

    	
    	function changePasswordSubmit(){
    		var checkResult = form_validation_changepassword.form();
	        if(checkResult) submitPassword();
    	}
    	
    	//提交修改密码信息
    	function submitPassword(){
    		var oldp = $("#old_password").val();
    		var newp = $("#new_password").val();
    		var verifyp = $("#verify_password").val();
    		$.post(
    			"${rc.contextPath}/user/user/changePassword.do",
    			{
    				oldpassword:oldp,
    				newpassword:newp,
    				verifypassword:verifyp
    			},
    			function(data){
    				if(data=='success'){
    					comp.hideModal('changepasswordbox');
    					$.sticky("密码修改成功！", {autoclose : 5000, position: "top-right", type: "st-info" });
    				}else if(data=='password_null'){
    					$.sticky("密码不能为空！", {autoclose : 5000, position: "top-right", type: "st-error" });
    				}else if(data=='new_verify_uequal'){
    					$.sticky("新密码与确认密码不一致！", {autoclose : 5000, position: "top-right", type: "st-error" });
    				}else if(data=='password_error'){
    					$.sticky("用户密码不正确！", {autoclose : 5000, position: "top-right", type: "st-error" });
    					$("#old_password").val("");
    					//$("#old_password:focus");
    					document.getElementById("old_password").focus();
    				}else if(data=='update_error'){
    					$.sticky("修改用户密码失败！", {autoclose : 5000, position: "top-right", type: "st-error" });
    				}
    				
    			},
    			"text");
    	}
    	
    	<#-- 修改密码 -->
    	function changePassword(){
	    	$("#userProfileDiv").load("${rc.contextPath}/newstudent/register/nsm/changePassword.do");
			comp.showModal('changepasswordbox');
	 	}
	 	function showProfile(){
	 		$.ajax({
				url:"${rc.contextPath}/user/user/nsm/getUserProfileUUID.do",
				async:false,
				cache: false,
				type: "POST",
				data:{},
				success: function(msg){
			    	$("#userProfileDiv").load("${rc.contextPath}/user/user/nsm/loadUserProfile.do?" + msg,function(){
    				});
    				comp.showModal("userProfileDiv");
			   }
			});
    		
	 	}
    </script>
</header>