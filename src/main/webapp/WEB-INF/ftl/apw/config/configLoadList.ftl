<div role="grid" class="dataTables_wrapper form-inline" id="dt_gal_wrapper">
<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
	<thead>
		<tr>
			<th width="5%" ><div align="left">序号</div></th>
			<th width="16%" ><div align="left">流程名称</div></th>
			<th width="16%" ><div align="left">审批环节名称</div></th>
			<th width="16%" ><div align="left">审批类型</div></th>
			<th width="16%" ><div align="left">审批执行者</div></th>
			<th width="16%" ><div align="left">审批顺序</div></th>
			<th width="15%" ><div align="left">操作</div></th>
		</tr>
	</thead>
	<tbody>
	     <#if page??>
	          <#list page.result as p>
			<tr>
				<td class="autocut"><div align="left">${(p.taskSeq!"")?html}</div></td>
				<td class="autocut"><div align="left">${(p.flowDefinePo.processName!"")?html}</div></td>
				<td class="autocut"><div align="left">${(p.taskName!"")?html}</div></td>
				<td class="autocut"><div align="left">${(p.ptype.name!"")?html}</div></td>
				<td class="autocut"><div align="left">${(p.agentPosname!"")?html}</div></td>
				<td class="autocut">
				<div align="left">
				<a href="###" onclick="apw.moveUp('${p.id}','${p.flowDefinePo.id}')" title="上移"><i class="icon-circle-arrow-up"></i></a>
                <a href="###" onclick="apw.moveDown('${p.id}','${p.flowDefinePo.id}')" title="下移"><i class="icon-circle-arrow-down"></i></a>
				</div></td>
				<td class="autocut">
				<div align="left">
				<a href="###"  onclick="popedit('${p.id!""}','${p.flowDefinePo.id!""}')" class="sepV_a" title="修改"><i class="icon-edit"></i></a>
				<a href="###" onclick="apw.deleteItem('${p.id!""}','${p.flowDefinePo.id!""}')" title="删除"><i class="icon-trash"></i></a>
				</div>
				</td>
			</tr>
			</#list>
		</#if>	
	</tbody>
</table>
<#assign pageTagformId="apwConfigQuery"/>
<#include "/page.ftl">
</div>