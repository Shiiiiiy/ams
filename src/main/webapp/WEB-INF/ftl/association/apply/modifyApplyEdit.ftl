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
				'applyDate': {required:true},
				'modifyItem': {required:true}/**,
				'changedAssociationName': {required:true},
				'changedAssociationType.id': {required:true},
				'changedIsMajor.id': {required:true},
				'otherModifyItem': {required:true},
				'changedAdvisorName': {required:true},
				'changedManagerName': {required:true}**/
			},
			messages:{
				'applyReason': {required:'变更原因不能为空',maxlength:'变更原因不可超过200字'},
				'applyDate': {required:'请选择变更时间'},
				'modifyItem': {required:'请选择要变更的项目'}/**,
				'changedAssociationName': {required:'请填写变更后社团名称'},
				'changedAssociationType.id': {required:'请选择变更后社团类型'},
				'changedIsMajor.id': {required:'请选择变更后社团性质'},
				'otherModifyItem': {required:'请填写其他变更内容'},
				'changedAdvisorName': {required:'请选择变更后指导老师'},
				'changedManagerName': {required:'请选择变更后负责人'}**/
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
		      		<h3 class="heading">社团变更维护</h3>
			  	</div>
			 </div> 
			<form  id="cancelApplyEditForm" class="form_validation_reg" method="post">
			<input name="status" id="status" type="hidden" value="10" />
			<input name="id" id="applyId" type="hidden" value="${applyModel.id!""}" />
			<input name="associationPo.id" id="associationId" type="hidden" value="${applyModel.associationPo.id!""}" />
			 
			 <#--原社团信息-->
			 <div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span2"><label>社团名称 </label></div>
						<div class="span10">
							<input type="hidden" name="orignAssociationName"  class="span6" value="${applyModel.orignAssociationName!""}"/>         
							<input id="orignAssociationName"  readonly   class="span6" name="sssociationName" <#if applyModel??>value="${(applyModel.orignAssociationName!"")?html}"</#if>/>
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
							<input type="hidden" name="orignAssociationType.id" id="orignAssociationTypeId"  value="${applyModel.orignAssociationType.id!""}"/>
							<input id="orignTypeName"  readonly   class="span6" name="orignAssociationTypeIdName" <#if applyModel?? && applyModel.orignAssociationType??> value="${applyModel.orignAssociationType.name}"</#if>/>
						</div>
					</div>
					<div class="span6">
						<div class="span2"><label>所属学院</label></div>
						<div class="span10">
							<input type="hidden" name="college.id" value="${applyModel.college.id!""}"/>
							<input id="collegeName"  readonly   class="span6" name="collegeName" <#if applyModel?? && applyModel.college??> value="${applyModel.college.name}"</#if>/>
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
								<input type="text" id="orignIsMajorName"  class="span6" readonly value="${applyModel.orignIsMajor.name!""}"/>
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
								<input id="applyTime" class="span6" readonly name="applyTime" <#if applyModel?? && applyModel.associationPo??>value="${(applyModel.associationPo.applyTime!"")?html}"</#if>/>
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
								<input type="text" id="orignAdvisorName"  class="span6" readonly name="orignAdvisorName" value="${applyModel.orignAdvisorName!""}"/>
							</div>
		                </div>
						<div class="span6">
							<div class="span2"><label>负责人</label></div>
							<div class="span10">
								<input type="hidden" id="orignManagerId" name="orignManagerId" value="${applyModel.orignManagerId!""}"/>
								<input type="text" id="orignManagerName" readonly class="span6" name="orignManagerName" value="${applyModel.orignManagerName!""}"/>
							</div>
		           		</div>
		    		</div>
				</div>
		    	
		    	<#--变更项目-->
		    	<div class="formSep">
					<div class="row-fluid">
						<div class="span12">
							<div class="span1"><label>变更项目<span class="f_req">*</span></label></div>
							<div class="span8">
							<#if modifyItemMap??>
								<#list modifyItemMap?keys as key>
									<label class="checkbox inline">
										<input type="checkbox" onclick="changItem(this,'${key!""}');" <#if applyModel?? &&  applyModel.modifyItem ?? && applyModel.modifyItem?contains(key)>checked</#if> name="modifyItem" value="${key!""}" />${modifyItemMap[key]} 
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
							<input id="ASSOCIATION_NAME"  <#if applyModel?? &&  applyModel.modifyItem ?? && applyModel.modifyItem?contains(associatioName)><#else>disabled</#if> class="span6" name="changedAssociationName" <#if applyModel??>value="${(applyModel.changedAssociationName!"")?html}"</#if>/>
						</div>
					</div>
					<div class="span6">
						<div class="span2"><label>变更后类型</label></div>
						<div class="span10">
						<select size="1" id="ASSOCIATION_TYPE" <#if applyModel?? &&  applyModel.modifyItem ?? && applyModel.modifyItem?contains(changeType)><#else>disabled</#if>   class="span6" name="changedAssociationType.id" aria-controls="dt_gal">
							<option value="">请选择..</option>
							<#if associationTypeDicList ??>
						      <#list associationTypeDicList as g>
								<#if applyModel ?? &&  applyModel.modifyItem ?? && applyModel.changedAssociationType ?? && applyModel.changedAssociationType.id == g.id>
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
			</div>
		    <div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span2"><label>变更后性质</label></div>
						<div class="span10">
							<#if associationKind ??>
								<#list associationKind as c>
								<label class="radio inline">
									<input type="radio" id="IS_MAJOR" <#if applyModel?? &&  applyModel.modifyItem ?? && applyModel.modifyItem?contains(associatioIsMajor)><#else>disabled</#if> value="${c.id!""}"  name="changedIsMajor.id" <#if applyModel?? && applyModel.changedIsMajor?? && applyModel.changedIsMajor.id == c.id> checked</#if>/>
									${c.name!""}
								</label>
								</#list>
							</#if>
						</div>
					</div>
					<div class="span6">
						<div class="span2"><label>其他变更</label></div>
						<div class="span10">
							<input id="OTHERS" <#if applyModel?? &&  applyModel.modifyItem ?? && applyModel.modifyItem?contains(others)><#else>disabled</#if> name="otherModifyItem"  class="span6" <#if applyModel??>value="${(applyModel.otherModifyItem!"")?html}"</#if>/>
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
								<input type="text" id="ASSOCIATION_ADVISOR"  class="span6" readonly name="changedAdvisorName" value="<#if applyModel.changedAdvisorId??>${applyModel.changedAdvisorName!""}</#if>"/>
		                    	<a id="advisor-select" style="margin-left: -4px;;margin-top:-10px;<#if applyModel?? &&  applyModel.modifyItem ?? && applyModel.modifyItem?contains(associatioAdvisor)><#else>display:none</#if>"  href="javascript:void(0);"   onclick="selectAdvisor();" class="btn"><i class="icon-search"></i></a>
		                    </div>
		                </div>
						<div class="span6">
							<div class="span2"><label>变更负责人</label></div>
		                    <div class="span10">
								<input type="hidden" id="changedManagerId" name="changedManagerId" value="${applyModel.changedManagerId!""}"/>
								<input type="text" id="ASSOCIATION_MANAGER"  class="span6" readonly name="changedManagerName" value="<#if applyModel.changedManagerId??>${applyModel.changedManagerName!""}</#if>"/>
		                    	<a id="manager-select" style="margin-left: -4px;;margin-top:-10px;<#if applyModel?? &&  applyModel.modifyItem ?? && applyModel.modifyItem?contains(associatioManager)><#else>display:none</#if>" href="javascript:void(0);"   onclick="selectManager();" class="btn"><i class="icon-search"></i></a>
		                    </div>
		            	</div>
	                    </div>
	            	</div>
        	   	<div class="formSep">
					<div class="row-fluid">
		            	<div class="span6">
							<div class="span2"><label>变更时间<span class="f_req">*</span></label></div>
							<div class="span10">
								<input id="applyDate" class="Wdate span6" style="cursor:pointer" onclick="WdatePicker({skin:'whyGreen'});" name="applyDate" <#if applyModel?? && applyModel.applyDate??>value="${(applyModel.applyDate!"")?string("yyyy-MM-dd")}"</#if>/>
							</div>
		           		</div>
		        	</div>
		        </div>
			 <#--变更后的社团信息-->
			 
			 
			 <#--变更材料信息-->
			 <div class="formSep">
					<div class="row-fluid">
						<div class="span12">
						<div class="span1"><label>变更原因<span class="f_req">*</span></label></div>
						<div class="span8">
							<textarea cols="80" rows="6" name="applyReason" class="span12">${(applyModel.applyReason!"")?html}</textarea>
	                    	<br><font size="1" color="grey"  style="vertical-align:bottom; padding-bottom:10px">(不超过200字)</font>
	                    </div>
	            	 </div>
				</div>
			</div>
			</form>

				<div class="formSep">
						<div class="row-fluid">
							 <div class="span12">
								<div class="span1"><label>变更附件<span class="f_req">*</span></label> </div>
								<div class="span8" id="_finance_upload_div">
									<form  id="financeFileUploadForm"  method="post"  enctype="multipart/form-data">
										<#if user_key.optMap?? && user_key.optMap['save']??>
										 <div data-fileupload="file" class="fileupload fileupload-new">
												<span class="btn btn-file">
													<span class="fileupload-new">选择文件</span>
														<input id="file" type="file" name="file" onchange="uploadfile(this,'financeFileUploadForm','financeFileId')">
												</span>
										 </div>
										 <div class="upload-alert-message" style="word-break:break-all">
						        		        文件只支持：jpg,jpeg,png,gif,txt,ppt,rar,zip,doc,docx,xls,xlsx,ppt,pptx,wps,et,dps且大小不超过10MB。
						        		 </div>
										</#if>
										 <#if fileList??>	
											<#list fileList as p>
												<div class="fileupload-info">
													<#if user_key.optMap?? && user_key.optMap['save']??>
													<a class="close" data-dismiss="alert">×</a>
													</#if>
													<a href="${rc.contextPath}/sys/sysConfig/file.do?id=${(p.uploadFile.id)?html}"><strong>${(p.uploadFile.name)?html}&nbsp;(${(p.uploadFile.fileSize)?html})</strong></a>
													<input type="hidden"  name="financeFileId" value="${(p.uploadFile.id)?html}"/>	
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
		        			<input class="btn btn-info"  type="button" onclick="saveInfo('10')" value="保 存"/>
				            <input class="btn btn-info"  type="button" onclick="saveInfo('20')" value="提 交"/>
				            <input class="btn" type="button" onclick="onCancel()" value="取 消"/>
			        	</div>	
		        	</div>	
	 	</div>
	 </div> 
</div>


<#include "/comp/teacher/queryTeacherCheckBoxModal.ftl">
<#-- 学生选择单选组件的引入 -->
<#include "/comp/student/queryStudentAllRadioModal.ftl">

<script>

	// 多选教职工
	function selectAdvisor()
	{
		var selectedTeacherIds = $("#changedAdvisorId").val();
		_queryTeacherCheckAll(selectedTeacherIds);
	}
	//初始化教职工信息
	function setTeacherSelectValue(teacherIds,names)
	{
		var teacherArray = teacherIds.split(",");
		if(teacherArray.length>2){
			comp.message("指导老师为1~2人","error");
		}else{
			$("#changedAdvisorId").val(teacherIds+",");
			$("#ASSOCIATION_ADVISOR").val(names);
		}
	}
	
	// 单选学生选择 
	function selectManager()
	{
		var memberId = $("#changedManagerId").val();
		if(memberId!="")
			memberId = memberId.substring(0,memberId.length-1);
		_queryStudentRadioAll(memberId,"");
	}
	function setStudentRadioSelectValue(student)
	{
		$("#changedManagerId").val(student.id+",");
		$("#ASSOCIATION_MANAGER").val(student.name);
	}
	
	function changItem(obj,id)
	{
		var flag = $(obj).attr("checked");
		if(flag)
		{
			if("IS_MAJOR" == id)// 社团性质单选 单独处理
			{
				$("input:radio[name='changedIsMajor.id']").removeAttr("disabled");
			}else if("ASSOCIATION_ADVISOR" == id){
				$("#advisor-select").show();
			}else if("ASSOCIATION_MANAGER" == id){
				$("#manager-select").show();
			}else{
				$("#"+id).removeAttr("disabled");
			}
		}else{
			if("IS_MAJOR" == id)// 社团性质单选 单独处理
			{
				$("input:radio[name='changedIsMajor.id']").removeAttr("checked").attr("disabled","disabled");
			}else if("ASSOCIATION_ADVISOR" == id){
				$("#changedAdvisorId").val("");
				$("#"+id).val("");
				$("#advisor-select").hide();
			}else if("ASSOCIATION_MANAGER" == id){
				$("#changedManagerId").val("");
				$("#"+id).val("");
				$("#manager-select").hide();
			}else{
				$("#"+id).val("");
				$("#"+id).attr("disabled","disabled");
			}
		}
		var validator = $("#cancelApplyEditForm").validate();
		validator.reset();
	}

	  //返回到查询信息页面
	   function onCancel(){
	    	window.location.href="${rc.contextPath}/association/apply/opt-query/getAssociationApplyList.do";
	  }	
   
	 function saveInfo(status)
	 {
		
		 if(formValidator.form()==true)
		 {
			if(!financeFileValidator()){
		 		comp.message("社团变更材料不可为空，请上传附件 !","error");
		 		return false;
	 		}
	 		
	 		if(checkChangeItem())
	 		{
	 		
		 		if(status == '20')
		 		{
					comp.confirm("变更申请后可能影响系统数据的正常使用,确认要提交？", function(result) {
		            	if(!result)
		            		return; 
	            		$("#status").val(status);
	        			 mask.showShade();
						copyFileIdInput();
				        $('#cancelApplyEditForm').attr("action","${rc.contextPath}/association/apply/opt-edit/saveChangeApply.do").submit();
	
	    			}); 
		 		}else{
		 			$("#status").val(status);
	        		mask.showShade();
					copyFileIdInput();
			        $('#cancelApplyEditForm').attr("action","${rc.contextPath}/association/apply/opt-edit/saveChangeApply.do").submit();
	
		 		}
	 		
	 		}
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
	
	//变更项目校验
	function checkChangeItem()
	{
		var bol = true;
		$('input[name="modifyItem"]').each(function() {
			var isCheck = $(this).attr('checked');
	        if(isCheck == true || isCheck == 'checked') 
	        {
	             //社团名称判断
	              if($(this).val() =="ASSOCIATION_NAME")
	              {
	              	var name =  $("#ASSOCIATION_NAME").val();
	              	var orignName = $("#orignAssociationName").val();
	              	if(name =="" || name == null || name =="undefined" )
	              	{
	              		comp.message("变更后社团名称不能为空","error");
	              		bol = false;
	              	}else if(orignName == name){
	              		comp.message("变更后社团名称不能与原社团名称相同","error");
	              		bol = false;
	              	}
	              }
	              
	              //社团类型判断
	              if($(this).val() =="ASSOCIATION_TYPE")
	              {
	              	var type =  $("#ASSOCIATION_TYPE").val();
	              	var orginType = $("#orignAssociationTypeId").val();
	              	if(type =="" || type == null || type =="undefined" )
	              	{
	              		comp.message("请选择变更后社团类型","error");
	              		bol = false;
	              	}else if(orginType == type){
	              		comp.message("变更后社团类型不能与原社团类型相同","error");
	              		bol = false;
	              	}
	              }
	              
	               //其他变更
	              if($(this).val() =="OTHERS")
	              {
	              	var other =  $("#OTHERS").val();
	              	if(other =="" || other == null || other =="undefined" )
	              	{
	              		comp.message("请填写其他变更内容项目","error");
	              		bol = false;
	              	}
	              }
	              
	              //社团性质判断
	              if($(this).val() =="IS_MAJOR")
	              {
              			var orginIsMajor = $("#orignIsMajorId").val();
              			var val=$('input:radio[name="changedIsMajor.id"]:checked').val();
		            	if(val==null){
			                comp.message("请选择变更后社团性质","error");
	              			bol = false;
			            }else if(val == orginIsMajor){
			                comp.message("变更后社团性质不能与原社团性质相同","error");
	              			bol = false;
		            	}
	              }
	              
	              //社团指导老师
	              if($(this).val() =="ASSOCIATION_ADVISOR")
	              {
	              	var advisor =  $("#changedAdvisorId").val();
	              	var orginAdvisor = $("#orignAdvisorId").val();
	              	if(advisor =="" || advisor == null || advisor =="undefined" )
	              	{
	              		comp.message("请选择变更后社团指导老师","error");
	              		bol = false;
	              	}else if(orginAdvisor == advisor){
	              		comp.message("变更后社团指导老师不能与原社团指导老师相同","error");
	              		bol = false;
	              	}
	              }
	              
	              //社团负责人
	              if($(this).val() =="ASSOCIATION_MANAGER")
	              {
	              	var manager =  $("#changedManagerId").val();
	              	var orginmanager = $("#orignManagerId").val();
	              	if(manager =="" || manager == null || manager =="undefined" )
	              	{
	              		comp.message("请选择变更后社团负责人","error");
	              		bol = false;
	              	}else if(manager == orginmanager){
	              		comp.message("变更后社团负责人不能与原社团负责人相同","error");
	              		bol = false;
	              	}
	              }
	        }
		});
		
		return bol;
	}
</script>			
</body>
</html>