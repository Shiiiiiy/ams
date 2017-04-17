<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
	<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
		<thead>
			<tr>
				<th width="7%">序号</th>
				<th width="13%">考核学年</th>
				<th width="15%">姓名</th>
				<th width="15%">工号</th>
				<th width="35%">学院单位</th>
				<th width="15%">性别</th>
			</tr>
		</thead>
		<tbody>
			<#if teacherPage??>
				<#list teacherPage.result as p>
					<tr>
						<td class="autocut">${p_index+1}</td>
						<td class="autocut">${curYear!""}</td>
						<td class="autocut">${p.name!""}</td>
						<td class="autocut">${p.id!""}</td>
						<td class="autocut">${p.org.name!""}</td>
						<td class="autocut">${p.gender.name!""}</td>
					</tr>
				</#list>
			</#if>
		</tbody>
	</table>
	<#assign pageTagformId="_undo_teacher" isAjaxForm="true" />
	<#include "/page_teacher.ftl">
</div>
