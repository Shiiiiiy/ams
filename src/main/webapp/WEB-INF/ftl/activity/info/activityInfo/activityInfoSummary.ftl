                    <div class="formSep">
						<div class="row-fluid">
						    <div class="span6">
						    <div class="span3">
								<label>活动是否举办</label>
							</div>
						    <div class="span9">
								<#if holdStatusDicList??>
							        <#list holdStatusDicList as g>
									    <#if activity ?? && activity.holdStatus??  && activity.holdStatus.id==g.id >
											<label class="radio inline"><input type="radio" id="holdStatus" name="holdStatus.id" value="${g.id}" disabled checked />${g.name?html}</label>
										<#else>
											<label class="radio inline"><input type="radio" id="holdStatus" name="holdStatus.id" value="${g.id}" disabled />${g.name?html}</label>
										</#if>
									</#list>
								</#if>
	                        </div>
	                        </div>
						</div>
                    </div>
                    <div class="noHoldStatus" style="display:none">
                        <div class="formSep">
							<div class="row-fluid">
							    <div class="span9">
								    <div  class="span2">
										<label>未举办原因<span class="f_req">*</span></label>
								    </div>		
		                            <div class="span10">
		                                <textarea name="reason" id="reason" class="span10" rows="10" readonly><#if activity ??>${(activity.reason)!""}</#if></textarea>
		                            </div>
		                        </div>
							</div>
	                    </div>
                    </div>
                    <div class="holdStatus" style="display:none">
                        <div class="formSep">
							<div class="row-fluid">
							    <div class="span9">
						        <div class="span2">
									<label>活动总结</label>
								</div>
		                        <div class="span10"> 
		                            <textarea name="summary" id="summary" class="span10"  rows="4" readonly ><#if activity ??>${(activity.summary)!""}</#if></textarea>
		                        </div>
		                        </div>
							</div>
	                    </div>
                    </div>
	                <div class="holdStatus" style="display:none">
	                    <div class="formSep">
							<div class="row-fluid">
							    <div class="span9">
								    <div class="span2">
										<label>活动材料</label>							
									</div>	
			                        <div class="span10" id="_upload_div">
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
		            </div>					