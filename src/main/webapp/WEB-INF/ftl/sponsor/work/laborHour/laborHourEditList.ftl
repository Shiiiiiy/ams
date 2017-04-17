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
				<form id="queryWorkHourInfoForm" method="post">
					<div class="row-fluid">
						<div class="span12">
							<div class="row-fluid">
								<div class="span4">
									<span class="formTitle">用工部门</span>
									<input id="orgName" name="orgId.name" class="span6 notClear" type="text" readonly="readonly" value="${(orgWorkHourModelVO.orgId.name)!""}"/>
									<input id="orgId" name="orgId.id" class="span6 notClear" type="hidden" value="${(orgWorkHourModelVO.orgId.id)!""}"/>
								</div>
								<div class="span4">
									<span class="formTitle">年份</span>
									<input id="workYear" name="workYear" class="span6 Wdate" type="text" style="cursor:pointer;" value="${(orgWorkHourModelVO.workYear)!""}" onclick="WdatePicker({dateFmt:'yyyy',skin:'whyGreen'});" />
								</div>
								<div class="span4">
									<span class="formTitle">月份</span>
									<input id="workMonth" name="workMonth" class="span6 Wdate" type="text" style="cursor:pointer;" value="${(orgWorkHourModelVO.workMonth)!""}" onclick="WdatePicker({dateFmt:'MM',skin:'whyGreen'});" />
								</div>
								<input id="isQuery" name="isQuery" type="hidden" value="true"/>
							</div>
							<div class="row-fluid">
								<div class="span4">
									<span class="formTitle">审核状态</span>
									<select size="1" name="processStatus" aria-controls="dt_gal" class="span6">
										<option value="">请选择..</option>
										<#if approveMap??>
											<#list approveMap?keys as approvekey>
												<#if (orgWorkHourModelVO.processStatus)?? && orgWorkHourModelVO.processStatus == approvekey >
													<option value="${approvekey}" selected="selected">${approveMap[approvekey]}</option>
												<#else>
													<option value="${approvekey}">${approveMap[approvekey]}</option>
												</#if>
											</#list>
										</#if>
									</select>
								</div>
								<div class="span4">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<input type="submit" class="btn btn-info" onclick="queryWorkHourInfo();" value="查 询"/>
									<input type="button" class="btn btn-info" onclick="comp.clearForm('queryWorkHourInfoForm');" value="清 空">
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
												<#if user_key.optMap["add"]??>
													<button class="btn btn-info" type="button" onclick="goAddWorkHourInfo();">新 增</button>
												</#if>
												<#--
												<#if user_key.optMap['export']??>
													<button class="btn btn-info" type="button" onclick="exportLaborHourInfo()">导出</button>
												</#if>
												-->
											</#if>
										</div>
									</div>
								</div>
							</div>
							<table class="table table-bordered table-striped tablecut">
								<thead>
									<th width="6%">序号</th>
									<th width="38%">用工部门</th>
									<th width="15%">年份</th>
									<th width="15%">月份</th>
									<th width="15%">审核状态</th>
									<th width="10%">操作</th>
								</thead>
								<tbody>
									<#if (page.result)??>
										<#list page.result as r>
											<tr>
												<td class="autocut">${r_index+1}</td>
												<td class="autocut">${(r.orgId.name)!""}</td>
												<td class="autocut">${(r.workYear)!""}</td>
												<td class="autocut">${(r.workMonth)!""}</td>
												<td class="autocut">
													<#if approveMap?? && (r.processStatus)??>
														${approveMap[r.processStatus]}
													</#if>
												</td>
												<td>
													<a href="${rc.contextPath}/sponsor/laborHour/view/queryLaborHourAllList.do?id=${(r.id)!""}" target="_blank" class="sepV_a" title="查看"><i class="icon-list-alt"></i></a>
													<#if user_key.optMap??>
														<#if user_key.optMap['update']?? && (((r.submitStatus.code)?? && r.submitStatus.code == 'SAVE') || ((r.processStatus)?? && r.processStatus == 'REJECT'))>
															<a href="#" onclick="goEditWorkHourInfo('${(r.id)!""}')" title="修改"><i class="icon-edit"></i></a>
														</#if>
														<#if user_key.optMap['del']?? && ((r.submitStatus.code)?? && r.submitStatus.code == 'SAVE')>
															<a href="#" onclick="delWorkHourInfo('${r.id}','${(r.orgId.name)!""}')" title="删除"><i class="icon-trash"></i></a>
														</#if>
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
			function queryWorkHourInfo(){
				var queryWorkHourInfoForm = $("#queryWorkHourInfoForm");
				queryWorkHourInfoForm.attr("action","${rc.contextPath}/sponsor/addLaborHour/opt-query/queryOrgWorkHourPage.do");
				queryWorkHourInfoForm.submit();
			}
			//添加跳转页面
			function goAddWorkHourInfo(){
				window.location.href="${rc.contextPath}/sponsor/laborHour/opt-add/queryLaborHour.do";
			}
			//修改跳转页面
			function goEditWorkHourInfo(id){
				var queryWorkHourInfoForm = $("#queryWorkHourInfoForm");
				$("#isQuery").val("true");
				queryWorkHourInfoForm.append('<input name="id" type="hidden" value="'+id+'"/>');
				queryWorkHourInfoForm.attr("action","${rc.contextPath}/sponsor/laborHour/opt-update/editLaborHour.do");
				queryWorkHourInfoForm.submit();
			}
			//删除
			function delWorkHourInfo(id,name){
				comp.confirm("你确定需要【"+name+"】删除吗？",function(result){
					if(result){
						$.post(
							"${rc.contextPath}/sponsor/laborHour/opt-del/delLaborHour.do",
							{id:id},
							function(data){
								if(data == "success"){
									comp.message("删除【"+name+"】成功","info");
									window.location.href="${rc.contextPath}/sponsor/addLaborHour/opt-query/queryOrgWorkHourPage.do";
								}
							},
							"text"
						);
					}
				});
			}
			//显示导出页面
			function exportLaborHourInfo(){
				var pageTotalCount= $("#pageTotalCount").val();
				var exportSize = 10000;
				comp.showModal("exportLabourHour","500px","-250px 0 0 -250px");
				$("#export_laborhour").load("${rc.contextPath}/sponsor/laborHour/nsm/exportLaborHourList.do?pageTotalCount="+pageTotalCount+"&exportSize="+exportSize);
			}
			//导出excel
			function exportDate(exportSize,exportPage){
				var fo=$("#queryWorkHourInfoForm");
				fo.attr("action","${rc.contextPath}/sponsor/laborHour/opt-query/exportEditLaborHourList.do");
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