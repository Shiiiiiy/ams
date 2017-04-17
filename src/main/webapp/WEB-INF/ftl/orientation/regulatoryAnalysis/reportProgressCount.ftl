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
								<select size="1" id="yearDic" name="id" aria-controls="dt_gal" class="span7" >
									<#if yearList??>
									<#list yearList as y>
										<#if yearDic ?? && yearDic.id == y.id>
											<option value="${y.id}" data-code="${y.code?html}" selected="selected">${y.name?html}</option>	
										<#else>
											<option value="${y.id}" data-code="${y.code?html}">${y.name?html}</option>	
										</#if>
									</#list>
									</#if>
								</select>
							</div>
							<div class="span4">
								<span class="formTitle">统计范围</span>
								<select size="1" id="range" name="range" aria-controls="dt_gal" class="span7" onChange="cascade.changeCollage('college', 'majorId');">
									<option value="" >请选择</option>
									<option value="1" <#if range?? && range=='1'>selected="selected"</#if> >按学院统计</option>
									<option value="2" <#if range?? && range=='2'>selected="selected"</#if> >按专业统计</option>
									<option value="3" <#if range?? && range=='3'>selected="selected"</#if> >按班级统计</option>
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
						<h5 class="heading"></h5>
						<div id="reportProgressT" class="dataTables_wrapper form-inline" role="grid" style="overflow-x:scroll">
						
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
		$.ajax({
			cache: false,
		    type: "POST",
		    url:"${rc.contextPath}/orientation/reportProgress/nsm/countReportProgress.do",
		    data:{'range':$("#range").val(), 'id':$("#yearDic").val()},
		    async: false,
		    error: function(){
		       comp.message("报到进度列表加载失败，请联系管理员。",'error');
		    },
		    success: function(data) {
		    	$("#reportProgressT").html(data);
		    }
		});
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