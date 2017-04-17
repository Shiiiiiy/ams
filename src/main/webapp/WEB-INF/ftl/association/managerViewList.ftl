<form  id="managerViewForm"  method="post" action="${rc.contextPath}/association/apply/managerQueryOnPage.do">
<input type="hidden" id="hiddenManagerIds" name="managerIds" value=${hiddenManagerIds!""}/>
</form>
<div id="managerViewPage">
  <#if hasStuData=="true">	
	<div role="grid" class="dataTables_wrapper form-inline" id="dt_gal_wrapper" name="associationManager">
		<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
			<thead>
				<tr>
					<th width="6%">序号</th>
					<th width="15%">学号</th>
					<th width="15%">姓名</th>
					<th width="15%">联系方式</th>
					<th width="20%">班级</th>
					<th width="15%">学院</th>
					<th width="14%">社团职务</th>
				</tr>
			</thead>
			<tbody>
		<#list stuPage.result as p>
			<tr>
				<td>${p_index+1}</td>
				<td class="autocut"><#if p.memberPo??>${(p.memberPo.stuNumber)!""}</#if></td>
				<td class="autocut"><#if p.memberPo??>${(p.memberPo.name)!""}</#if></td>
				<td class="autocut">
				<#if p.memberPo??&&(p.memberPo.phone1?? && p.memberPo.phone2?? && p.memberPo.email??)>
					${(p.memberPo.phone1)!""}
				<#elseif p.memberPo??&&(p.memberPo.phone2?? && p.memberPo.email??)>
					${(p.memberPo.phone2)!""}
				<#elseif p.memberPo??&&(p.memberPo.email??)>
					${(p.memberPo.email)!""}
				</#if>
				</td>
				<td class="autocut"><#if p.memberPo?? && p.memberPo.classId??>${(p.memberPo.classId.className)!""}</#if></td>
				<td class="autocut"><#if p.memberPo?? && p.memberPo.college??>${(p.memberPo.college.name)!""}</#if></td>
				<td class="autocut"><#if p.leaguePosition??>${p.leaguePosition.name}</#if></td>
				</td>
			</tr>
			</#list>
			</tbody>
		</table>
	 	 <#assign pageTagformId="managerViewForm" isAjaxForm="true"/>
 		 <#include "/page_stu.ftl">
	</div>
 </#if> 	
</div>