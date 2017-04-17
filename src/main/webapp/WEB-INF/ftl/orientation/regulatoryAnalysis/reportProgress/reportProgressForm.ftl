<script type="text/javascript" src="${rc.contextPath}/js/common/cascadecommon.js"></script>
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
<form id="reportProgressQuery" method="post">
<input id="pageTotalCount" name="pageTotalCount" type="hidden"  value="${pageTotalCount!""}"/>
<div class="span12">	
	<div class="row-fluid">
		<div class="span4">
			<span class="formTitle">学年</span>
			<select size="1" id="yearDic" name="id" aria-controls="dt_gal" class="span7 notClear" >
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
			<select size="1" id="range" name="range" aria-controls="dt_gal" class="span7 notClear">
				<option value="1" <#if range?? && range=='1'>selected="selected"</#if> >按学院统计</option>
				<option value="2" <#if range?? && range=='2'>selected="selected"</#if> >按专业统计</option>
				<option value="3" <#if range?? && range=='3'>selected="selected"</#if> >按班级统计</option>
			</select>
		</div>
		
		<div id="collegeController" class="span4 ">
			<span class="formTitle">学院</span>
		    <select  class="span7 <#if flag?? && flag>notClear</#if>" <#if flag?? && flag>disabled</#if> onChange="cascade.changeCollage('college', 'majorId', 'klassId');" size="1" id="college" name="collegeId" aria-controls="dt_gal" >
			    <option value="" >请选择</option>
			    <#if collegeList??>
					<#list collegeList as c>
						<#if collegeId?? && collegeId==c.id >
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
		<div id="majorIdController" class="span4 <#if range=='1'>hidden</#if>">
			<span class="formTitle">专业</span>
		    <select  class="span7" size="1" id="majorId" name="majorId" aria-controls="dt_gal" onChange="cascade.changeMajor('majorId','klassId');">
		    <option value="" >请选择</option>
		    <#if listMajor ?? >
				<#list listMajor as m>
					<#if majorId?? && majorId == m.id >
						<option value="${m.id}" selected >${m.majorName}</option>
					<#else>
						<option value="${m.id}">${m.majorName}</option>
					</#if>
				</#list>
			</#if>
		    </select>
		</div>
		
		<div id="klassIdController" class="span4 <#if range!='3'>hidden</#if>">
			<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;班级</span>
			<select class="span7" size="1" id="klassId" name="klassId" aria-controls="dt_gal" >
				<option value="" >请选择</option>
				<#if listKlass ?? >
					<#list listKlass as c>
						<#if klassId?? && klassId==c.id >
							<option value="${c.id}" selected >${c.className}</option>
						<#else>
							<option value="${c.id}">${c.className}</option>
						</#if>
					</#list>
				</#if>
			</select>
		</div>
		<div class="span4 ">
			<input type="button" class="btn btn-info" onClick="countReportProgress();" value="统 计"/>
     		<input type="button" class="btn btn-info"  onclick="clearCascadeForm('reportProgressQuery');" value="清 空"/>
		</div>
	</div>		
	<#--	
    <div class="btnCenter">
      <input type="button" class="btn btn-info" onClick="countReportProgress();" value="统 计"/>
      <input type="button" class="btn btn-info"  onclick="comp.clearForm('reportProgressQuery');" value="清 空"/>
    </div>
    -->
</div>
</form>
<script>
	jQuery("#range").change(function() {
		//选中学院， 隐藏专业班级并将其值置空； 选中专业， 隐藏班级并将其值置空
		if($("#range").val()=='1') {
			$("#majorIdController").removeClass().addClass("span4 hidden");
			$("#klassIdController").removeClass().addClass("span4 hidden");
			$("#majorId").val("");
			$("#klassId").val("");
		}else if($("#range").val()=='2') {
			//隐藏班级 
			$("#klassIdController").removeClass().addClass("span4 hidden");
			$("#klassId").val("");
			//显示专业
			$("#majorIdController").removeClass("hidden");
			//调用学院级联专业
			//cascade.changeCollage('college', 'majorId', 'classId');
		}else if($("#range").val()=='3') {
			//显示班级 专业
			$("#klassIdController").removeClass("hidden");
			$("#majorIdController").removeClass("hidden");
			//调用专业级联班级
			//cascade.changeMajor('majorId','classId')
		}
	
	});

	//统计按钮
	function countReportProgress() {
		showShade();
		$("#reportProgressQuery").attr("action", "${rc.contextPath}/orientation/reportProgress/opt-query/countReportProgress.do"); 
		$("#reportProgressQuery").attr("method", "post");
		$("#reportProgressQuery").submit();
	} 
	//点击导出按钮触发的方法
	$("#export-button").live("click", function() {
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

