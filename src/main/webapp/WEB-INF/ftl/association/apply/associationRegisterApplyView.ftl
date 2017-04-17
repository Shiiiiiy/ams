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
						注册社团申请查看
			   		</h3>
			  	</div>
			 </div> 	
    		<form  id="registerApplyViewForm" class="form_validation_reg" method="post">
					<div id="hiddenDiv">
						<input type="hidden" id="applyId" name="id" value="${(applyId!"")?html}"/>
						<input type="hidden" id="applyTypeId" name="applyTypeDic.id" value="${(applyTypeId!"")?html}"/>
						<input type="hidden" id="applyTypeCode" name="applyTypeDic.code" value="${(applyTypeCode!"")?html}"/>
						<input type="hidden" id="associationId" name="associationPo.id" value="${(associationId!"")?html}"/>
					</div>
					<div class="formSep">
						<div class="row-fluid">
							<span class="formTitle">社团编号<span class="f_req">*</span></span>
						    <div class="span5">
								<input id="associationCode" name="associationPo.associationCode" 
									<#if aam.associationPo?? >value="${aam.associationPo.associationCode!""}"</#if> maxlength="200" readonly/>
							</div>
							<span class="formTitle">社团名称<span class="f_req">*</span></span>
						    <div class="span5">
								<input id="associationRegisterName" name="associationPo.associationRegisterName" 
									<#if aam.associationPo?? >value="${aam.associationPo.associationRegisterName!""}"</#if> maxlength="200" readonly/>
							</div>
						</div>
					</div>
	                <div class="formSep">
						<div class="row-fluid">
							<span class="formTitle">申请时间<span class="f_req">*</span></span>
							<div class="span5">
	                            <input id="applyTime" name="associationPo.applyTime" class="Wdate"
									<#if aam.associationPo?? >value="${(aam.associationPo.applyTime!"")}"</#if> readonly/>						
							</div>
							<span class="formTitle">社团类型<span class="f_req">*</span></span>
							<div class="span5">
									<select size="1" id="associationRegisterType" name="associationPo.associationRegisterType.id" aria-controls="dt_gal" disabled="disabled">
										<option value="">请选择..</option>
										<#if associationTypeDicList ??>
									      <#list associationTypeDicList as g>
											<#if aam.associationPo ?? && aam.associationPo.associationRegisterType ?? && aam.associationPo.associationRegisterType.id == g.id>
													<option  value="${g.id}" selected="selected">${g.name}</option>	
												<#else>
													<option value="${g.id}" >${g.name}</option>
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
										<select size="1" id="collegeId"  aria-controls="dt_gal" disabled="disabled">
										<option value="">请选择..</option>
										<#if collegeList ??>
									      <#list collegeList as g>
											<#if aam.associationPo ?? && aam.associationPo.college ?? && aam.associationPo.college.id == g.id>
													<option  value="${g.id}" selected="selected">${g.name}</option>	
												<#else>
													<option value="${g.id}" >${g.name}</option>
												</#if>
											</#list>
										</#if>
									</select>	
	                            </div>
								<span class="formTitle">社团人数<span class="f_req">*</span></span>
								<div class="span5">
										<input id="memberNums" name="associationPo.memberNums"  readonly 
											<#if aam.associationPo?? >value="${aam.associationPo.memberNums!""}"</#if>/>
				                    </div>
				            </div>
				        </div>
			            <div class="formSep">
							<div class="row-fluid">
								<span class="formTitle">社团宗旨<span class="f_req">*</span><br/>
													         组织模式<span class="f_req">*</span><br/>
													         经费来源<span class="f_req">*</span></span>
								<div class="span11">
									<textarea cols="80" rows="6" name="associationPo.associationAim" maxlength="200" class="span9" 
									style="width: 810px; height: 136px;" readonly><#if aam.associationPo?? >${(aam.associationPo.associationAim!"")?html}</#if></textarea>
			                    	<br><font size="1" color="grey"  style="vertical-align:bottom; padding-bottom:10px">(不超过200字)</font>
			                    </div>
			            	 </div>
						</div>
			            <div class="formSep">
							<div class="row-fluid">
								<span class="formTitle">是否缴费<span class="f_req">*</span></span>
								<div class="span5">
										<label class="radio inline">
										<input type="radio" name="associationPo.isPay.id"  disabled="disabled"   
										<#if aam.associationPo?? && aam.associationPo.isPay?? && aam.associationPo.isPay.code=='Y' >checked</#if>/>是
										</label>
										<label class="radio inline">
										<input type="radio" name="associationPo.isPay.id"  disabled="disabled"  
										<#if aam.associationPo?? && aam.associationPo.isPay?? && aam.associationPo.isPay.code=='N' >checked</#if>/>否
										</label>
			                    </div>
								<span class="formTitle">社团性质<span class="f_req">*</span></span>
								<div class="span5">
										<label class="radio inline">
										<input type="radio" name="associationPo.isMajorRegister.id" disabled="disabled"  
										<#if aam.associationPo?? && aam.associationPo.isMajorRegister?? && aam.associationPo.isMajorRegister.code=='Y' >checked</#if>/>专业
										</label>
										<label class="radio inline">
										<input type="radio" name="associationPo.isMajorRegister.id" disabled="disabled"  
										<#if aam.associationPo?? && aam.associationPo.isMajorRegister?? && aam.associationPo.isMajorRegister.code=='N' >checked</#if>/>非专业
										</label>
			                    </div>
			            	</div>
						</div>
			            <div class="formSep">
							<div class="row-fluid">
								<span class="formTitle">缴费金额<span class="f_req"></span></span>
								<div class="span5">
									<input id="associationFee" name="associationPo.associationFee" 
										<#if aam.associationPo??>value="${(aam.associationPo.associationFee!"")?html}"</#if> readonly maxlength="10"/>(元)
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
								<span class="formTitle">注册材料<span class="f_req">*</span></span>
						   		<div class="span11">
									<div class="span9" id="_upload_div">
										<form  id="fileUploadForm"  action="" method="post"  enctype="multipart/form-data">
											 <#if fileList??>	
												<#list fileList as p>
													<div class="fileupload-info" style="width: 768px;">
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
			            <div class="formSep">
				        	<div class="row-fluid">
								<span class="formTitle">&#12288;&#12288;&#12288;&#12288;<span class="f_req">&nbsp;</span></span>
					        	<div class="span9">
					        	    <#if aam.operateStatus=='ADVISOR_SUBMIT'>
										<button class="btn btn-info" type="button" onclick="approve.showHis('${(aam.id)!""}');">审批历史</button>
					                </#if>
						            <input class="btn" type="button" onclick="onCancel()" value="关闭"/>
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