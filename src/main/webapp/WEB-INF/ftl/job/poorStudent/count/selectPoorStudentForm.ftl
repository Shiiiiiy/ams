<form id="countPoorStudentForm" method="post" action="${rc.contextPath}/job/countPoorStudent/opt-query/countPoorStudentList.do">
	<div class="row-fluid">
		<div class="span12">
			<div class="row-fluid">
				<div class="span4">
					<span class="formTitle">学年</span>
					<select name="difficultStudentInfo.schoolYear.id" size="1" aria-controls="dt_gal" class="span6">
					  <option value="">请选择..</option>
						<#if years??>
							<#list years as year>
								<#if poorStudent.difficultStudentInfo?? && poorStudent.difficultStudentInfo.schoolYear?? && poorStudent.difficultStudentInfo.schoolYear.id?? && poorStudent.difficultStudentInfo.schoolYear.id == year.id>
									<option value="${year.id}" selected="selected">${year.name}</option>
								<#elseif nowSchoolYear?? && nowSchoolYear.id?? && nowSchoolYear.id == year.id>
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
					<select id="statByWay" name="statByWay" aria-controls="dt_gal" class="span6" onchange="statByWays(this);">
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
					<span class="formTitle">学院</span>
					<select id="radioCollegeId" name="difficultStudentInfo.student.college.id" aria-controls="dt_gal" class="span6" onchange="cascade.changeCollage('radioCollegeId','radioMajor','radioClass');">
						<option value="">请选择..</option>
						<#if colleges??>
							<#list colleges as college>
								<#if poorStudent.difficultStudentInfo?? && poorStudent.difficultStudentInfo.student?? && poorStudent.difficultStudentInfo.student.college?? && poorStudent.difficultStudentInfo.student.college.id == college.id>
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
					  <select id="radioMajor" name="difficultStudentInfo.student.major.id" aria-controls="dt_gal" class="span6 emptySelect" onchange="cascade.changeMajor('radioMajor','radioClass');" <#if statByWay="byCollege"> disabled="disabled" </#if> >
						<option value="">请选择..</option>
						<#if majors??>
							<#list majors as major>
								<#if poorStudent.difficultStudentInfo?? && poorStudent.difficultStudentInfo.student?? && poorStudent.difficultStudentInfo.student.major?? && poorStudent.difficultStudentInfo.student.major.id == major.id>
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
					<select id="radioClass" name="difficultStudentInfo.student.classId.id" size="1" aria-controls="dt_gal" class="span6 emptySelect" <#if statByWay="byCollege" || statByWay="byMajor"> disabled="disabled" </#if> >
						<option value="">请选择..</option>
						<#if classes??>
							<#list classes as clazz>
								<#if poorStudent.difficultStudentInfo?? && poorStudent.difficultStudentInfo.student?? && poorStudent.difficultStudentInfo.student.classId?? && poorStudent.difficultStudentInfo.student.classId.id == clazz.id>
									<option value="${clazz.id}" selected="selected">${clazz.className}</option>
								<#else>
									<option value="${clazz.id}">${clazz.className}</option>
								</#if>
							</#list>
						</#if>
					<select>
				</div>
				<div class="span4">
				    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
					<input type="button" class="btn btn-info" onClick="countPoorStudent();" value="统 计"/>
					<input type="button" class="btn btn-info" onclick="comp.clearForm('countPoorStudentForm')" value="清 空"/>
				</div>
			</div>
		</div>
	</div>
</form>
<script>
	function countPoorStudent(){
	    $("#countPoorStudentForm").attr("action","${rc.contextPath}/job/countPoorStudent/opt-query/countPoorStudentList.do");
		var countPoorStudentForm = $("#countPoorStudentForm");
		countPoorStudentForm.submit();
	}
	function statByWays(obj){
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
</script>