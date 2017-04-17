
<script src="${rc.contextPath}/lib/highcharts/highcharts.js"></script>
<script src="${rc.contextPath}/lib/highcharts/highcharts-more.js"></script>
<script src="${rc.contextPath}/lib/highcharts/exporting.js"></script>
<div id="testP">

</div>
<script>
	$('#testP').highcharts({
	    chart: {
	        type: 'column'
	    },
	    title: {
	        text: '实时报到人数统计表'
	    },
	    subtitle: {
	        text: ''
	    },
	    exporting:{
	    	enabled:false
	    },            
	    xAxis: {
	        categories: ['报到情况']
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
	            pointPadding: 0.4,
	            borderWidth: 0
	        },
            series: {
                animation: false
            }
	    },
	   	
	    series: [{
	    	name: '报到情况',
	        data: [${countReport}]
	    }]
	});
</script>