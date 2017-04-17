<div id="difficultList">
    <#if difficultList?? && difficultList?size&gt;0>	
        <div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
		    <table class="table table-bordered table-striped tablecut" id="smpl_tbl" >
				<thead>
					<tr>
						<th width="6%">序号</th>
						<th width="10%">推荐档次</th>
						<th width="9%">学年</th>
						<th width="10%">学院</th>
						<th width="10%">专业</th>
						<th width="10%">班级</th>
						<th width="8%">状态</th>
						<th width="10%">审核状态</th>
					</tr>
				</thead>
				<tbody>
					<#list difficultList as p>
						<tr>
							<td>${p_index+1}</td>
							<td class="autocut">${(p.difficultLevel.name)!""}</td>
							<td class="autocut">${(p.schoolYear.name)!""}</td>
							<td class="autocut">${(p.student.college.name)!""}</td>
							<td class="autocut">${(p.student.major.majorName)!""}</td>
							<td class="autocut">${(p.student.classId.className)!""}</td>
							<td class="autocut">${(p.status.name)!""}</td>
							<td class="autocut">
							<#if p.processStatus ??>
								${processStatusMap[p.processStatus]}
							<#elseif p.status.code="SUBMIT">
								审核中
							</#if>
							</td>
						</tr>
					</#list>
				</tbody>
			</table>	
        </div>
    <#else>
		<div class="row-fluid">
			<div class="span12">
		        <span class="f_req">该学生暂无困难生信息</span>
		    </div> 
		</div>
		<br/>
	</#if>
</div>
		
