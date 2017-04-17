<form  id="stuSelectedListForm"  method="post" action="${rc.contextPath}/question/quesManage/opt-query/stuqueryOnPage.do">
	<input type="hidden" id="hiddenStuIds" name="studentIds" value="${hiddenStuIds!""}"/>
</form>
<div id="stuSelectedList">
  <#if page?? && page.result?? && page.result?size&gt;0>	
	<div role="grid" class="dataTables_wrapper form-inline" id="dt_gal_wrapper">
		<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
			<thead>
				<tr>
					<th width="4%">序号</th>
					<th width="16%">姓名</th>
					<th width="16%">性别</th>
					<th width="16%">学号</th>
					<th width="16%">班级</th>
					<th width="16%">专业</th>
					<th width="16%">学院</th>
				</tr>
			</thead>
			<tbody>
		<#list page.result as p>
			<tr>
				<td>${p_index+1}</td>
				<td class="autocut">${(p.name)!""}</td>
				<td class="autocut"><#if p.genderDic??>${(p.genderDic.name)!""}</#if></td>
				<td class="autocut">${(p.stuNumber)!""}</td>
				<td class="autocut"><#if p.classId??>${(p.classId.className)!""}</#if></td>
				<td class="autocut"><#if p.major??>${(p.major.majorName)!""}</#if></td>
				<td class="autocut"><#if p.college??>${(p.college.name)!""}</#if></td>
			</tr>
			</#list>
			</tbody>
		</table>
	 	 <#assign pageTagformId="stuSelectedListForm" isAjaxForm="true"/>
 		 <#include "/page.ftl">
	</div>
 </#if> 	
</div>
