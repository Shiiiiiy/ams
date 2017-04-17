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
		      		<h3 class="heading">
						注销社团申请查看
			   		</h3>
			  	</div>
			 </div> 	
    		<form  id="cancelApplyViewForm" class="form_validation_reg" method="post">
					<div id="hiddenDiv">
						<input type="hidden" id="applyId" name="id" value="${(applyId!"")?html}"/>
						<input type="hidden" id="applyTypeId" name="applyTypeDic.id" value="${(applyTypeId!"")?html}"/>
						<input type="hidden" id="applyTypeCode" value="${(applyTypeCode!"")?html}"/>
						<input type="hidden" id="associationId" name="associationPo.id" 
						<#if aam.associationPo?? >value="${(aam.associationPo.id!"")?html}"</#if> />
						<input type="hidden" id="curCollegeName" value="${(curCollegeName!"")?html}"/>
						<input type="hidden" id="curCollegeId" value="${(curCollegeId!"")?html}"/>
						<input type="hidden" id="isCurManager" value="${(isCurManager!"")?html}"/>
						<input type="hidden" id="isCurAdvisor" value="${(isCurAdvisor!"")?html}"/>
						<input type="hidden" id="curUserId" value="${(curUserId!"")?html}"/>
						<input type="hidden" id="optType" value="${(optType!"")?html}"/>
					</div>
					<div class="formSep">
						<div class="row-fluid">
							<span class="formTitle">社团编号<span class="f_req">*</span></span>
						    <div class="span5">
								<input id="associationCode" name="associationPo.associationCode" 
									<#if aam.associationPo?? >value="${(aam.associationPo.associationCode!"")?html}"</#if> maxlength="200" readonly/>
							</div>
							<span class="formTitle">社团名称<span class="f_req">*</span></span>
						    <div class="span5">
								<input id="associationName" name="associationPo.associationName" 
									<#if aam.associationPo?? >value="${(aam.associationPo.associationName!"")?html}"</#if> maxlength="200" readonly/>
							</div>
						</div>
					</div>
	                <div class="formSep">
						<div class="row-fluid">
							<span class="formTitle">申请时间<span class="f_req">*</span></span>
							<div class="span5">
	                            <input id="applyTime" name="associationPo.applyTime" class="Wdate"  style="cursor:pointer" 
									<#if aam.associationPo?? && aam.associationPo.applyTime??>value="${(aam.associationPo.applyTime!"")?html}"</#if> readonly/>						
							</div>
							<span class="formTitle">社团类型<span class="f_req">*</span></span>
							<div class="span5">
									<input type="hidden" id="associationType" name="associationPo.associationType.id" 
									<#if aam.associationPo?? && aam.associationPo.associationType??>
										value="${(aam.associationPo.associationType.id!"")?html}"</#if>/>
									<select size="1" id="associationType_" name="associationType_" aria-controls="dt_gal" style="cursor:pointer" disabled>
										<option value="">请选择..</option>
										<#if associationTypeDicList ??>
									      <#list associationTypeDicList as g>
											<#if aam.associationPo ?? && aam.associationPo.associationType ?? && aam.associationPo.associationType.id == g.id>
													<option  value="${(g.id)?html}" selected="selected">${(g.name)?html}</option>	
												<#else>
													<option value="${(g.id)?html}" >${(g.name)?html}</option>
												</#if>
											</#list>
										</#if>
									</select>
	                            </div>
							</div>
						</div>
			            <div class="formSep">
							<div class="row-fluid">
								<span class="formTitle">所属学院<span class="f_req">*</span></span>
								<div class="span5">
									<input type="hidden" id="associationCollegeId" name="associationPo.college.id" value="${(curCollegeId!"")?html}"/>
										<select size="1" id="collegeId"  aria-controls="dt_gal" disabled="disabled">
										<option value="">请选择..</option>
										<#if collegeList ??>
									      <#list collegeList as g>
												<#if aam.associationPo ?? && aam.associationPo.college ?? && aam.associationPo.college.id == g.id>
													<option  value="${(g.id)?html}" selected="selected">${(g.name)?html}</option>	
												<#else>
													<option value="${(g.id)?html}" >${(g.name)?html}</option>
												</#if>
											</#list>
										</#if>
									</select>	
	                            </div>
								<span class="formTitle">社团人数<span class="f_req">*</span></span>
								<div class="span5">
										<input id="memberNums" name="associationPo.memberNums" 
											<#if aam.associationPo?? >value="${(aam.associationPo.memberNums!"")?html}"</#if> readonly/>
				                    </div>
				            </div>
				        </div>
			            <div class="formSep">
							<div class="row-fluid">
								<span class="formTitle">是否缴费<span class="f_req">*</span></span>
								<div class="span5">
									<input type="hidden" id="isPay_" name="associationPo.isPay.id" 
									<#if aam.associationPo?? && aam.associationPo.isPay??>
										value="${(aam.associationPo.isPay.id!"")?html}"</#if>/>
										
										<label class="radio inline">
											<input type="radio" name="isPay_" value="4028900f40cd477c0140cd4afd8d0001" 
											onclick="feeSetKey(this.value)" disabled
											<#if aam.associationPo ?? && aam.associationPo.isPay ?? && aam.associationPo.isPay.code=='Y'>checked</#if>/>是
										</label>
										
										<label class="radio inline">
											<input type="radio" name="isPay_" value="4028900f40cd477c0140cd4b62ae0002" 
											onclick="feeSetKey(this.value)" disabled 
											<#if aam.associationPo ?? && aam.associationPo.isPay ?? && aam.associationPo.isPay.code=='N'>checked</#if>/>否
										</label>
			                    </div>
								<span class="formTitle">社团性质<span class="f_req">*</span></span>
								<div class="span5">
									<input type="hidden" id="isMajor_" name="associationPo.isMajor.id" 
									<#if aam.associationPo?? && aam.associationPo.isMajor??>
										value="${(aam.associationPo.isMajor.id!"")?html}"</#if>/>
										
										<label class="radio inline">
										<input type="radio" name="isMajor_" value="4028900f40cd477c0140cd4afd8d0001" disabled
										<#if aam.associationPo ?? && aam.associationPo.isMajor ?? && aam.associationPo.isMajor.code=='Y'>checked</#if>/>专业
										</label>
										
										<label class="radio inline">
										<input type="radio" name="isMajor_" value="4028900f40cd477c0140cd4b62ae0002" disabled 
										<#if aam.associationPo ?? && aam.associationPo.isMajor ?? && aam.associationPo.isMajor.code=='N'>checked</#if>/>非专业
										</label>
										
			                    </div>
			            	</div>
						</div>
			            <div class="formSep">
							<div class="row-fluid">
								<span class="formTitle">缴费金额<span class="f_req"></span></span>
								<div class="span5">
									<input id="associationFee" name="associationPo.associationFee" 
										<#if aam.associationPo?? && aam.associationPo.associationFee!=0>value="${(aam.associationPo.associationFee!"")?html}"</#if> readonly maxlength="10" />(元)
			                    </div>
								<div class="span6">
									<input type="hidden" name="associationPo.associationAim" 
									<#if aam.associationPo??>value="${(aam.associationPo.associationAim!"")?html}"</#if>/>
									<input type="hidden" name="associationPo.isCancel.id" 
									<#if aam.associationPo?? && aam.associationPo.isCancel??>value="${(aam.associationPo.isCancel.id!"")?html}"</#if>/>
									<input type="hidden" name="associationPo.modifyItem" 
									<#if aam.associationPo??>value="${(aam.associationPo.modifyItem!"")?html}"</#if>/>
									<input type="hidden" name="associationPo.otherModifyItem"  
									<#if aam.associationPo?? >value="${(aam.associationPo.otherModifyItem!"")?html}"</#if>/>
		                            <input type="hidden" name="associationPo.modifyTime" 
		                            	<#if aam.associationPo?? >value="${(aam.associationPo.modifyTime!"")?html}"</#if>/>
	                            </div>
			            	</div>
						</div>
			            <div class="formSep">
							<div class="row-fluid">
								<span class="formTitle">注销原因<span class="f_req">*</span></span>
								<div class="span10">
									<textarea cols="80" rows="8" name="applyReason" maxlength="200" class="span10" readonly>${(aam.applyReason!"")?html}</textarea>
			                    	<br><font size="1" color="grey"  style="vertical-align:bottom; padding-bottom:10px">(不超过200字)</font>
			                    </div>
			            	 </div>
						</div>
			            <div class="formSep">
							<div class="row-fluid">
								<span class="formTitle">财务清算<span class="f_req">*</span></span>
								<div class="span10">
									<textarea cols="80" rows="8" name="associationPo.financialComments" maxlength="200" class="span10" readonly>${(aam.financialComments!"")?html}</textarea>
			                    	<br><font size="1" color="grey"  style="vertical-align:bottom; padding-bottom:10px">(不超过200字)</font>
			                    </div>
			            	 </div>
						</div>
						</form>
			            <div class="formSep">
							<div class="row-fluid">
								<span class="formTitle">指导老师<span class="f_req">*</span></span>
								<div class="span9">
									<#include "/association/advisorViewList.ftl">
			                    </div>
			                </div>
			            </div>
			            <div class="formSep">
							<div class="row-fluid" id="advisorInfoDiv">
									<span class="formTitle">教师简介<span class="f_req">*</span></span>
									<div class="span9">
									<#include "/association/apply/advisorInfoList.ftl">
									</div>
			                </div>
			             </div>
			            <div class="formSep">
							<div class="row-fluid">
								<span class="formTitle">负责人&#12288;<span class="f_req">*</span></span>
								<div class="span9">
									<#include "/association/managerViewList.ftl">
			                    </div>
			                </div>
			            </div>
			            <div class="formSep">
							<div class="row-fluid">
								<span class="formTitle">注销材料<span class="f_req">*</span></span>
						   		<div class="span10">
									<div class="span9" id="_cancel_upload_div">
										<form  id="cancelFileUploadForm" method="post"  enctype="multipart/form-data">
											 <#if fileList??>	
												<#list fileList as p>
													<div class="fileupload-info">
														<a href="${rc.contextPath}/sys/sysConfig/file.do?id=${(p.uploadFile.id)?html}"><strong>${(p.uploadFile.name)?html}&nbsp;(${(p.uploadFile.fileSize)?html})</strong></a>
														<input type="hidden" id="cancelFileId" name="cancelFileId" value="${(p.uploadFile.id)?html}"/>	
													</div>					
												</#list>
											 </#if> 
										 </form>	
									</div>
						   		</div>
			            	</div>
			            </div>
			            <br/>
			            <div class="formSep">
							<div class="row-fluid">
								<span class="formTitle">财务附件<span class="f_req">*</span></span>
						   		<div class="span10">
									<div class="span9" id="_finance_upload_div">
										<form  id="financeFileUploadForm" method="post"  enctype="multipart/form-data">
											 <#if financefileList??>	
												<#list financefileList as p>
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
			            <div class="formSep">
				        	<div class="row-fluid">
								<span class="formTitle">&#12288;&#12288;&#12288;&#12288;<span class="f_req">&nbsp;</span></span>
					        	<div class="span9">
						            
									<button class="btn btn-info" type="button" onclick="approve.showHis('${(aam.id)!""}');">审批历史</button>
									<input class="btn" type="button" onclick="onCancel()" value="关闭"/>
								</div>
					        </div>	
				        </div>
            </div>
		</div>
    </div>
</div>
 <#-- 审核历史查看 -->
 <#include "/apw/instance/approveHistory.ftl">  
<script>

	function eisdResponse(r,s){
			var obj = eval("("+r+")");
			if(obj.success=="success"){
				if(obj.listType=="LIST_MANAGER"){
					var param = {pageNo:obj.pageNo,objectId:$("#associationId").val(),managerIds:${hiddenManagerIds!"''"},returnFlag:'view'};
					$("#managerViewPage").load("${rc.contextPath}/association/apply/nsm/asynLoadManagerList.do",param,function(){});
				}else if(obj.listType=="LIST_ADVISOR"){
					var param = {pageNo:obj.pageNo,objectId:$("#associationId").val(),teacherIds:${hiddenTeacherIds!"''"},returnFlag:'view'};
					$("#teacherViewPage").load("${rc.contextPath}/association/apply/nsm/asynLoadAdvisorList.do",param,function(){});
				}
			}
	}
	 
    //关闭当前页面
    function onCancel(){
    	window.close();
    }
</script>
</body>
</html>