<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="${rc.contextPath}/css/bdp_comp.css" type="text/css" />
</head>
<body>
<div id="contentwrapper">
	<div class="main_content">
		<div class="row-fluid">
			<form id="startupClassApplyStatisticList" action="" method="post">
				<div class="span12">
					<div class="row-fluid">
							<div class="span4">
								<span class="formTitle">学年</span>
								<select size="1" id="schoolYear" name="schoolYear.id" aria-controls="dt_gal" class="span6 selectoption" >
									<option value="" />请选择..</option>
									<#list schoolYearList as d>
										<#if po.schoolYear?? && po.schoolYear.id==d.id>
					    	            	<option  value="${d.id}" selected="selected">${d.name?html}</option>
					    	            <#else>
					    	            	<option  value="${d.id}" >${d.name?html}</option>
					    	            </#if>
									</#list>
								</select>
							</div>
							
							<div class="span4">
								<span class="formTitle">&nbsp;&nbsp;&nbsp;名称</span>
								<input class="span6" name="className" value="${po.className!""}"/>
							</div>
							
							<div class="span4">
								<span class="formTitle">主题</span>
								<input class="span6" name="classTheme" value="${po.classTheme!""}"/>
							</div>
					</div>
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">类型</span>
							<select size="1" id="growthClassType" name="classType.id" aria-controls="dt_gal" class="span6 selectoption">
								<option value="" />请选择..</option>
								<#list classTypeList as d>
									<#if po.classType?? && po.classType.id==d.id>
				    	            	<option  value="${d.id}" selected="selected">${d.name?html}</option>
				    	            <#else>
				    	            	<option  value="${d.id}" >${d.name?html}</option>
				    	            </#if>
								</#list>
							</select>
						</div>
						<#if flag=false>
							<div class="span4">
								<span class="formTitle">班主任</span>
								<input class="span6" name="teacherName" value="${po.teacherName!""}"/>
							</div>
						</#if>
						<div class="span4">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="btn btn-info" type="button" onClick="queryStartupApplyStatisticPage();">查 询</button>
							<button class="btn btn-info" type="button" onclick="comp.clearForm('startupClassApplyStatisticList')">清 空</button>
						</div>
					</div>
				</div>
			</form>
			<div class="row-fluid">
				<div class="span12">
					<h5 class="heading"></h5>
					<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
					<table class="table table-bordered table-striped tablecut" id="smpl_tbl" >
						<thead>
							<tr>
								<th width="5%">序号</th>
								<th width="10%">学年</th>
								<th width="15%">名称</th>
								<th width="20%">主题</th>
								<th width="10%">类型</th>
								<th width="10%">班主任</th>
								<th width="10%">结业人数</th>
								<th width="10%">未结业人数</th>
								<th width="10%">总人数</th>
							</tr>
						</thead>
						<tbody>
							<#if page??>
								<#list page.result as p>
									<tr>
										<td class="autocut">${p_index+1}</td>
										<td class="autocut">${p.schoolYear.name!""}</td>
										<td class="autocut">${p.className!""}</td>
										<td class="autocut">${p.classTheme!""}</td>
										<td class="autocut">${p.classType.name!""}</td>
										<td class="autocut">${p.teacherName!""}</td>
										<td class="autocut">
											<#if p.completeNum??>
												<a href="${rc.contextPath}/training/apply/opt-view/viewStudentInfo.do?growthId=${p.id!""}&flag=complete " title="查看结业学生的详情">${p.completeNum!""}</a>
											<#else>
												0
											</#if>
										</td>
										<td class="autocut">
										<#if p.uncompleteNum??>
											<a href="${rc.contextPath}/training/apply/opt-view/viewStudentInfo.do?growthId=${p.id!""}&flag=uncomplete " title="查看未结业学生的详情">${p.uncompleteNum!""}</a>
										<#else>
											0
										</#if>
										</td>
										<td class="autocut">${p.sumNum!'0'}</td>
									</tr>
								</#list>
							</#if>
						</tbody>
					</table>
					 <#assign pageTagformId="startupClassApplyStatisticList"/>
					 <#include "/page.ftl">
				</div>
			</div>
		</div>
	</div>
</div>

<script>
//统计查询
function queryStartupApplyStatisticPage() {
	$("#startupClassApplyStatisticList").attr("action", "${rc.contextPath}/training/startupClassStatistic/opt-query/queryStartupClassStatisticPage.do");
	$("#startupClassApplyStatisticList").attr("method", "post");
	$("#startupClassApplyStatisticList").submit();
}
</script>
</body>
</html>