<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
</head>
<body>
<script>
	function queryEvaluateInfoList() {
		$("#statisticList").attr("action", "${rc.contextPath}/teacher/statistic/opt-query/auditStatistic.do");
		$("#statisticList").attr("method","post");
		$("#statisticList").submit();
	}
	
	function exportEvaludateInfo() {
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
			comp.message("请输入不大于1000的正整数","error");
		}else{
			comp.showModal("exportdemo","500px","-250px 0 0 -250px");
			$("#export_audit").load("${rc.contextPath}/teacher/statistic/nsm/exportView.do?pageTotalCount="+pageTotalCount+"&exportSize="+exportSize);
		}
	}
	function exportAduit(exportSize,exportPage){
		$("#statisticList").attr("action", "${rc.contextPath}/teacher/statistic/opt-export/exportAduit.do");
		var fo=$("#statisticList");
		if($("#stuJob_exportPage").length==0){
			fo.append($("<input>",{
				id:'stuJob_exportSize',
				type:'hidden',
				name:'stuJob_exportSize',
				val:exportSize
			}));
			fo.append($("<input>",{
				id:'stuJob_exportPage',
				type:'hidden',
				name:'stuJob_exportPage',
				val:exportPage
			}));
		}else{
			$("#stuJob_exportSize").val(exportSize);
			$("#stuJob_exportPage").val(exportPage);
		}
		fo.submit();
		$("#statisticList").attr("action", "${rc.contextPath}/teacher/statistic/opt-query/auditStatistic.do");
	}
	function addTitle(num, schoolYearId, collegeId, levelId, obj) {
		if(num!="0" && $(obj).attr("title")==null) {
			$.ajax({
				async:false,
				cache: false,
				type: "POST",
				url:'${rc.contextPath}/teacher/statistic/nsm/auditTeachers.do',
				data:{schoolYearId:schoolYearId, collegeId:collegeId, levelId:levelId },
			    contentType:"application/x-www-form-urlencoded;charset=utf-8", 
			    error: function() {
			    	comp.message("请求发送失败，请联系管理员", "error");
			    },
				success: function(data){
					$(obj).attr("title", data);
			    }
			});
		}
	}
	
	
</script>
<div id="contentwrapper">
	<div class="main_content">
		<div class="row-fluid">
			<form id="statisticList" action="${rc.contextPath}/teacher/statistic/opt-query/auditStatistic.do" method="post" >
				<div class="span12">
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">学年</span>
							<select class="span8" id="schoolYearId" name="schoolYearId" aria-controls="dt_gal" >
								<option value="">请选择</option>
								<#if schoolYearList??>
								<#list schoolYearList as schoolYear>
									<#if schoolYearId?? && schoolYearId==schoolYear.id>
										<option value="${schoolYear.id}" selected="selected">${schoolYear.name}</option>
									<#else>
										<option value="${schoolYear.id}">${schoolYear.name}</option>
									</#if>
								</#list>
								</#if>
							</select>
						</div>
						<div class="span4">
							<span class="formTitle">学院</span>
							<select class="span8" name="collegeId" aria-controls="dt_gal" >
								<option value="">请选择</option>
								<#if collegeList??>
								<#list collegeList as college>
									<#if collegeId?? && collegeId == college.id>
										<option value="${college.id}" selected="selected">${college.name}</option>
									<#else>
										<option value="${college.id}">${college.name}</option>
									</#if>
								</#list>
								</#if>
							</select>
						</div>
						<div class="span4">
							<button class="btn btn-info" type="button" onClick="queryEvaluateInfoList();">查  询</button>
							<button class="btn btn-info" type="button" onclick="comp.clearForm('statisticList');">清 空</button>
						</div>
					</div>
				</div>
			</form>
			<div class="row-fluid">
				<div class="span12">
					<h5 class="heading"></h5>
					<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
						<div class="row">
						<div class="dt_actions">
							<div class="row-fluid">
								<div class="input-append">
									<#--<span class="expsingle">单页导出条数:</span>-->
									<input id="exportSize" type="hidden" class="span3" title="单页导出条数" value="${pageTotalCount!"1000"}" name="exportSize">
									<button class="btn btn-info" onclick="exportEvaludateInfo()" type="button">导 出</button>
								</div>
							</div>
						</div>
						</div>
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
							<thead>
								<tr>
									<th width="6%">序号</th>
									<th width="17%">学年</th>
									<th width="17%">学院</th>
									<th width="15%">优秀（人）</th>
									<th width="15%">良好（人）</th>
									<th width="15%">中等（人）</th>
									<th width="15%">差（人）</th>
								</tr>
								<tbody>
									<#if page??>
										<#list page.result as p>
											<tr>
												<td class="autocut">${p_index+1}</td>
												<td class="autocut">${p.schoolYear.name!""}</td>
												<td class="autocut" >${p.college.name!""}</td>
												<td class="autocut" onMouseOver="addTitle('${p.excellent!""}', '${p.schoolYear.id!""}', '${p.college.id!""}', '0', this);">${p.excellent!""}</td>
												<td class="autocut" onMouseOver="addTitle('${p.well!""}', '${p.schoolYear.id!""}', '${p.college.id!""}', '1', this);">${p.well!""}</td>
												<td class="autocut" onMouseOver="addTitle('${p.medium!""}', '${p.schoolYear.id!""}', '${p.college.id!""}', '2', this);">${p.medium!""}</td>
												<td class="autocut" onMouseOver="addTitle('${p.bad!""}', '${p.schoolYear.id!""}', '${p.college.id!""}', '3', this);">${p.bad!""}</td>
											</tr>
										</#list>
									</#if>
								</tbody>
							</thead>
						</table>
						<!--用于用户导出 -->
						<input id="pageTotalCount" name="pageTotalCount" type="hidden"  value="${page.totalCount!""}"/>
						<#assign pageTagformId="statisticList"/>
						<#include "/page.ftl">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="modal hide fade" id="exportdemo">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3 id="title1">导出考核统计列表</h3>
	</div>
	<div class="modal-body" id="export_audit">
		
	</div>
	<div class="modal-footer">
		<a href="#" class="btn" data-dismiss="modal">关闭</a>
	</div>
</div>
</body>
</html>