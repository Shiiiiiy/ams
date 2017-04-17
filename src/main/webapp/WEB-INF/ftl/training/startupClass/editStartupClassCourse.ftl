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
		
		function saveClassInfo(id){
			var fileNum = $("#fileUploadForm input[name='fileId']").size();
			if(fileNum == 0){
				comp.message("请上传附件！");
			}else{
				copyFileIdInput();
				$("#editClassInfo").submit();
			}
		}
		function copyFileIdInput(){
			$("#editClassInfo").append($("#fileUploadForm input[name='fileId']"));
		}
		
		var tag=0;
		function uploadfile(obj){	
			if($("#fileUploadForm .sepH_b").length>0||tag){//创建进度条以及包括页面中存在进度条时候不能再上传，平台只提供一个用户同时只能上传一个文件
				comp.message("同时只能上传一个文件，待上传完成后，再重试。","error");
				return;
			}
			//if($("#fileUploadForm .alert-info strong:contains('"+$(obj).val()+"')").length>0){
			//	comp.message("提交了重复名称的文件请确认检查，如果确认内容重复可以手动删除。","info");
			//}
			
			//验证文件扩展名,该逻辑根据具体业务可自行调整
			var fileName=$(obj).val();
			fileName=fileName.substring(fileName.lastIndexOf("\\")+1,fileName.length).toLowerCase();
			
			if(fileName.indexOf(".")>-1){
				var ext=fileName.substring(fileName.lastIndexOf(".")+1,fileName.length);
				if("jpg,jpeg,png,gif,txt,ppt,rar,zip,doc,docx,xls,xlsx,ppt,pptx,wps,et,dps,".indexOf(ext+",")<0){
					comp.message("文件上传类型只能是jpg,jpeg,png,gif,</br>txt,ppt,rar,zip,doc,docx,xls,xlsx,ppt,</br>pptx,wps,et,dps,请重新选择文件。","error");
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
				<h3 class="heading">创业班信息</h3>
				
					<div class="formSep">
	    				<div class="row-fluid">
	    					<div class="span6">
	    						<div class="span3">
			    					<span>创业班名称</span>
	    						</div>
	    						<div class="span9">
			    					<input id="growthClassName" name="growthClassName" value="${classInfo.growthClassName!""}" readonly>
	    						</div>
	    					</div>
	    					<div class="span6">
	    						<div class="span3">
	    				    		<span>创业班类型</span>
	    						</div>
	    				    	<div class="span9">
			    					<input id="growthClassType" name="growthClassType.code" value="${classInfo.growthClassType.name!""}" readonly>
								</div>
    				    	</div>
	    				</div>
		    		</div>
		    		<form id="editClassInfo" method="post" action="${rc.contextPath}/training/startupclass/opt-save/saveStartupClassCourse.do">
		    			<input type="hidden" id="classInfoId" name="id" value="${classInfo.id!""}">
		    			
		    		</form>			
	    			<div class="formSep">
	    				<div class="row-fluid">
	    					<div class="span6">
	    						<div class="span3">
		    				    	<span>创业班主题</span>
	    						</div>
	    						<div class="span9">
									<input id="growthClassTheme" name="growthClassTheme"  value="${classInfo.growthClassTheme!""}" readonly>
	    						</div>
	    				    </div>
	    					<div class="span6">
	    						<div class="span3">
		    				    	<span>班主任</span>
	    						</div>
	    				    	<div class="span9">
	    				    		<input id="growthClassLeaderStr" name="growthClassLeader.name"  value="${classInfo.growthClassLeader.name!""}" readonly>
								</div>
	    				    </div>
	    				</div>
	    			</div>
	    			
	    			<div class="formSep">
	    				<div class="row-fluid">
	    					<div class="span6">
	    						<div class="span3">
		    				    	<span>报名截止日期</span>
	    						</div>
	    						<div class="span9">
									<input type="text" id="applyEndDateStr" name="applyEndDateStr" value="<#if classInfo.applyEndDate??>${classInfo.applyEndDate?string('yyyy-MM-dd')!""}</#if>" readOnly/>
	    						</div>
	    				    </div>
	    					<div class="span6">
	    						<div class="span3">
		    				    	<span>计划开班日期</span>
	    						</div>
	    				    	<div class="span9">
									<input type="text" id="classBeginDateStr" name="classBeginDateStr" value="<#if classInfo.classBeginDate??>${classInfo.classBeginDate?string('yyyy-MM-dd')!""}</#if>" readOnly/>
								</div>
	    				    </div>
	    				</div>
	    			</div>
	    			
	    			<div class="formSep">
	    				<div class="row-fluid">
	    					<div class="span6">
	    						<div class="span3">
		    				    	<span>计划结班日期</span>
	    						</div>
	    						<div class="span9">
									<input type="text" id="planEndDateStr" name="planEndDate" value="<#if classInfo.planEndDate??>${classInfo.planEndDate?string('yyyy-MM-dd')!""}</#if>"style="cursor:pointer"  readOnly/>
	    						</div>
	    				    </div>
	    				</div>
	    			</div>
	    			
	    			<div class="formSep">
	    				<div class="row-fluid">
	    					<div class="span6">
    				    		<div class="span3">
	    				    		<span>备注</span>
    				    		</div>
	    				    	<div class="span9">
									<textarea id="comments" name="comments" col="12" rows="3" style="width: 770px; height: 111px;" readonly>${classInfo.comments!""}</textarea>
									</br>
									<font size="1" color="grey"  style="vertical-align:bottom;">(备注不超过500字)</font>
								</div>
    				    	</div>
	    				</div>
	    			</div>
	    			<div class="formSep">
	    				<div class="row-fluid">
	    					<div class="span6">
	    						<div class="span3">
						    		<label>附件<span class="f_req">*</span></label>
						    	</div>
	    				    	<div class="span9">
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
													<input type="hidden" id="fileId" name="fileId" value="${p.uploadFile.id}">	
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
							<div class="span3">
			        		</div>
				    		<div class="span9">
					  			<button class="btn btn-info" onclick="saveClassInfo()">保存</button>
					  			<button class="btn" onclick="javascript:window.history.back(-1);">返回</button>
			           		</div>
			           	</div>
			         </div>
			         
	    </div>
	    </div>
	</body>
</html>