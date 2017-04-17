
	<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
		<thead>
			<tr>
				<th width="10%">序号</th>
				<th width="30%">问卷名称</th>
				<th width="20%">创建日期</th>
				<th width="20%">启用日期</th>
				<th width="15%">问卷类型</th>
				<th width="15%">问卷状态</th>
				<th width="10%">操作</th>
			</tr>
		</thead>
		<tbody>
		<#if page??>	
		<#list page.result as p>
		<tr>
			<td>${p_index+1}</td>
			<td class="autocut"><a onclick="viewQuesInfo('${p.id}')" style="cursor: pointer" class="sepV_a" title="查看">${(p.name)!""}</a></td>
			<td class="autocut">${(p.createTime)!""}</td>
			<td class="autocut">${(p.releaseDate)!""}</td>
			<td class="autocut"><#if p.typeDic??>${(p.typeDic.name)!""}</#if></td>
			<td class="autocut"><#if p.statusDic??>${(p.statusDic.name)!""}</#if></td>
			<td>
			 	<#if p.statusDic?? && p.statusDic.code=='STATUS_SAVE'>
			 		<a href="javascript:void(0)" onclick="viewQuesInfo('${p.id}')" class="sepV_a" title="查看"><i class="icon-list-alt"></i></a>
			 		<a href="javascript:void(0)" onclick="openPapaer('${p.id}')" class="sepV_a" title="启用"><i class="icon-green"></i></a>
			 		<a href="javascript:void(0)" onclick="updateQuesInfo('${p.id}')" class="sepV_a" title="修改"><i class="icon-edit"></i></a>
			 		<a href="javascript:void(0)" onclick="delQuesInfo('${p.id}')" class="sepV_a" title="删除"><i class="icon-trash"></i></a>
			 	<#elseif p.statusDic?? && p.statusDic.code=='STATUS_DISABLE'>	
			 		<a href="javascript:void(0)" onclick="viewQuesInfo('${p.id}')" class="sepV_a" title="查看"><i class="icon-list-alt"></i></a>
			 		<a href="javascript:void(0)" onclick="openPapaer('${p.id}')" class="sepV_a" title="启用"><i class="icon-green"></i></a>
			 		<a href="javascript:void(0)" onclick="delQuesInfo('${p.id}')" class="sepV_a" title="删除"><i class="icon-trash"></i></a>
			 	<#elseif p.statusDic?? && p.statusDic.code=='STATUS_ENABLE'>
			 		<a href="javascript:void(0)" onclick="viewQuesInfo('${p.id}')" class="sepV_a" title="查看"><i class="icon-list-alt"></i></a>
			 		<a href="javascript:void(0)" onclick="shutdownPaper('${p.id}')" class="sepV_a" title="禁用"><i class="icon-red"></i></a>
			 	</#if>										
			</td>
		</tr>
		</#list>
	 </#if> 	
		</tbody>
	</table>