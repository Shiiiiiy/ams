<div id="memberLoadListDiv">
<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
	<thead>
		<tr>
		    <th width="4%">
		    	<div align="center">
		    			<input type="checkbox" id="mainBox" onclick="comp.selectAllCheckbox('mainBox','curMember')"/>
		    	</div>
		    </th>
			<th width="9%">姓名</th>
			<th width="11%">学号</th>
			<th width="6%">性别</th>
			<th width="12%">学院</th>
			<th width="12%">专业</th>
			<th width="12%">班级</th>
			<th width="12%">联系方式</th>
			<th width="9%">社团职务</th>
			<th width="9%">审核状态</th>
			<th width="8%">操作</th>
		</tr>
	</thead>
	<tbody>
	<#if page??>	
		<#list page.result as p>
		<tr>		
		    <td>
			    <div align="center">
					<#if !(p.isManager?? && p.isManager.code=='Y') && p.registerForm?? && p.registerForm.code=='ACTIVITY_OFFLINE'>
			    		<input type="checkbox" name="curMember" <#if p.memberPo??> value="${(p.memberPo.id!"")?html}"</#if>/>
			    	</#if>
			    </div>
		    </td>
			<td class="autocut"><#if p.memberPo??>${(p.memberPo.name!"")?html}</#if></td>
			<td class="autocut"><#if p.memberPo??>${(p.memberPo.stuNumber!"")?html}</#if></td>
			<td class="autocut"><#if p.memberPo?? && p.memberPo.genderDic??>${(p.memberPo.genderDic.name!"")?html}</#if></td>
			<td class="autocut"><#if p.memberPo?? && p.memberPo.college??>${(p.memberPo.college.name!"")?html}</#if></td>
			<td class="autocut"><#if p.memberPo?? && p.memberPo.major??>${(p.memberPo.major.majorName!"")?html}</#if></td>
			<td class="autocut"><#if p.memberPo?? && p.memberPo.classId??>${(p.memberPo.classId.className!"")?html}</#if></td>
			<td class="autocut" 
			<#if p.memberPo?? && p.memberPo.phone1??>
				title="手机">${(p.memberPo.phone1!"")?html}
			<#elseif p.memberPo?? && p.memberPo.phone2??>
				title="手机">${(p.memberPo.phone2!"")?html}
			<#elseif p.memberPo?? && p.memberPo.email??>
				title="邮箱">${(p.memberPo.email!"")?html}
			<#elseif p.memberPo?? && p.memberPo.qq??>
				title="QQ">${(p.memberPo.qq!"")?html}
			</#if>
			</td>
			<td class="autocut">
				<#if p.leaguePosition??>
					${(p.leaguePosition.name!"")?html}
				<#elseif p.isManager?? && p.isManager.code=='Y'>
					负责人
				</#if>
			</td>
			<td class="autocut" id=${p.memberPo.id}_td><#if p.memberStatus??>${(p.memberStatus.name!"")?html}</#if></td>
			<td class="autocut">
         	<#if user_key.optMap??>
				<#if user_key.optMap['approve']?? && !(p.isManager?? && p.isManager.code=='Y')>
					<#--
					<#if !((p.isManager?? && p.isManager.code=='Y') || (p.memberStatus?? && p.memberStatus.code=='PASS'))>
			 		<a href="#"  target='_self' class="sepV_a" title="同意" 
					<#if p.memberPo??>onclick="applyApprove('${(p.memberPo.id!"")?html}')"</#if>><i class="icon-check"></i></a>
					</#if>
					-->
					<#if p.registerForm?? && p.registerForm.code=='ACTIVITY_ONLINE'>
						<#if p.memberStatus ?? && p.memberStatus.id!='2c9d5081506a167301506a3ac0ad0002'>
					   		<a href="###" onclick="pass('${p.memberPo.id}')" title="通过" id=${p.memberPo.id}_pass><i class="icon-check"></i></a>
					    </#if>
					    <#if p.memberStatus ?? && p.memberStatus.id!='2c9d5081506a167301506a3b04540003'>
					   		<a href="###" onclick="applyApprove('${p.memberPo.id}')" title="拒绝" id=${p.memberPo.id}_reject><i class="icon-share-alt"></i></a>
					    </#if>
					</#if>
				</#if>
				<#if user_key.optMap['del']?? && (p.isManager?? && p.isManager.code=='N') && p.registerForm?? && p.registerForm.code=='ACTIVITY_OFFLINE'>
			 		<a href="#"  target='_self' class="sepV_a" title="删除成员" 
			 		<#if p.memberPo??>onclick="deleteMember('${(p.memberPo.id!"")?html}')"</#if>><i class="icon-trash"></i></a>
				</#if>
			</#if>
            </td>
		</tr>
		</#list>
	 </#if> 
	</tbody>
</table>
 <#assign pageTagformId="associationMemberForm"/>
 <input id="pageTotalCount" name="pageTotalCount" type="hidden"  value="${page.totalCount}"/>
 <#include "/page.ftl">
</div>