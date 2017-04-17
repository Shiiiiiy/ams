                        <div class="row-fluid">
					    <div class="span12">
                        <h3 class="heading">评奖评优</h3>
						<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
						<#if studentApplyInfoList ?? && studentApplyInfoList?size &gt; 0  >
                        <table class="table table-bordered table-striped tablecut" id="smpl_tbl">
							<thead>
								<tr>
								    <th width="6%">序号</th>
									<th width="12%">学年</th>
									<th width="12%">类型</th>
									<th width="70%">奖项名称</th>									
								</tr>
							</thead>
							<tbody>
								<#list studentApplyInfoList as p>
								 <tr>		
								    <td>${p_index+1}</td>
								    <td class="autocut"><#if p.awardTypeId.schoolYear ??>${p.awardTypeId.schoolYear.name!""?html}</#if></td>
								    <td class="autocut"><#if p.awardTypeId ?? && p.awardTypeId.awardType??>${p.awardTypeId.awardType.name!""?html}</#if></td>
								    <td class="autocut"><#if p.awardTypeId ?? && p.awardTypeId.awardInfoId ??><a href="${rc.contextPath}/reward/studentquery/viewStudent.do?id=${p.id}"  target='_blank' class="sepV_a" title="查看">${p.awardTypeId.awardInfoId.awardName!""?html} <#if p.awardTypeId?? && p.awardTypeId.secondAwardName??> &nbsp;（${p.awardTypeId.secondAwardName.name!""?html}）</#if></a></#if></td>
								</tr>
								</#list>
							</tbody>
						</table>
						<#else>
						<div class="row-fluid">
					        <div class="span12">
						        <span class="f_req">该生暂无评奖评优信息！</span>
						    </div>
						</div>
						<br />
						</#if>
						</div>
						<br/>
						
                        <h3 class="heading">违纪信息</h3>
                        <div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
                        <#if PunishInfoList ?? && PunishInfoList?size &gt; 0 >
                        <table class="table table-bordered table-striped tablecut" id="smpl_tbl">
							<thead>
								<tr>
								    <th width="6%">序号</th>
								    <th width="12%">学年</th>
									<th width="12%">学期</th>
								    <th width="20%">处分名称</th>
									<th width="12%">处分日期</th>
									<th width="40%">处分原因</th>
								</tr>
							</thead>
							<tbody>
								<#list PunishInfoList as p>
								<tr>		
								    <td>${p_index+1}</td>
								    <td class="autocut"><#if p.punishYear ?? >${p.punishYear.name!""?html}</#if></td>
									<td class="autocut"><#if p.punishTerm ?? >${p.punishTerm.name!""?html}</#if></td>
									<td class="autocut"><#if p.punish ?? ><a href="${rc.contextPath}/reward/querypunish/opt-query/viewPunishInfo.do?id=${p.id}"  target='_blank' class="sepV_a" title="查看">${p.punish.name!""?html}</a></#if></td>
									<td class="autocut"><#if p.punishStartDate ?? >${(p.punishStartDate!"")?string("yyyy-MM-dd")}</#if></td>
									<td class="autocut">${p.punishReason!""?html}</td>
								</tr>
								</#list>
							</tbody>
						<#else>
						<div class="row-fluid">
					        <div class="span12">
						        <span class="f_req">该生暂无违纪信息！</span>
						    </div>
						</div>
						<br />
						</#if>
						</table>
						</div>
						<br />
						
						<h3 class="heading">校内奖励</h3>
                        <div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
                        <#if collegeAwardList ??  && collegeAwardList?size &gt; 0>
                        <table class="table table-bordered table-striped tablecut" id="smpl_tbl">
							<thead>
								<tr>
								    <th width="6%">序号</th>
								    <th width="12%">学年</th>
								    <th width="12%">学期</th>
									<th width="48%">奖励名称</th>
									<th width="15%">奖励日期</th>
								</tr>
							</thead>
							<tbody>
								<#list collegeAwardList as p>
								<tr>		
								    <td>${p_index+1}</td>
								    <td class="autocut"><#if p.schoolYear ?? >${p.schoolYear.name!""?html}</#if></td>
									<td class="autocut"><#if p.schoolTerm ?? >${p.schoolTerm.name!""?html}</#if></td>
									<td class="autocut"><#if p.awardName ?? ><a href="${rc.contextPath}/reward/collegeaward/opt-view/viewCollegeAward.do?id=${p.id}"  target='_blank' class="sepV_a" title="查看">${p.awardName!""?html}</a></#if></td>
									<td class="autocut"><#if p.awardTime ?? >${(p.awardTime!"")}</#if></td>
								</tr>
								</#list>
							</tbody>
						<#else>
						<div class="row-fluid">
					        <div class="span12">
						        <span class="f_req">该生暂无校内奖励信息！</span>
						    </div>
						</div>
						<br />
						</#if>
						</table>
						</div>
						<br />
						
						
                        <h3 class="heading">国家奖助</h3>
                        <div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
                        <#if countryBurseInfoList ??  && countryBurseInfoList?size &gt; 0>
                        <table class="table table-bordered table-striped tablecut" id="smpl_tbl">
							<thead>
								<tr>
								    <th width="6%">序号</th>
									<th width="12%">学年</th>
									<th width="80%">奖助类型</th>
								</tr>
							</thead>
							<tbody>
								<#list countryBurseInfoList as p>
								<tr>		
								    <td>${p_index+1}</td>
									<td class="autocut"><#if p.schoolYear ?? >${p.schoolYear.name!""?html}</#if></td>
									<td class="autocut">
									<#if p.burseName ?? && p.burseName.code=="COUNTRY_AWARD" ><a href="${rc.contextPath}/reward/countryaward/viewCountryBurse.do?id=${p.id}"  target='_blank' class="sepV_a" title="查看">${p.burseName.name!""?html} <#if p.helpGrade??>（${p.helpGrade.name!""?html}）</#if><a/></#if>
									<#if p.burseName ?? && p.burseName.code=="COUNTRY_INSPIRE_AWARD" ><a href="${rc.contextPath}/reward/inspireaward/viewInspireBurse.do?id=${p.id}"  target='_blank' class="sepV_a" title="查看">${p.burseName.name!""?html} <#if p.helpGrade??>（${p.helpGrade.name!""?html}）</#if><a/></#if>
									<#if p.burseName ?? && p.burseName.code=="HELP_AWARD" ><a href="${rc.contextPath}/reward/helpaward/viewHelpBurse.do?id=${p.id}"  target='_blank' class="sepV_a" title="查看">${p.burseName.name!""?html} <#if p.helpGrade??>（${p.helpGrade.name!""?html}）</#if><a/></#if>
                                    </td>
								</#list>
							</tbody>
						</table>
					    <#else>
						<div class="row-fluid">
					        <div class="span12">
						        <span class="f_req">该生暂无国家奖助信息！</span>
						    </div>
						</div>
						</#if>
						</div>
						<br />
						
						</div>
						</div>
                        