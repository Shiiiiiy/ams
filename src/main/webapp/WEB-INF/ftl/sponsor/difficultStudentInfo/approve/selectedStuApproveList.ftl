<table class="table table-bordered table-striped tablecut" id="smpl_tbl" >
	<thead>
		<tr>
			<th width="8%">姓名</th>
			<th width="8%">学号</th>
			<th width="8%">推荐档次</th>
			<th width="8%">学年</th>
			<th width="8%">学院</th>
			<th width="8%">专业</th>
			<th width="8%">班级</th>
			<th width="8%">是否孤儿</th>
			<th width="8%">是否残疾</th>
			<th width="8%">是否单亲</th>
			<th width="8%">村级证明</th>
			<th width="8%">镇级证明</th>
			<th width="8%">县级证明</th>
		</tr>
	</thead>
	<tbody>
		<#if stuList??>	
			<#list stuList as p>
				<tr>
					<td class="autocut">${(p.student.name)!""}</td>
					<td class="autocut">${(p.student.stuNumber)!""}</td>
					<td class="autocut">${(p.difficultLevel.name)!""}</td>
					<td class="autocut">${(p.schoolYear.name)!""}</td>
					<td class="autocut">${(p.student.college.name)!""}</td>
					<td class="autocut">${(p.student.major.majorName)!""}</td>
					<td class="autocut">${(p.student.classId.className)!""}</td>
				</tr>
			</#list>
		 </#if> 
	</tbody>
</table>