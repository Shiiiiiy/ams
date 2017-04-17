<form  id="advisorForm"  method="post" action="${rc.contextPath}/association/apply/opt-query/advisorQueryOnPage.do">
	<input type="hidden" id="hiddenTeacherIds" name="teacherIds" value=${hiddenTeacherIds!""}/>
</form>
<div id="teacherInfoPage">
  <input type="hidden" id="teacherIds" name="teacherIds" value=${teacherIds!''}>
  <#if teacherPage?? && teacherPage.result?? && (teacherPage.result?size>0)>	
	<div role="grid" class="dataTables_wrapper form-inline" id="dt_gal_wrapper">
		<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
			<thead>
				<tr>
					<th width="6%">序号</th>
					<th width="15%">职工号</th>
					<th width="15%">姓名</th>
					<th width="15%">联系电话</th>
					<th width="20%">隶属单位</th>
					<th width="14%">操作</th>
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
				<td class="autocut">
				<#if (p.advisorPo?? && curUserId?? && curUserId==p.advisorPo.id)>
					<a href="#"  onclick="_editAdvisorInfo('${(p.associationPo.id)!""}','${(p.advisorPo.code)!""}')"  class="sepV_a" title="填写简介"><i class="icon-pencil"></i></a>
				</#if>
				</td>
			</tr>
			</#list>
			</tbody>
		</table>
		<!-- 
	 	 <#assign pageTagformId="advisorForm" isAjaxForm="true"/>
 		 <#include "/page_teacher.ftl">
		 -->
	</div>
 </#if> 	
</div>