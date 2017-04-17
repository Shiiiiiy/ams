<table class="table table-bordered table-striped tablecut" id="smpl_tbl" >
	<thead>
		<tr>
				<th width="8%">姓名</th>
				<th width="10%">学号</th>
				<th width="10%">学年</th>
				<th width="10%">学院</th>
				<th width="10%">专业</th>
				<th width="10%">班级</th>
				<th width="10%">困难类别</th>
				<th width="15%">困难原因</th>
		</tr>
	</thead>
	<tbody>
		<#if stuList??>	
			<#list stuList as p>
				<tr>
					<td class="autocut tipTag" data="学院：${(p.studentInfo.college.name)!''}<br/>专业：${(p.studentInfo.major.majorName)!''}<br/>班级：${(p.studentInfo.classId.className)!''}<br/>"><a target="_blank" href="${rc.contextPath}/job/approvePoorStudent/opt-view/viewPoorStudent.do?id=${(p.id)!''}" title="查看双困生信息">${(p.studentInfo.name)!""}</a></td>
					<td class="autocut">${(p.studentInfo.stuNumber)!""}</td>
					<td class="autocut">${(p.schoolYear.name)!""}</td>
					<td class="autocut">${(p.studentInfo.college.name)!""}</td>
					<td class="autocut">${(p.studentInfo.major.majorName)!""}</td>
					<td class="autocut">${(p.studentInfo.classId.className)!""}</td>
					<td class="autocut">${(p.difficultType.name)!""}</td>
					<td class="autocut">${(p.reason)!""}</td>
				</tr>
			</#list>
		 </#if> 
	</tbody>
</table>