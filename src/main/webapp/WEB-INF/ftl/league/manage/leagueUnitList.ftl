<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <script src="${rc.contextPath}/js/jquery.form.js"></script> 
         <script type="text/javascript" src="${rc.contextPath}/js/common/cascadecommon.js"></script>
    </head>
    <body>
<div id="contentwrapper">
   	<div class="main_content">   
    	<div class="row-fluid">	
    		<form  id="leagueUnitQuery"  action="${rc.contextPath}/league/leagueManage/opt-query/pageQueryLeagueUnit.do" method="post">
				<div class="span12">			
					<div class="row-fluid"> 
						<div class="span4">
							<span class="formTitle">学院</span>
							<select size="1" id="college" <#if isSchoolLeague==false>disabled<#else> name="college.id"</#if> aria-controls="dt_gal" class="span6 notClear" onChange="cascade.changeCollage('college', 'majorId');">
								<option value="" >请选择</option>
								<#if collegeList??>
									<#list collegeList as c>
										<#if unit?? && unit.college?? && unit.college.id??&& c.id==unit.college.id>
											<option value="${c.id}" selected="selected">${c.name?html}</option>
										<#else>
											<option value="${c.id}">${c.name?html}</option>
						
										</#if>
									</#list>
								</#if>
							</select>
							<#if isSchoolLeague==false>
							<input type="hidden" name="college.id" value="${teacherOrgId!""}" />
							</#if> 
						</div>
						<div class="span4">
							<span class="formTitle">专业</span>
							<select size="1" id="majorId" name="major.id" aria-controls="dt_gal" class="span6" onChange="cascade.changeMajor('majorId', 'classId');">
								<option value="" >请选择</option>
								<#if majorList ?? >
									<#list majorList as m>
										<#if unit?? && unit.major?? &&  unit.major.id == m.id >
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
							<select size="1" id="classId" name="classId.id" aria-controls="dt_gal" class="span6 emptySelect" >
								<option value="" >请选择</option>
								<#if classList ?? >
									<#list classList as c>
										<#if unit?? && unit.classId?? && unit.classId.id == c.id >
											<option value="${c.id}" selected >${c.className}</option>
										<#else>
											<option value="${c.id}">${c.className}</option>
										</#if>
									</#list>
								</#if>
							</select>
						</div>
					</div>
				
		            <div class="btnCenter">
		              <input type="button" class="btn btn-info"  onclick="selectStudentInfo();" value="查 询"/>
		              <input type="button" class="btn btn-info"  onclick="comp.clearForm('leagueUnitQuery')" value="清 空"/>
		            </div>
				</div>
			</form>
			<div class="row-fluid">
				<div class="span12">
					<h5 class="heading"></h5>
					<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl" >
							<thead>
								<tr>
									<th width="5%">序号</th>
									<th width="11%">学院</th>
									<th width="14%">专业</th>
									<th width="10%">班级</th>
									<th width="10%">班主任</th>
									<th width="8%">团支书</th>
									<th width="8%">班级人数</th>
									<th width="8%">团员人数</th>
									<th width="8%">党员人数</th>
									<th width="12%">预备党员人数</th>
									<th width="7%">操作</th>
								</tr>
							</thead>
							<tbody>
								<#if page??>	
									<#list page.result as p>
										<tr>
											<td class="autocut">${p_index+1}</td>
											<td class="autocut">${(p.college.name)!""}</td>
											<td class="autocut">${(p.major.majorName)!""}</td>
											<td class="autocut">${(p.classId.className)!""}</td>
											<td class="autocut">${(p.headmaster.name)!""}</td>
											<td class="autocut">${(p.secretary.name)!""}</td>
											<td class="autocut">${(p.stunums)!""}</td>
											<td class="autocut">${(p.membernums)!""}</td>
											<td class="autocut">${(p.partyNums)!""}</td>
											<td class="autocut">${(p.probationaryNums)!""}</td>
											<td>
												 <#if user_key.optMap??>
					              					<#if user_key.optMap['rogrole']??>
					              						<#if  isHeadmaster?? && isHeadmaster=="is">
						              						<#if headClassList??>
						              							<#list headClassList as h>
						              								<#if h.code?? &&  p.classId?? &&p.classId.id?? && h.code==p.classId.id>
						              									<div class="input-append">
									              									<a id="course-lecture-select"  style="margin-left: -4px;margin-top: -10px;" href="javascript:void(0);" onclick="selectStudentByClassRadio('${(p.classId.code)!""}','${(p.secretary.stuNumber)!""}');" title="指定团支书"><i class="icon-user"></i></a>
																		</div>
						              								</#if>
						              							</#list>
						              						</#if>
					              						</#if>
													</#if>
													<#if user_key.optMap['update']??>
					              						<div class="input-append">
																<#if p.classId?? &&p.classId.id??>
																	<a href="${rc.contextPath}/league/leagueManage/opt-query/pageQueryLeagueMember.do?classIdText=${p.classId.id}" class="sepV_a" title="班级团员维护"><i class="icon-edit"></i></a>
																</#if>
					              						</div>
				              						</#if>
												</#if>	
											</td>
										</tr>
									</#list>
								 </#if> 
							</tbody>
						</table>
						 <#assign pageTagformId="leagueUnitQuery"/>
						  <!--用于用户导出 -->
						<input id="pageTotalCount" name="pageTotalCount" type="hidden"  value="${page.totalCount}"/>
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
		<h3 id="title1">导出团员花名册</h3>
	</div>
	<div class="modal-body" id="export_leagueMember">
		
	</div>
	<div class="modal-footer">
		<a href="#" class="btn" data-dismiss="modal">关闭</a>
	</div>
</div>
<#-- 学生按照班级选择单选组件的引入-->
<#include "/comp/student/queryStudentByClassRadioModal.ftl"> 
<#-- 脚本开始 -->
<script>
	
	//按照班级过滤的选择单选
	function selectStudentByClassRadio(classId,stuNumber)
	{
		_queryStudentRadioByClass(classId,stuNumber);
	}
	function setClassStudentSelectValue(student)
	{
		window.location.href="${rc.contextPath}/league/leagueManage/opt-rogrole/appointSecretary.do?secretaryStuId="+student.id+"&classIdText="+student.classId;
	}
	//查询
	function selectStudentInfo(){
	    $("#leagueUnitQuery").attr("action","${rc.contextPath}/league/leagueManage/opt-query/pageQueryLeagueUnit.do");
		$("#leagueUnitQuery").submit();
	}
	
	//全选复选框
	jQuery("#_totalSelect").click(function(){
	
		if($("#_totalSelect").attr("checked")) {
			$("input[name='infoCheck']").attr("checked",true);
		}else {
	    	$("input[name='infoCheck']").attr("checked",false);
	    }	
	});
	
	jQuery("input[name='infoCheck']").click(function() {
		$("#_totalSelect").attr("checked",false);
	});
	
	function passStatus(stas){
		 $("#flags").val(stas);
		 if(stas=="pass"){
		 
		 }
	}
<!--导出-->
	function exportLeagueMember(){
			var pageTotalCount= $("#pageTotalCount").val();
			var exportSize= $("#exportSize").val();
			var patrn=/^[0-9]{1,20}$/; 
			if(exportSize==""){
				comp.message("请输入大于0的正整数","error");
			}else if(!patrn.exec(exportSize)){
				comp.message("请输入大于0的正整数","error");
			}else if(exportSize<1){
				comp.message("请输入大于0的正整数","error");
			}else if(exportSize>10000){
				comp.message("请输入小于10000的正整数","error");
			}else{
				comp.showModal("exportdemo","500px","-250px 0 0 -250px");
				$("#export_leagueMember").load("${rc.contextPath}/league/leagueManage/opt-query/nsm/exportLeagueMemberList.do?pageTotalCount="+pageTotalCount+"&exportSize="+exportSize);
			}
		}
		
		function exportDate(exportSize,exportPage){
		
			$("#leagueMemberQuery").attr("action","${rc.contextPath}/league/leagueManage/opt-query/exportLeagueMember.do");
			var fo=$("#leagueMemberQuery");
			if($("#leagueMember_exportPage").length==0){
				fo.append($("<input>",{
					id:'leagueMember_exportSize',
					type:'hidden',
					name:'leagueMember_exportSize',
					val:exportSize
				}));
				fo.append($("<input>",{
					id:'leagueMember_exportPage',
					type:'hidden',
					name:'leagueMember_exportPage',
					val:exportPage
				}));
			}else{
				$("#leagueMember_exportSize").val(exportSize);
				$("#leagueMember_exportPage").val(exportPage);
			}
			fo.submit();
		}
	
	
</script>
</body>
</html>