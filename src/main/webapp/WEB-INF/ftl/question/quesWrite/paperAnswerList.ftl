<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
<thead>
	<tr>
		<th width="8%">序号</th>
		<th>问卷名称</th>
		<th>启用日期</th>
		<th>问卷类型</th>
		<th>答题状态</th>
		<th>操作</th>
	</tr>
</thead>
<tbody>
<#if page??>	
<#list page.result as p>
<tr>
	<td>${p_index+1}</td>
	<td class="autocut">
		<#if p.questionInfo?? && p.questionInfo.name??>
			<a onclick="viewQuestionNaire('${p.questionInfo.id}')" style="cursor: pointer" class="sepV_a" title="查看答卷">${(p.questionInfo.name)!""}</a>
		</#if>
	</td>
	<td class="autocut"><#if p.questionInfo?? && p.questionInfo.releaseDate??>${(p.questionInfo.releaseDate)!""}</#if></td>
	<td class="autocut"><#if p.questionInfo?? && p.questionInfo.typeDic??>${(p.questionInfo.typeDic.name)!""}</#if></td>
	<td class="autocut"><#if p.answerStatus??>${(p.answerStatus.name)!""}</#if></td>
	<td>
	<a href="javascript:void(0)" class="sepV_a" title="查看答卷" onclick="viewQuestionNaire('${p.questionInfo.id}')"><i class="icon-list-alt"></i></a>		
	<#if !p.answerStatus?? || (p.answerStatus?? && p.answerStatus.code=='UNCOMMITED')>
		<a href="javascript:void(0)" class="sepV_a" onClick="answerCurPaper('${p.questionInfo.id}')" title="答题"><i class="icon-edit"></i></a>
		<a href="javascript:void(0)" class="sepV_a" onClick="deleteAnswerPaper('${p.id}')" title="删除答卷"><i class="icon-trash"></i></a>
	</#if>
	</td>
</tr>
</#list>
 </#if> 	
</tbody>
</table>