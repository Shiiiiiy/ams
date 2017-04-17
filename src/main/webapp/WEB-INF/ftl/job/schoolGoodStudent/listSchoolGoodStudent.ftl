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
					<form id="schoolGooodStudentForm" method="post" action="${rc.contextPath}/job/schoolGoodStudent/opt-query/querySchoolGoodStudentPage.do">
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
													<#if user_key.optMap['add']??>
														<button class="btn btn-info" type="button" onclick="saveSchoolGooodStudent();">新 增</button>
													</#if>
													<#if user_key.optMap['import']??>
														<button class="btn btn-info" type="button" onclick="importSchoolGooodStudent();">导 入</button>
													</#if>
													<#if user_key.optMap['add']??>
														<button class="btn btn-info" type="button" onclick="batchSubmitSchoolGoodStudent();">批量提交</button>
													</#if>
												</#if>
											</div>
										</div>
									</div>
								</div>
								<table class="table table-bordered table-striped tablecut" id="smpl_tbl" >
									<thead>
										<th width="5%">
											<#if user_key??>
												<#if user_key.optMap['add']??>
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
															<#if !(user_key.optMap['add']??)>
																${r_index+1}
															</#if>
															<#if user_key.optMap['add']?? && r.submitStatus.code == "SAVE">
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
															${approveMap[r.approveStatus]}
														</#if>
													</td>
													<td class="autocut">
														<a target="_blank" href="${rc.contextPath}/job/schoolGoodStudent/view/viewSchoolGoodStudent.do?id=${r.id}" class="sepV_a" title="查看"><i class="icon-list-alt"></i></a>
														<#if (user_key.optMap)??>
															<#if user_key.optMap['update']?? && (r.submitStatus.code == "SAVE" || r.approveStatus == "REJECT" || r.approveStatus="UNDO")>
																<a href="#" onclick="goEditSchoolGoodStudent('${r.id}')" title="修改" class="sepV_a"><i class="icon-edit"></i></a>
															</#if>
															<#if user_key.optMap['del']?? && r.submitStatus.code == "SAVE">
																<a href="#" onclick="delSchoolGoodStudent('${(r.id)!""}','${(r.studentId.name)!""}')" title="删除" class="sepV_a"><i class="icon-trash"></i></a>
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
				schoolGooodStudentForm.attr("action","${rc.contextPath}/job/schoolGoodStudent/opt-query/querySchoolGoodStudentPage.do");
				schoolGooodStudentForm.submit();
			}
			//添加跳转
			function saveSchoolGooodStudent(){
				window.location.href = "${rc.contextPath}/job/schoolGoodStudent/opt-add/querySchoolGoodStudent.do";
			}
			//修改页面跳转
			function goEditSchoolGoodStudent(id){
				window.location.href = "${rc.contextPath}/job/schoolGoodStudent/opt-update/querySchoolGoodStudent.do?id="+id;
			}
			//导入跳转页面
			function importSchoolGooodStudent(){
				window.location.href = "${rc.contextPath}/job/schoolGoodStudent/opt-query/importSchoolGoodStudentInit.do";
			}
			//删除
			function delSchoolGoodStudent(id,name){
				comp.confirm("你确定需要删除【"+name+"】吗？",function(result){
					if(result){
						$.post(
							"${rc.contextPath}/job/schoolGoodStudent/opt-del/delSchoolGoodStudent.do",
							{id:id},
							function(data){
								if(data == "success"){
									comp.message("删除【"+name+"】成功","info");
									window.location.href="${rc.contextPath}/job/schoolGoodStudent/opt-query/querySchoolGoodStudentPage.do";
								}else{
									comp.message("删除【"+name+"】失败","error");
								}
							},
							"text"
						);
					}
				});
			}
			//批量提交
			function batchSubmitSchoolGoodStudent(){
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
					comp.message("您没有选中要提交的数据!","info");
				}else{
					comp.confirm("数据提交后将不能被修改，您确定要提交选择的数据吗？",function(result){
						if(result){
							$.post(
								"${rc.contextPath}/job/schoolGoodStudent/opt-save/batchSaveStudentInfo.do",
								{ids:schoolGoodStudents.join()},
								function(data){
									if(data == "success"){
										comp.message("提交成功!","info");
										window.location.href = "${rc.contextPath}/job/schoolGoodStudent/opt-query/querySchoolGoodStudentPage.do";
									}else{
										comp.message("提交失败!","err");
									}
								},
								"text"
							);
						}
					});
				}
			}
			//全部选中
			function allSchoolGoodStudent(obj){
				var flag = $(obj).prop("checked");
				var allSchoolGoodStudent = $("input[name='studentIds']");
				$.each(allSchoolGoodStudent,function(){
					$(this).prop("checked",flag);
				});
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