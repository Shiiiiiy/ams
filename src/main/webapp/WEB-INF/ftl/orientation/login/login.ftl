<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="${rc.contextPath}/css/new_student_login.css" rel="stylesheet" type="text/css" />
<!--<link href="${rc.contextPath}/css/css.css" rel="stylesheet" type="text/css" />-->

<script src="${rc.contextPath}/js/jquery.min.js"></script>
        <!--[if lt IE 9]>
            <script src="lib/html5shiv/html5.js"></script>
            <script src="lib/flot/excanvas.min.js"></script>
        <![endif]-->

<script src="${rc.contextPath}/js/jquery.cookie.min.js"></script>
<script language="javaScript">
	
	
		function codefocus(){
			clearErrorMessage();
			$("#codeError").html("");
		}
	
		function passWordfocus(){
			clearErrorMessage();
			$("#passWordError").html("");
		}
	
		function registerNofocus(){
		
			//var no = $("#registerNo").val();
			
			//if (no =='证件号')
			//{
				//$("#registerNo").val("");
			//}
			
			clearErrorMessage();
			$("#registerNoError").html("");
			//alert("ww");
			//$("#registerNo").focus();
			//alert($("#registerNo").val());
		}
	
		function clearErrorMessage(){
			if($("#errorMessageDiv").size()!=0){
				//$("#errorMessageDiv").text("");
				$("#errorMessageDiv").remove();
			}
		}
	
	
		function login(){
			clearErrorMessage();
			var registerNo = $("input[name='registerNo']").val();
			var passWord = $("input[name='passWord']").val();
			var authcode = $("input[name='code']").val();
			var charRg = "^[0-9]{4}$";
			var charRe=new RegExp(charRg);
			
			if(registerNo == ''){
				 $("#registerNoError").html("证件号不能为空");
				 passWordfocus();
				 codefocus();
				 return false;
			}
			if(passWord == ''){
				 $("#passWordError").html("密码不能为空");
				 registerNofocus();
				 codefocus();
				 return false;
			}
			if(authcode == ''){
				 $("#codeError").html("验证码不能为空");
				 registerNofocus();
				 passWordfocus();
				 return false;
			}
			if(!charRe.test(authcode)){
				 $("#codeError").html("验证码格式不正确");
				 registerNofocus();
				 passWordfocus();
				 return false;
			}
			//var checkLogin = checkuu && checkp && checkC;
			//将用户名保存到cookie中，有效期为7天
			//$.cookie('_login_registerNo_', $.trim($("input[name='registerNo']").val()),{expires:7});
			//return checkLogin;
		}
		
		$(document).ready(function(){
			var login_registerNo = $.cookie('_login_registerNo_');
			if(login_registerNo){
				$("input[name='registerNo']").val(login_registerNo);
			}
            });
	</script>
</head>
<body>
<div class="wapper">
<div class="header">
<a href="#" class="logo"  </a>

</div>
<div class="main">
<div class="main_cent">
<!--
<div class="main_left">
<ul>
<li>◆ 统一身份认证, 单点登录SSO（Single Sign On）</li>
<li>◆ 统一数据交换,共享公共数据，完整性和一致性</li>
<li>◆ 符合教育资源建设技术规范，开放性和规范性</li>
<li>◆ 整合校园各种应用系统，集成化服务平台</li>
</ul>
</div>
-->
<div class="main_login">
	<form action="${rc.contextPath}/newstudent/loginauth.do" method="post" id="loginform" onsubmit="return login()">
			
			<span style="color:#c62626;margin-left:50px;">
			<span id="registerNoError"></span>
			<span id="passWordError"></span>
			<span id="codeError"></span>
			<#if errorMessage??>
			<span id="errorMessageDiv">${errorMessage}</span>
			<#else>
			</#if>
			</span> 
			 
			
			<p class="iconbg1">
			<input name="" type="text" value="身份证号码" id="rnf"  />
			<input type="text" id="registerNo" name="certificateCode" style="display:none;" value="身份证号码" onfocus="registerNofocus()"  />
			<script type="text/javascript">
                var rnf = document.getElementById("rnf"), 
                registerNo = document.getElementById("registerNo");
                rnf.onfocus = function(){
                if(this.value != "身份证号码") return;
                this.style.display = "none";
                registerNo.style.display = "";
                registerNo.value = "";
                registerNo.focus();
                }
                registerNo.onblur = function(){
                if(this.value != "") return;
                this.style.display = "none";
                rnf.style.display = "";
                rnf.value = "身份证号码";
            }
        </script>
			
			</p>
			
        <p class="iconbg2">
        <!--没输入时 显示为input type=text 当输入密码时 改成type=password -->
        
        
        <input name="" type="text" value="密码默认为身份证号码后六位" id="tx"  />
        <input name="passWord"  type="password" style="display:none;" id="pwd" onfocus="passWordfocus()"  /></p>
        <script type="text/javascript">
                var tx = document.getElementById("tx"), pwd = document.getElementById("pwd");
                tx.onfocus = function(){
                if(this.value != "密码默认为身份证号码后六位") return;
                this.style.display = "none";
                pwd.style.display = "";
                pwd.value = "";
                pwd.focus();
                }
                pwd.onblur = function(){
                if(this.value != "") return;
                this.style.display = "none";
                tx.style.display = "";
                tx.value = "密码默认为身份证号码后六位";
            }
        </script>
        
        <div class="yanz">
        <p class="yzm iconbg3">
        <input name="" type="text" value="验证码" id="codeF"  />
        <input type="text"  value="验证码"  style="display:none;" id="code" name="code" value="验证码" onfocus="codefocus()" /> 
         </p>
         <script type="text/javascript">
                var codeF = document.getElementById("codeF"), 
                code = document.getElementById("code");
                codeF.onfocus = function(){
                if(this.value != "验证码") return;
                this.style.display = "none";
                code.style.display = "";
                code.value = "";
                code.focus();
                }
                code.onblur = function(){
                if(this.value != "") return;
                this.style.display = "none";
                codeF.style.display = "";
                codeF.value = "验证码";
            }
        </script>
         
         <img width="70" height="42" src ="${rc.contextPath}/authcode.do?abc=${coderandom}" id="123" onclick="this.src='${rc.contextPath}/authcode.do?abc='+Math.random()" title="换一张？" style="cursor:pointer;"/><span class="next">换一张？</span>
			 </div>
        <div class="sub"><input class="but" type="submit" name="loading" value="登 录"></div>
	</form>
</div>

</div>
</div>		
<div class="footer">
<p>技术支持 北京联合永道软件股份有限公司</p>
<p>请使用IE8、IE9浏览器，分辨率最低支持1024x768</p>
</div>


</div>
</body>
</html>
