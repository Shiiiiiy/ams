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
	u
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
	
	<!--遮罩层-->
	<link rel="stylesheet" href="${rc.contextPath}/css/waiting.css" />
	<script src="${rc.contextPath}/js/common/mask.js"></script>
		
	<style>
		.img-polaroid{padding:4px;background-color:#fff;border:1px solid #ccc;border:1px solid rgba(0,0,0,0.2);-webkit-box-shadow:0 1px 3px rgba(0,0,0,0.1);-moz-box-shadow:0 1px 3px rgba(0,0,0,0.1);box-shadow:0 1px 3px rgba(0,0,0,0.1)}
	</style>
	
	<script>
		
	
		save = function (type) {
			var valid = $('#editNewStudentInfoForm').valid();
			
			var file = $("#coverImgUploadForm input[name='coverImgFileId']");
			
			var fileGreen = $("#greenImgUploadForm input[name='greenImgFileId']");
			
			//alert(fileGreen.val());
			
			var greenApp = $('input:radio[name="greenApplyStatus"]:checked').val();
			
			//alert(greenApp);
			
			var validFlag = true;
			if(file.val()==''){
				$("#fileError").remove();
				$(".fileupload").after("<label id='fileError' for='file' generated='true' class='error'>学籍照片不能为空</label>");
				$("#_upload_div").addClass("f_error");
				validFlag = false;
			}if($("#telephone").val()==''&&$("#homephone").val()==''){
				$("#telephone").after("<label id='telephoneError' for='telephone' generated='true' class='error'>手机号码、电话号码至少保证一项不为空</label>");
				$("#phoneDiv").addClass("f_error");
				validFlag = false;
			}if(fileGreen.val()=='' && greenApp=='1'){
				$("#fileGreenError").remove();
				//$(".fileupload").after("<label id='fileGreenError' for='file' generated='true' class='error'>绿色通道申请照片不能为空</label>");
				$("#fileLoadGreen").after("<label id='fileGreenError' for='file' generated='true' class='error'>绿色通道申请照片不能为空</label>");
				$("#_upload_div_green").addClass("f_error");
				validFlag = false;
			}
			if(valid && validFlag){
				if(type=='subt'){
					$.ajax({
						url:"${rc.contextPath}/newstudent/register/checkNewStudentFamily.do",
						async:false,
						cache: false,
						type: "POST",
						data:{"newStudentId":$("#newStudentId").val()},
						success: function(data){
							if(data.result=="success") {
								comp.confirm("提交后信息将不能修改，确认要提交吗？",function(result){
									if(!result)
										return;
									$("#type").val('subt');
									$("#editNewStudentInfoForm").append($("#coverImgUploadForm input[name='coverImgFileId']"));
									//绿色通道
									$("#editNewStudentInfoForm").append($("#greenImgUploadForm input[name='greenImgFileId']"));
									
									//遮罩
									mask.showShade();
									
									$('#editNewStudentInfoForm').submit();
								});
							}else{
								comp.message(data.message,"error");
							} 
						},dataType:"json"
					});
				}else{
					$("#editNewStudentInfoForm").append($("#coverImgUploadForm input[name='coverImgFileId']"));
					//绿色通道
					$("#editNewStudentInfoForm").append($("#greenImgUploadForm input[name='greenImgFileId']"));
					
					//遮罩
					mask.showShade();
					
					$('#editNewStudentInfoForm').submit();
				}
			}
		}
	
		//初始化
		$("document").ready(function() {
			$("#editNewStudentInfoForm").compValidate();
			//判断如果采集状态是提交状态，则改为可读
			if('${(newStudent.collectState)!''}'=='1' ){
				//$("#editNewStudentInfoForm input").attr("disabled",true);
				//$("#editNewStudentInfoForm select").attr("disabled",true);
			}
			
			
			//判断当前时间是否在学校设定的范围内
			if('${(isScope)!''}'!='1' ){
			
				comp.message('${(isScope)!''}',"error");
				
				$("#editNewStudentInfoForm input").attr("disabled",true);
				$("#editNewStudentInfoForm select").attr("disabled",true);
				
			}else{
				if('${(newStudent.collectState)!''}'=='1' ){
				
					comp.message("您的信息已经提交了,在开放时间内还可以进行修改,修改后点击'上一页'、'保存'或'下一页'按钮都可以！","info");
				}
				
			}
			
			
		});
		
		var tag=0;
		uploadCoverImg = function (obj){
			if($("#coverImgUploadForm .sepH_b").length>0||tag){//创建进度条以及包括页面中存在进度条时候不能再上传，平台只提供一个用户同时只能上传一个文件
				comp.message("同时只能上传一个文件，待上传完成后，再重试。","error");
				return;
			}
			/**验证文件扩展名,该逻辑根据具体业务可自行调整*/
			var fileName=$(obj).val();
			fileName=fileName.substring(fileName.lastIndexOf("\\")+1,fileName.length);
			
			if(fileName.indexOf(".")>-1){
				var ext=fileName.substring(fileName.lastIndexOf(".")+1,fileName.length);
				if("jpg,png,img,gif,".toLowerCase().indexOf(ext.toLowerCase())<0){
					comp.message("文件上传类型只能是jpg,png,img,gif等图片类型,请重新选择文件。","error");
					return;
				}
			}
			var param="?maxSize=2097152&isTempFile=false";//设置业务文件大小限制上线不能超过2m
			$("#coverImgUploadForm").attr("action","${rc.contextPath}/newstudent/register/singleFileUpload.do"+param);
			$("#coverImgUploadForm").ajaxSubmit(function(data){
				try{//ie8才能执行如下代码
					data=$(data).unwrap().text();
				}catch(e){//ff chrome浏览器
					
				}
				try{
					var obj=eval(data)[0];
					if(obj.fileId==''){
						comp.message(obj.errorInfo,"error");
					}else{
						comp.message("学籍照片上传文件完成。","info");
						$("#fileError").remove();
						$("#coverImgFileId").val(obj.fileId);
						if($("#coverImg").length==0){
							$("#divImg").after("<img id='coverImg' src='' class='img-polaroid' width='140px' height='160px'/>")
						}
						$("#coverImg").attr("src","${rc.contextPath}/newstudent/register/file.do?id="+obj.fileId);
					}
				}catch(e){
					comp.message("文件提交服务器失败，请稍后刷新页面重试，如果还未成功请联系管理。","error");
				}
			});
		}
		
		//绿色通道的照片上传
		var tagGreen=0;
		uploadGreenImg = function (obj){
			if($("#greenImgUploadForm .sepH_b").length>0||tagGreen){//创建进度条以及包括页面中存在进度条时候不能再上传，平台只提供一个用户同时只能上传一个文件
				comp.message("同时只能上传一个文件，待上传完成后，再重试。","error");
				return;
			}
			/**验证文件扩展名,该逻辑根据具体业务可自行调整*/
			var fileName=$(obj).val();
			fileName=fileName.substring(fileName.lastIndexOf("\\")+1,fileName.length);
			
			if(fileName.indexOf(".")>-1){
				var ext=fileName.substring(fileName.lastIndexOf(".")+1,fileName.length);
				if("jpg,png,img,gif,".toLowerCase().indexOf(ext.toLowerCase())<0){
					comp.message("文件上传类型只能是jpg,png,img,gif等图片类型,请重新选择文件。","error");
					return;
				}
			}
			var param="?maxSize=2097152&isTempFile=false";//设置业务文件大小限制上线不能超过2m
			$("#greenImgUploadForm").attr("action","${rc.contextPath}/newstudent/register/singleFileUpload.do"+param);
			$("#greenImgUploadForm").ajaxSubmit(function(data){
				try{//ie8才能执行如下代码
					data=$(data).unwrap().text();
				}catch(e){//ff chrome浏览器
					
				}
				try{
					var obj=eval(data)[0];
					if(obj.fileId==''){
						comp.message(obj.errorInfo,"error");
					}else{
						comp.message("绿色通道申请照片上传文件完成。","info");
						$("#fileGreenError").remove();
						$("#greenImgFileId").val(obj.fileId);
						if($("#coverImgGreen").length==0){
							$("#divImgGreen").after("<img id='coverImgGreen' src='' class='img-polaroid' width='140px' height='160px'/>")
						}
						$("#coverImgGreen").attr("src","${rc.contextPath}/newstudent/register/file.do?id="+obj.fileId);
					}
				}catch(e){
					comp.message("文件提交服务器失败，请稍后刷新页面重试，如果还未成功请联系管理。","error");
				}
			});
		}
		
		
		//上一页
		function up(){
			window.location.href="${rc.contextPath}/newstudent/register/viewWriteComm.do";
		}
		
		//保存提交处理
		function submitSave(type){
		
			//处理的方式(上一页、下一页、保存)
			$('#type').val(type);
			
			//不用保存直接跳转到上一页upGo
			if(type =="upGo"){
				window.location.href="${rc.contextPath}/newstudent/register/viewWriteComm.do";
				
				return;
			}
			
			//不用保存直接跳转到下一页upGo
			if(type =="nextGo"){
				window.location.href="${rc.contextPath}/newstudent/register/editGuardian.do";
				return;
			}
			
			//当没有进行信息采集时对保存和上一页时才不做验证
			if('${(newStudent.collectState)!''}'!='1' ){
			
			if(type =="save" || type =="up" ){
			
				//汉语拼音验证取消
				$('#namePy').attr("class","inp1 cancel");
				
				//民族验证取消
				$('#national').attr("class","select1 cancel");
				
				//籍贯验证取消
				$('#nativeDic').attr("class","select1 cancel");
				
				//户口类别验证取消
				$('#addressTypeDic').attr("class","select1 cancel");
				
				//家庭地址验证取消
				$('#homeAddress').attr("class","inp1 cancel");
				
				//手机号码1验证取消
				$('#phone1').attr("class","inp1 cancel");
				
				//手机号码2验证取消
				$('#phone2').attr("class","inp1 cancel");
				
				//QQ号码验证取消
				$('#qq').attr("class","inp1 cancel");
				
				//电子邮箱验证取消
				$('#email').attr("class","inp1 cancel");
				
				//银行卡号验证取消
				//$('#bankCode').attr("class","inp1 cancel");
				
				//政治面貌验证取消
				$('#politicalDic').attr("class","select1 cancel");
				
				//出生日期验证取消
				$('#brithday').attr("class","inp1 cancel");
				
				//户口地址验证取消
				$('#nativeAdd').attr("class","inp1 cancel");
				
				//家庭邮编验证取消
				$('#homePostCode').attr("class","inp1 cancel");
				
				//婚姻状况验证取消
				$('#marriageDic').attr("class","select1 cancel");
				
				//健康状况验证取消
				$('#healthStateDic').attr("class","select1 cancel");
				
				//血型验证取消
				$('#creed').attr("class","select1 cancel");
				
				
			}
			
			}
			
			
			//遮罩
			mask.showShade();
			
			//from 提交
			$('#editNewStudentInfoForm').submit();
			
			//window.location.href="${rc.contextPath}/newstudent/register/editGuardian.do";
		}
	</script>
</head>
<body>

<#include "/decorators/mask.ftl">
	<div id="contentwrapper">
		<div class="main_content">
			<div class="wrapper">
    <h2 class="tit_ins">新生信息采集-基本信息</h2>
    
    <div class="text_ins wid">
    <input name="errorText" id="errorText" type="hidden" value="${errorText!" "}"/>
    <form id="editNewStudentInfoForm" class="form_validation_reg" action="${rc.contextPath}/newstudent/register/saveNewStudentInfo.do" method="post">
				<input id="newStudentId" type="hidden" name="id" value="${(newStudent.id)!""}">
				<input id="status" type="hidden" name="status" value="${(newStudent.status)!""}">
				<input id="type" type="hidden" name="type" />
				
    	<div class="infoL">
        	 <div class="info">
        	 	<span class="q1">姓名</span>
            
            	<input type="text"  id="name"  class="inp1" disabled name="name" disabled value="${(newStudent.name)!""}"/>
            </div>
            
        	
           <div class="info"><span class="q1">性别</span>
           
           		<#if newStudent ?? && newStudent.genderDic?? >
					<input type="text"  id="T2"  class="inp1" disabled  name="genderDic.id"  value="${(newStudent.genderDic.name)!""}"/>
				<#else>
					<input type="text"  id="T2"  class="inp1" disabled  name="genderDic.id"  value=""/>
				</#if>
            
            </div>
            
            <div class="info"><span class="q1">毕业学校</span>
            
            	<input type="text"  id="T2"  class="inp1" disabled name="graduation"  value="${(newStudent.graduation)!""}"/>
            </div>
            
             <div class="info">
        	 	<span class="q1">学院</span>
        	 	
            	<#if newStudent ?? && newStudent.college?? >
            		<input type="text"  id="T2" disabled class="inp1" name=""  value="${(newStudent.college.name)!""}"/>
            	<#else>
            		<input type="text"  id="T2" disabled class="inp1" name=""  value=""/>
            	
            	</#if>
            </div>
            
        	
           <div class="info"><span class="q1">班级</span>
            
            	<#if newStudent ?? && newStudent.major?? >
					<input type="text"  id="T2"  class="inp1"  disabled name="classId.id"  value="${(newStudent.classId.className)!""}"/>
				<#else>
						<input type="text"  id="major"  class="inp1" disabled  name="major.id"  value=""/>
				</#if>
            </div>
            
            <div class=""><span class="q1">姓名汉语拼音<span class="f_req">*</span></span>
            
            	<input type="text"  id="namePy"   maxlength="50" name="namePy"  value="${(newStudent.namePy)!""}" style='margin-top:8px;margin-bottom:5px;'  class="inp1 {required:true,minlength:1,maxlength:50,messages:{required:'姓名汉语拼音不能为空'}}"/>
            </div>
           
           <div class="info">
        	 	<span class="q1">曾用名</span>
            
            	<input type="text"  id="oldName"   maxlength="10" class="inp1" name="oldName"  value="${(newStudent.oldName)!""}"/>
            </div>
            
        	
           <div class="" ><span class="q1" >民族 </span>
            
            	<select id="national" name="national" style='margin-top:8px;margin-bottom:5px;' disabled class="select1 {required:true,minlength:1,maxlength:20,messages:{required:'民族不能为空'}}">
            		<option value="">请选择...</option>
									<#if nationalList??>
										<#list nationalList as national>
											<#if newStudent?? && newStudent.national?? && newStudent.national==national.name>
												<option selected="selected" value="${national.name}">${national.name}</option>
											<#else>
												<option value="${national.name}">${national.name}</option>
											</#if>
										</#list>
									</#if>
								</select>
            </div>
            
            <div class="" ><span class="q1">籍贯 <span class="f_req">*</span></span>
            
            	<select id="nativeDic" name="nativeDic.id" style='margin-top:8px;margin-bottom:5px;' class="select1 {required:true,minlength:1,maxlength:20,messages:{required:'籍贯不能为空'}}">
            		<option value="">请选择...</option>
									<#if nativeList??>
										<#list nativeList as native>
											<#if newStudent.nativeDic?? && newStudent.nativeDic.id?? && newStudent.nativeDic.id==native.id>
												<option selected="selected" value="${native.id}">${native.name}</option>
											<#else>
												<option value="${native.id}">${native.name}</option>
											</#if>
										</#list>
									</#if>
								</select>
            </div>
            
            <div class=""><span class="q1">户口类别 <span class="f_req">*</span></span>
            
            	<select id="addressTypeDic" name="addressTypeDic.id" style='margin-top:8px;margin-bottom:5px;' class="select1 {required:true,minlength:1,maxlength:20,messages:{required:'户口类别不能为空'}}">
            		<option value="">请选择...</option>
									<#if nativeList??>
										<#list accountList as account>
											<#if newStudent.addressTypeDic?? && newStudent.addressTypeDic.id?? && newStudent.addressTypeDic.id==account.id>
												<option selected="selected" value="${account.id}">${account.name}</option>
											<#else>
												<option value="${account.id}">${account.name}</option>
											</#if>
										</#list>
									</#if>
								</select>
            </div>
            
            <div class="">
        	 	<span class="q1">家庭地址 <span class="f_req">*</span></span>
            
            	<input type="text"  id="homeAddress"  maxlength="40"  style='margin-top:8px;margin-bottom:5px;' class="inp1 {required:true,minlength:1,maxlength:20,messages:{required:'家庭地址不能为空'}}" name="homeAddress"  value="${(newStudent.homeAddress)!""}"/>
            </div> 
            
            <div class="info">
        	 	<span class="q1">家庭电话</span>
            
            	<input type="text"  id="homeTel"  maxlength="15"  class="inp1" name="homeTel"  value="${(newStudent.homeTel)!""}"/>
            </div> 
            
            <div class=""><span class="q1">手机号码1 <span class="f_req">*</span></span>
            	<input type="text"  id="phone1"  maxlength="11" style='margin-top:8px;margin-bottom:5px;' class="inp1 {required:true,digits:true,minlength:1,maxlength:20,messages:{digits:'手机号码应该是正整数的数字',required:'手机号码1不能为空'}}" name="phone1"  value="${(newStudent.phone1)!""}"/>
            </div>
            
            <div class=""><span class="q1">QQ号码</span>
            	<input type="text"  id="qq"  name="qq"  maxlength="15"  value="${(newStudent.qq)!""}" style='margin-top:8px;margin-bottom:5px;' class="inp1 {digits:true,messages:{digits:'QQ号码应该正整数的数字'}}"/>
            </div>
            
             <div class=""><span class="q1">血型 <span class="f_req">*</span></span>
            
            	<select id="creed" name="bloodTypeDic.id" style='margin-top:8px;margin-bottom:5px;' class="select1 {required:true,messages:{required:'血型不能为空'}}">
									<option value="">请选择...</option>
									<#if bloodTypeList??> 
										<#list bloodTypeList as bloodType>
											<#if newStudent.bloodTypeDic?? && newStudent.bloodTypeDic.id?? && newStudent.bloodTypeDic.id==bloodType.id>
												<option selected="selected" value="${bloodType.id}">${bloodType.name}</option>
											<#else>
												<option value="${bloodType.id}">${bloodType.name}</option>
											</#if>
										</#list> 
									</#if>
								</select>
            </div>
            
            <#--<div class="info"><span class="q1">入党申请 </span>
            	<span class="xb">
            		<#if newStudent?? && newStudent.partyApp?? && newStudent.partyApp=='1'  >
						<input type="radio" value="1" name="partyApp" checked="checked" class="" />&nbsp;是&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio" value="0" name="partyApp"	class="" />&nbsp;否 
					<#else>					
						<input type="radio" value="1" name="partyApp"  class="" />&nbsp;是&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" value="0" name="partyApp" checked="checked"	class="" />&nbsp;否 
					</#if>
            		</span>
            	
            	</div>-->
            	
            	 <div class="info"><span class="q1">港澳台侨外</span>
            		<select id="creed" name="overChineseDic.id" class="select1">
									<option value="">请选择...</option>
									<#if overChineseList??> 
										<#list overChineseList as over>
											<#if newStudent.overChineseDic?? && newStudent.overChineseDic.id?? && newStudent.overChineseDic.id==over.id>
												<option selected="selected" value="${over.id}">${over.name}</option>
											<#else>
												<option value="${over.id}">${over.name}</option>
											</#if>
										</#list> 
									</#if>
								</select>
            	</div>
            	
            	<#--<div class="">
            		<span class="q1">银行卡号  <span class="f_req">*</span></span>
            		<input type="text"  id="bankCode" maxlength="19" style='margin-top:8px;margin-bottom:5px;' class="inp1 {required:true,digits:true,minlength:1,maxlength:20,uwsnumcharcn:true,messages:{required:'银行卡号不能为空',digits:'银行卡号应该是正整数的数字'}}" name="bankCode"  value="${(newStudent.bankCode)!""}"/>
            	</div>-->
            
        </div>
        <div class="infoR">
        	<div class="info"><span class="q1">学号</span>
            
            	<input type="text"  id="stuNumber"  class="inp1" disabled name="stuNumber"  value="${(newStudent.stuNumber)!""}"/>
            </div>
            
        	
           <div class="info"><span class="q1">证件号码</span>
            
            	<input type="text"  id="certificateCode"  class="inp1" disabled  name="certificateCode"  value="${(newStudent.certificateCode)!""}"/>
            </div>
            
            <div class="info"><span class="q1">录取总分</span>
            
            	<input type="text"  id="enterScore"  class="inp1" disabled name="enterScore"  value="${(newStudent.enterScore)!""}"/>
            </div>
            
            <div class="info"><span class="q1">专业</span>
            	<#if newStudent ?? && newStudent.major?? >
					<input type="text"  id="major"  class="inp1" disabled name="major.id"  value="${(newStudent.major.majorName)!""}"/>
				<#else>
						<input type="text"  id="major"  class="inp1" disabled  name="major.id"  value=""/>
				</#if>
            	
            </div>
            
        	
           <div class="info"><span class="q1">宿舍</span>
            
            	<input type="text"  id="dorm"  class="inp1" disabled name="dorm"  value="${(newStudent.dorm)!""}"/>
            </div>
            
            <div class="info"><span class="q1">英文名</span>
            
            	<input type="text"  id="englishName"  maxlength="50" class="inp1" name="englishName"  value="${(newStudent.englishName)!""}"/>
            </div>
            
             <div class=""><span class="q1">政治面貌 <span class="f_req">*</span></span>
            
            	<select id='politicalDic' name="politicalDic.id" style='margin-top:8px;margin-bottom:5px;' class="select1 {required:true,messages:{required:'政治面貌不能为空'}}">
									<option value="">请选择...</option>
									<#if politicalList??> 
										<#list politicalList as political>
											<#if newStudent.politicalDic?? && newStudent.politicalDic.id?? && newStudent.politicalDic.id==political.id>
												<option selected="selected" value="${political.id}">${political.name}</option>
											<#else>
												<option value="${political.id}">${political.name}</option>
											</#if>
										</#list> 
									</#if>
								</select>
            </div>
            
        	
           <div class="info"><span class="q1">宗教信仰</span>
            
            	<select id="creed" name="creed.id" class="select1">
									<option value="">请选择...</option>
									<#if creedList??> 
										<#list creedList as creed>
											<#if newStudent.creed?? && newStudent.creed.id?? && newStudent.creed.id==creed.id>
												<option selected="selected" value="${creed.id}">${creed.name}</option>
											<#else>
												<option value="${creed.id}">${creed.name}</option>
											</#if>
										</#list> 
									</#if>
								</select>
            </div>
            
            <div class=""><span class="q1">出生日期 </span>
            
            	<input  disabled onclick="WdatePicker({dateFmt:'yyyy-MM-dd',skin:'whyGreen',isShowWeek:true,maxDate:'%y-%M-%d'});"
									type="text" id="brithday"
									value="${(newStudent.brithDate?date)!""}"  name="brithDateStr" style='margin-top:8px;margin-bottom:5px;' 
									class="inp1 Wdate {required : true,messages : {required : '出生日期不能为空'}}" />
            </div>
            
            <div class=""><span class="q1">户口地址 <span class="f_req">*</span></span>
            	<input type="text"  id="nativeAdd"  name="nativeAdd"  maxlength="40" value="${(newStudent.nativeAdd)!""}" style='margin-top:8px;margin-bottom:5px;' class="inp1 {required:true,messages:{required:'户口地址不能为空'}}"/>
            </div>
            
            <div class=""><span class="q1">家庭邮编 <span class="f_req">*</span></span>
            	<input type="text"  id="homePostCode"   name="homePostCode"  maxlength="10"  value="${(newStudent.homePostCode)!""}" style='margin-top:8px;margin-bottom:5px;' class="inp1 {required:true,digits:true,messages:{required:'家庭邮编不能为空',digits:'家庭邮编应该是正整数的数字'}}"/>
            </div>
            
            <div class=""><span class="q1">电子邮箱 </span>
            	<input type="text"  id="email"  name="email"  maxlength="50" value="${(newStudent.email)!""}" style='margin-top:8px;margin-bottom:5px;' class="inp1 {email:true,messages:{email:'电子邮箱格式不正确'}}"/> 
            </div>
            
            <div class=""><span class="q1">手机号码2</span>
            	<input type="text"  id="phone2"   name="phone2"  maxlength="11"  value="${(newStudent.phone2)!""}" style='margin-top:8px;margin-bottom:5px;' class="inp1 {digits:true,uwsnumcharcn:true,messages:{digits:'手机号码应该是正整数的数字'}}"/>
            </div>
            
             <#--<div class="info"><span class="q1">网络URL地址</span>
            	<input type="text"  id="urlStr"  class="inp1" name="urlStr"  maxlength="100"  value="${(newStudent.urlStr)!""}"/>
            </div>-->
            
            <div class=""><span class="q1">婚姻状况 <span class="f_req">*</span></span>
            
            	<select id="marriageDic" name="marriageDic.id"  style='margin-top:8px;margin-bottom:5px;' class="select1 {required:true,messages:{required:'婚姻状况不能为空'}}">
									<option value="">请选择...</option>
									<#if marriageList??> 
										<#list marriageList as marr>
											<#if newStudent.marriageDic?? && newStudent.marriageDic.id?? && newStudent.marriageDic.id==marr.id>
												<option selected="selected" value="${marr.id}">${marr.name}</option>
											<#else>
												<option value="${marr.id}">${marr.name}</option>
											</#if>
										</#list> 
									</#if>
								</select>
            </div>
            
            <#--<div class="info"><span class="q1">党校学习</span>
            	<span class="xb">
            		<#if newStudent?? && newStudent.partyStudy?? && newStudent.partyStudy=='1'  >
						<input type="radio" value="1" name="partyStudy" checked="checked" class="{required:true}" />&nbsp;是&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio" value="0" name="partyStudy"	class="" />&nbsp;否 
					<#else>					
						<input type="radio" value="1" name="partyStudy"  class="" />&nbsp;是&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" value="0" name="partyStudy" checked="checked"	class="" />&nbsp;否 
					</#if>
            		</span>
            	
            	</div>-->
            	
            	<div class=""><span class="q1">健康状况 <span class="f_req">*</span></span>
            
            	<select id="healthStateDic" name="healthStateDic.id"  style='margin-top:8px;margin-bottom:5px;' class="select1 {required:true,messages:{required:'健康状况不能为空'}}">
									<option value="">请选择...</option>
									<#if healthSateList??> 
										<#list healthSateList as health>
											<#if newStudent.healthStateDic?? && newStudent.healthStateDic.id?? && newStudent.healthStateDic.id==health.id>
												<option selected="selected" value="${health.id}">${health.name}</option>
											<#else>
												<option value="${health.id}">${health.name}</option>
											</#if>
										</#list> 
									</#if>
								</select>
            </div>
            
        </div>
         
    </form>
    
   </div> 
    <div class="ps2">
    
    	<#-- 当信息采集已经提交了，就没有保存的按钮了，上一页和下一页也不必保存了页面直接跳转  -->
    	<#--<#if newStudent?? && newStudent.collectState?? &&  newStudent.collectState=='1' && isScope!='1' >-->
    	<#if isScope!='1' >
    
    		<input type="button" value="上一页" name="last" id="last"  class="btn f_l" onclick="submitSave('upGo');" />
    	
    	
    		<input type="submit" value="下一页" name="next" id="next"  class="btn f_r" onclick="submitSave('nextGo');" />
    	<#else>
			
			<input type="button" value="上一页" name="last" id="last"  class="btn f_l" onclick="submitSave('up');" />
    	
    		<input type="button" value="保  存" name="last" id="last"  class="btn f_l" style="margin-left:10px;margin-right:10px;" onclick="submitSave('save');" />
    	
    		<input type="submit" value="下一页" name="next" id="next"  class="btn f_r" onclick="submitSave('next');" />								
		</#if>
    </div>
</div>
			
		</div>
	</div>
	
</body>
</html>

