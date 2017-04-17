
	<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
		<thead>
			<tr>
				<th width="10%">序号</th>
				<th width="30%">问卷名称</th>
				<th width="20%">创建日期</th>
				<th width="20%">启用日期</th>
				<th width="15%">问卷类型</th>
				<th width="15%">问卷状态</th>
				<th width="10%">操作</th>
			</tr>
		</thead>
		<tbody>
		<#if page??>	
		<#list page.result as p>
		<tr>
			<td>${p_index+1}</td>
			<td class="autocut">${(p.name)!""}</td>
			<td class="autocut">${(p.createTime)!""}</td>
			<td class="autocut">${(p.releaseDate)!""}</td>
			<td class="autocut"><#if p.typeDic??>${(p.typeDic.name)!""}</#if></td>
			<td class="autocut"><#if p.statusDic??>${(p.statusDic.name)!""}</#if></td>
			<td>
		 		<a href="javascript:void(0)" onclick="viewUsers('${p.id}')" class="sepV_a" title="查看"><i class="icon-list-alt"></i></a>&nbsp; <a href="javascript:void(0)" onclick="exportPagerInfo('${p.id}')" class="sepV_a" title="导出"><i class="icon-share"></i></a>
			</td>
		</tr>
		</#list>
	 </#if> 	
		</tbody>
	</table>
	
	<script>
	  function exportPagerInfo(questionid){
	   comp.confirm("确定要导出问卷答案数据？",function(r){
			if(r){
			window.open("../../quesUser/opt-query/exportAnswerInfo.do?queid="+questionid);
			}
		});
		return;}
	
	</script>
	