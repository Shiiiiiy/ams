<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- ajax form-->
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
		<script type="text/javascript" src="${rc.contextPath}/js/common/cascadecommon.js"></script>
		<script>
			//查询
			function query(){
			    $("#stuApplyQuery").attr("action","${rc.contextPath}/reward/statisticsquery/opt-query/queryStatisticsPage.do");
				mask.showShade();
				$("#stuApplyQuery").submit();
			}
			//查看
			function view(id) {
				var applyId = $("#"+id).val();
				if(applyId != null && applyId != "" && applyId != "undefined"){
					window.open("${rc.contextPath}/reward/studentapply/opt-query/viewStudentApplyInfo.do?id=" + applyId); 
				}
			}
			function exportStatistic(){
				$("#stuApplyQuery").attr("action","${rc.contextPath}/reward/statisticsquery/opt-query/exportStatistic.do");
				var fo=$("#stuApplyQuery");
				fo.submit();
			}
		</script>
		<style>
			.modal{width:320px;margin-top:-180px;margin-left:-80px}
			.table tbody tr:hover td, .table tbody tr:hover th {background-color:#fff;}
		</style>
    </head>
    <body>
		<div id="contentwrapper">
		    <div class="main_content">  
		    	<div class="row-fluid">
		    		<form id="stuApplyQuery" method="post" action="${rc.contextPath}/reward/statisticsquery/opt-query/queryStatisticsPage.do">
		    			<div class="span12">
		    				<div class="row-fluid">
		    				    <div class="span4">
		    				    	<span class="term">学年</span>
									<select size="1" id="schoolYear" name="schoolYear.code" aria-controls="dt_gal" class="span6 selectoption">
										<option value="" />请选择..</option>
										<#list schoolYearList as d>
											<#if stuInfo.schoolYear?? && stuInfo.schoolYear.code==d.code>
    					    	            	<option  value="${d.code}" selected="selected">${d.name?html}</option>
    					    	            <#else>
    					    	            	<option  value="${d.code}" >${d.name?html}</option>
    					    	            </#if>
										</#list>
									</select>
		    				    </div>
		    				    <div class="span4">
		    				    	<button class="btn btn-info" onclick="query()">统 计</button>
		              				<input type="button" class="btn btn-info"  onclick="comp.clearForm('stuApplyQuery')" value="清 空"/>
		    				    </div>
		    				    
		    				</div>
		    			</div>
		    		</form>
		    		<div class="btnCenter">
		              	
	           		</div>
	           		
	           		<div class="row-fluid">
	           			<div class="span12">
	           				<h5 class="heading"></h5>
	           				<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
	           					<div class="row">
	           						<div class="span10">
	           							<div class="dt_actions">
	           								<div class="row-fluid">
	           									<#if user_key.optMap['export']??>
	           										<button class="btn btn-info" type="button" onclick="exportStatistic()">导 出</button>
           										</#if>
	           								</div>
	           							</div>
	           						</div>
	           					</div>
	           					<table class="table table-bordered" id="smpl_tbl">
	           						<thead>
	           							<tr>
	           								<th colspan='8' width="100%" style="text-align: center">${tableTitle!""}</th>
	           							</tr>
										<tr>
											<th width="12%" style="text-align: center">专业</th>
											<th width="12%" style="text-align: center">班级</th>
											<th width="5%" style="text-align: center">一等奖学金</th>
											<th width="5%" style="text-align: center">二等奖学金</th>
											<th width="5%" style="text-align: center">三等奖学金</th>
											<th width="5%" style="text-align: center">三好学生</th>
											<th width="7%" style="text-align: center">优秀学生干部</th>
											<th width="5%" style="text-align: center">先进班集体</th>
										</tr>
								</thead>
	           						
	           						<tbody>
	           							<#if majorList??>	
											<#list majorList as m>
												<#if classMap??>
													<#list classMap[m.id] as c>
														<tr>
															<#if c_index == 0>
																<td rowspan='${classMap[m.id]?size}' class="autocut" style="text-align:center;vertical-align:middle">${m.majorName!""}</td>
															</#if>
															<td class="autocut" style="text-align: center">${c.className!""}</td>
															<td class="autocut" style="text-align: center">${resultMap['${c.id}'].firstAwardNum!""}</td>
															<td class="autocut" style="text-align: center">${resultMap['${c.id}'].secondAwardNum!""}</td>
															<td class="autocut" style="text-align: center">${resultMap['${c.id}'].thirdAwardNum!""}</td>
															<td class="autocut" style="text-align: center">${resultMap['${c.id}'].threeGoodNum!""}</td>
															<td class="autocut" style="text-align: center">${resultMap['${c.id}'].stuLeaderNum!""}</td>
															<td class="autocut" style="text-align: center">${resultMap['${c.id}'].goodClassNum!""}</td>
														</tr>
													</#list>	
												</#if>
											</#list>
										 </#if> 
										 				<tr>
										 					<td colspan='2' class="autocut" style="text-align: center">合计</td>
										 					<td class="autocut" style="text-align: center">${resultMap['sum'].firstAwardNum!""}</td>
										 					<td class="autocut" style="text-align: center">${resultMap['sum'].secondAwardNum!""}</td>
										 					<td class="autocut" style="text-align: center">${resultMap['sum'].thirdAwardNum!""}</td>
										 					<td class="autocut" style="text-align: center">${resultMap['sum'].threeGoodNum!""}</td>
										 					<td class="autocut" style="text-align: center">${resultMap['sum'].stuLeaderNum!""}</td>
										 					<td class="autocut" style="text-align: center">${resultMap['sum'].goodClassNum!""}</td>
										 				</tr>
	           						</tbody>
								</table>
	           				</div>
	           			</div>
	           		</div>
		    	</div> 
			</div>
		</div>
	           		
	</body>
</html>