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
	//验证是否输入正确的星级评价
	jQuery.validator.addMethod("starApproveCheck",function(value,element){
	     var fee =/^(\d+\.\d{1,1}|\d+)$/;
         return fee.exec(value);
	},"请填正确的星级评价,只能填写数字.");	
	
	$("document").ready(function(){
	    formValidator = $("#associationEditForm").compValidate({
			rules:{
							'honorRating': {required:true,starApproveCheck:true}
			},
			messages:{
							'honorRating': {required:'请设置星级评价 !'},
			}
		 });
 	});
	 
	</script>
</head>
<body>
<div id="contentwrapper">
    <div class="main_content">
        <div class="row-fluid">
        	<div class="row-fluid">
		   		<div class="span12">
		      		<h3 class="heading">
						社团编辑
			   		</h3>
			  	</div>
			 </div> 
    		<form  id="associationEditForm" class="form_validation_reg" method="post">
					<div id="hiddenDiv">
						<input type="hidden" id="associationId" name="associationId" value="${(abm.id!"")?html}"/>
						<input type="hidden" id="isCurManager" value="${(isCurManager!"")?html}"/>
						<input type="hidden" id="curUserId" value="${(curUserId!"")?html}"/>
					</div>
					<div class="formSep">
						<div class="row-fluid">
							<span class="formTitle">社团编号<span class="f_req">*</span></span>
						    <div class="span5">
								<input id="associationCode" name="associationCode" value="${(abm.associationCode!"")?html}" maxlength="200" readonly/>
							</div>
							<span class="formTitle">社团名称<span class="f_req">*</span></span>
						    <div class="span5">
								<input id="associationRegisterName" name="associationRegisterName" value="${(abm.associationRegisterName!"")?html}" maxlength="200" readonly/>
							</div>
						</div>
					</div>
	                <div class="formSep">
						<div class="row-fluid">
							<span class="formTitle">申请时间<span class="f_req">*</span></span>
							<div class="span5">
	                            <input id="applyTime" name="applyTime" class="Wdate"  style="cursor:pointer"  
	                            	value="${(abm.applyTime!"")?html}" readonly/>						
							</div>
							<span class="formTitle">社团类型<span class="f_req">*</span></span>
							<div class="span5">
									<input type="hidden" name="associationRegisterType.id" value="${(curCollegeId!"")?html}"/>
									<select size="1" id="associationRegisterType" name="associationRegisterType" aria-controls="dt_gal" style="cursor:pointer" disabled>
										<option value="">请选择..</option>
										<#if associationTypeDicList ??>
									      <#list associationTypeDicList as g>
											<#if abm.associationRegisterType ?? && abm.associationRegisterType.id == g.id>
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
									<input type="hidden" id="associationCollegeId" name="college.id" 
										value="<#if abm.college??>${(abm.college.id!"")?html}</#if>"/>
										<select size="1" id="collegeId"  aria-controls="dt_gal" disabled="disabled">
										<option value="">请选择..</option>
										<#if collegeList ??>
									      <#list collegeList as g>
											<#if abm.college ?? && abm.college.id == g.id>
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
										<input id="memberNums" name="memberNums" value="${(abm.memberNums!"")?html}" readonly/>
				                    </div>
				            </div>
				        </div>
			            <div class="formSep">
							<div class="row-fluid">
								<span class="formTitle">社团宗旨<span class="f_req">*</span><br/>
																				   组织模式<span class="f_req">*</span><br/>
																				   经费来源<span class="f_req">*</span></span>
								<div class="span11">
									<textarea cols="80" rows="6" name="associationAim" maxlength="200" class="span9"  style="width: 802px; height: 136px;"
										readonly>${(abm.associationAim!"")?html}</textarea>
			                    	<br><font size="1" color="grey"  style="vertical-align:bottom; padding-bottom:10px">(不超过200字)</font>
			                    </div>
			            	 </div>
						</div>
			            <div class="formSep">
							<div class="row-fluid">
								<span class="formTitle">是否缴费<span class="f_req">*</span></span>
								<div class="span5">
										<input type="hidden" id="isPay_" name="isPay.id" <#if abm.isPay??>value="${(abm.isPay.id!"")?html}"</#if>/>
										<label class="radio inline">
										<input type="radio" name="isPay_" value="4028900f40cd477c0140cd4afd8d0001" onclick="feeSetKey(this.value)" 
										<#if abm.isPay ?? && abm.isPay.code=='Y'>checked</#if> disabled/>是
										</label>
										
										<label class="radio inline">
										<input type="radio" name="isPay_" value="4028900f40cd477c0140cd4b62ae0002" onclick="feeSetKey(this.value)"
										<#if abm.isPay ?? && abm.isPay.code=='N'>checked</#if> disabled/>否
										</label>
			                    </div>
								<span class="formTitle">社团性质<span class="f_req">*</span></span>
								<div class="span5">
									<input type="hidden" id="isMajor_" name="isMajorRegister.id" <#if abm.isMajorRegister??>value="${(abm.isMajorRegister.id!"")?html}"</#if>/>
										<label class="radio inline">
										<input type="radio" name="isMajor_" value="4028900f40cd477c0140cd4afd8d0001" 
										<#if abm.isMajorRegister ?? && abm.isMajorRegister.code=='Y'>checked</#if>  disabled/>专业
										</label>
										
										<label class="radio inline">
										<input type="radio" name="isMajor_" value="4028900f40cd477c0140cd4b62ae0002" 
										<#if abm.isMajorRegister ?? && abm.isMajorRegister.code=='N'>checked</#if> disabled/>非专业
										</label>
			                    </div>
			            	</div>
						</div>
			            <div class="formSep">
							<div class="row-fluid">
								<span class="formTitle">缴费金额<span class="f_req"></span></span>
								<div class="span5">
									<input id="associationFee" name="associationFee" value="${(abm.associationFee!"")?html}" maxlength="10" readonly/>(元)
			                    </div>
			            	</div>
						</div>
		                 <#if user_key.optMap??>
		                 	<#if user_key.optMap['topTen']?? && user_key.optMap['starApprove']??>
				            <div class="formSep">
								<div class="row-fluid">
									<span class="formTitle">是否十佳<span class="f_req">*</span></span>
									<div class="span5">
											<input type="radio" name="isTopten.id" value="4028900f40cd477c0140cd4afd8d0001"  
											<#if abm.isTopten ?? && abm.isTopten.code=='Y'>checked</#if>/>是
											<input type="radio" name="isTopten.id" value="4028900f40cd477c0140cd4b62ae0002" 
											<#if abm.isTopten ?? && abm.isTopten.code=='N'>checked</#if>/>否
				                    </div>
									<span class="formTitle">星级评价<span class="f_req">*</span></span>
									<div class="span5">
										<input name="honorRating" <#if abm.honorRating??>value="${(abm.honorRating!"")?html}"</#if> maxlength="3"/>(星)
				                    </div>
				            	</div>
							</div>
							</#if>
						</#if>
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
			        	<div class="row-fluid">
							<span class="formTitle">&#12288;&#12288;&#12288;&#12288;<span class="f_req">&nbsp;</span></span>
				        	<div class="span9">
				        		<!-- 
			                    <input class="btn btn-info"  type="button" onclick="onSave()" value="保存"/>
				        		 -->
					            <input class="btn" type="button" onclick="onCancel()" value="取消"/>
				        </div>	
            </div>
		</div>
    </div>
</div>
<script>

//保存社团申请 
 function onSave(){
    if(formValidator.form()==true){
        mask.showShade();
        $('#associationEditForm').attr("action","${rc.contextPath}/association/maintain/opt-edit/saveAssociationInfo.do").submit();
 	}
 }

    //返回到查询信息页面
    function onCancel(){
			window.location.href="${rc.contextPath}/association/maintain/opt-query/getAssociationList.do";
    }
    
	function eisdResponse(r,s){
			var obj = eval("("+r+")");
			if(obj.success=="success"){
				if(obj.listType=="LIST_MANAGER"){
					var param = {pageNo:obj.pageNo,objectId:$("#associationId").val(),managerIds:${hiddenManagerIds!"''"}};
					$("#managerInfoPage").load("${rc.contextPath}/association/apply/nsm/asynLoadManagerList.do",param,function(){});
				}else if(obj.listType=="LIST_ADVISOR"){
					var param = {pageNo:obj.pageNo,objectId:$("#associationId").val(),teacherIds:${hiddenTeacherIds!"''"}};
					$("#teacherInfoPage").load("${rc.contextPath}/association/apply/nsm/asynLoadAdvisorList.do",param,function(){});
				}
			}
	}
</script>
</body>
</html>