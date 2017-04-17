<div class="row-fluid" id="smpl_tbl">
	<div class="span12">
		<table class="table table-bordered table-striped tablecut">
			<thead>
				<tr>
					<th width="10%">序号</th>
					<th>菜单名称</th>
					<th>菜单链接</th>
					<#if level??>  
						<#if level=='2'>
							<th width="15%">菜单操作</th>
						<#else>
							<th>图标样式</th>
						</#if>
					</#if>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
			<#if menuList??>
				<#list menuList as m>
				<tr>
					<td>${m_index+1}</td>
					<td class="autocut">${m.name?html}</td>
					<#if m.link??>
						<td class="autocut">${m.link?html}</td>
					<#else>
						<td></td>
					</#if>
					<#if level??>
						<#if level=='2'>
							<td><a href="#" onclick="popMenuOptList('${m.id}')" title="菜单操作"><i class="icon-th-list"></i></a></td>
						<#else>
							<#if m.classCode??>
								<td class="autocut">${m.classCode?html}</td>
							<#else>
								<td></td>
							</#if>
						</#if>
					</#if>
					<td>
					<!--<a href="#" onclick="popAddWin('${m.id}')" title="增加下级"><i class="icon-trash"></i></a>-->
						<a href="#" onclick="popEditWin('${m.id}')" title="修改"><i class="icon-pencil"></i></a>
						<a href="#" onclick="delTreeNode('${m.id}')" title="删除"><i class="icon-trash"></i></a>
						<a href="#" onclick="upTreeNode('${m.id}')" title="上移"><i class="icon-circle-arrow-up"></i></a>
						<a href="#" onclick="downTreeNode('${m.id}')" title="下移"><i class="icon-circle-arrow-down"></i></a>
						<a href="#" onclick="popMoveWin('${m.id}')" title="调整"><i class="icon-move"></i></a>
					</td>
				</tr>
				</#list> 
			</#if>
			</tbody>
		</table>
		
	</div>
</div>