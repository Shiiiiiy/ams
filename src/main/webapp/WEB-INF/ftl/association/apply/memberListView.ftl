<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
	<thead>
		<tr>
			<th width="6%">序号</th>
			<th width="12%">姓名</th>
			<th width="12%">学号</th>
			<th width="13%">社团职务</th>
			<th width="18%">入团时间</th>
			<th width="10%">班级</th>
			<th width="15%">专业</th>
		</tr>
	</thead>
	<#if memberList??>
		<tbody>
			<#list memberList as p>
			<tr>
				<td>${p_index+1}</td>
				<td class="autocut"><#if p.memberPo??>${(p.memberPo.name)!""}</#if></td>
				<td class="autocut"><#if p.memberPo??>${(p.memberPo.stuNumber)!""}</#if></td>
				<td class="autocut"><#if p.leaguePosition??>${(p.leaguePosition.name)!""}</#if></td>
				<td class="autocut"><#if p.joinTime??>${(p.joinTime)?string("yyyy-MM-dd")}</#if></td>
				<td class="autocut"><#if p.memberPo?? && p.memberPo.classId??>${(p.memberPo.classId.className)!""}</#if></td>
				<td class="autocut"><#if p.memberPo?? && p.memberPo.major??>${(p.memberPo.major.majorName)!""}</#if></td>
			</tr>
			</#list>
		</tbody>
	</#if>
</table>
