<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="${rc.contextPath}/css/bdp_comp.css" type="text/css">
    <!-- My97DatePicker -->
    	<link rel="stylesheet" href="${rc.contextPath}/lib/My97DatePicker/skin/WdatePicker.css" />
		<script type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
	<!--级联下拉框-->
		<script type="text/javascript" src="${rc.contextPath}/js/common/cascadecommon.js"></script>
	<!--统计图-->	
		<script src="${rc.contextPath}/lib/highcharts/highcharts.js"></script>
		<script src="${rc.contextPath}/lib/highcharts/highcharts-more.js"></script>
		<script src="${rc.contextPath}/lib/highcharts/exporting.js"></script>
		<script>
			function clearCascadeForm(formId) {
				$(':input','#'+formId).not(':button, :submit, :reset, :hidden, .notClear').val('').removeAttr('checked').removeAttr('selected');
				$("#klassId option").remove();
				$("#klassId").append("<option value=''>请选择</option>");
				if(!$("#college").hasClass("notClear")) {
					$("#majorId option").remove();
					$("#majorId").append("<option value=''>请选择</option>");
				}
			}
		</script>
    </head>
    <body> 
		<div id="contentwrapper">
   		<div class="main_content">   
    	   <div class="row-fluid">	
    	   <div class="row-fluid">	
    		<form  id="greenChannelQuery" action="${rc.contextPath}/orientation/greenChannel/opt-query/countGreenChannel.do" method="post">
				<input id="pageTotalCount" name="pageTotalCount" type="hidden"  value="${pageTotalCount!""}"/>
				<div class="span12">	
						<div class="row-fluid">
							<div class="span4">
								<span class="formTitle">学年</span>
								<select size="1" id="yearDic" name="yearDic.id" aria-controls="dt_gal" class="span7 notClear" >
									<#if yearList??>
									<#list yearList as y>
										<#if reportProgress ?? && reportProgress.yearDic ?? && reportProgress.yearDic.id == y.id>
											<option value="${y.id}" data-code="${y.code?html}" selected="selected">${y.name?html}</option>	
										<#else>
											<option value="${y.id}" data-code="${y.code?html}" >${y.name?html}</option>	
										</#if>
									</#list>
									</#if>
								</select>
							</div>
							<div class="span4">
								<span class="formTitle">院系</span>
								<select size="1" id="college" name="college" aria-controls="dt_gal" class="span7 <#if flag?? && flag>notClear</#if>" <#if flag?? && flag>disabled</#if> onChange="cascade.changeCollage('college', 'majorId', 'klassId');">
									<option value="" >请选择</option>
									<#if collegeList??>
									<#list collegeList as c>
										<#if reportProgress.college?? && reportProgress.college == c.id>
											<option value="${c.id}" selected="selected">${c.name?html}</option>	
										<#else>
											<option value="${c.id}" >${c.name?html}</option>	
										</#if>
									</#list>
									</#if>
								</select>
							</div>
							<div class="span4">
								<span class="formTitle">专业</span>
								<select size="1" id="majorId" name="majorId" aria-controls="dt_gal" class="span7" onChange="cascade.changeMajor('majorId', 'klassId');">
									<option value="" >请选择</option>
									<#if majorList ?? >
										<#list majorList as m>
											<#if reportProgress.majorId?? && reportProgress.majorId == m.id >
												<option value="${m.id}" selected >${m.majorName}</option>
											<#else>
												<option value="${m.id}">${m.majorName}</option>
											</#if>
										</#list>
									</#if>
								</select>
							</div>
						</div>		
						
						<div class="row-fluid">
							<div class="span4">
								<span class="formTitle">班级</span>
								<select size="1" id="klassId" name="klassId" aria-controls="dt_gal" class="span7" >
									<option value="" >请选择</option>
									<#if classList ?? >
										<#list classList as c>
											<#if reportProgress.klassId?? && reportProgress.klassId == c.id >
												<option value="${c.id}" selected >${c.className}</option>
											<#else>
												<option value="${c.id}">${c.className}</option>
											</#if>
										</#list>
									</#if>
								</select>
							</div>
							
							<div class="span4">
								<input type="button" class="btn btn-info" onClick="queryGreenChannel();" value="查 询"/>
				             	<input type="button" class="btn btn-info"  onclick="clearCascadeForm('greenChannelQuery');" value="清 空"/>
				            </div>
						</div>
						
					<#--	
		            <div class="btnCenter">
		              <input type="button" class="btn btn-info" onClick="queryGreenChannel();" value="查 询"/>
		              <input type="button" class="btn btn-info"  onclick="clearCascadeForm('greenChannelQuery');" value="清 空"/>
		            </div>
		            -->	
				</div>
			</form>
			</div>
			<div id="" class="dataTables_wrapper form-inline" role="grid">
			<div class="row-fluid">
			<h5 class="heading"></h5>
			</div>
	            <div class="dt_actions">
	                <div class="row-fluid" style="margin-bottom:10px">
	                    <button class="btn btn-info" type="button" id="export-button">
	                   		 导 出
	                    </button>
	                    <input id="exportSize" name="exportSize" class="span3"  value="1000" title="excel单页条数" />
	                </div>
	            </div>
	        </div>
				<div class="row-fluid">
					<div class="span12">
						
						<div id="" class="dataTables_wrapper form-inline" role="grid">
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
							<thead>
								<tr>
									<th width="6%">序号</th>
									<th width="24%">学院</th>
									<th width="16%">专业</th>
									<th width="14%">班级</th>
									<th width="15%">学号</th>
									<th width="10%">姓名</th>
									<th width="15%">身份证号</th>
									<th width="8%">操作</th>
								</tr>
							</thead>
							<tbody>
								<#if page?? && page.result??>	
									<#list page.result as p>
										<tr>
											<td class="autocut">${p_index+1}</td>
											<td class="autocut"><#if p.college??>${p.college.name!""}</#if></td>
											<td class="autocut"><#if p.major??>${p.major.majorName!""}</#if></td>
											<td class="autocut"><#if p.classId??>${p.classId.className!""}</#if></td>
											<td class="autocut"><#if p.classId??>${p.stuNumber!""}</#if></td>
											<td class="autocut"><#if p.classId??><a href="#" title="查看" onclick="view(${p.id})">${p.name!""}</a></#if></td>
											<td class="autocut"><#if p.classId??>${p.certificateCode!""}</#if></td>
											<td class="autocut">
												<a href="#" title="查看" onclick="view(${p.id})"><i class="icon-list-alt"></i></a>
											</td>
										</tr>
									</#list>
								</#if>
							</tbody>
						</table>
						<#assign pageTagformId="greenChannelQuery"/>
						<#include "/page.ftl" />
					</div>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span12">
					<h5 class="heading">绿色通道办理统计</h5> 
					<div id="" class="dataTables_wrapper form-inline" role="grid">
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
							<thead>
								<tr>
									<th width="33%">已报到总人数</th>
									<th width="34%">绿色通道人数</th>
									<th width="33%">占比率</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="autocut">${totalNum!""}</td>
									<td class="autocut">${greenNum!""}</td>
									<td class="autocut"><#if totalNum==0>0<#else>${(greenNum/totalNum)?string("0.##%")}</#if></td>
								</tr>
							</tbody>
						</table>
						<div id="column-basic" style="min-width: 310px;width: 600px; height: 400px; margin: 0 auto"></div>
					</div>
				</div> 
			</div>
		</div> 
	</div>
</div>
<div class="modal hide fade" id="exportdemo">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3 id="title1">导出绿色通道学生表</h3>
	</div>
	<div class="modal-body" id="export_greenChannel">
		
	</div>
	<div class="modal-footer">
		<a href="#" class="btn" data-dismiss="modal">关闭</a>
	</div>
</div>

	<#-- 学生信息弹出框 begin-->
	<div class="modal hide fade" id="editStudentBox">
		<div class="modal-header">
			<button class="close" data-dismiss="modal">×</button>
			<h3 id="title1">学生信息</h3>
		</div>
		<div class="modal-body" id="viewStudentDiv"></div>
		<div class="modal-footer">
			<a href="#" class="btn btn" data-dismiss="modal">取消</a>
		</div>
	</div>
	<#-- 学生信息弹出框 end-->
<#-- 脚本开始 -->
<script>
	//查询方法
	function queryGreenChannel() {
		$("#greenChannelQuery").attr("action", "${rc.contextPath}/orientation/greenChannel/opt-query/countGreenChannel.do");
		$("#greenChannelQuery").attr("method", "post");
		$("#greenChannelQuery").submit();
	
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
		}else if(exportSize>1000){
			comp.message("请输入小于1000的正整数","error");
		}else{
			comp.showModal("exportdemo","500px","-250px 0 0 -250px");
			$("#export_greenChannel").load("${rc.contextPath}/orientation/greenChannel/nsm/exportCountExReportView.do?pageTotalCount="+pageTotalCount+"&exportSize="+exportSize);
		}
	});
	
	//点击导出按钮弹出的对话框中的链接，进行导出操作
	function exportCourseDate(exportSize,exportPage){
		$("#greenChannelQuery").attr("action", "${rc.contextPath}/orientation/greenChannel/opt-export/exportGreenChannel.do");
		var fo=$("#greenChannelQuery");
		if($("#greenChannelQuery_exportPage").length==0){
			fo.append($("<input>",{
				id:'greenChannelQuery_exportSize',
				type:'hidden',
				name:'greenChannelQuery_exportSize',
				val:exportSize
			}));
			fo.append($("<input>",{
				id:'greenChannelQuery_exportPage',
				type:'hidden',
				name:'greenChannelQuery_exportPage',
				val:exportPage
			}));
		}else{
			$("#greenChannelQuery_exportSize").val(exportSize);
			$("#greenChannelQuery_exportPage").val(exportPage);
		}
		fo.submit();
	}
	
	//柱状图
	$("document").ready(function(){
	
        $('#column-basic').highcharts({
            chart: {
                type: 'column'
            },
            title: {
                text: '绿色通道办理统计'
            },
            subtitle: {
                text: '<#if reportProgress.yearDic??>${reportProgress.yearDic.name!""}</#if>学年'
            },
	        exporting:{
	        	enabled:false
	        },            
            xAxis: {
                categories: ['已报到总人数', '绿色通道人数']
            },
            yAxis: {
                min: 0,
                title: {
                    text: '年级人数（人）'
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
                name: '<#if reportProgress.yearDic??>${reportProgress.yearDic.name!""}</#if>学年',
                data: [${totalNum}, ${greenNum}]
    
            }]
        });
    });
    
    //查看学生信息
	function view(id) {
    	comp.showModal("editStudentBox", "1000px", "-280px 0 0 -480px");
   	 	$("#viewStudentDiv").load("${rc.contextPath}/student/view/nsm/viewStudent.do", {
        "id": id
    	});
	}
</script>
</body>
</html>