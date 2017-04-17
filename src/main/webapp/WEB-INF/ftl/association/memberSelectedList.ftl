<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
	<thead>
		<tr>
			<th width="6%">序号</th>
			<th width="12%">姓名</th>
			<th width="12%">学号</th>
			<th width="13%">联系方式</th>
			<th width="18%">班级</th>
			<th width="15%">学院</th>
			<th width="10%">社长</th>
		</tr>
	</thead>
		<tbody>
		   <#if studentList??>
			<#list studentList as p>
			<tr>
				<td>${p_index+1}</td>
				<td class="autocut">${(p.name)!""}</td>
				<td class="autocut">${(p.stuNumber)!""}</td>
				<td class="autocut">${(p.phone1)!""}</td>
				<td class="autocut"><#if p?? && p.classId??>${(p.classId.className)!""}</#if></td>
				<td class="autocut"><#if p?? && p.college??>${(p.college.name)!""}</#if></td>
				<td class="autocut"><#if p?? && curUserId?? && p.id == curUserId>是<#else>否</#if></td>
			</tr>
			</#list>
		  </#if>	
		</tbody>
</table>
