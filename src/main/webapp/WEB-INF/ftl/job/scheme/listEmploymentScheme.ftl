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
					<form id="queryEmploySchemeInfo" method="post" action="${rc.contextPath}/job/employmentScheme/opt-query/queryEmploymentSchemeList.do">
						<div class="span12">
							<div class="row-fluid">
								<div class="span4">
									<span class="formTitle">姓名</span>
									<input id="stuName" name="studentId.name" class="span6" value="${(employmentSchemeVO.studentId.name)!""}"/>
								</div>
								<div class="span4">
									<span class="formTitle">学号</span>
									<input id="stuNo" name="studentId.stuNumber" class="span6" value="${(employmentSchemeVO.studentId.stuNumber)!""}"/>
								</div>
								<div class="span4">
									<span class="formTitle">毕业去向</span>
									<select name="graduateCode.id" aria-controls="dt_gal" class="span6">
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
							<div class="row-fluid">
								<div class="span4">
									<span class="formTitle">学院</span>
									<select id="radioCollegeId" name="studentId.college.id" aria-controls="dt_gal" class="span6 <#if isJobOffice?? && isJobOffice == false>notClear</#if>" <#if isJobOffice?? && isJobOffice == false>disabled="disabled" </#if> onchange="cascade.changeCollage('radioCollegeId','radioMajor');">
										<option value="">请选择</option>
										<#if colleges??>
											<#list colleges as college>
												<#if (employmentSchemeVO.studentId.college)?? && employmentSchemeVO.studentId.college.id == college.id>
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
									<select id="radioMajor" name="studentId.major.id" aria-controls="dt_gal" class="span6 <#if isJobOffice?? && isJobOffice == true>emptySelect</#if>" onchange="cascade.changeMajor('radioMajor','radioClass');">
										<option value="">请选择</option>
										<#if majors??>
											<#list majors as major>
												<#if (employmentSchemeVO.studentId.major)?? && employmentSchemeVO.studentId.major.id == major.id>
													<option value="${major.id}" selected="selected">${major.majorName}</option>
												<#else>
													<option value="${major.id}">${major.majorName}</option>
												</#if>
											</#list>
										</#if>
									</select>
								</div>
								<div class="span4">
									<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;班级</span>
									<select id="radioClass" name="studentId.classId.id" size="1" aria-controls="dt_gal" class="span6 emptySelect">
										<option value="">请选择</option>
										<#if classes??>
											<#list classes as clazz>
												<#if (employmentSchemeVO.studentId.classId.id)?? && employmentSchemeVO.studentId.classId.id == clazz.id>
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
									<input type="submit" class="btn btn-info" value="查 询" onclick="queryEmployScheme();">
									<input type="button" class="btn btn-info" onclick="comp.clearForm('queryEmploySchemeInfo');" value="清 空">
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
													<#if user_key.optMap["add"]??>
														<button class="btn btn-info" type="button" onclick="goAddEmploymentScheme();">新 增</button>
													</#if>
													<#if user_key.optMap['import']??>
														<button class="btn btn-info" type="button" onclick="goImportEmploymentScheme()">导 入</button>
													</#if>
													<#if user_key.optMap['export']??>
														<button class="btn btn-info" type="button" onclick="exportEmploymentScheme()">导 出</button>
													</#if>
												</#if>
											</div>
										</div>
									</div>
								</div>
								<table class="table table-bordered table-striped tablecut">
									<thead>
										<th width="5%">序号</th>
										<th width="6%">姓名</th>
										<th width="8%">学号</th>
										<th width="11%">考生号</th>
										<th width="12%">毕业去向</th>
										<th width="10%">学历代码</th>
										<th width="11%">专业方向</th>
										<th width="12%">档案是否转入学校</th>
										<th width="12%">户口是否转入学校</th>
										<th width="8%">操作</th>
									</thead>
									<tbody>
										<#if (page.result)??>
											<#list page.result as r>
												<tr>
													<td class="autocut">${r_index+1}</td>
													<td class="autocut tipTag" data="学院：${(r.studentId.college.name)!""}&lt;br/&gt专业：${(r.studentId.major.majorName)!""}&lt;br/&gt班级：${(r.studentId.classId.className)!""}&lt;br/&gt">
														<a target="_blank" href="${rc.contextPath}/job/employmentScheme/opt-query/viewEmploymentSchemeInfo.do?id=${r.id}">
															${(r.studentId.name)!""}
														</a>
													</td>
													<td class="autocut">${(r.studentId.stuNumber)!""}</td>
													<td class="autocut">${(r.examNo)!""}</td>
													<td class="autocut"><#if (r.graduateCode)??>${r.graduateCode.name}</#if></td>
													<td class="autocut">${(r.educationCode)!""}</td>
													<td class="autocut">${(r.majorSide)!""}</td>
													<td class="autocut"><#if (r.isFileSchool)??>${r.isFileSchool.name}</#if></td>
													<td class="autocut"><#if (r.isAccountSchool)??>${r.isAccountSchool.name}</#if></td>
													<td>
														<a target="_blank" href="${rc.contextPath}/job/employmentScheme/opt-query/viewEmploymentSchemeInfo.do?id=${r.id}" class="sepV_a" title="查看"><i class="icon-list-alt"></i></a>
														<#if (user_key.optMap)??>
															<#if user_key.optMap['update']??><a href="#" onclick="goEditEmploymentScheme('${r.id}')" title="修改" class="sepV_a"><i class="icon-edit"></i></a></#if>
															<#if user_key.optMap['del']??><a href="#" onclick="delEmploymentScheme('${(r.id)!""}','${(r.studentId.name)!""}')" title="删除" class="sepV_a"><i class="icon-trash"></i></a></#if>
														</#if>
													</td>
												</tr>
											</#list>
										</#if>
									</tbody>
								</table>
								<#assign pageTagformId="queryEmploySchemeInfo"/>
								<#include "/page.ftl">
								<!--用于导出 -->
								<input id="pageTotalCount" name="pageTotalCount" type="hidden"  value="${page.totalCount}"/>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="modal hide fade" id="exportEmployScheme">
			<div class="modal-header">
				<button class="close" data-dismiss="modal">×</button>
				<h3 id="title1">导出就业方案</h3>
			</div>
			<div class="modal-body" id="export_EmployScheme">
				
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
			$('#queryEmploySchemeInfo').compValidate({
				rules: {
					graduateYear : {isNumber:true,maxlength:4},
					'studentId.name': {maxlength:20},
					'studentId.stuNumber': {maxlength:20}
				},messages:{
					graduateYear:{isNumber:"毕业年份为数字",maxlength:"毕业年份的长度为4位"},
					'studentId.name':{maxlength:"姓名最大长度为20"},
					'studentId.stuNumber': {maxlength:"学号最大长度为20"}
				}
			});
			//查询    修改查询表单的action
			function queryEmployScheme(){
				var queryForm = $("#queryEmploySchemeInfo");
				queryForm.attr("action","${rc.contextPath}/job/employmentScheme/opt-query/queryEmploymentSchemeList.do");
				queryForm.submit();
			}
			//添加跳转页面
			function goAddEmploymentScheme(){
				window.location.href = "${rc.contextPath}/job/employmentScheme/opt-add/editEmploymentSchemeInfo.do";
			}
			//导入跳转页面
			function goImportEmploymentScheme(){
				window.location.href="${rc.contextPath}/job/employmentScheme/opt-query/importEmploymentSchemeInit.do";
			}
			//修改跳转页面  
			function goEditEmploymentScheme(id){
				window.location.href = "${rc.contextPath}/job/employmentScheme/opt-add/editEmploymentSchemeInfo.do?id="+id;
			}
			//删除
			function delEmploymentScheme(id,stuName){
				comp.confirm("你确定需要删除【"+stuName+"】吗？",function(result){
					if(result){
						$.post(
							"${rc.contextPath}/job/employmentScheme/opt-del/delEmploymentScheme.do",
							{id:id},
							function(data){
								if(data == "true"){
									comp.message("删除【"+stuName+"】成功","info");
									window.location.href="${rc.contextPath}/job/employmentScheme/opt-query/queryEmploymentSchemeList.do";
								}else{
									comp.message("删除【"+stuName+"】失败","error");
								}
							},
							"text"
						);
					}
				});
			}
			//显示导出页面
			function exportEmploymentScheme(){
				var pageTotalCount= $("#pageTotalCount").val();
				var exportSize = 1000;
				comp.showModal("exportEmployScheme","500px","-250px 0 0 -250px");
				$("#export_EmployScheme").load("${rc.contextPath}/job/employmentScheme/nsm/exportEmploymentSchemeList.do?pageTotalCount="+pageTotalCount+"&exportSize="+exportSize);
			}
			//导出excel
			function exportDate(exportSize,exportPage){
				var fo=$("#queryEmploySchemeInfo");
				fo.attr("action","${rc.contextPath}/job/employmentScheme/opt-query/exportEmploymentScheme.do");
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