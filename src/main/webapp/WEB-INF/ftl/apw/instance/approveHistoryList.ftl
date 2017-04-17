<form  id="approveHistoryForm_"  method="post" action="${rc.contextPath}/apw/instance/opt-query/getApproveHistory.do">
</form>
<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
	<thead>
		<tr>
			<th width="4%"><div align="center" valign="center">序号</div></th>
			<th width="12%" ><div align="center">流程定义</div></th>
			<th width="12%" ><div align="center">审批环节</div></th>
			<th width="12%" ><div align="center">审批顺序</div></th>
			<th width="12%" ><div align="center">发起人</div></th>
			<th width="12%" ><div align="center">发起时间</div></th>
			<th width="12%" ><div align="center">审批人</div></th>
			<th width="12%" ><div align="center">审批结果</div></th>
			<th width="12%" ><div align="center">审批时间</div></th>
		</tr>
	</thead>
	<tbody>
	<#if historyPage??>	
		<#list historyPage.result as p>
			<tr>
				<td><div align="center">${p_index+1}</div></td>
				<td class="autocut"><div align="center"><#if p.flowDefinePo??>${p.flowDefinePo.processName!""}</#if></div></td>
				<td class="autocut"><div align="center"><#if p.taskName??>${p.taskName!""}</#if></div></td>
				<td class="autocut"><div align="center">${p.approveSeq!""}</div></td>
				<td class="autocut"><div align="center"><#if p.initiator??>${p.initiator.name!""}</#if></div></td>
				<td class="autocut"><div align="center">${((p.submitTime)?string('yyyy-MM-dd'))!""}</div></td>
				<td class="autocut"><div align="center"><#if p.approver??>${p.approver.name!""}</#if></div></td>
				<td class="autocut"><div align="center"><#if p.approveResultDic??>${p.approveResultDic.name!""}</#if></div></td>
				<td class="autocut"><div align="center">${((p.approveTime)?string('yyyy-MM-dd'))!""}</div></td>
			</tr>
		</#list>
	 </#if> 
	</tbody>
</table>
<#assign pageTagformId="approveHistoryForm_"  isAjaxForm="true"/>
<#include "/page_hisotry.ftl">
</div>