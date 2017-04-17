<form id="employmentSchemeForm" method="post" action="${rc.contextPath}/job/statEmploymentScheme/opt-query/statEmploymentSchemeList.do">
	<div class="row-fluid">
		<div class="span12">
			<div class="row-fluid">
				<div class="span4">
					<span class="formTitle">学年</span>
					<select name="schoolYear.id" size="1" aria-controls="dt_gal" class="span6 notClear">
						<option value="">请选择</option>
						<#if years??>
							<#list years as year>
								<#if (employmentSchemeVO.schoolYear.id)?? && employmentSchemeVO.schoolYear.id == year.id>
									<option value="${year.id}" selected="selected">${year.name}</option>
								<#else>
									<option value="${year.id}">${year.name}</option>
								</#if>
							</#list>
						</#if>
					<select>
				</div>
				<div class="span4">
					<span class="formTitle">统计范围</span>
					<select id="statByWay" name="statByWay" aria-controls="dt_gal" class="span6 notClear" onchange="statByWays(this);">
						<#if statisticalWays??>
							<#list statisticalWays?keys as way>
								<#if statByWay?? && statByWay == way>
									<option value="${way}" selected="selected">${statisticalWays[way]}</option>
								<#else>
									<option value="${way}">${statisticalWays[way]}</option>
								</#if>
							</#list>
						</#if>
					</select>
				</div>
				<div class="span4">
					<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学院</span>
					<select id="radioCollegeId" name="studentId.college.id" aria-controls="dt_gal" class="span6 <#if isJobOffice == false>notClear</#if>" <#if isJobOffice == false> disabled="disabled" </#if> onchange="cascade.changeCollage('radioCollegeId','radioMajor','radioClass');">
						<option value="">请选择</option>
						<#if colleges??>
							<#list colleges as college>
								<#if (employmentSchemeVO.studentId.college.id)?? && employmentSchemeVO.studentId.college.id == college.id>
									<option value="${college.id}" selected="selected">${college.name}</option>
								<#else>
									<option value="${college.id}">${college.name}</option>
								</#if>
							</#list>
						</#if>
					</select>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span4">
					<span class="formTitle">专业</span>
					<select id="radioMajor" name="studentId.major.id" aria-controls="dt_gal" class="span6 <#if isJobOffice == true>emptySelect</#if>" onchange="cascade.changeMajor('radioMajor','radioClass');" <#if statByWay=="byCollege"> disabled="disabled" </#if> >
						<option value="">请选择</option>
						<#if majors??>
							<#list majors as major>
								<#if (employmentSchemeVO.studentId.major.id)?? && employmentSchemeVO.studentId.major.id == major.id>
									<option value="${major.id}" selected="selected">${major.majorName}</option>
								<#else>
									<option value="${major.id}">${major.majorName}</option>
								</#if>
							</#list>
						</#if>
					</select>
				</div>
				<div class="span4">
					<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;班级</span>
					<select id="radioClass" name="studentId.classId.id" size="1" aria-controls="dt_gal" class="span6 emptySelect" <#if statByWay=="byCollege" || statByWay=="byMajor"> disabled="disabled" </#if> >
						<option value="">请选择</option>
						<#if classes??>
							<#list classes as clazz>
								<#if (employmentSchemeVO.studentId.classId)?? && employmentSchemeVO.studentId.classId.id == clazz.id>
									<option value="${clazz.id}" selected="selected">${clazz.className}</option>
								<#else>
									<option value="${clazz.id}">${clazz.className}</option>
								</#if>
							</#list>
						</#if>
					<select>
				</div>
				<div class="span4">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="button" class="btn btn-info" onClick="countSchoolGooodStudent();" value="统 计"/>
					<input type="button" class="btn btn-info"  onclick="comp.clearForm('employmentSchemeForm');" value="清 空"/>
				</div>
			</div>
		</div>
	</div>
</form>
<div class="modal hide fade" id="exportSchoolGooodStudent">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3 id="title1">导出就业率统计表</h3>
	</div>
	<div class="modal-body" id="export_SchoolGooodStudent">
		
	</div>
	<div class="modal-footer">
		<a href="#" class="btn" data-dismiss="modal">关闭</a>
	</div>
</div>
<script>
	function countSchoolGooodStudent(){
		var employmentSchemeForm = $("#employmentSchemeForm");
		employmentSchemeForm.attr("action","${rc.contextPath}/job/statEmploymentScheme/opt-query/statEmploymentSchemeList.do");
		employmentSchemeForm.submit();
	}
	function statByWays(obj){
		comp.clearForm('employmentSchemeForm');
		var way = $(obj).val();
		var radioMajor = $("#radioMajor");
		var radioClass = $("#radioClass");
		if(way == "byCollege"){
			radioMajor.attr("disabled","disabled");
			radioClass.attr("disabled","disabled");
		}
		if(way == "byMajor"){
			radioMajor.removeAttr("disabled");
			radioClass.attr("disabled","disabled");
		}
		if(way == "byClass"){
			radioMajor.removeAttr("disabled");
			radioClass.removeAttr("disabled");
		}
	}
	//显示导出页面
	function exportSchoolGooodStudent(){
		var pageTotalCount= $("#pageTotalCount").val();
		var exportSize = 10000;
		comp.showModal("exportSchoolGooodStudent","500px","-250px 0 0 -250px");
		$("#export_SchoolGooodStudent").load("${rc.contextPath}/job/statEmploymentScheme/nsm/exportEmploymentSchemePage.do?pageTotalCount="+pageTotalCount+"&exportSize="+exportSize);
	}
	//导出excel
	function exportDate(exportSize,exportPage){
		var fo=$("#employmentSchemeForm");
		fo.attr("action","${rc.contextPath}/job/statEmploymentScheme/opt-query/statEmploymentSchemeListByStat.do");
		if($("#userQuery_exportPage").length==0){
			fo.append($("<input>",{
				id:'userQuery_exportSize',
				type:'hidden',
				name:'userQuery_exportSize',
				val:exportSize
			}));
			fo.append($("<input>",{
				id:'userQuery_exportPage',
				type:'hidden',
				name:'userQuery_exportPage',
				val:exportPage
			}));
		}else{
			$("#userQuery_exportSize").val(exportSize);
			$("#userQuery_exportPage").val(exportPage);
		}
		fo.submit();
	}
</script>