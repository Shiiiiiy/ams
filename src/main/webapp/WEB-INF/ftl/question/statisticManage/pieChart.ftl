<div class="formSep">
	<div class="row-fluid">
		<div role="grid" class="dataTables_wrapper form-inline" id="dt_gal_wrapper">	
			<input type="hidden" id="pieData"  value="${pieData!""}"/>
			<input type="hidden" id="iname"  value="${iname!""}"/>
		</div>
	</div>	
</div>
<script>
	$(function () {
	
		var pieData = eval($("#pieData").val());
		var itemName = $("#iname").val();
	    $('#pieChartBody').highcharts({
	        chart: {
	            plotBackgroundColor: null,
	            plotBorderWidth: null,
	            plotShadow: false
	        },
	        title: {
	            text: '选项人数'
	        },
	        series: [{
	            type: 'pie',
	            name: '人数(人)',
	            data: pieData
	        }]
	    });
	});
</script>