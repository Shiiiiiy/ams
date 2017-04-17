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
		<script src="${rc.contextPath}/js/apw/apw_check.js"></script>
		<script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
		<script src="${rc.contextPath}/js/common/common_approve.js"></script>
	</head>
	<body>
		<div id="contentwrapper">
			<div class="main_content">
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<span class="formTitle">学年</span>
							</div>
							<div class="span9">
								<input class="span6" type="text" readonly="readonly" value="${(orgWorkHourModelPO.schoolYear.name)!""}"/>
							</div>
						</div>
						<div class="span6">
							<div class="span3">
								<span class="formTitle">学期</span>
							</div>
							<div class="span9">
								<input class="span6" type="text" readonly="readonly" value="${(orgWorkHourModelPO.schoolTerm.name)!""}"/>
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<span class="formTitle">用工部门</span>
							</div>
							<div class="span9">
								<input id="id" type="hidden" value="${(orgWorkHourModelPO.id)!""}"/>
								<input id="orgName" name="orgId.name" class="span6" type="text" readonly="readonly" value="${(orgWorkHourModelPO.orgId.name)!""}"/>
							</div>
						</div>
						<div class="span6">
							<div class="span3">
								<span class="formTitle">年月</span>
							</div>
							<div class="span9">
								<input name="yearAndMonth" class="span6" type="text" readonly="readonly" value="${(orgWorkHourModelPO.workYear)!""}-${(orgWorkHourModelPO.workMonth)!""}" />
							</div>
						</div>
					</div>
				</div>
				<br/>
				<#include "/sponsor/work/laborHour/laborHourAllList.ftl">
				<br/>
				<div class="row-fluid" >
					<div class="span6">
						<button class="btn btn-info" type="button" onclick="approve.showHis($('#id').val());">审批历史</button>
						<button class="btn" onclick="window.close();">关 闭</button>
					</div>
				</div>
			</div>
		</div>
		<#-- 审核历史查看 -->
		<#include "/apw/instance/approveHistory.ftl">
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
			//取消
			function backUp(){
				window.location.href = "${rc.contextPath}/sponsor/addLaborHour/opt-query/queryOrgWorkHourPage.do";
			}
		</script>
		<#--脚本结束-->
	</body>
</html>