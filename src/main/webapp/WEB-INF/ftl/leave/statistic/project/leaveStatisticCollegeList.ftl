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
			<#include "/leave/statistic/project/leaveStatisticsForm.ftl" />
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
						<th width="7%">办理年份</th>
						<th width="10%">学院</th>
						<th width="7%">离校人数</th>
						<th width="11%">公寓管理中心</br>(已办理/办理率)</th>
						<th width="11%">图书信息中心</br>(已办理/办理率)</th>
						<th width="10%">计财处</br>(已办理/办理率)</th>
						<th width="11%">一卡通</br>(已办理/办理率)</th>
						<th width="11%">组织部</br>(已办理/办理率)</th>
						<th width="11%">保卫处</br>(已办理/办理率)</th>
						<th width="11%">二级学院</br>(已办理/办理率)</th>
					</tr>
				</thead>
				<#-- 选中的数据项ID -->
				<input type="hidden" id="checkedIds" name="checkedIds" value="">
				<tbody>
					<#if page??>	
						<#list page.result as p>
						<tr>
							<td class="autocut">${p[1]!""?html}</td>
							<td class="autocut">${p[3]!""?html}</td>
							<td class="autocut">${p[4]!"0"?html}</td>
							<td class="autocut">${p[5]!"0"?html}/<#if p[4]??>${p[6]!"0"?html}<#if p[6]?? && p[6] != 0>%</#if><#else>0</#if></td>
							<td class="autocut">${p[7]!"0"?html}/<#if p[4]??>${p[8]!"0"?html}<#if p[8]?? && p[8] != 0>%</#if><#else>0</#if></td>
							<td class="autocut">${p[9]!"0"?html}/<#if p[4]??>${p[10]!"0"?html}<#if p[10]?? && p[10] != 0>%</#if><#else>0</#if></td>
							<td class="autocut">${p[17]!"0"?html}/<#if p[4]??>${p[18]!"0"?html}<#if p[18]?? && p[18] != 0>%</#if><#else>0</#if></td>
							<td class="autocut">${p[11]!"0"?html}/<#if p[4]??>${p[12]!"0"?html}<#if p[12]?? && p[12] != 0>%</#if><#else>0</#if></td>
							<td class="autocut">${p[13]!"0"?html}/<#if p[4]??>${p[14]!"0"?html}<#if p[14]?? && p[14] != 0>%</#if><#else>0</#if></td>
							<td class="autocut">${p[15]!"0"?html}/<#if p[4]??>${p[16]!"0"?html}<#if p[16]?? && p[16] != 0>%</#if><#else>0</#if></td>
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