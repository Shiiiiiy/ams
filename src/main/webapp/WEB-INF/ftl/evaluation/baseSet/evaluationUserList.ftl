<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="${rc.contextPath}/js/common/setTimeConfig.js"></script>
    <script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
    <script src="${rc.contextPath}/js/jquery.form.js"></script> 
</head>
<body>
<div id="contentwrapper">
    <div class="main_content">   
    	   <div class="row-fluid">	
    		<form  id="classQuery"  action="${rc.contextPath}/evaluation/userSet/opt-query/queryEvaluationUser.do" method="post">
				<div class="span12">			
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">&nbsp;&nbsp;&nbsp;学院</span>
							<div class="span8">
								<select size="1" id="collageId" name="collageId" aria-controls="dt_gal" class="span10" onchange="cascade.changeCollage('collageId','majorId','eClassId');" >
									<option value="">请选择..</option>
										<#list collageList as d>
											<#if evaluationUser?? && evaluationUser.collageId ?? && evaluationUser.collageId == d.id >
												<option  value="${d.id}" selected="selected">${d.name?html}</option>
											<#else>
												<option value="${d.id}" >${d.name?html}</option>
											</#if>
										</#list>
								</select>
							</div>
						 </div>
						 
						 <div class="span4">
							<span class="formTitle">专业</span>
							<div class="span8">
								<select size="1" id="majorId" name="majorId" aria-controls="dt_gal" class="span10 emptySelect"  onchange="cascade.changeMajor('majorId','eClassId');">
									<option value="" >请选择..</option>
									<#if majorList ?? >
										<#list majorList as m>
											<#if evaluationUser?? && evaluationUser.majorId ?? && evaluationUser.majorId== m.id >
												<option value="${m.id}" selected >${m.majorName}</option>
											<#else>
												<option value="${m.id}">${m.majorName}</option>
											</#if>
										</#list>
									</#if>
								</select>
							</div>
						</div>
						  
						<div class="span4">
							<span class="formTitle">班级</span>
							<div class="span8">
								<select size="1" id="eClassId" name="eClassId" aria-controls="dt_gal" class="span10 emptySelect">
									<option value="" >请选择..</option>
									<#if classList ?? >
										<#list classList as c>
											<#if evaluationUser?? && evaluationUser.eClassId ?? && evaluationUser.eClassId == c.id >
												<option value="${c.id}" selected >${c.className}</option>
											<#else>
												<option value="${c.id}">${c.className}</option>
											</#if>
										</#list>
									</#if>
								</select>
							</div>
						</div>
					</div>
					
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">测评员</span>
							<div class="span8">
								<input id="userName" name="userName" class="span10"  value="${evaluationUser.userName!""}" />
							</div>
						</div>
						
						<div class="span4" style="padding-left:40px">
							<button class="btn btn-info"  type="submit">查 询</button>
		              		<button class="btn btn-info" type="button" onclick="comp.clearForm('classQuery');">清 空</button>
						</div>
						
					</div>
				</div>
			</form>
    
				<div class="row-fluid">
					<div class="span12">
						<h5 class="heading"></h5>
						<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
				        
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
							<thead>
								<tr>
									<th width="6%">序号</th>
									<th width="15%">学院</th>
									<th width="20%">专业</th>
									<th width="30%">班级</th>
									<th width="10%">年级</th>
									<th width="10%">测评员</th>
									<th width="6%">操作</th>
								</tr>
							</thead>
							<tbody>
							<#if page??>	
								<#list page.result as p>
								<tr>
									<td>${p_index+1}</td>
									<td class="autocut"><#if p[0].major ?? && p[0].major.collage ??  >${p[0].major.collage.name!""?html}</#if></td>
									<td class="autocut"><#if p[0].major ?? >${p[0].major.majorName!""?html}</#if></td>
									<td class="autocut">${p[0].className!""?html}</td>
									<td class="autocut">${p[0].grade!""?html}</td>
									<td class="autocut" id=${p[0].id!""?html}_td><#if p[1] ?? && p[1].assist ?? ><a href="javascript:void(0);" onclick="viewUser('${p[1].assist.id}')">${p[1].assist.name!""?html}</a></#if></td>
									<td class="autocut">
										<#if user_key.optMap['update']??>
										   <a href="#" onclick="selectStudentRadio(${p[0].id!""?html}, <#if p[1] ?? && p[1].assist ?? >${p[1].assist.id!""?html}<#else>null</#if>,<#if p[0].major ?? && p[0].major.collage ??  >${p[0].major.collage.id!""?html}</#if>)" class="sepV_a" title="设置测评员"><i class="icon-user"></i></a>
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
		</div> 
	</div>
</div>
<div class="modal hide fade" id="viewuser">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3 id="title1">学生信息</h3>
	</div>
	<div class="modal-body" id="stmp_user">
		
	</div>
	<div class="modal-footer">
		<a href="#" class="btn" data-dismiss="modal">关闭</a>
	</div>
</div>
<input name="classId" id="classId" type="hidden" value=""/>

<#-- 学生选择单选组件的引入 -->
<#include "/comp/student/queryStudentAllRadioModal.ftl">
<script>
	// 单选学生选择 
	function selectStudentRadio(classId, studentId, collegeId){
		$('#classId').val(classId);
		_queryStudentRadioAll(studentId, collegeId);
	}
	function setStudentRadioSelectValue(student){
		 $.ajax({
			url:'${rc.contextPath}/evaluation/userSet/opt-edit/updateEvaluationUser.do',
			async:false,
			cache: false,
			type: "POST",
			data:{classId : $('#classId').val(),studentId : student.id },
			success: function(data){
			  $("#"+$('#classId').val()+"_td").html("<a href='###' onclick='viewUser("+student.id+")'>"+student.name+"</a>");
		 	 comp.message(student.className+"的测评员成功设置为"+student.name+"!","info");
		    }
		});
	}
	
	function viewUser(id){
		comp.showModal("viewuser","800px","-250px 0 0 -400px");
		$("#stmp_user").load("${rc.contextPath}/student/infoview/nsm/studentView.do",{"id":id},function(){});
	}
</script>
</body>
</html>