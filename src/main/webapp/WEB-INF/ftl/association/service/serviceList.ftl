
<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
	<thead>
		<tr>
		    <th width="5%">学号</th>
			<th width="18%">荣誉名称</th>
			<th width="10%">荣誉学年</th>
			<th width="10%">荣誉学期</th>
			<th width="10%">荣誉级别</th>
			<th width="15%">获得时间</th>
			<th width="30%">附件</th>
		</tr>
	</thead>
	<tbody>
	<#if honorList??>	
		<#list honorList as p>
		<tr>		
		    <td>${p_index+1}</td>
			<td class="autocut">${p.honorName!""}</td>
			<td class="autocut"><#if p.honorYear ??>${p.honorYear.name!""}</#if></td>
			<td class="autocut"><#if p.honorTerm ??>${p.honorTerm.name!""}</#if></td>
			<td class="autocut"><#if p.honorLevel ??>${p.honorLevel.name!""}</#if></td>
			<td class="autocut"><#if p.honorTime ??>${(p.honorTime)?string("yyyy-MM-dd")}</#if></td>
			<td class="autocut">
				<#if p.uploadFileList??>	
					<#list p.uploadFileList as f>
						<a href="${rc.contextPath}/sys/sysConfig/file.do?id=${f.uploadFile.id}"><strong>${f.uploadFile.name}</strong></a><br/>
					</#list>
				 </#if> 
			</td>
		</tr>
	</#list>
 </#if> 
</tbody>
</table>
