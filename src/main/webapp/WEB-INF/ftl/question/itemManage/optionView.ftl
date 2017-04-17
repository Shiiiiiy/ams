
	<div class="row-fluid">
		<div role="grid" class="dataTables_wrapper form-inline" id="dt_gal_wrapper">	
		<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
			<thead>
				<tr>
					<th  width="15%">选项顺序</th>
					<th  width="45%">选项名称</th>
					<th  width="40%">选项链接</th>
				</tr>
			</thead>

			<tbody>
			<#if optionList??>	
				<#list optionList as p>
				<tr>
					<td class="autocut">${(p.seqNum!"")?html}</td>
					<td class="autocut">${(p.optionName!"")?html}</td>
			      	<td class="autocut">${(p.optionUrl?html)!""}</td>
					</tr>
					</#list>
				 </#if> 
				</tbody>
			</table>
		</div>
	</div>	
