<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
		<thead>
			<tr>
			    <th width="15%">学院</th>
			    <th width="10%">年级</th>
				<th width="10%">学生总数</th>
				<th width="10%">男生</th>
				<th width="10%">男生占比</th>
				<th width="10%">女生</th>
				<th width="10%">女生占比</th>
			</tr>
		</thead>
		<tbody>
		<#if collegeCountList??>	
			<#list collegeCountList as p>
			<tr>		
				<td class="autocut">${p.college.name!""?html}</td>
				<td class="autocut">${p.grade!""?html}</td>
				<td class="autocut">${p.totalCount!""?html}</td>
				<td class="autocut">${p.boy!""?html}</td>
				<td class="autocut">${((p.boy*100)/p.totalCount)?string("#.##")}%</td>
				<td class="autocut">${p.girl!""?html}</td>
				<td class="autocut">${((p.girl*100)/p.totalCount)?string("#.##")}%</td>
			</tr>
			</#list>
		 </#if> 
		</tbody>
	</table>