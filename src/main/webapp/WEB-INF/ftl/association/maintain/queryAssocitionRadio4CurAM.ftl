<div>
<input type="hidden" id="applyType" value="${applyType!""}"/>
</div>
<div class="row-fluid">
		<div class="span12">
			<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
			<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
				<thead>
					<tr>
					  <th width="4%"></th>
						<th width="25%">社团名称</th>
						<th width="15%">社团编号</th>
						<th width="15%">所属学院</th>
						<th width="12%">社团类型</th>
						<th width="10%">社长</th>
						<th width="15%">注册时间</th>
					</tr>
				</thead>
				<tbody>
				<#if page??>	
					<#list page.result as p>
					<tr>		
					    <td>
				    		<div align="center">
				    			<input type="radio" name="selectedAssociation" value="${(p.id!"")?html}" />
				    		</div>
					    </td>
						<td class="autocut">${(p.associationName!"")?html}</td>
						<td class="autocut">${(p.associationCode!"")?html}</td>
						<td class="autocut"><#if p.college??>${(p.college.name!"")?html}</#if></td>
						<td class="autocut"><#if p.associationType??>${(p.associationType.name!"")?html}</#if></td>
						<td class="autocut"><#if p.proprieter??>${(p.proprieter.name!"")?html}</#if></td>
						<td class="autocut"><#if p.applyTime??>${(p.applyTime)?string("yyyy-MM-dd")}</#if></td>
					</tr>
					</#list>
				 </#if> 
				</tbody>
			</table>
	</div>
</div>
</div>
<script>
	function queryAssocition(){
		$("#associationRadioForm").submit();		
	}
</script>