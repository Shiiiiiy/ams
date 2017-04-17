<div class="row-fluid">
	<div class="span12">
		<form id="_undo_teacher"  action="${rc.contextPath}/teacherInfo/view/nsm/restTeacherView.do" method="post">
			<input id="formId" name="formId" value=""  type="hidden"/>	
			<div class="row-fluid">
				<div class="span4">	
					学院单位
					<select id="_radioTeacherCollegeId" name="college.id" aria-controls="dt_gal"  class="span9">
						<option value="">请选择</option>
						<#if orgList??>
						<#list orgList as cl> 
							<option <#if po.college?? && po.college.id==cl.id>selected</#if> value="${cl.id}">${cl.name!""}</option>
						</#list>
						</#if>
					</select>		
				</div>
				<div class="span3">	
					 姓名	
					<input id="_radioName" name="teacher.name" class="span9"  value="<#if po.teacher??>${po.teacher.name!""}</#if>"/>
				</div>
				<div class="span3">	
					工号
					<input id="_radioStuNumber" name="teacher.code" class="span9"  value="<#if po.teacher??>${po.teacher.code!""}</#if>"/>
				</div>
				<div class="span2">	
					<input type="button" class="btn btn-info" id="_teacherRadioQueryButton" onclick="_queryUndoTeacher()" value="查 询"/>
					<input type="button" class="btn btn-info" id="_teacherRadioClearButton" onclick="comp.clearForm('_undo_teacher')" value="清 空"/>	
				</div>
			</div>
		</form>
	</div>
</div>
<div class="row-fluid" id="viewRestTeacherDiv">
	
</div>

<script> 

function _queryUndoTeacher() {
	var collegeId = $("#_radioTeacherCollegeId").val();
	var teacherName = $("#_radioName").val();
	var teacherCode = $("#_radioStuNumber").val();
	var param = {'college.id':collegeId,'teacher.name':teacherName,'teacher.code':teacherCode};
	$("#viewRestTeacherDiv").load("${rc.contextPath}/teacherInfo/view/nsm/ajaxueryOnPage.do",param,function(){});
}

 function eisdResponse() {
	var fromId = "_undo_teacher";
	var pageNo = $("#"+fromId+"pageTagFormIdpageNo").val();
	var collegeId = $("#_radioTeacherCollegeId").val();
	var teacherName = $("#_radioName").val();
	var teacherCode = $("#_radioStuNumber").val();
	if(pageNo != null && pageNo !="" && pageNo != "undefined")
	{
		var param = {pageNo:pageNo,'college.id':collegeId,'teacher.name':teacherName,'teacher.code':teacherCode};
		$("#viewRestTeacherDiv").load("${rc.contextPath}/teacherInfo/view/nsm/ajaxueryOnPage.do",param,function(){});
	}
}

</script> 
