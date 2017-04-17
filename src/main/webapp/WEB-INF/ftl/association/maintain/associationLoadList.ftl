<div id="associationListDiv">
<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
	<thead>
		<tr>
		    <th width="5%" style="text-align:center">
			    <#if user_key.optMap?? && (user_key.optMap['cancel']?? || user_key.optMap['confirm']?? || user_key.optMap['topTen']?? || user_key.optMap['starApprove']??)>
		    		<input type="checkbox" id="mainBox" onclick="comp.selectAllCheckbox('mainBox','curAssociation')"/>
			    <#else>
			      	  序号
			    </#if>
		    </th>
			<th width="18%">社团名称</th>
			<th width="8%">社团编号</th>
			<th width="10%">所属学院</th>
			<th width="8%">社团类型</th>
			<th width="8%">社团人数</th>
			<th width="8%">是否十佳</th>
			<th width="8%">星级(星)</th>
			<th width="8%">社团性质</th>
			<th width="12%">是否注销</th>
			<th width="6%">操作</th>
		</tr>
	</thead>
	<tbody>
	<#if page??>	
	<#list page.result as p>
	<tr>		
	    <td style="text-align:center">
	        <#if user_key.optMap?? && (user_key.optMap['cancel']?? || user_key.optMap['confirm']?? || user_key.optMap['topTen']?? || user_key.optMap['starApprove']??)>
		    	<#if  (p.isCancel?? && p.isCancel.code=='N') && (p.isForceCancel?? && p.isForceCancel.code=='N') || !p.isForceCancel??>
		    		<input type="checkbox" name="curAssociation" value="${(p.id!"")?html}"/>
		    	</#if>
			<#else>
			   ${(p_index+1!"")?html}
			</#if>
	    </td>
		<td class="autocut">
			<a href="${rc.contextPath}/association/maintain/opt-edit/viewAssociationInfo.do?associationId=${(p.id)?html}"  target='_blank' class="sepV_a" title="查看">
			${(p.associationName!"")?html}</a>
		</td>
		<td class="autocut">${(p.associationCode!"")?html}</td>
		<td class="autocut"><#if p.college??>${(p.college.name!"")?html}</#if></td>
		<td class="autocut"><#if p.associationType??>${(p.associationType.name!"")?html}</#if></td>
		<td class="autocut">${(p.memberNums!"")?html}</td>
		<td class="autocut"><#if p.isTopten??>${(p.isTopten.name!"")?html}</#if></td>
		<td class="autocut">${(p.honorRating!"")?html}</td>
		<td class="autocut"><#if p.isMajor??>${(p.isMajor.name!"")?html}</#if></td>
		<td class="autocut">
			<#if p.isCancel??>${(p.isCancel.name!"")?html}<#if p.isForceCancel?? && p.isForceCancel.code=='Y' && p.isCancel.code=='N'>（注销待确认）</#if></#if>
		</td>
		<td class="autocut">
             <#if user_key.optMap??>
				<#if user_key.optMap['update']??>
					<#if p.isCancel?? && p.isCancel.code=="N">
					<a href="${rc.contextPath}/association/maintain/opt-query/getAssociationMemberList.do?associationPo.id=${(p.id)?html}"  target='_self' class="sepV_a" title="成员维护"><i class="icon-user"></i></a>
                	</#if>
                </#if>
				<#if user_key.optMap['cancel']??  && ( !p.isForceCancel?? ||  p.isForceCancel.code=='N')>
					<a href="javascript:void(0)"  target='_self' class="sepV_a" title="强制注销" onclick="associationCancel('${(p.id)?html}')"><i class="icon-ban-circle"></i></a>
                </#if>
				<#if user_key.optMap['confirm']?? && isHCLL ?? && isHCLL=='true' && (p.isForceCancel?? && p.isForceCancel.code=='Y') && (p.isCancel?? && p.isCancel.code=='N') && (p.isValid?? && p.isValid.code=='Y')>
					<a href="javascript:void(0)"  target='_self' class="sepV_a" title="同意注销" onclick="associationCancelConfirm('${(p.id)?html}',<#if p.isCancel?? && p.isCancel.code=="N">'${(p.isCancel.code)?html}'<#else>''</#if>)"><i class="icon-ok"></i></a>
					<a href="javascript:void(0)"  target='_self' class="sepV_a" title="不同意注销" onclick="associationCancelRefuse('${(p.id)?html}')"><i class="icon-share-alt"></i></a>
                </#if>
			</#if>
		</td>
	</tr>
	</#list>
 </#if> 
</tbody>
</table>
 <#assign pageTagformId="associationForm"/>
 <input id="pageTotalCount" name="pageTotalCount" type="hidden"  value="${page.totalCount}"/>
 <#include "/page.ftl">
</div>