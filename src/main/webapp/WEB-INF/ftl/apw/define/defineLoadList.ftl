<div id="defineListDiv" class="dataTables_wrapper form-inline" role="grid">
   <div class="row">
        <div class="span6">
            <div class="dt_actions">
                <div class="btn-group">
                    <button class="btn btn-info" type="button"  onclick="editProcessDefine('')">
                      	  新  增
                    </button>
                </div>
            </div>
        </div>
    </div>
	<table class="table table-bordered table-striped tablecut">
		<thead>
			<tr>
				<th width="6%" ><div align="left">序号</div></th>
				<th width="30%" ><div align="left">流程名称</div></th>
				<th width="40%" ><div align="left">流程KEY值</div></th>
				<th width="10%" ><div align="left">状态</div></th>
				<th width="12%" ><div align="left">操作</div></th>
			</tr>
		</thead>
		<tbody>
		  <#if page??>
		      <#list page.result as p>
				<tr>
				    <td class="autocut"><div align="center">${p_index+1}</div></td>
					<td class="autocut"><div align="left">${(p.processName!"")?html}</div></td>
					<td class="autocut"><div align="left">${(p.processKey!"")?html}</div></td>
					<td class="autocut"><div align="left">${(p.status.name!"")?html}</div></td>
					<td class="autocut">
					    <#if p.status?? && p.status.code=='ENABLE'>
                        	<a id="${p.id}_authStatus_opt" href="###" title="停用" onclick="stopAuth('${p.id}')"><i class="icon-red"></i></a>
                        	<#else>
                        	<a id="${p.id}_authStatus_opt" href="###" title="启用" onclick="startAuth('${p.id}')"><i class="icon-green"></i></a>
                        	</#if>&nbsp;
							<a href="#"  onclick="editProcessDefine('${(p.id!"")?html}')" class="sepV_a" title="修改"><i class="icon-edit"></i></a>
							<a href="#"  onclick="loadConfig('${(p.id!"")?html}','${(p.status.code!"")?html}')" class="sepV_a" title="流程节点配置"><i class="icon-list"></i></a>
					</td>
				</tr>
				 </#list>
				</#if>
		</tbody>
	</table>
	<input type="hidden" id="currentPageNo" name="currentPageNo" value="${page.currentPageNo}">
 <#assign pageTagformId="apwDefineQuery"/>
 <#include "/page.ftl">
</div>