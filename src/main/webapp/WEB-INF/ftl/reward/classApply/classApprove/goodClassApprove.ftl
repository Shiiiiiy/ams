<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- ajax form-->
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
		<script src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
		<script src="${rc.contextPath}/lib/jquery-ui/jquery-ui-1.8.20.custom.min.js"></script>
		<script src="${rc.contextPath}/js/bdp_fileupload.progressbar.js"></script>
		<link rel="stylesheet" href="${rc.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.min.css" />
		<!-- multiselect -->
	    <link rel="stylesheet" href="${rc.contextPath}/lib/multiselect/css/multi-select.css" />
	    <script src="${rc.contextPath}/js/apw/apw_check.js"></script>
	    <script src="${rc.contextPath}/js/common/common_approve.js"></script>
		<script>
			//保存
			function saveClassApply(){
				copyFileIdInput();
				$("#classApplyEdit").submit();
			}
			
			//返回评优类型列表
			function returnPunishList(){   
				window.location.href="${rc.contextPath}/reward/classapprove/opt-query/queryClassApprovePage.do";
			}
			//表单提交
			function doApprove(approveKey){
					if("PASS"==approveKey){
						fillDefaltMessage("通过");
						if(myValidator.form()){
							if(confirm("确定要通过？")){
								if(apw.isFinalTask($("#classApplyInfoId").val())){//最后一个节点审批
									apw.approveCurProcess("SINGLE",$("#classApplyInfoId").val(),'',"PASS",$("#approveMessage").val());
								}else{//中间节点审批
									apw.selectNextApprover($("#classApplyInfoId").val(),approveKey,"REWARD_CLASS_APPLY_APPROVE",$("#approveMessage").val());
								}
							}else{ 
								$("#approveMessage").val(""); 
							}
						}
					}else if("NOT_PASS"==approveKey){
						fillDefaltMessage("不通过");
						if(myValidator.form()){
							if(confirm("确定要不通过？")){
								apw.approveCurProcess("SINGLE",$("#classApplyInfoId").val(),'',"NOT_PASS",$("#approveMessage").val());
							}else{ 
								$("#approveMessage").val(""); 
							}
						}	
					}else if("REJECT"==approveKey){
						fillDefaltMessage("驳回");
						if(myValidator.form()){
							if(confirm("确定要驳回？")){
								apw.approveCurProcess("SINGLE",$("#classApplyInfoId").val(),'',"REJECT",$("#approveMessage").val());
							}else{ 
								$("#approveMessage").val(""); 
							}
						}
					}
			}
			
			//执行业务系统操作
			function doAmsAction(userId,approveKey,approveStatus,processStatusCode){
					$.ajax({
							url:"${rc.contextPath}/reward/classapprove/opt-query/saveApproveInfo.do",
							async:false,
							cache:false,
							type:'POST',
							data:{nextApproverId:userId,objectId:$("#classApplyInfoId").val(),approveStatus:approveStatus,processStatusCode:processStatusCode},
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
					 window.location.href="${rc.contextPath}/reward/classapprove/opt-query/queryClassApprovePage.do"; 
			}
			
			var myValidator;
			
			$("document").ready(function(){
           		myValidator= $("#classApplyEdit").compValidate({
					rules:{
						approveMessage : {maxlength:500}
					},
					messages:{
						approveMessage : {maxlength:'最多只能输入500字'}
					}
				});
			});
			
			/**
			  * 为审批意见默认赋值
			  */
			function fillDefaltMessage(defultMsg){
			    var curMsg = $.trim($("#approveMessage").val());
				if(comp.isNull(curMsg)){
					$("#approveMessage").val(defultMsg);
				}
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
						<h3 class="heading">班级评优申请审批页面</h3>
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
									<input name="schoolYear" value="<#if award??>${award.schoolYear.name!""}<#elseif classInfo??>${classInfo.awardTypeId.schoolYear.name!""}</#if>" readonly />
								</div>
						    </div>
						    <div class="span6">
						    	<div class="span4">
									<span>奖项名称</span>
						    	</div>
						    	<div class="span4">
									<input name="awardInfoId.awardName" value="<#if award??>${award.awardInfoId.awardName!""}<#elseif classInfo??>${classInfo.awardTypeId.awardInfoId.awardName!""}</#if>" readonly />
								</div>
						    </div>
					    </div>
					</div>
				</div>
				<#if (award?? && award.secondAwardName??) || (classInfo?? && classInfo.awardTypeId?? && classInfo.awardTypeId.secondAwardName??)>
					<div class="formSep">
						<div class="row-fluid">
							<div class="span12">
								<div class="span6">
							    	<div class="span4">
										<span>二级奖项名称</span>
							    	</div>
							    	<div class="span4">
										<input name="secondAwardName" value="<#if award??>${award.secondAwardName.name!""}<#elseif classInfo??>${classInfo.awardTypeId.secondAwardName.name!""}</#if>" readonly />
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
									<input name="beginDate" value="<#if award??>${award.beginDate?string('yyyy-MM-dd')!""}<#elseif classInfo??>${classInfo.awardTypeId.beginDate?string('yyyy-MM-dd')!""}</#if>" readonly />
								</div>
						    </div>
						    <div class="span6">
						    	<div class="span4">
									<span>申请截止日期</span>
						    	</div>
						    	<div class="span4">
									<input name="endDate" value="<#if award??>${award.endDate?string('yyyy-MM-dd')!""}<#elseif classInfo??>${classInfo.awardTypeId.endDate?string('yyyy-MM-dd')!""}</#if>" readonly />
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
								<h4 class="heading">申请信息</h3>
							</div>
						</div>
						
						<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span12">
			    					<div class="span6">
			    						<div class="span4">
				    						<span>学院</span>
			    						</div>
			    						<div class="span4">
					    					<input id="college" name="classId.major.collage.name" value="${classInfo.classId.major.collage.name!""}" readonly>
			    						</div>
			    					</div>
			    					<div class="span6">
			    						<div class="span4">
				    						<span>专业</span>
			    						</div>
			    						<div class="span4">
					    					<input id="major" name="classId.major.majorName" value="${classInfo.classId.major.majorName!""}" readonly>
			    						</div>
			    					</div>
		    					</div>
		    				</div>
	    				</div>
						
						<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span12">
			    					<div class="span6">
			    						<div class="span4">
				    						<span>班级名称</span>
			    						</div>
			    						<div class="span4">
					    					<input id="studentId.name" name="studentId.name" value="${classInfo.classId.className}" readonly>
			    						</div>
			    					</div>
			    					<div class="span6">
			    						<div class="span4">
		    				    			<span >班主任</span>
	    				    			</div>
			    				    	<div class="span4">
											<input id="studentId.id" name="studentId.id" value="${classInfo.classId.headermaster.name!""}" readonly>
										</div>
		    				    	</div>
		    				    </div>	
		    				</div>
	    				</div>
	    				
	    				
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
													<input name="${d.conditionName}" value="" readonly />
												<#elseif (d.conditionName?index_of("Radio") > -1)>
													<input name="${d.conditionName}" value="" readonly />
												<#else>
													<input name="${d.conditionName}" value="" readonly />
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
													<input name="${d.conditionName}" value="" readonly />
												<#elseif (d.conditionName?index_of("Radio") > -1)>
													<input name="${d.conditionName}" value="" readonly />
												<#else>
													<input name="${d.conditionName}" value="" readonly />
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
		    				    		<span>班级获奖情况</span>
		    						</div>
		    				    	<div class="span4">
										<textarea id="classAwardInfo" name="classAwardInfo" col="12" rows="3" style="width: 770px; height: 111px;" readonly>${classInfo.classAwardInfo!""}</textarea>
									</div>
	    				    	</div>
		    				</div>
		    			</div>
						
		    			
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span4">
		    				    		<span>主要成绩</span>
		    						</div>
		    				    	<div class="span4">
										<textarea id="mainResult" name="mainResult" col="12" rows="3" style="width: 770px; height: 111px;" readonly>${classInfo.mainResult!""}</textarea>
									</div>
	    				    	</div>
		    				</div>
		    			</div>
		    		
		    		
		    		
		    		
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span4">
							    		<label>相关附件</label>
							    	</div>
		    				    	<div class="span4">
										 <#if uploadFileRefList??>	
											<#list uploadFileRefList as p>
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
		    		<form id="classApplyEdit" method="post" action="${rc.contextPath}/reward/classapprove/opt-query/saveClassApplyApprove.do">
		    			<#-- 对象ID -->
		    			<input type="hidden" id="classApplyInfoId" name="id" value="${classInfo.id}">
		    			<input id="flags" type="hidden" name="flags"  value="${(flags)!""}">	
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span4">
		    				    		<span>审批意见</span>
		    						</div>
		    				    	<div class="span4">
										<textarea id="approveMessage" name="approveMessage" col="12" rows="3" style="width: 770px; height: 111px;"></textarea>
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
							    <button class="btn btn-info" type="button" onclick="approve.showHis('${classInfo.id}');">审批历史</button>
					  			<button class="btn" type="button" onclick="javascript:window.history.back(-1);">取 消</button>
					  			<input name="check_error" id="check_error" type="hidden" value="true"/>
			           		</div>
			           	</div>
			         </div>
			         
		<#include "/apw/instance/approvers.ftl"/>	
	    </div>
	    </div>       		
		<#-- 审核历史查看 -->
		<#include "/apw/instance/approveHistory.ftl">  	             		
	</body>
</html>