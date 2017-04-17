<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <script src="${rc.contextPath}/js/jquery.form.js"></script> 
		<script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
		<script>
		//查询按钮
		function queryClassStuJobTeam() {
			$("#setClassTeacher").attr("action", "${rc.contextPath}/teacher/classManage/opt-query/classStuJobTeamList.do");
			$("#setClassTeacher").attr("method", "post");
			$("#setClassTeacher").submit();
		}
		function clearCascadeForm(formId) {
			$(':input','#'+formId).not(':button, :submit, :reset, :hidden, .notClear').val('').removeAttr('checked').removeAttr('selected');
			if($("#klass option").length>1) {
				var option = $("#klass").get(0).options;
				option.length = 0;
				var nullOption = new Option("请选择", "", false, false);
				option.add(nullOption);
			}
			if(!$("#college").hasClass("notClear") && $("#major option").length>1) {
				var option = $("#major").get(0).options;
				option.length = 0;
				var nullOption = new Option("请选择", "", false, false);
				option.add(nullOption);
			}
		}
		
		function viewUser(id){
			comp.showModal("viewuser","800px","-250px 0 0 -400px");
			$("#stmp_user").load("${rc.contextPath}/student/infoview/nsm/studentView.do",{"id":id},function(){});
		}
		
		</script>
    </head>
    <body>
		<div id="contentwrapper">
		    <div class="main_content">
				<div class="row-fluid">
					<form id="setClassTeacher" method="post" action="${rc.contextPath}/teacher/classManage/opt-query/classStuJobTeamList.do">
						<div class="span12">
							<div class="row-fluid">
								<div class="span4">
									<span class="formTitle">学院</span>
									<select id="college" name="college.id" aria-controls="dt_gal" class="span7 <#if flag?? && flag>notClear</#if>" <#if flag?? && flag>disabled</#if> onchange="cascade.changeCollage('college','major', 'klass');">
										<option value="">请选择</option>
										<#if collegeList??>
										<#list collegeList as college>
											<#if (setClassTeacher.college)?? && setClassTeacher.college.id == college.id>
												<option value="${college.id}" selected="selected">${college.name}</option>
											<#else>
												<option value="${college.id}">${college.name}</option>
											</#if>
										</#list>
										</#if>
									</select>
								</div>
							
								<div class="span4">
									<span class="formTitle">专业</span>
									<select id="major" name="major.id" aria-controls="dt_gal" class="span7" onchange="cascade.changeMajor('major','klass');">
										<option value="">请选择</option>
										<#if majorList??>
										<#list majorList as major>
											<#if setClassTeacher.major?? && setClassTeacher.major.id == major.id>
												<option value="${major.id}" selected="selected">${major.majorName}</option>
											<#else>
												<option value="${major.id}">${major.majorName}</option>
											</#if>
										</#list>
										</#if>
									</select>
								</div>
							
								<div class="span4">
									<span class="formTitle">班级</span>
									<select id="klass" name="klass.id" size="1" aria-controls="dt_gal" class="span7">
										<option value="">请选择</option>
										<#if klassList??>
										<#list klassList as klass>
											<#if setClassTeacher.klass?? && setClassTeacher.klass.id == klass.id>
												<option value="${klass.id}" selected="selected">${klass.className}</option>
											<#else>
												<option value="${klass.id}">${klass.className}</option>
											</#if>
										</#list>
										</#if>
									</select>
								</div>
							</div>
							
							<div class="row-fluid">
								<div class="span4">
									<span class="formTitle">年级</span>
									<select id="" name="grade" size="1" aria-controls="dt_gal" class="span7">
										<option value="">请选择</option>
										<#if gradeList??>
										<#list gradeList as g>
											<#if setClassTeacher.grade?? && setClassTeacher.grade == g>
												<option value="${g}" selected="selected">${g}</option>
											<#else>
												<option value="${g}">${g}</option>
											</#if>
										</#list>
										</#if>
									</select>
								</div>
								<div class="span4">
									<span class="formTitle">姓名</span>
									<input name="roleName" class="span7" maxlength="10" value="${roleName!""?html}" />
								</div>
								<div class="span4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<button class="btn btn-info" type="button" onClick="queryClassStuJobTeam();">查 询</button>
							 		<button class="btn btn-info" type="button" onclick="clearCascadeForm('setClassTeacher');">清 空</button>
								</div>
							</div>
							<#--
							<div class="btnCenter">
							  <button class="btn btn-info" type="button" onClick="queryClassStuJobTeam();">查 询</button>
							  <button class="btn btn-info" type="button" onclick="comp.clearForm('setClassTeacher');">清 空</button>
							</div>
							-->
						</div>
						<!--用于用户导出 -->
						<input id="pageTotalCount" name="pageTotalCount" type="hidden"  value="${page.totalCount!""}"/>
					</form>
					<div class="row-fluid">
						<div class="span12">
							<h5 class="heading"></h5>
							<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
								<div class="row">
								<div class="dt_actions">
									<div class="row-fluid">
										<div class="input-append">
											<#--<span class="expsingle">单页导出条数:</span>-->
											<input id="exportSize" type="hidden" class="span3" title="单页导出条数" value="${pageTotalCount!"1000"}" name="exportSize" />
											<button class="btn btn-info" onclick="exportInfo()" type="button">导 出</button>
										</div>
									</div>
								</div>
								</div>
								<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
									<thead>
										<tr>
											<th width="6%">序号</th>
											<th width="15%">学院</th>
											<th width="17%">专业</th>
											<th width="16%">班级</th>
											<th width="10%">年级</th>
											<th width="14%">班主任</th>
											<th width="14%">辅导员（教学）</th>
											<th width="14%">班长</th>
										</tr>
									</thead>
									<tbody>
										<#if page??>
											<#list page.result as p>
												<tr>
													<td class="autocut">${p_index+1}</td>
													<td class="autocut">${(p.college.name)!""}</td>
													<td class="autocut">${(p.major.majorName)!""}</td>
													<td class="autocut">${(p.klass.className)!""}</td>
													<td class="autocut">${(p.klass.grade)!""}</td>
													<td class="autocut" >
														<span id='${p.id}headMaster' ><#if p.headMaster??><a href="#" onClick="viewStuJob('${(p.headMaster.id)!""}', '${(p.headMaster.name)!""}');">${(p.headMaster.name)!""}</a></#if></span>
														<#if user_key.optMap??>
															<#if user_key.optMap['add']??>
																<a href="#" onClick="setStujob('1', '${p.klass.id}', '${p.id}headMaster', '${(p.college.id)!""}', '${(p.klass.className)!""}');" class="sepV_a" title="设置"><i class="icon-user"></i></a>
															</#if>
														</#if>
													</td>
													<td class="autocut" >
														<span id='${p.id}teacherCounsellor'><#if p.teacherCounsellor??><a href="#" onClick="viewStuJob('${(p.teacherCounsellor.id)!""}', '${(p.teacherCounsellor.name)!""}');">${(p.teacherCounsellor.name)!""}</a></#if></span>
														<#if user_key.optMap??>
															<#if user_key.optMap['add']??>
																<a href="#" onClick="setStujob('0', '${p.klass.id}', '${p.id}teacherCounsellor', '${(p.college.id)!""}', '${(p.klass.className)!""}');" class="sepV_a" title="设置"><i class="icon-user"></i></a>
															</#if>
														</#if>	
													</td>
													<td class="autocut">
														<span id='${p.id}monitor'><#if p.monitor??><a href="javascript:void(0);" onclick="viewUser('${p.monitor.id}')">${p.monitor.name!""}</a></#if></span>
														<#if user_key.optMap??>
															<#if user_key.optMap['add']??>
																<a href="#" onClick="selectMonitor('${p.id}', '${(p.klass.className)!""}');" class="sepV_a" title="设置"><i class="icon-user"></i></a>
															</#if>
														</#if>
													</td>
												</tr>
											</#list> 
										</#if>
									</tbody>
								</table>
								<#assign pageTagformId="setClassTeacher"/>
								<#include "/page.ftl">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="modal hide fade" id="exportdemo">
			<div class="modal-header">
				<button class="close" data-dismiss="modal">×</button>
				<h3 id="title1">导出班级辅导员列表</h3>
			</div>
			<div class="modal-body" id="export_stujob">
				
			</div>
			<div class="modal-footer">
				<a href="#" class="btn" data-dismiss="modal">关闭</a>
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
		
<#include "/comp/teacher/queryTeacherAllRadioModal.ftl"/>
<#include "/comp/student/queryStudentByClassRadioModal.ftl"/>
<#include "/teacher/manage/stuJobTeamSetViewConfig.ftl"/>
<script>

	var C_teacherType = "";
	var C_id = "";
	var C_objid = "";
	C_name = "";
	// 选教职工弹窗
	function setStujob(teacherType, klassId, objId, collegeId, klassName) {
		C_teacherType = teacherType;
		C_id = klassId;
		C_objid = objId;
		C_name = klassName;
		_queryTeacherRadioAll();
	}
	//确定按钮
	function _setTeacherRadioSelectValue(teacher) {
		if(teacher==undefined || teacher==null) {
			comp.message("未选中教工，请重新选择", "error");
			return;
		}
		if(headMasterSet(teacher.id, C_teacherType))
			$("#"+C_objid).text(teacher.name);
	}
	
	function headMasterSet(teacherId, teacherType) {
		var flag = true;
		$.ajax({
			async:false,
			cache: false,
			type: "POST",
			url:'${rc.contextPath}/teacher/classManage/nsm/stuJobTeamSetting.do',
			data:{classId:C_id, teacherId:teacherId, teacherType:teacherType },
		    contentType:"application/x-www-form-urlencoded;charset=utf-8", 
		    error: function() {
		    	flag = false;
		    	comp.message("请求发送失败，请联系管理员", "error");
		    },
			success: function(data){
				if(teacherType=='0' && data=="success") {
					comp.message(C_name + "教学辅导员设置成功", "message");
					C_name = "";
				}else if(teacherType=='1' && data=="success") {
					comp.message(C_name + "班主任设置成功", "message");
					C_name = "";
				}else {
					flag = false;
					comp.message("数据错误，请联系管理员", "error");
				}
		    }
	     }); 
	     return flag;
	}
	//设置班长 学生选择控件弹出框
	function selectMonitor(klassId, klassName) {
		C_id = klassId;
		C_name = klassName;
		_initRadioClassStudentValues(klassId);
		_queryStudentByClassRadioSubmit();		
		comp.showModal("_selectStudentClassRadioModal");
	}
	//学生控件确定按钮监听
	function setClassStudentSelectValue(c) {
		if(c==undefined || c==null) {
			comp.message("未选中学生，请重新选择", "error");
			return;
		}
		if(saveMonitor(c.id))
		$("#"+C_id+"monitor").html(c.name);
	}
	//保存班长信息
	function saveMonitor(stuId) {
		var flag = true;
		$.ajax({
			async:false,
			cache: false,
			type: "POST",
			url:'${rc.contextPath}/teacher/classManage/nsm/monitorSetting.do',
			data:{classId:C_id, stuId:stuId },
		    contentType:"application/x-www-form-urlencoded;charset=utf-8", 
		    error: function() {
		    	flag = false;
		   	 	comp.message("请求错误，请联系管理员", "error");
		    },
			success: function(data){
				if(data=='success') {
					comp.message(C_name+" 班长设置成功", "message");
					C_name = "";
				}else{
					flag = false;
					comp.message("存储错误，请联系管理员", "error");
				}
		    }
	     }); 
		return flag;
	}
	//点击导出按钮触发
	function exportInfo() {
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
			comp.message("请输入不大于1000的正整数","error");
		}else{
			comp.showModal("exportdemo","500px","-250px 0 0 -250px");
			$("#export_stujob").load("${rc.contextPath}/teacher/classManage/nsm/exportView.do?pageTotalCount="+pageTotalCount+"&exportSize="+exportSize);
		}
	}
	//点击导出按钮弹出的对话框中的链接，进行导出操作
	function exportStuJob(exportSize,exportPage){
		$("#setClassTeacher").attr("action", "${rc.contextPath}/teacher/classManage/opt-export/exportStuJob.do");
		var fo=$("#setClassTeacher");
		if($("#stuJob_exportPage").length==0){
			fo.append($("<input>",{
				id:'stuJob_exportSize',
				type:'hidden',
				name:'stuJob_exportSize',
				val:exportSize
			}));
			fo.append($("<input>",{
				id:'stuJob_exportPage',
				type:'hidden',
				name:'stuJob_exportPage',
				val:exportPage
			}));
		}else{
			$("#stuJob_exportSize").val(exportSize);
			$("#stuJob_exportPage").val(exportPage);
		}
		fo.submit();
		$("#setClassTeacher").attr("action", "${rc.contextPath}/teacher/classManage/opt-query/classStuJobTeamList.do");
	}
	(function(){
		$("#setClassTeacher").compValidate({
			rules:{
				 roleName: {maxlength:10}
			},
			messages:{
				roleName: {maxlength:'姓名长度不能超过10'}
			}
		});
	})();
</script>
	</body>
</html>