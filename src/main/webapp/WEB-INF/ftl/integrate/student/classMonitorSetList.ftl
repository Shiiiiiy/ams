<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="${rc.contextPath}/js/common/setTimeConfig.js"></script>
    <script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
    <script src="${rc.contextPath}/js/jquery.form.js"></script> 
    <script>
    function clearCascadeForm(formId) {
			$(':input','#'+formId).not(':button, :submit, :reset, :hidden, .notClear').val('').removeAttr('checked').removeAttr('selected');
			if($("#id option").length>1) {
				var option = $("#id").get(0).options;
				option.length = 0;
				var nullOption = new Option("请选择", "", false, false);
				option.add(nullOption);
			}
			if(!$("#collegeId").hasClass("notClear") && $("#majorId option").length>1) {
				var option = $("#majorId").get(0).options;
				option.length = 0;
				var nullOption = new Option("请选择", "", false, false);
				option.add(nullOption);
			}
		}
		//按照班级过滤的选择单选
	function selectStudentByClassRadio(id)
	{
		var studentId = $("#"+id+"_studentId").val(); 
		
		_queryStudentRadioByClass(id,studentId);
	}
	function setClassStudentSelectValue(student)
	{	
	  	var orginStudentId = $("#"+student.classId+"_studentId").val(); 
	
	   $.ajax({
			url:'${rc.contextPath}/student/set/opt-edit/editMonitor.do',
			async:false,
			cache: false,
			type: "POST",
			data:{classId : student.classId,studentId : student.id,orginStudentId:orginStudentId },
			success: function(data){
			  $("#"+student.classId+"_td").html(student.name);
			  $("#"+student.classId+"_studentId").val(student.id);
		 	 comp.message(student.className+"的审核班长成功设置为"+student.name+"!","info");
		    }
		});
	}
	function  setConfigTimeValue(bengDate,endDate,code){
	
	    //alert("["+bengDate+"至"+endDate+"]"); 
	    //if(bengDate.length()>0 && endDate.length()>0){
	    $("#time").html("["+bengDate+"至"+endDate+"]");
	    //}	    
    }
    </script>
</head>
<body>
<div id="contentwrapper">
    <div class="main_content">   
    	   <div class="row-fluid">	
    	   <#if page ??>
    		<form  id="classQuery"  action="${rc.contextPath}/student/set/opt-query/classMonitorSetList.do" method="post">
				<div class="span12">	
				<#if teacher ??>
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">学院</span>
							<select size="1" id="collageId" name="major.collage.id" aria-controls="dt_gal" class="span7" onchange="cascade.changeCollage('collageId','majorId','id');" >
								<option value="">请选择..</option>
								<#if classMonitor.major?? && classMonitor.major.collage ?? >
									<#list collageList as d>
										<#if classMonitor.major.collage.id ==d.id >
											<option  value="${d.id}" selected="selected">${d.name?html}</option>
										<#else>
											<option value="${d.id}" >${d.name?html}</option>
										</#if>
									</#list>
								<#else>
									<#list collageList as d>
										<option  value="${d.id}">${d.name?html}</option>
									</#list>
								</#if>
							</select>
						 </div>
						 <div class="span4">
							<span class="formTitle">专业</span>
							<select size="1" id="majorId" name="major.id" aria-controls="dt_gal" class="span7 emptySelect"  onchange="cascade.changeMajor('majorId','id');">
								<option value="" >请选择..</option>
								<#if majorList ?? >
									<#list majorList as m>
										<#if classMonitor ?? && classMonitor.major ?? && classMonitor.major.id ?? && classMonitor.major.id == m.id >
											<option value="${m.id}" selected >${m.majorName}</option>
										<#else>
											<option value="${m.id}">${m.majorName}</option>
										</#if>
									</#list>
								</#if>
							</select>
						  </div>
						<div class="span4">
							<span class="formTitle">班级</span>
							<select size="1" id="id" name="id" aria-controls="dt_gal" class="span7 emptySelect">
								<option value="" >请选择..</option>
								<#if classList ?? >
									<#list classList as c>
										<#if classMonitor ?? && classMonitor.id == c.id >
											<option value="${c.id}" selected >${c.className}</option>
										<#else>
											<option value="${c.id}">${c.className}</option>
										</#if>
									</#list>
								</#if>
							</select>
						</div>
					</div>
					</#if>
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">班号</span>
							<input id="code" name="code" class="span7" value="${classMonitor.code!""?html}" />
					    </div>
					    <div class="span4">
							<span class="formTitle">年级</span>
							 <select size="1" id="grade" name="grade" aria-controls="dt_gal" class="span7">
								<option value="">请选择..</option>
								<#if gradeList??>
							      <#list gradeList as g>
									<#if classMonitor ?? && classMonitor.grade ?? && classMonitor.grade == g>
											<option  value="${g}" selected="selected">${g}</option>	
										<#else>
											<option value="${g}" >${g}</option>
										</#if>
									</#list>
								</#if>
							</select>	
					    </div>
			             <div class="span4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			              <button class="btn btn-info"  type="submit">查 询</button>
			              <button class="btn btn-info" type="button" onclick="comp.clearForm('classQuery');" >清 空</button>
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
											<#if user_key.optMap['add']??>
												 <button class="btn btn-info" type="button"  onclick="timeConfig.setTime('STUDENT_INFO_UPDATE_TIME');">时间设置</button>
											</#if>
										</#if>
										<span id="time" style="color:red">
										<#if timeConfigModel ?? > 
										<b>[${(timeConfigModel.beginDate!"")?string("yyyy-MM-dd")}至  ${(timeConfigModel.endDate!"")?string("yyyy-MM-dd")}] </b>
										</#if>
										</span>
										</div>
				                    </div>
				                </div>
				            </div>						
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
							<thead>
								<tr>
									<th width="6%">序号</th>
									<th width="20%">班级名称</th>
									<th width="12%">班号</th>
									<th width="8%">年级</th>
									<th width="20%">专业</th>
									<th width="15%">学院单位</th>
									<th width="10%">审核班长</th>
									<th width="8%">操作</th>
								</tr>
							</thead>
							<tbody>
							<#if page??>	
								<#list page.result as p>
								<tr>
									<td>${p_index+1}</td>
									<td class="autocut">${p.className!""?html}</td>
									<td class="autocut">${p.code!""?html}</td>
									<td class="autocut">${p.grade!""?html}</td>
									<td class="autocut"><#if p.major ?? >${p.major.majorName!""?html}</#if></td>
									<td class="autocut"><#if p.major ?? && p.major.collage ??  >${p.major.collage.name!""?html}</#if></td>
									<td class="autocut" id=${p.id}_td><#if p.student ?? >${p.student.name!""?html}</#if></td>
									<td class="autocut">
										<input type="hidden" name="" <#if p.student ?? >value="${p.student.id!""?html}"</#if> id="${p.id!''}_studentId"/>
										<#if user_key.optMap??>
											<#if user_key.optMap['update']??>
											<a href="javascript:void(0)" onclick="selectStudentByClassRadio(${p.id!""?html})" class="sepV_a" title="修改审核班长"><i class="icon-user"></i></a>
									        </#if>
									    </#if>
									</td>
								</tr>
								</#list>
							 </#if> 
							</tbody>
						</table>
						 <#assign pageTagformId="classQuery"/>
						 <#include "/page.ftl">
					</div>
				</div>
			</div> 
		<#else>
		     <#include "/common/common/commonMessage.ftl">
		</#if>
		</div> 
	</div>
</div>
<!--设置页面引入-->
<#include "/common/config/configPopEditDiv.ftl">
<#-- 学生按照班级选择单选组件的引入-->
<#include "/comp/student/queryStudentByClassRadioModal.ftl"> 
</body>
</html>