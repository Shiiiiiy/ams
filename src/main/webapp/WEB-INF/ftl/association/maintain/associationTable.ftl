<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
	<thead>
		<tr>
		  <th width="4%"></th>
			<th width="16%">所属学院</th>
			<th width="16%">社团编号</th>
			<th width="16%">社团名称</th>
			<th width="16%">社团类型</th>
			<th width="16%">社长</th>
			<th width="16%">申请时间</th>
		</tr>
	</thead>
	<tbody>
	<#if page??>	
		<#list page.result as p>
		<tr>		
		    <td><div align="center"><input type="radio" name="selectedAssociation"/></td>
			<td class="autocut"><#if p.associationPo?? && p.associationPo.college??>${(p.associationPo.college.name!"")?html}</#if></td>
			<td class="autocut"><#if p.associationPo??>${(p.associationPo.associationCode!"")?html}</#if></td>
			<td class="autocut"><#if p.associationPo??>${(p.associationPo.associationName!"")?html}</#if></td>
			<td class="autocut"><#if p.associationPo?? && p.associationPo.associationType??>${(p.associationPo.associationType.name!"")?html}</#if></td>
			<td class="autocut"><#if p.associationPo?? && p.associationPo.proprieter??>${(p.associationPo.proprieter.name!"")?html}</#if></td>
			<td class="autocut"><#if p.associationPo??>${(p.associationPo.applyTime!"")?html}</#if></td>
		</tr>
		</#list>
	 </#if> 
	</tbody>
</table>
<#-- 
 <#assign pageTagformId="associationRadioForm"/>
 <input id="pageTotalCount" name="pageTotalCount" type="hidden"  value="${page.totalCount}"/>
 <#include "/page.ftl">
	 -->