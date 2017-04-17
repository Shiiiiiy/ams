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
			<#include "/leave/statistic/leaveStatisticsForm.ftl" />
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
			              					<div class="input-append">
			            					<#--span class="expsingle">单页导出条数:</span--><input id="exportSize" name="exportSize" class="span3"  value="1000" title="单页导出条数" type="hidden" />
			            					<button class="btn btn-info" type="button" onclick="exportEvaluation()">Excel导出</button>
			              					</div>
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
						<th width="20%">专业</th>
						<th width="14%">办理年份</th>
						<th width="20%">毕业人数</th>
						<th width="20%">已办人数</th>
						<th width="20%">办理率</th>
					</tr>
				</thead>
				<#-- 选中的数据项ID -->
				<input type="hidden" id="checkedIds" name="checkedIds" value="">
				<tbody>
				  	<#if page??>	
						<#list page.result as p>
						<tr>
							<td class="autocut">${p_index+1}</td>
							<td class="autocut">${p[1]!""?html}</td>
							<td class="autocut">${p[0]!""?html}</td>
							<td class="autocut">${p[2]!"0"?html}</td>
							<td class="autocut">${p[3]!"0"?html}</td>
							<td class="autocut">${p[4]!"0"?html}%</td>
						</tr>
						</#list>
				   	</#if> 
				</tbody>
				</table>
				<#assign pageTagformId="reportProgressQuery"/>
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
<div class="modal hide fade" id="exportdemo">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3 id="title1">离校办理统计表</h3>
	</div>
	<div class="modal-body" id="export_reportProgress">
		
	</div>
	<div class="modal-footer">
		<a href="#" class="btn" data-dismiss="modal">关闭</a>
	</div>
</div>
</body>
</html>