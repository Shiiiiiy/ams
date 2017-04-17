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
		<link rel="stylesheet" href="${rc.contextPath}/lib/jquery-ui/css/Aristo/Aristo.css" />
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
						<h3 class="heading">奖励信息查看页面</h3>
		    	<div class="row-fluid">
		    		<form id="editCollegeAward" method="post" action="${rc.contextPath}/reward/collegeaward/opt-save/saveCollegeAward.do">
		    			<input type="hidden" id="collegeAwardId" name="id" value="${collegeAward.id!""}">
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span3">
				    					<span>姓名</span>
		    						</div>
		    						<div class="span9">
		    							<input id="studentId.name" name="studentId.name" value="<#if collegeAward?? && collegeAward.studentId??>${collegeAward.studentId.name!""}</#if>" readonly>
		    						</div>
		    					</div>
		    					<div class="span6">
		    						<div class="span3">
		    				    		<span>学号</span>
		    						</div>
		    						<div class="span9">
		    							<input id="studentId.stuNumber" name="studentId.stuNumber" value="<#if collegeAward?? && collegeAward.studentId??>${collegeAward.studentId.stuNumber!""}</#if>" readonly>
		    						</div>
	    				    	</div>
		    				</div>
	    				</div>
		    			
		    				
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span3">
			    				    	<span>学院</span>
		    						</div>
		    						<div class="span9">
										<input id="studentId.college.name" name="studentId.college.name"  value="<#if collegeAward?? && collegeAward.studentId??>${collegeAward.studentId.college.name!""}</#if>" readonly/>
		    						</div>
		    				    </div>
		    				    <div class="span6">
		    						<div class="span3">
			    				    	<span>专业</span>
		    						</div>
		    						<div class="span9">
										<input id="studentId.major.majorName" name="studentId.major.majorName"  value="<#if collegeAward?? && collegeAward.studentId??>${collegeAward.studentId.major.majorName!""}</#if>" readonly/>
		    						</div>
		    				    </div>
		    				</div>
		    			</div>
		    			
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span3">
			    				    	<span>班级</span>
		    						</div>
		    						<div class="span9">
										<input id="studentId.classId.className" name="studentId.classId.className"  value="<#if collegeAward?? && collegeAward.studentId??>${collegeAward.studentId.classId.className!""}</#if>" readonly/>
		    						</div>
		    				    </div>
		    				    <div class="span6">
		    						<div class="span3">
			    				    	<span>学年</span>
		    						</div>
		    						<div class="span9">
		    							<input name="schoolYear.name" value="${collegeAward.schoolYear.name}" readonly>
		    						</div>
		    				    </div>
		    				</div>
		    			</div>
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span3">
		    				    		<span>学期</span>
		    				    	</div>
		    				    	<div class="span9">
		    				    		<input name="schoolTerm.name" value="${collegeAward.schoolTerm.name}" readonly>
									</div>	
		    				    </div>
		    				    <div class="span6">
		    						<div class="span3">
			    				    	<span>奖励名称</span>
		    						</div>
		    						<div class="span9">
										<input id="awardName" name="awardName"  value="<#if collegeAward??>${collegeAward.awardName!""}</#if>" readonly/>
		    						</div>
		    				    </div>
		    				</div>
		    			</div>	
		    			
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span3">
			    				    	<span>创建人</span>
		    						</div>
		    						<div class="span9">
										<input id="creator.name" name="creator.name"  value="<#if collegeAward?? && collegeAward.creator??>${collegeAward.creator.name!""}</#if>" readonly="true"/>
										<input id="creator.id" name="creator.id" type="hidden"  value="<#if collegeAward?? && collegeAward.creator??>${collegeAward.creator.id!""}</#if>"/>
		    						</div>
		    				    </div>
		    				    <div class="span6">
		    						<div class="span3">
			    				    	<span>获奖日期</span>
		    						</div>
		    						<div class="span9">
										<input type="text" id="awardTime" name="awardTime" style="cursor:pointer" value="<#if collegeAward.awardTime??>${collegeAward.awardTime!""}</#if>" 
											 readonly/>
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
										<textarea id="comments" name="comments" col="12" rows="3" style="width: 770px; height: 111px;" readonly><#if collegeAward??>${collegeAward.comments!""}</#if></textarea>
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
										<#-->
											<div data-fileupload="file" class="fileupload fileupload-new">
												<span class="btn btn-file"><span class="fileupload-new">选择文件</span><input id="file" type="file" name="file" onchange="uploadfile(this)"></span>
											 </div>
											 <div class="upload-alert-message" style="word-break:break-all;width: 760px; height: 20px;">
							        		       	文件只支持：jpg,jpeg,png,gif,txt,ppt,rar,zip,doc,docx,xls,xlsx,ppt,pptx,wps,et,dps，且大小不超过10MB。
							        		 </div>
						        		<-->	 
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
				              	<button class="btn" onclick="javascript:window.close();">关 闭</button>
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