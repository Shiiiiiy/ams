<form  id="advisorViewForm"  method="post" action="${rc.contextPath}/association/apply/opt-query/advisorQueryOnPage.do">
	<input type="hidden" id="hiddenTeacherIds" name="teacherIds" value=${hiddenTeacherIds!""}/>
</form>
<div id="teacherViewPage">
  <#if teacherPage?? && teacherPage.result?? && teacherPage.result?size&gt;0>	
	<div role="grid" class="dataTables_wrapper form-inline" id="dt_gal_wrapper">
		<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
			<thead>
				<tr>
					<th width="8%">序号</th>
					<th width="23%">职工号</th>
					<th width="23%">姓名</th>
					<th width="23%">联系电话</th>
					<th width="23%">隶属单位</th>
				</tr>
			</thead>
			<tbody>
		<#list teacherPage.result as p>
			<tr <#if p.advisorPo??>id="${p.advisorPo.code}"</#if>>
				<td>${p_index+1}</td>
				<td class="autocut"><#if p.advisorPo??>${(p.advisorPo.code)!""}</#if></td>
				<td class="autocut"><#if p.advisorPo??>${(p.advisorPo.name)!""}</#if></td>
				<td class="autocut">${(p.phone)!""}</td>
				<td class="autocut"><#if p.advisorPo?? && p.advisorPo.org??>${(p.advisorPo.org.name)!""}</#if></td>
			</tr>
			</#list>
			</tbody>
		</table>
		<!-- 
	 	 <#assign pageTagformId="advisorViewForm" isAjaxForm="true"/>
 		 <#include "/page_teacher.ftl">
		 -->
	</div>
 </#if> 	
</div>
