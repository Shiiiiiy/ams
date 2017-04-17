<div class="row-fluid">
	<div class="span12">
		<table id="dataTable" class="table table-bordered table-striped tablecut">
			<thead>
				<th width="5%">序号</th>
				<th width="10%">学号</th>
				<th width="10%">姓名</th>
				<th width="30%">岗位</th>
				<th width="10%">岗位工资</th>
				<th width="10%">岗位工时</th>
				<th width="10%">工资小计</th>
			</thead>
			<tbody>
				<#if (orgWorkHourModelList)??>
					<#list orgWorkHourModelList as r>
						<tr>
							<td class="autocut">${r_index+1}</td>
							<td class="autocut">${(r.studentId.stuNumber)!""}</td>
							<td class="autocut tipTag" data="学院：${(r.studentId.college.name)!""}&lt;br/&gt专业：${(r.studentId.major.majorName)!""}&lt;br/&gt班级：${(r.studentId.classId.className)!""}&lt;br/&gt">
								<a target="_blank" href="${rc.contextPath}/sponsor/laborHour/view/viewLaborHour.do?id=${r.id}">
									${(r.studentId.name)!""}
								</a>
							</td>
							<td class="autocut">${(r.sponsorPosition.workName)!""}</td>
							<td class="autocut">${(r.workSalary?string('.00'))!"0.00"}</td>
							<td class="autocut">${(r.workHour)!''}</td>
							<td class="autocut"><#if r.totalSalary==0>0.00<#else>${(r.totalSalary?string('.00'))!""}</#if></td>
						</tr>
					</#list>
				</#if>
			</tbody>
		</table>
	</div>
</div>