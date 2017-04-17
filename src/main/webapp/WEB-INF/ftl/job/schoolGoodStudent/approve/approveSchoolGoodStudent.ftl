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
		<script src="${rc.contextPath}/js/common/common_approve.js"></script>
	</head>
	<body>
		<div id="contentwrapper">
			<div class="main_content">
				<div class="row-fluid">
					<div class="span12">
						<h3 class="heading">
							校优秀毕业生审核
						</h3>
					</div>
				</div>
				<form id="schoolGooodStudentForm" method="post" action="${rc.contextPath}/job/approveSchoolGoodStudent/opt-save/saveApproveSchoolGoodStudent.do">
					<input id="id" name="id" type="hidden" value='${(schoolGoodStudentVO.id)!""}' />
					<input id="approveStatus" name="approveStatus" type="hidden" />
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<label>学生姓名</label>
								</div>
								<div class="span9">
									<input id="stuName" value='${(schoolGoodStudentVO.studentId.name)!""}' readonly="readonly"/>
								</div>
							</div>
							 <div class="span6">
								<div class="span3">
									<label>民族</label>
								</div>
								<div class="span9">
									<input id="national" value='${(schoolGoodStudentVO.studentId.national)!""}' readonly="readonly"/>
								</div>
							</div>
						</div>
					</div>
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<label>性别</label>
								</div>
								<div class="span9">
									<input id="sex" value='${(schoolGoodStudentVO.studentId.genderDic.name)!""}' readonly="readonly"/>
								</div>
							</div>
							<div class="span6">
								<div class="span3">
									<label>出生年月</label>
								</div>
								<div class="span9">
									<input id="birthday" value='${(schoolGoodStudentVO.studentId.brithDate?string("yyyy-MM-dd"))!""}' readonly="readonly"/>
								</div>
							</div>
						</div>
					</div>
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<label>政治面貌</label>
								</div>
								<div class="span9">
									<input id="politicalDic" value='${(schoolGoodStudentVO.studentId.politicalDic.name)!""}' readonly="readonly"/>
								</div>
							</div>
							<div class="span6">
								<div class="span3">
									<label>班级</label>
								</div>
								<div class="span9">
									<input id="politicalDic" value='${(schoolGoodStudentVO.studentId.classId.className)!""}' readonly="readonly"/>
								</div>
							</div>
							
						</div>
					</div>
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<label>专业</label>
								</div>
								<div class="span9">
									<input value='${(schoolGoodStudentVO.studentId.major.majorName)!""}' readonly="readonly" />
								</div>
							</div>
							<div class="span6">
								<div class="span3">
									<label>学院</label>
								</div>
								<div class="span9">
									<input id="politicalDic" value='${(schoolGoodStudentVO.studentId.college.name)!""}' readonly="readonly"/>
								</div>
							</div>
						</div>
					</div>
					<div class="formSep">
						<div class="row-fluid">
							
							<div class="span6">
								<div class="span3">
									<label>职务</label>
								</div>
								<div class="span9">
									<input value='${(schoolGoodStudentVO.post)!""}' readonly="readonly" />
								</div>
							</div>
							<div class="span6">
								<div class="span3">
									<label>班级排名</label>
								</div>
								<div class="span9">
									<input value='${(schoolGoodStudentVO.classSort)!""}' readonly="readonly"/>
								</div>
							</div>
						</div>
					</div>
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<label>班级人数</label>
								</div>
								<div class="span9">
									<input value='${(schoolGoodStudentVO.classNumber)!""}' readonly="readonly"/>
								</div>
							</div>
							<div class="span6">
								<div class="span3">
									<label>计算机等级</label>
								</div>
								<div class="span9">
									<input value='${(schoolGoodStudentVO.computerLevel)!""}' readonly="readonly"/>
								</div>
							</div>
						</div>
					</div>
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<label>外语等级</label>
								</div>
								<div class="span9">
									<input value='${(schoolGoodStudentVO.englishLevel)!""}' readonly="readonly"/>
								</div>
							</div>
							<div class="span6">
								<div class="span3">
									<label>总成绩平均分</label>
								</div>
								<div class="span9">
									<input value='<#if (schoolGoodStudentVO.avgScore)?? >${(schoolGoodStudentVO.avgScore)?string(".00")}<#else>0.00</#if>' readonly="readonly"/>
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
									<textarea rows="5" cols="12" readonly="readonly" style="width:809px; height:200px;">${(schoolGoodStudentVO.performance)!""}</textarea>
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
									<textarea rows="5" cols="12" readonly="readonly"style="width:809px; height: 308px;">${(schoolGoodStudentVO.honor)!""}</textarea>
								</div>
							</div>
						</div>
					</div>
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<label>审核意见</label>
								</div>
								<div class="span9">
									<textarea  id="approveReason" name="approveReason" rows="5" cols="12" style="width:809px; height: 100px;"></textarea>
								</div>
							</div>
						</div>
					</div>
					<br/>
					<div class="row-fluid">
						<div class="span6">
							<div class="span3"></div>
							<div class="span6">
								<input class="btn btn-info" type="button" value="通 过" onclick="approveSchoolGoodStudent('PASS');"/>
								<input class="btn btn-info" type="button" value="拒 绝" onclick="approveSchoolGoodStudent('REJECT');"/>
								<input class="btn btn-info" type="button" value="审批历史" onclick="approve.showApproveComments('${(schoolGoodStudentVO.id)!""}');"/>
								<input class="btn" type="button" value="返 回" onclick="back();"/>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		<#-- 审核历史弹出框  end-->
		<#include "/common/approve/approveComment.ftl">
		<#-- 审核历史查看 -->
		<#include "/apw/instance/approveHistory.ftl">
		<#--脚本开始-->
		<script type="text/javascript">
			$("#schoolGooodStudentForm").compValidate({
				rules: {
					approveReason: {maxlength : 500}
				},
				messages:{
					approveReason: {maxlength : "审核意见最大长度为500位"}
				}
			});
			//审批
			function approveSchoolGoodStudent(status){
				var schoolGooodStudentForm = $('#schoolGooodStudentForm');
				if(!schoolGooodStudentForm.compValid()){
					return;
				}
				if(status == "PASS"){//通过
				 fillDefaltMessage("通过");
					comp.confirm("确定要通过？",function(result){
						if(result){
							$("#approveStatus").val("PASS");
							schoolGooodStudentForm.submit();
						}
					});
				}
				if(status == "REJECT"){//拒绝
				     fillDefaltMessage("拒绝");
					comp.confirm("确定要拒绝？",function(result){
						if(result){
							$("#approveStatus").val("REJECT");
							schoolGooodStudentForm.submit();
						}
					});
				}
				/*if(status == "PASS"){//通过
					if(confirm("确定要通过？")){
						$("#approveStatus").val("PASS");
						schoolGooodStudentForm.submit();
					}
				}
				if(status == "REJECT"){//拒绝
					if(confirm("确定要驳回？")){
						$("#approveStatus").val("REJECT");
						schoolGooodStudentForm.submit();
					}
				}*/
			}
					
			/**
			  * 为审批意见默认赋值
			  */
			function fillDefaltMessage(defultMsg){
			    var curMsg = $.trim($("#approveReason").val());
				if(comp.isNull(curMsg)){
					$("#approveReason").val(defultMsg);
				}
			}	
			
			
			//返回
			function back(){
				window.location.href="${rc.contextPath}/job/approveSchoolGoodStudent/opt-query/approveSchoolGoodStudentPage.do";
			}
		</script>
		<#--脚本结束-->
	</body>
</html>