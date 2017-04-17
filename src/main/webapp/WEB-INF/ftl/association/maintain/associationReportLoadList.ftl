<div id="reportLoadListDiv">
<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
<div class="row">
    <div class="span10">
        <div class="dt_actions">
            <div class="row-fluid">
                 <#if user_key.optMap??>
					<#if user_key.optMap['add']??>

					</#if>
				</#if>
			</div>
		</div>
	</div>
</div>
<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
			<thead>
				<tr>
				    <th width="6%">序号</th>
					<th width="20%">社团名称</th>
					<th width="8%">社团编号</th>
					<th width="12%">所属学院</th>
					<th width="10%">社团类型</th>
					<th width="8%">社长</th>
					<th width="8%">是否十佳</th>
					<th width="8%">社团性质</th>
					<th width="8%">审核状态</th>
					<th width="8%">操作</th>
				</tr>
			</thead>
			<tbody>
			<#if page??>	
				<#list page.result as p>
				<tr>		
				    <td><div align="center">${p_index+1}</div></td>
					<td class="autocut">
						<a href="${rc.contextPath}/association/maintain/opt-edit/viewAssociationInfo.do?associationId=${(p.id)?html}"  target='_blank' class="sepV_a" title="查看">
						${(p.associationName!"")?html}</a>
					</td>
					<td class="autocut">${(p.associationCode!"")?html}</td>
					<td class="autocut"><#if p.college??>${(p.college.name!"")?html}</#if></td>
					<td class="autocut"><#if p.associationType??>${(p.associationType.name!"")?html}</#if></td>
					<td class="autocut"><#if p.proprieter??>${(p.proprieter.name!"")?html}</#if></td>
					<td class="autocut"><#if p.isTopten??>${(p.isTopten.name!"")?html}</#if></td>
					<td class="autocut"><#if p.isMajor??><#if p.isMajor.code=='Y'>专业<#elseif p.isMajor.code=='N'>非专业</#if></#if></td>
			        <td class="autocut"><#if p.memberStatus??>${(p.memberStatus.name!"")?html}</#if></td>
					<td class="autocut">
						<#if p.isCurAssociationMember?? && p.isCurAssociationMember=="false" && !(p.memberStatus??)>
							<a href="javascript:void(0)"  target='_self' class="sepV_a" title="报名" onclick="applyJoinCurAssociation('${(p.id!"")?html}')"><i class="icon-eye-open"></i></a>
						</#if>
						<#if p.memberStatus?? && p.associationMemberModel?? >
							<a href="javascript:void(0);" onclick="approve.showApproveComments('${p.associationMemberModel.id}');" class="sepV_a" title="审核意见查看"><i class="icon-list"></i></a>
						</#if>
					</td>
				</tr>
				</#list>
			 </#if> 
			</tbody>
		</table>
 <#assign pageTagformId="associationReportForm"/>
 <input id="pageTotalCount" name="pageTotalCount" type="hidden"  value="${page.totalCount}"/>
 <#include "/page.ftl">
</div>
</div>