<html>
 <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!--选人弹出框-->
    <script src="${rc.contextPath}/js/jquery.form.js"></script>
    <script src="${rc.contextPath}/js/common/common_approve.js"></script>
     <script>
      $(function(){
		var activityCategory=$("#activityCategory").val();
	    if(activityCategory){
	       if(activityCategory=='402890ef5065538001506560a2d60001'){
	       	    $(".activityCategoryIn").show();
	       	    $(".activityCategoryOut").hide();
	       }else{
	       	    $(".activityCategoryIn").hide();
	       	    $(".activityCategoryOut").show();
	       }
	    }else{	    
       	   $(".activityCategoryIn").hide();
	       $(".activityCategoryOut").hide();
	    }
	     var holdStatus=$('input:radio[name="holdStatus.id"]:checked').val();
	     if(holdStatus){
	       if(holdStatus=='4028900f40cd477c0140cd4afd8d0001'){
	       	    $(".holdStatus").show();
	       	    $(".noHoldStatus").hide();
	       }else{
	       	    $(".holdStatus").hide();
	       	    $(".noHoldStatus").show();
	       }
	     }else{
	            $(".holdStatus").hide();
	       	    $(".noHoldStatus").hide();
	     }
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
	function signUp(){
	     var activityId=$("#activityId").val();
	     comp.confirm("确认要报名吗？",function(r){
		 if(r){
			 $.ajax({
					url:'${rc.contextPath}/activity/signup/opt-add/applyActivitySignUp.do',
					async:false,
					cache: false,
					type: "POST",
					data:{activityId:activityId},
					success: function(data){
					     $(".status").show();
					     $(".signStatus").hide();
					if(data=='success'){
				 	     comp.message("报名成功!","info");
				    }else{
				    	 comp.message("报名失败!","info");
	                     window.location.href="${rc.contextPath}/activity/signup/opt-query/listSignUpActivity.do";
				    }
				    }
				});
				}
			 });
	   //  var activityId=$("#activityId").val();
	   // window.location.href="${rc.contextPath}/activity/signup/opt-add/applyActivitySignUp.do?activityId="+activityId;
	}
	function goToView(){
	   window.location.href="${rc.contextPath}/activity/signup/opt-query/listSignUpActivity.do";
	}
    function eisdResponse(){
        var fromId = "activityWorkersListForm";
		var pageNo = $("#"+fromId+"pageTagFormIdpageNo").val();
		var activityId = $("#activityId").val();
		var param = {pageNo:pageNo,activityId:activityId};
		$("#activityWorkersList").load("${rc.contextPath}/activity/signup/nsm/loadActivityWorkersList.do",param,function(){});
	}
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
								活动信息查看页面
						    </h3>
					    </div>
					</div>
					<input id="activityId" name="activityId" value="${activity.id!""?html}" type="hidden" />
                   <div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
								    <label>活动名称</label>
                                </div>
								<div class="span9">
									<input id="activityName" name="activityName" <#if activity??>value="${activity.activityName!""?html}"</#if> readonly />
                                </div>
							</div>
							<div class="span6">
								<div class="span3">
									<label>活动类别</label>
                                </div>
								<div class="span9">
									<#if activity?? && activity.activityCategory ??>
										<input id="activityCategory" type="hidden" name="activityCategory.id" value="${activity.activityCategory.id!""?html}"/>
									    <input value="${activity.activityCategory.name!""?html}" readonly/>
									<#else>
										<input id="activityCategory" name="activityCategory" value="" readonly/>
									</#if>
                                </div>
                            </div>
						</div>
					</div>
					<div class="formSep">
						<div class="row-fluid">
						    <div class="span6">
								<div class="span3">
									<label>活动类型</label>
                                </div>
								<div class="span9">
									<#if activity ?? && activity.activityType ??>
									   <input id="activityType" type="hidden" name="activityType.id" value="${activity.activityType.id!""?html}"/>
									   <input value="${activity.activityType.name!""?html}" readonly/>
									<#else>
									   <input id="activityType" name="activityType" value="" readonly/>
									</#if>
                                </div>
							</div>
							<div class="span6">
								<div class="span3">
									<label>活动报名方式</label>
                                </div>
								<div class="span9">
									<#if activity ?? && activity.registraForm ??>
									   <input id="registraForm" type="hidden" name="registraForm.id" value="${activity.registraForm.id!""?html}"/>
									   <input value="${activity.registraForm.name!""?html}" readonly/>
									<#else>
									   <input id="registraForm" name="registraForm" value="" readonly/>
									</#if>
                                </div>
							</div>
						</div>
					</div>
					<div class="formSep">
						<div class="row-fluid">
						    <div class="span6">
						        <div class="span3">
									<label>活动级别</label>
								</div>
						        <div class="span9">
									<#if activity?? && activity.activityLevel ??>
										<input value="${activity.activityLevel.name!""?html}" readonly/>
									<#else>
										<input value="" readonly/>
									</#if>
								</div>												
							</div>
							<div class="span6" id="association">
						        <div class="span3">
									<label>社团名称</label>
								</div>
						        <div class="span9">
									<#if activity?? && activity.association ??>
										<input value="${activity.association.name!""?html}" readonly/>
									<#else>
										<input value="" readonly/>
									</#if>
								</div>												
							</div>
						</div>
					</div>
					<div class="formSep">
						<div class="row-fluid">
						    <div class="span6">
								<div class="span3">
									<label>活动时间</label>
                                </div>
								<div class="span9">
	                            	<input id="activityTime" name="activityTime" class="Wdate" <#if activity ?? && activity.activityTime ??> value="${(activity.activityTime!"")?string("yyyy-MM-dd")}" </#if> readonly/>												
                                </div>
							</div>
							<div class="span6">
								<div class="span3">
								<label>活动地点</label>
                                </div>
                                <div class="span9 address"  style="display:none">
									<input id="activityAddress" name="activityAddress" type="text" <#if activity ??>value="${activity.activityAddress!""?html}"</#if> readonly />
							    </div>
							    <div class="span9 vaddress" style="display:none">
									<input id="volunteerAddress" name="volunteerAddress.id" type="text" <#if activity ?? && activity.volunteerAddress ??>value="${activity.volunteerAddress.officeAddress!""?html}"</#if> readonly />
								</div>
							</div>
						</div>
					</div>
					<div class="formSep">
						<div class="row-fluid">
						    <div class="span6">
								<div class="span3">
									<label>活动组织部门联系人</label>
                                </div>
								<div class="span9">
								    <input id="_manager" name="manager" type="hidden" class="span6" <#if activity ?? && activity.contacts ??>value="${activity.contacts.name!""?html}"</#if>/>
									<input id="_managerName" name="_managerName" type="text" readonly="true" <#if activity ?? && activity.contactTeachers ??>value="${activity.contactTeachers.name!""?html}" <#elseif activity ?? && activity.contactStudents ??>value="${activity.contactStudents.name!""?html}" </#if>/>
                                </div>
							</div>
							<div class="span6">
								<div class="span3">
									<label>联系电话</label>
                                </div>
								<div class="span9">
									<input id="managerPhone" name="managerPhone" <#if activity ??>value="${activity.managerPhone!""?html}"</#if> readonly/>	
                                </div>
							</div>
						</div>	
                    </div>
                    <div class="formSep">
						<div class="row-fluid">
						    <div class="span6">
								<div class="span3">
									<label>参与人员数目</label>
                                </div>
								<div class="span9">
									<input id="members" name="members" <#if activity ??>value="${activity.members!""?html}"</#if> readonly/>
                                </div>
							</div>
							<div class="span6">
								<div class="span3">
									<label>工作人员数目</label>
                                </div>
								<div class="span9">
									<input id="workerNum" name="workerNum" <#if activity ??>value="${activity.workerNum!""?html}"</#if> readonly/>
                                </div>
							</div>
						</div>
					</div>
					<div class="formSep">
					    <div class="row-fluid">
						    <div class="span9">
								<div class="span2">
									<label>工作人员</label>
                                </div>
								<div class="span10">
								    <textarea name="workers" id="workers" class="span10"  rows="5" readonly><#if activity ??>${(activity.workers)!""}</#if></textarea>
		               				<#--><#include "/activity/info/activityInfo/activityInfoWorkers.ftl">-->
                                </div>
							</div>
						</div>
		            </div>
					<div class="activityCategoryIn" style="display:none">
	                	<#include "/activity/info/activityInfo/activityInfoInsideReadonlyEdit.ftl">
	                </div>
	                <div class="activityCategoryOut" style="display:none">
	                	<#include "/activity/info/activityInfo/activityInfoOutsideReadonlyEdit.ftl">
	                </div>
	                <div class="formSep" >
						<div class="row-fluid" >
						    <div class="span9">
								<label class="span2">组织部门<span class="f_req"></span></label>
								<div class="span10">
	                            	<textarea name="organizer" readonly id="organizer" class="span10" rows="5">${(activity.organizer)!""}</textarea>
							    </div>
							</div>
						</div>	
	                </div>
	                <div class="formSep">
						<div class="row-fluid">
						    <div class="span9">
						        <div class="span2">
									<label>活动简介</label>
                                </div>
								<div class="span10">
	                            	<textarea name="activityIntro" id="activityIntro" class="span10"  rows="5" readonly><#if activity ??>${(activity.activityIntro)!""}</#if></textarea>
                                </div>
							</div>
						</div>	
	                </div>
	                <div class="formSep">
						<div class="row-fluid">
						    <div class="span9">
						        <div class="span2">
									<label>活动安全安排</label>
                                </div>
								<div class="span10">
	                            	<textarea name="security" id="security" class="span10"  rows="5" readonly> <#if activity ??>${(activity.security)!""}</#if></textarea>
                                </div>
	                        </div>
						</div>
                    </div>	
                    <#if status ?? && status == 'summary'>
				        <#include "/activity/info/activityInfo/activityInfoSummary.ftl">
				    </#if>
                    <br/>
	                <#include "/activity/info/activityInfo/activityInfoCreator.ftl">
                    <br/>
		        	<div class="row-fluid">
		        	<div class="span6">
						<div class="span3">
						</div>
						<div class="span9">
				            <div class="status" style="display:none">
					                <button class="btn" type="button" onclick="goToView()">返 回</button>
				            </div>
				            <div class="signStatus">
					            <#if status ?? && status=='signUp'>
					                <button class="btn btn-info" type="button" onclick="signUp()">报 名</button>
					                <button class="btn" type="button" onclick="goToView()">返 回</button>
					            <#else>
					                <button class="btn" type="button" onclick="window.close()">关 闭</button>
					            </#if>
					        </div>
				        </div>
			        </div>
			        </div>				
				</div>
			</div>
		</div>
	</div>
   </body>
</html>