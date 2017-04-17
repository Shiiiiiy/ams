<h5 class="heading"></h5>
	<div role="grid" class="dataTables_wrapper form-inline" id="dt_gal_wrapper">
		<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
			<thead>
				<tr>
					<th width="4%">序号</th>
					<th width="24%">问题名称</th>
					<th width="24%">问题类型</th>
					<th width="24%">题型</th>
				</tr>
			</thead>
			<tbody>
			<#if questionItemList??>	
			<#list questionItemList as p>
			<tr>
				<td>${p_index+1}<input type="hidden" name="itemOptionIndex" value="${p_index+1}"/></td>
				<td class="autocut">
					<a onclick="viewItem('${p.id}')" style="cursor: pointer" class="sepV_a" title="查看">${(p.itemName)!""}</a>
				</td>
				<td class="autocut"><#if p.itemCategory??>${(p.itemCategory.name)!""}</#if></td>
				<td class="autocut"><#if p.itemType??>${(p.itemType.name)!""}</#if></td>
			</tr>
			</#list>
		 </#if> 	
			</tbody>
		</table>
	</div>
