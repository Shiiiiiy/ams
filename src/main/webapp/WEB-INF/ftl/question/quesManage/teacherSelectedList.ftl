<form  id="teacherSelectedListForm"  method="post" action="${rc.contextPath}/question/quesManage/opt-query/teacherqueryOnPage.do">
	<input type="hidden" id="hiddenTeacherIds" name="teacherIds" value="${hiddenTeacherIds!""}"/>
</form>
<div id="teacherSelectedList">
  <#if teacherPage?? && teacherPage.result?? && teacherPage.result?size&gt;0>	
	<div role="grid" class="dataTables_wrapper form-inline" id="dt_gal_wrapper">
		<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
			<thead>
				<tr>
					<th width="4%">序号</th>
					<th width="24%">姓名</th>
					<th width="24%">性别</th>
					<th width="24%">职工号</th>
					<th width="24%">隶属单位</th>
				</tr>
			</thead>
			<tbody>
		<#list teacherPage.result as p>
			<tr>
				<td>${p_index+1}</td>
				<td class="autocut">${(p.name)!""}</td>
				<td class="autocut"><#if p.gender??>${(p.gender.name)!""}</#if></td>
				<td class="autocut">${(p.id)!""}</td>
				<td class="autocut"><#if p.org??>${(p.org.name)!""}</#if></td>
			</tr>
			</#list>
			</tbody>
		</table>
	 	 <#assign pageTagformId="teacherSelectedListForm" isAjaxForm="true"/>
 		 <#include "/page_teacher.ftl">
	</div>
 </#if> 	
</div>
