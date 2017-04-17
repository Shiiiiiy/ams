<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
	<thead>
		<tr>
			<th width="10%" >学年</th>
			<th width="10%" >奖项名称</th>
			<th width="10%" >二级奖项名称</th>
			<th width="5%" >类型</th>
			<th width="10%" >学院</th>
			<th width="10%" >专业</th>
			<th width="10%" >班级</th>
			<th width="10%" >姓名</th>
			<th width="10%" >学号</th>
		</tr>
	</thead>
	<tbody>
	     <#if stuList??>
	          <#list stuList as p>
			<tr>
				<td class="autocut" >${p.awardTypeId.schoolYear.name!""?html}</td>
				<td class="autocut" >${(p.awardTypeId.awardInfoId.awardName!"")?html}</td>
				<td class="autocut" ><#if p.awardTypeId.secondAwardName??>${(p.awardTypeId.secondAwardName.name!"")?html}</#if></td>
				<td class="autocut" >${p.awardTypeId.awardType.name!""}</td>
				<td class="autocut" >${(p.studentId.college.name)!""}</td>
				<td class="autocut" >${(p.studentId.major.majorName!"")?html}</td>
				<td class="autocut" >${(p.studentId.classId.className!"")?html}</td>
				<td class="autocut" >${(p.studentId.name!"")?html}</td>
				<td class="autocut" >${(p.studentId.stuNumber!"")?html}</td>
			</tr>
			</#list>
		</#if>	
	</tbody>
</table>