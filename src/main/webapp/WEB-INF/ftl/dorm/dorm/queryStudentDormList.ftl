<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <script type="text/javascript" src="${rc.contextPath}/js/common/dormcommon.js"></script>
        <script type="text/javascript" src="${rc.contextPath}/js/common/cascadecommon.js"></script>
    </head>
    <body>
	 <div id="contentwrapper">
   		<div class="main_content">   
    	   <div class="row-fluid">	
    		<form  id="studentDormQuery"  action="${rc.contextPath}/dorm/dormInfo/opt-query/queryStudentDormInfoList.do" method="post">
				<div class="span12">
					<div class="row-fluid"> 
					 <div class="span4">
					   <span class="formTitle">学院</span>
						<select size="1" id="college" name="student.college.id" aria-controls="dt_gal" class="span6" onChange="cascade.changeCollage('college', 'majorId','classId');">
							<option value="" >请选择..</option>
							<#if collegeList??>
								<#list collegeList as c>
									<#if studentRoom?? && studentRoom.student?? && studentRoom.student.college?? && c.id==studentRoom.student.college.id>
										<option value="${c.id}" selected="selected">${c.name?html}</option>
									<#else>
										<option value="${c.id}">${c.name?html}</option>
									</#if>
								</#list>
							</#if>
						</select>
					</div>
					<div class="span4">
					  <span class="formTitle">专业</span>
						<select size="1" id="majorId" name="student.major.id" aria-controls="dt_gal" class="span6 emptySelect" onChange="cascade.changeMajor('majorId', 'classId');">
							<option value="" >请选择..</option>
							<#if majorList ?? >
								<#list majorList as m>
									<#if studentRoom?? && studentRoom.student?? && studentRoom.student.major?? &&  studentRoom.student.major.id == m.id >
										<option value="${m.id}" selected >${m.majorName}</option>
									<#else>
										<option value="${m.id}">${m.majorName}</option>
									</#if>
								</#list>
							</#if>
						</select>
					</div>
					<div class="span4">
						<span class="formTitle" style="text-indent:1em">班级</span>
						<select size="1" id="classId" name="student.classId.id" aria-controls="dt_gal" class="span6 emptySelect" >
							<option value="" >请选择..</option>
							<#if classList ?? >
								<#list classList as c>
									<#if studentRoom?? && studentRoom.student?? && studentRoom.student.classId?? && studentRoom.student.classId.id == c.id >
										<option value="${c.id}" selected >${c.className}</option>
									<#else>
										<option value="${c.id}">${c.className}</option>
									</#if>
								</#list>
							</#if>
						</select>
					</div>
				</div>		
				<div class="row-fluid">
				  <div class="span4">
				   <span class="formTitle">公寓</span>
					<select size="1" id="dormBuilding" name="room.building.id" aria-controls="dt_gal" class="span6" onChange="cascadeDorm.getDormBuilding('dormBuilding','dormFloor','dormName');">
					  <option value="" >请选择..</option>
						<#if buildList ??>
							<#list buildList as d>
							    <#if studentRoom?? && studentRoom.room?? && studentRoom.room.building?? && studentRoom.room.building.id==d.id>
									   <option  value="${d.id}" selected="selected" />${(d.name)!""}</option>
								<#else>
									   <option value="${d.id}" >${(d.name)!""}</option>	
								</#if>
							</#list>
						</#if>
					</select>
				 </div>
				  <div class="span4">
				   <span class="formTitle">楼层</span>
					<select size="1" id="dormFloor" name="room.floorNum" aria-controls="dt_gal" class="span6 emptySelect" onChange="cascadeDorm.changeDormFloor('dormBuilding','dormFloor','dormName');">
					  <option value="" >请选择..</option>
					   <#if floorList ??>
						 <#list floorList as d>
							<#if studentRoom?? && studentRoom.room ?? && studentRoom.room.floorNum==d.name >
								   <option  value="${d.id}" selected="selected" />${(d.name)!""}</option>
							<#else>
								   <option value="${d.id}" >${(d.name)!""}</option>	
							</#if>
						 </#list>
					    </#if>
					</select>
				 </div>
				 <div class="span4">
				   <span class="formTitle">寝室号</span>
					<select size="1" id="dormName" name="room.id" aria-controls="dt_gal" class="span6 emptySelect">
					  <option value="" >请选择..</option>
					  <#if dormNoList??>
						<#list dormNoList as c>
							<#if studentRoom?? && studentRoom.room?? && studentRoom.room.id==c.id>
								<option value="${c.id}" selected="selected">${c.name?html}</option>
							<#else>
								<option value="${c.id}">${c.name?html}</option>
							</#if>
						</#list>
					 </#if>
					</select>
				   </div>
				 </div>
				 <div class="row-fluid">
					 <div class="span4">
						 <span class="formTitle">姓名</span>
					        <input id="student.name" name="student.name" class="span6" value="${((studentRoom.student.name)!'')?html}" maxlength="225"/>
						 </div>
						 <div class="span4">
							<span class="formTitle">学号</span>
							<input id="stuNumber" name="student.stuNumber" class="span6" value="${((studentRoom.student.stuNumber)!'')?html}" maxlength="225"/>
						 </div>
					<div style="span4">
					    <div style="text-indent:5.5em">
							<input type="button" class="btn btn-info"  onclick="selectStudentDormInfo();" value="查 询"/>
	                    	<input type="button" class="btn btn-info"  onclick="comp.clearForm('studentDormQuery')" value="清 空"/>
					    </div>
					</div>
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
									<th width="10%">姓名</th>
									<th width="12%">学号</th>
									<th width="8%">性别</th>
									<th width="10%">公寓</th>
									<th width="8%">楼层</th>
									<th width="9%">寝室号</th>
									<th width="9%">床位号</th>
								</tr>
							</thead>
							<tbody>
								<#if page??>	
									<#list page.result as p>
										<tr>
											<td>${p_index+1}</td>
											<td class="autocut tipTag" data="学院：${(p.student.college.name)!''}<br/>专业：${(p.student.major.majorName)!''}<br/>班级：${(p.student.classId.className)!''}<br/>"> ${(p.student.name)!""}</td>
											<td class="autocut">${(p.student.stuNumber)!""}</td>
											<td class="autocut">${(p.student.genderDic.name)!""}</td>
											<td class="autocut">${(p.building.name)!""}</td>
											<td class="autocut">${(p.room.floorNum)!""}</td>
											<td class="autocut">${(p.room.name)!""}</td>
											<td class="autocut">${(p.bedNumber)!""}</td>
										</tr>
									</#list>
								 </#if> 
							</tbody>
						</table>
						 <#assign pageTagformId="studentDormQuery"/>
						 <input id="pageTotalCount" name="pageTotalCount" type="hidden"  value="${page.totalCount}"/>
						 <#include "/page.ftl">
					</div>
				</div>
			</div> 
		</div> 
	</div>
</div>
<#-- 脚本开始 -->
<script>
	<!--显示提示框-->
	$(function(){
		$('.tipTag').poshytip({
			className: 'tip-yellowsimple',
			alignTo: 'target',
			alignX: 'right',
			alignY: 'center',
			offsetX: 5
		});
	});
	
	//查询
	function selectStudentDormInfo(){
	    $("#studentDormQuery").attr("action","${rc.contextPath}/dorm/dormInfo/opt-query/queryStudentDormInfoList.do");
		$("#studentDormQuery").submit();
	}
	
	//导入文明宿舍
	function importGoodDormList() 
	{
		window.location.href="${rc.contextPath}/dorm/dorm/goodDormImport.ftl";
	}
	
	//导入较差宿舍
	function importBadDormList() 
	{
		window.location.href="${rc.contextPath}/dorm/dorm/badDormImport.ftl";
	}
</script>
</body>
</html>