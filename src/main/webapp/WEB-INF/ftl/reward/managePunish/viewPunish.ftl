<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- ajax form-->
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
		<script src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
		<script>
			//返回评优类型列表
			function returnPunishList(){   
				//window.location.href="${rc.contextPath}/reward/managepunish/opt-query/queryPunishPage.do";
				window.close();
			}
			
			$("document").ready(function(){
			});
			
			function printView(){
				var bodyHtml = document.body.innerHTML;
				var content = $("#punishEdit").html();
				$("#printView").html(content);
				
				document.body.innerHTML = $("#printView").html();
				window.print();
				window.document.body.innerHTML = bodyHtml;
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
						<h3 class="heading">违纪信息查看页面</h3>
					</div>
				</div>
		    	<div class="row-fluid">
		    		<form id="punishEdit" method="post" action="${rc.contextPath}/reward/managepunish/opt-query/savePunish.do">
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span5">
		    						<div class="span3">
				    					<span>姓名</span>
		    						</div>
		    						<div class="span4">
				    					<input id="stuId.name" name="stuId.name"  value="${punishInfo.stuId.name!""}" readonly>
		    						</div>
			    					<input id="stuIds" name="stuIds" type="hidden" value="">
		    					</div>
		    					<div class="span5">
		    						<div class="span3">
		    				    		<span>学号</span>
		    						</div>
		    						<div class="span4">
										<input id="stuId.id" name="stuId.id" value="${punishInfo.stuId.id!""}" readonly>
		    						</div>
	    				    	</div>
		    				</div>
	    				</div>
	    				
	    				<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span5">
		    						<div class="span3">
			    				    	<span>学年</span>
		    						</div>
		    						<div class="span4">
		    							<input id="punishYear" name="punishYear.code" value="${punishInfo.punishYear.name?html}" readonly>
		    						</div>
		    				    </div>
		    					<div class="span5">
		    						<div class="span3">
			    				    	<span>学期</span>
		    						</div>
		    						<div class="span4">
		    							<input id="punishTerm" name="punishTerm.code" value="${punishInfo.punishTerm.name?html}" readonly>
		    						</div>
		    				    </div>
		    				</div>
		    			</div>
		    		<#if punishInfo.punishRepealDate??>	
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span5">
		    						<div class="span3">
	    				    			<span>处分撤销日期</span>
    				    			</div>
		    				    	<div class="span8">
										<input type="text" id="punishRepealDate" name="punishRepealDate" value="<#if punishInfo.punishRepealDate??>${punishInfo.punishRepealDate?string('yyyy-MM-dd')!""}</#if>" 
												readonly/>
									</div>
	    				    	</div>
	    				    	<div class="span5">
		    						<div class="span3">
	    				    			<span>处分撤销文号</span>
    				    			</div>
		    				    	<div class="span8">
										<input id="punishRepealNum" name="punishRepealNum" value="${punishInfo.punishRepealNum!""}" readonly>
									</div>
	    				    	</div>	
		    				</div>
		    			</div>
		    			
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span5">
		    						<div class="span3">
	    				    			<span>申诉日期</span>
    				    			</div>
		    				    	<div class="span8">
										<input type="text" id="appealDate" name="appealDate" value="<#if punishInfo.appealDate??>${punishInfo.appealDate?string('yyyy-MM-dd')!""}</#if>"
												readonly/>
									</div>
	    				    	</div>
	    				    	<div class="span5">
		    						<div class="span3">
	    				    			<span>申委会审议日期</span>
    				    			</div>
		    				    	<div class="span8">
										<input type="text" id="examineDate" name="examineDate" value="<#if punishInfo.examineDate??>${punishInfo.examineDate?string('yyyy-MM-dd')!""}</#if>" 
												readonly/>
									</div>
	    				    	</div>	
		    				</div>
		    			</div>
	    			</#if>	
	    				<#if queryInfo?? && queryInfo == true>
	    				
	    				<#else>
		    				<div class="formSep">
			    				<div class="row-fluid">
			    					<div class="span5">
			    						<div class="span3">
					    					<span>学院</span>
			    						</div>
			    						<div class="span8">
					    					<input id="stuId.college.name" name="stuId.college.name"   value="${punishInfo.stuId.college.name!""}" readonly>
			    						</div>
			    					</div>
			    					<div class="span5">
			    						<div class="span3">
			    				    		<span>专业</span>
			    						</div>
			    						<div class="span8">
											<input id="stuId.major.majorName" name="stuId.major.majorName"  value="${punishInfo.stuId.major.majorName!""}" readonly>
			    						</div>
		    				    	</div>
			    				</div>
		    				</div>
	    				</#if>
	    				
	    				
	    				<div class="formSep">
		    				<div class="row-fluid">
		    					<#if queryInfo?? && queryInfo == true>
	    							<div class="span5">
	    								<div class="span3">
			    				    		<span>处分文号</span>
	    								</div>
	    								<div class="span8">
											<input id="punishNum" name="punishNum"   value="${punishInfo.punishNum!""}" readonly>
	    								</div>
	    				    		</div>
	    						<#else>
			    					<div class="span5">
				    					<div class="span3">
					    					<span>班级</span>
				    					</div>
				    					<div class="span8">
					    					<input id="stuId.classId.className" name="stuId.classId.className"  value="${punishInfo.stuId.classId.className!""}" readonly>
				    					</div>
			    					</div>
			    					<div class="span5">
			    						<div class="span3">
			    				    		<span>处分文号</span>
			    						</div>
			    						<div class="span8">
											<input id="punishNum" name="punishNum" value="${punishInfo.punishNum!""}" readonly>
			    						</div>
		    				    	</div>
	    				    	</#if>
		    				</div>
	    				</div>
		    			
		    				
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span5">
		    						<div class="span3">
			    				    	<span>处分名称</span>
		    						</div>
		    						<div class="span8">
		    							<input id="punish" name="punish.code" value="${punishInfo.punish.name?html}" readonly>
		    						</div>
		    				    </div>
		    					<div class="span5">
		    						<div class="span3">
			    				    	<span>处分时限</span>
		    						</div>
		    				    	<div class="span8">
		    				    		<input type="text" id="punishStartDateStr" name="punishStartDateStr" style="width:92px;" value="<#if punishInfo.punishStartDate??>${punishInfo.punishStartDate?string("yyyy-MM-dd")!""}</#if>"   
												readonly/>至
										<input type="text" id="punishEndDateStr" name="punishEndDateStr" style="width:92px;" value="<#if punishInfo.punishEndDate??>${punishInfo.punishEndDate?string("yyyy-MM-dd")!""}</#if>"   
												readonly/>
									</div>
		    				    </div>
		    				</div>
		    			</div>
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span5">
		    						<div class="span3">
	    				    			<span>处分编号</span>
    				    			</div>
		    				    	<div class="span8">
										<input id="punishCode" name="punishCode" value="${punishInfo.punishCode!""}" readonly>
									</div>
	    				    	</div>
		    					<div class="span5">
		    						<div class="span3">
	    				    			<span>违纪类别码</span>
    				    			</div>
		    				    	<div class="span8">
										<input id="punishTypeCode" name="punishTypeCode" value="${punishInfo.punishTypeCode!""}" readonly>
									</div>
	    				    	</div>
		    				</div>
		    			</div>	
		    			
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span5">
		    						<div class="span3">
	    				    			<span>违纪日期</span>
    				    			</div>
		    				    	<div class="span8">
										<input type="text" id="punishStartDateStr" name="punishDate" value="<#if punishInfo.punishDate??>${punishInfo.punishDate?string('yyyy-MM-dd')!""}</#if>" 
												readonly/>
									</div>
	    				    	</div>	
		    				</div>
		    			</div>
		    			
		    			
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span5">
		    						<div class="span3">
		    				    		<span>违纪简况</span>
		    						</div>
		    				    	<div class="span8">
										<textarea id="punishInfo" name="punishInfo" col="12" rows="3" style="width: 680px; height: 111px;" readonly>${punishInfo.punishInfo!""}</textarea>
									</div>
	    				    	</div>
		    				</div>
		    			</div>
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span5">
		    						<div class="span3">
		    				    		<span>处分原因</span>
		    						</div>
		    				    	<div class="span8">
										<textarea id="punishReason" name="punishReason" col="12" rows="3" style="width: 680px; height: 111px;" readonly>${punishInfo.punishReason!""}</textarea>
									</div>
	    				    	</div>
		    				</div>
		    			</div>
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span5">
	    				    		<div class="span3">
		    				    		<span>备注</span>
	    				    		</div>
		    				    	<div class="span8">
										<textarea id="comments" name="comments" col="12" rows="3" style="width: 680px; height: 111px;" readonly>${punishInfo.comments!""}</textarea>
									</div>
	    				    	</div>
		    				</div>
		    			</div>
		    		<#if punishInfo.punishRepealDate??>	
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span5">
	    				    		<div class="span3">
		    				    		<span>申委会审议结论</span>
	    				    		</div>
		    				    	<div class="span8">
										<textarea id="examineResult" name="examineResult" col="12" rows="3" style="width: 680px; height: 111px;" readonly>${punishInfo.examineResult!""}</textarea>
									</div>
	    				    	</div>
		    				</div>
		    			</div>
		    		</#if>	
		    		</form>	
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span5">
		    						<div class="span3">
							    		<label>处分文件</label>
							    	</div>
		    				    	<div class="span8">
										<form  id="fileUploadForm"  action="" method="post"  enctype="multipart/form-data">
											<div data-fileupload="file" class="fileupload fileupload-new">
											 </div>
											 <#if uploadFileRefList??>	
												<#list uploadFileRefList as p>
													<div class="fileupload-info">
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
		    			
		    		
	        		<br/>
		    		<div class="row-fluid">
						<div class="span5">
							<div class="span3">
			        		</div>
				    		<div class="span8" >
			              		<button class="btn" onclick="returnPunishList()">关 闭</button>
			           		</div>
			           	</div>
			         </div>
			         
			         
	    </div>
	    </div>
	    </div>       		
	           		
	</body>
</html>