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
							校优秀毕业生查看
						</h3>
					</div>
				</div>
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
								<label>学号</label>
							</div>
							<div class="span9">
								<input id="national" value='${(schoolGoodStudentVO.studentId.id)!""}' readonly="readonly"/>
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
								<input id="national" value='${(schoolGoodStudentVO.studentId.national)!""}' readonly="readonly"/>
							</div>
						</div>
						<div class="span6">
							<div class="span3">
								<label>性别</label>
							</div>
							<div class="span9">
								<input id="sex" value='${(schoolGoodStudentVO.studentId.genderDic.name)!""}' readonly="readonly"/>
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
								<input id="birthday" value='${(schoolGoodStudentVO.studentId.brithDate?string("yyyy-MM-dd"))!""}' readonly="readonly"/>
							</div>
						</div>
						<div class="span6">
							<div class="span3">
								<label>政治面貌</label>
							</div>
							<div class="span9">
								<input id="politicalDic" value='${(schoolGoodStudentVO.studentId.politicalDic.name)!""}' readonly="readonly"/>
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
								<input id="politicalDic" value='${(schoolGoodStudentVO.studentId.classId.className)!""}' readonly="readonly"/>
							</div>
						</div>
						<div class="span6">
							<div class="span3">
								<label>专业</label>
							</div>
							<div class="span9">
								<input value='${(schoolGoodStudentVO.studentId.major.majorName)!""}' readonly="readonly" />
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
								<input id="politicalDic" value='${(schoolGoodStudentVO.studentId.college.name)!""}' readonly="readonly"/>
							</div>
						</div>
						<div class="span6">
							<div class="span3">
								<label>职务</label>
							</div>
							<div class="span9">
								<input value='${(schoolGoodStudentVO.post)!""}' readonly="readonly" />
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<label>班级排名</label>
							</div>
							<div class="span9">
								<input value='${(schoolGoodStudentVO.classSort)!""}' readonly="readonly"/>
							</div>
						</div>
						<div class="span6">
							<div class="span3">
								<label>班级人数</label>
							</div>
							<div class="span9">
								<input value='${(schoolGoodStudentVO.classNumber)!""}' readonly="readonly"/>
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<label>计算机等级</label>
							</div>
							<div class="span9">
								<input value='${(schoolGoodStudentVO.computerLevel)!""}' readonly="readonly"/>
							</div>
						</div>
						<div class="span6">
							<div class="span3">
								<label>外语等级</label>
							</div>
							<div class="span9">
								<input value='${(schoolGoodStudentVO.englishLevel)!""}' readonly="readonly"/>
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
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
								<textarea rows="5" cols="12" readonly="readonly" style="width:770px; height:200px;">${(schoolGoodStudentVO.performance)!""}</textarea>
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
								<textarea rows="5" cols="12" readonly="readonly"style="width:770px; height: 308px;">${(schoolGoodStudentVO.honor)!""}</textarea>
							</div>
						</div>
					</div>
				</div>
				<br/>
				<div class="row-fluid">
					<div class="span6">
						<div class="span3"></div>
						<div class="span9">
							<input class="btn btn-info" type="button" value="审批历史" onclick="approve.showApproveComments('${(schoolGoodStudentVO.id)!""}');"/>
							<input class="btn" type="button" value="关 闭" onclick="window.close();"/>
						</div>
					</div>
				</div>
			</div>
		</div>
		<#-- 审核历史弹出框  end-->
		<#include "/common/approve/approveComment.ftl">
	</body>
</html>