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
			$("document").ready(function(){
           		$("#stuApplyEdit").compValidate({
					rules:{     
					},
					messages:{
					}
				});
			});
			
			
			
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
						<h3 class="heading">学生评优申请查看页面</h3>
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
		    		<form id="stuApplyEdit" method="post" action="${rc.contextPath}/reward/stucollegeapprove/opt-query/saveStuApplyApprove.do">
		    			<#-- 对象ID -->
		    			<input type="hidden" id="stuApplyInfoId" name="id" value="${stuInfo.id}">
		    			<input id="flags" type="hidden" name="flags"  value="${(flags)!""}">
		    			
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
						
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span4">
		    				    		<span>主要事迹</span>
		    						</div>
		    				    	<div class="span4">
										<textarea id="mainEvent" name="mainEvent" col="12" rows="3" style="width: 770px; height: 111px;" readonly>${stuInfo.mainEvent!""}</textarea>
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
    				</form>	
	    		</div>
		    		<div class="row-fluid">
						<div class="span6">
							<div class="span4">
			        		</div>
				    		<div class="span4">
				    			<button class="btn btn-info" type="button" onclick="approve.showHis('${stuInfo.id}');">审批历史</button>
					  			<button class="btn btn-info" type="button" onclick="javascript:window.close();">关 闭</button>
			           		</div>
			           	</div>
			         </div>
			         
	    </div>
	    </div>
	    <#-- 审核历史查看 -->
		<#include "/apw/instance/approveHistory.ftl">         		
	</body>
</html>