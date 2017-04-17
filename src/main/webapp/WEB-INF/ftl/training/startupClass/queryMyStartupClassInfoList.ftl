<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<!-- ajax form-->
	<script src="${rc.contextPath}/js/jquery.form.js"></script>
	<script type="text/javascript" src="${rc.contextPath}/js/common/cascadecommon.js"></script>
</head>
<body>
<div id="contentwrapper">
	<div class="main_content">  
		<div class="row-fluid">
			<div class="span12">
			<form id="myCassInfoQuery" method="post" action="${rc.contextPath}/training/startupClassInfo/opt-query/queryMyStartupClassPage.do">
				<div class="row-fluid">
					<div class="span4">
						<span class="fromTitle">名称</span>
						<input name="growthId.growthClassName"  class="span6" value="${(po.growthId.growthClassName)!""}"/>
	    			</div>
					<div class="span4">
						<span class="fromTitle">类型</span>
						<select size="1" id="growthClassType" name="growthId.growthClassType.id" aria-controls="dt_gal" class="span6 selectoption">
							<option value="" />请选择..</option>
							<#list classTypeList as d>
							<#if (po.growthId.growthClassType.id)?? && po.growthId.growthClassType.id==d.id>
								<option  value="${d.id}" selected="selected">${d.name?html}</option>
							<#else>
								<option  value="${d.id}" >${d.name?html}</option>
							</#if>
							</#list>
						</select>
					</div>
					<div class="span4">
						<span class="fromTitle">结业状态</span>
						<select size="1" id="completeStatus" name="completeStatus.id" aria-controls="dt_gal" class="span6 selectoption">
							<option value="" />请选择..</option>
							<#list completeStatusList as d>
							<#if (po.completeStatus)?? && po.completeStatus.id==d.id>
								<option  value="${d.id}" selected="selected">${d.name?html}</option>
							<#else>
								<option  value="${d.id}" >${d.name?html}</option>
							</#if>
							</#list>
						</select>
					</div>
				</div>	
	    		</div>
	    	</div>
		</form>
			<div class="btnCenter">
				<button class="btn btn-info" onclick="queryMyClassInfo()">查 询</button>
  				<input type="button" class="btn btn-info"  onclick="comp.clearForm('myCassInfoQuery')" value="清 空"/>
			</div>
			
		<div class="row-fluid">
			<div class="span12">
				<h5 class="heading"></h5>
				<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
					<div class="row">
						<div class="span10">
							<div class="dt_actions">
								<div class="row-fluid">
								</div>
							</div>
						</div>
					</div>
					<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
						<thead>
							<tr>
								<th width="6%" >序号</th>
								<th width="12%" >学年</th>
								<th width="15%" >名称</th>
								<th width="15%" >类型</th>
								<th width="32%" >主题</th>
								<th width="10%" >班主任</th>
								<th width="10%" >结业状态</th>
							</tr>
						</thead>
						<tbody>
							<#if page??>	
								<#list page.result as p>
									<tr>
										<td class="autocut">${p_index+1}</td>
										<td class="autocut">${(p.growthId.schoolYear.name)!""}</td>
										<td class="autocut">
											<a href="###" onclick="viewMyClassInfo('${(p.growthId.id)!""}')">${(p.growthId.growthClassName)!""}</a>
										</td>
										<td class="autocut">${(p.growthId.growthClassType.name)!""}</td>
										<td class="autocut">${(p.growthId.growthClassTheme)!""}</td>
										<td class="autocut">${(p.growthId.growthClassLeader.name)!""}</td>
										<td class="autocut">${(p.completeStatus.name)!""}</td>
									</tr>
								</#list>
							 </#if> 
						</tbody>
					</table>
					<#assign pageTagformId="myCassInfoQuery"/>
					<#include "/page.ftl">
				</div>
			</div>
		</div>
	</div>
</div>
<script>
//页面查询
function queryMyClassInfo() {
	$("#myCassInfoQuery").submit();
}
//查看
//查看
function viewMyClassInfo(id) {
	window.open("${rc.contextPath}/training/startupclass/opt-view/viewStartupClass.do?id=" + id);
}
</script>
</body>
</html>