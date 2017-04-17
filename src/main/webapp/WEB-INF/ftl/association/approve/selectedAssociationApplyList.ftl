						<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
							<thead>
								<tr>
								<th width="5%">序号</th>
								<th width="25%">社团名称</th>
								<th width="8%">社团编号</th>
								<th width="10%">所属学院</th>
								<th width="8%">社团类型</th>
								<th width="8%">申请类型</th>
								<th width="8%">负责人</th>
								<th width="10%">指导老师</th>
							</tr>
							</thead>
							<tbody>
							<#if aamList??>	
								<#list aamList as p>
								<tr>
									<td><div align="center">${p_index+1}</td>
									<td class="autocut">
										<#if p.orignAssociationName??>
											<a href="${rc.contextPath}/association/apply/opt-view/viewApply.do?applyId=${p.id}"  target='_blank' class="sepV_a" title="查看">${(p.orignAssociationName!"")?html}</a>
										</#if>
									</td>
									<td class="autocut"><#if p.associationPo??>${(p.associationPo.associationCode!"")?html}</#if></td>
									<td class="autocut"><#if p.college??>${(p.college.name!"")?html}</#if></td>
									<td class="autocut">
										<#if p.orignAssociationType??>
											${(p.orignAssociationType.name!"")?html}
										</#if>
									</td>
									<td class="autocut"><#if p.applyTypeDic??>${(p.applyTypeDic.name!"")?html}</#if></td>
									<td class="autocut">${(p.orignManagerName!"")?html}</td>
									<td class="autocut"><#if p.applyTypeDic.id == changeApply.id && p.changedAdvisorName??>${(p.changedAdvisorName!"")?html}<#else>${(p.orignAdvisorName!"")?html}</#if></td>
								</tr>
							</#list>
							</#if>
							</tbody>
						</table>