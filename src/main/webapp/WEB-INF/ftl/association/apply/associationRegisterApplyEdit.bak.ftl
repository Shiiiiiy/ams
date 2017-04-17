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
	
	//验证是否输入正确的社团费用
	jQuery.validator.addMethod("feeCheck",function(value,element){
	   var isPay = $("input[name='isPay_']:checked").val();
	   if((isPay=="4028900f40cd477c0140cd4afd8d0001")){
	     var fee =/^[1-9]\d*$/;//正整数
	     return fee.exec(value);
	   }else{
	     return true;
	   }
	},"社团费用为正整数");	
	
	//验证社团成员人数
	jQuery.validator.addMethod("memberCheck",function(value,element){
	   if(comp.isNotNull(value)){
	     return (value>=3)
	   }else{
	      return true;
	   }
	},"社团注册人数至少【3人】");	
	
	//重复性验证【社团编号】
	var data={associationId:function(){return $("#associationId").val();},associationCode:function(){return $("#associationCode").val();}};
	comp.validate.addRemote("isRepeatCode","${rc.contextPath}/association/apply/opt-query/isAssociationCodeRepeat.do",data,"编号已存在，请修改 !");
	
	//重复性验证【社团名称】
	var data={associationId:function(){return $("#associationId").val();},associationName:function(){return $("#associationName").val();}};
	comp.validate.addRemote("isRepeatName","${rc.contextPath}/association/apply/opt-query/isAssociationNameRepeat.do",data,"名称已存在，请修改 !");
	
	$("document").ready(function(){
	    formValidator = $("#registerApplyEditForm").compValidate({
			rules:{
							'associationPo.associationCode': {uwsnumcharonly:true,<#if !(isCurAdvisor?? && isCurAdvisor=="true")>isRepeatCode:true,</#if>maxlength:200},
							'associationPo.associationName': {required:true,uwsnumcharcnspace:true,<#if !(isCurAdvisor?? && isCurAdvisor=="true")>isRepeatName:true,</#if>maxlength:200},
							'associationPo.applyTime': {required:true},
							'associationType_': {required:true},
							'college_': {required:true},
							'associationPo.memberNums': {isNumber:true,memberCheck:true},
							'associationPo.associationAim': {required:true,maxlength:200},
							'isPay_': {required:true},
							'isMajor_': {required:true},
							'associationPo.associationFee': {feeCheck:true}
			},
			messages:{
							'associationPo.associationCode': {maxlength:"最大可输入200字"},
							'associationPo.associationName': {required:'社团名称不可为空 !',maxlength:"最大可输入200字"},
							'associationPo.applyTime': {required:'申请时间不可为空 !'},
							'associationType_': {required:'社团类型不可为空 !'},
							'college_': {required:'所属学院不可为空 !'},
							//'associationPo.memberNums': {required:'社团人数不可为空 !'},
							'associationPo.associationAim': {required:'社团宗旨不可为空 !',maxlength:"最大可输入200字"},
							'isPay_': {required:'请指定是否缴费 !'},
							'isMajor_': {required:'请指定社团性质 !'}
			}
		 });
		 
		 if($("#isCurManager").val()=="true"){//负责人编辑申请时，用户注册申请保存前的【指导老师】【负责人】临时列表加载
		 	if($("#hiddenTeacherIds").val()){
	 			var teacherparam = {associationId:$("#associationId").val(),teacherIds:$("#hiddenTeacherIds").val(),applyTypeCode:$('#applyTypeCode').val()};
				$("#teacherInfoPage").load("${rc.contextPath}/association/apply/nsm/asynPackageAdvisorList.do",teacherparam,function(){});
		 	}
			
			if($("#hiddenManagerIds").val()){
				var stuparam = {associationId:$("#associationId").val(),
												  managerIds:$("#hiddenManagerIds").val(),
												  applyTypeCode:$("#applyTypeCode").val(),
												  proprieterId:$("#proprieterId").val()};
				//$("#managerInfoPage").load("${rc.contextPath}/association/apply/nsm/asynPackageManagerList.do",stuparam,function(){});
			}
		 }
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
		      		<h3 class="heading">
		      			<#if aam.id??>
						注册社团申请修改
						<#else>
						注册社团申请
						</#if>
						
			   		</h3>
			  	</div>
			 </div> 	
    		<form  id="registerApplyEditForm" class="form_validation_reg" method="post">
					<div id="hiddenDiv">
						<!-- 社团申请信息 -->
						<input type="hidden" id="applyId" name="id" value="${(applyId!"")?html}"/>
						<input type="hidden" id="applyTypeId" name="applyTypeDic.id" value="${(applyTypeId!"")?html}"/>
						<input type="hidden" id="applyTypeCode" name="applyTypeDic.code" value="${(applyTypeCode!"")?html}"/>
						<input type="hidden" id="curUserId" value="${(curUserId!"")?html}"/>
						<input type="hidden" id="optType" value="${(optType!"")?html}"/>
						<input type="hidden" id="operateStatus" value="${(operateStatus!"")?html}"/>
						<!-- 社团基本信息 -->
						<input type="hidden" id="associationId" name="associationPo.id" value="${(associationId!"")?html}"/>
						<input type="hidden" id="proprieterId" name="associationPo.proprieter.id" value="${(proprieterId!"")?html}"/>
						<input type="hidden" id="curCollegeName"  value="${(curCollegeName!"")?html}"/>
						<input type="hidden" id="curCollegeId" value="${(curCollegeId!"")?html}"/>
						<input type="hidden" id="isCurManager" value="${(isCurManager!"")?html}"/>
						<input type="hidden" id="isCurAdvisor" value="${(isCurAdvisor!"")?html}"/>
						<!-- 原社团信息 begin-->
						<input type="hidden" id="associationRegisterName" name="associationPo.associationRegisterName" 
						<#if aam.associationPo??>value="${(aam.associationPo.associationRegisterName!"")?html}"</#if>/>
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
							<span class="formTitle">社团编号<span class="f_req">&nbsp;</span></span>
						    <div class="span5">
								<input id="associationCode" name="associationPo.associationCode"  readonly
									<#if aam.associationPo?? >value="${(aam.associationPo.associationCode!"")?html}"</#if> maxlength="200"
									<#if user_key.optMap??><#if user_key.optMap['submit']??>readonly</#if></#if>/>
							</div>
							<span class="formTitle">社团名称<span class="f_req">*</span></span>
						    <div class="span5">
								<input id="associationName" name="associationPo.associationName" 
									<#if aam.associationPo?? >value="${(aam.associationPo.associationName!"")?html}"</#if> maxlength="200"
									<#if user_key.optMap??><#if user_key.optMap['submit']??>readonly</#if></#if>/>
							</div>
						</div>
					</div>
	                <div class="formSep">
						<div class="row-fluid">
							<span class="formTitle">申请时间<span class="f_req">*</span></span>
							<div class="span5">
	                            <input id="applyTime" name="associationPo.applyTime" class="Wdate"  style="cursor:pointer" 
	                            	<#if user_key.optMap??><#if user_key.optMap['save']??>onclick="WdatePicker({skin:'whyGreen'});"</#if></#if>
									<#if aam.associationPo?? && aam.associationPo.applyTime??>value="${(aam.associationPo.applyTime!"")?html}"</#if>
									<#if user_key.optMap??><#if user_key.optMap['submit']??>readonly</#if></#if>/>						
							</div>
							<span class="formTitle">社团类型<span class="f_req">*</span></span>
							<div class="span5">
									<input type="hidden" id="associationType_" name="associationPo.associationType.id" 
									<#if aam.associationPo?? && aam.associationPo.associationType??>
										value="${(aam.associationPo.associationType.id!"")?html}"</#if>/>
									<select size="1" id="associationType" name="associationType_" aria-controls="dt_gal" style="cursor:pointer"
									onchange="setAassociationType(this.value)" 
									<#if user_key.optMap??><#if user_key.optMap['submit']??>disabled</#if></#if> >
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
										<select size="1" id="collegeId" name="college_"  aria-controls="dt_gal" onchange="setAssociationCollege(this.value)"
										<#if user_key.optMap??><#if user_key.optMap['submit']??>disabled</#if></#if>>
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
								<span class="formTitle">社团人数<span class="f_req">&nbsp;</span></span>
								<div class="span5">
										<input id="memberNums" name="associationPo.memberNums" readonly
											<#if aam.associationPo?? && aam.associationPo.memberNums gt 0>
											value="${(aam.associationPo.memberNums!"")?html}"</#if>  maxlength="4"
											<#if user_key.optMap??><#if user_key.optMap['submit']??>readonly</#if></#if>/>
				                    </div>
				            </div>
				        </div>
			            <div class="formSep">
							<div class="row-fluid">
								<span class="formTitle">社团宗旨<span class="f_req">*</span><br/>
																				   组织模式<span class="f_req">*</span><br/>
																				   经费来源<span class="f_req">*</span></span>
								<div class="span11">
									<textarea cols="80" rows="6" name="associationPo.associationAim" class="span9" style="width: 802px; height: 136px;"
									<#if user_key.optMap??><#if user_key.optMap['submit']??>readonly</#if></#if>><#if aam.associationPo?? >${(aam.associationPo.associationAim!"")?html}</#if></textarea>
			                    	<br><font size="1" color="grey"  style="vertical-align:bottom; padding-bottom:10px">(不超过200字)</font>
			                    </div>
			            	 </div>
						</div>
			            <div class="formSep">
							<div class="row-fluid">
								<span class="formTitle">是否缴费<span class="f_req">*</span></span>
								<div class="span5">
										<label class="radio inline">
										<input type="hidden" id="isPay_" name="associationPo.isPay.id" 
										<#if aam.associationPo?? && aam.associationPo.isPay??>value="${(aam.associationPo.isPay.id!"")?html}"</#if>/>
										<input type="radio" name="isPay_" value="4028900f40cd477c0140cd4afd8d0001" onclick="feeSetKey(this.value)" 
										<#if aam.associationPo ?? && aam.associationPo.isPay ?? && aam.associationPo.isPay.code=='Y'>checked</#if>
										<#if user_key.optMap??><#if user_key.optMap['submit']??>disabled</#if></#if>/>是
										</label>
										<label class="radio inline">
										<input type="radio" name="isPay_" value="4028900f40cd477c0140cd4b62ae0002" onclick="feeSetKey(this.value)" 
										<#if aam.associationPo ?? && aam.associationPo.isPay ?? && aam.associationPo.isPay.code=='N'>checked</#if>
										<#if user_key.optMap??><#if user_key.optMap['submit']??>disabled</#if></#if>/>否
										</label>
			                    </div>
								<span class="formTitle">社团性质<span class="f_req">*</span></span>
								<div class="span5">
										<input type="hidden" id="isMajor_" name="associationPo.isMajor.id" 
										<#if aam.associationPo?? && aam.associationPo.isMajor??>value="${(aam.associationPo.isMajor.id!"")?html}"</#if>/>
										<label class="radio inline">
										<input type="radio" name="isMajor_" value="4028900f40cd477c0140cd4afd8d0001" onclick="setIsMajor(this.value)" 
										<#if aam.associationPo ?? && aam.associationPo.isMajor ?? && aam.associationPo.isMajor.code=='Y'>checked</#if>
										<#if user_key.optMap??><#if user_key.optMap['submit']??>disabled</#if></#if>/>专业
										</label>
										<label class="radio inline">
										<input type="radio" name="isMajor_" value="4028900f40cd477c0140cd4b62ae0002" onclick="setIsMajor(this.value)" 
										<#if aam.associationPo ?? && aam.associationPo.isMajor ?? && aam.associationPo.isMajor.code=='N'>checked</#if>
										<#if user_key.optMap??><#if user_key.optMap['submit']??>disabled</#if></#if>/>非专业
										</label>
			                    </div>
			            	</div>
						</div>
			            <div class="formSep">
							<div class="row-fluid">
								<span class="formTitle">缴费金额<span class="f_req"></span></span>
								<div class="span5">
									<input id="associationFee" name="associationPo.associationFee" 
										<#if aam.associationPo?? && aam.associationPo.isPay?? && aam.associationPo.isPay.code=='Y'>
										value="<#if aam.associationPo??>${(aam.associationPo.associationFee!"")?html}</#if>"
										<#else>value="0"</#if> maxlength="4" 
										<#if (aam.associationPo?? && aam.associationPo.isPay?? && aam.associationPo.isPay.code=='N')>readonly</#if>
										<#if (optType?? && optType=='ADD')>readonly</#if>
										<#if user_key.optMap??><#if user_key.optMap['submit']??>readonly</#if></#if>/>(元)
			                    </div>
			            	</div>
							<div class="span6">
								<input type="hidden" name="associationPo.isCancel.id" 
								<#if aam.associationPo?? && aam.associationPo.isCancel??>value="${(aam.associationPo.isCancel.id!"")?html}"</#if>/>
                            </div>
						</div>
					</form>
			            <div class="formSep">
							<div class="row-fluid">
								<span class="formTitle">指导老师<span class="f_req">*</span></span>
								<div class="span5">
						            <#if (isCurManager?? && isCurManager=='true') || optType=='ADD'||
						            		 (user_key.optMap?? &&(user_key.optMap['apply']?? || user_key.optMap['add']??))>
									<input type="button" class="btn btn-info" onclick="selectAdvisor()" value="选择指导老师"/>
						            </#if>
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
								<div class="span5">
						            <#if (isCurManager?? && isCurManager=='true'  || optType=='ADD') ||
						            		 (user_key.optMap?? &&(user_key.optMap['apply']?? || user_key.optMap['add']??))>
									<input type="button" class="btn btn-info" onclick="selectManager()" value="选择负责人"/>
						            </#if>
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
								<span class="formTitle">是否开放<span class="f_req">*</span></span>
								<div class="span5">
										<label class="radio inline">
										<input type="hidden" id="isOpen_" name="associationPo.isPay.id" 
										<#if aam.associationPo?? && aam.associationPo.isPay??>value="${(aam.associationPo.isPay.id!"")?html}"</#if>/>
										<input type="radio" name="isOpen_" value="4028900f40cd477c0140cd4afd8d0001" onclick="openSetKey(this.value)" 
										<#if aam.associationPo ?? && aam.associationPo.isPay ?? && aam.associationPo.isPay.code=='Y'>checked</#if>
										<#if user_key.optMap??><#if user_key.optMap['submit']??>disabled</#if></#if>/>是
										</label>
										<label class="radio inline">
										<input type="radio" name="isOpen_" value="4028900f40cd477c0140cd4b62ae0002" onclick="openSetKey(this.value)" 
										<#if aam.associationPo ?? && aam.associationPo.isPay ?? && aam.associationPo.isPay.code=='N'>checked</#if>
										<#if user_key.optMap??><#if user_key.optMap['submit']??>disabled</#if></#if>/>否
										</label>
			                    </div>
								<span class="formTitle">开放范围<span class="f_req">*</span></span>
								<div class="span5">
										<input type="hidden" id="openFull" name="associationPo.isMajor.id" 
										<#if aam.associationPo?? && aam.associationPo.isMajor??>value="${(aam.associationPo.isMajor.id!"")?html}"</#if>/>
										<label class="radio inline">
										<input type="radio" id="openToStudent" name="openFull_" value="4028900f40cd477c0140cd4afd8d0001" onclick="setIsMajor(this.value)" 
										<#if aam.associationPo ?? && aam.associationPo.isMajor ?? && aam.associationPo.isMajor.code=='Y'>checked</#if>
										<#if user_key.optMap??><#if user_key.optMap['submit']??>disabled</#if></#if>/>全校学生
										</label>
										<label class="radio inline">
										<input type="radio" id="openToMajor" name="openFull_" value="4028900f40cd477c0140cd4b62ae0002" onclick="setIsMajor(this.value)" 
										<#if aam.associationPo ?? && aam.associationPo.isMajor ?? && aam.associationPo.isMajor.code=='N'>checked</#if>
										<#if user_key.optMap??><#if user_key.optMap['submit']??>disabled</#if></#if>/>专业
										</label>
			                    </div>
			            	</div>
						</div>
			            
			            
			            <div class="formSep">
							<div class="row-fluid">
								<span class="formTitle">注册材料<span class="f_req">*</span></span>
						   		<div class="span11">
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
//设置社团费用
function feeSetKey(key){
	if("4028900f40cd477c0140cd4afd8d0001"==key){//是
		$("#associationFee").removeAttr("readonly");
		<#if aam?? && aam.associationPo??>
		$("#associationFee").val('${aam.associationPo.associationFee}');
		</#if>
	}else if("4028900f40cd477c0140cd4b62ae0002"==key){//否
		$("#associationFee").attr("readonly","readonly");
		$("#associationFee").val(0);
	}
	$("#isPay_").val(key);
}


//判断是否对外开放
function openSetKey(key){
	if("4028900f40cd477c0140cd4afd8d0001"==key){//是
		$("#openToStudent").removeAttr("disabled");
		$("#openToMajor").removeAttr("disabled");
	}else if("4028900f40cd477c0140cd4b62ae0002"==key){//否
		$("#openToStudent").attr("disabled","disabled");
		$("#openToMajor").attr("disabled","disabled");
	}
	//$("#isPay_").val(key);
}


//设置社团性质
function setIsMajor(value){
	$("#isMajor_").val(value);
}

//设置社团类型
function setAassociationType(value){
	$("#associationType_").val(value);
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
    var num=0;
    $(".leaguePosition").each(function (){//判断社长是否只有一个
    	if($(this).val() == "2c9d508150a778080150a77c5a680002"){
	    	$("#proprieterId").val($(this).attr("id"));
			$("#proprieterRegister").val($(this).attr("id"));
    		num=num+1;
    	}
	});
	if(num>1){
		comp.message("只能设置一个社长 !","info");
		return;
	}
    
	if(isCurManager=="true" || (applyTypeCode=="REGISTER" && optType=="ADD")){
		managerDoSave();
	}
	if(isCurAdvisor=="true"){
		advisorDoSave();
	}
 }
 
 /**
   * 执行负责人保存操作
   */
 function managerDoSave(){
   if(formValidator.form()==true){
	   	if(!$("#hiddenTeacherIds").val()){
	   		comp.message("请选择指导老师");
	   	}else if(!$("#hiddenManagerIds").val()){
	   		comp.message("请选择负责人");
	   	}else if(!managerValidator()){
	 		comp.message("请设置团负责人【社长】");
	 	}else if(!uploadFileValidator()){
	 		comp.message("社团注册材料不可为空，请上传附件 !","error");
	 	}else{
	        mask.showShade();
			copyFileIdInput();
			copyRegisterItem();
			var hiddenTeacherIds = $('#hiddenTeacherIds').val();
			var hiddenManagerIds = $('#hiddenManagerIds').val();
			$("#registerApplyEditForm").append($("#managerInfoPage"));
	        $('#registerApplyEditForm').attr("action","${rc.contextPath}/association/apply/opt-edit/managerSaveApply.do"+
	        "?applyType="+$("#applyTypeCode").val()+
	        "&hiddenTeacherIds="+hiddenTeacherIds+
	        "&hiddenManagerIds="+hiddenManagerIds+
	        "&proprieterId="+$("#proprieterId").val()).submit();
	 	}
 	}
 }
 
 function copyRegisterItem(){
 	$("#associationRegisterName").val($("#associationName").val());
 	$("#associationRegisterType").val($("#associationType_").val());
 	$("#proprieterRegister").val($("#proprieterId").val());
 	$("#isMajorRegister").val($("#isPay_").val());
 }
 
 /**
   * 执行指导老师保存操作
   */
 function advisorDoSave(){
    if(advisorCommentValidator('SAVE') && formValidator.form()==true){
		copyFileIdInput();
        $('#registerApplyEditForm').attr("action","${rc.contextPath}/association/apply/opt-edit/advisorSaveApply.do?applyType="+$("#applyTypeCode").val()).submit();
 	}
 }

//提交社团申请 
 function onSubmit(){
	    var isCurManager = $("#isCurManager").val();
	    var isCurAdvisor = $("#isCurAdvisor").val();
        var applyTypeCode = $("#applyTypeCode").val();
        var optType = $("#optType").val();
        var num=0;
	    $(".leaguePosition").each(function (){//判断社长是否只有一个
	    	if($(this).val() == "2c9d508150a778080150a77c5a680002"){
		    	$("#proprieterId").val($(this).attr("id"));
				$("#proprieterRegister").val($(this).attr("id"));
	    		num=num+1;
	    	}
		});
		if(num>1){
			comp.message("只能设置一个社长 !","info");
			return;
		}
        
		if(isCurManager=="true" || (applyTypeCode=="REGISTER" && optType=="ADD")){
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
		   	}else if(!$("#hiddenManagerIds").val()){
		   		comp.message("请选择负责人");
		   	}else if(!managerValidator()){
		 		comp.message("请设置团负责人【社长】");
		 	}else if(!uploadFileValidator()){
		 		comp.message("社团注册材料不可为空，请上传附件 !","error");
		 	}else{
		        mask.showShade();
				copyFileIdInput();
				copyRegisterItem();
				var hiddenTeacherIds = $('#hiddenTeacherIds').val();
				var hiddenManagerIds = $('#hiddenManagerIds').val();
				$("#registerApplyEditForm").append($("#managerInfoPage"));
		        $('#registerApplyEditForm').attr("action","${rc.contextPath}/association/apply/opt-edit/managerSubmitApply.do"+
		        "?applyType="+$("#applyTypeCode").val()+
		        "&hiddenTeacherIds="+hiddenTeacherIds+
		        "&hiddenManagerIds="+hiddenManagerIds+
		        "&proprieterId="+$("#proprieterId").val()).submit(); 
	 		}
    	}
	   	
 	}
 }
 
 /**
   * 执行指导老师提交操作
   */
 function advisorDoSubmit(){
    if(advisorCommentValidator('SUBMIT') && formValidator.form()==true){
    	if(confirm("提交后不可修改，确认提交?")){
        	apw.selectNextApprover($("#applyId").val(),"INIT","ASSOCIATION_APPLY_APPROVE",null);
 		}
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
					data:$('#registerApplyEditForm').serialize(),
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
	 
	 //验证社团负责人是否设置
	function managerValidator(){
		return comp.isNotNull($("#proprieterId").val());
	}
	  
	//本学院指导老师校验
	function advisorValidator(){
		var returnFlag=true;
		var curCollegeName = $("#curCollegeName").val();
		if(comp.isNotNull(curCollegeName)){
			$.ajax({
				url:"${rc.contextPath}/association/apply/opt-query/checkAdvisor.do",
				async:false,
				cache:false,
				type:"POST",
				data:{associationId:$("#associationId").val(),teacherIds:$("#hiddenTeacherIds").val()},
				success:function(msg){
					var json = jQuery.parseJSON(msg);
					var errorTeachers = json.errorTeachers;
					if(!comp.isNull(errorTeachers)){
						var trIds = errorTeachers.split("|");
				        $.each(trIds,function(index,value){
				        	$("#"+value).css('fontWeight','bold');
				        	$("#"+value).css('color','red');
				        });
						returnFlag=false;
					}
				}
			});
		}
		
		var hiddenTeacherIds=$("#hiddenTeacherIds").val()
		if(comp.isNull(hiddenTeacherIds)){
			returnFlag=false;
		}
		
		return returnFlag;
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
		var selectedTeacherIds = $("#hiddenTeacherIds").val();
		_queryTeacherCheckAll(selectedTeacherIds);
	}
	
	//初始化教职工信息
	function setTeacherSelectValue(teacherIds,names)
	{
		var teacherArray = teacherIds.split(",");
		if(teacherArray.length>2){
			comp.message("指导老师为1~2人");
		}else{
			$("#hiddenTeacherIds").val(teacherIds);
			var param = {associationId:$("#associationId").val(),teacherIds:teacherIds,applyTypeCode:$('#applyTypeCode').val()};
			$("#teacherInfoPage").load("${rc.contextPath}/association/apply/nsm/asynPackageAdvisorList.do",param,function(){});
		    var param={associationId:$("#associationId").val()};
			$("#advisorInfoDiv").load("${rc.contextPath}/association/apply/nsm/advisorAsynLoadAdvisorInfo.do",param,function(){});
		}
	}
	
	//编辑指导老师简介
	function _editAdvisorInfo(associationId,teacherId){
 		comp.showModal("_advisorInfoModal","700px","-300px 0 0 -320px");
 		$("#stmp_advisorInfo").load("${rc.contextPath}/association/apply/nsm/editAdvisorInfo.do",{associationId:associationId,teacherId:teacherId});
	}
	
	//初始化指导老师简介
	function _advisorSave(){
	    var commonts = $("#advisorComments").val();
		if(commonts.length<=500){
		  var reg =/^[\u0391-\uFFE50-9a-zA-Z_ ，]*$/;//字母、数字、下划线
		  if(reg.exec(commonts)){
				$.ajax({
					url:"${rc.contextPath}/association/apply/opt-edit/saveAdvisorInfo.do",
					async:false,
					cache:false,
					type:"POST",
					data:{id:$("#aamId").val(),comments:$("#advisorComments").val()},
					success:function(msg){
						if('success'== msg){
						     var param={associationId:$("#associationId").val()};
							$("#advisorInfoDiv").load("${rc.contextPath}/association/apply/nsm/advisorAsynLoadAdvisorInfo.do",param,function(){});
						}
					}
				});
				$('#_advisorInfoModal').modal('hide');
		  }else{
		  	comp.message("简介只能包括中文字、英文字母、数字和下划线");
		  }
		}else{
			comp.message("指导老师简介不可超过500字");
		}
	}
	
	//本学院学生校验
	function stuValidator(){
		var returnFlag=true;
		var curCollegeName = $("#curCollegeName").val();
		if(comp.isNotNull(curCollegeName)){
			$.ajax({
				url:"${rc.contextPath}/association/apply/opt-query/checkCurCollegeStudent.do",
				async:false,
				cache:false,
				type:"POST",
				data:{associationId:$("#associationId").val(),stuIds:$("#hiddenManagerIds").val()},
				success:function(msg){
					var json = jQuery.parseJSON(msg);
					var errorStudents = json.errorStudents;
					if(!comp.isNull(errorStudents)){
						var trIds = errorStudents.split("|");
				        $.each(trIds,function(index,value){
				        	$("#"+value).css('fontWeight','bold');
				        	$("#"+value).css('color','red');
				        });
						returnFlag=false;
					}
				}
			});
		}
		
		var hiddenManagerIds=$("#hiddenManagerIds").val()
		if(comp.isNull(hiddenManagerIds)){
			returnFlag=false;
		}
		
		return returnFlag;
	}
    
	// 多选学生
	function selectManager()
	{
		var managerIds = $("#managerIds").val();
		selectedManagerIds = setAssocaiationManager(selectedManagerIds);
		_queryStudentCheckAll(selectedManagerIds,"");
	}
	
	//封装选择的社团负责人
	function setAssocaiationManager(managerIds){
		var proprieterId = $("#proprieterId").val();
		if(comp.isNull(managerIds)){
			managerIds = proprieterId;
		}else if(managerIds.indexOf(proprieterId)==-1){
			managerIds+=(","+proprieterId);
		}
		
		return managerIds;
	}
	
	//初始化学生信息
	function setMultiEduClassSelectValue(managerIds,names)
	{
		managerIds = setAssocaiationManager(managerIds);
		var managerArray = managerIds.split(",");
		if(managerArray.length<3){
			comp.message("社团注册至少3位负责人(含当前用户) !");
		}else{
			$("#hiddenManagerIds").val(managerIds);
			$("#memberNums").val(managerArray.length);
			var param = {associationId:$("#associationId").val(),
										managerIds:managerIds,
										applyTypeCode:$("#applyTypeCode").val(),
										proprieterId:$("#proprieterId").val()};
			$("#managerInfoPage").load("${rc.contextPath}/association/apply/nsm/asynPackageManagerList.do",param,function(){});
		}
	}
	
	//设置社团成员职务
	function setMemberPosition(associationId,memberId,memberPoId,dicId){
		
	 	var num=0;
	    $(".leaguePosition").each(function (){//判断社长是否只有一个
	    	if($(this).val() == "2c9d508150a778080150a77c5a680002"){
	    		num=num+1;
	    	}
		});
		if(num>1){
			comp.message("只能设置一个社长 !","info");
			return;
		}
		//$.ajax({
		//	url:"${rc.contextPath}/association/apply/opt-modify/setMemberPosition.do",
		//	async:false,
		//	cache:false,
		//	type:"POST",
		//	data:{associationId:associationId,memberPoId:memberPoId,associationPosition:dicId},
		//	success:function(msg){
		//		var json = jQuery.parseJSON(msg); 
		//		var param = {objectId:$("#associationId").val(),managerIds:$("#hiddenManagerIds").val(),applyTypeCode:$("#applyTypeCode").val()};
		//		if('success'== json.flag){
					//$("#proprieterId").val(memberId);
					//$("#proprieterRegister").val(memberId);
					//var param = {	associationId:$("#associationId").val(),
					//						   	managerIds:$("#hiddenManagerIds").val(),
					//						   	applyTypeCode:$("#applyTypeCode").val(),
					//						   	proprieterId:memberId,
					//						   	dicId:dicId
					//						   };
					//$("#managerInfoPage").load("${rc.contextPath}/association/apply/nsm/asynPackageManagerList.do",param,function(){});
		//		}else if("onlyone"==json.flag){
		//			comp.message("只能设置一个社长 !","info");
		//			//$("#managerInfoPage").load("${rc.contextPath}/association/apply/nsm/asynLoadManagerList.do",param,function(){});
		//		}else if('error'== json.flag){
		//			comp.message("社团职务设置报错，请联系管理员 !","error");
		//		}
		//	}
		//});
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
											    operateStatus:$("#operateStatus").val()};
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