<script type="text/javascript" src="${rc.contextPath}/js/common/cascadecommon.js"></script>
<script>
	function clearCascadeForm(formId) {
		$(':input','#'+formId).not(':button, :submit, :reset, :hidden, .notClear').val('').removeAttr('checked').removeAttr('selected');
		$("#classId option").remove();
		$("#classId").append("<option value=''>请选择</option>");
		if(!$("#college").hasClass("notClear")) {
			$("#majorId option").remove();
			$("#majorId").append("<option value=''>请选择</option>");
		}
	}
</script>
<form id="reportProgressQuery" action="${rc.contextPath}/leave/project/opt-query/queryProStatisticPage.do" method="post">
<input id="pageTotalCount" name="pageTotalCount" type="hidden"  value="${page.totalCount!""}"/>
	<div class="row-fluid">
		<div class="span4">
			<span class="formTitle">办理年份</span>
			<select size="1" id="year" name="year" aria-controls="dt_gal" class="span7" >
				<option value="" >请选择</option>
				<#if yearList??>
				<#list yearList as y>
					<#if leave.year ?? && leave.year == y>
						<option value="${y!''}" data-code="${y!''}" selected="selected">${y!''}</option>	
					<#else>
						<option value="${y!''}" data-code="${y!''}">${y!''}</option>	
					</#if>
				</#list>
				</#if>
			</select>
		</div>
		<div class="span4">
			<span class="formTitle">统计范围</span>
			<select size="1" id="range" name="range" aria-controls="dt_gal" class="span7 notClear" onchange="statistics()">
				<option value="1" <#if leave.range?? && leave.range=='1'>selected="selected"</#if> >按学院统计</option>
				<option value="2" <#if leave.range?? && leave.range=='2'>selected="selected"</#if> >按专业统计</option>
				<option value="3" <#if leave.range?? && leave.range=='3'>selected="selected"</#if> >按班级统计</option>
			</select>
		</div>
		
		<div id="collegeController" class="span4 ">
			<span class="formTitle">学院</span>
		    <select  class="span7" onChange="cascade.changeCollage('collegeId', 'majorId', 'classId');" size="1" id="collegeId" name="collegeId" aria-controls="dt_gal" >
			    <option value="" >请选择</option>
			    <#if collegeList??>
					<#list collegeList as c>
						<#if leave.collegeId?? && leave.collegeId==c.id >
							<option value="${c.id}" selected="selected">${c.name?html}</option>
						<#else>
							<option value="${c.id}">${c.name?html}</option>
						</#if>
					</#list>
				</#if>
		    </select>
	    </div>
	</div>
	<div class="row-fluid">
		<div id="majorIdController" class="span4 ">
			<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;专业</span>
		    <select  class="span7" size="1" id="majorId" name="majorId" aria-controls="dt_gal" onChange="cascade.changeMajor('majorId','classId');">
		    <option value="" >请选择</option>
		    <#if majorList ?? >
				<#list majorList as m>
					<#if leave.majorId?? && leave.majorId == m.id >
						<option value="${m.id}" selected >${m.majorName}</option>
					<#else>
						<option value="${m.id}">${m.majorName}</option>
					</#if>
				</#list>
			</#if>
		    </select>
		</div>
		
		<div id="classIdController" class="span4">
			<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;班级</span>
			<select class="span7" size="1" id="classId" name="classId" aria-controls="dt_gal" >
				<option value="" >请选择</option>
				<#if classList ?? >
					<#list classList as c>
						<#if leave.classId?? && leave.classId==c.id >
							<option value="${c.id}" selected >${c.className}</option>
						<#else>
							<option value="${c.id}">${c.className}</option>
						</#if>
					</#list>
				</#if>
			</select>
		</div>
		<div class="span4 " style="padding-left:35px;">
			<input type="button" class="btn btn-info" onClick="countReportProgress();" value="查 询"/>
     		<input type="button" class="btn btn-info"  onclick="clearCascadeForm('reportProgressQuery');" value="清 空"/>
		</div>
</div>
</form>
<script>
	$("document").ready(function(){
			if($("#range").val()=='1') {
				$("#majorId").attr("disabled","disabled");
				$("#classId").attr("disabled","disabled");
			}else if($("#range").val()=='2') {
				$("#majorId").removeAttr("disabled");
				$("#classId").attr("disabled","disabled");
			}else{
				$("#majorId").removeAttr("disabled");
				$("#classId").removeAttr("disabled");
			}
		
		});
		
		function statistics() {
			if($("#range").val()=='1') {
				$("#majorId").attr("disabled","disabled");
				$("#classId").attr("disabled","disabled");
			}else if($("#range").val()=='2') {
				$("#majorId").removeAttr("disabled");
				$("#classId").attr("disabled","disabled");
			}else if($("#range").val()=='3') {
				$("#majorId").removeAttr("disabled");
				$("#classId").removeAttr("disabled");
			}
		}


	//统计按钮
	function countReportProgress() {
		$("#reportProgressQuery").attr("action", "${rc.contextPath}/leave/project/opt-query/queryProStatisticPage.do"); 
		$("#reportProgressQuery").attr("method", "post");
		$("#reportProgressQuery").submit();
	} 
	
	//导出
	function exportEvaluation(){
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
			$("#export_reportProgress").load("${rc.contextPath}/leave/project/opt-query/nsm/exportLeaveStatistic.do?pageTotalCount="+pageTotalCount+"&exportSize="+exportSize);
		}
	};
	
	function exportLeave(exportSize,exportPage){
		$("#reportProgressQuery").attr("action", "${rc.contextPath}/leave/project/opt-query/exportLeaveProject.do");
		var fo=$("#reportProgressQuery");
		if($("#exportPage").length==0){
			fo.append($("<input>",{
				id:'exportSize',
				type:'hidden',
				name:'exportSize',
				val:exportSize
			}));
			fo.append($("<input>",{
				id:'exportPage',
				type:'hidden',
				name:'exportPage',
				val:exportPage
			}));
		}else{
			$("#exportSize").val(exportSize);
			$("#exportPage").val(exportPage);
		}
		fo.submit();
	}
</script>