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
					<form id="schoolGooodStudentForm" method="post" action="${rc.contextPath}/job/approveSchoolGoodStudent/opt-query/approveSchoolGoodStudentPage.do">
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
										<select id="radioCollegeId" name="studentId.college.id" aria-controls="dt_gal" class="span6" onchange="cascade.changeCollage('radioCollegeId','radioMajor','radioClass');">
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
										<select id="radioMajor" name="studentId.major.id" aria-controls="dt_gal" class="span6 emptySelect" onchange="cascade.changeMajor('radioMajor','radioClass');">
											<option value="">请选择</option>
											<#if majors??>
												<#list majors as major>
													<#if (schoolGoodStudentVO.studentId.major)?? && schoolGoodStudentVO.studentId.major.id == major.id>
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
													<#if (schoolGoodStudentVO.studentId.classId)?? && schoolGoodStudentVO.studentId.classId.id == clazz.id>
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
										<span class="formTitle">状态</span>
										<select size="1" name="approveStatus" aria-controls="dt_gal" class="span6">
											<option value="">请选择</option>
											<#if approveMap??>
												<#list approveMap?keys as approveKey>
													<#if (schoolGoodStudentVO.approveStatus)?? && schoolGoodStudentVO.approveStatus == approveKey>
														<option value="${approveKey}" selected="selected">${approveMap[approveKey]}</option>
													<#else>
														<option value="${approveKey}">${approveMap[approveKey]}</option>
													</#if>
												</#list>
											</#if>
										</select>
									</div>
									<div class="span4">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
												<#if (user_key.optMap)??>
													<#--
													<#if user_key.optMap['export']??>
														<button class="btn btn-info" type="button" onclick="exportSchoolGooodStudent();">导 出</button>
													</#if>
													-->
													<#if user_key.optMap['approve']??>
														<button class="btn btn-info" type="button" onclick="batchApproveSchoolGoodStudent();">批量审核</button>
													</#if>
												</#if>
											</div>
										</div>
									</div>
								</div>
								<table class="table table-bordered table-striped tablecut" id="smpl_tbl" >
									<thead>
										<th width="5%">
											<#if (user_key.optMap)??>
												<#if user_key.optMap['approve']??>
													<input id="allSchoolGoodStudent" type="checkbox" onclick="allSchoolGoodStudent(this);"/>
												<#else>
													序号
												</#if>
											<#else>
												序号
											</#if>
										</th>
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
													<td class="autocut">
														<#if (user_key.optMap)??>
															<#if !(user_key.optMap['approve']??)>
																${r_index+1}
															</#if>
															<#if user_key.optMap['approve']?? && r.approveStatus == "APPROVEING">
																<input name="studentIds" type="checkbox" onclick="schoolGoodStudent(this);" value="${r.id}"/>
															</#if>
														<#else>
															${r_index+1}
														</#if>
													</td>
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
															<#if r.approveStatus == "APPROVEING">
																待审核
															<#else>
																${approveMap[r.approveStatus]}
															</#if>
														</#if>
													</td>
													<td class="autocut">
														<a target="_blank" href="${rc.contextPath}/job/schoolGoodStudent/view/viewSchoolGoodStudent.do?id=${r.id}" class="sepV_a" title="查看"><i class="icon-list-alt"></i></a>
														<#if (user_key.optMap)??>
															<#if user_key.optMap['approve']?? && r.approveStatus == "APPROVEING">
																<a href="#" onclick="goApproveSchoolGoodStudent('${r.id}')" title="审核"><i class="icon-check"></i></a>
															</#if>
															<#if user_key.optMap['cancel']?? && r.approveStatus == "PASS">
																<a href="#" onclick="undoSchoolGoodStudent('${r.id}','${r.studentId.name}')" title="撤销"><i class="icon-ban-circle"></i></a>
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
							</div>
						</div>
					</div>
				</div>
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
					'studentId.stuNumber': {maxlength : 20}
				}
			});
			//查询
			function querySchoolGooodStudent(){
				var schoolGooodStudentForm = $("#schoolGooodStudentForm");
				schoolGooodStudentForm.attr("action","${rc.contextPath}/job/approveSchoolGoodStudent/opt-query/approveSchoolGoodStudentPage.do");
				schoolGooodStudentForm.submit();
			}
			//审批页面跳转
			function goApproveSchoolGoodStudent(id){
				window.location.href = "${rc.contextPath}/job/approveSchoolGoodStudent/opt-query/querySchoolGoodStudent.do?id="+id+"&isApprove=true";
			}
			//撤销
			function undoSchoolGoodStudent(id,name){
				comp.confirm("你确定要撤销【"+name+"】校优秀生吗？",function(result){
					if(result){
						$.post(
							"${rc.contextPath}/job/approveSchoolGoodStudent/opt-cancel/undoSchoolGoodStudent.do",
							{"id":id},
							function(data){
								if(data == "success"){
									window.location.href = "${rc.contextPath}/job/approveSchoolGoodStudent/opt-query/approveSchoolGoodStudentPage.do";
								}
							},
							"text"
						);
					}
				});
			}
			//批量提交
			function batchApproveSchoolGoodStudent(){
				var allSchoolGoodStudent = $("input[name='studentIds']");
				var schoolGoodStudents = new Array();
				var flag = false;
				$.each(allSchoolGoodStudent,function(){
					var schoolGoodStudent = $(this);
					if(schoolGoodStudent.prop("checked")){
						schoolGoodStudents.push(schoolGoodStudent.val());
						flag = true;
					}
				});
				if(!flag){
					comp.message("您没有选中要审核的数据!","info");
				}else{
					var schoolGooodStudentForm = $("#schoolGooodStudentForm");
					schoolGooodStudentForm.attr("action","${rc.contextPath}/job/schoolGoodStudent/view/approveSchoolGoodStudentList.do");
					$.each(schoolGoodStudents,function(i,v){
						schoolGooodStudentForm.append("<input name='ids' type='hidden' value='"+v+"'/>");
					});
					schoolGooodStudentForm.submit();
				}
			}
			//全部选中
			function allSchoolGoodStudent(obj){
				var flag = $(obj).prop("checked");
				$("input[name='studentIds']").prop("checked",flag);
			}
			//单个选中
			function schoolGoodStudent(obj){
				var flag = true;
				$.each($("input[name='studentIds']"),function(){
					if(!$(this).prop("checked")){
						flag = false;
					}
				});
				$("#allSchoolGoodStudent").prop("checked",flag);
			}
		</script>
		<#--脚本结束-->
	</body>
</html>