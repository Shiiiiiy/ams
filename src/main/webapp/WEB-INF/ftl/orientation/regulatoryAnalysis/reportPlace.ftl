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
    		<form  id="countReportPlace" action="${rc.contextPath}/orientation/reportPlace/opt-query/countReportPlace.do" method="post">
				<div class="span12">			
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">学年</span>
							<select size="1" id="yearDic" name="id" aria-controls="dt_gal" class="span7 notClear" >
								<#if yearList??>
								<#list yearList as y>
									<#if yearDic ?? && yearDic.id?? && yearDic.id == y.id>
										<option value="${y.id}" selected="selected">${y.name?html}</option>	
									<#else>
										<option value="${y.id}" >${y.name?html}</option>	
									</#if>
								</#list>
								</#if>
							</select>
						</div>
						 <div class="span4">
			              <input type="submit" class="btn btn-info" value="统 计"/>
			            </div>
					</div>
				</div>
			</form>
				<div class="row-fluid">
					<div class="span12">
						<h5 class="heading"></h5>
						<div id="" class="dataTables_wrapper form-inline" role="grid">
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
							<thead>
								<tr>
									<th width="16%">报到地点</th>
									<th width="40%">已办理人数</th>
									<th width="44%">占总办理人数</th>
								</tr>
							</thead>
							<tbody>
								<#if listPlaceCounts??>	
									<#list listPlaceCounts as p>
										<tr>
											<td class="autocut">${p.place.name!""}</td>
											<td class="autocut">${p.num!""}</td>
											<td class="autocut"><#if TOTAL_NUM==0>0<#else>${((p.num)/TOTAL_NUM)?string("0.##%")}</#if></td>
										</tr>
									</#list>
								</#if>
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
	//点击导出按钮触发的方法
	$("#export-button").click(function() {
	
	});
	//柱状图
	$("document").ready(function(){
	
		var a = [];
        <#list listPlaceCounts as p>a[${p_index}] = ${p.num};</#list>
        var titleX = [];
        <#list listPlaceCounts as p>titleX[${p_index}] = "${p.place.name}";</#list>
        
        $('#column-basic').highcharts({
            chart: {
                type: 'column'
            },
            title: {
                text: '各报到点报道人数统计表'
            },
            subtitle: {
                text: '<#if yearDic??>${yearDic.name!""}</#if>学年'
            },
	        exporting:{
	        	enabled:false
	        },            
            xAxis: {
                categories: titleX
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
                }
            },
           	
            series: [{
                name: '<#if yearDic??>${yearDic.name!""}</#if>学年',
                data: a
    
            }]
        });
    });
</script>
</body>
</html>