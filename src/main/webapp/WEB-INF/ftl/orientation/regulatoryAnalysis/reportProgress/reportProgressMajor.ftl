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
    		<#include "/orientation/regulatoryAnalysis/reportProgress/reportProgressForm.ftl" />
			<div class="row-fluid">
				<div class="span12">
					<h5 class="heading"></h5>
					<div class="dt_actions">
					    <div class="row-fluid">
					        <button class="btn btn-info" type="button" id="export-button" style="margin-bottom:10px">
					       		 导 出
					        </button>
					        <input id="exportSize" name="exportSize" type="hidden" class="span3"  value="1000" title="excel单页条数" />
					    </div>
					</div>
					<div id="reportProgressT" class="dataTables_wrapper form-inline" role="grid" style="overflow-x:scroll">
					<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
					<thead>
						<tr>
							<th width="100px">二级学院</th>
							<th width="150px">专业</th>
							<th width="70px">录取人数</th>
							<th width="70px">报到人数</th>
							<th width="70px">专业报到率</th>
							<#if provinceDicList??>
							<#list provinceDicList as lp>
								<#if lp??>
									<th width="80px">${lp.name}(录取)</th>
									<th width="80px">${lp.name}(报到)</th>
								</#if>
							</#list>
							</#if>
						</tr>
					</thead>
					<tbody>
						<#if reportProgressCountList??>
						<#list reportProgressCountList as rs>
						<tr>
							<td class="autocut">${rs.college}</td>
							<td class="autocut">${rs.major}</td>
							<td class="autocut">${rs.enterNum}</td>
							<td class="autocut">${rs.registerNum}</td>
							<td class="autocut"><#if rs.enterNum!=0>${((rs.registerNum)/(rs.enterNum))?string("0.##%")}<#else>0</#if></td>
							<#list rs.provinceList as pl>
								<td class="autocut">${pl}</td>
							</#list>
						</tr>
						</#list>
						<tr> 
							<td class="autocut" colspan="2">合计</td>
							<td class="autocut">${totalEnterNum}</td>
							<td class="autocut">${totalRegisterNum}</td>
							<td class="autocut"><#if totalEnterNum!=0>${(totalRegisterNum/totalEnterNum)?string("0.##%")}<#else>0</#if></td>
							<#list totalList as tl>
								<td class="autocut">${tl}</td>
							</#list>
						</tr>
						</#if>
					</tbody>
					</table>
					</div>
				</div>
			</div> 
		</div> 
	</div>
</div>
<div class="modal hide fade" id="exportdemo">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3 id="title1">导出报到进度统计列表</h3>
	</div>
	<div class="modal-body" id="export_reportProgress">
		
	</div>
	<div class="modal-footer">
		<a href="#" class="btn" data-dismiss="modal">关闭</a>
	</div>
</div>
<#include "/orientation/regulatoryAnalysis/reportProgress/maskAndJS.ftl" />
</body>
</html>