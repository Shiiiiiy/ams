		    	<div class="row-fluid">
		    	<form id="saveStuApprove" method="post" action="">
		    			<input type="hidden" id="applyInfoId" name="id" value="${applyInfo.id!""}">
		    			<input type="hidden" id="oldClassId" name="oldClassId" value="${(oldClassId)!""}">
		    			<input type="hidden" id="type" name="type" value="${type!""}">
		    			<input type="hidden" id="checkFlag" name="checkFlag" value="true"/>
		    				
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span3">
				    					<span class="formTitle">创业班名称</span>
		    						</div>
		    						<div class="span9">
		    							<select size="1" id="growthClassName" name="growthId.id" aria-controls="dt_gal" class="selectoption" onchange="changeClassInfo(this)">
											<#list classInfoList as d>
												<#if applyInfo?? &&applyInfo.growthId?? && applyInfo.growthId.growthClassName==d.growthClassName>
	    					    	            	<option  value="${d.id}" selected="selected">${d.growthClassName?html}</option>
	    					    	            <#else>
	    					    	            	<option  value="${d.id}" >${d.growthClassName?html}</option>
	    					    	            </#if>
											</#list>
										</select>
		    						</div>
		    					</div>
		    					<div class="span6">
		    						<div class="span3">
		    				    		<span class="formTitle">创业班类型</span>
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
			    				    	<span class="formTitle">创业班主题</span>
		    						</div>
		    						<div class="span9">
										<input id="growthClassTheme" name="growthClassTheme"  value="${applyInfo.growthId.growthClassTheme!""}" readonly>
		    						</div>
		    				    </div>
		    					<div class="span6">
		    						<div class="span3">
			    				    	<span class="formTitle">班主任</span>
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
			    				    	<span class="formTitle">报名截止日期</span>
		    						</div>
		    						<div class="span9">
		    							<input id="applyEndDate" name="growthId.applyEndDate"  value="${applyInfo.growthId.applyEndDate?string('yyyy-MM-dd')!""}" readonly>
		    						</div>
		    				    </div>
		    					<div class="span6">
		    						<div class="span3">
			    				    	<span class="formTitle">计划开班日期</span>
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
			    				    	<span class="formTitle">计划结班日期</span>
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
		    				    		<span class="formTitle">备注</span>
	    				    		</div>
		    				    	<div class="span9">
										<textarea id="comments" name="comments" col="12" rows="3" style="width: 770px; height: 111px;" readonly>${applyInfo.growthId.comments!""}</textarea>
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
		    			
			         
    
