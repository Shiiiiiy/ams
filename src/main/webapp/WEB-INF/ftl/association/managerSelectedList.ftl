<form  id="managerForm"  method="post" action="${rc.contextPath}/association/apply/managerQueryOnPage.do">
<input type="hidden" id="hiddenManagerIds" name="managerIds" value=${hiddenManagerIds!""}/>
<input type="hidden" id="oldManagerIds" name="oldManagerIds" value=${oldManagerIds!""}/>
</form>
<div id="managerInfoPage">
  <#if hasStuData=="true" && hiddenManagerIds?? && hiddenManagerIds!="">
	<div role="grid" class="dataTables_wrapper form-inline" id="dt_gal_wrapper" name="associationManager">
		<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
			<thead>
				<tr>
					<th width="6%">序号</th>
					<th width="13%">学号</th>
					<th width="13%">姓名</th>
					<th width="13%">联系方式</th>
					<th width="15%">班级</th>
					<th width="15%">学院</th>
					<th width="15%">社团职务</th>
				</tr>
			</thead>
			<tbody>
  		<#if hasStuData=="true">
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
				<td class="autocut">
					<select size="1" <#if p.memberPo??>id="${p.memberPo.id}"</#if> name="${p.memberPo.id}" aria-controls="dt_gal" class="span52 leaguePosition"  
					<#if operateStatus?? && operateStatus!='MANAGER_SAVE'>disabled="disabled"</#if>
					<#if  curUserId?? && curUserId!=proprieterRegister>disabled="disabled"</#if>
					<#if  applyTypeCode?? && applyTypeCode='MODIFY' && !(modifyItemInfo?? && modifyItemInfo?contains('ASSOCIATION_MANAGER'))>disabled="disabled"</#if>
					onchange="setMemberPosition('<#if p.associationPo??>${p.associationPo.id!""}</#if>','<#if p.memberPo??>${p.memberPo.id!""}</#if>','${p.id!""}',this.value)">
						<#if associationManagerList ??>
					      <#list associationManagerList as g>
							<#if p.leaguePosition?? && p.leaguePosition.id == g.id>
								<option  value="${g.id}" selected="selected">${g.name}</option>	
							<#else>
								<option value="${g.id}" >${g.name}</option>
							</#if>
						   </#list>
						</#if>
					</select>	
				</td>
			</tr>
			</#list>
			</#if>
			</tbody>
		</table>
	 	 <#assign pageTagformId="managerForm" isAjaxForm="true"/>
 		 <#include "/page_stu.ftl">
	</div>
 </#if> 	
</div>