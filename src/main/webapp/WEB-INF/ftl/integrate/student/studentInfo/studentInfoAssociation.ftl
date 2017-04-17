  <div id="associationMemberList">
      <#if associationMemberList ?? && associationMemberList?size&gt;0>	
          <div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
			  <table class="table table-bordered table-striped tablecut" id="smpl_tbl">
					<thead>
						<tr>
						    <th width="6%">序号</th>
							<th width="12%">所属学院</th>
							<th width="8%">社团编号</th>
							<th width="12%">社团名称</th>
							<th width="12%">社团类型</th>
							<th width="8%">社长</th>
							<th width="10%">申请时间</th>
							<th width="8%">是否十佳</th>
							<th width="8%">社团性质</th>
							<th width="8%">审核状态</th>
						</tr>
					</thead>
					<tbody>
						<#list associationMemberList as p>
							<tr>		
							    <td><div align="center">${p_index+1}</div></td>
								<td class="autocut"><#if p.associationPo.college??>${(p.associationPo.college.name!"")?html}</#if></td>
								<td class="autocut">${(p.associationPo.associationCode!"")?html}</td>
								<td class="autocut">${(p.associationPo.associationRegisterName!"")?html}</td>
								<td class="autocut"><#if p.associationPo.associationType??>${(p.associationPo.associationType.name!"")?html}</#if></td>
								<td class="autocut"><#if p.associationPo.proprieter??>${(p.associationPo.proprieter.name!"")?html}</#if></td>
								<td class="autocut">${(p.associationPo.applyTime!"")?html}</td>
								<td class="autocut"><#if p.associationPo.isTopten??>${(p.associationPo.isTopten.name!"")?html}</#if></td>
								<td class="autocut"><#if p.associationPo.isMajor??><#if p.associationPo.isMajor.code=='Y'>专业<#elseif p.associationPo.isMajor.code=='N'>非专业</#if></#if></td>
						        <td class="autocut"><#if p.memberStatus??>${(p.memberStatus.name!"")?html}</#if></td>
							</tr>
						</#list>
					</tbody>
			</table>
		</div>
      <#else>
		<div class="row-fluid">
			<div class="span12">
		        <span class="f_req">该学生暂无社团信息</span>
		    </div> 
		</div>
		<br/>
      </#if>
  </div>