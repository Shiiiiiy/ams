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
		<link rel="stylesheet" href="${rc.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.min.css" />
		<!-- multiselect -->
	    <link rel="stylesheet" href="${rc.contextPath}/lib/multiselect/css/multi-select.css" />
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
						<h3 class="heading">学生报名查看页面</h3>
					</div>
				</div>
				<div class="row-fluid">
					<div class="span12">
						<h4 class="heading">学生信息</h3>
					</div>
				</div>
				<div class="row-fluid">
					<div class="formSep">
	    				<div class="row-fluid">
	    					<div class="span6">
	    						<div class="span3">
			    					<span>姓名</span>
	    						</div>
	    						<div class="span9">
			    					<input id="stuName" name="studentId.name" value="${applyInfo.studentId.name!""}" readonly>
	    						</div>
	    					</div>
	    					<div class="span6">
	    						<div class="span3">
			    					<span>学号</span>
	    						</div>
	    						<div class="span9">
			    					<input id="stuNumber" name="studentId.stuNumber" value="${applyInfo.studentId.stuNumber!""}" readonly>
	    						</div>
	    					</div>
						</div>
					</div>
					<div class="formSep">
	    				<div class="row-fluid">
	    					<div class="span6">
	    						<div class="span3">
			    					<span>性别</span>
	    						</div>
	    						<div class="span9">
			    					<input id="genderDic" name="studentId.genderDic.name" value="${applyInfo.studentId.genderDic.name!""}" readonly>
	    						</div>
	    					</div>
	    					<div class="span6">
	    						<div class="span3">
			    					<span>学院</span>
	    						</div>
	    						<div class="span9">
			    					<input id="college" name="studentId.college.name" value="${applyInfo.studentId.college.name!""}" readonly>
	    						</div>
	    					</div>
						</div>
					</div>
					<div class="formSep">
	    				<div class="row-fluid">
	    					<div class="span6">
	    						<div class="span3">
			    					<span>专业</span>
	    						</div>
	    						<div class="span9">
			    					<input id="majorName" name="studentId.major.majorName" value="${applyInfo.studentId.major.majorName!""}" readonly>
	    						</div>
	    					</div>
	    					<div class="span6">
	    						<div class="span3">
			    					<span>班级</span>
	    						</div>
	    						<div class="span9">
			    					<input id="className" name="studentId.classId.className" value="${applyInfo.studentId.classId.className!""}" readonly>
	    						</div>
	    					</div>
						</div>
					</div>
				</div>
				<div class="row-fluid">
					<div class="span12">
						<h4 class="heading">创业班信息</h3>
					</div>
				</div>
		    	<div class="row-fluid">
		    		<form id="saveStuApprove" method="post" action="${rc.contextPath}/training/approveclass/opt-save/saveStuApprove.do">
		    			<input type="hidden" id="applyInfoId" name="id" value="${applyInfo.id!""}">
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span3">
				    					<span>创业班名称</span>
		    						</div>
		    						<div class="span9">
		    							<input id="growthClassName" name="growthId.growthClassName" value="${applyInfo.growthId.growthClassName!""}" readonly>
		    						</div>
		    					</div>
		    					<div class="span6">
		    						<div class="span3">
		    				    		<span>创业班类型</span>
		    						</div>
		    				    	<div class="span9">
		    				    		<input id="growthClassType" name="growthId.growthClassType.code" value="${applyInfo.growthId.growthClassType.name!""}" readonly>
									</div>
	    				    	</div>
		    				</div>
	    				</div>
		    		</form>	
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span3">
			    				    	<span>创业班主题</span>
		    						</div>
		    						<div class="span9">
										<input id="growthClassTheme" name="growthClassTheme"  value="${applyInfo.growthId.growthClassTheme!""}" readonly>
		    						</div>
		    				    </div>
		    					<div class="span6">
		    						<div class="span3">
			    				    	<span>班主任</span>
		    						</div>
		    				    	<div class="span9">
		    				    		<input id="growthClassLeader" name="growthClassLeader"  value="${applyInfo.growthId.growthClassLeader.name!""}" readonly>
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
		    							<input id="applyEndDate" name="growthId.applyEndDate"  value="${applyInfo.growthId.applyEndDate?string('yyyy-MM-dd')!""}" readonly>
		    						</div>
		    				    </div>
		    					<div class="span6">
		    						<div class="span3">
			    				    	<span>计划开班日期</span>
		    						</div>
		    				    	<div class="span9">
		    							<input id="classBeginDate" name="growthId.classBeginDate"  value="${applyInfo.growthId.classBeginDate?string('yyyy-MM-dd')!""}" readonly>
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
		    							<input id="planEndDate" name="growthId.planEndDate"  value="${applyInfo.growthId.planEndDate?string('yyyy-MM-dd')!""}" readonly>
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
										<textarea id="comments" name="comments" col="12" rows="3" style="width: 770px; height: 111px;" readonly>${applyInfo.growthId.comments!""}</textarea>
									</div>
	    				    	</div>
		    				</div>
		    			</div>
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span3">
							    		<label>附件</label>
							    	</div>
		    				    	<div class="span9">
										 <#if uploadFileRefList??>	
											<#list uploadFileRefList as p>
												<div class="fileupload-info">
													<a href="${rc.contextPath}/sys/sysConfig/file.do?id=${p.uploadFile.id}"><strong>${p.uploadFile.name}&nbsp;(${p.uploadFile.fileSize})</strong></a>
													<input type="hidden" id="fileId" name="fileId" value="${p.uploadFile.id}">	
												</div>					
											</#list>
										 </#if>
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
				              	<button class="btn" type="button" onclick="javascript:window.close();">关闭</button>
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