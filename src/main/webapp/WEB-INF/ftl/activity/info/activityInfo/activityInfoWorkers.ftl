	<form  id="activityWorkersListForm"  method="post" action="${rc.contextPath}/activity/signup/nsm/loadActivityWorkersList.do">
		<input type="hidden" id="activityId" name="activityId" value="${activity.id!""}"/>
    </form>
    <div id="activityWorkersList">
      <#if page?? && page.result?? && page.result?size&gt;0>	
        <div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
		  <table class="table table-bordered table-striped tablecut" id="smpl_tbl">
			<thead>
				<tr>
				    <th width="25%">序号</th>
					<th width="25%">姓名</th>
					<th width="25%">组织机构</th>
					<th width="25%">操作</th>
				</tr>
			</thead>
			<tbody>
				<#list page.result as p>
					<#if p.workerPo ??>
						<tr>		
						    <td>${p_index+1}</td>
							<td class="autocut">${p.workerPo.name!""?html}</td>
							<td class="autocut"><#if p.workerPo.org ??>${p.workerPo.org.name!""?html}</#if></td>									
							<td class="autocut"></td>
						</tr>
					</#if>
				</#list>
			</tbody>
		</table>	
		  <#assign pageTagformId="activityWorkersListForm"  isAjaxForm="true"/>
		  <#include "/page.ftl">
		</div>
		<#else>
		<div class="row-fluid">
			<div class="span12">
		        <span class="f_req">该活动暂无工作人员信息</span>
		    </div> 
		</div>
		<br/>
		</#if>
		</div>
		
