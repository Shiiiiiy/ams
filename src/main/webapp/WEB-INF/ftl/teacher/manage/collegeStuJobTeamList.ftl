<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <script src="${rc.contextPath}/js/jquery.form.js"></script> 
    </head>
    <body>
		<div id="contentwrapper">
		    <div class="main_content">
			   	 	<div class="row-fluid">
			    		<h3 class="heading">学院辅导员设置</h3>
			    	</div>
		    	<div class="row-fluid">
						<div class="span12">
							<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
								<thead>
									<tr>
										<th width="8%">序号</th>
										<th width="30%">学院</th>
										<#if teacherTypeList??>
											<#list teacherTypeList as d>
												<th width="20%">${d.name}</th>
											</#list>
										</#if>
									</tr>
								</thead>
								<tbody>
									<#if collegeList??>
										<#list collegeList as p>
											<tr>
												<td class="autocut">${p_index+1}</td>
												<td class="autocut">${(p.name)!""}</td>
												<#if teacherTypeList??>
													<#list teacherTypeList as d>
														<td class="autocut">
															<#assign weekKey="${p.id!''}_${d.id!''}"/>
															<#if resultMap[weekKey] ??>
																<#list resultMap[weekKey]  as t>
																	<a href="javascript:void(0);" onClick="viewStuJob('${(t.teacher.id)!""}', '${(t.teacher.name)!""}');">${ t.teacher.name }</a>
																	<#if user_key.optMap??>
																		<#if user_key.optMap['del']??>
																			[<a href="javascript:void(0);" onclick="delSet('${t.id}');"><b>删除</b></a>]<br/>
																		</#if>
																	</#if>
																</#list>
															</#if>
															<#--添加操作-->
															<#if user_key.optMap??>
																<#if user_key.optMap['add']??>
																	<a href="#" onClick="setCollegeStujob('${p.id!''}','${d.id!''}');" class="sepV_a" title="添加辅导员设置"><i class="splashy-contact_blue_add"></i></a>
																</#if>
															</#if>
														</td>
													</#list>
												</#if>
												<#--
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
												</td>-->
											</tr>
										</#list> 
									</#if>
								</tbody>
							</table>
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
		// 选教职工
		function setCollegeStujob(collegeId, teacherTypeId) {
			C_teacherType = teacherTypeId;
			C_id = collegeId;
			_queryCollegeTeacherRadio("", collegeId);
		}
		//确定按钮
		function setCollegeTeacherRadioSelectValue(teacherInfo) {
			if(teacherInfo==undefined || teacherInfo==null) {
				comp.message("未选中教工，请重新选择", "error");
				return;
			}
			headMasterSet(teacherInfo.id, C_teacherType);
		}
		function headMasterSet(teacherId, teacherType) {
			var flag = true;
			$.ajax({
				async:false,
				cache: false,
				type: "POST",
				url:'${rc.contextPath}/teacher/collegeManage/nsm/stuJobTeamSetting.do',
				data:{collegeId:C_id, teacherId:teacherId, teacherTypeId:teacherType},
			    error:function() {
			    	flag = false;
			    	comp.message("学院辅导员设置失败，请联系管理员", "error");
			    },
				success: function(data) {
					window.location.reload();
			    }
		     }); 
		}
		
		//删除设置信息
		function delSet(setId)
		{
			if(setId)
			{
				comp.confirm("删除辅导员设置信息，可能会造成系统其他业务功能无法正常使用，确认要删除吗？", function(result) {
	            	if(!result)
	            		return;
						$.post("${rc.contextPath}/teacher/collegeManage/opt-del/delJobTeamSetting.do",{id:setId},function(data) {
						 if(data=='success'){						    
							window.location.reload();
						 }
						},"text");
					});		
			}
		}
		
	</script>
	</body>
</html>