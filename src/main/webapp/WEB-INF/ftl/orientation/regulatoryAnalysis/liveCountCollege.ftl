<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="${rc.contextPath}/css/bdp_comp.css" type="text/css">
    <!-- My97DatePicker -->
    	<link rel="stylesheet" href="${rc.contextPath}/lib/My97DatePicker/skin/WdatePicker.css" />
		<script type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
		
		<script src="${rc.contextPath}/lib/highcharts/highcharts.js"></script>
		<script src="${rc.contextPath}/lib/highcharts/highcharts-more.js"></script>
		<script src="${rc.contextPath}/lib/highcharts/exporting.js"></script>
    </head>
    <body> 
		<div id="contentwrapper">
   		<div class="main_content">   
	   		<div class="row-fluid">
	   		<form id="liveCountQuery" method="post">
	   			<div class="span12">	
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">统计范围</span>
							<select size="1" id="range" name="range" aria-controls="dt_gal" class="span7">
								<option value="1" <#if range?? && range=='1'>selected="selected"</#if> >按全校统计</option>
								<option value="2" <#if range?? && range=='2'>selected="selected"</#if> >按学院统计</option>
							</select>
						</div>
						
						<div class="span4">
							<span class="formTitle">全校录取总人数：</span>
							<input type="text" class="span7 " disabled value="${total!""}"/>
						</div>
					</div>
					<div class="row-fluid">
						<#if collegeRegistedList??>
				   		<#list collegeRegistedList as cr>
				   			${cr.college.name}:${cr.totalNum}&nbsp;&nbsp;&nbsp;&nbsp;
						</#list>
						</#if>
					</div>
				</div>
			</form>
			</div>
   		
    	   <div class="row-fluid">	
				<div class="row-fluid">
					<div class="span12">
						<h5 class="heading"></h5>
						<div id="" class="dataTables_wrapper form-inline" role="grid">
						
						<div id="column-basic" style="min-width: 310px;width: 600px; height: 400px; margin: 0 auto"></div>
					</div>
				</div>
			</div> 
		</div> 
	</div>
</div>

<#-- 脚本开始 -->
<script>
	$(function() {
	 $('#column-basic').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: '各学院实时报到人数统计表'
        },
        subtitle: {
            text: ''
        },
        exporting:{
        	enabled:false
        },            
        xAxis: {
            categories: [<#if collegeRegistedList??><#list collegeRegistedList as cr><#if cr_index!=0>,</#if>'${cr.college.name}'</#list></#if>]
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
	        	name: '报到人数统计',
	            data: [<#if collegeRegistedList??><#list collegeRegistedList as cr><#if cr_index!=0>,</#if>${cr.registedNum}</#list></#if>]
    	}]
    });
    });
    
	setInterval(function() {
		$("#column-basic").load("${rc.contextPath}/orientation/liveCount/nsm/liveCountCollegeView.do");
	}, 3000);
	
	jQuery("#range").change(function() {
		$("#liveCountQuery").attr("action", "${rc.contextPath}/orientation/liveCount/opt-query/liveCount.do");
		$("#liveCountQuery").attr("method", "post");
		$("#liveCountQuery").submit();
	});
</script>
</body>
</html>