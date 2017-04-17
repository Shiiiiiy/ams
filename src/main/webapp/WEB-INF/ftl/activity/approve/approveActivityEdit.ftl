<html>
 <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
    <script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
    <!-- animated progressbars -->
    <script src="${rc.contextPath}/js/bdp_fileupload.progressbar.js"></script>
    <script src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script> 
    <script src="${rc.contextPath}/js/apw/apw_check.js"></script> 
    <script src="${rc.contextPath}/js/common/common_approve.js"></script>
    <script>
     $(function(){
         //社团
	     var activityType=$("#activityType").val();
	     if(activityType=='402890ef50655380015065649de70004'){
		     $("#association").show();
		 }else{
		     $("#association").hide();
		 }
		 
		 //志愿者
		 if(activityType=='402890ef506553800150656876e10006'){
		     $(".vaddress").show();
		     $(".address").hide();
		 }else{
			 $(".vaddress").hide();
		     $(".address").show();
		 } 
     });
    //返回到查询信息页面
    function goToView(){
    window.location.href="${rc.contextPath}/activity/approve/opt-query/listApproveActivity.do";
    }
    var myValidator;
     //声明验证对象
   $(document).ready(function(){
		myValidator=$(".form_validation_reg").compValidate({
				rules:{
					approveReason:{required:true,maxlength:200}
				},
				messages:{
					approveReason:{required:'审批意见不能为空',maxlength:'审批意见太长【默认不超过200字符】'}
				}
		 });
    });
	
	//表单提交
	function doApprove(approveKey){
	    var activityCategory=$("#activityCategory").val();
	    var members=$("#members").val();
	    var activityLevel=$("#activityLevel").val();
		if("PASS"==approveKey){
				fillDefaltMessage("通过");
				if(myValidator.form()){
					if(confirm("确定要通过？")){
						if(apw.isFinalTask($("#id").val())){//最后一个节点审批
							apw.approveCurProcess("SINGLE",$("#id").val(),"","PASS",$("#approveReason").val());
						}else{//中间节点审批
							if(!activityCategory){
							     return;
								 comp.message("当前审批流中活动类别不存在，审批流无法继续，请联系管理员!","error");
							}else if(activityCategory=="402890ef5065538001506560a2d60001"&&(Number(members)>=200)){
								//校内活动审核
								 apw.selectNextApprover($("#id").val(),approveKey,"ACTIVITY_INFO_INSIDE_APPROVE",$("#approveReason").val());
							}else if(activityCategory=="402890ef506553800150656116b70002"&&(Number(members)>=30)){
								//校外活动审核
								if(activityLevel=="402890ef506e977a01506e9f76b70000"){
				        			//校级
				        			apw.selectNextApprover($("#id").val(),approveKey,"ACTIVITY_INFO_OUTSIDE_SCHOOL_APPROVE",$("#approveReason").val());
				        			
				        		}else{
				        			//院级
				        			apw.selectNextApprover($("#id").val(),approveKey,"ACTIVITY_INFO_OUTSIDE_COLLEGE_APPROVE",$("#approveReason").val());
				        			
				        		}
							}else if(activityLevel=="402890ef506e977a01506e9f76b70000"){
				       				//人数未达到走审批流的上限
				       				//zhangmx 1.判断院级与校级--走审批(校级)
				       			apw.selectNextApprover($("#id").val(),approveKey,"ACTIVITY_INFO_SCHOOL_APPROVE",$("#approveReason").val());
				       				
							}else if(activityLevel=="402890ef506e977a01506ea090ff0001"){
								//zhangmx 1.判断院级与校级--走审批(院级)
								apw.selectNextApprover($("#id").val(),approveKey,"ACTIVITY_INFO_COLLEGE_APPROVE",$("#approveReason").val());
								
							}
						}
					}else{ 
						return;
					}
				}
			}else if("NOT_PASS"==approveKey){
				fillDefaltMessage("不通过");
				if(myValidator.form()){
					if(confirm("确定要拒绝？")){
						apw.approveCurProcess("SINGLE",$("#id").val(),"NOT_PASS",$("#approveReason").val());
					}else{ return; }
				}	
			}else if("REJECT"==approveKey){
				fillDefaltMessage("驳回");
				if(myValidator.form()){
					if(confirm("确定要驳回？")){
						apw.approveCurProcess("SINGLE",$("#id").val(),'',"REJECT",$("#approveReason").val());
					}else{ return; }
				}
			}
	}
	/**
	  * 为审批意见默认赋值
	  */
	function fillDefaltMessage(defultMsg){
	    var curMsg = $.trim($("#approveReason").val());
		if(comp.isNull(curMsg)){
			$("#approveReason").val(defultMsg);
		}
	}
	
	//执行业务系统操作
	function doAmsAction(userId,approveKey,approveStatus,processStatusCode){
		$.ajax({
					url:"${rc.contextPath}/activity/approve/opt-add/saveApproveAction.do",
					async:false,
					cache:false,
					type:'POST',
					data:{nextApproverId:userId,objectId:$("#id").val(),approveStatus:approveStatus,processStatusCode:processStatusCode},
					success: function(data){
						var parsedJson = jQuery.parseJSON(data); 
						if(parsedJson.resultFlag=="success"){
						    comp.message("当前流程审批已操作完成!","info");
						}else if(parsedJson.resultFlag=="deprecated"){
							comp.message("审批流已废弃 !","error");
						}else if(parsedJson.resultFlag=="error"){
							comp.message("系统异常，请联系管理员 !","error");
						}
			   		}
			 }); 
			// window.location.href="${rc.contextPath}/activity/approve/opt-query/listApproveActivity.do"; 
	        $('#activityApproveForm').submit();
	}
	
	 $(function(){
		var activityCategory=$("#activityCategory").val();
	    if(activityCategory){
       	    $(".activityCategoryIn").hide();
       	    $(".activityCategoryOut").show();
	    }else{	    
       	   $(".activityCategoryIn").hide();
	       $(".activityCategoryOut").hide();
	    }
	});
 </script>
 </head>
<body>
<div id="contentwrapper">
    <div class="main_content">  
        <div class="row-fluid">
			<div class="span12">
		        <div class="row-fluid">	
				    <div class="span12">
				      <h3 class="heading">
						活动审核
					  </h3>
					</div>
				</div>
				<input name="errorText" id="errorText" type="hidden" value="${errorText!""}"/>
				<form id="activityApproveForm" class="form_validation_reg" action="${rc.contextPath}/activity/approve/opt-save/saveApproveReason.do" method="post"><@token/>	
					 <input id="id" type="hidden" name="id"  value="${(activity.id)!""}" />
					 <input id="activityCategory" type="hidden" name="activityCategory.id" <#if activity.activityCategory ??> value="${(activity.activityCategory.id)!""}"</#if> />
                     <input id="activityLevel" type="hidden" name="activityLevel.id" <#if activity.activityLevel ??> value="${(activity.activityLevel.id)!""}"</#if> />
                     <input id="members" type="hidden" name="members"  <#if activity.members!=0>value="${activity.members!""?html}"</#if>/>
                     
                     <#include "/activity/info/activityInfo/activityInfo.ftl">
			         <#include "/activity/info/activityInfo/activityInfoCreator.ftl">
					 <div class="formSep">
					     <div class="row-fluid">
							 <div class="span9">
								 <div class="span2">
									 <label>审核意见</label>
								 </div>
								 <div class="span10">
									 <textarea rows="5" cols="12" class="span9" id="approveReason" name="approveReason" ></textarea>
							     </div>
							 </div>
				         </div>
			         </div> 
				</form>
				<br/>
				<div class="row-fluid">
	            <div class="span9">
		            <div class="span2">
		            </div>
		            <div class="span9">
		            <!--判断是通过还是拒绝保存=0   提交=1 -->
				    <button class="btn btn-info" type="button" id="save-pass" onclick="doApprove('PASS')">通 过</button>
				    <button class="btn btn-info" type="button" id="save-refuse" onclick="doApprove('REJECT')">拒 绝</button>
				    <button class="btn btn-info" type="button" onclick="approve.showHis('${(activity.id)!""}')">审核历史</button>
					<button class="btn" type="button" onclick="goToView()">返 回</button>
					</div>
			    </div>
			    </div>
		    </div>
				<input name="check_error" id="check_error" type="hidden" value="true"/>
			</div>
		</div>
        <#-- 审核选人弹出框 -->        
        <#include "/apw/instance/approvers.ftl"/>
        </div>
        <#-- 审核历史查看 -->
        <#include "/apw/instance/approveHistory.ftl">	 
</body>
</html>
