<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="${rc.contextPath}/css/bdp_comp.css" type="text/css">
		<script type="text/javascript" src="${rc.contextPath}/js/common/cascadecommon.js"></script>
    </head>
    <body> 
		<div id="contentwrapper">
   		<div class="main_content">   
    	   <div class="row-fluid">	
    		<form id="reportProgressQuery" method="post">
				<input id="pageTotalCount" name="pageTotalCount" type="hidden"  value="${pageTotalCount!""}"/>
				<div class="span12">	
						<div class="row-fluid">
							<div class="span4">
								<span class="formTitle">学年</span>
								<select size="1" id="yearDic" name="yearDic.id" aria-controls="dt_gal" class="span7" >
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
								<span class="formTitle">学院</span>
								<select size="1" id="college" name="college" aria-controls="dt_gal" class="span7" onChange="cascade.changeCollage('college', 'majorId');">
									<option value="" >请选择</option>
									<#if collegeList??>
										<#list collegeList as c>
											<#if reportProgress.college?? && c.id==reportProgress.college>
												<option value="${c.id}" selected="selected">${c.name?html}</option>
											<#else>
												<option value="${c.id}">${c.name?html}</option>
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
											<#if reportProgress.majorId?? &&  reportProgress.majorId == m.id >
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
						</div>
						
						
		            <div class="btnCenter">
		              <input type="button" class="btn btn-info" onClick="countReportProgress();" value="统 计"/>
		              <input type="button" class="btn btn-info"  onclick="comp.clearForm('reportProgressQuery');" value="清 空"/>
		            </div>
				</div>
			</form>
			<div id="" class="dataTables_wrapper form-inline" role="grid">
	            <div class="dt_actions">
	                <div class="row-fluid">
	                    <button class="btn btn-info" type="button" id="export-button">
	                   		 导 出
	                    </button>
	                    <input id="exportSize" name="exportSize" type="hidden" class="span3"  value="1000" title="excel单页条数" />
	                </div>
	            </div>
	        </div>
				<div class="row-fluid">
					<div class="span12">
						<h5 class="heading">${title!""} 报到情况统计</h5>
						<div id="" class="dataTables_wrapper form-inline" role="grid" style="overflow-x:scroll">
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
							<thead>
								<tr>
									<th width="70px">入学年份</th>
									<th width="70px">二级学院</th>
									<th width="70px">专业</th>
									<th width="70px">班级名称</th>
									<th width="70px">录取人数</th>
									<th width="70px">报到人数</th>
									<th width="70px">浙江(录取)</th>
									<th width="70px">浙江(报到)</th>
									<th width="70px">安徽(录取)</th>
									<th width="70px">安徽(报到)</th>
									<th width="70px">福建(录取)</th>
									<th width="70px">福建(报到)</th>
									<th width="70px">贵州(录取)</th>
									<th width="70px">贵州(报到)</th>
									<th width="70px">河南(录取)</th>
									<th width="70px">河南(报到)</th>
									<th width="70px">江苏(录取)</th>
									<th width="70px">江苏(报到)</th>
									<th width="70px">江西(录取)</th>
									<th width="70px">江西(报到)</th>
									<th width="70px">山西(录取)</th>
									<th width="70px">山西(报到)</th>
								</tr>
							</thead>
							<tbody>
								<#if listReportStatisticsVo??>
								<#list listReportStatisticsVo as rs>
								<tr>
									
									<td class="autocut">
										<#if yearList??>
										<#list yearList as y>
											<#if reportProgress ?? && reportProgress.yearDic ?? && reportProgress.yearDic.id == y.id>
												${y.name?html}
											</#if>
										</#list>
										</#if>
									</td>
									<td class="autocut">${rs.klass.major.collage.name}</td>
									<td class="autocut">${rs.klass.major.majorName}</td>
									<td class="autocut">${rs.klass.className}</td>
									<td class="autocut">${rs.reportedNum}</td>
									<td class="autocut">${rs.registedNum}</td>
									<#list rs.listReport as lr>
										<td class="autocut">${lr.totalNum}</td>
										<td class="autocut">${lr.reportedNum}</td>
									</#list>
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
		<h3 id="title1">导出报到进度统计列表</h3>
	</div>
	<div class="modal-body" id="export_reportProgress">
		
	</div>
	<div class="modal-footer">
		<a href="#" class="btn" data-dismiss="modal">关闭</a>
	</div>
</div>

<#-- 脚本开始 -->
<script>
	//统计按钮
	function countReportProgress() {
		$("#reportProgressQuery").attr("action", "${rc.contextPath}/orientation/reportProgress/opt-query/countReportProgress.do"); 
		$("#reportProgressQuery").attr("method", "post");
		$("#reportProgressQuery").submit();
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
			$("#export_reportProgress").load("${rc.contextPath}/orientation/reportProgress/nsm/exportReportProgressView.do?pageTotalCount="+pageTotalCount+"&exportSize="+exportSize);
		}
	});
	//点击导出按钮弹出的对话框中的链接，进行导出操作
	function exportCourseDate(exportSize,exportPage){
		$("#reportProgressQuery").attr("action", "${rc.contextPath}/orientation/reportProgress/opt-export/exportReportProgress.do");
		var fo=$("#reportProgressQuery");
		if($("#countReportProgress_exportPage").length==0){
			fo.append($("<input>",{
				id:'countReportProgress_exportSize',
				type:'hidden',
				name:'countReportProgress_exportSize',
				val:exportSize
			}));
			fo.append($("<input>",{
				id:'countReportProgress_exportPage',
				type:'hidden',
				name:'countReportProgress_exportPage',
				val:exportPage
			}));
		}else{
			$("#countReportProgress_exportSize").val(exportSize);
			$("#countReportProgress_exportPage").val(exportPage);
		}
		fo.submit();
	}
	
	
</script>
</body>
</html>