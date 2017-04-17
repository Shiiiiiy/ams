<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
	<thead>
		<tr>
			<th width="10%">学年</th>
			<th width="20%">奖项名称</th>
			<th width="10%">类型</th>
			<th width="10%">学院</th>
			<th width="15%">专业</th>
			<th width="10%">班级</th>
		</tr>
	</thead>
	<tbody>
	     <#if classList??>
	          <#list classList as p>
			<tr>
				<td class="autocut">${p.awardTypeId.schoolYear.name!""?html}</td>
				<td class="autocut">${(p.awardTypeId.awardInfoId.awardName!"")?html}</td>
				<td class="autocut">${(p.awardTypeId.awardType.name!"")?html}</td>
				<td class="autocut">${(p.classId.major.collage.name)!""}</td>
				<td class="autocut">${(p.classId.major.majorName!"")?html}</td>
				<td class="autocut">${(p.classId.className!"")?html}</td>
			</tr>
			</#list>
		</#if>	
	</tbody>
</table>