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
	
	<!--遮罩层-->
		<link rel="stylesheet" href="${rc.contextPath}/css/waiting.css" />
		<script src="${rc.contextPath}/js/common/mask.js"></script>
		
	<style>
		.img-polaroid{padding:4px;background-color:#fff;border:1px solid #ccc;border:1px solid rgba(0,0,0,0.2);-webkit-box-shadow:0 1px 3px rgba(0,0,0,0.1);-moz-box-shadow:0 1px 3px rgba(0,0,0,0.1);box-shadow:0 1px 3px rgba(0,0,0,0.1)}
	</style>
	
	<script>
	
		//初始化
		$("document").ready(function() {
			$("#editStudentGuardianForm").compValidate();
			
			//判断如果采集状态是提交状态，则改为可读
			if('${(guardian.status)!''}'=='1' ){
				//$("#editStudentGuardianForm input").attr("disabled",true);
				//$("#editStudentGuardianForm select").attr("disabled",true);
			}
			
			//判断当前时间是否在学校设定的范围内
			if('${(isScope)!''}'!='1' ){
				comp.message('${(isScope)!''}',"error");
				
				$("#editStudentGuardianForm input").attr("disabled",true);
				
			}else{
				if('${(guardian.status)!''}'=='1' ){
				
					comp.message("您的信息已经提交了,在开放时间内还可以进行修改,修改后点击'上一页'、'保存'或'下一页'按钮都可以！","info");
				}
			
			}
		});
		
		
		
		//上一页
		function up(){
			window.location.href="${rc.contextPath}/newstudent/register/editNewStudentInfo.do";
		}
		
		//下一页
		function next(){
			window.location.href="${rc.contextPath}/newstudent/register/editReport.do";
		}
		
		//保存提交处理
		function submitSave(type){
			
			//处理的方式(上一页、下一页、保存)
			$('#type').val(type);
			
			//不用保存直接跳转到上一页upGo
			if(type =="upGo"){
				window.location.href="${rc.contextPath}/newstudent/register/editNewStudentInfo.do";
				
				return;
			}
			
			//不用保存直接跳转到下一页upGo
			if(type =="nextGo"){
				window.location.href="${rc.contextPath}/newstudent/register/editReport.do";
				return;
			}
			
			//判断提交的类型
			if((type =="save" || type =="up") && '${(guardian.status)!''}'!='1' ){
				//父亲手机号码验证取消
				$('#fathPhone').attr("class","inp1 cancel");
				
				//父亲邮政编码验证取消
				$('#fathPostCode').attr("class","inp1 cancel");
				
				//母亲手机号码验证取消
				$('#mothPhone').attr("class","inp1 cancel");
				
				//母亲邮政编码验证取消
				$('#mothPostCode').attr("class","inp1 cancel");
				
				//监护人手机号码验证取消
				$('#guardianPhone').attr("class","inp1 cancel");
				
				//监护人邮政编码验证取消
				$('#guardianPostCode').attr("class","inp1 cancel");
			
			
			}else{
				//父亲姓名
				var fatherName = $.trim($('#fatherName').val());
				//父亲手机号码
				var fatherPhone = $.trim($('#fatherPhone').val());
				//父亲住址
				var fatherAddress = $.trim($('#fatherAddress').val());
				//父亲邮编
				var fatherPostCode = $.trim($('#fatherPostCode').val());
				//父亲邮箱
				//var fatherEmail = $.trim($('#fatherEmail').val());
				//父亲工作单位
				//var fatherWorkUnit = $.trim($('#fatherWorkUnit').val());
				
				//标识符
				var flag ='';
				//if(fatherName !="" &&  fatherPhone !="" && fatherAddress !="" && fatherPostCode !="" && fatherEmail !="" && fatherWorkUnit !="" ){
				if(fatherName !="" &&  fatherPhone !="" && fatherAddress !="" && fatherPostCode !="" ){
					
					flag = 'true';
				}
				
				//母亲姓名
				var motherName = $.trim($('#motherName').val());
				//母亲手机号码
				var motherPhone = $.trim($('#motherPhone').val());
				//母亲住址
				var motherAddress = $.trim($('#motherAddress').val());
				//母亲邮编
				var motherPostCode = $.trim($('#motherPostCode').val());
				//母亲邮箱
				//var motherEmail = $.trim($('#motherEmail').val());
				//母亲工作单位
				//var motherWorkUnit = $.trim($('#motherWorkUnit').val());
				
				//if(motherName !="" &&  motherPhone !="" && motherAddress !="" && motherPostCode !="" && motherEmail !="" && motherWorkUnit !="" ){
				if(motherName !="" &&  motherPhone !="" && motherAddress !="" && motherPostCode !="" ){
					flag = 'true';
				}
				
				
				//监护人姓名
				var guardianName = $.trim($('#guardianName').val());
				//监护人手机号码
				var guardianPhone = $.trim($('#guardianPhone').val());
				//监护人住址
				var guardianAddress = $.trim($('#guardianAddress').val());
				//监护人邮编
				var guardianPostCode = $.trim($('#guardianPostCode').val());
				//监护人邮箱
				//var guardianEmail = $.trim($('#guardianEmail').val());
				//监护人工作单位
				//var guardianWorkUnit = $.trim($('#guardianWorkUnit').val());
				
				//if(guardianName !="" &&  guardianPhone !="" && guardianAddress !="" && guardianPostCode !="" && guardianEmail !="" && guardianWorkUnit !="" ){
				if(guardianName !="" &&  guardianPhone !="" && guardianAddress !="" && guardianPostCode !="" ){
					flag = 'true';
				}
				
				if(flag==''){
					comp.message("监护人信息：父亲、母亲、监护人必须有一位信息要填写完整（其中姓名、手机号码、住址、邮编是必填项）！","error");
					return;
				}
				
			}
			
			//遮罩
			mask.showShade();
			//from 提交
			$('#editStudentGuardianForm').submit();
			
			//避免重提交使按钮不可用
			//保存
			$('#save').attr("disabled",true);
			//上一页
			$('#last').attr("disabled",true);
			//下一页
			$('#next').attr("disabled",true);
			//window.location.href="${rc.contextPath}/newstudent/register/editGuardian.do";
		}
	</script>
</head>
<body>
<#include "/decorators/mask.ftl">
	<div id="contentwrapper">
		<div class="main_content">
			<div class="wrapper">
    <h2 class="tit_ins">新生信息采集-监护人信息</h2>
    
    <div class="text_ins wid">
    <input name="errorText" id="errorText" type="hidden" value="${errorText!" "}"/>
    <form id="editStudentGuardianForm" class="form_validation_reg" action="${rc.contextPath}/newstudent/register/saveGuardian.do" method="post">
				
				<input id="type" type="hidden" name="type"/>
				
				<#if guardian ?? && guardian.studentId?? >
					<input id="fatherId" type="hidden" name="studentInfo。id" value="${(guardian.fatstudentInfo.id)!""}"/>
				<#else>
					<input id="fatherId" type="hidden" name="studentInfo。id" value=""/>
				</#if>
				<input id="fatherId" type="hidden" name="fatherId" value="${(guardian.fatherId)!""}"/>
				
				<input id="motherId" type="hidden" name="motherId" value="${(guardian.motherId)!""}"/>
				
				<input id="guardianId" type="hidden" name="guardianId" value="${(guardian.guardianId)!""}"/>
				
				
				
    	<div class="infoL">
        	 <div class="info">
        	 	<span class="q1">父亲姓名</span>
            	<input type="text"  id="fatherName"  class="inp1" name="fatherName"  maxlength="10" value="${(guardian.fatherName)!""}"/>
            </div>
           <div class="info"><span class="q1">父亲住址</span>
            	<input type="text"  id="fatherAddress"  class="inp1" name="fatherAddress"  maxlength="40"  value="${(guardian.fatherAddress)!""}"/>
            </div>
            <div class="info"><span class="q1">父亲邮箱</span>
            	<input type="text"  id="fatherEmail"   name="fatherEmail"  maxlength="50"  value="${(guardian.fatherEmail)!""}" style='margin-top:8px;margin-bottom:5px;' class="inp1 {email:true,messages:{email:'电子邮箱格式不正确'}}"/> 
            </div>
            
            
             <div class="info" style='margin-top:30px;'>
        	 	<span class="q1">母亲姓名</span>
            
            	<input type="text"  id="motherName"  class="inp1" name="motherName"  maxlength="10" value="${(guardian.motherName)!""}"/>
            </div>
            
        	
           <div class="info"><span class="q1">母亲住址</span>
            
            	<input type="text"  id="motherAddress"  class="inp1" name="motherAddress"  maxlength="40" value="${(guardian.motherAddress)!""}"/>
            </div>
            
            <div class="info"><span class="q1">母亲邮箱</span>
            
            	<input type="text"  id="motherEmail"   name="motherEmail"  maxlength="50"  value="${(guardian.motherEmail)!""}" style='margin-top:8px;margin-bottom:5px;' class="inp1 {email:true,messages:{email:'电子邮箱格式不正确'}}"/> 
            </div>
           
           <div class="info" style='margin-top:30px;'>
        	 	<span class="q1">监护人姓名</span>
            
            	<input type="text"  id="guardianName"  class="inp1" name="guardianName"  maxlength="10" value="${(guardian.guardianName)!""}"/>
            </div>
            
        	
           <div class="info"><span class="q1">监护人住址</span>
            
            	<input type="text"  id="guardianAddress"  class="inp1" name="guardianAddress"  maxlength="40" value="${(guardian.guardianAddress)!""}"/>
            </div>
            
            <div class=""><span class="q1">监护人邮箱</span>
            
            	<input type="text"  id="guardianEmail"   name="guardianEmail"  maxlength="50" value="${(guardian.guardianEmail)!""}" style='margin-top:8px;margin-bottom:5px;' class="inp1 {email:true,messages:{email:'电子邮箱格式不正确'}}"/> 
            </div>
        </div>
        <div class="infoR">
        	<div class="info"><span class="q1">父亲手机号码</span>
            
            	<input type="text"  id="fatherPhone"   name="fatherPhone"  maxlength="11" value="${(guardian.fatherPhone)!""}" style='margin-top:8px;margin-bottom:5px;' class="inp1 {digits:true,uwsnumcharcn:true,messages:{digits:'父亲手机号码应该是正整数的数字'}}"/>
            </div>
            
        	
           <div class=""><span class="q1">父亲邮编</span>
            
            	<input type="text"  id="fatherPostCode"   name="fatherPostCode"  maxlength="10"  value="${(guardian.fatherPostCode)!""}" style='margin-top:8px;margin-bottom:5px;' class="inp1 {digits:true,uwsnumcharcn:true,messages:{digits:'父亲邮编应该是正整数的数字'}}"/>
            </div>
            
            <div class="info"><span class="q1">父亲工作单位</span>
            
            	<input type="text"  id="fatherWorkUnit"  class="inp1" name="fatherWorkUnit"  maxlength="40" value="${(guardian.fatherWorkUnit)!""}"/>
            </div>
            
            
             
            <div class="info" style='margin-top:28px;' ><span class="q1">母亲手机号码</span>
            
            	<input type="text"  id="motherPhone"  name="motherPhone"  maxlength="11" value="${(guardian.motherPhone)!""}" style='margin-top:8px;margin-bottom:5px;' class="inp1 {digits:true,uwsnumcharcn:true,messages:{digits:'母亲手机号码应该是正整数的数字'}}"/>
            </div>
            
        	
           <div class=""><span class="q1">母亲邮编</span>
            
            	<input type="text"  id="motherPostCode"   name="motherPostCode"  maxlength="10" value="${(guardian.motherPostCode)!""}" style='margin-top:8px;margin-bottom:5px;' class="inp1 {digits:true,uwsnumcharcn:true,messages:{digits:'母亲邮编应该是正整数的数字'}}"/>
            </div>
            
            <div class="info"><span class="q1">母亲工作单位</span>
            
            	<input type="text"  id="motherWorkUnit"  class="inp1" name="motherWorkUnit"  maxlength="40" value="${(guardian.motherWorkUnit)!""}"/>
            </div>
            
             <div class="" style='margin-top:28px;'><span class="q1">监护人手机号码</span>
            
            	<input type="text"  id="guardianPhone"   name="guardianPhone"  maxlength="11" value="${(guardian.guardianPhone)!""}" style='margin-top:8px;margin-bottom:5px;' class="inp1 {digits:true,uwsnumcharcn:true,messages:{digits:'监护人手机号码应该是正整数的数字'}}"/>
            </div>
            
        	
           <div class=""><span class="q1">监护人邮编</span>
            
            	<input type="text"  id="guardianPostCode"   name="guardianPostCode"  maxlength="10"  value="${(guardian.guardianPostCode)!""}" style='margin-top:8px;margin-bottom:5px;' class="inp1 {digits:true,uwsnumcharcn:true,messages:{digits:'监护人邮编应该是正整数的数字'}}"/>
            </div>
            
            <div class="info"><span class="q1">监护人工作单位</span>
            
            	<input type="text"  id="guardianWorkUnit"  class="inp1" name="guardianWorkUnit"   maxlength="40" value="${(guardian.guardianWorkUnit)!""}"/>
            </div>
            
        </div>
         <h2 class="tit_ins" style='height:1px;border: 0px;'></h2>
         
         <h2 class="tit_ins" style='margin-top:142px;height:0px;'></h2>
         <h2 class="tit_ins" style='margin-top:148px;height:0px;'></h2>
        
         
    </form>
    
   </div> 
    <div class="ps2">
    	<#-- 当信息采集已经提交了，就没有保存的按钮了，上一页和下一页也不必保存了页面直接跳转  -->
    	<#--<#if guardian?? && guardian.status?? &&  guardian.status=='1'>-->
    	<#if isScope!='1' >
    		<input type="button" value="上一页" name="last" id="last"  class="btn f_l" onclick="submitSave('upGo');" />
    	
    	
    		<input type="submit" value="下一页" name="next" id="next"  class="btn f_r" onclick="submitSave('nextGo');" />
    	<#else>
			
			<input type="button" value="上一页" name="last" id="last"  class="btn f_l" onclick="submitSave('up');" />
    	
    		<input type="button" value="保  存" name="" id="save"  class="btn f_l" style="margin-left:10px;margin-right:10px;" onclick="submitSave('save');" />
    	
    		<input type="submit" value="下一页" name="next" id="next"  class="btn f_r" onclick="submitSave('next');" />								
		</#if>
    </div>
</div>
			
		</div>
	</div>
	
</body>
</html>

