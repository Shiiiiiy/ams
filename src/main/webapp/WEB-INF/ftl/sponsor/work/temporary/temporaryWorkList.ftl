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
		<script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
		<script src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script>
		<script src="${rc.contextPath}/lib/validation/localization/messages_cn.js"></script>
	</head>
	<body>
		<div id="contentwrapper">
			<div class="main_content">
				<div class="row-fluid">
					<form id="queryTemporaryWorkInfo" method="post" action="${rc.contextPath}/sponsor/temporaryWork/opt-query/queryTemporaryWorkList.do">
						<div class="span12">
							<div class="row-fluid">
								<div class="span4">
									<span class="formTitle">学院</span>
									<select id="radioCollegeId" name="studentId.college.id" aria-controls="dt_gal" class="span6" onchange="cascade.changeCollageQueryClass('radioCollegeId','radioClass');">
										<option value="">请选择..</option>
										<#list baseAcademyModels as college>
											<#if (temporaryWorkStudyModel.studentId.college)?? && temporaryWorkStudyModel.studentId.college.id == college.id>
												<option value="${college.id}" selected="selected">${college.name}</option>
											<#else>
												<option value="${college.id}">${college.name}</option>
											</#if>
										</#list>
									</select>
								</div>
								<div class="span4">
									<span class="formTitle">班级</span>
									<select id="radioClass" name="studentId.classId.id" size="1" aria-controls="dt_gal" class="span6 emptySelect">
										<option value="">请选择..</option>
										<#list baseClassModels as classModel>
											<#if (temporaryWorkStudyModel.studentId.classId)?? && temporaryWorkStudyModel.studentId.classId.id == classModel.id>
												<option value="${classModel.id}" selected="selected">${classModel.className}</option>
											<#else>
												<option value="${classModel.id}">${classModel.className}</option>
											</#if>
										</#list>
									<select>
								</div>
								<div class="span4">
									<span class="formTitle">用工部门</span>
									<input id="orgName" name="orgName" class="span6" value="${(temporaryWorkStudyModel.orgName)!""}"/>
								</div>
							</div>
							<div class="row-fluid">
								<div class="span4">
									<span class="formTitle">学年</span>
									<select size="1" id="year" name="schoolYear.id" aria-controls="dt_gal" class="span6" >
										<option value="">请选择..</option>
										<#list years as year>
											<#if (temporaryWorkStudyModel.schoolYear)?? && temporaryWorkStudyModel.schoolYear.id == year.id>
												<option value="${year.id}" selected="selected">${year.name}</option>
											<#else>
												<option value="${year.id}">${year.name}</option>
											</#if>
										</#list>
									</select>
								</div>
								<div class="span4">
									<span class="formTitle">学期</span>
									<select size="1" id="term" name="schoolTerm.id" aria-controls="dt_gal" class="span6" >
										<option value="">请选择..</option>
										<#list terms as term>
											<#if (temporaryWorkStudyModel.schoolTerm)?? && temporaryWorkStudyModel.schoolTerm.id == term.id>
												<option value="${term.id}" selected="selected">${term.name}</option>
											<#else>
												<option value="${term.id}">${term.name}</option>
											</#if>
										</#list>
									</select>
								</div>
								<div class="span4">
									<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月份</span>
									<input id="workMonth" name="workMonth" class="Wdate span6" style="cursor:pointer;" type="text" value="${(temporaryWorkStudyModel.workMonth)!""}" onclick="WdatePicker({dateFmt:'MM',skin:'whyGreen'});" />
								</div>
							</div>
							<div class="row-fluid">
								<div class="span4">
									<span class="formTitle">姓名</span>
									<input id="stuName" name="studentId.name" class="span6" value="${(temporaryWorkStudyModel.studentId.name)!""}"/>
								</div>
								<div class="span4">
									<span class="formTitle">学号</span>
									<input id="stuNo" name="studentId.stuNumber" class="span6" value="${(temporaryWorkStudyModel.studentId.stuNumber)!""}"/>
								</div>
								<div class="span4">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<#--查询时首先更改 form的action的值-->
									<input type="submit" class="btn btn-info" value="查 询" onclick="queryTemporaryWork();">
									<input type="button" class="btn btn-info" onclick="comp.clearForm('queryTemporaryWorkInfo');" value="清 空">
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
													<#if user_key.optMap["add"]??>
														<button class="btn btn-info" type="button" onclick="goAddTemporaryWork();">新 增</button>
													</#if>
													<#if user_key.optMap['import']??>
														<button class="btn btn-info" type="button" onclick="goImportTemporaryWork()">导 入</button>
													</#if>
													<#if user_key.optMap['export']??>
														<button class="btn btn-info" type="button" onclick="exportTemporaryWork()">导 出</button>
													</#if>
													<#if user_key.optMap['del']??>
														<button class="btn btn-info" type="button" onclick="delMultTemporaryWork()">批量删除</button>
													</#if>
												</#if>
											</div>
										</div>
									</div>
								</div>
								<table class="table table-bordered table-striped tablecut">
									<thead>
										<th width="5%">
											<input id="allTemporaryWork" type="checkbox" onclick="addAllDelTemporaryWork();"/>
										</th>
										<th width="15%">用工部门</th>
										<th width="10%">姓名</th>
										<th width="10%">学号</th>
										<th width="10%">学年</th>
										<th width="10%">学期</th>
										<th width="10%">月份</th>
										<th width="10%">月用工时</th>
										<th width="10%">薪资</th>
										<th width="10%">操作</th>
									</thead>
									<tbody>
										<#if (page.result)??>
											<#list page.result as r>
												<tr>
													<td class="autocut">
														<input class="temporaryWork" type="checkbox" value="${r.id}" onclick="addDelTemporaryWork();"/>
													</td>
													<td class="autocut">${(r.orgName)!""}</td>
													<td class="autocut tipTag" data="学院：${(r.studentId.college.name)!""}&lt;br/&gt专业：${(r.studentId.major.majorName)!""}&lt;br/&gt班级：${(r.studentId.classId.className)!""}&lt;br/&gt">
														<a target="_blank" href="${rc.contextPath}/sponsor/temporaryWork/view/queryTemporaryWorkInfo.do?id=${r.id}&isDetail=true">
															${(r.studentId.name)!""}
														</a>
													</td>
													<td class="autocut">${(r.studentId.stuNumber)!""}</td>
													<td class="autocut">${(r.schoolYear.name)!""}</td>
													<td class="autocut">${(r.schoolTerm.name)!""}</td>
													<td class="autocut">${(r.workMonth)!""}</td>
													<td class="autocut">${(r.workHour?string('.0'))!""}</td>
													<td class="autocut">${(r.totalSalary?string('.00'))!"0.00"}</td>
													<td>
														<a target="_blank" href="${rc.contextPath}${rc.contextPath}/sponsor/temporaryWork/view/queryTemporaryWorkInfo.do?id=${r.id}&isDetail=true" class="sepV_a" title="查看"><i class="icon-list-alt"></i></a>
														<#if (user_key.optMap)??>
															<#if user_key.optMap['update']??>
																<a href="#" onclick="goEditTemporaryWork('${r.id}')" title="修改"><i class="icon-edit"></i></a>
															</#if>
															<#if user_key.optMap['del']??>
																<a href="#" onclick="delTemporaryWork('${r.id}','${r.orgName}','${r.studentId.stuNumber}','${r.studentId.name}')" title="删除"><i class="icon-trash"></i></a>
															</#if>
														</#if>
													</td>
												</tr>
											</#list>
										</#if>
									</tbody>
								</table>
								<#assign pageTagformId="queryTemporaryWorkInfo"/>
								<#include "/page.ftl">
								<!--用于导出 -->
								<input id="pageTotalCount" name="pageTotalCount" type="hidden"  value="${page.totalCount}"/>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="modal hide fade" id="exportTemporaryWork">
			<div class="modal-header">
				<button class="close" data-dismiss="modal">×</button>
				<h3 id="title1">导出临时工工时</h3>
			</div>
			<div class="modal-body" id="export_TemporaryWork">
				
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
			$('#queryTemporaryWorkInfo').compValidate({
				rules: {
					orgName : {maxlength : 50},
					'studentId.name': {maxlength : 20},
					'studentId.stuNumber': {maxlength : 20}
				}
			});
			//查询    修改查询表单的action
			function queryTemporaryWork(){
				var queryForm = $("#queryTemporaryWorkInfo");
				queryForm.attr("action","${rc.contextPath}/sponsor/temporaryWork/opt-query/queryTemporaryWorkList.do");
				queryForm.submit();
			}
			//添加跳转页面
			function goAddTemporaryWork(){
				window.location.href = "${rc.contextPath}/sponsor/temporaryWork/opt-add/editTemporaryWorkInfo.do";
			}
			//导入跳转页面
			function goImportTemporaryWork(){
				window.location.href="${rc.contextPath}/sponsor/temporaryWork/opt-query/importTemporaryWorkInit.do";
			}
			//导出    修改查询表单的action
			function exportTemporaryWork(){
				var queryForm = $("#queryTemporaryWorkInfo");
				queryForm.attr("action","${rc.contextPath}/sponsor/temporaryWork/opt-query/exportTemporaryWork.do");
				queryForm.submit();
			}
			//修改跳转页面
			function goEditTemporaryWork(id){
				window.location.href = "${rc.contextPath}/sponsor/temporaryWork/opt-update/editTemporaryWorkInfo.do?id="+id;
			}
			//删除
			function delTemporaryWork(id,orgName,stuNum,stuName){
				comp.confirm("你确定需要删除吗？<br>　用工部门:"+orgName+"<br>　学　　号:"+stuNum+"<br>　姓　　名:"+stuName,function(result){
					if(result){
						$.post(
							"${rc.contextPath}/sponsor/temporaryWork/opt-del/delTemporaryWork.do",
							{id:id},
							function(data){
								if(data == "success"){
									comp.message("删除【"+name+"】成功","info");
									window.location.href="${rc.contextPath}/sponsor/temporaryWork/opt-query/queryTemporaryWorkList.do";
								}
							},
							"text"
						);
					}
				});
			}
			//批量删除
			function delMultTemporaryWork(){
				var ids = new Array();
				var flag = false;
				$(".temporaryWork").each(function(){
					if($(this).prop("checked")){
						flag = true;
						ids.push($(this).val());
					}
				});
				if(!flag){
					comp.message("您没有选中需要删除的数据!","info");
				}else{
					comp.confirm("您确定需要删除选中的数据吗？",function(result){
						if(result){
							$.post(
								"${rc.contextPath}/sponsor/temporaryWork/opt-del/delMultTemporaryWork.do",
								{ids:ids.join()},
								function(data){
									if(data == "success"){
										comp.message("删除成功","info");
										window.location.href="${rc.contextPath}/sponsor/temporaryWork/opt-query/queryTemporaryWorkList.do";
									}
								},
								"text"
							);
						}
					});
				}
			}
			//将该页中的数据全部设置为选中或非选中
			function addAllDelTemporaryWork(){
				var flag = $("#allTemporaryWork").prop("checked");
				if(flag){
					$(".temporaryWork").each(function(){
						$(this).prop("checked",true);
					});
				}else{
					$(".temporaryWork").each(function(){
						$(this).prop("checked",false);
					});
				}
			}
			//将选中的数据设置为选中，并且如果该页中的数据全部选中时，全部选中的复选框也选中
			function addDelTemporaryWork(){
				var flag = true;
				$(".temporaryWork").each(function(){
					var isTrue = $(this).prop("checked");
					if(!isTrue){
						flag = false;
					}
				});
				$("#allTemporaryWork").prop("checked",flag);
			}
			//显示导出页面
			function exportTemporaryWork(){
				var pageTotalCount= $("#pageTotalCount").val();
				var exportSize = 25000;
				comp.showModal("exportTemporaryWork","500px","-250px 0 0 -250px");
				$("#export_TemporaryWork").load("${rc.contextPath}/sponsor/temporaryWork/nsm/exportTemporaryWorkList.do?pageTotalCount="+pageTotalCount+"&exportSize="+exportSize);
			}
			//导出excel
			function exportDate(exportSize,exportPage){
				var fo=$("#queryTemporaryWorkInfo");
				fo.attr("action","${rc.contextPath}/sponsor/temporaryWork/opt-query/exportTemporaryWork.do");
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