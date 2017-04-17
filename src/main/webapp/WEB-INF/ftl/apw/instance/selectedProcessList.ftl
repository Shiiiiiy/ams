<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
	<thead>
		<tr>
			<th width="10%" ><div align="center">序号</div></th>
						<th width="15%" ><div align="center">流程定义</div></th>
						<th width="15%" ><div align="center">审批环节</div></th>
						<th width="15%" ><div align="center">发起人</div></th>
						<th width="15%" ><div align="center">发起时间</div></th>
						<th width="15%" ><div align="center">审批人</div></th>
						<th width="15%" ><div align="center">审批状态</div></th>
		</tr>
	</thead>
	<tbody>
	     <#if page??>
	          <#list page.result as p>
			<tr>
				<td class="autocut"><div align="center">${p_index+1}</div></td>
				<td class="autocut"><div align="center"><#if p.flowDefinePo??>${p.flowDefinePo.processName!""}</#if></div></td>
				<td class="autocut"><div align="center"><#if p.flowConfigPo??>${p.flowConfigPo.taskName!""}</#if></div></td>
				<td class="autocut"><div align="center"><#if p.initiator??>${p.initiator.name!""}</#if></div></td>
				<td class="autocut"><div align="center">${((p.submitTime)?string('yyyy-MM-dd'))!""}</div></td>
				<td class="autocut"><div align="center"><#if p.approver??>${p.approver.name!""}</#if></div></td>
				<td class="autocut"><div align="center">${p.approveResult!""}</div></td>
			</tr>
			</#list>
		</#if>	
	</tbody>
</table>