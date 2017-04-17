<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
    <script>

	function importStudentArmy(){
		window.location.href="${rc.contextPath}/warning/import/studyWarningImport.ftl";
	}
	
	//点击checkbox按钮 
	function onClickSingleCheckbox(obj)
	{
		var $subBox = $("input[name='studyWarningId']");
		$("#totalCheck").attr("checked",$subBox.length == $("input[name='studyWarningId']:checked").length ? true : false);
	}
	
	function deleteStudent()
	{
		var $subBox = $("input[name='studyWarningId']");
		var len =  $("input[name='studyWarningId']:checked").length ;
		if(len >0)
		{
			comp.confirm("删除选中的学业预警信息，系统将不再保存和备份，确认要删除吗？", function(result) {
            	if(!result)
            		return;  
         		
         		$.ajax({
					url: "${rc.contextPath}/warning/import/opt-del/deleteStudyWarning.do",
					async:false,
					cache:false,
					type:"POST",
					data:$('#studentDelete').serialize(),
				    success: function(data){
						if(data == "success"){
					       $("#studyWarningQuery").submit();
					    }else{
					    	$.sticky("学业预警信息删除失败", {autoclose:5000, position:"top-right", type:"st-error"});
					    	return;
					    }
					}
			   });

			}); 
		}
		else
		{
			comp.message("请选择要删除的学业预警信息!","info");
		}
	}
	
	
	</script>
</head>
<body>
<div id="contentwrapper">
    <div class="main_content">   
    	   <div class="row-fluid">	
    		<form  id="studyWarningQuery"  action="${rc.contextPath}/warning/importSTUDY/opt-query/wangingList.do" method="post">
				<div class="span12">			
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">学院</span>
							<select size="1" id="collegeId" name="student.college.id" aria-controls="dt_gal" class="span6" onchange="cascade.changeCollage('collegeId','majorId','classId');" >
								<option value="">请选择..</option>
								<#if collegeList ??>
									<#list collegeList as c>
										<#if  studyWarning ?? && studyWarning.student ??&& studyWarning.student.college ?? &&  studyWarning.student.college.id == c.id >
											<option  value="${c.id}" selected="selected">${((c.name)!"")?html}</option>
										<#else>
											<option value="${c.id}" >${((c.name)!"")?html}</option>
										</#if>
									</#list>
								</#if>
							</select>
						 </div>
						 <div class="span4">
							<span class="formTitle">专业</span>
							<select size="1" id="majorId" name="student.major.id" aria-controls="dt_gal" class="span6 emptySelect"  onchange="cascade.changeMajor('majorId','classId');">
								<option value="" >请选择..</option>
								<#if majorList ?? >
									<#list majorList as m>
										<#if studyWarning ?? && studyWarning.student ??&& studyWarning.student.major ?? &&  studyWarning.student.major.id == m.id >
											<option value="${m.id}" selected >${m.majorName?html}</option>
										<#else>
											<option value="${m.id}">${m.majorName?html}</option>
										</#if>
									</#list>
								</#if>
							</select>
						  </div>
						<div class="span4">
							<span class="formTitle">班级</span>
							<select size="1" id="classId" name="student.classId.id" aria-controls="dt_gal" class="span6 emptySelect">
								<option value="" >请选择..</option>
								<#if classList ?? >
									<#list classList as c>
										<#if studyWarning ?? && studyWarning.student ??&& studyWarning.student.classId ?? &&  studyWarning.student.classId.id == c.id >
											<option value="${c.id}" selected >${c.className?html}</option>
										<#else>
											<option value="${c.id}">${c.className?html}</option>
										</#if>
									</#list>
								</#if>
							</select>
						</div>
						</div>		
					    <div class="row-fluid">
						<div class="span4">
							<span class="formTitle">姓名</span>
							<input id="name" name="student.name" class="span6" value="<#if studyWarning ?? && studyWarning.student ??>${studyWarning.student.name!""?html}</#if>" />
						 </div>
						 <div class="span4">
							<span class="formTitle">学号</span>
							<input id="stuNumber" name="student.stuNumber" class="span6" value="<#if studyWarning ?? && studyWarning.student ??>${studyWarning.student.stuNumber!""?html}</#if>" />
						 </div>
						 <div class="span4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						  	<button class="btn btn-info" type="submit">查 询</button>
		              		<button class="btn btn-info" type="button" onclick="comp.clearForm('studyWarningQuery');">清 空</button>
						 </div>
		       </div>
	        </div>
			</form>
				<div class="row-fluid">
					<div class="span12">
						<h5 class="heading"></h5>
						<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
						<div class="row">
				            <div class="span10">
				                <div class="dt_actions">
				                    <div class="row-fluid">
								        <#if user_key.optMap??>
											<#if user_key.optMap['import']??>
												 <button class="btn btn-info" type="button"  onclick="importStudentArmy();">导 入</button>
											</#if>
											<#if user_key.optMap['del']??>
												<button class="btn btn-info" type="button"  onclick="deleteStudent();">删 除</button>
											</#if>
										</#if>
									</div>
								</div>
							</div>
						</div>
						<form  id="studentDelete"  action="${rc.contextPath}/student/army/opt-del/deleteStudentArmy.do" method="post">
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
							<thead>
								<tr>
								    <th width="6%">
								  	 <#if user_key.optMap??>
										<#if user_key.optMap['del']??>
											<input type="checkbox" id="totalCheck"  onclick="comp.selectAllCheckbox('totalCheck','studyWarningId')"/>
										<#else>
											序号
										</#if>
									 </#if> 
								    </th>
									<th width="10%">姓名</th>
									<th width="12%">学号</th>
									<th width="6%">性别</th>
									<th width="20%">班级</th>
									<th width="18%">专业</th>
									<th width="15%">学院</th>
									<th width="15%">学籍预警</th>
								</tr>
							</thead>
							<tbody>
							<#if page??>	
								<#list page.result as p>
								<#if p.student ?? >
								<tr>		
								    <td>
								    <#if user_key.optMap??>
										<#if user_key.optMap['del']??>
											<input type="checkbox"  name="studyWarningId" onclick="onClickSingleCheckbox(this);" value="${p.id!""}"/>
										<#else> 
											${p_index+1}
										</#if>
									 </#if>
								   </td>
									<td class="autocut">${p.student.name!""?html}</td>
									<td class="autocut">${p.student.stuNumber!""?html}</td>
									<td class="autocut"><#if p.student.genderDic ?? >${p.student.genderDic.name!""?html}</#if></td>
                                   	<td class="autocut"><#if p.student.classId ?? >${(p.student.classId.className!"")}</#if></td>
                               		<td class="autocut"><#if p.student.major ?? >${(p.student.major.majorName!"")}</#if></td>
                           			<td class="autocut"><#if p.student.college ?? >${(p.student.college.name!"")}</#if></td>
                       				<td class="autocut">${(p.studyWarning!"")}</td>
								</tr>
								</#if>
								</#list>
							 </#if> 
							</tbody>
						</table>
						</from>
						 <#assign pageTagformId="studyWarningQuery"/>
						 <#include "/page.ftl">
					</div>
				</div>
			</div> 
		</div> 
	</div>
</div>

</body>
</html>