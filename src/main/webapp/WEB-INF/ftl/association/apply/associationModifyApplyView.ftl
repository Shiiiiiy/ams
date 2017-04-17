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
						变更社团申请查看
			   		</h3>
			  	</div>
			 </div> 	
    		<form  id="modifyApplyEditForm" class="form_validation_reg" method="post">
					<div id="hiddenDiv">
						<input type="hidden" id="associationId" name="associationPo.id" 
						<#if aam.associationPo?? >value="${(aam.associationPo.id!"")?html}"</#if> />
					</div>
					<div class="formSep">
						<div class="row-fluid">
							<span class="formTitle">社团编号<span class="f_req">*</span></span>
						    <div class="span5">
								<input id="associationCode" name="associationPo.associationCode" 
									<#if aam.associationPo?? >value="${(aam.associationPo.associationCode!"")?html}"</#if> 
									maxlength="200" readonly/>
							</div>
							<span class="formTitle">原社团名称<span class="f_req">*</span></span>
						    <div class="span5">
								<input id="associationRegisterName" name="associationPo.associationRegisterName" 
									<#if aam.associationPo?? >value="${(aam.associationPo.associationRegisterName!"")?html}"</#if> 
									maxlength="200" readonly/>
							</div>
						</div>
					</div>
	                <div class="formSep">
						<div class="row-fluid">
							<span class="formTitle">申请时间<span class="f_req">*</span></span>
							<div class="span5">
	                            <input id="applyTime" name="associationPo.applyTime" class="Wdate"  style="cursor:pointer" 
									<#if aam.associationPo?? && aam.associationPo.applyTime??>value="${(aam.associationPo.applyTime!"")?html}"</#if>
									readonly/>						
							</div>
								<span class="formTitle">所属学院<span class="f_req">*</span>&#12288</span>
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
							</div>
						</div>
			            <div class="formSep">
							<div class="row-fluid">
								<span class="formTitle">社团人数<span class="f_req">*</span></span>
								<div class="span5">
								<input id="memberNums" name="associationPo.memberNums" 
								<#if aam.associationPo?? >value="${(aam.associationPo.memberNums!"")?html}"</#if> readonly/>
								</div>
								<span class="formTitle">变更时间<span class="f_req">*</span>&#12288</span>
								<div class="span5">
		                            <input id="modifyTime" name="associationPo.modifyTime" class="Wdate"  style="cursor:pointer" 
		                            <#if aam.associationPo?? >value="${(aam.associationPo.modifyTime!"")?html}"</#if> readonly/>						
								</div>
				            </div>
				        </div>
			            <div class="formSep">
							<div class="row-fluid">
								<span class="formTitle">变更项目<span class="f_req">*</span></span>
								<div class="span9">
									<label class="checkbox inline">
									<input type="checkbox" id="item_1" name="modifyItem" value="ASSOCIATION_NAME" 
									onclick="exeCurModify('item_1','associationName','ASSOCIATION_NAME')" disabled
									<#if (aam.modifyItem??)&&
											 (aam.modifyItem)?contains('ASSOCIATION_NAME')>checked</#if>/>&nbsp;社团名称&#12288; 
									</label>
									
									<label class="checkbox inline">
									<input type="checkbox" id="item_2" name="modifyItem"  value="IS_MAJOR" 
									onclick="exeCurModify('item_2','isMajor_','IS_MAJOR')" disabled
									<#if (aam.modifyItem??)&&
											 (aam.modifyItem)?contains('IS_MAJOR')>checked</#if>/>&nbsp;社团性质&#12288; 
									</label>
									
									<label class="checkbox inline">
									<input type="checkbox" id="item_3" name="modifyItem"  value="ASSOCIATION_TYPE" 
									onclick="exeCurModify('item_3','associationType_','ASSOCIATION_TYPE')" disabled
									<#if (aam.modifyItem??)&&
											 (aam.modifyItem)?contains('ASSOCIATION_TYPE')>checked</#if>/>&nbsp;社团类型&#12288; 
									</label>
									
									<label class="checkbox inline">
									<input type="checkbox" id="item_4" name="modifyItem"  value="ASSOCIATION_ADVISOR" 
									onclick="exeCurModify('advisorDiv','hiddenAdvisor','ASSOCIATION_ADVISOR')" disabled
									<#if (aam.modifyItem??)&&
											 (aam.modifyItem)?contains('ASSOCIATION_ADVISOR')>checked</#if>/>&nbsp;指导老师&#12288; 
									</label>
									
									<label class="checkbox inline">
									<input type="checkbox" id="item_5" name="modifyItem"  value="ASSOCIATION_MANAGER" 
									onclick="exeCurModify('managerDiv','hiddenManager','ASSOCIATION_MANAGER')" disabled
									<#if (aam.modifyItem??)&&
											 (aam.modifyItem)?contains('ASSOCIATION_MANAGER')>checked</#if>/>&nbsp;负责人&#12288; 
									</label>
									
									<label class="checkbox inline">
									<input type="checkbox" id="item_6" name="modifyItem"  value="OTHERS"
									onclick="exeCurModify('item_6','otherItem_','OTHERS')" disabled
									<#if (aam.modifyItem??)&&
											 (aam.modifyItem)?contains('OTHERS')>checked</#if>/>&nbsp;其他&#12288; 
									</label>
									
			                    </div>
			            	</div>
						</div>
			            <div class="formSep">
							<div class="row-fluid">
							<span class="formTitle">社团名称<span class="f_req">*</span></span>
						    <div class="span5">
								<input id="associationName" name="associationPo.associationName" 
									<#if aam.associationPo?? >value="${(aam.associationPo.associationName!"")?html}"</#if> 
									maxlength="200" readonly/>
							</div>
						    <span class="formTitle">其他变更<span class="f_req"></span>&#12288</span>
							<div class="span5">
								<input id="otherItem_" name="otherModifyItem"  
								value="${(aam.otherModifyItem!"")?html}" readonly/>
                            </div>
		            	  </div>
						</div>
			            <div class="formSep">
							<div class="row-fluid">
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
								<span class="formTitle">社团性质<span class="f_req">*</span>&#12288</span>
								<div class="span5">
									<input type="hidden" id="isMajor_" name="associationPo.isMajor.id" 
									<#if aam.associationPo?? && aam.associationPo.isMajor??>
										value="${(aam.associationPo.isMajor.id!"")?html}"</#if>/>
										<label class="radio inline">
										<input type="radio" name="isMajor_" value="4028900f40cd477c0140cd4afd8d0001" onclick="setIsMajor(this.value)"  disabled
										<#if aam.associationPo ?? && aam.associationPo.isMajor ?? && aam.associationPo.isMajor.code=='Y'>checked</#if>/>专业
										</label>
										<label class="radio inline">
										<input type="radio" name="isMajor_" value="4028900f40cd477c0140cd4b62ae0002" onclick="setIsMajor(this.value)"  disabled 
										<#if aam.associationPo ?? && aam.associationPo.isMajor ?? && aam.associationPo.isMajor.code=='N'>checked</#if>/>非专业
										</label>
			                    </div>
			            	 </div>
						</div>
			            <div class="formSep">
							<div class="row-fluid">
								<span class="formTitle">变更原因<span class="f_req">*</span></span>
								<div class="span11">
									<textarea cols="80" rows="6" name="applyReason" maxlength="200" class="span9" style="width: 810px; height: 136px;"
									   readonly>${(aam.applyReason!"")?html}</textarea>
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
								<span class="formTitle">变更材料<span class="f_req">*</span></span>
						   		<div class="span11">
									<div class="span9" id="_upload_div">
										<form  id="fileUploadForm"  action="" method="post"  enctype="multipart/form-data">
											 <#if fileList??>	
												<#list fileList as p>
													<div class="fileupload-info" style="width: 768px;">
														<a href="${rc.contextPath}/sys/sysConfig/file.do?id=${(p.uploadFile.id)?html}"><strong>${(p.uploadFile.name)?html}&nbsp;(${(p.uploadFile.fileSize)?html})</strong></a>
														<input type="hidden" id="fileId" name="fileId" value="${(p.uploadFile.id)?html}"/>	
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
					var param = {pageNo:obj.pageNo,objectId:$("#associationId").val(),managerIds:$("#hiddenManagerIds").val(),returnFlag:'view'};
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