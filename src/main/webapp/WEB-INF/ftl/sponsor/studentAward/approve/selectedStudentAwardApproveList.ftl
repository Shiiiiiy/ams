<table class="table table-bordered table-striped tablecut" id="smpl_tbl" >
	<thead>
		<tr>
			<th width="8%">姓名</th>
			<th width="8%">学号</th>
			<th width="8%">奖助类型</th>
			<th width="10%">家庭经济情况</th>
			<th width="8%">学年</th>
			<th width="8%">学院</th>
			<th width="8%">专业</th>
			<th width="8%">班级</th>
		</tr>
	</thead>
	<tbody>
		<#if stuList??>	
			<#list stuList as p>
				<tr>
					<td class="autocut">${(p.difficultStudentInfo.student.name)!""}</td>
					<td class="autocut">${(p.difficultStudentInfo.student.stuNumber)!""}</td>
					<td class="autocut">${(p.awardType.name)!""}</td>
					<td class="autocut">${(p.familyFinance.name)!""}</td>
					<td class="autocut">${(p.schoolYear.name)!""}</td>
					<td class="autocut">${(p.difficultStudentInfo.student.college.name)!""}</td>
					<td class="autocut">${(p.difficultStudentInfo.student.major.majorName)!""}</td>
					<td class="autocut">${(p.difficultStudentInfo.student.classId.className)!""}</td>
				</tr>
			</#list>
		 </#if> 
	</tbody>
</table>