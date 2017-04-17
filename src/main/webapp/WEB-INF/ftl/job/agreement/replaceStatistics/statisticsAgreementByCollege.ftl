<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="${rc.contextPath}/css/bdp_comp.css" type="text/css">
        <link rel="stylesheet" href="${rc.contextPath}/css/waiting.css" />
        
    </head>
    <body> 
	<div id="contentwrapper">
   	<div class="main_content">   
    	<div class="row-fluid">	
			<#include "/job/agreement/replaceStatistics/statisticsAgreementForm.ftl" />
			<div class="row-fluid">
			<div class="span12">
				<h5 class="heading"></h5>
				<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
				<div class="row">
					<div class="span10">
						<div class="dt_actions">
							<div class="row-fluid">
								<#if user_key.optMap??>
									<#if user_key.optMap['export']??>
										<button class="btn btn-info" type="button" id="export-button" >
						       					 导 出
						        		</button>
						        			<input id="exportSize" name="exportSize" type="hidden" class="span3"  value="1000" title="excel单页条数" />
									</#if>
								</#if>
							</div>
						</div>
					</div>
				</div>
				<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
				<thead>
					<tr>
						<th width="10%">学年</th>
						<th width="10%">学院</th>
						<th width="10%">待审核</th>
						<th width="10%">审核通过</th>
						<th width="10%">审核拒绝</th>
						<th width="10%">总人数</th>
						<th width="10%">补办率</th>
					</tr>
				</thead>
				<tbody>
				  	<#if page??>	
						<#list page.result as p>
						<tr>
							<td class="autocut">${p.employmentYear.name!""?html}</td>
							<td class="autocut">${p.college.name!""?html}</td>
							<td class="autocut">${p.submit!""?html}</td>
							<td class="autocut">${p.pass!""?html}</td>
							<td class="autocut">${p.refuse!""?html}</td>
							<td class="autocut">${p.total!""?html}</td>
							<td class="autocut"><#if p.total!=0>${((p.pass)/(p.total))?string("0.##%")}<#else>0.00%</#if></td>
						</tr>
						</#list>
				   	</#if> 
				</tbody>
				</table>
				<#assign pageTagformId="statisticsQuery"/>
				<#include "/page.ftl">
				<!--用于用户导出 -->
				<input id="pageTotalCount" name="pageTotalCount" type="hidden"  value="${page.totalCount}"/>
				</div>
				</div>
				</div>
			</div> 
		</div> 
	</div>
</div>

</body>
</html>