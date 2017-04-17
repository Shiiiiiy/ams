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
    <script>
	var formValidator;
	$("document").ready(function(){
	    formValidator = $("#cancelApplyEditForm").compValidate({
			rules:{
							'applyReason': {required:true,maxlength:200},
							'financialComments': {required:true,maxlength:200}
			},
			messages:{
							'applyReason': {required:'变更理由不能为空',maxlength:'变更理由不可超过200字'},
							'financialComments': {required:'财务清算不能为空',maxlength:'财务清算不可超过200字'}
			}
		 });
 	});
	 
	//上传附件
	var tag=0;
	function uploadfile(obj,formId,fileId){	
		if($("#"+formId+" .sepH_b").length>0||tag){//创建进度条以及包括页面中存在进度条时候不能再上传，平台只提供一个用户同时只能上传一个文件
			comp.message("同时只能上传一个文件，待上传完成后，再重试。","error");
			return;
		}
		
		if($("#"+formId+" .alert-info strong:contains('"+$(obj).val()+"')").length>0){
			comp.message("提交了重复名称的文件请确认检查，如果确认内容重复可以手动删除。","info");
		}
		
		//验证文件扩展名,该逻辑根据具体业务可自行调整
		var fileName=$(obj).val();
		fileName=fileName.substring(fileName.lastIndexOf("\\")+1,fileName.length);
		
		if(fileName.indexOf(".")>-1){
			var ext=fileName.substring(fileName.lastIndexOf(".")+1,fileName.length).toLowerCase();
			if("jpg,jpeg,png,gif,txt,ppt,rar,zip,doc,docx,xls,xlsx,ppt,pptx,wps,et,dps,".indexOf(ext+",")<0){
				comp.message("文件上传类型只能是jpg,jpeg,png,gif,txt,ppt,rar,zip,doc,docx,xls,xlsx,ppt,pptx,wps,et,dps,请重新选择文件。","error");
				return;
			}
		}
		
		//附件上传执行操作
			tag=1;
			var div=fileupload.create_fileupload_div($("#"+formId),$(obj).val());
			tag=0;	
			var param="?maxSize=10485760&isTempFile=false";//设置业务文件大小限制上线不能超过10M
			$("#"+formId).attr("action","${rc.contextPath}/sys/sysConfig/singleFileUpload.do"+param);		
			$("#"+formId).ajaxSubmit(function(data){
				try{//ie8才能执行如下代码
							
						data=$(data).unwrap().text();
					  }catch(e){//ff chrome浏览器
					  
					 }
					
				try{
					var obj=eval(data)[0];				
					if(obj.fileId==''){
						comp.message(obj.errorInfo,"error");
						$(div).remove();
					}else{
						comp.message("上传文件完成。","info");
						$(div).append($("<input>",{						
							type:'hidden',
							val:obj.fileId,
							name:fileId,
						}));
						$(div).find("div").remove();
						$(div).find("strong").append(("&nbsp;("+obj.fileSize+")"));
						$(div).find("strong").wrapAll("<a href=\"${rc.contextPath}/sys/sysConfig/file.do?id="+obj.fileId+"\"/>");
					}
				}catch(e){
					comp.message("文件提交服务器失败，请稍后刷新页面重试，如果还未成功请联系管理。","error");
				}
						
				//下面代码解决重名文件可以连续上传问题，该功能需要根据实际业务进行调整	
				var file=$("#"+fileId);
				file.after(file.clone().val(''));
				file.remove();
			});
	}
	
	function copyFileIdInput(){
			$("#cancelApplyEditForm").append($("#cancelFileUploadForm input[name='applyFileId']"));
			$("#cancelApplyEditForm").append($("#financeFileUploadForm input[name='financeFileId']"));
	}
	 
	</script>
</head>
<body>
<div id="contentwrapper">
    <div class="main_content">
        <div class="row-fluid">
        	<div class="row-fluid">
		   		<div class="span12">
		      		<h3 class="heading">
						<#if aam.id??>
						注销社团申请修改
						<#else>
						注销社团申请
						</#if>
			   		</h3>
			  	</div>
			 </div> 	
    		<form  id="cancelApplyEditForm" class="form_validation_reg" method="post">
					<div id="hiddenDiv">
					<!--申请基本信息 -->
						<input type="hidden" id="applyId" name="id" value="${(applyId!"")?html}"/>
						<input type="hidden" id="applyTypeId" name="applyTypeDic.id" value="${(applyTypeId!"")?html}"/>
						<input type="hidden" id="applyTypeCode" name="applyTypeDic.code" value="${(applyTypeCode!"")?html}"/>
						<input type="hidden" id="curUserId" value="${(curUserId!"")?html}"/>
						<input type="hidden" id="optType" value="${(optType!"")?html}"/>
						<input type="hidden" id="modifyItem" name="modifyItem" value="${(aam.modifyItem!"")?html}"/>
						<input type="hidden" id="otherModifyItem" name="otherModifyItem" value="${(aam.otherModifyItem!"")?html}"/>
						
						<!-- 社团基本信息 -->
						<input type="hidden" id="associationId" name="associationPo.id" 
						<#if aam.associationPo?? >value="${(aam.associationPo.id!"")?html}"</#if> />
						<input type="hidden" id="proprieterId" name="associationPo.proprieter.id" 
						<#if aam.associationPo??&&aam.associationPo.proprieter?? >value="${(aam.associationPo.proprieter.id!"")?html}"</#if> />
						
						<input type="hidden" id="curCollegeName" value="${(curCollegeName!"")?html}"/>
						<input type="hidden" id="curCollegeId" value="${(curCollegeId!"")?html}"/>
						<input type="hidden" id="isCurManager" value="${(isCurManager!"")?html}"/>
						<input type="hidden" id="isCurAdvisor" value="${(isCurAdvisor!"")?html}"/>
						
						<!-- 原社团信息 begin-->
						<input type="hidden" id="associationRegisterType" name="associationPo.associationRegisterType.id" 
						<#if aam.associationPo?? && aam.associationPo.associationRegisterType??>
						value="${(aam.associationPo.associationRegisterType.id!"")?html}"</#if>/>
						<input type="hidden" id="proprieterRegister" name="associationPo.proprieterRegister.id" 
						<#if aam.associationPo?? && aam.associationPo.proprieterRegister??>
						value="${(aam.associationPo.proprieterRegister.id!"")?html}"</#if>/>
						<input type="hidden" id="isMajorRegister" name="associationPo.isMajorRegister.id" 
						<#if aam.associationPo?? && aam.associationPo.isMajorRegister??>
						value="${(aam.associationPo.isMajorRegister.id!"")?html}"</#if>/>
						<input type="hidden" id="associationRegisterName" name="associationPo.associationRegisterName" 
									<#if aam.associationPo?? >value="${(aam.associationPo.associationRegisterName!"")?html}"</#if> />
									
						<!-- 原社团信息 end -->
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
									<input type="hidden" id="associationCollegeId" name="associationPo.college.id" 
										value="<#if aam.associationPo?? && aam.associationPo.college??>${(aam.associationPo.college.id!"")?html}</#if>"/>
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
										<#if aam.associationPo??>value="${(aam.associationPo.associationFee!"")?html}"</#if> readonly maxlength="10" />(元)
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
								<div class="span11">
									<textarea cols="80" rows="6" name="applyReason" class="span9" style="width: 802px; height: 136px;"
									<#if user_key.optMap??><#if user_key.optMap['submit']??>readonly</#if></#if>>${(aam.applyReason!"")?html}</textarea>
			                    	<br><font size="1" color="grey"  style="vertical-align:bottom; padding-bottom:10px">(不超过200字)</font>
			                    </div>
			            	 </div>
						</div>
			            <div class="formSep">
							<div class="row-fluid">
								<span class="formTitle">财务清算<span class="f_req">*</span></span>
								<div class="span11">
									<textarea cols="80" rows="6" name="financialComments" class="span9" style="width: 802px; height: 136px;"
									<#if user_key.optMap??><#if user_key.optMap['submit']??>readonly</#if></#if>>${(aam.financialComments!"")?html}</textarea>
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
						   		<div class="span11">
									<div class="span9" id="_cancel_upload_div">
										<form  id="cancelFileUploadForm"  method="post"  enctype="multipart/form-data">
											<#if user_key.optMap??><#if user_key.optMap['save']??>
											 <div data-fileupload="file" class="fileupload fileupload-new">
													<span class="btn btn-file">
														<span class="fileupload-new">选择文件</span>
															<input id="file" type="file" name="file" onchange="uploadfile(this,'cancelFileUploadForm','applyFileId')">
													</span>
											 </div>
											 <div class="upload-alert-message" style="word-break:break-all;width: 782px;">
							        		        文件只支持：jpg,jpeg,png,gif,txt,ppt,rar,zip,doc,docx,xls,xlsx,ppt,pptx,wps,et,dps且大小不超过10MB。
							        		 </div>
											</#if></#if>
											 <#if fileList??>	
												<#list fileList as p>
													<div class="fileupload-info" style="width: 762px;">
														<#if user_key.optMap??><#if user_key.optMap['save']??>
														<a class="close" data-dismiss="alert">×</a>
														</#if></#if>
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
			            <div class="formSep">
							<div class="row-fluid">
								<span class="formTitle">财务附件<span class="f_req">*</span></span>
						   		<div class="span11">
									<div class="span9" id="_finance_upload_div">
										<form  id="financeFileUploadForm"  method="post"  enctype="multipart/form-data">
											<#if user_key.optMap??><#if user_key.optMap['save']??>
											 <div data-fileupload="file" class="fileupload fileupload-new">
													<span class="btn btn-file">
														<span class="fileupload-new">选择文件</span>
															<input id="file" type="file" name="file" onchange="uploadfile(this,'financeFileUploadForm','financeFileId')">
													</span>
											 </div>
											 <div class="upload-alert-message" style="word-break:break-all;width: 782px;">
							        		        文件只支持：jpg,jpeg,png,gif,txt,ppt,rar,zip,doc,docx,xls,xlsx,ppt,pptx,wps,et,dps且大小不超过10MB。
							        		 </div>
											</#if></#if>
											 <#if financefileList??>	
												<#list financefileList as p>
													<div class="fileupload-info" style="width: 762px;">
														<#if user_key.optMap??><#if user_key.optMap['save']??>
														<a class="close" data-dismiss="alert">×</a>
														</#if></#if>
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
			        	<div class="row-fluid">
							<span class="formTitle">&#12288;&#12288;&#12288;&#12288;<span class="f_req">&nbsp;</span></span>
				        	<div class="span9">
					        	<#if user_key.optMap??>
					        		<#if user_key.optMap['submit']??>
					        		<#else>
					        			 <input class="btn btn-info"  type="button" onclick="onSave()" value="保存"/>
					        		
					        		</#if>
					        	</#if>
					            <input class="btn btn-info"  type="button" onclick="onSubmit()" value="提交"/>
					            <input class="btn" type="button" onclick="onCancel()" value="取消"/>
				        </div>	
            </div>
		</div>
    </div>
    <#include "/apw/instance/approvers.ftl"/>
</div>
<script>

//保存社团申请 
 function onSave(){
    var isCurManager = $("#isCurManager").val();
    var isCurAdvisor = $("#isCurAdvisor").val();
    var applyTypeCode = $("#applyTypeCode").val();
    var optType = $("#optType").val();
	if(isCurManager=="true" || (applyTypeCode=="CANCEL" && optType=="ADD")){
		managerDoSave();
	}
	if(isCurAdvisor=="true"){
		advisorDoSave();
	}
 }

//社团负责人执行保存操作
 function managerDoSave(){
	 if(formValidator.form()==true){
	    if(!cancelFileValidator()){
	 		comp.message("注销材料不可为空，请上传附件 !","error");
	 	}else if(!financeFileValidator()){
	 		comp.message("财务结算材料不可为空，请上传附件 !","error");
	 	}else{
	        mask.showShade();
			copyFileIdInput();
	        $('#cancelApplyEditForm').attr("action","${rc.contextPath}/association/apply/opt-edit/managerSaveApply.do?applyType="+$("#applyTypeCode").val()).submit();
	 	}
 	}
 }
 
 /**
   * 执行指导老师保存操作
   */
 function advisorDoSave(){
    if(formValidator.form()==true){
		copyFileIdInput();
        $('#cancelApplyEditForm').attr("action","${rc.contextPath}/association/apply/opt-edit/advisorSaveApply.do?applyType="+$("#applyTypeCode").val()).submit();
 	}
 }
 
//提交社团申请 
 function onSubmit(){
	 if(formValidator.form()==true){
	    if(!cancelFileValidator()){
	 		comp.message("注销材料不可为空，请上传附件 !","error");
	 	}else if(!financeFileValidator()){
	 		comp.message("财务结算材料不可为空，请上传附件 !","error");
	 	}else if(confirm("提交后不可修改，确认提交?")){
		    var isCurManager = $("#isCurManager").val();
		    var isCurAdvisor = $("#isCurAdvisor").val();
	        var applyTypeCode = $("#applyTypeCode").val();
	        var optType = $("#optType").val();
			if(isCurManager=="true" || (applyTypeCode=="CANCEL" && optType=="ADD")){
				managerDoSubmit();
			}
			if(isCurAdvisor=="true"){
				advisorDoSubmit();
			}
		}
	}
 }
 
  /**
   * 执行负责人提交操作
   */
 function managerDoSubmit(){
    if(formValidator.form()==true){
		copyFileIdInput();
        $('#cancelApplyEditForm').attr("action","${rc.contextPath}/association/apply/opt-edit/managerSubmitApply.do?applyType="+$("#applyTypeCode").val()).submit();
 	}
 }

//指导老师提交社团申请 
 function advisorDoSubmit(){
    if(formValidator.form()==true){
        apw.selectNextApprover($("#applyId").val(),"INIT","ASSOCIATION_APPLY_APPROVE",null);
 	}
 }
 
    /*
	 * 初始化当前发起流程【doInitAction方法名不可修改】
	 */
    function doInitAction(objectId,userId){
      	$.ajax({
				url: "${rc.contextPath}/association/apply/opt-edit/submitAssociationApply.do",
				async:false,
				cache:false,
				type:"POST",
				data:$('#cancelApplyEditForm').serialize(),
			    success: function(data){
			    	var jsonObj = jQuery.parseJSON(data);
					if(jsonObj.flag=="success"){
					    var url = "${rc.contextPath}/association/apply/opt-init/initCurProcess.do";
						apw.initCurProcess(url,objectId,userId);
				    }
				}
		   });
	}
	
    //执行业务系统的操作
    function doAmsAction(userId,approveKey,approveStatus,processStatusCode,suggest){
       window.location.href="${rc.contextPath}/association/apply/opt-query/getAssociationApplyList.do";	
    }
	  
	function cancelFileValidator(){
		var fileIds = $("#cancelFileUploadForm input[name='applyFileId']");
		if(fileIds.length>0){
			return true;
		}else{
			return false;
		}
	}
	  
	function financeFileValidator(){
		var financeIds = $("#financeFileUploadForm input[name='financeFileId']");
		if(financeIds.length>0){
			return true;
		}else{
			return false;
		}
	}
	
	function eisdResponse(r,s){
			var obj = eval("("+r+")");
			if(obj.success=="success"){
				if(obj.listType=="LIST_MANAGER"){
					var param = {pageNo:obj.pageNo,objectId:$("#associationId").val(),managerIds:${hiddenManagerIds!"''"},returnFlag:'view'};
					$("#managerViewPage").load("${rc.contextPath}/association/apply/nsm/asynLoadManagerList.do",param,function(){});
				}else if(obj.listType=="LIST_ADVISOR"){
					var param = {pageNo:obj.pageNo,objectId:$("#associationId").val(),teacherIds:${hiddenTeacherIds!"''"}};
					$("#teacherInfoPage").load("${rc.contextPath}/association/apply/nsm/asynLoadAdvisorList.do",param,function(){});
				}
			}
	}
	 
    //返回到查询信息页面
    function onCancel(){
    	window.location.href="${rc.contextPath}/association/apply/opt-query/getAssociationApplyList.do";
   }
</script>
</body>
</html>