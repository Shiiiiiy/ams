<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<link rel="stylesheet" href="${rc.contextPath}/lib/My97DatePicker/skin/WdatePicker.css" />
	<script type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
	<script language="JavaScript" type="text/JavaScript" src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script>
	<script>
		function saveAuditInfo(auditStatus) {
			//auditStatus判断是学院审核还是学生处审核("0"学院审核,"1"学生处审核)
			//status判断是通过还是拒绝("0"通过,"1"拒绝)
			var status = $(":radio:checked").val(); 
			$("#status_id").val(status);
			if(status == 0) {
				if(auditStatus == "0"){
					saveCollegeAuditInfo();
				}else{
					saveStuAffairsAuditInfo();
				}
			}else if(status == 1) {
				if(auditStatus == "0"){
					saveCollegeAuditInfo();
				}else{
					saveStuAffairsAuditInfo();
				}
			}else {
				comp.message("请选择通过还是拒绝！");
				return false;
			}
		}
		
		//学院审核业务保存
		function saveCollegeAuditInfo() {
			$("#collegeAuditInfo").attr("action", "${rc.contextPath}/teacher/collegeAudit/opt-save/auditInfo.do");
			$("#collegeAuditInfo").attr("method", "post");
			$("#collegeAuditInfo").submit();
		}
		//学生处审核业务保存
		function saveStuAffairsAuditInfo() {
			$("#stuAffairAuditInfo").attr("action", "${rc.contextPath}/teacher/stuAffairAudit/opt-save/auditInfo.do");
			$("#stuAffairAuditInfo").attr("method", "post");
			$("#stuAffairAuditInfo").submit();
		}
	  //数据校验
	      var myValidator;
	      //学院审核信息校验
	      	$("document").ready(function(){
			   myValidator= $("#collegeAuditInfo").compValidate({
			      rules:{
					   collegeAuditScroe:{required:true, number:true, range:[0,100]},
					   'collegeAuditLevel.id':{required:true},
					   collegeAuditOpinion:{required:true,maxlength:500},
					   collegeOpinion:{required:true,maxlength:500}
					},
					messages:{
					  collegeAuditScroe:{required:'考核得分不能为空',number:'请输入合法数字，0-100。',range:'分数为0-100'},
					  'collegeAuditLevel.id':{required:'评定等级不能为空'},
					  collegeAuditOpinion:{required:'审核意见不能为空',maxlength:'最大长度为500！'},
					  collegeOpinion:{required:'审核意见不能为空',maxlength:'最大长度为500！'}
			   		}
				});
			});
		//学生处审核信息校验
         $("document").ready(function(){
		   myValidator= $("#stuAffairAuditInfo").compValidate({
		      rules:{
				   stuAffairsAuditScore:{required:true,number:true,range:[0,100]},
				   'stuAffairsAuditLevel.id':{required:true},
				   stuAffairsAuditOpinion:{required:true,maxlength:500},
				   stuAffairsOpinion:{required:true, maxlength:500}
				},
				messages:{
				  stuAffairsAuditScore:{required:'审核得分不能为空',number:'请输入合法数字，0-100。',range:'分数为0-100'},
				  'stuAffairsAuditLevel.id':{required:'评定等级不能为空'},
				  stuAffairsAuditOpinion:{required:'审核意见不能为空',maxlength:'最大长度为500！'},
				  stuAffairsOpinion:{required:'审核意见不能为空',maxlength:'最大长度为500！'}
		   			}
				});
			});
	</script>
</head>
<body>
<div id="contentwrapper">
	<div class="main_content">
		<div class="row-fluid">
			<h3 class="heading">考核审核页面</h3>
			<input name="errorText" id="errorText" type="hidden" value="${errorText!""}"/>
				<#if auditStatus == '0'>
					<form id="collegeAuditInfo" name="collegeAuditInfo" class="form_validation_reg">
				<#else>
					<form id="stuAffairAuditInfo" name="stuAffairAuditInfo" class="form_validation_reg">
				</#if>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<label>学年</label>
							</div>
							<div class="span9">
								<input id="" name="" value="${(evaluateTeacher.schoolYear.name)!""}" readonly/>
								<input id="schoolYear.id" name="schoolYear.id" value="${evaluateTeacher.schoolYear.id}" type="hidden"/>
							</div>
						</div>
						<div class="span6">
							<div class="span3">
								<label>学院</label>
							</div>
							<div class="span9">
								<input value="${(evaluateTeacher.teacher.org.name)!""}" readonly/>
								<input id="college.id" name="college.id" type="hidden" value="${evaluateTeacher.teacher.org.id!""}"/>
							</div>
						</div>
					</div>
				</div>	
				
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<label>姓名</label>
							</div>
							<div class="span9">
								<input value="${(evaluateTeacher.teacher.name)!""}" readonly/>
								<input id="teacher.id" name="teacher.id" type="hidden" value="${(evaluateTeacher.teacher.id)!""}"/>
							</div>
						</div>
						<div class="span6">
							<div class="span3">
								<label>性别</label>
							</div>
							<div class="span9">
								<input value="${(evaluateTeacher.teacher.gender.name)!""}" readonly/>
							</div>
						</div>
					</div>
				</div>
		
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<label>出生年月</label>
							</div>
							<div class="span9">
								<input value="${(evaluateTeacher.teacher.birthday ? string('yyyy-MM-dd'))!""}" readonly/>
							</div>
						</div>
									
						<div class="span6">
							<div class="span3">
								<label>民族</label>
							</div>
							<div class="span9">
								<input value="${(evaluateTeacher.teacher.nation)!""}" readonly>
							</div>
						</div>
					</div>
				</div>
				
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<label>工作时间</label>
							</div>
							<div class="span9">
								<input id="workTime" name="workTime" value="${(evaluateTeacher.workTime)!""}" readonly/>
							</div>
						</div>
						<div class="span6">
							<div class="span3">
								<label>现任职务</label>
							</div>
							<div class="span9">
								<input id="presentJob" name="presentJob" value="${evaluateTeacher.presentJob!""}" readonly/>
							</div>
						</div>
					</div>
				</div>
					
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<label>工作总结</label>
							</div>
							<div class="span9">
								<textarea id="yearWorkSummary" name="yearWorkSummary" rows="5" cols="12" style="width: 775px; height: 134px;" readonly>${(evaluateTeacher.yearWorkSummary)!""}</textarea>
							</div>
						</div>
					</div>
				</div>
		
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<label>所获荣誉</label>
							</div>
							<div class="span9">
								<textarea id="honour" name="honour" rows="5" cols="12" style="width: 775px; height: 134px;" readonly>${(evaluateTeacher.honour)!""}</textarea>
							</div>
						</div>
					</div>
				</div>
				
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<label>相关附件</label>
							</div>
							<div class="span9" id="_upload_div">
								<#if uploadFileRefList??>	
									<#list uploadFileRefList as f>
										<div class="fileupload-info">
											<a href="${rc.contextPath}/sys/sysConfig/file.do?id=${f.uploadFile.id}"><strong>${f.uploadFile.name}&nbsp;(${f.uploadFile.fileSize})</strong></a>
										</div>					
									</#list>
								</#if> 
							</div>
						</div>
					</div>
				</div>
				<div class="row-fluid">
					<div class="span12">
						<label>&nbsp;</label>
						<h3 class="heading">审批信息</h3>
						<input id="status_id" name="status_id" value="" type="hidden"/>
						<input id="id" name="id" type="hidden" value="${evaluateTeacher.id!""}"/>
					</div>
				</div>
				
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<label>审核结果<span class="f_req">*</span></label>
							</div>
							<div class="span9">
								<input type="radio" id="_pass" name="pass" value="0" />
								<span>通过</span>
								<input type="radio" id="_not_pass" name="pass" value="1" />
								<span>拒绝</span>
							</div>
						</div>
					</div>
				</div>
				<div>
				</div>
				<script>
					$("input[name='pass']").click(function() {
						if($(this).val()=='0') {
							$("#_audit_pass").removeClass();
							$("#_audit_reject").addClass("hidden");
							$("#_chose").addClass("hidden");
						}else {
							$("#_audit_pass").addClass("hidden");
							$("#_audit_reject").removeClass();
							$("#_chose").addClass("hidden");
						}
					});
				</script>
				<div id="_audit_pass" class="hidden">
				<#if auditStatus == '0' >
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<lable>考核得分<span class="f_req">*</span></label>
								</div>
								<div class="span9">
									<input id="collegeAuditScroe" name="collegeAuditScroe" value="${evaluateTeacher.collegeAuditScroe!""}"/>
								</div>
							</div>
							<div class="span6">
								<div class="span3">
									<lable>评定等级<span class="f_req">*</span></label>
								</div>
								<div class="span9">
									<select id="collegeAuditLevel.id" name="collegeAuditLevel.id" aria-controls="dt_gal" >
									<option value="">请选择</option>
										<#if auditLevelList??>
										<#list auditLevelList as auditLevel>
											<#if po?? && (po.collegeAuditLevel)?? && po.collegeAuditLevel.id == auditLevel.id>
												<option value="${auditLevel.id}" selected="selected">${auditLevel.name}</option>
											<#else>
												<option value="${auditLevel.id}">${auditLevel.name}</option>
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
								<div class="span3">
									<lable>学院审核意见<span class="f_req">*</span></lable>
								</div>
								<div class="span9">
									<textarea id="collegeAuditOpinion" name="collegeAuditOpinion" rows="5" cols="12" style="width: 775px; height: 134px;">${evaluateTeacher.collegeAuditOpinion!""}</textarea>
								</div>
							</div>
						</div>
					</div>
				<#else>
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<lable>考核得分<span class="f_req">*</span></label>
								</div>
								<div class="span9">
									<input id="passScore" name="passScore" value="<#if evaluateTeacher.collegeAuditScroe??>${evaluateTeacher.collegeAuditScroe!""}</#if>" type="hidden"/>
									<input id="passAuditor" name="passAuditor" value="<#if evaluateTeacher.collegeAuditAuditor??>${evaluateTeacher.collegeAuditAuditor!""}</#if>" type="hidden"/>
									<input id="passLevel" name="passLevel" value="<#if evaluateTeacher.collegeAuditLevel??>${evaluateTeacher.collegeAuditLevel.id!""}</#if>" type="hidden"/>
									<input id="passOpinion" name="passOpinion" value="<#if evaluateTeacher.collegeAuditOpinion??>${evaluateTeacher.collegeAuditOpinion!""}</#if>" type="hidden"/>
									<input id="passStatus" name="passStatus" value="<#if evaluateTeacher.collegeAuditStatus??>${evaluateTeacher.collegeAuditStatus!""}</#if>" type="hidden"/>
									<#if evaluateTeacher.collegeAuditScroe??>
										<input id="stuAffairsAuditScore" name="stuAffairsAuditScore" value="${evaluateTeacher.collegeAuditScroe!""}"/>
									</#if>
								</div>
							</div>
							<div class="span6">
								<div class="span3">
									<lable>评定等级<span class="f_req">*</span></label>
								</div>
								<div class="span9">
									<select id="stuAffairsAuditLevel.id" name="stuAffairsAuditLevel.id" aria-controls="dt_gal" >
									<option value="<#if evaluateTeacher?? && evaluateTeacher.collegeAuditLevel??>${evaluateTeacher.collegeAuditLevel.id!""}</#if>" selected="selected">${evaluateTeacher.collegeAuditLevel.name!""}</option>
										<#if auditLevelList??>
										<#list auditLevelList as auditLevel>
											<#if po?? && (po.collegeAuditLevel)?? && po.collegeAuditLevel.id == auditLevel.id>
												<option value="${auditLevel.id!""}" selected="selected">${auditLevel.name!""}</option>
											<#else>
												<option value="${auditLevel.id!""}">${auditLevel.name!""}</option>
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
								<div class="span3">
									<lable>学生处审核意见<span class="f_req">*</span></lable>
								</div>
								<div class="span9">
									<textarea id="opinion" name="stuAffairsAuditOpinion" rows="5" cols="12" style="width: 775px; height: 134px;">${evaluateTeacher.stuAffairsAuditOpinion!""}</textarea>
								</div>
							</div>
						</div>
					</div>
				</#if>
				</div>
				
				<div id="_audit_reject" class="hidden">
				<#if auditStatus == '0'>
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<lable>学院审核意见<span class="f_req">*</span></lable>
								</div>
								<div class="span9">
									<textarea id="collegeOpinion" name="collegeOpinion" rows="5" cols="12" style="width: 775px; height: 134px;">${evaluateTeacher.collegeAuditOpinion!""}</textarea>
								</div>
							</div>
						</div>
					</div>
				<#else>
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<lable>学生处审核意见<span class="f_req">*</span></lable>
								</div>
								<div class="span9">
									<input id="rejectScroe" name="rejectScroe" value="<#if evaluateTeacher.collegeAuditScroe??>${evaluateTeacher.collegeAuditScroe!""}</#if>" type="hidden"/>
									<input id="rejectAuditor" name="rejectAuditor" value="<#if evaluateTeacher.collegeAuditAuditor??>${evaluateTeacher.collegeAuditAuditor!""}</#if>" type="hidden"/>
									<input id="rejectLevel" name="rejectLevel" value="<#if evaluateTeacher.collegeAuditLevel??>${evaluateTeacher.collegeAuditLevel.id!""}</#if>" type="hidden"/>
									<input id="rejectOpinion" name="rejectOpinion" value="<#if evaluateTeacher.collegeAuditOpinion??>${evaluateTeacher.collegeAuditOpinion!""}</#if>" type="hidden"/>
									<input id="rejectStatus" name="rejectStatus" value="<#if evaluateTeacher.collegeAuditStatus??>${evaluateTeacher.collegeAuditStatus!""}</#if>" type="hidden"/>
									<textarea id="stuAffairsOpinion" name="stuAffairsOpinion" rows="5" cols="12" style="width: 775px; height: 134px;">${evaluateTeacher.stuAffairsAuditOpinion!""}</textarea>
								</div>
							</div>
						</div>
					</div>
				</#if>
				</div>
				
				<div class="row-fluid">
					<div class="span6">
						<div class="row-fluid">
							<div class="span3"></div>
							<div class="span9" style="padding:10px 0px 0px 0px">
								<button class="btn btn-info" type="button" onclick="saveAuditInfo(${auditStatus!""})">提 交</button>
								<button class="btn" type="button" onclick="javascript:window.history.back(-1);">返 回</button>
							</div>
						</div>
					</div>
				</div>
			</form>
			<input name="check_error" id="check_error" type="hidden" value="true"/>
		</div>
	</div>
</div>
</body>
</html>