<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- ajax form-->
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
        <!--Highcharts-->
        <script src="${rc.contextPath}/lib/highcharts/exporting.js"></script>
        <script src="${rc.contextPath}/lib/highcharts/highcharts-more.js"></script>
        <script src="${rc.contextPath}/lib/highcharts/highcharts.js"></script>
        <style>
			.table tbody tr:hover td, .table tbody tr:hover th {background-color:#fff;}
		</style>
    </head>
    <body>
		<div id="contentwrapper">
   		<div class="main_content">   
    	   <div class="row-fluid">	
    		<form  id="statisticQues"  action="${rc.contextPath}/lecturer/partTimeHour/opt-query/statisticQues.do" method="post">
				<input type="hidden" id="exportSize" name="exportSize" class="span2"  value="500" title="单页导出条数" />
				<input type="hidden" id="questionId" name="questionId" class="span2"  value="${(questionId)!""}"/>
			</form>
				<div class="row-fluid">
					<div class="span12">
						<h5 class="heading"></h5>
						<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
					        <div class="row">
					            <div class="span10">
					                <div class="dt_actions">
					                    <div class="row-fluid">
					                    	<button class="btn btn-info"  onclick="exportStaResult()">导 出</button>
					                    </div>
					                </div>
					            </div>
					        </div>
				        
		        		<tr>
							<td  colspan="10" >
								<div align="center">
								<strong> <font  size="5">${(quesName)!""}_调查问卷统计分析</font></strong>
								</div>
								<br/>
							</td>
						</tr>
						<table class="table table-bordered tablecut" id="smpl_tbl">
							<thead>
								<tr>
									<th class='head'  align='center' width="7%">序号</th>
									<th width="25%">题目名称</th>
									<th width="8%">题型</th>
									<th width="20%">答案</th>
									<th width="10%">选择人数</th>
									<th width="10%">占比(%)</th>
								</tr>
							</thead>
							<tbody>
								<#if itemList??>	
									<#list itemList as item>
										<#list  item.optionList as opt>
										 <#if  opt_index+1==1>
											<tr>
												<td rowspan="${item.optionList?size}">${item_index+1}</td>
												<td class="autocut"  rowspan="${item.optionList?size}">${item.item.itemName!""}
													<div style="margin-bottom:5px;align:center">
														<br/>
														<input type="hidden" id="itemId" name="itemId"  value=""/>
														<input type="hidden" id="itemName" name="itemName"  value=""/>
														<a href="###" class="btn btn-info"   onclick="showBarChart('${item.item.id!""}','${item.item.itemName!""}')">柱状图</a>
										              &nbsp;&nbsp;
										              	<a href="###" class="btn btn-info"   onclick="showPieChart('${item.item.id!""}','${item.item.itemName!""}')">饼状图</a>
										             </div>												
												</td>
												<td class="autocut" rowspan="${item.optionList?size}"><#if item.item.itemType??>${item.item.itemType.name!""}<#else></#if></td>
												<td class="autocut">${opt.option.optionName!""}</td>
												<td class="autocut">${opt.num!""}</td>
												<td class="autocut">${opt.percent!""}</td>
											</tr>
											<#else>
											<tr>
												<td class="autocut">${opt.option.optionName!""}</td>
												<td class="autocut">${opt.num!""}</td>
												<td class="autocut">${opt.percent!""}</td>
											</tr>
										   </#if>
										</#list>
									</#list>
								 </#if>
							</tbody>
						</table>
						<br/>

						<button class="btn" type="button" onclick="goList()">返 回</button>
					</div>
				</div>
			</div> 
		</div> 
	</div>
</div>

	
	<!--导出统计分析结果-->
	<div class="modal hide fade" id="exportByCanal">
		<div class="modal-header">
			<button class="close" data-dismiss="modal">×</button>
			<h3 id="title1">调查问卷统计分析</h3>
		</div>
		<div class="modal-body" id="exportClassTrain">
			
		</div>
		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal">关闭</a>
		</div>
	</div>
	
<!--显示柱状图-->
	<div class="modal hide fade" id="showbar">
		<div class="modal-header">
			<button class="close" data-dismiss="modal">×</button> 
			<h3 id="title2">柱状图</h3>
		</div>
		<div class="modal-body" id="barChartBody">
			
		</div>
		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal">关闭</a>
		</div>
	</div>
	
<!--显示饼状图-->
	<div class="modal hide fade" id="showpie">
		<div class="modal-header">
			<button class="close" data-dismiss="modal">×</button>
			<h3 id="title3">饼状图</h3>
		</div>
		<div class="modal-body" id="pieChartBody">
			
		</div>
		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal">关闭</a>
		</div>
	</div>		
<#-- 脚本开始 -->
<script>
//柱状图	
	function showBarChart(itemId,itemName){
			var questionId=$("#questionId").val();
			comp.showModal("showbar","700px","-250px 0 0 -300px");
			$("#barChartBody").load("${rc.contextPath}/question/statisticManage/comp/getItemJson.do?itemId="+itemId+"&questionId="+questionId+"&itemName="+itemName);
	}
//饼状图
	function showPieChart(itemId,itemName){
			var questionId=$("#questionId").val();
			comp.showModal("showpie","700px","-250px 0 0 -300px");
			$("#pieChartBody").load("${rc.contextPath}/question/statisticManage/comp/getPieJson.do?itemId="+itemId+"&questionId="+questionId+"&itemName="+itemName);
	}
//导出统计结果
	function exportStaResult(){
		var exportSize= $("#exportSize").val();
		var patrn=/^[0-9]{1,20}$/; 
		if(exportSize==""){
			comp.message("请输入大于0的正整数","error");
		}else if(!patrn.exec(exportSize)){
			comp.message("请输入大于0的正整数","error");
		}else if(exportSize<1){
			comp.message("请输入大于0的正整数","error");
		}else if(exportSize>10000){
			comp.message("请输入小于等于10000的正整数","error");
		}else{
			comp.showModal("exportByCanal","500px","-250px 0 0 -250px");
			$("#exportClassTrain").load("${rc.contextPath}/question/statisticManage/nsm/exportQuesStatistic.do?exportSize="+exportSize);
		}
	}
	
//数据的导出
	function exportTrainClassData(exportSize,exportPage,type){
		$("#statisticQues").attr("action","${rc.contextPath}/question/statisticManage/opt-query/exportQuesStatistic.do");
		var fo=$("#statisticQues");
		if($("#lecturerQuery_exportPage").length==0){
			fo.append($("<input>",{
				id:'lecturerQuery_exportSize',
				type:'hidden',
				name:'lecturerQuery_exportSize',
				val:exportSize
			}));
			fo.append($("<input>",{
				id:'lecturerQuery_exportPage',
				type:'hidden',
				name:'lecturerQuery_exportPage',
				val:exportPage
			}));
		}else{
			$("#lecturerQuery_exportSize").val(exportSize);
			$("#lecturerQuery_exportPage").val(exportPage);
		}
		fo.submit();
	}
		
	//返回
	 	function goList(){
				window.location.href="${rc.contextPath}/question/statisticManage/opt-query/quesStatisticQuery.do";
	 	}
</script>
</body>
</html>