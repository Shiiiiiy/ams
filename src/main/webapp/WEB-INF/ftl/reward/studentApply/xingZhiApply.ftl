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
			function saveStuApply(){
				copyFileIdInput();
				$("#stuApplyEdit").submit();
			}
			function copyFileIdInput(){
				$("#stuApplyEdit").append($("#fileUploadForm input[name='fileId']"));
			}
			
			//返回
			function returnPunishList(){   
				window.location.href="${rc.contextPath}/reward/studentapply/opt-query/queryStuApplyPage.do";
			}
			
			function onSub(stas){
				if(attachFlag.form()==false){
		 		    return false;
		 		}
		 		
		 		//copyFileIdInput();
		 		var check_error=$("#check_error").val();
		 		var warning=$("#error").val();
		 		if(undefined != warning){
		 			comp.message(warning,"error");
		 			return ;
		 		}
		 		$("#flags").val(stas);
		 		var stuInfoId = $("#stuApplyInfoId").val();
				if(check_error == "true"){
				   if(stas=="1"){
	                  	if(confirm("提交信息后不能修改，确认要提交吗？")){
                  			copyFileIdInput();
                  			$.ajax({
								url: "${rc.contextPath}/reward/studentapply/opt-query/saveStuApplyJson.do",
								async:false,
								cache:false,
								type:"POST",
								data:$('#stuApplyEdit').serialize(),
							    success: function(data){
									if(data!=null && data!=""){
								       apw.selectNextApprover(data,"INIT","REWARD_STUDENT_APPLY_APPROVE","");	
								    }else{
								    	$.sticky("学生信息保存失败", {autoclose:5000, position:"top-right", type:"st-error"});
								    	return;
								    }
								}
							});
	                  	}
			        }else{
		            	saveStuApply();//系统业务操作
				    }
				  }
 	       }
			
			/*
			 * 初始化当前发起流程【doInitAction方法名不可修改】
			 */
			function doInitAction(objectId,userId){
			    var url = "${rc.contextPath}/reward/studentapply/opt-add/saveCurProcess.do";
				apw.initCurProcess(url,objectId,userId);
			}
	        
	        /*
	         * 执行业务系统的操作
	         */
	        function doAmsAction(userId,approveKey,approveStatus,processStatusCode){
			   window.location.href="${rc.contextPath}/reward/studentapply/opt-query/queryStuApplyPage.do";
	        }
	        
			var attachFlag;
			$("document").ready(function(){
           		attachFlag = $("#stuApplyEdit").compValidate({
					rules:{
						misMatchThing:{required:true,maxlength:500},
						specialReason:{required:true,maxlength:500},
						applyReason:{required:true,maxlength:500},
						personalPerformance:{required:true,maxlength:500}     
					},
					messages:{
						misMatchThing:{required:'请填写不符合要求事项',maxlength:'最多只能输入500字'},
						specialReason:{required:'请填写特别加分理由',maxlength:'最多只能输入500字'},
						applyReason:{required:'请填写申报理由',maxlength:'最多只能输入500字'},
						personalPerformance:{required:'请填写个人学年表现',maxlength:'最多只能输入500字'}
					}
				});
			});
			
			
			var tag=0;
			function uploadfile(obj){	
			if($("#fileUploadForm .sepH_b").length>0||tag){//创建进度条以及包括页面中存在进度条时候不能再上传，平台只提供一个用户同时只能上传一个文件
				comp.message("同时只能上传一个文件，待上传完成后，再重试。","error");
				return;
			}
			
			//验证文件扩展名,该逻辑根据具体业务可自行调整
			var fileName=$(obj).val();
			fileName=fileName.substring(fileName.lastIndexOf("\\")+1,fileName.length);
			
			if(fileName.indexOf(".")>-1){
				var ext=fileName.substring(fileName.lastIndexOf(".")+1,fileName.length).toLowerCase();
				if("doc,docx,xls,xlsx,ppt,pptx,pdf,jpg,png,img,gif,txt,iso,zip,rar,".indexOf(ext+",")<0){
					comp.message("文件上传类型只能是jpg,png,img,gif,txt,iso,zip,doc,docx,请重新选择文件。","error");
					return;
				}
			}
			
			tag=1;
			var div=fileupload.create_fileupload_div($("#fileUploadForm"),$(obj).val());
			tag=0;	
			var param="?maxSize=10485760&isTempFile=false";//设置业务文件大小限制上线不能超过10M
			$("#fileUploadForm").attr("action","${rc.contextPath}/sys/sysConfig/singleFileUpload.do"+param);		
			$("#fileUploadForm").ajaxSubmit(function(data){
				
				try{//ie8才能执行如下代码
					data=$(data).unwrap().text();
					}catch(e){//ff chrome浏览器
					}
					
				try{
					var obj=eval(data)[0];				
					if(obj.fileId==''){
						comp.message(obj.errorInfo,"error");
						$(div).remove();
					}else{
						comp.message("上传文件完成。","info");
						$(div).append($("<input>",{						
							type:'hidden',
							val:obj.fileId,
							name:'fileId',
						}));
						$(div).find("div").remove();
						$(div).find("strong").append(("&nbsp;("+obj.fileSize+")"));
						$(div).find("strong").wrapAll("<a href=\"${rc.contextPath}/sys/sysConfig/file.do?id="+obj.fileId+"\"/>");
					}
				}catch(e){
					comp.message("文件提交服务器失败，请稍后刷新页面重试，如果还未成功请联系管理。","error");
				}				
				//下面代码解决重名文件可以连续上传问题，该功能需要根据实际业务进行调整	
				var file=$("#file");
				file.after(file.clone().val(''));
				file.remove();
			});
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
						<#if stuInfo?? && stuInfo.id??>
							<h3 class="heading">学生评优申请修改页面</h3>
						<#else>
							<h3 class="heading">学生评优申请页面</h3>
						</#if>
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
				
				<#if (award?? && award.secondAwardName??) || (stuInfo?? && stuInfo.awardTypeId?? && stuInfo.awardTypeId.secondAwardName??)>
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
												<span>${d.textName!""}</span>
									    	</div>
									    	<div class="span4">
									    		<#if (d.conditionName?index_of("BOX") > -1)>
													<input name="${d.conditionName}" value="<#if d.conditionValue == '1'>一等奖学金<#elseif d.conditionValue == '2'>二等奖学金<#else>三等奖学金</#if>" readonly />
												<#elseif (d.conditionName?index_of("Radio") > -1)>
													<input name="${d.conditionName}" value="<#if d.conditionValue == 'Y'>是<#else>否</#if>" readonly />
												<#else>
													<input name="${d.conditionName}" value="${d.conditionValue!""}" readonly />
												</#if>
											</div>
									    </div>
									</#if>    
									<#if (d_index+1)%2 == 0 >
										<div class="span6">
									    	<div class="span4">
												<span>${d.textName!""}</span>
									    	</div>
									    	<div class="span4">
									    		<#if (d.conditionName?index_of("BOX") > -1)>
													<input name="${d.conditionName}" value="<#if d.conditionValue == '1'>一等奖学金<#elseif d.conditionValue == '2'>二等奖学金<#else>三等奖学金</#if>" readonly />
												<#elseif (d.conditionName?index_of("Radio") > -1)>
													<input name="${d.conditionName}" value="<#if d.conditionValue == 'Y'>是<#else>否</#if>" readonly />
												<#else>
													<input name="${d.conditionName}" value="${d.conditionValue!""}" readonly />
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
	    				
	    				<#if conValueList??>
							<#list conValueList as d>
								<#if (d_index+1)%2 == 1 >
								<div class="formSep">
									<div class="row-fluid">
										<div class="span6">
									    	<div class="span4">
												<span>${d.textName}</span>
									    	</div>
									    	<div class="span5">
									    		<#if (d.conditionName?index_of("BOX") > -1)>
													<input name="${d.conditionName}" value="<#if (d.conditionValue?contains("不符合条件"))><#else>${d.conditionValue!""}</#if>" readonly />
												<#elseif (d.conditionName?index_of("Radio") > -1)>
													<input name="${d.conditionName}" value="<#if (d.conditionValue?contains("不符合条件"))><#else>${d.conditionValue!""}</#if>" readonly />
												<#else>
													<input name="${d.conditionName}" value="<#if (d.conditionValue?contains("不符合条件"))><#else>${d.conditionValue!""}</#if>" readonly />
												</#if>
												<#if (d.conditionValue?contains("不符合条件"))>
													<input id="error" name="error" type="hidden" value="${d.conditionValue!""}">
													<label style="color:red" for="${d.conditionName}" generated="true">${d.conditionValue!""}</label>
												</#if>
											</div>
									    </div>
									</#if>    
									<#if (d_index+1)%2 == 0 >
										<div class="span6">
									    	<div class="span4">
												<span>${d.textName}</span>
									    	</div>
									    	<div class="span5">
									    		<#if (d.conditionName?index_of("BOX") > -1)>
													<input name="${d.conditionName}" value="<#if (d.conditionValue?contains("不符合条件"))><#else>${d.conditionValue!""}</#if>" readonly />
												<#elseif (d.conditionName?index_of("Radio") > -1)>
													<input name="${d.conditionName}" value="<#if (d.conditionValue?contains("不符合条件"))><#else>${d.conditionValue!""}</#if>" readonly />
												<#else>
													<input name="${d.conditionName}" value="<#if (d.conditionValue?contains("不符合条件"))><#else>${d.conditionValue!""}</#if>" readonly />
												</#if>
												<#if (d.conditionValue?contains("不符合条件"))>
													<input id="error" name="error" type="hidden" value="${d.conditionValue!""}">
													<label style="color:red" for="${d.conditionName}" generated="true">${d.conditionValue!""}</label>
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
						
						
						
		    			<form id="stuApplyEdit" method="post" action="${rc.contextPath}/reward/studentapply/opt-query/saveStuApply.do">
		    				<input type="hidden" id="stuApplyInfoId" name="id" value="${stuInfo.id!""}">
			    			<input type="hidden" id="awardTypeId" name="awardId" value="${stuInfo.awardTypeId.id!""}">
			    			<input id="flags" type="hidden" name="flags"  value="${(flags)!""}">
			    		<#if (award?? && award.secondAwardName?? && award.secondAwardName.name?index_of("等奖")!=-1) || (stuInfo?? && stuInfo.awardTypeId?? && stuInfo.awardTypeId.secondAwardName?? && stuInfo.awardTypeId.secondAwardName.name?index_of('等奖')!=-1) >	
			    			<div class="formSep">
			    				<div class="row-fluid">
			    					<div class="span6">
			    						<div class="span4">
			    				    		<span>不符合要求事项<span class="f_req">*</span></span>
			    						</div>
			    				    	<div class="span4">
											<textarea id="misMatchThing" name="misMatchThing" col="12" rows="3" style="width: 770px; height: 111px;">${stuInfo.misMatchThing!""}</textarea>
											</br>
											<font size="1" color="grey"  style="vertical-align:bottom;">(描述不超过500字)</font>
										</div>
		    				    	</div>
			    				</div>
			    			</div>
			    			
			    			<div class="formSep">
			    				<div class="row-fluid">
			    					<div class="span6">
			    						<div class="span4">
			    				    		<span>特别加分理由<span class="f_req">*</span></span>
			    						</div>
			    				    	<div class="span4">
											<textarea id="specialReason" name="specialReason" col="12" rows="3" style="width: 770px; height: 111px;">${stuInfo.specialReason!""}</textarea>
											</br>
											<font size="1" color="grey"  style="vertical-align:bottom;">(描述不超过500字)</font>
										</div>
		    				    	</div>
			    				</div>
			    			</div>
			    			
			    			<div class="formSep">
			    				<div class="row-fluid">
			    					<div class="span6">
			    						<div class="span4">
			    				    		<span>个人学年表现<span class="f_req">*</span></span>
			    						</div>
			    				    	<div class="span4">
											<textarea id="personalPerformance" name="personalPerformance" col="12" rows="3" style="width: 770px; height: 111px;">${stuInfo.personalPerformance!""}</textarea>
											</br>
											<font size="1" color="grey"  style="vertical-align:bottom;">(描述不超过500字)</font>
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
											<textarea id="applyReason" name="applyReason" col="12" rows="3" style="width: 770px; height: 111px;">${stuInfo.applyReason!""}</textarea>
											</br>
											<font size="1" color="grey"  style="vertical-align:bottom;">(描述不超过500字)</font>
										</div>
		    				    	</div>
			    				</div>
			    			</div>
			    		</#if>	
		    			
		    		</form>	
		    		
		    		
		    		
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span4">
							    		<label>相关附件</label>
							    	</div>
		    				    	<div class="span4">
										<form  id="fileUploadForm"  action="" method="post"  enctype="multipart/form-data">
											<div data-fileupload="file" class="fileupload fileupload-new">
												<span class="btn btn-file"><span class="fileupload-new">选择文件</span><input id="file" type="file" name="file" onchange="uploadfile(this)"></span>
											 </div>
											 <div class="upload-alert-message" style="word-break:break-all;width: 760px; height: 20px;">
							        		       	文件只支持：jpg,jpeg,png,gif,txt,ppt,rar,zip,doc,docx,xls,xlsx,ppt,pptx,wps,et,dps，且大小不超过10MB。
							        		 </div>
											 <#if uploadFileRefList??>	
												<#list uploadFileRefList as p>
													<div class="fileupload-info">
														<a class="close" data-dismiss="alert">×</a>
														<a href="${rc.contextPath}/sys/sysConfig/file.do?id=${p.uploadFile.id}"><strong>${p.uploadFile.name}&nbsp;(${p.uploadFile.fileSize})</strong></a>
														<input type="hidden" id="fileId" name="fileId" value="${p.uploadFile.id}"/>	
													</div>					
												</#list>
											 </#if>
										</form>	
									</div>
		    				    </div>
		    				</div>
		    			</div>
		    			
		    		</br>
		    		<div class="row-fluid">
						<div class="span6">
							<div class="span4">
			        		</div>
				    		<div class="span8">
				              	 <!--判断是保存还是提交，保存=0   提交=1 -->
							    <button class="btn btn-info" type="button" id="save-course" onclick="onSub('0')">保 存</button>
							    <button class="btn btn-info" type="button" id="submit-button" onclick="onSub('1')">提 交</button>
					  			<button class="btn" type="button" onclick="javascript:window.history.back(-1);">取 消</button>
					  			<#if stuInfo.processStatus?? && stuInfo.processStatus == 'REJECT'>
					  				<button class="btn btn-info" type="button" onclick="approve.showHis('${stuInfo.id}');">审批历史</button>
					  			</#if>	
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