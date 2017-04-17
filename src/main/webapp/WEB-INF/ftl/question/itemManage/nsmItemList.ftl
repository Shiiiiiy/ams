<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
	<thead>
		<tr>
			<th width="6%">序号</th>
			<th width="36%">题目名称</th>
			<th width="10%">问题类型</th>
			<th width="10%">题型</th>
			<th width="12%">创建日期</th>
			<th width="10%">状态</th>
			<th width="13%">操作</th>
		</tr>
	</thead>
	<tbody>
	<#if page??>	
	<#list page.result as p>
	<tr>
	<!--
		<td><input type="checkbox" name="row_sel" class="select_row" /></td>
		-->
		<td>${p_index+1}</td>
		<td class="autocut"><a href="${rc.contextPath}/question/itemManage/opt-query/quesItemView.do?id=${(p.id)!''}" target="_blank"  class="sepV_a" title="查看" >${(p.itemName)!""}</a></td>
		<td class="autocut"><#if p.itemCategory??>${(p.itemCategory.name)!""}<#else></#if></td>
		<td class="autocut"><#if p.itemType??>${(p.itemType.name)!""}<#else></#if></td>
		<td class="autocut">${((p.createTime)?string('yyyy-MM-dd'))!""}</td>
		<td class="autocut"><#if p.useStatus??>${(p.useStatus.name)!""}<#else></#if></td>
		<td>
		<#if p.useStatus??>										 	
		 	<#if p.useStatus.code=='STATUS_SAVE'>
				<a href="${rc.contextPath}/question/itemManage/opt-query/quesItemView.do?id=${(p.id)!''}" target="_blank" class="sepV_a" title="查看"><i class="icon-list-alt"></i></a>										 		
		 		<a href="###" class="sepV_a" onClick="editItem('${(p.id)!""}');" title="编辑"><i class="icon-edit"></i></a>
		 		<a href="###" class="sepV_a" title="启用" onclick ="changeStatus('${(p.id)!""}','ENA')"><i class="icon-green"></i></a>
		 		<a href="###" class="sepV_a" title="删除" onclick="delItem('${(p.id)!""}','${(p.itemName)!""}','${(p.useStatus.code)!""}')"><i class="icon-trash"></i></a>
		 	<#elseif p.useStatus.code=='STATUS_ENABLE'>
		 		<a  href="${rc.contextPath}/question/itemManage/opt-query/quesItemView.do?id=${(p.id)!''}" target="_blank"  class="sepV_a" title="查看" ><i class="icon-list-alt"></i></a>
		 		<a href="###" class="sepV_a" title="禁用" onclick ="changeStatus('${(p.id)!""}','DIS')"><i class="icon-red"></i></a>
		 	<#elseif p.useStatus.code=='STATUS_DISABLE'>	
		 		<a  href="${rc.contextPath}/question/itemManage/opt-query/quesItemView.do?id=${(p.id)!''}" target="_blank"  class="sepV_a" title="查看" ><i class="icon-list-alt"></i></a>
		 		<a href="###" class="sepV_a" onClick="editItem('${(p.id)!""}');" title="编辑"><i class="icon-edit"></i></a>
		 		<a href="###" class="sepV_a" title="启用" onclick ="changeStatus('${(p.id)!""}','ENA')"><i class="icon-green"></i></a>
		 		<a href="###" class="sepV_a" title="删除" onclick="delItem('${(p.id)!""}','${(p.itemName)!""}','${(p.useStatus.code)!""}')"><i class="icon-trash"></i></a>										 		
		 	</#if>	
		 		
		 </#if>									
		</td>
	</tr>
	</#list>
 </#if> 	
	</tbody>
</table>