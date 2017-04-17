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
	</head>
	<body>
		<div id="contentwrapper">
			<div class="main_content">
				<div class="row-fluid">
					<form id="queryLaborHourInfoForm" method="post" action="${rc.contextPath}/sponsor/approveSchoolLaborHour/opt-approve/querySchoolWorkHourList">
						<div class="row-fluid">
							<div class="span12">
								<div class="row-fluid" style="margin-top: 10px;">
									<div class="span4">
										<span class="formTitle">用工部门</span>
										<#if !isSchoolTeacher>
											<input id="orgName" name="orgId.name" class="span6 notClear" type="text" readonly="readonly" value="${(orgWorkHourModelVO.orgId.name)!""}"/>
											<input id="orgId" name="orgId.id" class="span6 notClear" type="hidden" value="${(orgWorkHourModelVO.orgId.id)!""}"/>
										<#else>
											<select size="1" name="orgId.id" aria-controls="dt_gal" class="span6">
												<option value="">请选择..</option>
												<#list orgs as org>
													<#if (orgWorkHourModelVO.orgId.id)?? && orgWorkHourModelVO.orgId.id == org.id>
														<option value="${org.id}" selected="selected">${org.name}</option>
													<#else>
														<option value="${org.id}">${org.name}</option>
													</#if>
												</#list>
											</select>
										</#if>
									</div>
									<div class="span4">
										<span class="formTitle">年份</span>
										<input id="workYear" name="workYear" class="span6 Wdate" type="text" style="cursor:pointer;" value="${(orgWorkHourModelVO.workYear)!""}" onclick="WdatePicker({dateFmt:'yyyy',skin:'whyGreen'});" />
									</div>
									<div class="span4">
										<span class="formTitle">月份</span>
										<input id="workMonth" name="workMonth" class="span6 Wdate" type="text" style="cursor:pointer;" value="${(orgWorkHourModelVO.workMonth)!""}" onclick="WdatePicker({dateFmt:'MM',skin:'whyGreen'});" />
									</div>
								</div>
								<div class="row-fluid">
									<div class="span4">
									</div>
									<div class="span4">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
												<#--
												<#if user_key.optMap??>
													<#if user_key.optMap['export']??>
														<button class="btn btn-info" type="button" onclick="exportLaborHourInfo();">导出</button>
													</#if>
												</#if>
												-->
											</div>
										</div>
									</div>
								</div>
								<table class="table table-bordered table-striped tablecut" id="smpl_tbl" >
									<thead>
										<th width="5%">序号</th>
										<th width="35%">用工部门</th>
										<th width="15%">年份</th>
										<th width="15%">月份</th>
										<th width="20%">审核状态</th>
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
														<#if (r.processStatus)??>
															<#if user_key.optMap['approve']?? && (r.nextApprover)?? && r.nextApprover.id=currentUserId>
																待审核
															<#else>
																${approveMap[r.processStatus]}
															</#if>
														<#else>
															待审核
														</#if>
													</td>
													<td class="autocut">
														<a href="${rc.contextPath}/sponsor/laborHour/view/queryLaborHourAllList.do?id=${(r.id)!""}" target="_blank" class="sepV_a" title="查看"><i class="icon-list-alt"></i></a>
														<#if user_key.optMap['approve']?? && (r.nextApprover)?? && r.nextApprover.id=currentUserId>
															<a href="#" onclick="goApproveLaborHourInfo('${r.id}')" title="审核"><i class="icon-check"></i></a>
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
			//查询
			function queryLaborHour(){
				var queryLaborHourInfoForm = $("#queryLaborHourInfoForm");
				queryLaborHourInfoForm.attr("action","${rc.contextPath}/sponsor/approveSchoolLaborHour/opt-approve/querySchoolWorkHourList.do");
				queryLaborHourInfoForm.submit();
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
				$("#queryLaborHourInfoForm").attr("action","${rc.contextPath}/sponsor/laborHour/opt-query/exportexportLaborHour.do");
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
			//跳转到审核页面
			function goApproveLaborHourInfo(id){
				window.location.href = "${rc.contextPath}/sponsor/approveLaborHour/opt-approve/queryApproveWorkHourListInfo.do?id="+id;
			}
		</script>
		<#--脚本结束-->
	</body>
</html>