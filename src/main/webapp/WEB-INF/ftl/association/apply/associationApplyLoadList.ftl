<div id="applyLoadListDiv">
<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
<thead>
	<tr>
		<th width="5%">序号</th>
		<th width="11%">所属学院</th>
		<th width="8%">社团编号</th>
		<th width="16%">社团名称</th>
		<th width="8%">社团类型</th>
		<th width="8%">申请类型</th>
		<th width="8%">负责人</th>
		<th width="12%">指导老师</th>
		<th width="8%">流程状态</th>
		<th width="10%">下一审批人</th>
		<th width="6%">操作</th>
	</tr>
</thead>
<tbody>
	<#if page??>	
		<#list page.result as p>
		<tr>
			<td>
				<div align="center">${p_index+1}</td>
			<td class="autocut"><#if p.associationPo?? && p.associationPo.college??>${(p.associationPo.college.name!"")?html}</#if></td>
			<td class="autocut"><#if p.associationPo??>${(p.associationPo.associationCode!"")?html}</#if></td>
			<td class="autocut">
			<#if p.associationPo??>
				<#if p.applyTypeDic?? && p.applyTypeDic.code='REGISTER'>
				<a href="${rc.contextPath}/association/apply/opt-edit/viewAssociationRegisterApply.do?applyId=${p.id}"  target='_blank' class="sepV_a" title="查看">
				${(p.associationPo.associationRegisterName!"")?html}</a>
				<#elseif p.applyTypeDic?? && p.applyTypeDic.code='MODIFY'>
				<a href="${rc.contextPath}/association/apply/opt-edit/viewAssociationModifyApply.do?applyId=${p.id}"  target='_blank' class="sepV_a" title="查看">
				${(p.associationPo.associationName!"")?html}</a>
				<#elseif p.applyTypeDic?? && p.applyTypeDic.code='CANCEL'>
				<a href="${rc.contextPath}/association/apply/opt-edit/viewAssociationCancelApply.do?applyId=${p.id}"  target='_blank' class="sepV_a" title="查看">
				${(p.associationPo.associationName!"")?html}</a>
				</#if>
				
			</#if>
			</td>
			<td class="autocut">
				<#if p.associationPo?? && p.associationPo.associationType??>
					<#if p.applyTypeDic?? && p.applyTypeDic.code='REGISTER'&& p.associationPo.associationRegisterType??>
					${(p.associationPo.associationRegisterType.name!"")?html}
					<#else>
					${(p.associationPo.associationType.name!"")?html}
					</#if>
				</#if>
			</td>
			<td class="autocut"><#if p.applyTypeDic??>${(p.applyTypeDic.name!"")?html}</#if></td>
			<td class="autocut"><#if p.associationPo?? && p.associationPo.proprieterRegister??>${(p.associationPo.proprieterRegister.name!"")?html}</#if></td>
			<td class="autocut">${(p.advisors!"")?html}</td>
			<td class="autocut">${(p.processstatus!"")?html}</td>
			<td class="autocut"><#if p.nextapprover??>${(p.nextapprover.name!"")?html}</#if></td>
			<td class="autocut">
			<#if user_key.optMap??>
				<#if (user_key.optMap['update']?? && p.applyStatus?? && p.applyStatus=='SAVE')>
				<#if ((p.isCurAA=="true") && (p.operateStatus=='ADVISOR_SAVE'||p.operateStatus=='MANAGER_SUBMIT'))
					 || ((p.isCurAM=="true") && (p.operateStatus=='MANAGER_SAVE'))>
					<#if p.applyTypeDic.code=='REGISTER'>
					<a href="${rc.contextPath}/association/apply/opt-edit/editAssociationRegisterApply.do?applyId=${(p.id)?html}"  target='_self' class="sepV_a" title="编辑注册申请"><i class="icon-edit"></i></a>
					<#elseif p.applyTypeDic.code=='MODIFY'>
					<a href="${rc.contextPath}/association/apply/opt-edit/editAssociationModifyApply.do?applyId=${(p.id)?html}"  target='_self' class="sepV_a" title="编辑变更申请"><i class="icon-edit"></i></a>
					<#elseif p.applyTypeDic.code=='CANCEL'>
					<a href="${rc.contextPath}/association/apply/opt-edit/editAssociationCancelApply.do?applyId=${(p.id)?html}"  target='_self' class="sepV_a" title="编辑注销申请"><i class="icon-edit"></i></a>
					</#if>
            	</#if>
				<#if (user_key.optMap['del']?? && (p.isCurAM=="true") && p.operateStatus=='MANAGER_SAVE')&&((!p.processstatus??)||(p.processstatus??&&p.processstatus!='审核拒绝'))>
					<a href="javascript:void(0)"  target='_self' class="sepV_a" title="删除申请" onclick="deleteCurApply('${(p.id)?html}','${(p.applyTypeDic.code!"")?html}')"><i class="icon-trash"></i></a>
        		</#if>
			    </#if>
        	</#if>
            </td>
		</tr>
	</#list>
	</#if>
</tbody>
</table>
 <#assign pageTagformId="associationListForm"/>
 <input id="pageTotalCount" name="pageTotalCount" type="hidden"  value="${page.totalCount}"/>
 <#include "/page.ftl">
 </div>