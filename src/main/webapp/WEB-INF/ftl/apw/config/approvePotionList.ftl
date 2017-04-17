<form  id="approvePositionForm"  method="post" action="${rc.contextPath}/apw/config/opt-query/getApprovePosition.do">
<input type="hidden" id="approveType" name="approveType" value="${approveType!""}"/>
</form>
<div role="grid" class="dataTables_wrapper form-inline" id="dt_gal_wrapper">
<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
<thead>
	<tr>
		<th width="4%"></th>
		<th width="28%">岗位名称</th>
		<th width="28%">岗位编码</th>
		<th width="20%">岗位等级</th>
		<th width="20%">岗位状态</th>
	</tr>
</thead>
<tbody>
<#if positionPage??>
	<#list positionPage.result as p>
	<tr>
		<td class="autocut">
			<div align="center">
						<input type="radio" name="apwPosition" value="${p.id}" onclick="setSelectedPosition('${p.id}','${p.name}')"
							<#if agentPosition?? && agentPosition == p.id>checked</#if>
						/>
			</div>
		</td>
		<td class="autocut">${p.name!""}</td>
		<td class="autocut">${p.code!""}</td>
		<td class="autocut"><#if p.levelDic??>${(p.levelDic.name!"")?html}</#if></td>
		<td class="autocut"><#if p.levelDic??>${(p.statusDic.name!"")?html}</#if></td>
	</#list> 
</#if>
</tbody>
</table>
 <#assign pageTagformId="approvePositionForm" isAjaxForm="true"/>
<#include "/page_position.ftl">
</div>
