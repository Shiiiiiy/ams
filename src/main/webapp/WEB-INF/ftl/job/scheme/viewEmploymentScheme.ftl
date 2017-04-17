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
				<h3 class="heading">${(employmentSchemeVO.studentId.name)!""}同学，以下是你的就业方案信息，请仔细查看</h3>
				<input id="id" name="id" type="hidden" value='${(employmentSchemeVO.id)!""}' />
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span4">
								<label>姓名</label>
							</div>
							<div class="span8">
								<input id="name" value='${(employmentSchemeVO.studentId.name)!""}' readonly="readonly" class="span8"/>
							</div>
						</div>
						<div class="span6">
							<div class="span4">
								<label>学号</label>
							</div>
							<div class="span8">
								<input id="stuNo" value='${(employmentSchemeVO.studentId.stuNumber)!""}' readonly="readonly" class="span8"/>
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span4">
								<label>出生日期</label>
							</div>
							<div class="span8">
								<input id="birthDay" value='${(employmentSchemeVO.studentId.brithDate)!""}' readonly="readonly" class="span8"/>
							</div>
						</div>
						<div class="span6">
							<div class="span4">
								<label>身份证号</label>
							</div>
							<div class="span8">
								<input id="certificateCode" value='${(employmentSchemeVO.studentId.certificateCode)!""}' readonly="readonly" class="span8"/>
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span4">
								<label>所在班级</label>
							</div>
							<div class="span8">
								<input id="className" value="${(employmentSchemeVO.studentId.classId.className)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
						<div class="span6">
							<div class="span4">
								<label>专业</label>
							</div>
							<div class="span8">
								<input id="majorName" value="${(employmentSchemeVO.studentId.major.majorName)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span4">
								<label>所在院系</label>
							</div>
							<div class="span8">
								<input id="collegeName" value="${(employmentSchemeVO.studentId.college.name)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
						<div class="span6">
							<div class="span4">
								<label>入学时间</label>
							</div>
							<div class="span8">
								<input id="enterDate" <#if (employmentSchemeVO.studentId.enterDate)??>value="${(employmentSchemeVO.studentId.enterDate)?string('yyyy-MM')}"</#if> readonly="readonly" class="span8"/>
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span4">
								<label>家庭电话</label>
							</div>
							<div class="span8">
								<input id="homeTel" value="${(employmentSchemeVO.studentId.homeTel)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
						<div class="span6">
							<div class="span4">
								<label>手机号码</label>
							</div>
							<div class="span8">
								<input id="phone" value="${(employmentSchemeVO.studentId.phone1)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span4">
								<label>QQ号码</label>
							</div>
							<div class="span8">
								<input id="qq" value="${(employmentSchemeVO.studentId.qq)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
						<div class="span6">
							<div class="span4">
								<label>电子邮箱</label>
							</div>
							<div class="span8">
								<input id="email" value="${(employmentSchemeVO.studentId.email)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span4">
								<label>家庭邮编</label>
							</div>
							<div class="span8">
								<input id="homePostCode" value="${(employmentSchemeVO.studentId.homePostCode)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span4">
								<label>家庭地址</label>
							</div>
							<div class="span8">
								<input id="homeAddress" value="${(employmentSchemeVO.studentId.homeAddress)!""}" style="width:225%;" readonly="readonly" class="span8"/>
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span4">
								<label>考生号</label>
							</div>
							<div class="span8">
								<input name="examNo" value="${(employmentSchemeVO.examNo)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
						<div class="span6">
							<div class="span4">
								<label>政治面貌</label>
							</div>
							<div class="span8">
								<input name="political" value="${(employmentSchemeVO.political)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span4">
								<label>性别代码</label>
							</div>
							<div class="span8">
								<input name="sexCode" value="${(employmentSchemeVO.sexCode)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
						<div class="span6">
							<div class="span4">
								<label>学制</label>
							</div>
							<div class="span8">
								<input name="graduatePlan" value="${(employmentSchemeVO.graduatePlan)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
						
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span4">
								<label>生源所在地</label>
							</div>
							<div class="span8">
								<input name="sourcePlace" value="${(employmentSchemeVO.sourcePlace)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
						<div class="span6">
							<div class="span4">
								<label>生源所在地代码</label>
							</div>
							<div class="span8">
								<input name="placeCode" value="${(employmentSchemeVO.placeCode)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span4">
								<label>民族代码</label>
							</div>
							<div class="span8">
								<input name="nationCode" value="${(employmentSchemeVO.nationCode)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
						<div class="span6">
							<div class="span4">
								<label>院校代码</label>
							</div>
							<div class="span8">
								<input name="schoolCode" value="${(employmentSchemeVO.schoolCode)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span4">
								<label>院校名称</label>
							</div>
							<div class="span8">
								<input name="schoolName" value="${(employmentSchemeVO.schoolName)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
						<div class="span6">
							<div class="span4">
								<label>分校名称</label>
							</div>
							<div class="span8">
								<input name="brachSchoolName" value="${(employmentSchemeVO.brachSchoolName)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span4">
								<label>院校所在省代码</label>
							</div>
							<div class="span8">
								<input name="schoolPrivince" value="${(employmentSchemeVO.schoolPrivince)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
						<div class="span6">
							<div class="span4">
								<label>学历代码</label>
							</div>
							<div class="span8">
								<input name="educationCode" value="${(employmentSchemeVO.educationCode)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span4">
								<label>专业代码</label>
							</div>
							<div class="span8">
								<input name="majorCode" value="${(employmentSchemeVO.majorCode)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
						<div class="span6">
							<div class="span4">
								<label>专业方向</label>
							</div>
							<div class="span8">
								<input name="majorSide" value="${(employmentSchemeVO.majorSide)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span4">
								<label>培养方式代码</label>
							</div>
							<div class="span8">
								<input name="trainTypeCode" value="${(employmentSchemeVO.trainTypeCode)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
						<div class="span6">
							<div class="span4">
								<label>毕业时间</label>
							</div>
							<div class="span8">
								<input name="strGraduateTime" <#if (employmentSchemeVO.graduateTime)??> value="${(employmentSchemeVO.graduateTime)?string('yyyy-MM')}"</#if> readonly="readonly" class="span8"/>
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span4">
								<label>城乡生源</label>
							</div>
							<div class="span8">
								<input name="cityVillage" value="${(employmentSchemeVO.cityVillage)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
						<div class="span6">
							<div class="span4">
								<label>师范生类别代码</label>
							</div>
							<div class="span8">
								<input name="teachStudentTypeCode" value="${(employmentSchemeVO.teachStudentTypeCode)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span4">
								<label>困难生类别代码</label>
							</div>
							<div class="span8">
								<input name="difficultTypeCode" value="${(employmentSchemeVO.difficultTypeCode)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
						<div class="span6">
							<div class="span4">
								<label>定向或委培单位</label>
							</div>
							<div class="span8">
								<input name="trainCompany" value="${(employmentSchemeVO.trainCompany)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span4">
								<label>入学前档案所在单位</label>
							</div>
							<div class="span8">
								<input name="beforeFileCompany" value="${(employmentSchemeVO.beforeFileCompany)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
						<div class="span6">
							<div class="span4">
								<label>档案是否转入学校</label>
							</div>
							<div class="span8">
								<input name="isFileSchool" value="${(employmentSchemeVO.isFileSchool.name)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span4">
								<label>入学前户口所在地派出所</label>
							</div>
							<div class="span8">
								<input name="beforeAccountPolice" value="${(employmentSchemeVO.beforeAccountPolice)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
						<div class="span6">
							<div class="span4">
								<label>户口是否转入学校</label>
							</div>
							<div class="span8">
								<input name="isAccountSchool" value="${(employmentSchemeVO.isAccountSchool.name)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span4">
								<label>毕业去向代码</label>
							</div>
							
							<div class="span8">
								<input name="graduateCode" value="${(employmentSchemeVO.graduateCode.name)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
						<div class="span6">
							<div class="span4">
								<label>单位名称</label>
							</div>
							<div class="span8">
								<input name="companyName" value="${(employmentSchemeVO.companyName)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span4">
								<label>单位组织机构代码</label>
							</div>
							<div class="span8">
								<input name="companyOrgCode" value="${(employmentSchemeVO.companyOrgCode)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
						<div class="span6">
							<div class="span4">
								<label>单位性质代码</label>
							</div>
							<div class="span8">
								<input name="companyCode" value="${(employmentSchemeVO.companyCode)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span4">
								<label>单位行业代码</label>
							</div>
							<div class="span8">
								<input name="companyIndustryCode" value="${(employmentSchemeVO.companyIndustryCode)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
						<div class="span6">
							<div class="span4">
								<label>单位所在地代码</label>
							</div>
							<div class="span8">
								<input name="companyPlaceCode" value="${(employmentSchemeVO.companyPlaceCode)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span4">
								<label>单位所在地</label>
							</div>
							<div class="span8">
								<input name="companyPlace" value="${(employmentSchemeVO.companyPlace)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
						<div class="span6">
							<div class="span4">
								<label>工作职位类别代码</label>
							</div>
							<div class="span8">
								<input name="workTypeCode" value="${(employmentSchemeVO.workTypeCode)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span4">
								<label>单位联系人</label>
							</div>
							<div class="span8">
								<input name="companyPerson" value="${(employmentSchemeVO.companyPerson)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
						<div class="span6">
							<div class="span4">
								<label>联系人电话</label>
							</div>
							<div class="span8">
								<input name="personTelephone" value="${(employmentSchemeVO.personTelephone)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span4">
								<label>联系人手机</label>
							</div>
							<div class="span8">
								<input name="personPhone" value="${(employmentSchemeVO.personPhone)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
						<div class="span6">
							<div class="span4">
								<label>联系人电子邮箱</label>
							</div>
							<div class="span8">
								<input name="personEmail" value="${(employmentSchemeVO.personEmail)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span4">
								<label>联系人传真</label>
							</div>
							<div class="span8">
								<input name="personFax" value="${(employmentSchemeVO.personFax)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
						<div class="span6">
							<div class="span4">
								<label>单位邮编</label>
							</div>
							<div class="span8">
								<input name="compantPost" value="${(employmentSchemeVO.compantPost)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span4">
								<label>单位地址</label>
							</div>
							<div class="span8">
								<input name="companyAddress" value="${(employmentSchemeVO.companyAddress)!""}" readonly="readonly" style="width:225%;" class="span8"/>
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span4">
								<label>报到证签发类别代码</label>
							</div>
							<div class="span8">
								<input name="reportTypeCode" value="${(employmentSchemeVO.reportTypeCode)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
						<div class="span6">
							<div class="span4">
								<label>报到证签往单位名称</label>
							</div>
							<div class="span8">
								<input name="reportCompanyName" value="${(employmentSchemeVO.reportCompanyName)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span4">
								<label>签往单位所在地代码</label>
							</div>
							<div class="span8">
								<input name="reportCompanyPlaceCode" value="${(employmentSchemeVO.reportCompanyPlaceCode)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
						<div class="span6">
							<div class="span4">
								<label>签往单位所在地</label>
							</div>
							<div class="span8">
								<input name="reportCompnayPlace" value="${(employmentSchemeVO.reportCompnayPlace)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span4">
								<label>档案转寄单位名称</label>
							</div>
							<div class="span8">
								<input name="fileCompanyName" value="${(employmentSchemeVO.fileCompanyName)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
						<div class="span6">
							<div class="span4">
								<label>档案转寄单位邮编</label>
							</div>
							<div class="span8">
								<input name="fileCompanyPost" value="${(employmentSchemeVO.fileCompanyPost)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span4">
								<label>档案转寄单位地址</label>
							</div>
							<div class="span8">
								<input name="fileCompanyAddress" value="${(employmentSchemeVO.fileCompanyAddress)!""}" readonly="readonly" style="width:225%;" class="span8"/>
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span4">
								<label>户口迁移地址</label>
							</div>
							<div class="span8">
								<input name="accountAddress" value="${(employmentSchemeVO.accountAddress)!""}" readonly="readonly" style="width:225%;" class="span8"/>
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span4">
								<label>报到证编号</label>
							</div>
							<div class="span8">
								<input name="reportNo" value="${(employmentSchemeVO.reportNo)!""}" readonly="readonly" class="span8"/>
							</div>
						</div>
						<div class="span6">
							<div class="span4">
								<label>报到起始时间</label>
							</div>
							<div class="span8">
								<input name="strReportStart" class="span8" <#if (employmentSchemeVO.reportStartTime)??>value='${(employmentSchemeVO.reportStartTime)?string("yyyy-MM-dd")}'</#if> readonly="readonly" type="text" />
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span4">
								<label>就业备注1</label>
							</div>
							<div class="span8">
								<textarea name="jobCommentOne" rows="3" readonly="readonly" style="width:225%;">${(employmentSchemeVO.jobCommentOne)!""}</textarea>
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span4">
								<label>就业备注2</label>
							</div>
							<div class="span8">
								<textarea name="jobCommentTwo" rows="3" readonly="readonly" style="width:225%;">${(employmentSchemeVO.jobCommentTwo)!""}</textarea>
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span4">
								<label>就业备注3</label>
							</div>
							<div class="span8">
								<textarea name="jobCommentThree" rows="3" readonly="readonly" style="width:225%;">${(employmentSchemeVO.jobCommentThree)!""}</textarea>
							</div>
						</div>
					</div>
				</div>
				<br/>
				<div class="row-fluid">
					<div class="span6">
						<div class="span4"></div>
						<div class="span6">
							<input class="btn" type="button" value="关 闭" onclick="window.close();"/>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>