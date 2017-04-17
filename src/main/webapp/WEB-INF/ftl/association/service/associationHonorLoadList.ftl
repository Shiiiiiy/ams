<div id="associationHonorLoadDiv">
<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
	<thead>
		<tr>
		    <th width="6%">
	    	<div align="center">
	    			<#--<input type="checkbox" id="mainBox" onclick="comp.selectAllCheckbox('mainBox','memberService')"/>
	    			-->
	    			序号
	    	</div>
		    </th>
			<th width="7%">姓名</th>
			<th width="9%">学号</th>
			<th width="8%">学年</th>
			<th width="8%">学期</th>
			<th width="15%">荣誉名称</th>
			<th width="11%">荣誉时间</th>
			<th width="10%">荣誉级别</th>
			<th width="6%">状态</th>
			<th width="9%">审核状态</th>
			<th width="11%">操作</th>
		</tr>
	</thead>
	<tbody>
	<#if page??>	
		<#list page.result as p>
		<tr>		
		    <td>
		    <div align="center">
				<#--<input type="checkbox" name="memberService" 
				<#if p.member?? && p.member.memberPo??> value="${(p.id!"")?html}"</#if>/>-->
				${p_index+1}
			</div>
		    </td>
			<td class="autocut"><#if p.member?? && p.member.memberPo??>${(p.member.memberPo.name!"")?html}</#if></td>
			<td class="autocut"><#if p.member?? && p.member.memberPo??>${(p.member.memberPo.stuNumber!"")?html}</#if></td>
			<td class="autocut">${(p.honorYear.name!"")?html}</td>
			<td class="autocut">${(p.honorTerm.name!"")?html}</td>
			<td class="autocut">${(p.honorName!"")?html}</td>											
			<td class="autocut">${((p.honorTime!"")?string("yyyy-MM-dd"))?html}</td>
			<td class="autocut"><#if p.honorLevel??>${(p.honorLevel.name!"")?html}</#if></td>
			<td class="autocut"><#if p.operateStatus??>${(p.operateStatus.name!"")?html}</#if></td>
			<td class="autocut"><#if p.approveResult??>${(p.approveResult.name!"")?html}</#if></td>
			<td class="autocut">
				<a href="${rc.contextPath}/association/service/opt-view/honorView.do?id=${(p.id)!''}" target="_blank" title="查看荣誉信息"> <i class="icon-list-alt"></i></a>										
				&nbsp;
				<#if user_key.optMap??>
					<#if user_key.optMap['update']?? && ((p.operateStatus??&&p.operateStatus.code=="SAVE")||(p.approveResult??&&p.approveResult.code=="REJECT"))>
						<a href="${rc.contextPath}/association/service/opt-update/editMemberHonor.do?id=${p.id}&associationId=${associationId!""}" class="sepV_a" title="编辑社员荣誉信息"><i class="icon-edit"></i></a>
					</#if>
					<#if user_key.optMap['del']??&& p.operateStatus??&&p.operateStatus.code=="SAVE"&&(!p.approveResult??)>
				   		<a href="javascript:void(0);" onclick="deleteAssociationHonor('${(p.honorName)!""}','${p.id!""}');" class="sepV_a" title="删除社员荣誉信息"><i class="icon-trash"></i></a>
					</#if>
				</#if>
			   <#if user_key.optMap['approve']?? && p.operateStatus.code=="SUBMIT" && (p.approveResult.code=="NOT_APPROVE")>
			   			<a href="${rc.contextPath}/association/service/opt-approve/honorApproveEdit.do?id=${p.id}&associationId=${associationId!""}" class="sepV_a" title="审核社员荣誉信息"><i class="icon-check"></i></a>
			   </#if>
            </td>
		</tr>
		</#list>
	 </#if> 
	</tbody>
</table>
 <#assign pageTagformId="classQuery"/>
 <input id="pageTotalCount" name="pageTotalCount" type="hidden"  value="${page.totalCount}"/>
 <#include "/page.ftl">
</div>