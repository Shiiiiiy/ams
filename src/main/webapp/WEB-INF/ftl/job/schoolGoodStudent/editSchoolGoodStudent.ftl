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
							<#if (schoolGoodStudentVO.id)??>
								校优秀毕业生修改
							<#else>
								校优秀毕业生新增
							</#if>
						</h3>
					</div>
				</div>
				<form id="schoolGooodStudentForm" method="post" action="${rc.contextPath}/job/schoolGoodStudent/opt-save/saveSchoolGoodStudent.do">
					<input id="id" name="id" type="hidden" value='${(schoolGoodStudentVO.id)!""}' />
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<label>学生姓名<span class="f_req">*</span></label>
								</div>
								<div class="span9">
									<input id="studentName" name="studentId.name" value='${(schoolGoodStudentVO.studentId.name)!""}' readonly="readonly"/>
									<#if (schoolGoodStudentVO.id)??>
									<#else>
										<a id="course-lecture-select"  style="margin-left: -4px;margin-top: -10px;" href="javascript:void(0);" onclick="selectStudentRadio();" class="btn"><i class="icon-search"></i></a>
									</#if>
									<input id="teacherCollegeId" type="hidden" value="${teacherCollegeId!""}"/>
								</div>
							</div>
							<div class="span6">
								<div class="span3">
									<label>学号</label>
								</div>
								<div class="span9">
									<input id="studentId" name="studentId.id" value='${(schoolGoodStudentVO.studentId.id)!""}' readonly="readonly"/>
								</div>
							</div>
						</div>
					</div>
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<label>民族</label>
								</div>
								<div class="span9">
									<input id="studentNational" value='${(schoolGoodStudentVO.studentId.national)!""}' readonly="readonly"/>
								</div>
							</div>
							<div class="span6">
								<div class="span3">
									<label>性别</label>
								</div>
								<div class="span9">
									<input id="studentGenderDic" value='${(schoolGoodStudentVO.studentId.genderDic.name)!""}' readonly="readonly"/>
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
									<input id="studentBirthday" value='${(schoolGoodStudentVO.studentId.brithDate?string("yyyy-MM-dd"))!""}' readonly="readonly"/>
								</div>
							</div>
							<div class="span6">
								<div class="span3">
									<label>政治面貌</label>
								</div>
								<div class="span9">
									<input id="studentPoliticalDic" value='${(schoolGoodStudentVO.studentId.politicalDic.name)!""}' readonly="readonly"/>
								</div>
							</div>
						</div>
					</div>
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<label>班级</label>
								</div>
								<div class="span9">
									<input id="className" value='${(schoolGoodStudentVO.studentId.classId.className)!""}' readonly="readonly"/>
								</div>
							</div>
							<div class="span6">
								<div class="span3">
									<label>专业</label>
								</div>
								<div class="span9">
									<input id="majorName" value='${(schoolGoodStudentVO.studentId.major.majorName)!""}' readonly="readonly"/>
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
									<input id="collegeName" value='${(schoolGoodStudentVO.studentId.college.name)!""}' readonly="readonly"/>
								</div>
							</div>
							<div class="span6">
								<div class="span3">
									<label>班级人数</label>
								</div>
								<div class="span9">
									<input id="classNumber" name="classNumber" value='${(schoolGoodStudentVO.classNumber)!""}' readonly="readonly"/>
								</div>
							</div>
						</div>
					</div>
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<label>班级排名<span class="f_req">*</span></label>
								</div>
								<div class="span9">
									<input name="classSort" value='${(schoolGoodStudentVO.classSort)!""}'/>
								</div>
							</div>
							<div class="span6">
								<div class="span3">
									<label>职务<span class="f_req">*</span></label>
								</div>
								<div class="span9">
									<input name="post" value='${(schoolGoodStudentVO.post)!""}' />
								</div>
							</div>
						</div>
					</div>
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<label>计算机等级<span class="f_req">*</span></label>
								</div>
								<div class="span9">
									<input name="computerLevel" value='${(schoolGoodStudentVO.computerLevel)!""}'/>
								</div>
							</div>
							<div class="span6">
								<div class="span3">
									<label>外语等级<span class="f_req">*</span></label>
								</div>
								<div class="span9">
									<input name="englishLevel" value='${(schoolGoodStudentVO.englishLevel)!""}'/>
								</div>
							</div>
						</div>
					</div>
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<label>总成绩平均分<span class="f_req">*</span></label>
								</div>
								<div class="span9">
									<input name="avgScore" value=
										<#if (schoolGoodStudentVO.id)??>
											<#if (schoolGoodStudentVO.avgScore)??>
													'${(schoolGoodStudentVO.avgScore)?string(".00")}'
											<#else>
												0.00
											</#if>
										</#if>
									 >
								</div>
							</div>
						</div>
					</div>
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<label>本人在校期间表现</label>
								</div>
								<div class="span9">
									<textarea id="performance" rows="5" cols="12" readlony="readlony" name="performance" readonly="readonly" style="width:195%; height:200px;">${(schoolGoodStudentVO.performance)!""}</textarea>
								</div>
							</div>
						</div>
					</div>
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<label>曾获荣誉</label>
								</div>
								<div class="span9">
									<textarea id="honor" rows="5" cols="12" name="honor" style="width:195%; height: 308px;" readonly="readonly">${(schoolGoodStudentVO.honor)!""}</textarea>
								</div>
							</div>
						</div>
					</div>
					<br/>
					<div class="row-fluid">
						<div class="span6">
							<div class="span3"></div>
							<div class="span6">
								<input class="btn btn-info" type="button" value="保 存" onclick="saveSchoolGoodStudent(0);"/>
								<input class="btn btn-info" type="button" value="提 交" onclick="saveSchoolGoodStudent(1);"/>
								<input class="btn" type="button" value="返 回" onclick="back();"/>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		<#-- 学生选择单选组件的引入 -->
		<#include "./comp/queryAwardGraduateStudentModal.ftl">
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
			jQuery.validator.addMethod("gtZeroNumber",function(value,element,param){
				if(/^[1-9][0-9]*$/.test(value)){
					return true;
				}
				return false;
			},"{0}是大于零且以非零开头的整数");
			jQuery.validator.addMethod("decimal",function(value,element,param) {
				return /(((^[1-9][0-9]{0,6})|^0)(\.[0-9]{1,2})?$)|^0$/.test(value);//包括0和0.0
			},"{0}为整数位不超过7位，最高精度为两位小数的非负数!");
			//前台验证 
			$('#schoolGooodStudentForm').validate({
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
					"studentId.name" : {required : true},
					post : {required : true,maxlength:50},
					classSort : {required : true,maxlength : 10,gtZeroNumber : "班级排名"},
					classNumber : {required : true,maxlength : 10,gtZeroNumber : "班级人数"},
					computerLevel : {required : true,maxlength : 32},
					englishLevel : {required : true,maxlength : 32},
					avgScore : {required : true,maxlength : 10,decimal:"总成绩平均分"},
					performance : {maxlength : 2000},
					honor : {maxlength : 2000}
				},
				messages:{
					"studentId.name" : {required : "学生姓名为必填项"},
					post : {required:"职务为必填项",maxlength:"公司机构代码最大长度为50位"},
					classSort : {required:"班级排名为必填项",maxlength:"公司名称最大长度为10位"},
					classNumber : {required:"班级人数为必填项",maxlength:"班级人数最大长度为10位"},
					computerLevel : {required:"计算机等级为必填项",maxlength:"计算机等级最大长度为32位"},
					englishLevel : {required:"外语等级为必填项",maxlength:"外语等级最大长度为32位"},
					avgScore : {required:"总成绩平均分为必填项",maxlength:"总成绩平均分最大长度为10位"},
					performance : {maxlength:"本人在校期间表现最大长度为2000位"},
					honor : {maxlength:"曾获荣誉最大长度为2000位"}
				}
			});
			//保存
			function saveSchoolGoodStudent(status){
				var schoolGooodStudentForm = $('#schoolGooodStudentForm');
				if(!schoolGooodStudentForm.compValid()){
					return;
				}
				schoolGooodStudentForm.append('<input name="isSubmit" type="hidden" value="'+status+'"/>');
				if(status == "1"){
					comp.confirm("申请提交后不能再修改，是否确认提交？",function(result){
						if(result){
							schoolGooodStudentForm.submit();
						}
					});
				}else{
					schoolGooodStudentForm.submit();
				}
			}
			//单选学生选择
			function selectStudentRadio(){
				_queryStudentRadioAll($("#studentId").val(),$("#teacherCollegeId").val());
			}
			function setStudentRadioSelectValue(student){
				var flag = null;
				if($("#studentId").val() != student.id){//当前选择的学生和学生文本框里边的值不相等时
					//首先验证添加的学生是否已经添加过了
					$.ajax({
						url:"${rc.contextPath}/job/schoolGoodStudent/opt-query/querySchoolGoodStudentByStuId.do",
						data:"studentId.id="+student.id,
						success:function(data){
							if(data == "success"){
								comp.message("您选择的【"+student.name+"】已经被添加过了！","error");
								flag = false;
							}else{
								flag = true;
							}
						},
						dataType:"text",
						async:false
					});
				}
				if(flag == null || !flag){//当选择的学生已经添加或者选择的学生和学生文本框里边的值相同时直接返回
					return;
				}else{
					$.ajax({
						url:"${rc.contextPath}/job/schoolGoodStudent/opt-query/queryAddStudentInfo.do",
						data:"studentId.id="+student.id,
						success:function(data){
							$.each(data,function(key,value){
								if(key == "performance"){
									var info = "";
									$.each(value,function(k,v){
										info += k +"\r\n";
										var index = 0;
										$.each(v,function(ki,vi){
											info += ki + " ： " + vi + "\t\t";
											index++;
											if(index%4 == 0){
												info += "\r\n";
											}
										});
									});
									$("#"+key).val(info);
								}else if(key == "honor"){
									var info = "";
									$.each(value,function(k,v){
										info += v.schoolYear + " ： " + v.awardName + "\r\n";
									});
									$("#"+key).val(info);
								}else{
									$("#"+key).val(data[key]);
								}
							});
						},
						dataType:"json",
						async:false
					});
				}
			}
			//返回
			function back(){
				window.location.href="${rc.contextPath}/job/schoolGoodStudent/opt-query/querySchoolGoodStudentPage.do";
			}
		</script>
		<#--脚本结束-->
	</body>
</html>