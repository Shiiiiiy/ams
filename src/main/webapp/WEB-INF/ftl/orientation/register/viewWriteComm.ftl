<!DOCTYPE html>
<html>
<title>新生注册</title>
<head>
	<!-- ajax form-->
	<script src="${rc.contextPath}/js/jquery.form.js"></script>
	
	<!--date-->
	<script language="javascript" type="text/javascript"
		src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
	
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
	
	<!-- chosen -->
	<script src="${rc.contextPath}/lib/chosen/chosen.jquery.js"></script>
	<link rel="stylesheet"
		href="${rc.contextPath}/lib/chosen/chosen.css" />
	
	<!-- sticky messages -->
	<script src="${rc.contextPath}/lib/sticky/sticky.min.js"></script>
	
	<!-- animated progressbars -->
	<script src="${rc.contextPath}/js/bdp_fileupload.progressbar.js"></script>
	
	<!-- bootstrap-fileupload -->
	<link rel="stylesheet"
		href="${rc.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.min.css" />
	
	<!--  新生信息采集-->
	<link href="${rc.contextPath}/css/style_new_student.css" rel="stylesheet" type="text/css" />
		
	<style>
		.img-polaroid{padding:4px;background-color:#fff;border:1px solid #ccc;border:1px solid rgba(0,0,0,0.2);-webkit-box-shadow:0 1px 3px rgba(0,0,0,0.1);-moz-box-shadow:0 1px 3px rgba(0,0,0,0.1);box-shadow:0 1px 3px rgba(0,0,0,0.1)}
	</style>
	
	<script>
		//下一页
		function next(){
			window.location.href="${rc.contextPath}/newstudent/register/editNewStudentInfo.do";
		}
	
		
	</script>
</head>
<body>
	<div id="contentwrapper">
		<div class="main_content">
			<input name="errorText" id="errorText" type="hidden" value="${errorText!" "}"/>
			<#--<h3 class="heading">新生信息采集填写说明</h3>-->
			
			
			<div class="wrapper">
    			<h2 class="tit_ins">新生信息采集-填写说明
    			<#--<input type="submit" value="密码修改" class="btn ps1"/>-->
    			</h2>
    			<div class="text_ins">
        		<p class="tx">填写说明：</p>
        			<#if welcomeSet?? >
            			<textarea  readonly="readony">${(welcomeSet.writeComm)!""}</textarea>
            		<#else>
            			<textarea readonly="readony" ></textarea>
            		</#if>
        		
    		</div>
    		<div class="ps2">
     			<input type="submit" value="下一页" name="next" id="next"  class="btn" onclick="next();"/>
    		</div>
		</div>	
			
		</div>
	</div>
	
	
</body>
</html>

