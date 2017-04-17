<table class="table table-bordered table-striped tablecut" id="smpl_tbl" >
	<thead>
		<tr>
				<th width="8%">姓名</th>
				<th width="8%">学号</th>
				<th width="9%">学年</th>
				<th width="10%">学院</th>
				<th width="12%">专业</th>
				<th width="12%">班级</th>
				<th width="8%">班级排名</th>
				<th width="7%">职务</th>
				<th width="9%">计算机等级</th>
				<th width="8%">外语等级</th>
				<th width="8%">状态</th>
		</tr>
	</thead>
	<tbody>
		<#if stuList??>	
			<#list stuList as p>
				<tr>
					<td class="autocut"><a target="_blank" href="${rc.contextPath}/job/approveProvinceGoodStudent/opt-view/approveProvinceGoodStudentView.do?id=${(p.id)!''}&&flag=view" title="查看省优秀毕业生信息">${(p.schoolGoodStudent.studentId.name)!""}</a></td>
					<td class="autocut">${(p.schoolGoodStudent.studentId.stuNumber)!""}</td>
					<td class="autocut">${(p.schoolGoodStudent.schoolYear.name)!""}</td>
					<td class="autocut">${(p.schoolGoodStudent.studentId.college.name)!""}</td>
					<td class="autocut">${(p.schoolGoodStudent.studentId.major.majorName)!""}</td>
					<td class="autocut">${(p.schoolGoodStudent.studentId.classId.className)!""}</td>
					<td class="autocut">${(p.schoolGoodStudent.classSort)!""}</td>
					<td class="autocut">${(p.schoolGoodStudent.post)!""}</td>
					<td class="autocut">${(p.schoolGoodStudent.computerLevel)!""}</td>
					<td class="autocut">${(p.schoolGoodStudent.englishLevel)!""}</td>
					<td class="autocut">${(p.status.name)!""}</td>
				</tr>
			</#list>
		 </#if> 
	</tbody>
</table>