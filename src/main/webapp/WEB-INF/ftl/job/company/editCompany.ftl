<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="${rc.contextPath}/css/bdp_comp.css" type="text/css"/>
		<!-- My97DatePicker -->
		<link rel="stylesheet" href="${rc.contextPath}/lib/My97DatePicker/skin/WdatePicker.css" />
		<script type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
		<script src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script>
		<script src="${rc.contextPath}/lib/validation/localization/messages_cn.js"></script>
		<script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
	</head>
	<body>
		<div id="contentwrapper">
			<div class="main_content">
				<div class="row-fluid">
					<div class="span12">
						<h3 class="heading">
							<#if (companyInfoVO.id)??>
								企业信息修改
							<#else>
								企业信息新增
							</#if>
						</h3>
					</div>
				</div>
				<form id="companyInfoForm" method="post" action="${rc.contextPath}/job/companyInfo/opt-save/saveCompanyInfo.do">
					<input id="id" name="id" type="hidden" value='${(companyInfoVO.id)!""}' />
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span4">
									<label>所属学院</label>
								</div>
								<div class="span8">
									<select id="collegeId" name="college.id" aria-controls="dt_gal" class="span8" <#if (companyInfoVO.id)?? || isJobOffice == false >disabled="disabled"</#if> >
										<option value="">请选择</option>
										<option value="05" <#if (companyInfoVO.college.id)?? && companyInfoVO.college.id == '05'>selected="selected"</#if>>${companyManagerName!""}</option>
										<#if colleges??>
											<#list colleges as college>
												<#if (companyInfoVO.college.id)?? && companyInfoVO.college.id == college.id>
													<option value="${college.id}" selected="selected">${college.name}</option>
												<#else>
													<option value="${college.id}">${college.name}</option>
												</#if>
											</#list>
										</#if>
									</select>
								</div>
							</div>
							<div class="span6">
								<div class="span4">
									<label>企业名称<span class="f_req">*</span></label>
								</div>
								<div class="span8">
									<input id="companyName" name="companyName" value='${(companyInfoVO.companyName)!""}' class="span8" <#if (companyInfoVO.id)??>readonly="readonly"</#if> />
								</div>
							</div>
						</div>
					</div>
					
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span4">
									<label>企业性质<span class="f_req">*</span></label>
								</div>
								<div class="span8">
									<select id="companyProerty" name="companyProerty.id" class="span8" <#if (companyInfoVO.id)??>disabled="disabled"</#if> >
										<option value="">请选择</option>
										<#if companyProertys??>
											<#list companyProertys as cp>
												<#if (companyInfoVO.companyProerty.id)?? && companyInfoVO.companyProerty.id=cp.id>
													<option value="${cp.id}" selected="selected">${cp.name}</option>
												</#if>
												<option value="${cp.id}">${cp.name}</option>
											</#list>
										</#if>
									</select>
								</div>
							</div>
							<div class="span6">
								<div class="span4">
									<label>联系人<span class="f_req">*</span></label>
								</div>
								<div class="span8">
									<input name="contactPerson" value='${(companyInfoVO.contactPerson)!""}' class="span8"/>
								</div>
							</div>
						</div>
					</div>
					
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span4">
									<label>联系人职务</label>
								</div>
								<div class="span8">
									<input name="contactPost" value='${(companyInfoVO.contactPost)!""}' class="span8"/>
								</div>
							</div>
							
							<div class="span6">
								<div class="span4">
									<label>联系电话</label>
								</div>
								<div class="span8">
									<input name="contactPhone" value='${(companyInfoVO.contactPhone)!""}' class="span8"/>
								</div>
							</div>
						</div>
					</div>
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span4">
									<label>手机号码</label>
								</div>
								<div class="span8">
									<input name="phoneNum" value='${(companyInfoVO.phoneNum)!""}' class="span8"/>
								</div>
							</div>
							<div class="span6">
								<div class="span4">
									<label>是否签订校企合作协议<span class="f_req">*</span></label>
								</div>
								<div class="span8">
									<#if isSchoolCompanyProtocols??>
										<#list isSchoolCompanyProtocols as scp>
											<#if (companyInfoVO.id)??>
												<#if companyInfoVO.isSchoolCompanyProtocol.id == scp.id>
													<label class="radio inline">
														<input name="isSchoolCompanyProtocol.id" type="radio" checked="checked" value="${scp.id}"/>${scp.name}
													</label>
												<#else>
													<label class="radio inline">
														<input name="isSchoolCompanyProtocol.id" type="radio" value="${scp.id}"/>${scp.name}
													</label>
												</#if>
											<#else>
												<#if scp_index == 0>
													<label class="radio inline">
														<input name="isSchoolCompanyProtocol.id" type="radio" checked="checked" value="${scp.id}"/>${scp.name}
													</label>
												<#else>
													<label class="radio inline">
														<input name="isSchoolCompanyProtocol.id" type="radio" value="${scp.id}"/>${scp.name}
													</label>
												</#if>
											</#if>
										</#list>
									</#if>
								</div>
							</div>
						</div>
					</div>
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span4">
									<label>是否批量就业单位<span class="f_req">*</span></label>
								</div>
								<div class="span8">
									<#if isBatchWorks??>
										<#list isBatchWorks as bw>
											<#if (companyInfoVO.id)??>
												<#if companyInfoVO.isBatchWork.id == bw.id>
													<label class="radio inline">
														<input name="isBatchWork.id" type="radio" checked="checked" value="${bw.id}"/>${bw.name}
													</label>
												<#else>
													<label class="radio inline">
														<input name="isBatchWork.id" type="radio" value="${bw.id}"/>${bw.name}
													</label>
												</#if>
											<#else>
												<#if bw_index == 0>
													<label class="radio inline">
														<input name="isBatchWork.id" type="radio" checked="checked" value="${bw.id}"/>${bw.name}
													</label>
												<#else>
													<label class="radio inline">
														<input name="isBatchWork.id" type="radio" value="${bw.id}"/>${bw.name}
													</label>
												</#if>
											</#if>
										</#list>
									</#if>
								</div>
							</div>
							<div class="span6">
								<div class="span4">
									<label>更新时间<span class="f_req">*</span></label>
								</div>
								<div class="span8">
									<input name="updateDateText" class="span8 Wdate" style="cursor:pointer;" <#if (companyInfoVO.updateDate)??>value='${(companyInfoVO.updateDate)?string("yyyy-MM-dd")}'</#if> type="text" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',skin:'whyGreen'});" />
								</div>
							</div>
						</div>
					</div>
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span4">
									<label>需求岗位</label>
								</div>
								<div class="span8">
									<#--<input name="needWork" value='${(companyInfoVO.needWork)!""}' style="width:778px;" class="span8"/>-->
									<textarea id="needWork" rows="5" name="needWork" style="width:770px;">${(companyInfoVO.needWork)!""}</textarea>
								</div>
							</div>
						</div>
					</div>
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span4">
									<label>企业详细地址<span class="f_req">*</span></label>
								</div>
								<div class="span8">
									<#--<input name="address" value='${(companyInfoVO.address)!""}' style="width:778px;" class="span8"/>-->
									<textarea id="address" rows="5" name="address" style="width:770px;">${(companyInfoVO.address)!""}</textarea>
								</div>
							</div>
						</div>
					</div>
					<br/>
					<div class="row-fluid">
						<div class="span6">
							<div class="span4"></div>
							<div class="span6">
								<input class="btn btn-info" type="button" value="保 存" onclick="saveCompanyInfo();"/>
								<input class="btn" type="button" value="返 回" onclick="back();"/>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		<#--脚本开始-->
		<script type="text/javascript">
			$(function(){
				$('.tipTag').poshytip({
					className: 'tip-yellowsimple',
					alignTo: 'target',
					alignX: 'right',
					alignY: 'center',
					offsetX: 5
				});
			});
			//验证select是否选择
			jQuery.validator.addMethod("requiredSelect", function(value,element,param) {
				if(value == "" || value == null){
					return false;
				}else{
					return true;
				}
			}, "请选择:{0}");
			//前台验证 
			$('#companyInfoForm').validate({
				onkeyup: false,
				errorClass: 'error',
				validClass: 'valid',
				focusCleanup:true,
				focusInvalid:false,
				highlight: function(element) {
					$(element).closest('div').addClass("f_error");
				},
				unhighlight: function(element) {
					$(element).closest('div').removeClass("f_error");
				},
				errorPlacement: function(error, element) {
					$(element).closest('div').append(error);
				},
				rules: {
					companyName : {required : true,maxlength : 100},
					"companyProerty.id" : {requiredSelect : "企业性质"},
					contactPerson : {required : true,maxlength : 50},
					contactPost : {maxlength : 50},
					phoneNum : {regphone : true,maxlength:11},
					contactPhone : {isTelPhone : true},
					needWork : {maxlength : 200},
					address : {required : true, maxlength : 200},
					updateDateText : {required : true}
				},
				messages:{
					companyName:{required:"企业名称为必填项",maxlength:"企业名称最大长度为100位"},
					contactPerson:{required:"联系人为必填项",maxlength:"联系人最大长度为50位"},
					contactPost:{maxlength:"联系人职务最大长度为50位"},
					phoneNum:{maxlength:"手机号码最大长度为11位"},
					needWork:{maxlength:"需求岗位最大长度为200位"},
					address:{required:"企业详细地址为必填项",maxlength:"企业详细地址最大长度为200位"},
					updateDateText:{required:"更新时间为必填项"}
				}
			});
			//保存 
			function saveCompanyInfo(){
				var companyInfoForm = $('#companyInfoForm');
				var id = $("#id").val();
				if(!companyInfoForm.compValid()){
					return;
				}
				if(id == "" || id == null){//添加
					$.post(
						"${rc.contextPath}/job/companyInfo/opt-query/isExitCompanyInfo.do",
						{"id":$("#id").val(),"college.id":$("#collegeId").val(),"companyName":$("#companyName").val(),"companyProerty.id":$("#companyProerty").val()},
						function(result){
							if(result == "false"){
								companyInfoForm.submit();
							}else{
								$.sticky("该企业已经添加过了！", {autoclose:5000, position:"top-right", type:"st-error"});
							}
						}
					);
					
				}else{//修改
					companyInfoForm.submit();
				}
			}
			//返回
			function back(){
				window.location.href="${rc.contextPath}/job/companyInfo/opt-query/queryCompanyInfoList.do";
			}
		</script>
		<#--脚本结束-->
	</body>
</html>