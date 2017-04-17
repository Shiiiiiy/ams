<div class="formSep">
	<div class="row-fluid">
		<div role="grid" class="dataTables_wrapper form-inline" id="dt_gal_wrapper">	
			<input type="hidden" id="xtext"  value="${xtext!""}"/>
			<input type="hidden" id="ytext"  value="${ytext!""}"/>
			<input type="hidden" id="iname"  value="${iname!""}"/>
		</div>
	</div>	
</div>
<script>
	$(function () {
		var itemName = $("#iname").val();
		//获取x轴和y轴的值
		var xtext =eval($("#xtext").val());
		var ytext = eval($("#ytext").val());
		var y=ytext; 
	    $('#barChartBody').highcharts({
	        chart: {
	            type: 'column'
	        },
	        title: {
	            text: '选项人数'
	        },
	        xAxis: {
	            categories: xtext
	        },
	        yAxis: {
	        	//设置Y轴的值为固定的刻度值
	        	//tickPositions: [0, 20, 50, 100], 
	        	//是否允许刻度有小数
	        	allowDecimals:false,
	            min: 0,
	            title: {
	                text: '人数(人)'
	            }
	        },
	       plotOptions: {
            column: {
                pointPadding: 0.2,
                pointWidth: 30,
                borderWidth: 0
            }
        },
			series: y
	    });
	});
</script>