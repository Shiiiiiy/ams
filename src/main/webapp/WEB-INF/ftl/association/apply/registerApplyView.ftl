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
		      		<h3 class="heading">社团注册查看</h3>
			  	</div>
			 </div> 	
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span2"><label>社团名称 </label></div>
								<div class="span10">
									<input id="associationName" class="apan8" readonly name="orignAssociationName" <#if applyModel??>value="${(applyModel.orignAssociationName!"")?html}"</#if>/>
								</div>
							</div>
							<div class="span6">
								<div class="span2"><label>申请时间</label></div>
	                            <div class="span10">
		                            <input id="applyTime" name="applyDate" class="Wdate span5" readonly style="cursor:pointer" onclick="WdatePicker({skin:'whyGreen'});"
										<#if applyModel.applyDate?? >value="${(applyModel.applyDate!"")?string('yyyy-MM-dd')}"</#if>/>						
								</div>
							</div>
						</div>
					</div>
	                <div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span2"><label>社团类型</label></div>
								<div class="span10">
								<select size="1" id="associationType" name="orignAssociationType.id" disabled aria-controls="dt_gal">
									<option value="">${applyModel.orignAssociationType.name}</option>
								</select>
								</div>
							</div>
							<div class="span6">
								<div class="span2"><label>所属学院</label></div>
								<div class="span10">
								<select size="1" id="collegeId" name="college.id" class="span5" disabled aria-controls="dt_gal">
									<option value="">${applyModel.college.name!""}</option>
								</select>
								</div>	
                            </div>
			            </div>
			        </div>
		            <div class="formSep">
						<div class="row-fluid">
						<div class="span12">
							<div class="span1"><label>社团宗旨组织模式经费来源</label></div>
							<div class="span8">
								<textarea cols="120" rows="6" readonly name="associationAim" class="span12"><#if applyModel?? >${(applyModel.associationAim!"")?html}</#if></textarea>
		                    </div>
	            		 </div>
            		  </div>
					</div>
			           
			         
		           	 <div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span2"><label>缴费金额</label></div>
								<div class="span10">
									<input id="associationFee" class="span3" readonly name="associationFee" value="<#if applyModel??>${(applyModel.associationFee!"")?html}<#else>0</#if>"/>(单位:元, 0为不需要缴费)
		                     	</div>
	                     	</div>
	                    	 <div class="span6 ">
								<div class="span2"><label>社团性质</label></div>
								<div  class="span10">
									<#if associationKind ??>
										<#list associationKind as c>
										<label class="radio inline">
											<input type="radio" id="isMajor_" disabled value="${c.id!""}"  name="orignIsMajor.id" <#if applyModel?? && applyModel.orignIsMajor?? && applyModel.orignIsMajor.id == c.id> checked</#if>/>
											${c.name!""}
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
									<div class="span2"><label>开放范围</label></div>
									<div class="span10">
									<#if openScope ??>
										<#list openScope as c>
										<label class="radio inline"  style="padding-bottom:10px;">
											<input type="radio" disabled id="isMajor_"  value="${c.id!""}"  name="openScope.id" <#if applyModel?? && applyModel.openScope?? && applyModel.openScope.id == c.id> checked</#if>/>
											${c.name!""}
										</label>
										</#list>
									</#if>
									</div>
		                   		</div>
		            		</div>
						</div>
		            	
		            	<#if applyModel?? && applyModel.openScope ?? && applyModel.openScope.id == majorScope.id  >
		            	<div class="formSep">
							<div class="row-fluid">
								<div class="span12">
									<div class="span1"><label>所选专业</label></div>
									<div class="span8">
										<textarea cols="80" rows="5" id="majorNames" name="majorName" class="span12" readonly>${applyModel.majorName!""}</textarea>
				                    </div>
				            	</div>
			            	 </div>
						</div>	
		            	</#if>
		            	
			            <div class="formSep">
							<div class="row-fluid">
								<div class="span6">
									<div class="span2"><label>指导老师</label></div>
									<div class="span10">
										<#if advisorList??>
											<#list advisorList as advisor>
												<label>${advisor.advisorPo.name!""} <a href="javascript:void(0);" onclick="viewAdvisorDetail('${advisor.id!""}','${advisor.associationApplyModel.id!""}','${advisor.advisorPo.id!""}');">[查看简介]</a></label>
											</#list>
										</#if>
				                    </div>
	                            </div>
                            </div>
						</div>
						
						<div class="formSep">
							<div class="row-fluid">
								<div class="span12">
									<div class="span1"><label>成员</label></div>
				                    <div class="span8">
				                    	<label><a href="javascript:void(0);" onclick="viewMember('${applyModel.id!""}');">[注册成员查看]</a></label>
				                    </div>
				            	</div>
			            	</div>
			            </div>
					</form>
					
					 <div class="formSep">
							<div class="row-fluid">
						   		<div class="span12">
									<div class="span1"><label>附件</label></div>
									<div class="span8" id="_upload_div">
											 <#if fileList??>	
												<#list fileList as p>
													<div class="fileupload-info">
														<a href="${rc.contextPath}/sys/sysConfig/file.do?id=${(p.uploadFile.id)?html}"><strong>${(p.uploadFile.name)?html}&nbsp;(${(p.uploadFile.fileSize)?html})</strong></a>
														<input type="hidden" id="applyFileId" name="applyFileId" value="${(p.uploadFile.id)?html}"/>	
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
							<div class="span1">&nbsp;</div>
							<div class="span8">
					            <input class="btn" type="button" onclick="javascript:window.close();" value="关 闭"/>
				       		</div>	
       		 			</div>
					</div>
			    </div>
	    </div>
    </div>
</div>

<#--查看 -->
<div class="modal hide fade" id="view_id">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3 id="view_title"></h3>
	</div>
	<div class="modal-body" id="view_body">
		
	</div>
	<div class="modal-footer">
		<a href="#" class="btn" data-dismiss="modal">关闭</a>
	</div>
</div>
<script>

  // 指导老师简介查看
  function viewAdvisorDetail(id,applyId,teacherId){
  		$("#view_title").html("指导老师简介");
  		comp.showModal("view_id","680px","-250px 0 0 -300px");
		$("#view_body").load("${rc.contextPath}/association/apply/nsm/viewAdvisor.do?id="+id+"&applyId="+applyId+"&teacherId="+teacherId);
  }
  
  // 社员信息查看
 function viewMember(id){
 		$("#view_title").html("社团注册成员列表");
 		comp.showModal("view_id","800px","-250px 0 0 -350px");
		$("#view_body").load("${rc.contextPath}/association/apply/nsm/viewRegisterMember.do?id="+id+"&.temp="+Math.random());
 }
</script>
</body>
</html>