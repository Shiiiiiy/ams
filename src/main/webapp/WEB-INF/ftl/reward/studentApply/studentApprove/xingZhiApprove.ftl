<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- ajax form-->
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
		<script src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
		<script src="${rc.contextPath}/lib/jquery-ui/jquery-ui-1.8.20.custom.min.js"></script>
		<script src="${rc.contextPath}/js/bdp_fileupload.progressbar.js"></script>
		 <script src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script>
		<link rel="stylesheet" href="${rc.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.min.css" />
		<!-- multiselect -->
	    <link rel="stylesheet" href="${rc.contextPath}/lib/multiselect/css/multi-select.css" />
	    <script src="${rc.contextPath}/js/apw/apw_check.js"></script>
    	<script src="${rc.contextPath}/js/common/common_approve.js"></script>
    	
		<script>
		
		    var myValidator;
			
			$("document").ready(function(){
           		myValidator= $("#stuApplyEdit").compValidate({
					rules:{
						approveMessage:{maxlength:500}
					},
					messages:{
						approveMessage:{maxlength:'最多只能输入500字'}
					}
				});
			});
		
			//保存
			function saveStuApply(){
				copyFileIdInput();
				$("#stuApplyEdit").submit();
			}
			
			function changeSecondAwardName(){
				var adjustFlag = $("#adjustFlag").val();
				var oldSecondName = $("#checkSecondAwardName").val();
				var newSecondName = $("#secondAwardName").val();
				var stuApplyId = $("#stuApplyInfoId").val();
				if(adjustFlag == "true" && oldSecondName != newSecondName) {
					var data = {stuApplyId:stuApplyId,secondAwardName:newSecondName};
					$.post("${rc.contextPath}/reward/studentapprove/opt-save/changeApproveInfo.do",data);
				}
				
			}
			
			//表单提交
			function doApprove(approveKey){
					if("PASS"==approveKey){
						$.ajax({
							url: "${rc.contextPath}/reward/studentApprove/opt-query/checkApprovedPass.do",
							async:false,
							cache:false,
							type:"post",
							data:{stuApplyId:''+$("#stuApplyInfoId").val()},
						    success:function(data){
								if(data=="success"){
									fillDefaltMessage("通过");
									if(myValidator.form()){
										if(confirm("确定要通过？")){
											//更改行知奖学金等级
											changeSecondAwardName();
											if(apw.isFinalTask($("#stuApplyInfoId").val())){//最后一个节点审批
												
												apw.approveCurProcess("SINGLE",$("#stuApplyInfoId").val(),'',"PASS",$("#approveMessage").val());
											}else{//中间节点审批
												apw.selectNextApprover($("#stuApplyInfoId").val(),approveKey,"REWARD_STUDENT_APPLY_APPROVE",$("#approveMessage").val());
											}
										}
									}
							    }else{
							    	$.sticky("名额已超!", {autoclose:5000, position:"top-right", type:"st-error"});
							    	return;
							    }
							}
						 });
					}else if("NOT_PASS"==approveKey){
						fillDefaltMessage("不通过");
						if(myValidator.form()){
							if(confirm("确定要不通过？")){
								apw.approveCurProcess("SINGLE",$("#stuApplyInfoId").val(),'',"NOT_PASS",$("#approveMessage").val());
							}else{ 
								$("#approveMessage").val(""); 
							}
						}	
					}else if("REJECT"==approveKey){
						fillDefaltMessage("驳回");
						if(myValidator.form()){
							if(confirm("确定要驳回？")){
								apw.approveCurProcess("SINGLE",$("#stuApplyInfoId").val(),'',"REJECT",$("#approveMessage").val());
							}else{ 
								$("#approveMessage").val(""); 
							}
						}
					}
			}
			
			/**
			  * 为审批意见默认赋值
			  */
			function fillDefaltMessage(defultMsg){
			    var curMsg = $.trim($("#approveMessage").val());
				if(comp.isNull(curMsg)){
					$("#approveMessage").val(defultMsg);
				}
			}
			
			//执行业务系统操作
			function doAmsAction(userId,approveKey,approveStatus,processStatusCode){
				$.ajax({
							url:"${rc.contextPath}/reward/studentapprove/opt-query/saveApproveInfo.do",
							async:false,
							cache:false,
							type:'POST',
							data:{nextApproverId:userId,objectId:$("#stuApplyInfoId").val(),approveStatus:approveStatus,processStatusCode:processStatusCode},
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
					 //返回列表页
					window.location.href="${rc.contextPath}/reward/studentapprove/opt-query/queryStudentApprovePage.do";
			}
			
		</script>
		<style>
			.modal{width:320px;margin-top:-180px;margin-left:-80px}
			.fileupload-info{width:740px}
		</style>
    </head>
    <body>
		<div id="contentwrapper">
		    <div class="main_content">
		    	<div class="row-fluid">
					<div class="span12">
						<h3 class="heading">学生评优申请审批页面</h3>
					</div>
				</div>
				
				
				
				<div class="row-fluid">
					<div class="span12">
						<h4 class="heading">评奖条件</h3>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span12">
							<div class="span6">
						    	<div class="span4">
									<span>学年</span>
						    	</div>
						    	<div class="span4">
									<input name="schoolYear" value="<#if award??>${award.schoolYear.name!""}<#elseif stuInfo??>${stuInfo.awardTypeId.schoolYear.name!""}</#if>" readonly />
									<input id="checkSecondAwardName" type="hidden" name="secondAwardName" value="${secondAwardName!""}">
									<input id="adjustFlag" type="hidden" name="adjustFlag" value="${adjustFlag!""}">
									
								</div>
						    </div>
						    <div class="span6">
						    	<div class="span4">
									<span>奖项名称</span>
						    	</div>
						    	<div class="span4">
									<input name="awardInfoId.awardName" value="<#if award??>${award.awardInfoId.awardName!""}<#elseif stuInfo??>${stuInfo.awardTypeId.awardInfoId.awardName!""}</#if>" readonly />
								</div>
						    </div>
					    </div>
					</div>
				</div>
				<#if adjustFlag??>
					<div class="formSep">	
						<div class="row-fluid">
							<div class="span12">
								<div class="span6">
							    	<div class="span4">
										<span>二级奖项名称</span>
							    	</div>
							    	<div class="span4">
										<select size="1" id="secondAwardName" name="secondAwardName.code" aria-controls="dt_gal" class="selectoption" >
											<#list secondAwardNameList as d>
												<#if stuInfo.awardTypeId?? && stuInfo.awardTypeId.secondAwardName.code==d.code>
	    					    	            	<option  value="${d.code}" selected="selected">${d.name?html}</option>
	    					    	            <#else>
	    					    	            	<option  value="${d.code}" >${d.name?html}</option>
	    					    	            </#if>
											</#list>
										</select>
									</div>
							    </div>
						    </div>
						</div>
					</div>
				<#elseif (award?? && award.secondAwardName??) || (stuInfo?? && stuInfo.awardTypeId?? && stuInfo.awardTypeId.secondAwardName??)>
					<div class="formSep">	
						<div class="row-fluid">
							<div class="span12">
								<div class="span6">
							    	<div class="span4">
										<span>二级奖项名称</span>
							    	</div>
							    	<div class="span4">
										<input name="secondAwardName" value="<#if award??>${award.secondAwardName.name!""}<#elseif stuInfo??>${stuInfo.awardTypeId.secondAwardName.name!""}</#if>" readonly />
									</div>
							    </div>
						    </div>
						</div>
					</div>
				</#if>
				
				
				<div class="formSep">
					<div class="row-fluid">
						<div class="span12">
							<div class="span6">
						    	<div class="span4">
									<span>申请开始日期</span>
						    	</div>
						    	<div class="span4">
									<input name="beginDate" value="<#if award??>${award.beginDate?string('yyyy-MM-dd')!""}<#elseif stuInfo??>${stuInfo.awardTypeId.beginDate?string('yyyy-MM-dd')!""}</#if>" readonly />
								</div>
						    </div>
						    <div class="span6">
						    	<div class="span4">
									<span>申请截止日期</span>
						    	</div>
						    	<div class="span4">
									<input name="endDate" value="<#if award??>${award.endDate?string('yyyy-MM-dd')!""}<#elseif stuInfo??>${stuInfo.awardTypeId.endDate?string('yyyy-MM-dd')!""}</#if>" readonly />
								</div>
						    </div>
						</div>
					</div>
				</div>
				
		    	<div class="row-fluid">
		    		
		    			
						<#if conInfoList??>
							<#list conInfoList as d>
								<#if (d_index+1)%2 == 1 >
								<div class="formSep">
									<div class="row-fluid">
										<div class="span6">
									    	<div class="span4">
												<span>${d.textName}</span>
									    	</div>
									    	<div class="span4">
									    		<#if (d.conditionName?index_of("BOX") > -1)>
													<input name="${d.conditionName}" value="<#if d.conditionValue == '1'>一等奖学金<#elseif d.conditionValue == '2'>二等奖学金<#else>三等奖学金</#if>" readonly />
												<#elseif (d.conditionName?index_of("Radio") > -1)>
													<input name="${d.conditionName}" value="<#if d.conditionValue == 'Y'>是<#else>否</#if>" readonly />
												<#else>
													<input name="${d.conditionName}" value="${d.conditionValue}" readonly />
												</#if>
											</div>
									    </div>
									</#if>    
									<#if (d_index+1)%2 == 0 >
										<div class="span6">
									    	<div class="span4">
												<span>${d.textName}</span>
									    	</div>
									    	<div class="span4">
									    		<#if (d.conditionName?index_of("BOX") > -1)>
													<input name="${d.conditionName}" value="<#if d.conditionValue == '1'>一等奖学金<#elseif d.conditionValue == '2'>二等奖学金<#else>三等奖学金</#if>" readonly />
												<#elseif (d.conditionName?index_of("Radio") > -1)>
													<input name="${d.conditionName}" value="<#if d.conditionValue == 'Y'>是<#else>否</#if>" readonly />
												<#else>
													<input name="${d.conditionName}" value="${d.conditionValue}" readonly />
												</#if>
											</div>
									    </div>
									</div>
								</div></#if>
								<#if (d_index+1)==(conInfoList?size) && (conInfoList?size)%2==1>
									</div>
									</div>
								</#if> 
							</#list>		    			
		    			</#if>
		    			
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span4">
		    				    		<span>备注</span>
		    						</div>
		    				    	<div class="span4">
										<textarea id="mainEvent" name="condition.comments" col="12" rows="3" style="width: 770px; height: 111px;" readonly>${condition.comments!""}</textarea>
									</div>
	    				    	</div>
		    				</div>
		    			</div>
		    			
		    			<#--名额限制引入-->
		    			<#include "/reward/awardcommon/quotaLimitList.ftl" />
		    			
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span4">
							    		<label>相关附件</label>
							    	</div>
		    				    	<div class="span4">
										 <#if conditionUploadFileRefList??>	
											<#list conditionUploadFileRefList as p>
												<div class="fileupload-info">
													<a href="${rc.contextPath}/sys/sysConfig/file.do?id=${p.uploadFile.id}"><strong>${p.uploadFile.name}&nbsp;(${p.uploadFile.fileSize})</strong></a>
													<input type="hidden" id="fileId" name="fileId" value="${p.uploadFile.id}"/>	
												</div>					
											</#list>
										 </#if>
									</div>
		    				    </div>
		    				</div>
		    			</div>
		    			
						
						<div class="row-fluid">
							<div class="span12">
								<h4 class="heading">个人信息</h3>
							</div>
						</div>
						<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span4">
			    						<span>姓名</span>
		    						</div>
		    						<div class="span4">
				    					<input id="studentId.name" name="studentId.name" value="${stuInfo.studentId.name}" readonly>
		    						</div>
		    					</div>
		    					<div class="span6">
		    						<div class="span4">
	    				    			<span >学号</span>
    				    			</div>
		    				    	<div class="span4">
										<input id="studentId.id" name="studentId.id" value="${stuInfo.studentId.id!""}" readonly>
									</div>
	    				    	</div>
		    				</div>
	    				</div>
	    				
	    				<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span4">
			    						<span>学院</span>
		    						</div>
		    						<div class="span4">
				    					<input id="studentId.college" name="studentId.college.name" value="<#if stuInfo.studentId?? && stuInfo.studentId.college??>${stuInfo.studentId.college.name}</#if>" readonly>
		    						</div>
		    					</div>
		    					<div class="span6">
		    						<div class="span4">
	    				    			<span >班级</span>
    				    			</div>
		    				    	<div class="span4">
										<input id="studentId.id" name="studentId.classId.className" value="<#if stuInfo.studentId?? && stuInfo.studentId.classId??>${stuInfo.studentId.classId.className!""}</#if>" readonly>
									</div>
	    				    	</div>
		    				</div>
	    				</div>
	    				<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span4">
			    						<span>性别</span>
		    						</div>
		    						<div class="span4">
				    					<input id="studentId.name" name="studentId.genderDic.name" value="<#if stuInfo.studentId?? && stuInfo.studentId.genderDic??>${stuInfo.studentId.genderDic.name}</#if>" readonly>
		    						</div>
		    					</div>
		    					<div class="span6">
		    						<div class="span4">
	    				    			<span >出生年月</span>
    				    			</div>
		    				    	<div class="span4">
										 <input id="studentId.id" name="studentId.brithDate" value="<#if stuInfo.studentId?? && stuInfo.studentId.brithDate??>${stuInfo.studentId.brithDate?string('yyyy-MM-dd')!""}<#else></#if>" readonly>   
									</div>
	    				    	</div>
		    				</div>
	    				</div>
	    				
	    				<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span4">
			    						<span>民族</span>
		    						</div>
		    						<div class="span4">
				    					<input id="studentId.national" name="studentId.national" value="<#if stuInfo.studentId?? && stuInfo.studentId.national??>${stuInfo.studentId.national!""}</#if>" readonly>
		    						</div>
		    					</div>
		    					<div class="span6">
		    						<div class="span4">
	    				    			<span >籍贯</span>
    				    			</div>
		    				    	<div class="span4">
										<input id="studentId.id" name="studentId.nativeDic.name" value="<#if stuInfo.studentId?? && stuInfo.studentId.nativeDic??>${stuInfo.studentId.nativeDic.name!""}</#if>" readonly>
									</div>
	    				    	</div>
		    				</div>
	    				</div>
	    				
	    				<#if conValueList??>
							<#list conValueList as d>
								<#if (d_index+1)%2 == 1 >
								<div class="formSep">
									<div class="row-fluid">
										<div class="span6">
									    	<div class="span4">
												<span>${d.textName}</span>
									    	</div>
									    	<div class="span4">
									    		<#if (d.conditionName?index_of("BOX") > -1)>
													<input name="${d.conditionName}" value="${d.conditionValue!""}" readonly />
												<#elseif (d.conditionName?index_of("Radio") > -1)>
													<input name="${d.conditionName}" value="${d.conditionValue!""}" readonly />
												<#else>
													<input name="${d.conditionName}" value="${d.conditionValue!""}" readonly />
												</#if>
											</div>
									    </div>
									</#if>    
									<#if (d_index+1)%2 == 0 >
										<div class="span6">
									    	<div class="span4">
												<span>${d.textName}</span>
									    	</div>
									    	<div class="span4">
									    		<#if (d.conditionName?index_of("BOX") > -1)>
													<input name="${d.conditionName}" value="${d.conditionValue!""}" readonly />
												<#elseif (d.conditionName?index_of("Radio") > -1)>
													<input name="${d.conditionName}" value="${d.conditionValue!""}" readonly />
												<#else>
													<input name="${d.conditionName}" value="${d.conditionValue!""}" readonly />
												</#if>
											</div>
									    </div>
									</div>
								</div></#if>
								<#if (d_index+1)==(conValueList?size) && (conValueList?size)%2==1>
									</div>
									</div>
								</#if> 
							</#list>		    			
		    			</#if>
					<#if (award?? && award.secondAwardName?? && award.secondAwardName.name?index_of("等奖")!=-1) || (stuInfo?? && stuInfo.awardTypeId.secondAwardName.name?index_of('等奖')!=-1)>
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span4">
		    				    		<span>不符合要求事项</span>
		    						</div>
		    				    	<div class="span4">
										<textarea id="misMatchThing" name="stuInfo.misMatchThing" col="12" rows="3" style="width: 770px; height: 111px;" readonly>${stuInfo.misMatchThing!""}</textarea>
									</div>
	    				    	</div>
		    				</div>
		    			</div>
		    			
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span4">
		    				    		<span>特别加分理由</span>
		    						</div>
		    				    	<div class="span4">
										<textarea id="specialReason" name="stuInfo.specialReason" col="12" rows="3" style="width: 770px; height: 111px;" readonly>${stuInfo.specialReason!""}</textarea>
									</div>
	    				    	</div>
		    				</div>
		    			</div>
		    			
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span4">
		    				    		<span>个人学年表现</span>
		    						</div>
		    				    	<div class="span4">
										<textarea id="personalPerformance" name="stuInfo.personalPerformance" col="12" rows="3" style="width: 770px; height: 111px;" readonly>${stuInfo.personalPerformance!""}</textarea>
									</div>
	    				    	</div>
		    				</div>
		    			</div>
		    		<#else>
			    			<div class="formSep">
			    				<div class="row-fluid">
			    					<div class="span6">
			    						<div class="span4">
			    				    		<span>申报理由<span class="f_req">*</span></span>
			    						</div>
			    				    	<div class="span4">
											<textarea id="applyReason" name="applyReason" col="12" rows="3" style="width: 770px; height: 111px;" readonly>${stuInfo.applyReason!""}</textarea>
										</div>
		    				    	</div>
			    				</div>
			    			</div>
			    		</#if>
		    		
		    		
		    		
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span4">
							    		<label>相关附件</label>
							    	</div>
		    				    	<div class="span4">
										 <#if uploadFileRefList??>	
											<#list uploadFileRefList as p>
												<div class="fileupload-info" >
													<a href="${rc.contextPath}/sys/sysConfig/file.do?id=${p.uploadFile.id}"><strong>${p.uploadFile.name}&nbsp;(${p.uploadFile.fileSize})</strong></a>
													<input type="hidden" id="fileId" name="fileId" value="${p.uploadFile.id}"/>	
												</div>					
											</#list>
										 </#if>
									</div>
		    				    </div>
		    				</div>
		    			</div>
		    		<form id="stuApplyEdit" method="post" action="${rc.contextPath}/reward/stucollegeapprove/opt-query/saveStuApplyApprove.do">
		    			<#-- 对象ID -->
		    			<input type="hidden" id="stuApplyInfoId" name="id" value="${stuInfo.id}">
		    			<input id="flags" type="hidden" name="flags"  value="${(flags)!""}">	
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span4">
		    				    		<span>审批意见</span>
		    						</div>
		    				    	<div class="span4">
										<textarea id="approveMessage" name="approveMessage" col="12" style="width: 770px; height: 111px;" rows="3"></textarea>
									</div>
	    				    	</div>
		    				</div>
		    			</div>	
    				</form>	
	    		</div>
	    			</br>
		    		<div class="row-fluid">
						<div class="span6">
							<div class="span4">
			        		</div>
				    		<div class="span8" >
				              	 <!--判断是保存还是提交，保存=0   提交=1 -->
							       <!--判断是通过还是拒绝保存=0   提交=1 -->
							    <button class="btn btn-info" type="button" id="save-pass" onclick="doApprove('PASS')">通 过</button>
							    <button class="btn btn-info" type="button" id="save-refuse" onclick="doApprove('REJECT')">拒 绝</button>
					  			<button class="btn btn-info" type="button" onclick="approve.showHis('${stuInfo.id}');">审批历史</button>
					  			<button class="btn" type="button" onclick="javascript:window.history.back(-1);">取 消</button>
					  			<input name="check_error" id="check_error" type="hidden" value="true"/>
			           		</div>
			           	</div>
			         </div>
			         
			<#include "/apw/instance/approvers.ftl"/>	           		
	    </div>
	    </div>
	    </div> 
	    <#-- 审核历史查看 -->
		<#include "/apw/instance/approveHistory.ftl">      		
	</body>
</html>