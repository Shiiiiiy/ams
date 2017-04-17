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
	
	//重复性验证【社团名称】
	var data={associationId:function(){return $("#associationId").val();},associationName:function(){return $("#associationName").val();}};
	comp.validate.addRemote("isRepeatName","${rc.contextPath}/association/apply/opt-query/isAssociationNameRepeat.do",data,"名称已存在，请修改 !");
	
	$("document").ready(function(){
	    formValidator = $("#modifyApplyEditForm").compValidate({
			rules:{
							'associationPo.modifyTime': {required:true},
							'modifyItem': {required:true},
							'associationPo.associationName': {required:true,uwsnumcharcnspace:true,isRepeatName:true,maxlength:200},
							'isMajor_': {required:true},
							'associationPo.associationType.id': {required:true},
							'applyReason': {required:true,maxlength:200}
			},
			messages:{
							'associationPo.modifyTime': {required:'变更时间不能为空'},
							'modifyItem': {required:'请选择变更项目'},
							'associationPo.associationName': {required:'社团名称不能为空'},
							'isMajor_': {required:'请指定社团性质'},
							'associationPo.associationType.id': {required:'请指定社团类型'},
							'applyReason': {required:'变更理由不能为空',maxlength:'变更理由不可超过200字'}
			}
		 });
		 
 	});
	 
	//上传附件
	var tag=0;
	function uploadfile(obj,fileId){	
		if($("#fileUploadForm .sepH_b").length>0||tag){//创建进度条以及包括页面中存在进度条时候不能再上传，平台只提供一个用户同时只能上传一个文件
			comp.message("同时只能上传一个文件，待上传完成后，再重试。","error");
			return;
		}
		
		if($("#fileUploadForm .alert-info strong:contains('"+$(obj).val()+"')").length>0){
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
			var div=fileupload.create_fileupload_div($("#fileUploadForm"),$(obj).val());
			tag=0;	
			var param="?maxSize=10485760&isTempFile=false";//设置业务文件大小限制上线不能超过10M
			$("#fileUploadForm").attr("action","${rc.contextPath}/sys/sysConfig/singleFileUpload.do"+param);		
			$("#fileUploadForm").ajaxSubmit(function(data){
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
				var file=$("#file");
				file.after(file.clone().val(''));
				file.remove();
			});
	}
	
	function copyFileIdInput(){
			$("#modifyApplyEditForm").append($("#fileUploadForm input[name='applyFileId']"));
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
						变更社团申请修改
						<#else>
						变更社团申请
						</#if>
			   		</h3>
			  	</div>
			 </div> 	
    		<form  id="modifyApplyEditForm" class="form_validation_reg" method="post">
					<div id="hiddenDiv">
						<!-- 社团申请信息 -->
						<input type="hidden" id="applyId" name="id" value="${(applyId!"")?html}"/>
						<input type="hidden" id="applyTypeId" name="applyTypeDic.id" value="${(applyTypeId!"")?html}"/>
						<input type="hidden" id="applyTypeCode" name="applyTypeDic.code" value="${(applyTypeCode!"")?html}"/>
						<input type="hidden" id="curUserId" value="${(curUserId!"")?html}"/>
						<input type="hidden" id="optType" value="${(optType!"")?html}"/>
						<input type="hidden" id="operateStatus" value="${(operateStatus!"")?html}"/>
						<input type="hidden" id="modifyItem_"  value="${(modifyItemInfo!"")?html}" 
						<#if operateStatus?? && (operateStatus=="MANAGER_SUBMIT" || operateStatus=="ADVISOR_SAVE")>name="modifyItem"</#if>/>
						
						<!-- 社团基本信息 -->
						<input type="hidden" id="associationId" name="associationPo.id" 
						<#if aam.associationPo?? >value="${(aam.associationPo.id!"")?html}"</#if> />
						<input type="hidden" id="proprieterId" name="associationPo.proprieter.id" value="${(proprieterId!"")?html}"/>
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
						<!-- 原社团信息 end -->
					</div>
					<div class="formSep">
						<div class="row-fluid">
							<span class="formTitle">社团编号<span class="f_req">*</span></span>
						    <div class="span5">
								<input id="associationCode" name="associationPo.associationCode" 
									<#if aam.associationPo?? >value="${(aam.associationPo.associationCode!"")?html}"</#if> 
									maxlength="200" readonly/>
							</div>
							<span class="formTitle">原社团名<span class="f_req">*</span></span>
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
								<span class="formTitle">所属学院<span class="f_req">*</span></span>
								<div class="span5">
									<input type="hidden" id="associationCollegeId" name="associationPo.college.id" 
										value="<#if aam.associationPo?? && aam.associationPo.college??>${(aam.associationPo.college.id!"")?html}</#if>"/>
										<select size="1" id="collegeId"  aria-controls="dt_gal" onchange="setAssociationCollege('this.value')" disabled="disabled">
										<option value="">请选择..</option>
										<#if collegeList ??>
									      <#list collegeList as g>
											<#if aam.associationPo ?? && aam.associationPo.college ?? && aam.associationPo.college.id == g.id>
													<option  value="${(g.id)?html}" selected="selected">${(g.name)?html}</option>	
												<#elseif curCollegeId?? && curCollegeId == g.id>
													<option value="${(g.id)?html}" selected="selected">${(g.name)?html}</option>
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
								<#if aam.associationPo?? >value="${(aam.associationPo.memberNums!"")?html}"</#if> readonly  maxlength="4"
								<#if user_key.optMap??><#if user_key.optMap['submit']??>readonly</#if></#if>/>
								</div>
								<span class="formTitle">变更时间<span class="f_req">*</span></span>
								<div class="span5">
		                            <input id="modifyTime" name="associationPo.modifyTime" class="Wdate"  style="cursor:pointer" 
		                            	onclick="WdatePicker({skin:'whyGreen',minDate: 'applyTime',el:$dp.$('modifyTime')})" 
		                            	<#if aam.associationPo?? >value="${(aam.associationPo.modifyTime!"")?html}"</#if>/>						
								</div>
				            </div>
				        </div>
			            <div class="formSep">
							<div class="row-fluid">
								<span class="formTitle">变更项目<span class="f_req">*</span></span>
								<div class="span9">
									<label class="checkbox inline">
									<input type="checkbox" id="item_1" name="modifyItem" value="ASSOCIATION_NAME" 
									onclick="exeCurModify('item_1','ASSOCIATION_NAME','associationName','${(aam.associationPo.associationRegisterName!"")?html}')" 
									<#if user_key.optMap??><#if user_key.optMap['submit']??>disabled</#if></#if>
									<#if (aam.modifyItem??)&&
											 (aam.modifyItem)?contains('ASSOCIATION_NAME')>checked</#if>/>&nbsp;社团名称&#12288; 
									</label>
									
									<label class="checkbox inline">
									<input type="checkbox" id="item_2" name="modifyItem"  value="IS_MAJOR" 
									onclick="exeCurModify('item_2','IS_MAJOR','isMajor_','${(aam.associationPo.isMajorRegister.id!"")?html}')"
									<#if user_key.optMap??><#if user_key.optMap['submit']??>disabled</#if></#if>
									<#if (aam.modifyItem??)&&
											 (aam.modifyItem)?contains('IS_MAJOR')>checked</#if>/>&nbsp;社团性质&#12288; 
									</label>
									
									<label class="checkbox inline">
									<input type="checkbox" id="item_3" name="modifyItem"  value="ASSOCIATION_TYPE" 
									onclick="exeCurModify('item_3','ASSOCIATION_TYPE','associationType_','${(aam.associationPo.associationRegisterType.id!"")?html}')"
									<#if user_key.optMap??><#if user_key.optMap['submit']??>disabled</#if></#if>
									<#if (aam.modifyItem??)&&
											 (aam.modifyItem)?contains('ASSOCIATION_TYPE')>checked</#if>/>&nbsp;社团类型&#12288; 
									</label>
									
									<label class="checkbox inline">
									<input type="checkbox" id="item_4" name="modifyItem"  value="ASSOCIATION_ADVISOR" 
									onclick="exeCurModify('item_4','ASSOCIATION_ADVISOR','hiddenAdvisor','${(hiddenAdvisor!"")?html}')"
									<#if user_key.optMap??><#if user_key.optMap['submit']??>disabled</#if></#if>
									<#if (aam.modifyItem??)&&
											 (aam.modifyItem)?contains('ASSOCIATION_ADVISOR')>checked</#if>/>&nbsp;指导老师&#12288; 
									</label>
									
									<label class="checkbox inline">
									<input type="checkbox" id="item_5" name="modifyItem"  value="ASSOCIATION_MANAGER" 
									onclick="exeCurModify('item_5','ASSOCIATION_MANAGER','hiddenManager','${(hiddenManagerIds!"")?html}')"
									<#if user_key.optMap??><#if user_key.optMap['submit']??>disabled</#if></#if>
									<#if (aam.modifyItem??)&&
											 (aam.modifyItem)?contains('ASSOCIATION_MANAGER')>checked</#if>/>&nbsp;负责人&#12288; 
									</label>
									
									<label class="checkbox inline">
									<input type="checkbox" id="item_6" name="modifyItem"  value="OTHERS"
									onclick="exeCurModify('item_6','OTHERS','otherItem_','${(aam.otherModifyItem!"")?html}')"
									<#if user_key.optMap??><#if user_key.optMap['submit']??>disabled</#if></#if>
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
								<input id="associationName" name="associationPo.associationName" maxlength="200" 
									<#if aam.associationPo?? >value="${(aam.associationPo.associationName!"")?html}"</#if> 
									<#if !((aam.modifyItem??)&&(aam.modifyItem)?contains('ASSOCIATION_NAME'))>readonly</#if>/>
							</div>
							<span class="formTitle">其他变更<span class="f_req"></span>&#12288;</span>
						    <div class="span5">
								<input id="otherItem_" name="otherModifyItem"   value="${(aam.otherModifyItem!"")?html}"
								<#if !((aam.modifyItem??)&&(aam.modifyItem)?contains('OTHERS'))>readonly</#if>/>
							</div>
			            	</div>
						</div>
			            <div class="formSep">
							<div class="row-fluid">
							<span class="formTitle">社团类型<span class="f_req">*</span></span>
							<div class="span5">
									<input type="hidden" id="associationType_" name="associationPo.associationType.id" 
									<#if aam.associationPo?? && aam.associationPo.associationType??>
										value="${(aam.associationPo.associationType.id!"")?html}"</#if>/>
									<select size="1" id="_associationType_" name="associationType_" aria-controls="dt_gal" style="cursor:pointer" 
										onchange="setAassociationType(this.value)" 
										<#if !((aam.modifyItem??)&&(aam.modifyItem)?contains('ASSOCIATION_TYPE'))>disabled</#if>>
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
								<span class="formTitle">社团性质<span class="f_req">*</span>&#12288;</span>
								<div class="span5">
									
									<input type="hidden" id="isMajor_" name="associationPo.isMajor.id" 
									<#if aam.associationPo?? && aam.associationPo.isMajor??>
										value="${(aam.associationPo.isMajor.id!"")?html}"</#if>/>
										<label class="radio inline">
										<input type="radio" id="4028900f40cd477c0140cd4afd8d0001" name="isMajor_" 
													   							  value="4028900f40cd477c0140cd4afd8d0001" onclick="setIsMajor(this.value)"  
										<#if aam.associationPo ?? && aam.associationPo.isMajor ?? && aam.associationPo.isMajor.code=='Y'>checked</#if>
										<#if !((aam.modifyItem??)&&(aam.modifyItem)?contains('IS_MAJOR'))>disabled</#if>/>专业
										</label>
										
										<label class="radio inline">
										<input type="radio" id="4028900f40cd477c0140cd4b62ae0002" name="isMajor_" 
																				  value="4028900f40cd477c0140cd4b62ae0002" onclick="setIsMajor(this.value)"  
										<#if aam.associationPo ?? && aam.associationPo.isMajor ?? && aam.associationPo.isMajor.code=='N'>checked</#if>
										<#if !((aam.modifyItem??)&&(aam.modifyItem)?contains('IS_MAJOR'))>disabled</#if>/>非专业
										</label>
										
			                    </div>
			            	 </div>
						</div>
						<div>
								<input type="hidden" name="associationPo.associationAim" 
								<#if aam.associationPo??>value="${(aam.associationPo.associationAim!"")?html}"</#if>/>
								<input type="hidden" name="associationPo.isPay.id" 
								<#if aam.associationPo?? && aam.associationPo.isPay??>value="${(aam.associationPo.isPay.id!"")?html}"</#if>/>
								<input type="hidden" name="associationPo.associationFee" 
								<#if aam.associationPo??>value="${(aam.associationPo.associationFee!"")?html}"</#if>/>
								<input type="hidden" name="associationPo.isCancel.id" 
								<#if aam.associationPo?? && aam.associationPo.isCancel??>value="${(aam.associationPo.isCancel.id!"")?html}"</#if>/>
						</div>
			            <div class="formSep">
							<div class="row-fluid">
								<span class="formTitle">变更原因<span class="f_req">*</span></span>
								<div class="span11">
									<textarea cols="80" rows="6" name="applyReason" class="span9" style="width: 802px; height: 136px;"
									<#if user_key.optMap??><#if user_key.optMap['submit']??>readonly</#if></#if>>${(aam.applyReason!"")?html}</textarea>
			                    	<br><font size="1" color="grey"  style="vertical-align:bottom; padding-bottom:10px;">(不超过200字)</font>
			                    </div>
			            	 </div>
						</div>
						</form>
						<div class="formSep">
							<div class="row-fluid">
								<span class="formTitle">指导老师<span class="f_req">*</span></span>
									<#if (isCurManager=="true") && ((aam.modifyItem??)&&(aam.modifyItem)?contains('ASSOCIATION_ADVISOR'))>
									<div id="hiddenAdvisorDiv" class="span5">
									<input type="hidden" id="hiddenAdvisor" value="show_"/>
									<#else>
									<div id="hiddenAdvisorDiv" class="span5" style="display:none">
									<input type="hidden" id="hiddenAdvisor" value="hidden_"/>
									</#if>
									<input type="button" class="btn btn-info" onclick="selectAdvisor()" value="选择指导老师"/>
								</div>
							</div>
						</div>
			            <div class="formSep">
							<div class="row-fluid">
								<span class="formTitle">&#12288;&#12288;&#12288;&#12288;<span class="f_req">&nbsp;</span></span>
								<div class="span9">
									<#include "/association/advisorSelectedList.ftl">
			                    </div>
			                </div>
			            </div>
			            <div class="formSep">
							<div class="row-fluid">
									<span class="formTitle">教师简介<span class="f_req">*</span></span>
									<div class="span9">
									<#include "/association/apply/advisorInfoList.ftl">
									</div>
			                </div>
			             </div>
			            <div class="formSep">
							<div class="row-fluid">
								<span class="formTitle">负责人&#12288;<span class="f_req">*</span></span>
								<#if (isCurManager=="true") && ((aam.modifyItem??)&&(aam.modifyItem)?contains('ASSOCIATION_MANAGER'))>
									<div id="hiddenManagerDiv" class="span5">
									<input type="hidden" id="hiddenManager" value="show_"/>
								<#else>
									<div id="hiddenManagerDiv" class="span5" style="display:none">
									<input type="hidden" id="hiddenManager" value="hidden_"/>
								</#if>
									<input type="button" class="btn btn-info" onclick="selectManager()" value="选择负责人"/>
			                    	</div>
			            	</div>
			            </div>
			            <div class="formSep">
							<div class="row-fluid">
								<span class="formTitle">&#12288;&#12288;&#12288;&#12288;<span class="f_req">&nbsp;</span></span>
								<div class="span9">
									<#include "/association/managerSelectedList.ftl">
			                    </div>
			                </div>
			            </div>
			            <div class="formSep">
							<div class="row-fluid">
						   		<div class="span11">
									<span class="formTitle">变更材料<span class="f_req">*</span></span>
									<div class="span9" id="_upload_div">
										<form  id="fileUploadForm"  action="" method="post"  enctype="multipart/form-data">
											<#if user_key.optMap??><#if user_key.optMap['save']??>
											 <div data-fileupload="file" class="fileupload fileupload-new">
													<span class="btn btn-file"><span class="fileupload-new">选择文件</span><input id="file" type="file" name="file" onchange="uploadfile(this,'applyFileId')"></span>
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
			        	<div class="row-fluid">
							<span class="formTitle">&#12288;&#12288;&#12288;&#12288;<span class="f_req">&nbsp;</span></span>
				        	<div class="span9">
			                    <input class="btn btn-info"  type="button" onclick="onSave()" value="保存"/>
					            <input class="btn btn-info"  type="button" onclick="onSubmit()" value="提交"/>
					            <input class="btn" type="button" onclick="onCancel()" value="取消"/>
				        </div>	
            </div>
		</div>
    </div>
    <#include "/apw/instance/approvers.ftl"/>
</div>
<script>

   //判断数据是否为空
    function isEmpty(s){
	 return ((s==undefined || s==null || s=="" || s==0) ? true : false);
	}


//指导老师是否变更标志
var advisorChangeFlag="";
//负责人是否变更标志
var managerChangeFlag="";
function exeCurModify(objId,key,input,inputValue){
	if("ASSOCIATION_NAME"==key){
		comp.controlReadonly(objId,input);
		var attrValue = $("#"+objId).attr("checked");
		if(!(attrValue=='checked')){
			 $("#"+input).val(inputValue);
			 comp.message("您取消了【社团名称】变更项");
		}
	}else if("IS_MAJOR"==key){
		comp.controlMulDisabled(objId,input);
		var attrValue = $("#"+objId).attr("checked");
		if(!(attrValue=='checked')){
			 	$("#"+input).val(inputValue);
				$('input[name="'+input+'"]').each(function(){    
				     if($(this).val()==inputValue){
					      $(this).attr("checked",'checked'); 
				     }
			    });   
			 comp.message("您取消了【社团性质】变更项");
		}
	}else if("ASSOCIATION_TYPE"==key){
		comp.controlDisabled(objId,"_"+input);
		var attrValue = $("#"+objId).attr("checked");
		if(!(attrValue=='checked')){
			 	$("#"+input).val(inputValue);
			 	 $("#_"+input+" option").each(function (){
				    if($(this).val()==inputValue){
					      $(this).attr("selected",'selected'); 
					}
				 });
			 comp.message("您取消了【社团类型】变更项");
		}
	}else if("ASSOCIATION_ADVISOR"==key){
		comp.controlHidden(input+'Div',input);
		var attrValue = $("#"+objId).attr("checked");
		if(!(attrValue=='checked')){
			rollBackAdvisors(inputValue);
		}
	}else if("ASSOCIATION_MANAGER"==key){
		comp.controlHidden(input+'Div',input);
		comp.controlMulSelectDisabled(objId,'leaguePosition');
		var attrValue = $("#"+objId).attr("checked");
		if(!(attrValue=='checked')){
			 rollBackManagers(inputValue);
			 comp.message("您取消了【负责人】变更项");
		}
	}else if("OTHERS"==key){
		comp.controlReadonly(objId,input);
		var attrValue = $("#"+objId).attr("checked");
		if(!(attrValue=='checked')){
			 $("#"+input).val(inputValue);
			 comp.message("您取消了【其他】变更项");
		}
	}
}

//回滚变更的指导老师
function rollBackAdvisors(advisors){
	$.ajax({
		url:"${rc.contextPath}/association/apply/opt-delete/rollBackTemUsers.do",
		async:false,
		cache:false,
		type:"POST",
		data:{associationId:$("#associationId").val(),userType:'ADVISOR'},
		success:function(data){
	    	var jsonObj = jQuery.parseJSON(data);
			if('success'== jsonObj.flag){
				initSelectedAdvisor(advisors,null);
			}
		}
	});
}

//回滚变更的社团负责人
function rollBackManagers(managerIds){
   var Ids=managerIds.substr(1,managerIds.length-2);
	$.ajax({
		url:"${rc.contextPath}/association/apply/opt-delete/rollBackTemUsers.do",
		async:false,
		cache:false,
		type:"POST",
		data:{associationId:$("#associationId").val(),userType:'MANAGER'},
		success:function(data){
	    	var jsonObj = jQuery.parseJSON(data);
			if('success'== jsonObj.flag){
				initSelectedManagers(Ids,'rollback');
			}
		}
	});
}

function setMemberPositionInput(objId){
	var managerArray = $("#hiddenManagerIds").val().split(",");
	jQuery.each(managerArray, function() {
			comp.controlDisabled(objId,this+"_");
   });
}

//设置社团类型
function setAassociationType(value){
	$("#associationType_").val(value);
}

//设置社团性质
function setIsMajor(value){
	$("#isMajor_").val(value);
}

//设置社团学院
function setAssociationCollege(collegeId){
	$("#associationCollegeId").val(collegeId);
}

//保存社团申请 
 function onSave(){
    var isCurManager = $("#isCurManager").val();
    var isCurAdvisor = $("#isCurAdvisor").val();
    var applyTypeCode = $("#applyTypeCode").val();
    var optType = $("#optType").val();
	if(isCurManager=="true" || (applyTypeCode=="MODIFY" && optType=="ADD")){
		managerDoSave();
	}
	if(isCurAdvisor=="true"){
		advisorDoSave();
	}
 }

//保存社团申请 
 function managerDoSave(){
	var curCollegeName = $("#curCollegeName").val();
   if(formValidator.form()==true){
	   	if(!$("#hiddenTeacherIds").val()){
	   		comp.message("请选择指导老师");
	   	}else if(isEmpty($("#oldManagerIds").val()) && isEmpty($("#hiddenManagerIds").val())){
	   		comp.message("请选择负责人");
	   	}else if(!managerValidator()){
	 		comp.message("请设置团负责人【社长】");
	 	}else if(!uploadFileValidator()){
	 		comp.message("社团变更材料不可为空，请上传附件 !","error");
	 	}else{
	 	   if($("#isCurManager").val()=="true"){
		 		//initAssociationUserInfo();
	 	   }
	        mask.showShade();
			copyFileIdInput();
			var hiddenTeacherIds = $('#hiddenTeacherIds').val();
			var hiddenManagerIds = $('#hiddenManagerIds').val();
	        $('#modifyApplyEditForm').attr("action","${rc.contextPath}/association/apply/opt-edit/managerSaveApply.do"+
	        "?applyType="+$("#applyTypeCode").val()+
	        "&hiddenTeacherIds="+hiddenTeacherIds+
	        "&hiddenManagerIds="+hiddenManagerIds+
	        "&proprieterId="+$("#proprieterId").val()).submit();
	 	}
 	}
 }

 /**
   * 执行指导老师保存操作
   */
 function advisorDoSave(){
    if(advisorCommentValidator('SAVE') && formValidator.form()==true){
		copyFileIdInput();
        $('#modifyApplyEditForm').attr("action","${rc.contextPath}/association/apply/opt-edit/advisorSaveApply.do?applyType="+$("#applyTypeCode").val()).submit();
 	}
 }

//提交社团申请 
 function onSubmit(){
	    var isCurManager = $("#isCurManager").val();
	    var isCurAdvisor = $("#isCurAdvisor").val();
        var applyTypeCode = $("#applyTypeCode").val();
        var optType = $("#optType").val();
		if(isCurManager=="true" || (applyTypeCode=="MODIFY" && optType=="ADD")){
			managerDoSubmit();
		}
		if(isCurAdvisor=="true"){
			advisorDoSubmit();
		}
 }
 
 /**
   * 执行负责人提交操作
   */
 function managerDoSubmit(){
    if(formValidator.form()==true){
     	if(confirm("提交后不可修改，确认提交?")){
		   	if(!$("#hiddenTeacherIds").val()){
		   		comp.message("请选择指导老师");
		   	}else if(isEmpty($("#oldManagerIds").val()) && isEmpty($("#hiddenManagerIds").val())){
		   		comp.message("请选择负责人");
		   	}else if(!managerValidator()){
		 		comp.message("请设置团负责人【社长】");
		 	}else if(!uploadFileValidator()){
		 		comp.message("社团变更材料不可为空，请上传附件 !","error");
		 	}else{
		 	   if($("#isCurManager").val()=="true"){
			 		//initAssociationUserInfo();
		 	   }
		        mask.showShade();
				copyFileIdInput();
				var hiddenTeacherIds = $('#hiddenTeacherIds').val();
				var hiddenManagerIds = $('#hiddenManagerIds').val();
		        $('#modifyApplyEditForm').attr("action","${rc.contextPath}/association/apply/opt-edit/managerSubmitApply.do"+
		        "?applyType="+$("#applyTypeCode").val()+
		        "&hiddenTeacherIds="+hiddenTeacherIds+
		        "&hiddenManagerIds="+hiddenManagerIds+
		        "&proprieterId="+$("#proprieterId").val()).submit(); 
	 		}
 		}
 	}
 }
 
 //初始化社团负责人信息
 function initAssociationUserInfo(){
 	if(comp.isNull(advisorChangeFlag)){//指导老师未发生变更
 		$("#item_4").removeAttr("checked");
 	}
 	
 	if(comp.isNull(managerChangeFlag)){//负责人未发生变更
 		$("#item_5").removeAttr("checked");
 	}
 }

 /**
   * 执行指导老师提交操作
   */
 function advisorDoSubmit(){
    if(advisorCommentValidator('SUBMIT') && formValidator.form()==true){
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
				data:$('#modifyApplyEditForm').serialize(),
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
	  
	//校验社长是否存在
	function managerValidator(){
		var proprieterId=$("#proprieterId").val();
		return comp.isNotNull(proprieterId);
	}
	  
	function advisorCommentValidator(flag){
		var returnFlag=false;
		var curUserId = $("#curUserId").val();
		var myComments = $("#comment_"+curUserId).val();
		var advisorCommentArray = $("input[name='advisorComment_']");
		var advisorList=$("#aamListSize").val()
		//alert("指导老师列表："+advisorList+"指导老师简介列表："+advisorCommentArray.length+"~"+(advisorCommentArray.length==advisorList));
		if(comp.isNotNull(myComments)){
			if(flag=="SUBMIT" && !(advisorCommentArray.length==advisorList)){
				comp.message("请等待其他老师完成简介!");
			}else{
				returnFlag=true;
			}
		}else{
			comp.message("请完成您的简介!");
		}
		return returnFlag;
	}
	
	function uploadFileValidator(){
		var fileIds = $("#fileUploadForm input[name='applyFileId']");
		if(fileIds.length>0){
			return true;
		}else{
			return false;
		}
	}
    
	// 多选教职工
	function selectAdvisor()
	{   
		var selectedTeacherIds = $("#teacherIds").val();
	    if($("#item_4").attr("checked")=='checked' && isEmpty(selectedTeacherIds)){
	    	selectedTeacherIds = $("#hiddenTeacherIds").val();
	    }
		_queryTeacherCheckAll(selectedTeacherIds);
	}
	
	//初始化教职工信息
	function setTeacherSelectValue(teacherIds,names)
	{
		var teacherArray = teacherIds.split(",");
		if(teacherArray.length>2){
			comp.message("指导老师为1~2人");
		}else{
			initSelectedAdvisor(teacherIds,names);
		}
	}
	
	/**
	  * 初始化选定的指导老师信息
	  */
	function initSelectedAdvisor(teacherIds,names){
		if(isAdvisorChange(teacherIds)){
			$("#hiddenTeacherIds").val(teacherIds);
			advisorChangeFlag=teacherIds;
		}
		
		var param = {associationId:$("#associationId").val(),teacherIds:teacherIds,applyTypeCode:$('#applyTypeCode').val()};
		$("#teacherInfoPage").load("${rc.contextPath}/association/apply/nsm/asynPackageAdvisorList.do",param,function(){});
		
		var modifyItem="";
		$("input[name='modifyItem']").each(function(){
			modifyItem += $(this).val()+",";
		});
	    var param={associationId:$("#associationId").val(),
	    						 applyType:$('#applyTypeCode').val(),
	    						 applyId:$("#applyId").val(),
	    						 teacherIds:teacherIds,modifyItem:modifyItem};
		$("#advisorInfoDiv").load("${rc.contextPath}/association/apply/nsm/managerAsynLoadAdvisorInfo.do",param,function(){});
	}
	
	//校验指导老师是否进行变更
	function isAdvisorChange(teacherIds){
	    var flag=false;
		if(comp.isNotNull(teacherIds)){
			var teacherArray = teacherIds.split(",");
			var hiddenTeacherIds = $("#hiddenTeacherIds").val();
			var hiddenTeacherArray = hiddenTeacherIds.split(",");
			jQuery.each(teacherArray, function() {
				if(hiddenTeacherIds.indexOf(this)==-1)
					flag = true;
		   });
		}
		return (teacherArray.length!=hiddenTeacherArray.length) || flag;
	}
	
	
	// 多选学生
	function selectManager()
	{   
	    var selectedManagerIds = $("#hiddenManagerIds").val();
	    if($("#item_5").attr("checked")!='checked' || isEmpty(selectedManagerIds)){
	    	selectedManagerIds = $("#oldManagerIds").val();
	    }
		_queryStudentCheckAll(selectedManagerIds,"");
	}
	
	//初始化学生信息
	function setMultiEduClassSelectValue(managerIds,names)
	{
		var managerArray = managerIds.split(",");
		if(managerArray.length<3){
			comp.message("社团负责人不可少于3人 !");
		}else{
			var curUserId = $("#curUserId").val();
			if(managerIds.indexOf(curUserId)==-1){
				comp.message("请保证登录人，为社团负责人成员!");
			}else{
				$("#memberNums").val(managerArray.length);
				initSelectedManagers(managerIds,null);
			}
		}
	}
	
	/**
	  * 初始化选中的社团负责人
	  */
	function initSelectedManagers(managerIds,flag){
	//判断是原始的还是临时的id
	   
		if(isManagerChange(managerIds)){
			$("#hiddenManagerIds").val(managerIds);
			managerChangeFlag = managerIds;
			if($("#item_5").attr("checked")!='checked'){
		       managerIds = $("#oldManagerIds").val();
		    }
			var param = {associationId:$("#associationId").val(),
										managerIds:managerIds,
										applyTypeCode:$("#applyTypeCode").val(),
										proprieterId:$("#proprieterId").val()};
			$("#managerInfoPage").load("${rc.contextPath}/association/apply/nsm/asynPackageManagerList.do",param,function(){});
		}else{
			$("#item_5").removeAttr("checked");
			//comp.controlHidden('hiddenManagerDiv','hiddenManager');
			comp.controlMulSelectDisabled('item_5','leaguePosition');
			comp.message("负责人未进行变更!");
		}
	}
	
	//校验负责人是否进行变更
	function isManagerChange(managerIds){
		var flag=false;
		var hiddenManagerArray;
		var managerArray;
		if(comp.isNotNull(managerIds)){
			managerArray = managerIds.split(",");
			var hiddenManagerIds = $("#oldManagerIds").val();
			hiddenManagerArray = hiddenManagerIds.split(",");
			jQuery.each(managerArray, function() {
				if(hiddenManagerIds.indexOf(this)==-1)
					flag = true;
		   });
		}
		return (hiddenManagerArray.length!=managerArray.length) || flag;
	}
	
	//设置社团成员职务
	function setMemberPosition(associationId,memberId,memberPoId,dicId){
		var proprieterId=$("#proprieterId").val();//获取社长
		if(comp.isNotNull(proprieterId) && (dicId=="2c9d508150a778080150a77c5a680002")){
			comp.message("只能设置一个社长 !","info");
			var param = {	associationId:$("#associationId").val(),
									   	managerIds:$("#hiddenManagerIds").val(),
									   	applyTypeCode:$("#applyTypeCode").val(),
									   	proprieterId:proprieterId
									   };
			$("#managerInfoPage").load("${rc.contextPath}/association/apply/nsm/asynPackageManagerList.do",param,function(){});
		}else{
			proprieterId = setLeaguePostion(proprieterId,memberId,dicId);
			var param = {	associationId:$("#associationId").val(),
									   	managerIds:$("#hiddenManagerIds").val(),
									   	applyTypeCode:$("#applyTypeCode").val(),
									   	proprieterId:proprieterId
									   };
			$("#managerInfoPage").load("${rc.contextPath}/association/apply/nsm/asynPackageManagerList.do",param,function(){});
		}
	}
	
	function setLeaguePostion(proprieterId,memberId,dicId){
		    if(dicId=="2c9d508150a778080150a77c5a680002"){//副社长变为社长
				$("#proprieterId").val(memberId);
				proprieterId=memberId;
		    }else if(dicId=="2c9d508150a778080150a77cec100003"){//社长变为副社长
				$("#proprieterId").val("");
				proprieterId="";
		    }
		    return proprieterId;
	}
	
	//编辑指导老师简介
	function _editAdvisorInfo(associationId,teacherId){
 		comp.showModal("_advisorInfoModal","700px","-300px 0 0 -320px");
 		var isAdvisorChange=$("#modifyItem_").val().indexOf("ASSOCIATION_ADVISOR")>-1;
 		$("#stmp_advisorInfo").load("${rc.contextPath}/association/apply/nsm/editAdvisorInfo.do",{associationId:associationId,teacherId:teacherId,isAdvisorChange:isAdvisorChange});
	}
	
	function _advisorSave(){
		var commentlength = $("#advisorComments").val();
		if(commentlength.length<=500){
			var isAdvisorChange=$("#modifyItem_").val().indexOf("ASSOCIATION_ADVISOR")>-1;
			if(isAdvisorChange){
				$.ajax({
					url:"${rc.contextPath}/association/apply/opt-edit/saveAdvisorTempInfo.do",
					async:false,
					cache:false,
					type:"POST",
					data:{associationId:$("#associationId").val(),
							   advisorId:$("#advisorId_").val(),
							   advisorComments:$("#advisorComments").val()},
					success:function(msg){
						if('success'== msg){
						     var param={associationId:$("#associationId").val(),
						     						  applyType:$("#applyTypeCode").val(),
						     						  teacherIds:$("#hiddenTeacherIds").val(),
						     						  modifyItem:$("#modifyItem_").val()};
							$("#advisorInfoDiv").load("${rc.contextPath}/association/apply/nsm/advisorAsynLoadAdvisorInfo.do",param,function(){});
						}
					}
				});
			}else{
				$.ajax({
					url:"${rc.contextPath}/association/apply/opt-edit/saveAdvisorInfo.do",
					async:false,
					cache:false,
					type:"POST",
					data:{id:$("#aamId").val(),comments:$("#advisorComments").val()},
					success:function(msg){
						if('success'== msg){
						     var param={associationId:$("#associationId").val(),applyType:$("#applyTypeCode").val(),teacherIds:$("#hiddenTeacherIds").val()};
							$("#advisorInfoDiv").load("${rc.contextPath}/association/apply/nsm/advisorAsynLoadAdvisorInfo.do",param,function(){});
						}
					}
				});
			}
			$('#_advisorInfoModal').modal('hide');
		}else{
			comp.message("指导老师简介不可超过500字");
		}
	}
	
	function eisdResponse(r,s){
			var obj = eval("("+r+")");
			if(obj.success=="success"){
				if(obj.listType=="LIST_MANAGER"){
					var param = {pageNo:obj.pageNo,
												associationId:$("#associationId").val(),
											    managerIds:$("#hiddenManagerIds").val(),
											    applyTypeCode:$("#applyTypeCode").val(),
											    proprieterId:$("#proprieterId").val(),
											    operateStatus:$("#operateStatus").val(),
											    modifyItemInfo:'${modifyItemInfo!""}'};
					$("#managerInfoPage").load("${rc.contextPath}/association/apply/nsm/asynPackageManagerList.do",param,function(){});
				}else if(obj.listType=="LIST_ADVISOR"){
					var param = {pageNo:obj.pageNo,associationId:$("#associationId").val(),teacherIds:${hiddenTeacherIds!"''"}};
					$("#teacherInfoPage").load("${rc.contextPath}/association/apply/nsm/asynPackageAdvisorList.do",param,function(){});
				}
			}
	}
	 
    //返回到查询信息页面
    function onCancel(){
    	window.location.href="${rc.contextPath}/association/apply/opt-query/getAssociationApplyList.do";
   }

</script>
<#include "/comp/teacher/queryTeacherCheckBoxModal.ftl">
<#include "/comp/student/queryStudentAllCheckBoxModal.ftl"> 
<!--pop start-->
<div class="modal hide fade" id="_advisorInfoModal">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3 id="title1">指导老师简介填写</h3>
	</div>
	<div class="modal-body"  id="stmp_advisorInfo">
	  <form class="form_validation_reg" id="advisorForm" name="advisorForm" >
		<#include "/association/apply/advisorInfoEdit.ftl">
	  </from>	
	</div>
	<div class="modal-footer">
		<a href="#" class="btn" data-dismiss="modal">取消</a>
		<a href="#" class="btn btn-info" onclick="_advisorSave()">确定</a>
	</div>
</div>
</body>
</html>