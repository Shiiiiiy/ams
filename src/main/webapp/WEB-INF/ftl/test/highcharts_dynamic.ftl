<html>
<title>Highcharts Static Example</title>
<head>
<!--Highcharts-3.0.6-->

<!--javascript start-->

</head>
<body>
<div id="contentwrapper">
	<div class="main_content">
		<div class="row-fluid">
			<div class="span12">
				<!--tab start-->
	  <div class="tabbable tabbable-bordered">
			<ul class="nav nav-tabs">
				<li class="active"><a href="#tab_br1" data-toggle="tab">饼图</a></li>
				<li><a href="#tab_br2" data-toggle="tab">柱状图</a></li>
				<li><a href="#tab_br3" data-toggle="tab">折线图</a></li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane active" id="tab_br1">
					<div id="pie-basic" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
				</div>
				<div class="tab-pane" id="tab_br2">
					<div id="column-basic" style="min-width: 310px;width: 600px; height: 400px; margin: 0 auto"></div>
				</div>
				<div class="tab-pane" id="tab_br3">
					<div id="line-basic" style="min-width: 310px; width: 600px;height: 400px; margin: 0 auto"></div>
				</div>
			</div>
		</div>
<!--tab end-->
			</div>
		</div>
	</div>
</div>

<script src="${rc.contextPath}/lib/highcharts/highcharts.js"></script>
<script src="${rc.contextPath}/lib/highcharts/highcharts-more.js"></script>
<script src="${rc.contextPath}/lib/highcharts/exporting.js"></script>
<script type="text/javascript">
//tab_br1 饼图pie-basic
$("document").ready(function(){
    $('#pie-basic').highcharts({
        chart: {
            plotBackgroundColor: null,
            plotBorderWidth: null,
            plotShadow: false
        },
        title: {
            text: '日志级别统计'
        },
        exporting:{
        	enabled:false
        },        
        tooltip: {
    	    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        plotOptions: {
            pie: {
                allowPointSelect: true,
                cursor: 'pointer',
                dataLabels: {
                    enabled: true,
                    color: '#000000',
                    connectorColor: '#000000',
                    format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                }
            }
        },
        series: [{
            type: 'pie',
            name: '日志级别',
            data: [
                	${logLevelStr!}
            ]
        }]
    });
});

//tab_br2 柱状图column-basic
$("document").ready(function(){
        $('#column-basic').highcharts({
            chart: {
                type: 'column'
            },
            title: {
                text: '各院系年级人数统计表'
            },
            subtitle: {
                text: '2013-2014学年秋季学期'
            },
	        exporting:{
	        	enabled:false
	        },            
            xAxis: {
                categories: [
                	${departmentStr!}
                ]
            },
            yAxis: {
                min: 0,
                title: {
                    text: '年级人数（人）'
                }
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
            series: [{
                name: '2011年级',
                data: [49, 71, 106, 129, 144, 176, 135, 148, 216, 194, 95, 54]
    
            }, {
                name: '2012年级',
                data: [52, 78, 112, 135, 155, 178, 140, 150, 230, 203, 103, 60]
    
            }, {
                name: '2013年级',
                data: [70, 89, 130, 146, 169, 190, 150, 160, 260, 245, 135, 70]
    
            }]
        });
    });
    
//tab_br3 折线图line-basic
$("document").ready(function(){
        $('#line-basic').highcharts({
            title: {
                text: '用户访问次数统计',
                x: -20 //center
            },
            subtitle: {
                text: '数字化校园系统',
                x: -20
            },
	        exporting:{
	        	enabled:false
	        },            
            xAxis: {
                categories: [${usernameStr!}]
            },
            yAxis: {
                title: {
                    text: '访问次数（次）'
                },
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                }]
            },
            tooltip: {
                valueSuffix: '次'
            },
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'middle',
                borderWidth: 0
            },
            series: [{
                name: '访问次数',
                data: [
                	<#list hitcountsStr as hitcount>
                	${hitcount},
                	</#list> 
                	]
            }]
        });
    });





		</script>
</body>
</html>
