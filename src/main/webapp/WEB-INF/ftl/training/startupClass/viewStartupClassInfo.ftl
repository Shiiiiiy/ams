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
						<h3 class="heading">创业班信息</h3>
					</div>
				</div>
				
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
								</div>
    				    	</div>
	    				</div>
	    			</div>
	    			<#if uploadFileRefList?? && (uploadFileRefList?size>0)>
	    			<div class="formSep">
	    				<div class="row-fluid">
	    					<div class="span6">
	    						<div class="span3">
						    		<label>附件</label>
						    	</div>
	    				    	<div class="span9">
									<form  id="fileUploadForm"  action="" method="post"  enctype="multipart/form-data">
										 <#if uploadFileRefList??>	
											<#list uploadFileRefList as p>
												<div class="fileupload-info">
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
	    			</#if>
					</br>
		    		<div class="row-fluid">
						<div class="span6">
							<div class="span3">
			        		</div>
				    		<div class="span9">
					  			<button class="btn" type="button" onclick="javascript:window.close();">关闭</button>
			           		</div>
			           	</div>
			         </div>
			         
	    </div>
	    </div>
	</body>
</html>