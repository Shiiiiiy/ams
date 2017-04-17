 <html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- ajax form-->
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
		<script src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
		<script src="${rc.contextPath}/lib/jquery-ui/jquery-ui-1.8.20.custom.min.js"></script>
		<script src="${rc.contextPath}/js/bdp_fileupload.progressbar.js"></script>
		<script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
		<script type="text/javascript" src="${rc.contextPath}/lib/chosen/chosen.jquery.min.js"></script>
		<link rel="stylesheet" href="${rc.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.min.css" />
		<!-- multiselect -->
	    <link rel="stylesheet" href="${rc.contextPath}/lib/multiselect/css/multi-select.css" />
	    <link rel="stylesheet" href="${rc.contextPath}/lib/chosen/chosen.css" type="text/css">
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
						<h3 class="heading">导师值班信息查看页面</h3>
					</div>
				</div>
		    	<div class="row-fluid">
		    		<form id="editAdvisorInfo" method="post" action="${rc.contextPath}/training/setadvisor/opt-save/saveAdvisorInfo.do">
		    			<input type="hidden" id="advisorInfoId" name="id" value="${advisorInfo.id!""}">
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span3">
				    					<span>导师姓名</span>
		    						</div>
		    						<div class="span9">
		    							<input name="outerUserInfo.userName" value="${advisorInfo.outerUserInfo.userName!""}" readOnly> 
		    						</div>
		    					</div>
		    					<div class="span6">
		    						<div class="span3">
		    				    		<span>值班日期</span>
		    						</div>
		    						<div class="span9">
				    					<input id="advisorDate" name="advisorDate" 
										value="<#if advisorInfo.advisorDate??>${advisorInfo.advisorDate?string('yyyy-MM-dd')!""}</#if>" readOnly/>
		    						</div>
	    				    	</div>
		    				</div>
	    				</div>
		    			
		    				
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span3">
			    				    	<span>值班时间段</span>
		    						</div>
		    						<div class="span9" data="建议时间段格式为：例 9:00-11:00,14:00-16:00">
										<input id="advisorTime" name="advisorTime"  value="<#if advisorInfo.advisorTime??>${advisorInfo.advisorTime!""}</#if>" readOnly/>
		    						</div>
		    				    </div>
		    				</div>
		    			</div>
		    			
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
	    				    		<div class="span3">
		    				    		<span>辅导内容简介</span>
	    				    		</div>
		    				    	<div class="span9">
										<textarea id="advisorIntro" name="advisorIntro" col="12" rows="3" style="width: 770px; height: 111px;" readOnly>${advisorInfo.advisorIntro!""}</textarea>
									</div>
	    				    	</div>
		    				</div>
		    			</div>
		    			
		    			
		    		</form>	
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
		    			
	        		<br/>
		    		<div class="row-fluid">
						<div class="span6">
							<div class="span3">
			        		</div>
				    		<div class="span9" >
				              	<button class="btn" onclick="javascript:window.close();">关闭</button>
			           		</div>
			           	</div>
			         </div>
			         
			         
	    </div>
	    </div>
	    </div>       		
		<script>
			
		</script>	           		
	</body>
</html>