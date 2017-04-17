<html>
 <head>
 <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
   <link rel="stylesheet" href="${rc.contextPath}/lib/jquery-ui/css/Aristo/Aristo.css" />
    <link rel="stylesheet" href="${rc.contextPath}/lib/My97DatePicker/skin/WdatePicker.css" />
	<script type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
    <script src="${rc.contextPath}/lib/jquery-ui/jquery-ui-1.8.20.custom.min.js"></script>
	<!-- bootstrap-fileupload -->	
	<link rel="stylesheet" href="${rc.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.min.css" />
	<!-- multiselect -->
    <link rel="stylesheet" href="${rc.contextPath}/lib/multiselect/css/multi-select.css" />
	<script src="${rc.contextPath}/lib/multiselect/js/jquery.multi-select.min.js"></script>
    <!-- animated progressbars -->
    <script src="${rc.contextPath}/js/bdp_fileupload.progressbar.js"></script>
    <script src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script>
    <!-- diy js file -->
    <script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
    <script src="${rc.contextPath}/js/apw/apw_check.js"></script>
    <script src="${rc.contextPath}/js/jquery.form.js"></script>
    <script src="${rc.contextPath}/js/common/common_approve.js"></script>
</head>
<body>
<div id="contentwrapper">
    <div class="main_content">
        <div class="row-fluid">
        	<div class="row-fluid">
		   		<div class="span12">
		      		<h3 class="heading">社团信息查看</h3>
			  	</div>
			 </div> 
					<div class="formSep">
						<div class="row-fluid">
						    <div class="span6">
								<div class="span2"><label>社团名称</label></div>
								<div class="span10">
									<input id="associationRegisterName" class="span5" name="associationRegisterName" value="${(abm.associationName!"")?html}" readonly/>
								</div>
							</div>
						     <div class="span6">
								<div class="span2"><label>社团编号</label></div>
								<div class="span10">
									<input id="associationCode" class="span5" name="associationCode" value="${(abm.associationCode!"")?html}"  readonly/>
								</div>
							</div>
						</div>
					</div>
	                <div class="formSep">
						<div class="row-fluid">
								<div class="span6">
									<div class="span2"><label>所属学院</label></div>
									<div class="span10">
										<select size="1" id="collegeId"  class="span5" aria-controls="dt_gal" disabled="disabled">
											<option value=""><#if abm.college??>${(abm.college.name!"")?html}</#if></option>
										</select>	
									</div>
	                            </div>
								<div class="span6">
									<div class="span2"><label>社团类型</label></div>
									<div class="span10">
										<select size="1" id="associationRegisterType" class="span5" name="associationRegisterType" aria-controls="dt_gal" style="cursor:pointer" disabled>
											<option><#if abm.associationType??>${(abm.associationType.name!"")?html}</#if></option>
										</select>
									</div>
	                            </div>
							</div>
						</div>
			            <div class="formSep">
							<div class="row-fluid">
								<div class="span6">
									<div class="span2"><label>申请时间</label></div>
		                            <div class="span10">
		                           	 	<input id="applyTime" name="applyTime" class="span5" value="<#if abm.applyTime?? >${(abm.applyTime)?string("yyyy-MM-dd")}"</#if> readonly/>						
									</div>
								</div>
								<div class="span6">
									<div class="span2"><label>社团人数</label></div>
									<div class="span10">
										<input id="memberNums"  class="span5"name="memberNums" value="${(abm.memberNums!"")?html}" readonly/>
		                    		</div>
			                    </div>
				            </div>
				        </div>
			            <div class="formSep">
							<div class="row-fluid">
								<div class="span12">
									<div class="span1"><label>社团宗旨<br/>组织模式<br/>经费来源</label></div>
									<div class="span10">
										<textarea cols="80" rows="6" name="associationAim"class="span10" readonly>${(abm.associationAim!"")?html}</textarea>
				                    </div>
			                    </div>
			            	 </div>
						</div>
						
						 <div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span2"><label>缴费金额</label></div>
								<div class="span10">
									<input id="associationFee" class="span3" readonly name="associationFee" value="<#if abm??>${(abm.associationFee!"")?html}<#else>0</#if>"/>(单位:元, 0为不需要缴费)
		                     	</div>
	                     	</div>
							 <div class="span6 ">
								<div class="span2"><label>社团性质</label></div>
								<div  class="span10">
									<#if associationKind ??>
										<#list associationKind as c>
										<label class="radio inline">
											<input type="radio" id="isMajor_" disabled value="${c.id!""}"  name="orignIsMajor.id" <#if abm?? && abm.isMajor?? && abm.isMajor.id == c.id> checked</#if>/>
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
											<input type="radio" disabled id="isMajor_"  value="${c.id!""}"  name="openScope.id" <#if abm?? && abm.openScope?? && abm.openScope.id == c.id> checked</#if>/>
											${c.name!""}
										</label>
										</#list>
									</#if>
									</div>
		                   		</div>
		            		</div>
						</div>
						
						
						<#if abm?? && abm.openScope ?? && abm.openScope.id == majorScope.id  >
		            	<div class="formSep">
							<div class="row-fluid">
								<div class="span12">
									<div class="span1"><label>所选专业</label></div>
									<div class="span8">
										<textarea cols="80" rows="5" id="majorNames" name="majorName" class="span12" readonly>${abm.majorNames!""}</textarea>
				                    </div>
				            	</div>
			            	 </div>
						</div>	
		            	</#if>
						
			            <div class="formSep">
							<div class="row-fluid">
							
								<div class="span6 ">
									<div class="span2"><label>是否十佳</label></div>
									<div  class="span10">
										<#if logicYesNo ??>
											<#list logicYesNo as c>
											<label class="radio inline">
												<input type="radio" id="isMajor_" disabled value="${c.id!""}" <#if abm?? && abm.isTopten?? && abm.isTopten.id == c.id> checked</#if>/>
												${c.name!""}&nbsp;&nbsp;&nbsp;
											</label>
											</#list>
										</#if>
									</div>
			                    </div>
								<div class="span6 ">
									<div class="span2"><label>星级评价</label></div>
									<div  class="span10">
										<input id="honorRating" class="span3" readonly name="honorRating" value="<#if abm??>${(abm.honorRating!"")?html}</#if>"/>（星）
									</div>
			                    </div>
							
			            	</div>
						</div>
						
						 <div class="formSep">
							<div class="row-fluid">
								<div class="span12">
									<div class="span1"><label>指导老师</label></div>
									<div class="span8">
									<#if advisorList??>
										<#list advisorList as advisor>
											<label>${advisor.advisorPo.name!""} <a href="javascript:void(0);" onclick="viewAdvisorDetail('${advisor.id!""}');">[查看简介]</a></label>
										</#list>
									</#if>
				                    </div>
				                </div>
				            </div>
						</div>
						
						<div class="formSep">
							<div class="row-fluid">
								<div class="span12">
									<div class="span1"><label>社员信息</label></div>
				                    <div class="span8">
				                    	<label><a href="javascript:void(0);" onclick="viewMember('${abm.id!""}');">[社员列表查看]</a></label>
				                	</div>
				            	</div>
				        	</div>
				        </div>
			        	<br/> 
			        	<div class="row-fluid">
							<div class="span12">
							<div class="span1"></div>
				        	<div class="span9">
					            <input class="btn" type="button" onclick="javascript:window.close();" value="关  闭"/>
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
  function viewAdvisorDetail(id){
  		$("#view_title").html("指导老师简介");
  		comp.showModal("view_id","680px","-250px 0 0 -300px");
		$("#view_body").load("${rc.contextPath}/association/apply/nsm/viewAdvisor.do?id="+id);
  }
  
  // 社员信息查看
 function viewMember(id){
 		$("#view_title").html("社团成员列表");
 		comp.showModal("view_id","800px","-250px 0 0 -350px");
		$("#view_body").load("${rc.contextPath}/association/apply/nsm/viewMember.do?id="+id+"&.temp="+Math.random());
 }
</script>

</body>
</html>