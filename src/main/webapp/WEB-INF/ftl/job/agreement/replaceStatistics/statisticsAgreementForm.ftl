<script type="text/javascript" src="${rc.contextPath}/js/common/cascadecommon.js"></script>

<form id="statisticsQuery" method="post" action="${rc.contextPath}/job/statistics/opt-query/statisticsAgreementByCollege.do"  >
<div class="span12">	
	<div class="row-fluid">
		<div class="span4">
			<span class="formTitle">学年</span>
			<select size="1" id="dicYear" name="dicYear.id" aria-controls="dt_gal" class="span7" >
			<option value="" >请选择</option>
				<#if yearList??>
				<#list yearList as y>
					<#if agreementStatistics?? && agreementStatistics.dicYear ?? && agreementStatistics.dicYear.id == y.id>
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
			<select size="1" id="range" name="range" aria-controls="dt_gal" class="span7" onchange="statistics()" >
				<option value="1" <#if agreementStatistics?? && agreementStatistics.range ?? && agreementStatistics.range == '1'> selected="selected"</#if> >学院</option>
				<option value="2" <#if agreementStatistics?? && agreementStatistics.range ?? && agreementStatistics.range == '2'> selected="selected"</#if> >专业</option>
				<option value="3" <#if agreementStatistics?? && agreementStatistics.range ?? && agreementStatistics.range == '3'> selected="selected"</#if> >班级</option>
			</select>
		</div>
		
		<div class="span4 ">
			<span class="formTitle">学院</span>
		    <select size="1" id="collegeId" name="college.id" aria-controls="dt_gal" class="span6" onchange="cascade.changeCollage('collegeId','majorId');" >
			    <option value="" >请选择</option>
			    <#if collegeList??>
					<#list collegeList as c>
						<#if agreementStatistics?? && agreementStatistics.college?? && agreementStatistics.college.id == c.id >
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
		<div class="span4" >
			<span class="formTitle">专业</span>
		    <select  class="span7" size="1" id="majorId" name="major.id" aria-controls="dt_gal"  onchange="cascade.changeMajor('majorId','classId');"   >
		    <option value="" >请选择</option>
		    <#if majorList ?? >
				<#list majorList as m>
					<#if agreementStatistics ?? && agreementStatistics.major?? && agreementStatistics.major.id == m.id >
						<option value="${m.id}" selected >${m.majorName}</option>
					<#else>
						<option value="${m.id}">${m.majorName}</option>
					</#if>
				</#list>
			</#if>
		    </select>
		</div>
		
		<div class="span4">
			<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;班级</span>
			<select class="span7" size="1" id="classId" name="classId.id" aria-controls="dt_gal" >
				<option value="" >请选择</option>
				<#if classList ?? >
					<#list classList as c>
						<#if agreementStatistics?? && agreementStatistics.classId?? && agreementStatistics.classId.id == c.id >
							<option value="${c.id}" selected >${c.className}</option>
						<#else>
							<option value="${c.id}">${c.className}</option>
						</#if>
					</#list>
				</#if>
			</select>
		</div>
		<div class="span4">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input type="button" class="btn btn-info" onclick="statisticsRegister()" value="统 计"/>
     		<input type="button" class="btn btn-info" onclick="comp.clearForm('statisticsQuery')" value="清 空"/>
		</div>
	</div>		
</div>
</form>
	<div class="modal hide fade" id="exportDemo">
		<div class="modal-header">
			<button class="close" data-dismiss="modal">×</button>
			<h3 id="title1">导出就业协议补办统计表</h3>
		</div>
		<div class="modal-body" id="export_statistics">
			
		</div>
		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal">关闭</a>
		</div>
	</div>
	
	
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
		function statisticsRegister() {
			$("#statisticsQuery").attr("action", "${rc.contextPath}/job/statistics/opt-query/statisticsAgreementByCollege.do"); 
			$("#statisticsQuery").attr("method", "post");
			$("#statisticsQuery").submit();
		} 
	
		//弹出导出页
		$("#export-button").live("click", function() {
			var pageTotalCount= $("#pageTotalCount").val();
			var exportSize = "1000" ;
			comp.showModal("exportDemo","500px","-250px 0 0 -250px");
			$("#export_statistics").load("${rc.contextPath}/job/agreement/nsm/exportPrepare.do?pageTotalCount="+pageTotalCount+"&exportSize="+exportSize);
		});
	
		//点击导出按钮弹出的对话框中的链接，进行导出操作
		function exportDate(exportSize,exportPage){
			$("#statisticsQuery").attr("action", "${rc.contextPath}/job/agreement/opt-export/exportAgreementList.do");
			var fo=$("#statisticsQuery");
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

