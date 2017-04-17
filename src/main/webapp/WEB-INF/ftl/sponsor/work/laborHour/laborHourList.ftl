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
					<form id="queryLaborHourInfoForm" method="post" action="${rc.contextPath}/sponsor/laborHour/opt-query/queryLaborHourList.do">
						<div class="row-fluid">
							<div class="span12">
								<div class="row-fluid">
									<div class="span4">
										<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学院</span>
										<select id="radioCollegeId" name="studentId.college.id" aria-controls="dt_gal" class="span6" onchange="cascade.changeCollage('radioCollegeId','radioMajor','radioClass');">
											<option value="">请选择</option>
											<#list collegess as college>
												<#if (workHourModelVO.studentId.college)?? && workHourModelVO.studentId.college.id == college.id>
													<option value="${college.id}" selected="selected">${college.name}</option>
												<#else>
													<option value="${college.id}">${college.name}</option>
												</#if>
											</#list>
										</select>
									</div>
									<div class="span4">
										<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;专业</span>
										<select id="radioMajor" name="studentId.major.id" aria-controls="dt_gal" class="span6 emptySelect" onchange="cascade.changeMajor('radioMajor','radioClass');">
											<option value="">请选择</option>
											<#list majors as major>
												<#if (workHourModelVO.studentId.major)?? && workHourModelVO.studentId.major.id == major.id>
													<option value="${major.id}" selected="selected">${major.majorName}</option>
												<#else>
													<option value="${major.id}">${major.majorName}</option>
												</#if>
											</#list>
										</select>
									</div>
									<div class="span4">
										<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;班级</span>
										<select id="radioClass" name="studentId.classId.id" size="1" aria-controls="dt_gal" class="span6 emptySelect">
											<option value="">请选择</option>
											<#list classes as clazz>
												<#if (workHourModelVO.studentId.classId)?? && workHourModelVO.studentId.classId.id == clazz.id>
													<option value="${clazz.id}" selected="selected">${clazz.className}</option>
												<#else>
													<option value="${clazz.id}">${clazz.className}</option>
												</#if>
											</#list>
										<select>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span4">
										<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;姓名</span>
										<input id="stuName" name="studentId.name" class="span6" value="${(workHourModelVO.studentId.name)!""}"/>
									</div>
									<div class="span4">
										<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学号</span>
										<input id="stuNo" name="studentId.stuNumber" class="span6" value="${(workHourModelVO.studentId.stuNumber)!""}"/>
									</div>
									<div class="span4">
										<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年份</span>
										<input id="workMonth" name="orgWorkHour.workYear" class="span6 Wdate" style="cursor:pointer;" type="text" value="${(workHourModelVO.orgWorkHour.workYear)!""}" onclick="WdatePicker({dateFmt:'yyyy',skin:'whyGreen'});" />
									</div>
								</div>
								<div class="row-fluid">
									<div class="span4">
										<span class="formTitle">用工部门</span>
										<#if isSchoolTeacher==2>
											<input id="orgName" name="orgWorkHour.orgId.name" class="span6 notClear" type="text" readonly="readonly" value="${(workHourModelVO.orgWorkHour.orgId.name)!""}"/>
											<input id="orgId" name="orgWorkHour.orgId.id" class="span6 notClear" type="hidden" value="${(workHourModelVO.orgWorkHour.orgId.id)!""}"/>
										<#else>
											<select size="1" name="orgWorkHour.orgId.id" aria-controls="dt_gal" class="span6">
												<option value="">请选择</option>
												<#list orgs as org>
													<#if (workHourModelVO.orgWorkHour.orgId.id)?? && workHourModelVO.orgWorkHour.orgId.id == org.id>
														<option value="${org.id}" selected="selected">${org.name}</option>
													<#else>
														<option value="${org.id}">${org.name}</option>
													</#if>
												</#list>
											</select>
										</#if>
									</div>
									<div class="span4">
										<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;岗位</span>
										<input name="sponsorPosition.workName" class="span6" type="text" value="${(workHourModelVO.sponsorPosition.workName)!""}"/>
										<#--
										<select size="1" name="sponsorPosition.positionId" aria-controls="dt_gal" class="span6">
											<option value="">请选择</option>
										</select>
										-->
									</div>
									<div class="span4">
										<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月份</span>
										<input id="workMonth" name="orgWorkHour.workMonth" class="span6 Wdate" style="cursor:pointer;" type="text" value="${(workHourModelVO.orgWorkHour.workMonth)!""}" onclick="WdatePicker({dateFmt:'MM',skin:'whyGreen'});" />
									</div>
								</div>
								<div class="row-fluid">
									<div class="span4">
									</div>
									<div class="span4">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<#--查询时首先更改 form的action的值-->
										<input type="submit" class="btn btn-info" value="查 询" onclick="queryLaborHour();"/>
										<input type="button" class="btn btn-info" onclick="comp.clearForm('queryLaborHourInfoForm');" value="清 空">
									</div>
								</div>
							</div>
						</div>
					</form>
					<div class="row-fluid">
						<div class="span12">
							<h5 class="heading"></h5>
							<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
								<div class="row">
									<div class="span10">
										<div class="dt_actions">
											<div class="row-fluid">
												<#if user_key.optMap??>
													<#if user_key.optMap['export']??>
														<button class="btn btn-info" type="button" onclick="exportLaborHourInfo();">导 出</button>
													</#if>
												</#if>
											</div>
										</div>
									</div>
								</div>
								<table class="table table-bordered table-striped tablecut" id="smpl_tbl" >
									<thead>
										<th width="5%">序号</th>
										<th width="10%">学号</th>
										<th width="10%">姓名</th>
										<th width="10%">用工部门</th>
										<th width="23%">岗位</th>
										<th width="5%">年份</th>
										<th width="5%">月份</th>
										<th width="8%">岗位工资</th>
										<th width="8%">岗位工时</th>
										<th width="8%">工资小计</th>
										<th width="8%">审核状态</th>
									</thead>
									<tbody>
										<#if (page.result)??>
											<#list page.result as r>
												<tr>
													<td class="autocut">${r_index+1}</td>
													<td class="autocut">${(r.studentId.stuNumber)!""}</td>
													<td class="autocut tipTag" data="学院：${(r.studentId.college.name)!""}&lt;br/&gt专业：${(r.studentId.major.majorName)!""}&lt;br/&gt班级：${(r.studentId.classId.className)!""}&lt;br/&gt">
														<a target="_blank" href="${rc.contextPath}/sponsor/laborHour/view/viewLaborHour.do?id=${r.id}">
															${(r.studentId.name)!""}
														</a>
													</td>
													<td class="autocut">${(r.orgWorkHour.orgId.name)!""}</td>
													<td class="autocut">${(r.sponsorPosition.workName)!""}</td>
													<td class="autocut">${(r.orgWorkHour.workYear)!""}</td>
													<td class="autocut">${(r.orgWorkHour.workMonth)!""}</td>
													<td class="autocut">${(r.workSalary?string('.00'))!"0.00"}</td>
													<td class="autocut">${(r.workHour)!""}</td>
													<td class="autocut">${(r.totalSalary?string('.00'))!"0.00"}</td>
													<td class="autocut">
														<#if approveMap?? && (r.orgWorkHour.processStatus)??>
															${approveMap[r.orgWorkHour.processStatus]}
														</#if>
													</td>
												</tr>
											</#list>
										</#if>
									</tbody>
								</table>
								<#assign pageTagformId="queryLaborHourInfoForm"/>
								<#include "/page.ftl">
								<!--用于用户导出 -->
								<input id="pageTotalCount" name="pageTotalCount" type="hidden"  value="${page.totalCount}"/>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="modal hide fade" id="exportLabourHour">
			<div class="modal-header">
				<button class="close" data-dismiss="modal">×</button>
				<h3 id="title1">导出用工工时</h3>
			</div>
			<div class="modal-body" id="export_laborhour">
				
			</div>
			<div class="modal-footer">
				<a href="#" class="btn" data-dismiss="modal">关 闭</a>
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
			//查询验证
			$("#queryLaborHourInfoForm").compValidate({
				rules: {
					'studentId.name': {maxlength : 20},
					'studentId.stuNumber': {maxlength : 20}
				}
			});
			//查询
			function queryLaborHour(){
				var queryLaborHourInfoForm = $("#queryLaborHourInfoForm");
				queryLaborHourInfoForm.attr("action","${rc.contextPath}/sponsor/laborHour/opt-query/queryLaborHourList.do");
				queryLaborHourInfoForm.submit();
			}
			//显示导出页面
			function exportLaborHourInfo(){
				var pageTotalCount= $("#pageTotalCount").val();
				var exportSize = 25000;
				comp.showModal("exportLabourHour","500px","-250px 0 0 -250px");
				$("#export_laborhour").load("${rc.contextPath}/sponsor/laborHour/nsm/exportLaborHourList.do?pageTotalCount="+pageTotalCount+"&exportSize="+exportSize);
			}
			//导出excel
			function exportDate(exportSize,exportPage){
				$("#queryLaborHourInfoForm").attr("action","${rc.contextPath}/sponsor/laborHour/opt-query/exportLaborHourList.do");
				var fo=$("#queryLaborHourInfoForm");
				if($("#userQuery_exportPage").length==0){
					fo.append($("<input>",{
						id:'userQuery_exportSize',
						type:'hidden',
						name:'userQuery_exportSize',
						val:exportSize
					}));
					fo.append($("<input>",{
						id:'userQuery_exportPage',
						type:'hidden',
						name:'userQuery_exportPage',
						val:exportPage
					}));
				}else{
					$("#userQuery_exportSize").val(exportSize);
					$("#userQuery_exportPage").val(exportPage);
				}
				fo.submit();
			}
		</script>
		<#--脚本结束-->
	</body>
</html>