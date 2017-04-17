<html>
 <head>
 <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
</head>
<body>
<div id="contentwrapper">
    <div class="main_content">
        <div class="row-fluid">
        	<div class="row-fluid">
		   		<div class="span12">
		      		<h3 class="heading">社团变更查看</h3>
			  	</div>
			 </div> 
			 <#--原社团信息-->
			 <div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span2"><label>社团名称 </label></div>
						<div class="span10">
							<input type="hidden" name="orignAssociationName" value="${applyModel.orignAssociationName!""}"/>
							<input id="orignAssociationName"  readonly  class="span6" name="sssociationName" <#if applyModel??>value="${(applyModel.orignAssociationName!"")?html}"</#if>/>
						</div>
					</div>
					<div class="span6">
						<div class="span2"><label>社团编号</label></div>
		                <div class="span10">
		                   <input id="associationCode" class="span6" readonly name="associationCode" <#if applyModel?? && applyModel.associationPo??>value="${(applyModel.associationPo.associationCode!"")?html}"</#if>/>
						</div>
					</div>
				</div>
			</div>
		    <div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span2"><label>社团类型</label></div>
						<div class="span10">
						<input type="hidden" name="orignAssociationType.id" value="${applyModel.orignAssociationType.id!""}"/>
						<select size="1" id="orignAssociationType" class="span6" name="orignAssociationTypeId" disabled aria-controls="dt_gal">
							<option value="">${applyModel.orignAssociationType.name}</option>
						</select>
						</div>
					</div>
					<div class="span6">
						<div class="span2"><label>所属学院</label></div>
						<div class="span10">
						<input type="hidden" name="college.id" value="${applyModel.college.id!""}"/>
						<select size="1" id="collegeId" name="collegeId" class="span6" disabled aria-controls="dt_gal">
							<option value="">${applyModel.college.name!""}</option>
						</select>
						</div>	
		            </div>
		        </div>
		    </div>
		    	
		    	<div class="formSep">
					<div class="row-fluid">
						 <div class="span6 ">
							<div class="span2"><label>社团性质</label></div>
							<div  class="span10">
								<input type="hidden" id="orignIsMajorId" name="orignIsMajor.id" value="${applyModel.orignIsMajor.id!""}"/>
								<input type="text" id="orignIsMajorName"  class="span6" disabled value="${applyModel.orignIsMajor.name!""}"/>
								<#--
									<#if associationKind ??>
										<#list associationKind as c>
										<label class="radio inline">
											<input type="radio" disabled value="${c.id!""}"  name="orignIsMajor.id" <#if applyModel?? && applyModel.orignIsMajor?? && applyModel.orignIsMajor.id == c.id> checked</#if>/>
											${c.name!""}
										</label>
										</#list>
									</#if>
								-->
							</div>
		                </div>
						<div class="span6">
							<div class="span2"><label>成立时间</label></div>
							<div class="span10">
								<input id="applyTime" class="span6" disabled name="applyTime" <#if applyModel?? && applyModel.associationPo??>value="${(applyModel.associationPo.applyTime!"")?html}"</#if>/>
							</div>
		           		</div>
		    		</div>
				</div>
		    	
		    	<div class="formSep">
					<div class="row-fluid">
						 <div class="span6 ">
							<div class="span2"><label>指导老师</label></div>
							<div  class="span10">
								<input type="hidden" id="orignAdvisorId" name="orignAdvisorId" value="${applyModel.orignAdvisorId!""}"/>
								<input type="text" id="orignAdvisorName" class="span6" disabled name="orignAdvisorName" value="${applyModel.orignAdvisorName!""}"/>
							</div>
		                </div>
						<div class="span6">
							<div class="span2"><label>负责人</label></div>
							<div class="span10">
								<input type="hidden" id="orignManagerId" name="orignManagerId" value="${applyModel.orignManagerId!""}"/>
								<input type="text" id="orignManagerName" disabled class="span6" name="orignManagerName" value="${applyModel.orignManagerName!""}"/>
							</div>
		           		</div>
		    		</div>
				</div>
		    	
		    	<#--变更项目-->
		    	<div class="formSep">
					<div class="row-fluid">
						<div class="span12">
							<div class="span1"><label>变更项目</label></div>
							<div class="span8">
							<#if modifyItemMap??>
								<#list modifyItemMap?keys as key>
									<label class="checkbox inline">
										<input type="checkbox" disabled <#if applyModel?? && applyModel.modifyItem?contains(key)>checked</#if>  name="modifyItem" value="${key!""}" />${modifyItemMap[key]} 
									</label>
								</#list>
							</#if>
		                    </div>
		                </div>
		            </div>
				</div>
		    	
		    	 <div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span2"><label>变更后名称 </label></div>
						<div class="span10">
							<input id="ASSOCIATION_NAME" class="span6" disabled name="changedAssociationName" <#if applyModel??>value="${(applyModel.changedAssociationName!"")?html}"</#if>/>
						</div>
					</div>
					<div class="span6">
						<div class="span2"><label>变更后类型</label></div>
						<div class="span10">
						<select size="1" id="ASSOCIATION_TYPE" disabled  name="changedAssociationType.id" class="span6" disabled aria-controls="dt_gal">
							<#if applyModel ?? && applyModel.changedAssociationType ?? >
								<option selected="selected">${applyModel.changedAssociationType.name}</option>	
							<#else>
								<option value="">请选择..</option>
							</#if>
						</select>
						</div>
					</div>
				</div>
			</div>
		    <div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span2"><label>变更后性质</label></div>
						<div class="span10">
							<input id="OTHERS" disabled name="otherModifyItem"  class="span6" <#if applyModel?? && applyModel.changedIsMajor??>value="${(applyModel.changedIsMajor.name!"")?html}"</#if>/>
						</div>
					</div>
					<div class="span6">
						<div class="span2"><label>其他变更</label></div>
						<div class="span10">
							<input id="OTHERS" disabled name="otherModifyItem"  class="span6" <#if applyModel??>value="${(applyModel.otherModifyItem!"")?html}"</#if>/>
						</div>	
		            </div>
		        </div>
		    </div>
		    	
		        <div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span2"><label>变更指导人</label></div>
							<div class="span10">
								<input type="hidden" id="changedAdvisorId" name="changedAdvisorId" value="${applyModel.changedAdvisorId!""}"/>
								<input type="text" id="ASSOCIATION_ADVISOR" class="span6" disabled name="changedAdvisorName" value="<#if applyModel.changedAdvisorId??>${applyModel.changedAdvisorName!""}</#if>"/>
		                    </div>
		                </div>
						<div class="span6">
							<div class="span2"><label>变更负责人</label></div>
		                    <div class="span10">
								<input type="hidden" id="changedManagerId" name="changedManagerId" value="${applyModel.changedManagerId!""}"/>
								<input type="text" id="ASSOCIATION_MANAGER" class="span6" disabled name="changedManagerName" value="<#if applyModel.changedManagerId??>${applyModel.changedManagerName!""}</#if>"/>
		                    </div>
		            	</div>
	                    </div>
	            	</div>
        	   	<div class="formSep">
					<div class="row-fluid">
		            	<div class="span6">
							<div class="span2"><label>变更时间</label></div>
							<div class="span10">
								<input id="applyDate" class="span6" disabled name="applyDate" <#if applyModel?? && applyModel.applyDate??>value="${(applyModel.applyDate!"")?string("yyyy-MM-dd")}"</#if>/>
							</div>
		           		</div>
		        	</div>
		        </div>
			 <#--变更后的社团信息-->
			 
			 
			 <#--变更材料信息-->
			 <div class="formSep">
					<div class="row-fluid">
						<div class="span12">
						<div class="span1"><label>变更原因</label></div>
						<div class="span8">
							<textarea cols="80" rows="6" name="applyReason" disabled class="span12">${(applyModel.applyReason!"")?html}</textarea>
	                    </div>
	            	 </div>
				</div>
			</div>
			</form>

				<div class="formSep">
						<div class="row-fluid">
							 <div class="span12">
								<div class="span1"><label>变更附件</label> </div>
								<div class="span8" id="_finance_upload_div">
										 <#if fileList??>	
											<#list fileList as p>
												<div class="fileupload-info">
													<a href="${rc.contextPath}/sys/sysConfig/file.do?id=${(p.uploadFile.id)?html}"><strong>${(p.uploadFile.name)?html}&nbsp;(${(p.uploadFile.fileSize)?html})</strong></a>
													<input type="hidden" id="financeFileId" name="financeFileId" value="${(p.uploadFile.id)?html}"/>	
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
						<div class="span12">
						<div class="span1"></div>
			        	<div class="span9">
				            <input class="btn" type="button" onclick="javascript:window.close();" value="关 闭"/>
			        	</div>	
		        	</div>	
	 	</div>
	 </div> 
</div>
</body>
</html>