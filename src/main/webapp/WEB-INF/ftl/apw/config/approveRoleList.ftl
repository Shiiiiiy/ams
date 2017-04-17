<form  id="approveRoleForm"  method="post" action="${rc.contextPath}/apw/config/opt-query/getApprovePosition.do">
<input type="hidden" id="approveType" name="approveType" value="${approveType!""}"/>
</form>
<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
	<thead>
		<tr>
			<th width="10%">序号</th>
			<th>角色名称</th>
			<th>角色类型</th>
			<th>角色状态</th>
		</tr>
	</thead>
	<tbody>
	<#if rolePage??>
		<#list rolePage.result as p>
		<tr>
			<td class="autocut">
				<div align="center">
							<input type="radio" name="apwRole" value="${p.id}" onclick="setSelectedPosition('${p.id}','${p.name}')"
							<#if agentPosition?? && agentPosition == p.id>
								checked
							</#if>
							/>
				</div>
			</td>
			<td class="autocut">${p.name}</td>
			<td class="autocut">${(p.roleTypeDic.name!"")?html}</td>
			<td class="autocut">${(p.statusDic.name!"")?html}</td>
		</tr>
		</#list> 
	</#if>
	</tbody>
</table>
<#assign pageTagformId="approveRoleForm" isAjaxForm="true"/>
<#include "/page_role.ftl" > 
</div>