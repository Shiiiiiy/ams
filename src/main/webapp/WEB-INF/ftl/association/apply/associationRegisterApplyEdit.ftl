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
	    formValidator = $("#registerApplyEditForm").compValidate({
			rules:{
					'orignAssociationName': {required:true,maxlength:200},
					'applyDate': {required:true},
					'orignAssociationType.id': {required:true},
					'college.id': {required:true},
					'associationAim': {required:true,maxlength:200},
					'orignIsMajor.id': {required:true},
					'advisorNames': {required:true},
					'isOpen.id': {required:true},
					'openScope.id': {required:true},
					'majorName': {required:true},
					'associationFee': {required:true,number:true,min:0}
					
			},
			messages:{
					'orignAssociationName': {required:'请填写社团名称 !',maxlength:"最大可输入200字"},
					'applyDate': {required:'请填写申请时间 !'},
					'orignAssociationType.id': {required:'请选择社团类型!'},
					'college.id': {required:'请选择社团所属学院!'},
					'associationAim': {required:'社团宗旨不可为空 !',maxlength:"最大可输入200字"},
					'orignIsMajor.id': {required:'请指定社团性质 !'},
					'advisorNames': {required:'请选择指导老师'},
					'isOpen.id': {required:'请指定是否开放!'},
					'openScope.id': {required:'请指定开放范围 !'},
					'majorName': {required:'请选择专业'},
					'associationFee': {required:'请填写缴费信息',number:'社团费用请填写数字',min:'社团费用不能小于0'}
			}
		 });
 	});
 	
 	 	 
	function onSubmit(status)
	{
		 if(formValidator.form()==true)
		 {
			var memberId = $("#memberIds").val();
			var memberIds = memberId.split(",");
			if(comp.isNull(memberId) || memberIds.length < 3)
			{
				comp.message("社团成员至少为3人","error");
				return false;
			}
			var advisorId = $("#advisorIds").val();
			var advisorIds = advisorId.split(",");
			if(comp.isNull(advisorIds))
			{
				comp.message("请选择指导老师！","error");
				return false;
			}else if(advisorIds.length > 3)
			{
				comp.message("指导老师最多为2名！","error");
				return false;
			}
			if(!uploadFileValidator()){
		 		comp.message("社团注册材料不可为空，请上传附件 !","error");
		 		return false;
	 		}
	 		if(status == '20')
	 		{
				comp.confirm("提交之后注册信息将不能修改,是否要提交？", function(result) {
	            	if(!result)
	            		return; 
        			$("#submitStatus").val(status);
            		mask.showShade();
					copyFileIdInput(); 
					$("#registerApplyEditForm").submit();
    			}); 
	 		}else{
	 			$("#submitStatus").val(status);
        		mask.showShade();
				copyFileIdInput(); 
				$("#registerApplyEditForm").submit();
	 		}
		 }
	}
	 
 	
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
	
	
	function uploadFileValidator(){
		var fileIds = $("#fileUploadForm input[name='applyFileId']");
		if(fileIds.length>0){
			return true;
		}else{
			return false;
		}
	}
	
	function copyFileIdInput(){
		$("#registerApplyEditForm").append($("#fileUploadForm input[name='applyFileId']"));
	}
	 
	</script>
</head>
<body>
<div id="contentwrapper">
    <div class="main_content">
        <div class="row-fluid">
        	<div class="row-fluid">
		   		<div class="span12">
		      		<h3 class="heading">社团注册维护</h3>
			  	</div>
			 </div> 	
    		<form  id="registerApplyEditForm" class="form_validation_reg" method="post" action="${rc.contextPath}/association/apply/opt-save/saveAssociationRegister.do">
    			<input type="hidden" name="id" id="id" value="${applyModel.id!""}"/>
    			<input type="hidden" name="submitStatus" id="submitStatus" value="10"/>
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span2"><label>社团名称 <span class="f_req">*</span></label></div>
								<div class="span10">
									<input id="associationName"  class="apan8" name="orignAssociationName" <#if applyModel??>value="${(applyModel.orignAssociationName!"")?html}"</#if>/>
								</div>
							</div>
							<div class="span6">
								<div class="span2"><label>申请时间<span class="f_req">*</span></label></div>
	                            <div class="span10">
		                            <input id="applyTime" name="applyDate" class="Wdate span5" style="cursor:pointer" onclick="WdatePicker({skin:'whyGreen'});"
										<#if applyModel.applyDate?? >value="${(applyModel.applyDate!"")?string('yyyy-MM-dd')}"<#else>value="${(nowDate!"")?string("yyyy-MM-dd")}"</#if>/>						
								</div>
							</div>
						</div>
					</div>
	                <div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span2"><label>社团类型<span class="f_req">*</span></label></div>
								<div class="span10">
								<select size="1" id="associationType" name="orignAssociationType.id" aria-controls="dt_gal">
									<option value="">请选择..</option>
									<#if associationTypeDicList ??>
								      <#list associationTypeDicList as g>
										<#if applyModel ?? && applyModel.orignAssociationType ?? && applyModel.orignAssociationType.id == g.id>
												<option  value="${(g.id)?html}" selected="selected">${(g.name)?html}</option>	
											<#else>
												<option value="${(g.id)?html}" >${(g.name)?html}</option>
											</#if>
										</#list>
									</#if>
								</select>
								</div>
							</div>
							<div class="span6">
								<div class="span2"><label>所属学院<span class="f_req">*</span></label></div>
								<div class="span10">
								<select size="1" id="collegeId" name="college.id" class="span5"  aria-controls="dt_gal">
									<option value="">请选择..</option>
									<#if collegeList ??>
								      <#list collegeList as g>
										<#if applyModel ?? && applyModel.college ?? && applyModel.college.id == g.id>
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
						<div class="span12">
							<div class="span1"><label>社团宗旨组织模式经费来源<span class="f_req">*</span></label></div>
							<div class="span8">
								<textarea cols="120" rows="6" name="associationAim" class="span12"><#if applyModel?? >${(applyModel.associationAim!"")?html}</#if></textarea>
		                    	<br><font size="1" color="grey"  style="vertical-align:bottom; padding-bottom:10px">(不超过200字)</font>
		                    </div>
	            		 </div>
            		  </div>
					</div>
			           
			         
		           	 <div class="formSep">
						<div class="row-fluid">
							<div class="span6">
									<div class="span2"><label>缴费金额<span class="f_req">*</span></label></div>
									<div class="span10">
										<input id="associationFee" class="span3" name="associationFee" value="<#if applyModel??>${(applyModel.associationFee!"")?html}<#else>0</#if>"/>
										<font color="grey">(单位:元, 0为不需要缴费)</font>
			                     	</div>
		                     	</div>
		                     	 <div class="span6 ">
									<div class="span2"><label>社团性质<span class="f_req">*</span></label></div>
									<div  class="span10">
										<#if associationKind ??>
											<#list associationKind as c>
											<label class="radio inline">
												<input type="radio" id="isMajor_"  value="${c.id!""}"  name="orignIsMajor.id" <#if applyModel?? && applyModel.orignIsMajor?? && applyModel.orignIsMajor.id == c.id> checked</#if>/>
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
			                  <#-- 
			                   <div class="span6 ">
									<div class="span2"><label>社团性质<span class="f_req">*</span></label></div>
									<div  class="span10">
										<#if associationKind ??>
											<#list associationKind as c>
											<label class="radio inline">
												<input type="radio" id="isMajor_"  value="${c.id!""}"  name="orignIsMajor.id" <#if applyModel?? && applyModel.orignIsMajor?? && applyModel.orignIsMajor.id == c.id> checked</#if>/>
												${c.name!""}
											</label>
											</#list>
										</#if>
									</div>
			                    </div>-->
								<div class="span6">
									<div class="span2"><label>开放范围<span class="f_req">*</span></label></div>
									<div class="span10">
									<#if openScope ??>
										<#list openScope as c>
										<label class="radio inline"  style="padding-bottom:10px;">
											<input type="radio" id="openScopId"  value="${c.id!""}" onclick="openScope('${c.code!""}')"  name="openScope.id" <#if applyModel?? && applyModel.openScope?? && applyModel.openScope.id == c.id> checked</#if>/>
											${c.name!""}
										</label>
										</#list>
									</#if>
										<a id="majorSelectButton"  style="margin-left: -4px;margin-top:-10px;<#if !applyModel?? || !applyModel.openScope ?? || applyModel.openScope.id == allScope.id  >display:none</#if>" href="javascript:void(0);" onclick="selectMajorCheck();" class="btn"><i class="icon-search"></i></a>
									</div>
		                   		</div>
		            		</div>
						</div>
		            	
						<div class="formSep" id="selectedMajors" <#if !applyModel?? || !applyModel.openScope ?? || applyModel.openScope.id == allScope.id  >style="display:none"</#if>>
							<div class="row-fluid">
								<div class="span12">
									<div class="span1"><label>所选专业<span class="f_req">*</span></label></div>
									<div class="span8">
						            	<input type="hidden" id="majorIds" name="majorId" value="${applyModel.majorId!""}">
										<textarea cols="80" rows="5" id="majorNames" name="majorName" class="span12" readonly>${applyModel.majorName!""}</textarea>
				                    </div>
				            	</div>
			            	 </div>
						</div>	
		            	
			            <div class="formSep">
							<div class="row-fluid">
								<div class="span6">
									<div class="span2"><label>指导人<span class="f_req">*</span></label></div>
									<div class="span10">
										<input type="hidden" id="advisorIds" name="orignAdvisorId" value="${applyModel.orignAdvisorId!""}">
							            <input id="advisorNames" name="orignAdvisorName" class="span6" type="text" value="${applyModel.orignAdvisorName!""}" readonly="true"/>
										<a id="course-lecture-select"  style="margin-left: -4px;;margin-top:-10px" href="javascript:void(0);" onclick="selectAdvisor()" class="btn"><i class="icon-search"></i></a>
				                    	<font color="grey">(指导老师为1~2人)</font>
				                    </div>
	                            </div>
                            </div>
						</div>
						
						<div class="formSep">
							<div class="row-fluid">
								<div class="span12">
									<div class="span1"><label>成员<span class="f_req">*</span></label></div>
									<div class="span8">
										<input type="button" class="btn btn-info" onclick="selectManager()" value="选择成员"/>
				                    </div>
			                    	<input type="hidden" id="memberIds" name="memberId" value= "${applyModel.memberId!""}">
				                    <div class="span8" id="member_div" style="margin-top:10px;">
			                    	<#if studentList??>
				                    	<#include "/association/memberSelectedList.ftl"/>
			                    	</#if>
				                    </div>
				            	</div>
			            	</div>
			            </div>
					</form>
					
					 <div class="formSep">
							<div class="row-fluid">
						   		<div class="span12">
									<div class="span1"><label>附件<span class="f_req">*</span></label></div>
									<div class="span8" id="_upload_div">
										<form  id="fileUploadForm"  action="" method="post"  enctype="multipart/form-data">
											<#if user_key.optMap??><#if user_key.optMap['save']??>
											 <div data-fileupload="file" class="fileupload fileupload-new">
													<span class="btn btn-file"><span class="fileupload-new">选择文件</span><input id="file" type="file" name="file" onchange="uploadfile(this,'applyFileId')"></span>
											 </div>
											 <div class="upload-alert-message" style="word-break:break-all;">
							        		        文件只支持：jpg,jpeg,png,gif,txt,ppt,rar,zip,doc,docx,xls,xlsx,ppt,pptx,wps,et,dps且大小不超过10MB。
							        		 </div>
											</#if></#if>
											 <#if fileList??>	
												<#list fileList as p>
													<div class="fileupload-info">
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
					<br/>
					<div class="row-fluid">
				   		<div class="span12">
							<div class="span1">&nbsp;</div>
							<div class="span8">
			                    <input class="btn btn-info"  type="button" onclick="onSubmit('10')" value="保 存"/>
					            <input class="btn btn-info"  type="button" onclick="onSubmit('20')" value="提 交"/>
					            <input class="btn" type="button" onclick="onCancel()" value="取 消"/>
				       		</div>	
       		 			</div>
					</div>
			    </div>
	    </div>
    </div>
</div>

<#include "/comp/teacher/queryTeacherCheckBoxModal.ftl">
<#include "/comp/student/queryStudentAllCheckBoxModal.ftl"> 
<#include "/comp/major/queryMajorAllCheckBoxModal.ftl"> 
<script>

// 多选教职工
function selectAdvisor()
{
	var selectedTeacherIds = $("#advisorIds").val();
	_queryTeacherCheckAll(selectedTeacherIds);
}

//初始化教职工信息
function setTeacherSelectValue(teacherIds,names)
{
	var teacherArray = teacherIds.split(",");
	if(teacherArray.length>2){
		comp.message("指导老师为1~2人","error");
	}else{
		$("#advisorIds").val(teacherIds+",");
		$("#advisorNames").val(names);
	}
}

// 多选学生
function selectManager()
{
	var memberIds = $("#memberIds").val();
	_queryStudentCheckAll(memberIds,"");
}

//初始化学生信息
function setMultiEduClassSelectValue(managerIds,names)
{
	$("#memberIds").val(managerIds+",");
	var param = {managerIds:managerIds};
	$("#member_div").load("${rc.contextPath}/association/apply/nsm/registerManagerList.do",param,function(){});
}


 //返回到查询信息页面
function onCancel(){
	window.location.href="${rc.contextPath}/association/apply/opt-query/getAssociationApplyList.do";
}
 
 
 //开放范围赋值
function openScope(code){
	if(code=='MAJOR'){//专业
		$("#selectedMajors").show();
		$("#majorSelectButton").show();
	}else{
		$("#selectedMajors").hide();
		$("#majorSelectButton").hide();
		$("#majorIds").val("");
		$("#majorNames").val("");
	}
}

function selectMajorCheck()
{   
	var collegeId = $("#collegeId").val();
	var majorIds = $("#majorIds").val();
	_queryMajorCheckAll(majorIds,collegeId);
}
function setMajorSelectValue(majorIds,majorName){
	$("#majorIds").val(majorIds);
	$("#majorNames").val(majorName);
}
 
</script>
</body>
</html>