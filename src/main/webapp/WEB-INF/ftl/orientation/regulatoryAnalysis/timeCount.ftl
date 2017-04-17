<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="${rc.contextPath}/css/bdp_comp.css" type="text/css">
    <!-- My97DatePicker -->
    	<link rel="stylesheet" href="${rc.contextPath}/lib/My97DatePicker/skin/WdatePicker.css" />
		<script type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
	<!--validata-->	
  		<script src="${rc.contextPath}/js/jquery.metadata.js"></script>
  		<script src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script>
  	<!--highcharts-->		
		<script src="${rc.contextPath}/lib/highcharts/highcharts.js"></script>
		<script src="${rc.contextPath}/lib/highcharts/highcharts-more.js"></script>
		<script src="${rc.contextPath}/lib/highcharts/exporting.js"></script>
    </head>
    <body> 
		<div id="contentwrapper">
   		<div class="main_content">   
    	   <div class="row-fluid">	
    		<form  id="timeCountQuery" action="${rc.contextPath}/orientation/timeCount/opt-query/timeCount.do" method="post">
				<div class="span12">			
					<div class="row-fluid">
						<div class="span3">
							<div class="span4">
								<span class="formTitle">开始时间<span class="f_req">*</span></span>
							</div>
							<div class="span8">
								<input id="startDate" name="startDate" class="Wdate span11" 
								style="cursor:pointer" onclick="WdatePicker({skin:'whyGreen', dateFmt:'yyyy-MM-dd HH:mm', maxDate:'#F{$dp.$D(\'endDate\')||\'new Date()\'}'});"  value="${startDate!''}" />
							</div>
						</div>
						<div class="span3">
							<div class="span4">
								<span class="formTitle">结束时间<span class="f_req">*</span></span>
							</div>
							<div class="span8">
								<input id="endDate" name="endDate" class="Wdate span11" 
								style="cursor:pointer" onclick="WdatePicker({skin:'whyGreen', dateFmt:'yyyy-MM-dd HH:mm', minDate:'#F{$dp.$D(\'startDate\')}', maxDate:'new Date()'});"  value="${endDate!''}" />
							</div>
						</div>
						<div class="span3">
							<div class="span4">
								<span class="formTitle">时间间隔<span class="f_req">*</span></span>
							</div>
							<div class="span8">
								<div class="span6">
									<input id="apartMinute" class="span10" name="apartMinute"  value="${apartMinute!''}" />
								</div>
								<div style="line-height:33px;">分钟</div>
							</div>
						</div>
						
						  <div class="span3">
				              <input type="submit" class="btn btn-info" value="统 计"/>
				              <input type="button" class="btn btn-info"  onclick="comp.clearForm('timeCountQuery');" value="清 空"/>
				          </div>
						
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
									<th width="30%" >时间段</th>
									<th width="70%" >已报到人数 / 总报到人数 / 占比</th>
								</tr>
							</thead>
							<tbody>
								<#if list??>	
									<#list list as p>
										<tr>
											<td class="autocut">${p.timeLine!""}</td>
											<td class="autocut">${p.reportNum!""} / ${p.totalNum!""} / <#if p.totalNum==0>0<#else>${((p.reportNum)/(p.totalNum))?string("0.##%")}</#if></td>
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
	//柱状图
	$("document").ready(function(){
	
        $('#column-basic').highcharts({
            chart: {
                type: 'column'
            },
            title: {
                text: '各报到点分时段报到人数统计表'
            },
            subtitle: {
                text: ''
            },
	        exporting:{
	        	enabled:false
	        },            
            xAxis: {
                categories: [<#if list??><#list list as l><#if l_index!=0>,</#if>'${l.timeLine}'</#list></#if>]
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
            	<#if list??>
            	<#list list as l>
            	<#if l_index!=0>,</#if>
                {name: '${l.timeLine}',
                data: [${l.reportNum}]}
    			</#list>
    			</#if>
            ]
        });
    });
    $("document").ready(function(){
    	$("#timeCountQuery").compValidate({
				rules:{     
					startDate: {required:true},
					endDate: {required:true},
					apartMinute: {required:true, digits:true, min:5, max:59}
				},
				messages:{
					startDate:{required:'开始时间不能为空'},
					endDate:{required:'结束时间不能为空'},
					apartMinute:{required:'时间间隔不能为空', digits:'时间间隔为5到59的正整数', min:'时间间隔为5到59的正整数', max:'时间间隔为5到59的正整数'}
				}
		});
    });
</script>
</body>
</html>