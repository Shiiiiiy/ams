<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
	<thead>
		<tr>
			<th width="8%">序号</th>
			<th width="10%">审核人</th>
			<th width="10%">审核结果</th>
			<th width="20%">审核时间</th>
			<th width="45%">审核意见</th>
		</tr>
	</thead>
	<tbody>
		<#if commentsList??>	
			<#list commentsList as p>
				<tr>
					<td>${p_index+1}</td>
					<td class="autocut">${p.approver.name!""}</td>
					<td class="autocut">${p.approveOpinion!""}</td>
					<td class="autocut">${(p.approveTime!"")?string("yyyy-MM-dd HH:mm:ss")}</td>
					<td class="autocut">${p.approveComments!""}</td>
				</tr>
			</#list>
		 </#if> 
	</tbody>
</table>
