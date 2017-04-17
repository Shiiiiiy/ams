         <div class="row-fluid">	
			    		<form  id="apwDefineQuery"  action="${rc.contextPath}/apw/define/opt-query/getDefinitionList.do" method="post">
							<div class="span12">			
								<div class="row-fluid">
									<div class="span8" align="left">
									</div>
									<div class="span4"></div>
								</div>
							</div>
						</form>
						  <div class="row-fluid">
						  <div class="span12">
							<h5 class="heading"></h5>
							<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
							   <div class="row">
                                    <div class="span6">
                                        <div class="dt_actions">
                                            <div class="btn-group">
                                                <button class="btn btn-info" type="button"  onclick="popedit()"">
                                                  	  新 增
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
							<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
								<thead>
									<tr>
										<th width="8%" ><div align="center">序号</div></th>
										<th width="8%" ><div align="center">审批流程名称</div></th>
										<th width="8%" ><div align="center">审批流程状态</div></th>
										<th width="10%" ><div align="center">启禁用</div></th>
										<th width="10%" ><div align="center">操作</div></th>
									</tr>
								</thead>
								<tbody>
								  <#if page??>
								      <#list page.result as p>
										<tr>
										    <td class="autocut"><div align="center">${p_index+1}</div></td>
											<td class="autocut"><div align="center"><a href="${rc.contextPath}/apw/config/opt-query/getConfigurationList.do?id=${(p.id!"")?html}">${(p.processName!"")?html}</a></div></td>
											<td class="autocut"><div align="center">${(p.status.name!"")?html}</div></td>
											<td class="autocut"><div align="center">
											<a id="" href="###" title="禁用" onclick="stopExchange('')">
											   <i id="" class="icon-green" title="启用"> </i>
											</a>
											
                                            <a id="" href="###" title="禁用" onclick="stopExchange('')">
                                                 <i class="icon-stop" title="禁用"> </i>
                                            </a>
                                            </div>
                                            </td>
											<td class="autocut"><div align="center"><a href="#" class="sepV_a" title="修改"><i class="icon-pencil"></i></a></div></td>
										</tr>
										 </#list>
										</#if>
								</tbody>
							</table>
						</div>
						 <#assign pageTagformId="apwDefineQuery"/>
						 <!--用于用户导出 -->
						<input id="pageTotalCount" name="pageTotalCount" type="hidden"  value="${page.totalCount}"/>
						 <#include "/page.ftl">
					</div>
				</div>
		</div> 