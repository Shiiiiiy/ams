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
    </head>
    <body> 
		<div id="contentwrapper">
   		<div class="main_content">   
    	   <div class="row-fluid">	
			<input id="pageTotalCount" name="pageTotalCount" type="hidden"  value="${pageTotalCount!""}"/>
    		<form  id="countExReportQuery"  method="post">
				<div class="span12">			
					<div class="row-fluid">
						<div class="span3">
							<div class="span4">
								<span class="formTitle">开始时间<span class="f_req">*</span></span>
							</div>
							<div class="span8">
								<input id="startDate" name="startDate" class="Wdate span11" 
								style="cursor:pointer" onclick="WdatePicker({skin:'whyGreen', dateFmt:'yyyy-MM-dd HH:mm', maxDate:'#F{$dp.$D(\'endDate\')}'});"  value="${startDate!''}" />
							</div>
						</div>
						<div class="span3">
							<div class="span4">
								<span class="formTitle">结束时间<span class="f_req">*</span></span>
							</div>
							<div class="span8">
								<input id="endDate" name="endDate" class="Wdate span11" 
								style="cursor:pointer" onclick="WdatePicker({skin:'whyGreen', dateFmt:'yyyy-MM-dd HH:mm', minDate:'#F{$dp.$D(\'startDate\')}'});"  value="${endDate!''}" />
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
							<input type="button" class="btn btn-info" onClick="countExReport();" value="统 计"/>
		              		<input type="button" class="btn btn-info"  onClick="comp.clearForm('countExReportQuery');" value="清 空"/>
						</div>
						
					</div>
				</div>
					<#-- 
		            <div class="btnCenter">
		              <input type="button" class="btn btn-info" onClick="countExReport();" value="统 计"/>
		              <input type="button" class="btn btn-info"  onClick="comp.clearForm('countExReportQuery');" value="清 空"/>
		            </div>
	           		 -->
				</div>
			</form>
				<div class="row-fluid">
					<div class="span12">
						<h5 class="heading"></h5>
						<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
				    	<div class="row">
			                 <div class="span10">
			            		<div class="dt_actions">
			                       <div class="row-fluid">
				                    <button class="btn btn-info" type="button" id="export-button">
				                   		 导 出
				                    </button>
				                    <input id="exportSize" name="exportSize" type="hidden" class="span3"  value="500" title="excel单页条数" />
				                </div>
				            </div>
			               </div>
				        </div>
						<div id="" class="dataTables_wrapper form-inline" role="grid">
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
							<thead>
								<tr>
									<th width="8%">序号</th>
									<th width="37%">时间段</th>
									<th width="15%">新生数 / 占比</th>
									<th width="15%">寝具包 / 占比</th>
									<th width="15%">迁户口 / 占比</th>
									<th width="10%">随行人数</th>
								</tr>
							</thead>
							<tbody>
								<#if list??>	
									<#list list as p>
										<tr>
											<td class="autocut">${p_index+1}</td>
											<td class="autocut">${p.name!""}</td>
											<td class="autocut">${p.num!""} / <#if TOTAL!=0>${(p.num/TOTAL)?string("0.##%")}<#else>0</#if></td>
											<td class="autocut">${p.beds!""} / <#if TOTAL!=0>${(p.beds/TOTAL)?string("0.##%")}<#else>0</#if></td>
											<td class="autocut">${p.moves!""} / <#if TOTAL!=0>${(p.moves/TOTAL)?string("0.##%")}<#else>0</#if></td>
											<td class="autocut">${p.togethers!""}</td>
										</tr>
									</#list>
								</#if>
							</tbody>
						</table>
					</div>
				</div>
			</div> 
		</div> 
	</div>
</div>

<div class="modal hide fade" id="exportdemo">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3 id="title1">导出预期报到统计列表</h3>
	</div>
	<div class="modal-body" id="export_countExReport">
		
	</div>
	<div class="modal-footer">
		<a href="#" class="btn" data-dismiss="modal">关闭</a>
	</div>
</div>

<#-- 脚本开始 -->
<script>

	//统计方法
	function countExReport() {
		$("#countExReportQuery").attr("action", "${rc.contextPath}/orientation/reportCount/opt-query/countExReport.do");
		$("#countExReportQuery").attr("method", "post");
		$("#countExReportQuery").submit();
	}

	//点击导出按钮触发的方法
	$("#export-button").click(function() {
		var pageTotalCount= $("#pageTotalCount").val();
		var exportSize= $("#exportSize").val();
		var patrn=/^[0-9]{1,20}$/;
		if(exportSize==""){
			comp.message("请输入大于0的正整数","error");
		}else if(!patrn.exec(exportSize)){
			comp.message("请输入大于0的正整数","error");
		}else if(exportSize<1){
			comp.message("请输入大于0的正整数","error");
		}else if(exportSize>10000){
			comp.message("请输入小于500的正整数","error");
		}else{
			comp.showModal("exportdemo","500px","-250px 0 0 -250px");
			$("#export_countExReport").load("${rc.contextPath}/orientation/reportCount/nsm/exportCountExReportView.do?pageTotalCount="+pageTotalCount+"&exportSize="+exportSize);
		}
	});
	
	//点击导出按钮弹出的对话框中的链接，进行导出操作
	function exportCourseDate(exportSize,exportPage){
		$("#countExReportQuery").attr("action", "${rc.contextPath}/orientation/reportCount/opt-export/exportCountExReport.do");
		var fo=$("#countExReportQuery");
		if($("#countExReportQuery_exportPage").length==0){
			fo.append($("<input>",{
				id:'countExReportQuery_exportSize',
				type:'hidden',
				name:'countExReportQuery_exportSize',
				val:exportSize
			}));
			fo.append($("<input>",{
				id:'countExReportQuery_exportPage',
				type:'hidden',
				name:'countExReportQuery_exportPage',
				val:exportPage
			}));
		}else{
			$("#countExReportQuery_exportSize").val(exportSize);
			$("#countExReportQuery_exportPage").val(exportPage);
		}
		fo.submit();
	}
	//校验
	$("document").ready(function(){
    	$("#countExReportQuery").compValidate({
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