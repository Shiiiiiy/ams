
	<table class="table table-bordered tablecut" id="smpl_tbl">
		<thead>
			 <tr>
				<th width="10%"  style="text-align:center;vertical-align:middle;">课程(无课打勾)</th>
				<#list weekList as item >
					<th width="6%" class="autocut"  style="text-align:center;vertical-align:middle;">${item.name!""}</th>
				</#list>
			</tr>
		</thead>
		<tbody id="data_tbody">
			<#if lessonList ??>
				<#list lessonList as lesson>
					<tr>
						<td class="autocut" style="text-align:center;vertical-align:middle;">${lesson.name!""}</td>
						<#list weekList as d >
						 	<#assign weekKey="${d.id!''}_${lesson.id!''}"/>
							<#if weekMap[weekKey] ??>
								<td class="autocut"  style="text-align:center;vertical-align:middle;">
									<input type="checkbox" checked="true" name ="lessonCheckBox" id="" value="${lesson.id}_${d.id}"/>
								</td>
							<#else>
								<td class="autocut"  style="text-align:center;vertical-align:middle;">
									<input type="checkbox"     name ="lessonCheckBox" id="" value="${lesson.id}_${d.id}"/>
								</td>
							</#if>
						</#list>
					</tr>
				</#list>
			 </#if>
		</tbody>
	</table>
