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
				<form id="temporaryWorkForm" method="post">
					<input id="id" name="id" type="hidden" value='${(model.id)!""}' />
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<label>姓名<span class="f_req">*</span></label>
								</div>
								<div class="span9">
									<input id="studentName" name="studentName" value='${(model.studentId.name)!""}' readonly="readonly"/>
									<#if (model.id)??>
									<#else>
										<a id="course-lecture-select"  style="margin-left: -4px;margin-top: -10px;" href="javascript:void(0);" onclick="selectStudentRadio();" class="btn"><i class="icon-search"></i></a>
									</#if>
								</div>
							</div>
							<div class="span6">
								<div class="span3">
									<label>学号<span class="f_req"></span></label>
								</div>
								<div class="span9">
									<input id="stuNo" name="studentId.id" value='${(model.studentId.stuNumber)!""}' readonly="readonly"/>
								</div>
							</div>
						</div>
					</div>
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<label>学院</label>
								</div>
								<div class="span9">
									<input id="collegeName" value="${(model.studentId.college.name)!""}" readonly="readonly"/>
								</div>
							</div>
							<div class="span6">
								<div class="span3">
									<label>班级</label>
								</div>
								<div class="span9">
									<input id="className" value='${(model.studentId.classId.className)!""}' readonly="readonly"/>
								</div>
							</div>
						</div>
					</div>
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<label>开户行<span class="f_req">*</span></label>
								</div>
								<div class="span9">
									<input id="bank" name="bank" value='${(model.bank)!""}'/>
								</div>
							</div>
							<div class="span6">
								<div class="span3">
									<label>银行卡号<span class="f_req">*</span></label>
								</div>
								<div class="span9">
									<input id="cardNum" name="cardNum" value='${(model.cardNum)!""}'/>
								</div>
							</div>
						</div>
					</div>
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<label>用工部门<span class="f_req">*</span></label>
								</div>
								<div class="span9">
									<input id="orgName" name="orgName" value='${(model.orgName)!""}' <#if (model.id)??>onchange="isExistTemporaryWorkStudyModel();"</#if> />
								</div>
							</div>
							<div class="span6">
								<div class="span3">
									<label>学年<span class="f_req">*</span></label>
								</div>
								<div class="span9">
									<select id="year" name="schoolYear.id" <#if (model.id)??>onchange="isExistTemporaryWorkStudyModel();"</#if> >
										<option value="">请选择..</option>
										<#list years as year>
											<#if (nowYear)?? && nowYear.id == year.id>
												<option value="${year.id}" selected="selected">${year.name}</option>
											<#elseif (model.schoolYear)?? && model.schoolYear.id == year.id>
												<option value="${year.id}" selected="selected">${year.name}</option>
											<#else>
												<option value="${year.id}">${year.name}</option>
											</#if>
										</#list>
									</select>
								</div>
							</div>
						</div>
					</div>
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<label>学期<span class="f_req">*</span></label>
								</div>
								<div class="span9">
									<select id="term" name="schoolTerm.id">
										<option value="">请选择..</option>
										<#list terms as term>
											<#if (nowTerm)?? && nowTerm.id == term.id>
												<option value="${term.id}" selected="selected">${term.name}</option>
											<#elseif (model.schoolTerm)?? && model.schoolTerm.id == term.id>
												<option value="${term.id}" selected="selected">${term.name}</option>
											<#else>
												<option value="${term.id}">${term.name}</option>
											</#if>
										</#list>
									</select>
								</div>
							</div>
							<div class="span6">
								<div class="span3">
									<label>月份<span class="f_req">*</span></label>
								</div>
								<div class="span9">
									<input id="workMonth" name="workMonth"  class="Wdate" style="cursor:pointer;" <#if nowMonth??>value="${nowMonth!''}"</#if><#if (model.workMonth)??>value="${(model.workMonth)!""}"</#if>  type="text" onclick="WdatePicker({dateFmt:'MM',skin:'whyGreen'});" <#if (model.id)??>onchange="isExistTemporaryWorkStudyModel();"</#if> />
								</div>
							</div>
						</div>
					</div>
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<label>月用工时数（小时）<span class="f_req">*</span></label>
								</div>
								<div class="span9">
									<input id="workHour" name="workHour" value='${(model.workHour?string('.0'))!""}'/>
								</div>
							</div>
						</div>
					</div>
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<label>该生在本月勤工助学中的表现</label>
								</div>
								<div class="span9">
									<#if (model.workPerformance)?? >
										<textarea id="workPerformance" rows="5" cols="12" name="workPerformance" class="tipTag" data="1.填写学生在勤工助学期间的表现情况&lt;br/&gt;" style="width:773px; height: 134px;">${model.workPerformance!''}</textarea>
									<#else>
										<textarea id="workPerformance" rows="5" cols="12" name="workPerformance" class="tipTag" data="1.填写学生在勤工助学期间的表现情况&lt;br/&gt;" style="width:773px; height: 134px;"></textarea>
									</#if>
								</div>
							</div>
						</div>
					</div>
					<br/>
					<div class="row-fluid" >
						<div class="span6">
							<div class="span3"></div>
							<div class="span6">
								<input id="saveBtn" class="btn btn-info" type="button" value="保 存" onclick="saveTemporary();"/>
								<input class="btn" type="button" value="返 回" onclick="back();"/>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		<#-- 学生选择单选组件的引入 -->
		<#include "/comp/student/queryStudentAllRadioModal.ftl">
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
			jQuery.validator.addMethod("isLength", function(value,element,param) {
				if(value.length == param){
					return true;
				}else{
					return false;
				}
			}, "长度为:{0}");
			jQuery.validator.addMethod("decimal", function(value,element,param) {
				return /(((^[1-9][0-9]{0,6})|^0)(\.[0-9]{1})?$)|^0$/.test(value);//包括0和0.0
				//return /(^[1-9]\d*$)|((^[1-9]\d*|0).\d{1}$)/.test(value);
			}, "工时为精确到小数点后一位的非负数!");
			jQuery.validator.addMethod("workHourValidate", function(value,element,param) {
				if(value <= 40){
					return true;
				}else{
					return false;
				}
			}, "工时不超过40小时!");
			//前台验证 
			$('#temporaryWorkForm').compValidate({
				rules: {
					orgName : {
						required : true,
						maxlength : 50
					},
					studentName : {required : true},
					cardNum : {
						required : true,
						isNumber : true,
						maxlength : 20,
						minlength : 10
					},
					bank : {
						required : true,
						maxlength : 100,
					},
					workMonth : {
						required : true,
						isNumber : true,
						isLength : 2
					},
					workHour : {
						required : true,
						number : true,
						decimal : true,
						workHourValidate : true,
					},
					'schoolYear.id' : {
						requiredSelect : "学年"
					},
					'schoolTerm.id' : {
						requiredSelect : "学期"
					},
					workPerformance : {
						maxlength : 200
					}
				},messages:{
					orgName:{required:"用工部门为必填项",maxlength:"用工部门不能超过50个字"},
					studentName:{required:"姓名为必填项"},
					cardNum:{required:"银行卡号为必填项",maxlength:"银行卡号最大长度不超过20位",minlength:"银行卡号最大长度不少于10位"},
					bank:{required:"开户行为必填项",maxlength:"开户行最大长度不超过100位"},
					workMonth:{required:"月份为必填项",length:"月份为2位数字"},
					workHour:{required:"工时数为必填项",maxlength:"工时数最大位数不超过5位",decimal:"工时为精确到小数点后一位的非负数！",number:"工时为数字"},
					'schoolYear.id':{requiredSelect:"学年为必选项"},
					'schoolTerm.id':{requiredSelect:"学期为必选项"},
					workPerformance:{maxlength:"长度不能超过200字!"}
				}
			});
			//判断是否存在重复数据
			function isExistTemporaryWorkStudyModel(){
				var temporaryWorkForm = $('#temporaryWorkForm');
				if(temporaryWorkForm.compValid()){
					$.ajax({
						url:"${rc.contextPath}/sponsor/temporaryWork/opt-query/queryUpdateTemporaryWork.do",
						data:{"id":$("#id").val(),"schoolYear.id":$("#year").val(),"studentId.id":$("#stuNo").val(),"orgName":$("#orgName").val(),"workMonth":$("#workMonth").val()},
						success:function(result){
							var saveBtn = $("#saveBtn");
							if(result == "true"){
								$.sticky("该学生已经被添加过了！", {autoclose:5000, position:"top-right", type:"st-error"});
								saveBtn.attr("disabled","disabled");
							}else{
								saveBtn.removeAttr("disabled");
							}
						},
						dataType:"text",
						type:"POST",
						async:false
					});
				}
			}
			//保存 
			function saveTemporary(){
				var temporaryWorkForm = $('#temporaryWorkForm');
				if(temporaryWorkForm.compValid()){
					if($("#id").val()==null || $("#id").val()==""){
						$.post(
							"${rc.contextPath}/sponsor/temporaryWork/opt-query/queryAddTemporaryWork.do",
							temporaryWorkForm.serialize(),
							function(result){
								if(result == "true"){
									$.sticky("该学生已经被添加过了！", {autoclose:5000, position:"top-right", type:"st-error"});
								}else{
									window.location.href="${rc.contextPath}/sponsor/temporaryWork/opt-query/queryTemporaryWorkList.do";
								}
							},
							"text"
						);
					}else{
						isExistTemporaryWorkStudyModel();
						temporaryWorkForm.attr("action","${rc.contextPath}/sponsor/temporaryWork/opt-save/saveTemporaryWork.do");
						temporaryWorkForm.submit();
					}
					
				}
			}
			// 单选学生选择
			function selectStudentRadio(){
				_queryStudentRadioAll("");
			}
			function setStudentRadioSelectValue(student){
				$("#studentName").val(student.name);
				$("#stuNo").val(student.id);
				$("#collegeName").val(student.collegeName);
				$("#className").val(student.className);
				if(student.bankCode == "null"){
					$("#cardNum").val("");
				}else{
					$("#cardNum").val(student.bankCode);
				}
				if(student.bank == "null"){
					$("#bank").val("");
				}else{
					$("#bank").val(student.bank);
				}
			}
			//返回
			function back(){
				window.location.href="${rc.contextPath}/sponsor/temporaryWork/opt-query/queryTemporaryWorkList.do";
			}
		</script>
		<#--脚本结束-->
	</body>
</html>