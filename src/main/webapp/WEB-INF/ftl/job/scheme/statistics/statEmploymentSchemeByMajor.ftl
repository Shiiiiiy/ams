<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="${rc.contextPath}/lib/jquery-ui/css/Aristo/Aristo.css" />
		<script src="${rc.contextPath}/lib/jquery-ui/jquery-ui-1.8.20.custom.min.js"></script>
		<link rel="stylesheet" href="${rc.contextPath}/css/bdp_comp.css" type="text/css"/>
		<!-- My97DatePicker -->
		<link rel="stylesheet" href="${rc.contextPath}/lib/My97DatePicker/skin/WdatePicker.css" />
		<script type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
		<script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
		<script src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script>
		<script src="${rc.contextPath}/lib/validation/localization/messages_cn.js"></script>
	</head>
	<body>
		<div id="contentwrapper">
			<div class="main_content">
				<div class="row-fluid">
					<#include "./employmentSchemeForm.ftl">
					<div class="row-fluid">
						<div class="span12">
							<h5 class="heading"></h5>
							<div class="dataTables_wrapper form-inline" role="grid" style="overflow-x:scroll">
								<div class="row">
									<div class="span10">
										<div class="dt_actions">
											<div class="row-fluid">
												<#if user_key.optMap??>
													<#if user_key.optMap['export']??>
														<button class="btn btn-info" type="button" onclick="exportSchoolGooodStudent();">导出</button>
													</#if>
												</#if>
											</div>
										</div>
									</div>
								</div>
								<table class="table table-bordered table-striped tablecut" id="smpl_tbl" >
									<thead>
										<th width="30px">序号</th>
										<th width="80px">学院</th>
										<th width="80px">专业</th>
										<th width="80px">学年</th>
										<th width="80px">总毕业生人数</th>
										<th width="80px">总就业人数</th>
										<th width="80px">总就业率</th>
										<th width="80px">签就业协议</th>
										<th width="80px">签劳动合同</th>
										<th width="80px">其他录用</th>
										<th width="80px">科研助理</th>
										<th width="80px">应征义务兵</th>
										<th width="80px">国家基层项目</th>
										<th width="80px">地方基层项目</th>
										<th width="80px">自主创业</th>
										<th width="80px">自由职业</th>
										<th width="80px">升学</th>
										<th width="80px">出国出境</th>
									</thead>
									<tbody>
										<#if (page)??>
											<#assign index = 1/>
											<#assign totalStuNum = 0/>
											<#assign totalJobNum = 0/>
											<#assign protocoCareerNum = 0/>
											<#assign laborCareerNum = 0/>
											<#assign otherCareerNum = 0/>
											<#assign researchAssistantNum = 0/>
											<#assign applyConscriptsNum = 0/>
											<#assign nationalBasicProjectNum = 0/>
											<#assign localBasicProjectNum = 0/>
											<#assign selfEmployedNum = 0/>
											<#assign freelanderNum = 0/>
											<#assign goHigherSchoolNum = 0/>
											<#assign goAbroadNum = 0/>
											<#list page as r>
												<#assign index = index + 1 />
												<#assign totalStuNum = totalStuNum + r.totalNum />
												<#assign totalJobNum = totalJobNum + (r.totalNum - r.noJobNum) />
												<#assign protocoCareerNum = protocoCareerNum + r.protocoCareerNum />
												<#assign laborCareerNum = laborCareerNum + r.laborCareerNum />
												<#assign otherCareerNum = otherCareerNum + r.otherCareerNum />
												<#assign researchAssistantNum = researchAssistantNum + r.researchAssistantNum />
												<#assign applyConscriptsNum = applyConscriptsNum + r.applyConscriptsNum />
												<#assign nationalBasicProjectNum = nationalBasicProjectNum + r.nationalBasicProjectNum />
												<#assign localBasicProjectNum = localBasicProjectNum + r.localBasicProjectNum />
												<#assign selfEmployedNum = selfEmployedNum + r.selfEmployedNum />
												<#assign freelanderNum = freelanderNum + r.freelanderNum />
												<#assign goHigherSchoolNum = goHigherSchoolNum + r.goHigherSchoolNum />
												<#assign goAbroadNum = goAbroadNum + r.goAbroadNum />
												<tr>
													<td class="autocut">${r_index+1}</td>
													<td class="autocut">${(r.major.collage.name)!""}</td>
													<td class="autocut">${(r.major.majorName)!""}</td>
													<td class="autocut">${(r.schoolYear.name)!""}</td>
													<td class="autocut">${(r.totalNum)!""}</td>
													<td class="autocut">${(r.totalNum - r.noJobNum)!""}</td>
													<td class="autocut"><#if r.totalNum != 0>${(((r.totalNum - r.noJobNum)/r.totalNum)*100)?string('0.00')+"%"}<#else>0.00%</#if></td>
													<td class="autocut">${r.protocoCareerNum}(<#if r.totalNum != 0>${((r.protocoCareerNum/r.totalNum)*100)?string('0.00')+"%"}<#else>0.00%</#if>)</td>
													<td class="autocut">${r.laborCareerNum}(<#if r.totalNum != 0>${((r.laborCareerNum/r.totalNum)*100)?string('0.00')+"%"}<#else>0.00%</#if>)</td>
													<td class="autocut">${r.otherCareerNum}(<#if r.totalNum != 0>${((r.otherCareerNum/r.totalNum)*100)?string('0.00')+"%"}<#else>0.00%</#if>)</td>
													<td class="autocut">${r.researchAssistantNum}(<#if r.totalNum != 0>${((r.researchAssistantNum/r.totalNum)*100)?string('0.00')+"%"}<#else>0.00%</#if>)</td>
													<td class="autocut">${r.applyConscriptsNum}(<#if r.totalNum != 0>${((r.applyConscriptsNum/r.totalNum)*100)?string('0.00')+"%"}<#else>0.00%</#if>)</td>
													<td class="autocut">${r.nationalBasicProjectNum}(<#if r.totalNum != 0>${((r.nationalBasicProjectNum/r.totalNum)*100)?string('0.00')+"%"}<#else>0.00%</#if>)</td>
													<td class="autocut">${r.localBasicProjectNum}(<#if r.totalNum != 0>${((r.localBasicProjectNum/r.totalNum)*100)?string('0.00')+"%"}<#else>0.00%</#if>)</td>
													<td class="autocut">${r.selfEmployedNum}(<#if r.totalNum != 0>${((r.selfEmployedNum/r.totalNum)*100)?string('0.00')+"%"}<#else>0.00%</#if>)</td>
													<td class="autocut">${r.freelanderNum}(<#if r.totalNum != 0>${((r.freelanderNum/r.totalNum)*100)?string('0.00')+"%"}<#else>0.00%</#if>)</td>
													<td class="autocut">${r.goHigherSchoolNum}(<#if r.totalNum != 0>${((r.goHigherSchoolNum/r.totalNum)*100)?string('0.00')+"%"}<#else>0.00%</#if>)</td>
													<td class="autocut">${r.goAbroadNum}(<#if r.totalNum != 0>${((r.goAbroadNum/r.totalNum)*100)?string('0.00')+"%"}<#else>0.00%</#if>)</td>
												</tr>
											</#list>
											<tr>
												<td class="autocut">${index}</td>
												<td class="autocut" colspan="3" style="text-align:center">总计</td>
												<td class="autocut">${totalStuNum}</td>
												<td class="autocut">${totalJobNum}</td>
												<td class="autocut"><#if totalStuNum != 0>${((totalJobNum/totalStuNum)*100)?string('0.00')+"%"}<#else>0.00%</#if></td>
												<td class="autocut">${protocoCareerNum}(<#if totalStuNum != 0>${((protocoCareerNum/totalStuNum)*100)?string('0.00')+"%"}<#else>0.00%</#if>)</td>
												<td class="autocut">${laborCareerNum}(<#if totalStuNum != 0>${((laborCareerNum/totalStuNum)*100)?string('0.00')+"%"}<#else>0.00%</#if>)</td>
												<td class="autocut">${otherCareerNum}(<#if totalStuNum != 0>${((otherCareerNum/totalStuNum)*100)?string('0.00')+"%"}<#else>0.00%</#if>)</td>
												<td class="autocut">${researchAssistantNum}(<#if totalStuNum != 0>${((researchAssistantNum/totalStuNum)*100)?string('0.00')+"%"}<#else>0.00%</#if>)</td>
												<td class="autocut">${applyConscriptsNum}(<#if totalStuNum != 0>${((applyConscriptsNum/totalStuNum)*100)?string('0.00')+"%"}<#else>0.00%</#if>)</td>
												<td class="autocut">${nationalBasicProjectNum}(<#if totalStuNum != 0>${((nationalBasicProjectNum/totalStuNum)*100)?string('0.00')+"%"}<#else>0.00%</#if>)</td>
												<td class="autocut">${localBasicProjectNum}(<#if totalStuNum != 0>${((localBasicProjectNum/totalStuNum)*100)?string('0.00')+"%"}<#else>0.00%</#if>)</td>
												<td class="autocut">${selfEmployedNum}(<#if totalStuNum != 0>${((selfEmployedNum/totalStuNum)*100)?string('0.00')+"%"}<#else>0.00%</#if>)</td>
												<td class="autocut">${freelanderNum}(<#if totalStuNum != 0>${((freelanderNum/totalStuNum)*100)?string('0.00')+"%"}<#else>0.00%</#if>)</td>
												<td class="autocut">${goHigherSchoolNum}(<#if totalStuNum != 0>${((goHigherSchoolNum/totalStuNum)*100)?string('0.00')+"%"}<#else>0.00%</#if>)</td>
												<td class="autocut">${goAbroadNum}(<#if totalStuNum != 0>${((goAbroadNum/totalStuNum)*100)?string('0.00')+"%"}<#else>0.00%</#if>)</td>
											</tr>
										</#if>
										<input id="pageTotalCount" name="pageTotalCount" type="hidden"  value="${index}"/>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>