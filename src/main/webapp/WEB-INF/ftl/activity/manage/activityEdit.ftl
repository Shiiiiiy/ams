<html>
 <head>
 <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
    <link rel="stylesheet" href="${rc.contextPath}/lib/My97DatePicker/skin/WdatePicker.css" />
	<script type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
    <script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
    <!-- animated progressbars -->
    <script src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script>
    <script src="${rc.contextPath}/js/apw/apw_check.js"></script>
    <script src="${rc.contextPath}/js/jquery.form.js"></script>
    <script src="${rc.contextPath}/js/common/common_approve.js"></script>
    <script>
    
    //根据学院级联处专业
    function selectAllMajor(collegeId,type){
    	
       var isCheck=$("#" + collegeId).attr("checked");
       
    	$.ajax({
			url : "${rc.contextPath}/comp/opt-query/initCascadeMajor.do",
			async : false,
			cache : false,
			type : "POST",
			data : {
				key : collegeId
			},
			dataType : "json",
			success : function(data) {
				if (data != null && data != undefined && data != "[]") {
					var json = eval(data);
					for ( var i in json) {
						var item = json[i];
						if (item != null && item != undefined) {
							var value = item.id;
							var label = item.name;
							
							if(isCheck=="checked"){
								//点击选中
								var s="<div><lable><input id='"+value+"' name='majorIds' checked type='checkbox' value='"+value+"' onclick='selectAllClass(\""+value+"\")'/>"+label+"</lable><br/></div>";
								$("#appendMajor").append(s);
							}else{
								//点击取消专业--级联取消班级
								selectAllClass(value,"remove");
								$("#" + value).parent().parent().remove();
							}
								
							
						}
					}
					
				}
			}
		});
    }
    //根据专业级联班级
     function selectAllClass(majorId,type){
    	var isCheck=$("#" + majorId).attr("checked");
    	$.ajax({
			url : "${rc.contextPath}/comp/opt-query/initCascadeClass.do",
			async : false,
			cache : false,
			type : "POST",
			data : {
				key : majorId
			},
			dataType : "json",
			success : function(data) {
				if (data != null && data != undefined && data != "[]") {
					var json = eval(data);
					for ( var i in json) {
						var item = json[i];
						if (item != null && item != undefined) {
							var value = item.id;
							var label = item.name;
							if(type=="remove"){//取消专业时调用  用去取消班级
								$("#" + value).parent().parent().remove();
							}else{
								if(isCheck=="checked"){
									//班级选中
									var s="<div><lable><input id='"+value+"' name='classIds' type='checkbox' value='"+value+"' />"+label+"</lable><br/></div>";
									$("#appendClassId").append(s);
								}else{
									//班级取消
									$("#" + value).parent().parent().remove();
								}
							}
								
							
						}
					}
				}
			}
		});
    }
    $(function(){
		$('.tipTag').poshytip({
			className: 'tip-yellowsimple',
			showOn: 'focus',
			alignTo: 'target',
			alignX: 'right',
			alignY: 'center',
			offsetX: 5
		});
		categoryOnChange();
		typeChange();
		//levelChange("init");//因为在categoryOnChange()方法中调用了该方法
	});
	var attachFlag;
	$("document").ready(function(){
	        attachFlag=$(".form_validation_reg").compValidate({
			rules:{   
			  		 activityName: {required:true,maxlength:30,activityNameCheck:true},
					 'activityCategory.id': {required:true},
					 'activityType.id': {required:true},
					 'registraForm.id': {required:true},
					 activityTime: {required:true},
					 activityAddress: {required:true,maxlength:15},
					 managerName: {required:true},
					 managerPhone: {required:true,phoneCheck:true},
					 members: {required:true,digits:true,min:1,max:10000},
					 workerNum: {required:true,digits:true,min:1,max:100},
					 workers: {required:true,maxlength:1000},
					 activityIntro: {required:true,maxlength:200},
					 organizer: {maxlength:200},
					 'activityLevel.id':{required:true},
					 security: {maxlength:150},
					 unitManagerName: {required:true},
					 unitPhone: {required:true,telCheck:true},
					 unitCellphone: {phoneCheck:true},
					 //unitPosition: {required:true},
					 'collegeIds': {required:true},
					 //'major.id':{required:true},
					 //'class_.id': {required:true},
					 teacherNames: {required:true},
					 trafficPlan: {required:true,maxlength:100},
					 'association.id': {required:true},
					 'volunteerAddress.id': {required:true},
					 '_managerName':{required:true}
					 
				},
				messages:{
					 activityName: {required:'不能为空！',maxlength:'长度不超过30'},
					 'activityCategory.id': {required:'不能为空！'},
					 'activityType.id': {required:'不能为空！'},
					 'registraForm.id': {required:'不能为空！'},
					 activityTime: {required:'不能为空！'},
					 activityAddress: {required:'不能为空！',maxlength:'长度不超过15'},
					 managerName: {required:'不能为空！'},
					 managerPhone: {required:'不能为空！'},
					 members: {required:'不能为空！',digits:'参与人员数目必须为整数',min:'参与人员数目最少为一人',max:'参与人员数目最多不超过10000'},
					 workerNum: {required:'不能为空！',digits:'工作人员数目必须为整数',min:'工作人员数目最少为一人',max:'工作人员数目最多不超过100'},
					 workers: {required:'不能为空！',maxlength:'长度不超过1000'},
					 activityIntro: {required:'不能为空！',maxlength:'长度不超过200'},
					 organizer: {maxlength:'长度不超过200'},
					 'activityLevel.id':{required:'不能为空！'},
					 security: {maxlength:'长度不超过150'},
					 unitManagerName: {required:'不能为空！'},
					 unitPhone: {required:'不能为空！'},
					 //unitPosition: {required:'不能为空！'},
					 'collegeIds': {required:'不能为空！'},
					 //'major.id':{required:'不能为空！'},
					 //'class_.id': {required:'不能为空！'},
					 teacherNames: {required:'不能为空！'},
					 trafficPlan: {required:'不能为空！',maxlength:'长度不超过100'},
					 'association.id': {required:'不能为空！'},
					 'volunteerAddress.id': {required:'不能为空！'},
					 '_managerName': {required:'不能为空！'}
				}
		 });
		 
	 });
	  //验证活动名称是否重复
	 jQuery.validator.addMethod("activityNameCheck",function(value,element){
	    var reid;
	    var activityId =$("#id").val();
	    if(value != ""){
	      $.ajax({
				url: "${rc.contextPath}/activity/manage/opt-add/queryActivityByActivityName.do",
				async:false,
				cache:false,
				type:"POST",
				dataType:"text",
				data:{activityName:value,activityId:activityId},
			    success: function(data){
		           reid=data;  
				}
			   });
		  if(isEmpty(reid)){
	          return true;
		  }else{
	      	  return false;
		  }
		}else{
	      return true;
	   }
	 },"活动名称重复.");
	//验证是否输入的是手机号
	jQuery.validator.addMethod("phoneCheck",function(value,element){
	   if(value != ""){
	      var phone =/^((13|15|17|18|14)[0-9]{9}(?!\d))$/;
	      return phone.exec(value);
	   }else{
	      return true;
	   }
	  return false;
	},"请输入11位的手机号码.");
	//验证是否输入的是固定电话
	jQuery.validator.addMethod("telCheck",function(value,element){
	   if(value != ""){
	      var phone =/^(0[1-9]\d{1,2}-[1-9]\d{6,7})$/;
	      return phone.exec(value);
	   }else{
	      return true;
	   }
	  return false;
	},"请输入带区号的固定电话号码.");	
    /*
	 * 初始化当前发起流程【doInitAction方法名不可修改】
	 */
    function doInitAction(objectId,userId){
	    var url = "${rc.contextPath}/activity/approve/opt-add/saveCurProcess.do";
		apw.initCurProcess(url,objectId,userId);
	}
              
    //执行业务系统的操作
    function doAmsAction(userId,approveKey,approveStatus,processStatusCode,suggest){
       window.location.href="${rc.contextPath}/activity/manage/opt-query/listManageActivity.do";	
    }
    
    //保存方法 
 	 function onSub(stas){
	    var workerNum=$("#workerNum").val();
		var _workerIds=$("#_workerIds").val();
	    var workerIds =	(_workerIds)?(_workerIds.split(",").length):"";
 	    var members=$("#members").val();
	    var activityCategory=$("#activityCategory").val(); 
	    var activityLevel=$("#activityLevel").val();
	 	if(!isEmpty(activityCategory)){
	 		if(attachFlag.form()==false){
	 		    return false;
	 		}
 		    $("#flags").val(stas);
		    if(stas=="1"){
              	if(!confirm("提交信息后不能修改，确认要提交吗？")){
               		return;
                }
                $("#members").val(Number(members));
               
	            $("#workerNum").val(Number(workerNum));	             
			    //校内活动大于200人
			    if(activityCategory=="402890ef5065538001506560a2d60001" && Number(members)>=200){
	              	$.ajax({
						url: "${rc.contextPath}/activity/manage/opt-save/saveActivity.do",
						async:false,
						cache:false,
						type:"POST",
						data:$('#activitySumbit').serialize(),
					    success: function(id){
							if(!isEmpty(id)){
						        apw.selectNextApprover(id,"INIT","ACTIVITY_INFO_INSIDE_APPROVE",$("#approveReason").val());
						    }else{
						    	$.sticky("活动信息保存失败", {autoclose:5000, position:"top-right", type:"st-error"});
						    	return;
						    }
						}
					   });
			     }else if(activityCategory=="402890ef506553800150656116b70002"&&(Number(members)>=30)){
				        //校外活动大于30人
				        if(activityLevel=="402890ef506e977a01506e9f76b70000"){
				        	//校级
				        	 $.ajax({
								url: "${rc.contextPath}/activity/manage/opt-save/saveActivity.do",
								async:false,
								cache:false,
								type:"POST",
								data:$('#activitySumbit').serialize(),
							    success: function(id){
									if(!isEmpty(id)){
								        apw.selectNextApprover(id,"INIT","ACTIVITY_INFO_OUTSIDE_SCHOOL_APPROVE",$("#approveReason").val());
								    }else{
								    	$.sticky("活动信息保存失败", {autoclose:5000, position:"top-right", type:"st-error"});
								    	return;
								    }
								}
							 });
				        }else if(activityLevel=="402890ef506e977a01506ea090ff0001"){
				        	//院级
				        	 $.ajax({
								url: "${rc.contextPath}/activity/manage/opt-save/saveActivity.do",
								async:false,
								cache:false,
								type:"POST",
								data:$('#activitySumbit').serialize(),
							    success: function(id){
									if(!isEmpty(id)){
								        apw.selectNextApprover(id,"INIT","ACTIVITY_INFO_OUTSIDE_COLLEGE_APPROVE",$("#approveReason").val());
								    }else{
								    	$.sticky("活动信息保存失败", {autoclose:5000, position:"top-right", type:"st-error"});
								    	return;
								    }
								}
							 });
				        }
				       
	             }else if(activityLevel=="402890ef506e977a01506e9f76b70000"){
				       //人数未达到走审批流的上限，不走审批流
				       	//zhangmx 1.判断院级与校级--走审批(校级)
				       	$.ajax({
							url: "${rc.contextPath}/activity/manage/opt-save/saveActivity.do",
							async:false,
							cache:false,
							type:"POST",
							data:$('#activitySumbit').serialize(),
						    success: function(id){
								if(!isEmpty(id)){
							        apw.selectNextApprover(id,"INIT","ACTIVITY_INFO_SCHOOL_APPROVE",$("#approveReason").val());
							    }else{
							    	$.sticky("活动信息保存失败", {autoclose:5000, position:"top-right", type:"st-error"});
							    	return;
							    }
							}
						   });
				      // mask.showShade();
				       //$("#members").val(Number(members));
				       //$("#workerNum").val(Number(workerNum));
			           //$('#activitySumbit').attr("action","${rc.contextPath}/activity/manage/opt-submit/submitActivity.do");
				       //$('#activitySumbit').submit();
			  }else if(activityLevel=="402890ef506e977a01506ea090ff0001"){
			  		//院级活动
			  		$.ajax({
						url: "${rc.contextPath}/activity/manage/opt-save/saveActivity.do",
						async:false,
						cache:false,
						type:"POST",
						data:$('#activitySumbit').serialize(),
					    success: function(id){
							if(!isEmpty(id)){
						        apw.selectNextApprover(id,"INIT","ACTIVITY_INFO_COLLEGE_APPROVE",$("#approveReason").val());
						    }else{
						    	$.sticky("活动信息保存失败", {autoclose:5000, position:"top-right", type:"st-error"});
						    	return;
						    }
						}
					});
			  }
        }else{
	            //保存
	            mask.showShade();
	            $("#members").val(Number(members));
				$("#workerNum").val(Number(workerNum));
	            $('#activitySumbit').attr("action","${rc.contextPath}/activity/manage/opt-save/saveActivityinfo.do");
		        $('#activitySumbit').submit();  	
	    }
		}else{
		     comp.message("请选择活动类别！","error");
		     return;
		}
	}
    //返回到查询信息页面
    function goToView(){
  	  window.location.href="${rc.contextPath}/activity/manage/opt-query/listManageActivity.do";
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
	//清空校内活动信息
	function clearInside(){
	     $("#unitManager").attr("value","");
	     // $("#unitPosition").attr("value","");
	     $("#unitPhone").attr("value","");
	     $("#unitCellphone").attr("value","");
    }
    //清空校外活动信息
    function clearOutside(){
         $("input[name='collegeIds']").attr("checked",false);
         $("input[name='majorIds']").attr("checked",false);
         $("input[name='classIds']").attr("checked",false);
         $("#appendMajor").empty();
	     $("#appendClassId").empty();
	     $("#_teacherIds").attr("value","");
	     $("#_teacherNames").attr("value","");
	     $("#trafficPlan").attr("value","");
    }
	//活动类别
	function categoryOnChange(){
		var activityCategory=$("#activityCategory").val();
		//var dd = $("#activityCategory").find("option:selected").text();
	    if(activityCategory){
	       if(activityCategory=='402890ef5065538001506560a2d60001'){
	       	    $(".activityCategoryIn").show();
	       	    $(".activityCategoryOut").hide();
	       	    clearOutside();
	       }else{
	       	    $(".activityCategoryIn").hide();
	       	    $(".activityCategoryOut").show();
	       	   
	       	    levelChange("init");
	       	    clearInside();
	       	    typeChange();
	       }
	    }else{	    
       	   $(".activityCategoryIn").hide();
	       $(".activityCategoryOut").hide();
	       clearInside();
	       clearOutside();
	    }	
	}
	
	//老师和学生单选
	function selectSchoolTeacherAndStudentRadio(studentId,teacherId){
		var type = 	$("#contactType").val();
		if(type == 'student'){
			studentId = $("#_managerStudentId").val();
			teacherId = '';
		}else if(type == 'teacher'){
			teacherId = $("#_managerTeacherId").val();
			studentId = '';
		}
	   _queryStudentAndTeacherRadio(studentId,teacherId);
	}
	function setStudentAndTeacherRadioSelectValue(student,type)
     {  
        if(type=='student'){
            if(student){
				$("#_managerStudentId").val(student.id);
				$("#_managerTeacherId").val('');
			    $("#_managerName").val(student.name);
			    $("#contactType").val(type);
		     }
        }else{
            if(student){
				$("#_managerTeacherId").val(student.id);
				$("#_managerStudentId").val('');
			    $("#_managerName").val(student.name);
			    $("#contactType").val(type);
		    }
        }
	}
	//单选教职工
	var manage;
	function selectSchoolTeacherRadio(m){
	    manage=m;
	    var manageId=$("#"+manage).val();
		_queryTeacherRadioAll(manageId);
	}
	function _setTeacherRadioSelectValue(teacher){
		if(teacher){
			$("#"+manage).val(teacher.id);
		    $("#"+manage+"Name").val(teacher.name);
		}
	}
	//选择带队老师，类型为BaseTeacherModel
	//多选教职工
	var t;
	function selectTeacherCheck(teacher){
		t=teacher;
		_queryTeacherCheckAll($("#"+teacher+"Ids").val());
	}
	function setTeacherSelectValue(teacherIds,names){
	    $("#"+t+"Ids").attr("value",teacherIds);
	    $("#"+t+"Names").attr("value",names);
	}
	function typeChange(){
	   var activityType=$("#activityType").val();
	   //社团
	   if(activityType=='402890ef50655380015065649de70004'){
	       $(".type").show();
	   }else{
	       $(".type").hide();
	   } 
	   //志愿者
	   if(activityType=='402890ef506553800150656876e10006'){
	       $(".vaddress").show();
	       $(".address").hide();
	       if(isEmpty($("#volunteerAddress").val())){
		   $("#volunteerAddress").attr("value",$("#volunteerId").val());
	   	   $("#volunteerAddress").attr("option:selected",$("#volunteerName").val());
	   	   }
	       $("#activityAddress").attr("value","");
	   }else{
		   $(".vaddress").hide();
	       $(".address").show();
	       $("#volunteerAddress").val("");
	   } 
	}
	function levelChange(type){
	   var activityLevel= $("#activityLevel").val();
	   var activityCategory= $("#activityCategory").val();
   	   if(activityCategory=='402890ef506553800150656116b70002'){//校外活动
		   if(activityLevel=='402890ef506e977a01506e9f76b70000'){//学校级活动
		       $(".college").hide();
		   }else{
			   $(".college").show();
		       if(isEmpty($("#collegeId").val())){
				   //$("#collegeId").attr("value",$("#studentCollegeId").val());
				   //$("#collegeId").attr("option:selected",$("#studentCollegeName").val());
				   //cascade.changeCollage('collegeId','majorId','classId');
			   }
			   
		   }
		   if("init"==type){
		   	    $(function(){
			    	//初始化选中学院
			    	checkMul('hiddenCollegeIds',"collegeType");
					//初始化选中专业
	    			checkMul('hiddenMajorIds',"majorType");
	    			//初始化选中班级
	    			checkMul('hiddenClassIds',"classType");
			    });
		   }
			   
	   }
	}
	//选中多选的学院
	function checkMul(ids,idType){
		var ids=$("#"+ ids).val();
		if(!(ids==undefined || ids==null || ids=="") ){
    		var strs= new Array(); //定义一数组
		    strs=ids.split(","); //字符分割 	
			$(strs).each(
				 function(i){
				 	var v=$(strs).get(i);
				 	$("#"+v).attr("checked","true");
				 	if("collegeType"==idType){
				 		selectAllMajor(v,"check");
				 	}else if("majorType"==idType){
				 		selectAllClass(v,"check");
				 	}
				 }
			
			);
    	}
	}
    </script>
    </head>
<body>
<div id="contentwrapper">
    <div class="main_content">   
        <div class="row-fluid">
            <#if student ?? >
	        <div class="row-fluid">	
		        <div class="span12">
		            <h3 class="heading">
				                活动信息编辑页面
			        </h3>
			    </div>
			</div>
    		<form id="activitySumbit" class="form_validation_reg" action="" method="post">
				<div class="span12">
				<input id="check_error" type="hidden" name="check_error" /> 
				<input id="id" type="hidden" name="id" <#if activity??> value="${(activity.id)!""}" </#if> />
				<#if student.college ??> 
					<input id="studentCollegeId" type="hidden" name="studentCollegeId" value="${student.college.id!""?html}"/>
					<input id="studentCollegeName" type="hidden" name="studentCollegeName" value="${student.college.name!""?html}"/>
					<#if volunteer??>
						<input id="volunteerId" type="hidden" name="volunteerId" value="${volunteer.id!""?html}"/>
						<input id="volunteerName" type="hidden" name="volunteerName" value="${volunteer.officeAddress!""?html}"/>
					</#if>
	            </#if> 
	            <input id="flags" type="hidden" name="flags" value=""/>	
				    <div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<label class="span3">活动名称<span class="f_req">*</span></label>
								<div class="span9">
									<input id="activityName" name="activityName" type="text" <#if activity??>value="${activity.activityName!""?html}"</#if> />
							    </div>
							</div>
							<div class="span6">
								<label class="span3">活动类别<span class="f_req">*</span></label>
								<div class="span9">
									<select size="1" id="activityCategory" name="activityCategory.id" aria-controls="dt_gal" onChange="categoryOnChange()">
										<option value="">请选择..</option>
										<#if activityCategoryDicList ??>
									      <#list activityCategoryDicList as g>
											<#if activity ?? && activity.activityCategory ?? && activity.activityCategory.id == g.id>
													<option  value="${g.id}" selected="selected">${g.name}</option>	
												<#else>
													<option value="${g.id}" >${g.name}</option>
												</#if>
											</#list>
										</#if>
									</select>
							    </div>
                            </div>
						</div>
					</div>
					<div class="formSep">
						<div class="row-fluid">
						    <div class="span6">
								<label class="span3">活动报名方式<span class="f_req">*</span></label>
								<div class="span9">
									<select size="1" id="registraForm" name="registraForm.id" aria-controls="dt_gal" >
										<option value="">请选择..</option>
										<#if activityRegistraFormDicList ??>
									      <#list activityRegistraFormDicList as g>
											<#if activity ?? && activity.registraForm ?? && activity.registraForm.id == g.id>
												<option  value="${g.id}" selected="selected">${g.name}</option>	
											<#else>
												<option value="${g.id}" >${g.name}</option>
											</#if>
										  </#list>
										</#if>
									</select>
							    </div>
							</div>
							<div class="span6">
								<label class="span3">活动类型<span class="f_req">*</span></label>
								<div class="span9">
		                            <select size="1" id="activityType" onchange="typeChange()" name="activityType.id" aria-controls="dt_gal" >
										<option value="">请选择..</option>
										<#if activityTypeDicList ??>
									      <#list activityTypeDicList as g>
											<#if activity ?? && activity.activityType ?? && activity.activityType.id == g.id>
												<option  value="${g.id}" selected="selected">${g.name}</option>	
											<#else>
												<option value="${g.id}" >${g.name}</option>
											</#if>
										  </#list>
										</#if>
									</select>
							    </div>
							</div>
						</div>
					</div>
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<label class="span3">活动级别<span class="f_req">*</span></label>
								<div class="span9">
		                            <select size="1" id="activityLevel" name="activityLevel.id" onchange="levelChange()" aria-controls="dt_gal" >
										<option value="">请选择..</option>
										<#if activityLevelDicList ??>
									    	<#list activityLevelDicList as g>
												<#if activity ?? && activity.activityLevel ?? && activity.activityLevel.id == g.id>
													<option  value="${g.id}" selected="selected">${g.name}</option>	
												<#else>
													<option value="${g.id}" >${g.name}</option>
												</#if>
											</#list>
										</#if>
									</select>
							    </div>
							</div> 
							<div class="span6 type" style="display:none">
								<label class="span3">社团名称<span class="f_req">*</span></label>
								<div class="span9">
								<select size="1" id="association" name="association.id" aria-controls="dt_gal" >
									<option value="">请选择..</option>
									<#if associationList ??>
									    <#list associationList as g>
											<#if activity ?? && activity.association ?? && activity.association.id == g.id>
												<option  value="${g.id}" selected="selected"><#if g.associationRegisterName??>${g.associationRegisterName!""}<#else>${g.associationName!""}</#if></option>	
											<#else>
												<option value="${g.id}" ><#if g.associationRegisterName??>${g.associationRegisterName!""}<#else>${g.associationName!""}</#if></option>
											</#if>
										</#list>
									</#if>
								</select>
							    </div>
							</div>
						</div>
					</div>
					<div class="formSep">
						<div class="row-fluid">
						    <div class="span6">
								<label class="span3">活动时间<span class="f_req">*</span></label>
								<div class="span9">
	                            	<input id="activityTime" name="activityTime" type="text" class="Wdate"  onclick="WdatePicker({skin:'whyGreen', dateFmt:'yyyy-MM-dd'});" <#if activity ?? && activity.activityTime ??> value="${(activity.activityTime!"")?string("yyyy-MM-dd")}" </#if>/>												
							    </div>
							</div>
							<div class="span6">
								<label class="span3">活动地点<span class="f_req">*</span></label>
								<div class="span9 address">
									<input id="activityAddress" name="activityAddress" type="text" value="${activity.activityAddress!""?html}" />
							    </div>
							    <div class="span9 vaddress" style="display:none">
									<select size="1" id="volunteerAddress" name="volunteerAddress.id" aria-controls="dt_gal" >
										<option value="">请选择..</option>
										<#if volunteerList ??>
										    <#list volunteerList as g>
												<#if activity ?? && activity.volunteerAddress ?? && activity.volunteerAddress.id == g.id >
													<option  value="${g.id}" selected="selected">${g.officeAddress}</option>	
												
												<#else>
													<option value="${g.id}" >${g.officeAddress}</option>
												</#if>
											</#list>
										</#if>
									</select>
								</div>
							</div>
						</div>
					</div>
					 <div class="formSep">
						<div class="row-fluid">
						    <div class="span6">
								<label class="span3">活动组织部门联系人<span class="f_req">*</span></label>
								<div class="span9">
								    <input id="contactType" name="contactType" type="hidden" value="<#if activity ?? && activity.contactStudents ??>student</#if>"/>
					                <input id="_managerTeacherId" name="contactTeachers.id" type="hidden" class="span6" <#if activity ?? && activity.contactTeachers ??>value="${activity.contactTeachers.id!""?html}"</#if>/>
					                <input id="_managerStudentId" name="contactStudents.id" type="hidden" class="span6" <#if activity ?? && activity.contactStudents ??>value="${activity.contactStudents.id!""?html}"</#if>/>
									<input id="_managerName" name="_managerName" type="text" readonly="true" <#if activity ?? && activity.contactTeachers ??>value="${activity.contactTeachers.name!""?html}" <#elseif activity ?? && activity.contactStudents ??>value="${activity.contactStudents.name!""?html}" </#if>/>
									<a id="course-lecture-select"  style="margin-left: -4px;;margin-top:-10px" href="javascript:void(0);" onclick="selectSchoolTeacherAndStudentRadio('${(activity.contactStudents.id)!""}','${(activity.contactTeachers.id)!""}')" class="btn"><i class="icon-search"></i></a>
							    </div>
							</div>
							<div class="span6">
								<label class="span3">联系电话<span class="f_req">*</span></label>
								<div class="span9">
									<input id="managerPhone" name="managerPhone" type="text" value="${activity.managerPhone!""?html}" />	
							    </div>
							</div>
						</div>	
                    </div>
                    <div class="formSep">
						<div class="row-fluid">
						    <div class="span6">
								<label class="span3">参与人员数目<span class="f_req">*</span></label>
								<div class="span9">
									<input id="members" name="members" type="text" <#if activity.members!=0>value="${activity.members!""?html}"</#if>/>
							    </div>
							</div>
							<div class="span6">
								<label class="span3">工作人员数目<span class="f_req">*</span></label>
								<div class="span9">
									<input id="workerNum" name="workerNum" type="text" <#if activity.members!=0>value="${activity.workerNum!""?html}"</#if> onChange="workers();"/>
							    </div>
							</div>
						</div>
					</div>
	                <div class="formSep">
						<div class="row-fluid">
							<div class="span9">
								<label class="span2">工作人员<span class="f_req">*</span></label>
								<div class="span10">
									<#--><input id="_workerIds" name="workerIds" type="hidden" class="span6" value="${(workerIds!"")?html}"/>-->
									<textarea name="workers" id="workers_" cols="12" rows="5" class="span9">${((activity.workers)!"")?html}</textarea>
									<#--><button class="btn btn-info" type="button" onclick="selectTeacherCheck('_worker')">选 择</button>-->
							    </div>
							</div>
						</div>
					</div> 
	                <div class="activityCategoryIn" style="display:none">
	                	<#include "/activity/info/activityInfo/activityInfoInsideEdit.ftl">
	                </div>
	                <div class="activityCategoryOut" style="display:none">
	                	<#include "/activity/info/activityInfo/activityInfoOutsideEdit.ftl">
	                </div>
	                <div class="formSep">
						<div class="row-fluid" >
						    <div class="span9">
								<label class="span2">组织部门<span class="f_req"></span></label>
								<div class="span10">
	                            	<textarea name="organizer" id="organizer" class="span9" rows="5">${(activity.organizer)!""}</textarea>
							    </div>
							</div>
						</div>	
	                </div>
	                <div class="formSep">
						<div class="row-fluid">
						    <div class="span9">
								<label class="span2">活动简介<span class="f_req">*</span></label>
								<div class="span10">
	                            	<textarea name="activityIntro" id="activityIntro" class="span9" rows="5">${(activity.activityIntro)!""}</textarea>
							    </div>
							</div>
						</div>	
	                </div>
	                <div class="formSep">
						<div class="row-fluid">
						    <div class="span9">
								<label class="span2">活动安全安排</label>
								<div class="span10">
	                            	<textarea name="security" id="security" class="span9" rows="5">${(activity.security)!""}</textarea>
							    </div>
	                        </div>
						</div>
                    </div>
                    <br/>
		        	<div class="row-fluid">
		        	<div class="span6">
						<div class="span3">
						</div>
						<div class="span9">
		                    <button class="btn btn-info"  type="button" onclick="onSub('0')">保 存</button>
				            <button class="btn btn-info"  type="button" onclick="onSub('1')">提 交</button>
				            <#if activity ?? && activity.processStatus ?? && activity.processStatus=='REJECT'>
					  		    <button class="btn btn-info" type="button" onclick="approve.showHis('${(activity.id)!""}')">审核历史</button>
							</#if>
				            <button class="btn" type="button" onclick="goToView()">返 回</button>
			            </div>
			        </div>
			        </div>				
				</div>
			</form>
			<#else>
    		   <#include "/common/common/commonMessage.ftl">
            </#if>
			</div>			
        </div>
        <#include "/apw/instance/approvers.ftl"/>
    </div>
     <#-- 审核历史查看 -->
     <#include "/apw/instance/approveHistory.ftl">
     <#--教师和学生单选-->
     <#include "/comp/studentAndteacher/queryStudentAndTeacherRadioModal.ftl">  
     <#--教师单选-->
     <#include "/comp/teacher/queryTeacherAllRadioModal.ftl">
     <#--教师多选-->
     <#include "/comp/teacher/queryTeacherCheckBoxModal.ftl">
</body>
</html>