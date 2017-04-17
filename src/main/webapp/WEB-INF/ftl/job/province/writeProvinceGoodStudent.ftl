<html>
 <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- jQuery UI theme-->
        <link rel="stylesheet" href="${rc.contextPath}/lib/jquery-ui/css/Aristo/Aristo.css" />
        <script src="${rc.contextPath}/lib/jquery-ui/jquery-ui-1.8.20.custom.min.js"></script>
        <!-- animated progressbars -->
        <script src="${rc.contextPath}/js/bdp_fileupload.progressbar.js"></script>
        <script src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script>
        <!-- ajax form-->
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
		<script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
		<!-- bootstrap-fileupload -->	
		<link rel="stylesheet" href="${rc.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.min.css" />
		<!-- multiselect -->
	    <link rel="stylesheet" href="${rc.contextPath}/lib/multiselect/css/multi-select.css" />
		<script src="${rc.contextPath}/lib/multiselect/js/jquery.multi-select.min.js"></script>	
    </head>
<body>
<div id="contentwrapper">
 <div class="main_content">
  <div class="row-fluid">
    <div class="row-fluid">
	   <div class="span12">
	      <h3 class="heading">
				<font color="red" style="text-align:center"><b><#if provinceGoodStudent.schoolGoodStudent?? && provinceGoodStudent.schoolGoodStudent.studentId??>${(provinceGoodStudent.schoolGoodStudent.studentId.name)!""}</#if>同学，恭喜您，您被评选为省级优秀毕业生，请认真填写以下信息！</b></font>
		   </h3>
		  </div>
		 </div> 
		 <input name="errorText" id="errorText" type="hidden" value="${errorText!""}"/>
		  <form  id="editsProvinceGoodStudentForm" class="form_validation_reg" action="${rc.contextPath}/job/queryProvinceGoodStudent/opt-update/saveprovinceGoodStudentInfo.do" method="post"><@token/>
	         <input id="id" type="hidden" name="id"  value="${(provinceGoodStudent.id)!""}">
	         <input name="flag" id="flag" type="hidden"/>
	        <div class="formSep">
				<div class="row-fluid">
				  <div class="span6">
					<div class="span3">
						<label>个人简介<span class="f_req">*</span></label>
					 </div>
					  <div class="span9">
						<#if provinceGoodStudent?? && provinceGoodStudent.resume??>
						    <textarea rows="5" cols="12" id="resume" name="resume" style="width: 775px; height: 200px;">${(provinceGoodStudent.resume!"")}</textarea>
						    </br>
							<font size="1" color="grey"  style="vertical-align:bottom;">(个人简介不超过500字)</font>
						<#else>
						    <textarea rows="5" cols="12" id="resume" name="resume" style="width: 775px; height: 200px;"></textarea>
						    </br>
							<font size="1" color="grey"  style="vertical-align:bottom;">(个人简介不超过500字)</font>
						</#if>	
					</div>
				  </div>
				</div>
			  </div>
			  
			   <div class="formSep">
				<div class="row-fluid">
				  <div class="span6">
					<div class="span3">
						<label>主要事迹<span class="f_req">*</span></label>
					 </div>
					  <div class="span9">
						<#if provinceGoodStudent?? && provinceGoodStudent.mainStory??>
						    <textarea rows="5" cols="12" id="mainStory" name="mainStory" style="width: 775px; height: 200px;">${(provinceGoodStudent.mainStory!"")}</textarea>
						      </br>
							<font size="1" color="grey"  style="vertical-align:bottom;">(主要事迹不超过500字)</font>
						<#else>
						    <textarea rows="5" cols="12" id="mainStory" name="mainStory" style="width: 775px; height: 200px;"></textarea>
						      </br>
							<font size="1" color="grey"  style="vertical-align:bottom;">(主要事迹不超过500字)</font>
						</#if>	
					</div>
				  </div>
				</div>
			  </div>  
		   </form>
		  </div>
       <br/> 
	    <div class="row-fluid">
		 <div class="span6">
		  <div class="span3">
		   </div>
		      <div class="span9">
				    <button class="btn btn-info" type="button" id="save-course" onclick="onSub('0')">保 存</button>
				    <#--><button class="btn btn-info" type="button" id="save-course" onclick="onSub('1')">提 交</button>-->
		  			<button class="btn" type="button" onclick="javascript:window.history.back(-1);">取 消</button>
			  </div>
			</div>
			<input name="check_error" id="check_error" type="hidden" value="true"/>
		</div>
    </div>
  </div>
 </div>
<script>
	
	
	var attachFlag;
	$("document").ready(function(){
		//页面校验
		attachFlag = $(".form_validation_reg").compValidate({
			rules:{     
					resume: {required:true,minlength:1,maxlength:500},
					mainStory: {required:true,minlength:1,maxlength:500}
				
				},
				messages:{
					resume:{required:'个人简历不能为空！',maxlength:'个人简历不能超过500字'},
					mainStory:{required:'主要事迹不能为空！',maxlength:'主要事迹不能超过500字'}
				}
		 });
	});
	
	
	 function onSub(){
	     var check_error=$("#check_error").val();
	     if(check_error == "true"){
	         $('#editsProvinceGoodStudentForm').submit();
	     }
	 }
	 
	  function onSub(status){
	     var check_error=$("#check_error").val();
	     if(check_error == "true"){
	        if(status=='1'){
	           comp.confirm("提交信息后不能修改，确认要提交吗？", function(result) {
                if(!result)
                return; 
	           $("#flag").val("1");
	           $('#editsProvinceGoodStudentForm').submit();
	           });  
	        }else{
	            $("#flag").val("0");
	           $('#editsProvinceGoodStudentForm').submit();
	        }
	     }
	 }
	
   
				
	
</script>
</body>
</html>
