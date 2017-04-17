<html>
<head>
	<!-- ajax form-->
	<script src="${rc.contextPath}/js/jquery.form.js"></script>
<script type="text/javascript">
$("document").ready(function(){
		 
     $(".form_validation_reg").compValidate({
		rules:{     
				STUDY_WORK_SALARY: {required:true,number:true},
				TEMP_WORK_SALARY:{required:true,number:true},
				EVALUATE_WEB_URL:{required:true,url:true},
				STUDENT_EVALUATE_WEB:{required:true,url:true},
				SPONSOR_AWARD_TIME:{required:true}
				
			},
			messages:{
				STUDY_WORK_SALARY:{required:'勤工助学薪资设置不能为空',number:'请输入金额'},
				TEMP_WORK_SALARY:{required:'临时勤工助学薪资不能为空',number:'请输入金额'},
				EVALUATE_WEB_URL:{required:'测评网址不能为空',url:'测评网址格式不正确'},
				STUDENT_EVALUATE_WEB:{required:'学生心理测评网址不能为空',url:'网址格式不正确'},
				SPONSOR_AWARD_TIME:{required:'奖助申请时间设置编码不能为空'}
			}
		});
});
function onSub()
{
	$('#sysConfigForm').submit();
}

</script>
	
</head>
<body>

<div id="contentwrapper">
    <div class="main_content">
 		<div class="row-fluid">
 		<!--	-->
     	<h3 class="heading">常量配置</h3>
       <form  id="sysConfigForm" class="form_validation_reg" action="${rc.contextPath}/common/sysConfig/opt-update/submitSysConfig.do" method="post">
     	 <#if user_key.optMap??>
			<#if user_key.optMap['moneymodify']??>
	     	 <div class="formSep">
	      		<div class="row-fluid">
		      		<div class="span5">
		      		  	<div class="span4">
		        			<span class="formTitle">勤工助学薪资</span><span class="formRed">*</span>
		        	 	</div>
		           	  	<div class="span8">
		       				<input name="STUDY_WORK_SALARY" class="span10" value="${(studyWorkSalary.value!"")?html}"/>
		        		</div>   
		    		</div>   
		      		<div class="span5">
		      		  	<div class="span4">
		        			<span class="formTitle">临时岗位薪资</span><span class="formRed">*</span>
		        	 	</div>
		           	  	<div class="span8">
		       				<input name="TEMP_WORK_SALARY" class="span10" value="${(tempWorkSalary.value!"")?html}"/>
		        		</div>
		        	</div>
	        	</div>
	     	  </div> 
	     	   </#if>
     	  	</#if>
		     	  <div class="formSep">
		      		<div class="row-fluid">
			     	   <#if user_key.optMap??>
							<#if user_key.optMap['urlmodify']??>
					      		<div class="span5">
					      		  	<div class="span4">
					        			<span class="formTitle">测评网站地址</span><span class="formRed">*</span>
					        	 	</div>
					           	  	<div class="span8">
					       				<input class="span10" name="EVALUATE_WEB_URL" <#if webUrl ??> value="${(webUrl.value!"")?html}"</#if> />
					        		</div>   
					    		</div>
					    		<div class="span5">
					      		  	<div class="span4">
					        			<span class="formTitle">学生心理测评</span><span class="formRed">*</span>
					        	 	</div>
					           	  	<div class="span8">
					       				<input class="span10" name="STUDENT_EVALUATE_WEB" <#if studentEvaluateUrl ??> value="${(studentEvaluateUrl.value!"")?html}"</#if> />
					        		</div>   
					    		</div>   
			    		  </#if>
     	 				 </#if>
 	 				 	</div>
		     	 	 </div> 
		     	    <div class="formSep">
		      			<div class="row-fluid">
			    		 <#if user_key.optMap??>
							<#if user_key.optMap['moneymodify']??>
					      		<div class="span5">
					      		  	<div class="span4">
					        			<span class="formTitle">奖助时间编码</span><span class="formRed">*</span>
					        	 	</div>
					           	  	<div class="span8">
					       				<input class="span10" name="SPONSOR_AWARD_TIME" <#if sponsorTimeConfig ??> value="${(sponsorTimeConfig.value!"")?html}"</#if> />
					        		</div>   
					    		</div>   
				     	   </#if>
			     	  </#if>   
		        	</div>
		     	  </div> 
      </form>
      <br/>
	  <div class="row-fluid">
		  	<div class="span5">
	    		<div class="span4">&nbsp;</div>
	       	  	<div class="span8">
					<button class="btn btn-info" type="button" onclick="onSub();">保 存</button>
	    		</div> 
		  	</div>    
		</div>
	</div>
</div>

</body>
</html>
