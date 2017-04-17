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
							<#if (employmentSchemeVO.id)??>
								就业方案修改
							<#else>
								就业方案新增
							</#if>
						</h3>
					</div>
				</div>
				<form id="employmentSchemeForm" method="post" action="${rc.contextPath}/job/employmentScheme/opt-save/saveEmploymentSchemeInfo.do">
					<input id="id" name="id" type="hidden" value='${(employmentSchemeVO.id)!""}' />
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span4">
									<label>姓名<span class="f_req">*</span></label>
								</div>
								<div class="span8">
									<input id="name" name="stuName" value='${(employmentSchemeVO.studentId.name)!""}' readonly="readonly" class="span8"/>
									<input id="stuId" name="studentId.id" value='${(employmentSchemeVO.studentId.id)!""}' type="hidden"/>
									<#if (employmentSchemeVO.id)??>
									<#else>
										<a id="course-lecture-select"  style="margin-left: -4px;margin-top: -10px;" href="javascript:void(0);" onclick="selectStudentRadio();" class="btn"><i class="icon-search"></i></a>
									</#if>
									<input id="teacherCollegeId" type="hidden" value="${teacherCollegeId!""}"/>
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
									<input id="enterDate" <#if (employmentSchemeVO.studentId.enterDate)??>value="${(employmentSchemeVO.studentId.enterDate)?string('yyyyMM')}"</#if> readonly="readonly" class="span8"/>
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
									<input name="examNo" value="${(employmentSchemeVO.examNo)!""}"  class="span8"/>
								</div>
							</div>
							<div class="span6">
								<div class="span4">
									<label>政治面貌</label>
								</div>
								<div class="span8">
									<input name="political" value="${(employmentSchemeVO.political)!""}" class="span8"/>
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
									<input name="sexCode" value="${(employmentSchemeVO.sexCode)!""}"  class="span8"/>
								</div>
							</div>
							<div class="span6">
								<div class="span4">
									<label>学制</label>
								</div>
								<div class="span8">
									<input name="graduatePlan" value="${(employmentSchemeVO.graduatePlan)!""}" class="span8"/>
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
									<input name="sourcePlace" value="${(employmentSchemeVO.sourcePlace)!""}" class="span8"/>
								</div>
							</div>
							<div class="span6">
								<div class="span4">
									<label>生源所在地代码</label>
								</div>
								<div class="span8">
									<input name="placeCode" value="${(employmentSchemeVO.placeCode)!""}"  class="span8"/>
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
									<input name="nationCode" value="${(employmentSchemeVO.nationCode)!""}"  class="span8"/>
								</div>
							</div>
							<div class="span6">
								<div class="span4">
									<label>院校代码</label>
								</div>
								<div class="span8">
									<input name="schoolCode" value="${(employmentSchemeVO.schoolCode)!""}"  class="span8"/>
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
									<input name="schoolName" value="${(employmentSchemeVO.schoolName)!""}"  class="span8"/>
								</div>
							</div>
							<div class="span6">
								<div class="span4">
									<label>分校名称</label>
								</div>
								<div class="span8">
									<input name="brachSchoolName" value="${(employmentSchemeVO.brachSchoolName)!""}"  class="span8"/>
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
									<input name="schoolPrivince" value="${(employmentSchemeVO.schoolPrivince)!""}"  class="span8"/>
								</div>
							</div>
							<div class="span6">
								<div class="span4">
									<label>学历代码</label>
								</div>
								<div class="span8">
									<input name="educationCode" value="${(employmentSchemeVO.educationCode)!""}"  class="span8"/>
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
									<input name="majorCode" value="${(employmentSchemeVO.majorCode)!""}"  class="span8"/>
								</div>
							</div>
							<div class="span6">
								<div class="span4">
									<label>专业方向</label>
								</div>
								<div class="span8">
									<input name="majorSide" value="${(employmentSchemeVO.majorSide)!""}"  class="span8"/>
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
									<input name="trainTypeCode" value="${(employmentSchemeVO.trainTypeCode)!""}"  class="span8"/>
								</div>
							</div>
							<div class="span6">
								<div class="span4">
									<label>毕业时间</label>
								</div>
								<div class="span8">
									<input name="strGraduateTime" class="span8 Wdate" style="cursor:pointer;" <#if (employmentSchemeVO.graduateTime)??>value='${(employmentSchemeVO.graduateTime)?string("yyyy-MM")}'</#if> type="text" onclick="WdatePicker({dateFmt:'yyyy-MM',skin:'whyGreen'});" />
									<#--
									<input name="strGraduateTime" value="${(employmentSchemeVO.graduateTime)!""}" class="span8"/>
									-->
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
									<input name="cityVillage" value="${(employmentSchemeVO.cityVillage)!""}"  class="span8"/>
								</div>
							</div>
							<div class="span6">
								<div class="span4">
									<label>师范生类别代码</label>
								</div>
								<div class="span8">
									<input name="teachStudentTypeCode" value="${(employmentSchemeVO.teachStudentTypeCode)!""}"  class="span8"/>
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
									<input name="difficultTypeCode" value="${(employmentSchemeVO.difficultTypeCode)!""}"  class="span8"/>
								</div>
							</div>
							<div class="span6">
								<div class="span4">
									<label>定向或委培单位</label>
								</div>
								<div class="span8">
									<input name="trainCompany" value="${(employmentSchemeVO.trainCompany)!""}"  class="span8"/>
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
									<input name="beforeFileCompany" value="${(employmentSchemeVO.beforeFileCompany)!""}"  class="span8"/>
								</div>
							</div>
							<div class="span6">
								<div class="span4">
									<label>档案是否转入学校</label>
								</div>
								<div class="span8">
									<#--
									<input name="isFileSchool" value="${(employmentSchemeVO.isFileSchool.name)!""}"  class="span8"/>
									-->
									<#if yesOrNoList??>
										<#list yesOrNoList as yesOrNo>
											<#if (employmentSchemeVO.id)?? && (employmentSchemeVO.isFileSchool.id)??>
												<#if employmentSchemeVO.isFileSchool.id == yesOrNo.id>
													<label class="radio inline">
														<input name="isFileSchool.id" type="radio" checked="checked" value="${yesOrNo.id}"/>${yesOrNo.name}
													</label>
												<#else>
													<label class="radio inline">
														<input name="isFileSchool.id" type="radio" value="${yesOrNo.id}"/>${yesOrNo.name}
													</label>
												</#if>
											<#else>
												<label class="radio inline">
													<input name="isFileSchool.id" type="radio" value="${yesOrNo.id}"/>${yesOrNo.name}
												</label>
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
									<label>入学前户口所在地派出所</label>
								</div>
								<div class="span8">
									<input name="beforeAccountPolice" value="${(employmentSchemeVO.beforeAccountPolice)!""}"  class="span8"/>
								</div>
							</div>
							<div class="span6">
								<div class="span4">
									<label>户口是否转入学校</label>
								</div>
								<div class="span8">
									<#--
									<input name="isAccountSchool" value="${(employmentSchemeVO.isAccountSchool.name)!""}"  class="span8"/>
									-->
									<#if yesOrNoList??>
										<#list yesOrNoList as yesOrNo>
											<#if (employmentSchemeVO.id)?? && (employmentSchemeVO.isAccountSchool.id)??>
												<#if employmentSchemeVO.isAccountSchool.id == yesOrNo.id>
													<label class="radio inline">
														<input name="isAccountSchool.id" type="radio" checked="checked" value="${yesOrNo.id}"/>${yesOrNo.name}
													</label>
												<#else>
													<label class="radio inline">
														<input name="isAccountSchool.id" type="radio" value="${yesOrNo.id}"/>${yesOrNo.name}
													</label>
												</#if>
											<#else>
												<label class="radio inline">
													<input name="isAccountSchool.id" type="radio" value="${yesOrNo.id}"/>${yesOrNo.name}
												</label>
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
									<label>毕业去向代码</label>
								</div>
								
								<div class="span8">
									<#--<input name="graduateCode" value="${(employmentSchemeVO.graduateCode.name)!""}"  class="span8"/>-->
									<select name="graduateCode.id" aria-controls="dt_gal" class="span8">
										<option value="">请选择</option>
										<#list graduateCodeList as graduateCode>
											<#if (employmentSchemeVO.graduateCode)?? && employmentSchemeVO.graduateCode.id == graduateCode.id>
												<option value="${graduateCode.id}" selected="selected">${graduateCode.name}</option>
											<#else>
												<option value="${graduateCode.id}">${graduateCode.name}</option>
											</#if>
										</#list>
									</select>
								</div>
							</div>
							<div class="span6">
								<div class="span4">
									<label>单位名称</label>
								</div>
								<div class="span8">
									<input name="companyName" value="${(employmentSchemeVO.companyName)!""}"  class="span8"/>
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
									<input name="companyOrgCode" value="${(employmentSchemeVO.companyOrgCode)!""}"  class="span8"/>
								</div>
							</div>
							<div class="span6">
								<div class="span4">
									<label>单位性质代码</label>
								</div>
								<div class="span8">
									<input name="companyCode" value="${(employmentSchemeVO.companyCode)!""}"  class="span8"/>
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
									<input name="companyIndustryCode" value="${(employmentSchemeVO.companyIndustryCode)!""}"  class="span8"/>
								</div>
							</div>
							<div class="span6">
								<div class="span4">
									<label>单位所在地代码</label>
								</div>
								<div class="span8">
									<input name="companyPlaceCode" value="${(employmentSchemeVO.companyPlaceCode)!""}"  class="span8"/>
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
									<input name="companyPlace" value="${(employmentSchemeVO.companyPlace)!""}"  class="span8"/>
								</div>
							</div>
							<div class="span6">
								<div class="span4">
									<label>工作职位类别代码</label>
								</div>
								<div class="span8">
									<input name="workTypeCode" value="${(employmentSchemeVO.workTypeCode)!""}"  class="span8"/>
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
									<input name="companyPerson" value="${(employmentSchemeVO.companyPerson)!""}"  class="span8"/>
								</div>
							</div>
							<div class="span6">
								<div class="span4">
									<label>联系人电话</label>
								</div>
								<div class="span8">
									<input name="personTelephone" value="${(employmentSchemeVO.personTelephone)!""}"  class="span8"/>
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
									<input name="personPhone" value="${(employmentSchemeVO.personPhone)!""}"  class="span8"/>
								</div>
							</div>
							<div class="span6">
								<div class="span4">
									<label>联系人电子邮箱</label>
								</div>
								<div class="span8">
									<input name="personEmail" value="${(employmentSchemeVO.personEmail)!""}"  class="span8"/>
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
									<input name="personFax" value="${(employmentSchemeVO.personFax)!""}"  class="span8"/>
								</div>
							</div>
							<div class="span6">
								<div class="span4">
									<label>单位邮编</label>
								</div>
								<div class="span8">
									<input name="compantPost" value="${(employmentSchemeVO.compantPost)!""}"  class="span8"/>
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
									<input name="companyAddress" value="${(employmentSchemeVO.companyAddress)!""}" style="width:225%;" class="span8"/>
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
									<input name="reportTypeCode" value="${(employmentSchemeVO.reportTypeCode)!""}"  class="span8"/>
								</div>
							</div>
							<div class="span6">
								<div class="span4">
									<label>报到证签往单位名称</label>
								</div>
								<div class="span8">
									<input name="reportCompanyName" value="${(employmentSchemeVO.reportCompanyName)!""}"  class="span8"/>
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
									<input name="reportCompanyPlaceCode" value="${(employmentSchemeVO.reportCompanyPlaceCode)!""}"  class="span8"/>
								</div>
							</div>
							<div class="span6">
								<div class="span4">
									<label>签往单位所在地</label>
								</div>
								<div class="span8">
									<input name="reportCompnayPlace" value="${(employmentSchemeVO.reportCompnayPlace)!""}"  class="span8"/>
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
									<input name="fileCompanyName" value="${(employmentSchemeVO.fileCompanyName)!""}"  class="span8"/>
								</div>
							</div>
							<div class="span6">
								<div class="span4">
									<label>档案转寄单位邮编</label>
								</div>
								<div class="span8">
									<input name="fileCompanyPost" value="${(employmentSchemeVO.fileCompanyPost)!""}"  class="span8"/>
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
									<input name="fileCompanyAddress" value="${(employmentSchemeVO.fileCompanyAddress)!""}" style="width:225%;" class="span8"/>
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
									<input name="accountAddress" value="${(employmentSchemeVO.accountAddress)!""}" style="width:225%;" class="span8"/>
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
									<input name="reportNo" value="${(employmentSchemeVO.reportNo)!""}"  class="span8"/>
								</div>
							</div>
							<div class="span6">
								<div class="span4">
									<label>报到起始时间</label>
								</div>
								<div class="span8">
									<input name="strReportStart" class="span8 Wdate" style="cursor:pointer;" <#if (employmentSchemeVO.reportStartTime)??>value='${(employmentSchemeVO.reportStartTime)?string("yyyy-MM-dd")}'</#if> type="text" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',skin:'whyGreen'});" />
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
									<textarea name="jobCommentOne" rows="3" style="width:225%;">${(employmentSchemeVO.jobCommentOne)!""}</textarea>
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
									<textarea name="jobCommentTwo" rows="3" style="width:225%;">${(employmentSchemeVO.jobCommentTwo)!""}</textarea>
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
									<textarea name="jobCommentThree" rows="3" style="width:225%;">${(employmentSchemeVO.jobCommentThree)!""}</textarea>
								</div>
							</div>
						</div>
					</div>
					<br/>
					<div class="row-fluid" >
						<div class="span6">
							<div class="span4"></div>
							<div class="span6">
								<input class="btn btn-info" type="button" value="保 存" onclick="saveEmploymentScheme();"/>
								<input class="btn" type="button" value="返 回" onclick="back();"/>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
		<#-- 学生选择单选组件的引入 -->
		<#include "/comp/student/queryGraduateStudentRadioModal.ftl">
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
			//前台验证 
			$('#employmentSchemeForm').compValidate({
				rules: {
					stuName : {required : true},
					examNo : {maxlength : 50},
					political : {maxlength : 50},
					sexCode : {maxlength : 10},
					nationCode : {maxlength : 10},
					schoolName : {maxlength : 100},
					brachSchoolName : {maxlength : 100},
					schoolCode : {maxlength : 50},
					schoolPrivince : {maxlength : 50},
					educationCode : {maxlength : 50},
					majorCode : {maxlength : 50},
					majorSide : {maxlength : 50},
					placeCode : {maxlength : 50},
					trainTypeCode : {maxlength : 50},
					cityVillage : {maxlength : 50},
					teachStudentTypeCode : {maxlength : 50},
					difficultTypeCode : {maxlength : 50},
					trainCompany : {maxlength : 100},
					beforeFileCompany : {maxlength : 100},
					beforeAccountPolice : {maxlength : 100},
					companyName : {maxlength : 100},
					companyOrgCode : {maxlength : 50},
					companyCode : {maxlength : 50},
					companyIndustryCode : {maxlength : 50},
					companyPlaceCode : {maxlength : 50},
					companyPlace : {maxlength : 500},
					workTypeCode : {maxlength : 50},
					companyPerson : {maxlength : 50},
					personTelephone : {maxlength : 50},
					personPhone : {maxlength : 50},
					personEmail : {maxlength : 100},
					personFax : {maxlength : 50},
					companyAddress : {maxlength : 500},
					compantPost : {maxlength : 50},
					reportTypeCode : {maxlength : 50},
					reportCompanyName : {maxlength : 100},
					reportCompanyPlaceCode : {maxlength : 50},
					reportCompnayPlace : {maxlength : 100},
					fileCompanyName : {maxlength : 100},
					fileCompanyAddress : {maxlength : 500},
					fileCompanyPost : {maxlength : 50},
					accountAddress : {maxlength : 500},
					reportNo : {maxlength : 50},
					jobCommentOne : {maxlength : 500},
					jobCommentTwo : {maxlength : 500},
					jobCommentThree : {maxlength : 500},
					graduatePlan : {maxlength : 10},
					sourcePlace : {maxlength : 100}
				},messages:{
					stuName : {required : "姓名为必填项"},
					examNo : {maxlength : "考生号为长度不超过50位"},
					political : {maxlength : "政治面貌为长度不超过50位"},
					sexCode : {maxlength : "性别代码为长度不超过10位"},
					nationCode : {maxlength : "民族代码为长度不超过10位"},
					schoolName : {maxlength : "院校名称为长度不超过100位"},
					brachSchoolName : {maxlength : "分校名称为长度不超过100位"},
					schoolCode : {maxlength : "院校代码为长度不超过50位"},
					schoolPrivince : {maxlength : "院校所在省代码为长度不超过50位"},
					educationCode : {maxlength : "学历代码为长度不超过50位"},
					majorCode : {maxlength : "专业代码为长度不超过50位"},
					majorSide : {maxlength : "专业方向为长度不超过50位"},
					placeCode : {maxlength : "生源所在地代码为长度不超过50位"},
					trainTypeCode : {maxlength : "培养方式代码为长度不超过50位"},
					cityVillage : {maxlength : "城乡生源为长度不超过50位"},
					teachStudentTypeCode : {maxlength : "师范生类别代码为长度不超过50位"},
					difficultTypeCode : {maxlength : "困难生类别代码为长度不超过50位"},
					trainCompany : {maxlength : "定向或委培单位为长度不超过100位"},
					beforeFileCompany : {maxlength : "入学前档案所在单位为长度不超过100位"},
					beforeAccountPolice : {maxlength : "入学前户口所在地派出所为长度不超过100位"},
					companyName : {maxlength : "单位名称为长度不超过100位"},
					companyOrgCode : {maxlength : "单位组织机构代码为长度不超过50位"},
					companyCode : {maxlength : "单位性质代码为长度不超过50位"},
					companyIndustryCode : {maxlength : "单位行业代码为长度不超过50位"},
					companyPlaceCode : {maxlength : "单位所在地代码为长度不超过50位"},
					companyPlace : {maxlength : "单位所在地为长度不超过500位"},
					workTypeCode : {maxlength : "工作职位类别代码为长度不超过50位"},
					companyPerson : {maxlength : "单位联系人为长度不超过50位"},
					personTelephone : {maxlength : "联系人电话为长度不超过50位"},
					personPhone : {maxlength : "联系人手机为长度不超过50位"},
					personEmail : {maxlength : "联系人电子邮箱为长度不超过100位"},
					personFax : {maxlength : "联系人传真为长度不超过50位"},
					companyAddress : {maxlength : "单位地址为长度不超过500位"},
					compantPost : {maxlength : "单位邮编为长度不超过50位"},
					reportTypeCode : {maxlength : "报到证签发类别代码为长度不超过50位"},
					reportCompanyName : {maxlength : "报到证签往单位名称为长度不超过100位"},
					reportCompanyPlaceCode : {maxlength : "签往单位所在地代码为长度不超过50位"},
					reportCompnayPlace : {maxlength : "签往单位所在地为长度不超过100位"},
					fileCompanyName : {maxlength : "档案转寄单位名称为长度不超过100位"},
					fileCompanyAddress : {maxlength : "档案转寄单位地址为长度不超过500位"},
					fileCompanyPost : {maxlength : "档案转寄单位邮编为长度不超过50位"},
					accountAddress : {maxlength : "户口迁移地址为长度不超过500位"},
					reportNo : {maxlength : "报到证编号为长度不超过50位"},
					jobCommentOne : {maxlength : "就业备注1为长度不超过500位"},
					jobCommentTwo : {maxlength : "就业备注2为长度不超过500位"},
					jobCommentThree : {maxlength : "就业备注3为长度不超过500位"},
					graduatePlan : {maxlength : "学制为长度不超过10位"},
					sourcePlace : {maxlength : "生源所在地为长度不超过100位"}
				}
			});
			//保存 
			function saveEmploymentScheme(){
				var employmentSchemeForm = $('#employmentSchemeForm');
				if(!employmentSchemeForm.compValid()){
					return;
				}
				employmentSchemeForm.submit();
			}
			// 单选学生选择
			function selectStudentRadio(){
				_queryStudentRadioAll($("#studentId").val(),$("#teacherCollegeId").val());
			}
			function setStudentRadioSelectValue(student){
				if(student.id != null || student.id.length > 0){
					var flag = isExitEmploymentSchemeInfo(student.id,student.name);
					if(flag){
						
						$.each(student,function(k,v){
							if(k == "id"){
								$("#stuNo").val(student.id);
								$("#stuId").val(student.id);
							}else{
								if(k == "enterDate"){
									if(v != ""){
										$("#"+k).val(v.substr(0,7));
									}else{
										$("#"+k).val("");
									}
								}else{
									$("#"+k).val(v);
								}
							}
							
						});
					}
				}
			}
			//判断添加的学生是否存在
			function isExitEmploymentSchemeInfo(stuNo,stuName){
				var flag = false;
				$.ajax({
					url:"${rc.contextPath}/job/employmentScheme/opt-query/isExitEmploymentSchemeInfo.do",
					data:{'studentId.id':stuNo},
					success:function(data){
						if(data == "false"){
							flag =  true;//不存在
						}else{
							flag =  false;//存在
							comp.message("您选择的【"+stuName+"】已经被添加过了！","error");
						}
					},
					dataType:"text",
					type:"POST",
					async:false
				});
				return flag;
			}
			//返回
			function back(){
				window.location.href="${rc.contextPath}/job/employmentScheme/opt-query/queryEmploymentSchemeList.do";
			}
		</script>
		<#--脚本结束-->
	</body>
</html>