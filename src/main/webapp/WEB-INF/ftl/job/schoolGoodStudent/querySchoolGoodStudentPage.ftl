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
					<form id="schoolGooodStudentForm" method="post" action="${rc.contextPath}/job/querySchoolGoodStudent/opt-query/querySchoolGoodStudentPage.do">
						<div class="row-fluid">
							<div class="span12">
								<div class="row-fluid">
									<div class="span4">
										<span class="formTitle">姓名</span>
										<input id="stuName" name="studentId.name" class="span6" value="${(schoolGoodStudentVO.studentId.name)!""}"/>
									</div>
									<div class="span4">
										<span class="formTitle">学号</span>
										<input id="stuNo" name="studentId.id" class="span6" value="${(schoolGoodStudentVO.studentId.id)!""}"/>
									</div>
									<div class="span4">
										<span class="formTitle">学年</span>
										<select name="schoolYear.id" size="1" aria-controls="dt_gal" class="span6">
											<option value="">请选择</option>
											<#if years??>
												<#list years as year>
													<#if (schoolGoodStudentVO.schoolYear.id)?? && schoolGoodStudentVO.schoolYear.id == year.id>
														<option value="${year.id}" selected="selected">${year.name}</option>
													<#else>
														<option value="${year.id}">${year.name}</option>
													</#if>
												</#list>
											</#if>
										<select>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span4">
										<span class="formTitle">学院</span>
										<select id="radioCollegeId" name="studentId.college.id" aria-controls="dt_gal" class="span6 <#if isJobOffice==false>notClear</#if>" <#if isJobOffice==false>disabled="disabled"</#if> onchange="cascade.changeCollage('radioCollegeId','radioMajor','radioClass');">
											<option value="">请选择</option>
											<#if colleges??>
												<#list colleges as college>
													<#if (schoolGoodStudentVO.studentId.college.id)?? && schoolGoodStudentVO.studentId.college.id == college.id>
														<option value="${college.id}" selected="selected">${college.name}</option>
													<#else>
														<option value="${college.id}">${college.name}</option>
													</#if>
												</#list>
											</#if>
										</select>
									</div>
									<div class="span4">
										<span class="formTitle">专业</span>
										<select id="radioMajor" name="studentId.major.id" aria-controls="dt_gal" class="span6 <#if isJobOffice==true>emptySelect</#if>" onchange="cascade.changeMajor('radioMajor','radioClass');">
											<option value="">请选择</option>
											<#if majors??>
												<#list majors as major>
													<#if (schoolGoodStudentVO.studentId.major.id)?? && schoolGoodStudentVO.studentId.major.id == major.id>
														<option value="${major.id}" selected="selected">${major.majorName}</option>
													<#else>
														<option value="${major.id}">${major.majorName}</option>
													</#if>
												</#list>
											</#if>
										</select>
									</div>
									<div class="span4">
										<span class="formTitle">班级</span>
										<select id="radioClass" name="studentId.classId.id" size="1" aria-controls="dt_gal" class="span6 emptySelect">
											<option value="">请选择</option>
											<#if classes??>
												<#list classes as clazz>
													<#if (schoolGoodStudentVO.studentId.classId.id)?? && schoolGoodStudentVO.studentId.classId.id == clazz.id>
														<option value="${clazz.id}" selected="selected">${clazz.className}</option>
													<#else>
														<option value="${clazz.id}">${clazz.className}</option>
													</#if>
												</#list>
											</#if>
										<select>
									</div>
								</div>
								<div class="row-fluid">
									<div class="span4">
									</div>
									<div class="span4">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<#--查询时首先更改 form的action的值-->
										<input type="submit" class="btn btn-info" value="查 询" onclick="querySchoolGooodStudent();"/>
										<input type="button" class="btn btn-info" onclick="comp.clearForm('schoolGooodStudentForm');" value="清 空">
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
														<button class="btn btn-info" type="button" onclick="exportSchoolGooodStudent();">导 出</button>
													</#if>
												</#if>
											</div>
										</div>
									</div>
								</div>
								<table class="table table-bordered table-striped tablecut" id="smpl_tbl" >
									<thead>
										<th width="5%">序号</th>
										<th width="10%">姓名</th>
										<th width="10%">学号</th>
										<th width="10%">学年</th>
										<th width="10%">班级排名</th>
										<th width="10%">职务</th>
										<th width="10%">计算机等级</th>
										<th width="10%">外语等级</th>
										<th width="10%">状态</th>
										<th width="10%">操作</th>
									</thead>
									<tbody>
										<#if (page.result)??>
											<#list page.result as r>
												<tr>
													<td class="autocut">${r_index+1}</td>
													<td class="autocut tipTag" data="学院：${(r.studentId.college.name)!""}&lt;br/&gt专业：${(r.studentId.major.majorName)!""}&lt;br/&gt班级：${(r.studentId.classId.className)!""}&lt;br/&gt">
														<a target="_blank" href="${rc.contextPath}/job/schoolGoodStudent/view/viewSchoolGoodStudent.do?id=${r.id}">
															${(r.studentId.name)!""}
														</a>
													</td>
													<td class="autocut">${(r.studentId.stuNumber)!""}</td>
													<td class="autocut">${(r.studentId.classId.graduatedYearDic.name)!""}</td>
													<td class="autocut">${(r.classSort)!""}</td>
													<td class="autocut">${(r.post)!""}</td>
													<td class="autocut">${(r.computerLevel)!""}</td>
													<td class="autocut">${(r.englishLevel)!""}</td>
													<td class="autocut">
														<#if (r.approveStatus)??>
															${approveMap[r.approveStatus]}
														</#if>
													</td>
													<td class="autocut">
														<a target="_blank" href="${rc.contextPath}/job/schoolGoodStudent/view/viewSchoolGoodStudent.do?id=${r.id}" class="sepV_a" title="查看"><i class="icon-list-alt"></i></a>
														<#if (user_key.optMap)??>
															<#if user_key.optMap['print']?? && (r.approveStatus)?? && r.approveStatus == "PASS">
																 <a href="${rc.contextPath}/job/querySchoolGoodStudent/opt-print/nsm/printSchoolGoodStudent.do?id=${r.id}" class="sepV_a" title="校优秀毕业生登记表打印" target= "_blank"><i class="icon-print"></i></a>
															</#if>
														</#if>
													</td>
												</tr>
											</#list>
										</#if>
									</tbody>
								</table>
								<#assign pageTagformId="schoolGooodStudentForm"/>
								<#include "/page.ftl">
								<!--用于用户导出 -->
								<input id="pageTotalCount" name="pageTotalCount" type="hidden"  value="${page.totalCount}"/>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="modal hide fade" id="exportSchoolGooodStudent">
			<div class="modal-header">
				<button class="close" data-dismiss="modal">×</button>
				<h3 id="title1">导出校级优秀毕业生表</h3>
			</div>
			<div class="modal-body" id="export_SchoolGooodStudent">
				
			</div>
			<div class="modal-footer">
				<a href="#" class="btn" data-dismiss="modal">关闭</a>
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
			$("#schoolGooodStudentForm").compValidate({
				rules: {
					'studentId.name': {maxlength : 20},
					'studentId.id': {maxlength : 20}
				},
				messages:{
					'studentId.name': {maxlength : "姓名最大长度为20位"},
					'studentId.id': {maxlength : "学号最大长度为20位"}
				}
			});
			//查询
			function querySchoolGooodStudent(){
				var schoolGooodStudentForm = $("#schoolGooodStudentForm");
				schoolGooodStudentForm.attr("action","${rc.contextPath}/job/querySchoolGoodStudent/opt-query/querySchoolGoodStudentPage.do");
				schoolGooodStudentForm.submit();
			}
			//显示导出页面
			function exportSchoolGooodStudent(){
				var pageTotalCount= $("#pageTotalCount").val();
				var exportSize = 1000;
				comp.showModal("exportSchoolGooodStudent","500px","-250px 0 0 -250px");
				$("#export_SchoolGooodStudent").load("${rc.contextPath}/job/schoolGoodStudent/nsm/exportSchoolGoodStudentPage.do?pageTotalCount="+pageTotalCount+"&exportSize="+exportSize);
			}
			//导出excel
			function exportDate(exportSize,exportPage){
				var fo=$("#schoolGooodStudentForm");
				fo.attr("action","${rc.contextPath}/job/opt-export/exportSchoolGoodStudentPage.do");
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