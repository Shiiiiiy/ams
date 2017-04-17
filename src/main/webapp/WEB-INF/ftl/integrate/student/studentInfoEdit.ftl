<html>
 <head>
 <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
    <link rel="stylesheet" href="${rc.contextPath}/lib/My97DatePicker/skin/WdatePicker.css" />
	<script type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
    <script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
    <!-- animated progressbars -->
    <script src="${rc.contextPath}/js/bdp_fileupload.progressbar.js"></script>
    <script src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script>
    <script src="${rc.contextPath}/js/apw/apw_check.js"></script>
    <script src="${rc.contextPath}/js/jquery.form.js"></script>
    <script src="${rc.contextPath}/js/common/common_approve.js"></script>
    <script>
    $(function(){
		$('.tipTag').poshytip({
			className: 'tip-yellowsimple',
			showOn: 'focus',
			alignTo: 'target',
			alignX: 'right',
			alignY: 'center',
			offsetX: 5
		});
	});
	var attachFlag;
	$("document").ready(function(){
	     //页面校验
		attachFlag = $(".form_validation_reg").compValidate({
			rules:{     
					 'genderDic.id': {required:true},
					 national: {maxlength:10},
					
					 namePy: {maxlength:20,englishCheck:true},
					 oldName: {maxlength:20},
					 englishName: {maxlength:20,englishCheck:true},
					
					 'addressTypeDic.id': {required:true,maxlength:6},
					 nativeAdd: {maxlength:50},
					 homePostCode: {postCodeCheck:true,maxlength:6},
					 homeAddress: {maxlength:50},
					 homeTel: {phoneCheck:true,maxlength:13},
					 phone2: {phoneCheck:true,maxlength:13},
					 email: {email:true,maxlength:30},
					 qq: {required:true,qqCheck:true,maxlength:15},
					 
					 //qq: {required:true,rangelength:[5,15],digits:true,min:10000},
					 phone1: {required:true,phoneCheck:true,maxlength:13},
					 bank: {required:true,maxlength:30},
					 bankCode: {required:true,maxlength:30},
					 guardianName1: {maxlength:15},
					 guardianPhone1: {phoneCheck:true,maxlength:13},
					 guardianEmail1: {email:true,maxlength:30},
					 guardianPostCode1: {postCodeCheck:true,maxlength:6},
					 guardianWorkUnit1: {maxlength:30},
					 guardianAddress1: {maxlength:50},
					 guardianName2: {maxlength:15},
					 guardianPhone2: {phoneCheck:true,maxlength:13},
					 guardianEmail2: {email:true,maxlength:30},
					 guardianPostCode2: {postCodeCheck:true,maxlength:6},
					 guardianWorkUnit2: {maxlength:30},
					 guardianAddress2: {maxlength:50},
					 guardianName3: {maxlength:15},
					 guardianPhone3: {phoneCheck:true,maxlength:13},
					 guardianEmail3: {email:true,maxlength:30},
					 guardianPostCode3: {postCodeCheck:true,maxlength:6},
					 guardianWorkUnit3: {maxlength:30},
					 guardianAddress3: {maxlength:50}
				},
				messages:{
					 'genderDic.id': {required:'不能为空！'},
					 national: {maxlength:'长度不超过10'},
					 
					 namePy: {maxlength:'长度不超过20',},
					 oldName: {maxlength:'长度不超过20',},
					 englishName: {maxlength:'长度不超过20',},
 
 					 'addressTypeDic.id': {required:'不能为空！'},
					 nativeAdd: {maxlength:'长度不超过50'},
					 homePostCode: {maxlength:'长度不超过6'},
					 homeAddress: {maxlength:'长度不超过50'},
					 homeTel: {maxlength:'长度不超过13'},
					 phone2: {maxlength:'长度不超过13'},
					 email: {email:'邮箱格式不正确！',maxlength:'邮箱长度不超过30'},
					 qq: {required:'不能为空！',maxlength:'长度不超过15'},
					 phone1: {required:'不能为空！',maxlength:'长度不超过13'},
					 bank: {required:'不能为空！',maxlength:'长度不超过30'},
					 bankCode: {required:'不能为空！',maxlength:'长度不超过30'},
					 guardianName1: {maxlength:'姓名不超过15字'},
					 guardianPhone1: {maxlength:'手机号码不超过13'},
					 guardianEmail1: {email:'邮箱格式不正确！',maxlength:'邮箱长度不超过30'},
					 guardianPostCode1: {maxlength:'长度不超过6'},
					 guardianWorkUnit1: {maxlength:'长度不超过30'},
					 guardianAddress1: {maxlength:'长度不超过50'},
					 guardianName2: {maxlength:'姓名不超过15字'},
					 guardianPhone2: {maxlength:'手机号码不超过13位'},
					 guardianEmail2: {email:'邮箱格式不正确！',maxlength:'邮箱长度不超过30'},
					 guardianPostCode2: {maxlength:'长度不超过6'},
					 guardianWorkUnit2: {maxlength:'长度不超过30'},
					 guardianAddress2: {maxlength:'长度不超过50'},
					 guardianName3: {maxlength:'姓名不超过15字'},
					 guardianPhone3: {maxlength:'手机号长度不超过13位'},
					 guardianEmail3: {email:'邮箱格式不正确！',maxlength:'邮箱长度不超过30'},
					 guardianPostCode3: {maxlength:'长度不超过6'},
					 guardianWorkUnit3: {maxlength:'长度不超过30'},
					 guardianAddress3: {maxlength:'长度不超过50'}
				}
		 });
	 });
	
	  //验证是否输入的是手机号
	jQuery.validator.addMethod("phoneCheck",function(value,element){
	   if(value != ""){
	      var phone =/^((13|15|17|18|14)[0-9]{9}(?!\d))|(0[1-9]\d{1,2}-[1-9]\d{6,7})$/;
	      return phone.exec(value);
	   }else{
	      return true;
	   }
	  return false;
	},"请输入11位的手机号码或者带区号的固定电话号码.");
	 //验证是否输入的是Email号
	jQuery.validator.addMethod("emailCheck",function(value,element){
	   if(value != ""){
	      var email = /^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/;
	      return email.exec(value);
	   }else{
	      return true;
	   }
	  return false;
	},"请输入正确的邮箱，例如@qq.com");
	 //验证是否输入的是邮政编码
	jQuery.validator.addMethod("postCodeCheck",function(value,element){
	   if(value != ""){
	      var postCode = /^[0-9][0-9]{5}(?!\d)$/;
	      return postCode.exec(value);
	   }else{
	      return true;
	   }
	  return false;
	},"请输入正确的邮编.");
	 //验证是否输入的是英文名或拼音
	jQuery.validator.addMethod("englishCheck",function(value,element){
	   if(value != ""){
	      var postCode = /([a-zA-Z\d]){1,20}(?!\d)/;
	      return postCode.exec(value);
	   }else{
	      return true;
	   }
	  return false;
	},"请输入英文字母.");
	 //验证是否输入的是qq号码
	jQuery.validator.addMethod("qqCheck",function(value,element){
	   if(value != ""){
	      var qq = /^[1-9][0-9]{4,14}$/;
	      return qq.exec(value);
	   }else{
	      return true;
	   }
	  return false;
	},"请输入正确的qq号码.");
	
    /*
	 * 初始化当前发起流程【doInitAction方法名不可修改】
	 */
    function doInitAction(objectId,userId){
	    var url = "${rc.contextPath}/student/selfinfo/opt-add/saveCurProcess.do";
		apw.initCurProcess(url,objectId,userId);
	}
              
    //执行业务系统的操作
    function doAmsAction(userId,approveKey,approveStatus,processStatusCode,suggest){
    	mask.showShade();
        $('#studentSumbit').attr("action","${rc.contextPath}/student/selfinfo/opt-save/saveStudentInfo.do");
        $('#studentSumbit').submit(); 
       //window.location.href="${rc.contextPath}/student/selfinfo/opt-query/queryStudentInfo.do";	
    }
    
	//保存方法 
 	 function onSub(stas){
 		var check_error=$("#check_error").val();
 		if(attachFlag.form()==false){
	 		    return false;
	 		}
 		$("#flags").val(stas);
		if(check_error == "true"){
		   if(stas=="1"){
                  	if(confirm("提交信息后不能修改，确认要提交吗？")){
                  		var currentId =  $("#id").val();
                  		if(!isEmpty(currentId)){
                  			 apw.selectNextApprover(currentId,"INIT","STUDENT_INFO_UPDATE_APPROVE","");
					   	}else{
					   		$.ajax({
								//url: "${rc.contextPath}/student/selfinfo/opt-save/submitStudentInfo.do",
								url: "${rc.contextPath}/common/config/nsm/getUuid.do",
								async:false,
								cache:false,
								type:"POST",
								//data:$('#studentSumbit').serialize(),
							    success: function(id){
									if(!isEmpty(id)){
										 $("#id").val(id);
		 						        apw.selectNextApprover(id,"INIT","STUDENT_INFO_UPDATE_APPROVE","");
								    }else{
								    	$.sticky("学生信息保存失败", {autoclose:5000, position:"top-right", type:"st-error"});
								    	return;
								    }
								}
						   });
					   }
				   } 	
	        }else{
	            mask.showShade();
	            $('#studentSumbit').attr("action","${rc.contextPath}/student/selfinfo/opt-save/saveStudentInfo.do");
		        $('#studentSumbit').submit();  	
		    }
		  }
       }
    //返回到查询信息页面
    function goToView(){
    	window.location.href="${rc.contextPath}/student/selfinfo/opt-query/queryStudentInfo.do";
    }
    function isEmpty(s){
	 return ((s==undefined || s==null || s=="" || s==0) ? true : false);
	}
	//审核历史
	function showApproveCommnets(){
		//参数为objectId
		var id=$("#id").val();
		approve.showApproveComments('id');
	}
    </script>
    </head>
<body>
<div id="contentwrapper">
    <div class="main_content">   
        <div class="row-fluid">	
    		<form  id="studentSumbit" class="form_validation_reg" action="" method="post">
				<div class="span12">		
				<#if studentInfo ?? && studentInfo.status!='SUBMIT'>
		              <input id="id" type="hidden" name="id" value="${(studentInfo.id)!""}" /> 
				    <#include "/integrate/student/studentEdit/studentInfo.ftl"> 
		              <input name="check_error" id="check_error" type="hidden" value="true"/>
			          <input id="flags" type="hidden" name="flags"  value="${(flags)!""}">	
			          <br/>		          
			        	<div class="row-fluid">
			        	<div class="span6">
							<div class="span3">
							</div>
		                      <button class="btn btn-info"  type="button" onclick="onSub('0')">保 存</button>
				              <button class="btn btn-info"  type="button" onclick="onSub('1')">提 交</button>
				              <#if studentInfo ?? && studentInfo.processStatus ?? && studentInfo.processStatus =="REJECT" ><button class="btn btn-info" type="button" onclick="approve.showHis('${(studentInfo.id)!""}')">审核历史</button></#if>
				              <button class="btn" type="button" onclick="goToView()">取 消</button>
				        </div>
				        </div>				
		       	 <#else>
		            <#include "/integrate/student/studentEdit/disStudentInfo.ftl">
					<div class="row-fluid">
		                <div class="span6">
							<div class="span3">
							</div>
							  <button class="btn btn-info" type="button" <#if studentInfo ?? && studentInfo.status ?? && studentInfo.status !="" >onclick="approve.showHis('${(studentInfo.id)!""}')"</#if>>审核历史</button>
							  <button class="btn" type="button" onclick="goToView()">返 回</button>
	                    </div>				
					</div>	
				</#if>
				</div>
			</form>
			</div>
        </div>
        <#include "/apw/instance/approvers.ftl"/>
    </div>
     <#-- 审核历史查看 -->
        <#include "/apw/instance/approveHistory.ftl">	 
</body>
</html>
