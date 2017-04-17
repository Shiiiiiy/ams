<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <script src="${rc.contextPath}/js/jquery.form.js"></script> 
		<script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
		<script>
			jQuery("#queryCollegeJob").click(function() {
				$("#collegeJobSet").attr("method", "post");
				$("#collegeJobSet").attr("action", "${rc.contextPath}/teacher/collegeManage/opt-query/collegeStuJobTeamList.do");
				$("#collegeJobSet").submit();
			});
		</script>
    </head>
    <body>
		<div id="contentwrapper">
		    <div class="main_content">
				<div class="row-fluid">
					<form id="collegeJobSet" action="${rc.contextPath}/teacher/collegeManage/opt-query/collegeStuJobTeamList.do" method="post">
						<div class="span12">
							<div class="row-fluid">
								<div class="span4">
									<span class="formTitle">学院</span>
									<select id="college" name="college.id" aria-controls="dt_gal" class="span7" >
										<option value="">请选择</option>
										<#if collegeList??>
										<#list collegeList as college>
											<#if setCollegeTeacher?? && setCollegeTeacher.college?? && setCollegeTeacher.college.id == college.id>
												<option value="${college.id}" selected="selected">${college.name}</option>
											<#else>
												<option value="${college.id}">${college.name}</option>
											</#if>
										</#list>
										</#if>
									</select>
								</div>
								<div class="span4">
								  <button class="btn btn-info" id="queryCollegeJob">查 询</button>
								  <button class="btn btn-info" type="button" onclick="comp.clearForm('collegeJobSet');">清 空</button>
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
											<th width="8%">序号</th>
											<th width="35%">学院</th>
											<th width="20%">辅导员（测评）</th>
											<th width="20%">辅导员（资助）</th>
											<th width="20%">辅导员（就业）</th>
										</tr>
									</thead>
									<tbody>
										<#if page??>
											<#list page.result as p>
												<tr>
													<td class="autocut">${p_index+1}</td>
													<td class="autocut">${(p.college.name)!""}</td>
													<td class="autocut">
														<span id="${p.id}evaCounsellor"><#if p.evaCounsellor??><a href="#" onClick="viewStuJob('${(p.evaCounsellor.id)!""}', '${(p.evaCounsellor.name)!""}');">${(p.evaCounsellor.name)!""}</a></#if></span>
														<#if user_key.optMap??>
															<#if user_key.optMap['add']??>
																<a href="#" onClick="setCollegeStujob('0', '${p.college.id}', '${p.id}evaCounsellor', '${(p.college.name)!""}');" class="sepV_a" title="设置"><i class="icon-user"></i></a>
															</#if>
														</#if>
													</td>
													<td class="autocut">
														<span id="${p.id}subCounsellor"><#if p.subCounsellor??><a href="#" onClick="viewStuJob('${(p.subCounsellor.id)!""}', '${(p.subCounsellor.name)!""}');">${(p.subCounsellor.name)!""}</a></#if></span>
														<#if user_key.optMap??>
															<#if user_key.optMap['add']??>
																<a href="#" onClick="setCollegeStujob('1', '${p.college.id}', '${p.id}subCounsellor', '${(p.college.name)!""}');" class="sepV_a" title="设置"><i class="icon-user"></i></a>
															</#if>
														</#if>
													</td>
													<td class="autocut">
														<span id="${p.id}careerCounsellor"><#if p.careerCounsellor??><a href="#" onClick="viewStuJob('${(p.careerCounsellor.id)!""}', '${(p.careerCounsellor.name)!""}');">${(p.careerCounsellor.name)!""}</a></#if></span>
														<#if user_key.optMap??>
															<#if user_key.optMap['add']??>
																<a href="#" onClick="setCollegeStujob('2', '${p.college.id}', '${p.id}careerCounsellor', '${(p.college.name)!""}');" class="sepV_a" title="设置"><i class="icon-user"></i></a>
															</#if>
														</#if>
													</td>
												</tr>
											</#list> 
										</#if>
									</tbody>
								</table>
								<#assign pageTagformId="collegeJobSet"/>
								<#include "/page.ftl">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	<#--教工单选-->
	<#include "/comp/teacher/queryCollegeTeacherAllRadioModal.ftl"/>
	<#include "/teacher/manage/stuJobTeamSetViewConfig.ftl"/>
	<script>
	
		var C_teacherType = "";
		var C_id = "";
		var C_objid = "";
		var C_name = "";
		// 选教职工
		function setCollegeStujob(teacherType, collegeId, objId, collegeName) {
			C_teacherType = teacherType;
			C_id = collegeId;
			C_objid = objId;
			C_name = collegeName;
			_queryCollegeTeacherRadio("", collegeId);
		}
		//确定按钮
		function setCollegeTeacherRadioSelectValue(teacherInfo) {
			if(teacherInfo==undefined || teacherInfo==null) {
				comp.message("未选中教工，请重新选择", "error");
				return;
			}
			if(headMasterSet(teacherInfo.id, C_teacherType))
				$("#"+C_objid).text(teacherInfo.name);
		}
		function headMasterSet(teacherId, teacherType) {
			var flag = true;
			$.ajax({
				async:false,
				cache: false,
				type: "POST",
				url:'${rc.contextPath}/teacher/collegeManage/nsm/stuJobTeamSetting.do',
				data:{collegeId:C_id, teacherId:teacherId, teacherType:teacherType },
			    contentType:"application/x-www-form-urlencoded;charset=utf-8", 
			    error:function() {
			    	flag = false;
			    	comp.message("请求发送失败，请联系管理员", "error");
			    },
				success: function(data) {
					if(teacherType=='0' && data=="success") {
						comp.message(C_name + "测评辅导员设置成功", "message");
						C_name = "";
					}else if(teacherType=='1' && data=="success") {
						comp.message(C_name + "资助辅导员设置成功", "message");
						C_name = "";
					}else if(teacherType=='2' && data=="success") {
						comp.message(C_name + "就业辅导员设置成功", "message");
						C_name = "";
					}else {
						flag = false;
						comp.message("数据错误，请联系管理员", "error");
					}
			    }
		     }); 
		     return flag;
		}
	</script>
	</body>
</html>