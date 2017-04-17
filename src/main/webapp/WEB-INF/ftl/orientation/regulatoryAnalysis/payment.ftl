<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="${rc.contextPath}/css/bdp_comp.css" type="text/css">
    <!-- My97DatePicker -->
    	<link rel="stylesheet" href="${rc.contextPath}/lib/My97DatePicker/skin/WdatePicker.css" />
		<script type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
		<script type="text/javascript" src="${rc.contextPath}/js/common/cascadecommon.js"></script>
		
		<script src="${rc.contextPath}/lib/highcharts/highcharts.js"></script>
		<script src="${rc.contextPath}/lib/highcharts/highcharts-more.js"></script>
		<script src="${rc.contextPath}/lib/highcharts/exporting.js"></script>
    </head>
    <body> 
		<div id="contentwrapper">
   		<div class="main_content">   
    	   <div class="row-fluid">	
				<div class="row-fluid">
					<div class="span12">
						<h5 class="heading">院系缴费办理统计</h5>
						<div id="" class="dataTables_wrapper form-inline" role="grid">
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
							<thead>
								<tr>
									<th width="40%">学院</th>
									<th width="15%">录取总人数</th>
									<th width="15%">已缴费人数</th>
									<th width="15%">未缴费人数</th>
									<th width="15%">绿色通道人数</th>
								</tr>
							</thead>
							<tbody>
								
								<#if listPaidVo??>
								<#list listPaidVo as pv>
								<tr>
									<td class="autocut">${pv.college.name!""}</td>
									<td class="autocut">${pv.total!""}</td>
									<td class="autocut">${pv.paid!""}</td>
									<td class="autocut">${pv.unpaid!""}</td>
									<td class="autocut">${pv.green!""}</td>
								</tr>
								</#list>
								</#if>
								<tr>
									<td class="autocut">合计</td>
									<td class="autocut">${totalNum!""}</td>
									<td class="autocut">${paidNum!""}</td>
									<td class="autocut">${unpaidNum!""}</td>
									<td class="autocut">${greenNum!""}</td>
								<tr>
							</tbody>
						</table>
						<div id="column-basic" style="min-width: 310px;width: 600px; height: 400px; margin: 0 auto"></div>
						</div>
				</div>
			</div> 
		</div> 
	</div>
</div>

<#-- 脚本开始 -->
<script>
	//柱状图
	/**
	$("document").ready(function(){
	
        $('#column-basic').highcharts({
            chart: {
                type: 'column'
            },
            title: {
                text: ''
            },
	        exporting:{
	        	enabled:false
	        },            
            xAxis: {
                categories: ["录取总人数", "已缴费人数", "未缴费人数", "绿色通道人数"]
            },
            yAxis: {
                min: 0,
                title: {
                    text: '人数（人）'
                },
            	allowDecimals:false
            },
            tooltip: {
                headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                    '<td style="padding:0"><b>{point.y} 人</b></td></tr>',
                footerFormat: '</table>',
                shared: true,
                useHTML: true
            },
            plotOptions: {
                column: {
                    pointPadding: 0.2,
                    borderWidth: 0
                }
            },
           	
            series: [
            	<#list listPaidVo as p>
            	<#if p_index!=0>,</#if>{
            	
                	name: '${p.college.name!""}',
                	data: [${p.total}, ${p.paid}, ${p.unpaid}, ${p.green}]}
                </#list>
            ]
        });
    });
    */
</script>
</body>
</html>