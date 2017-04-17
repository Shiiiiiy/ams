<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="${rc.contextPath}/css/starSelect.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${rc.contextPath}/js/common/cascadecommon.js"></script>
    </head>
    <body>
		<div id="contentwrapper">
   		<div class="main_content">   
    	   <div class="row-fluid">	
    		<form  id="studentAwardQuery"  action="${rc.contextPath}/sponsor/studentAwardQuery/opt-query/queryStudentAward.do" method="post">
				<div class="span12">			
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">姓名</span>
						    <input id="student.name" name="difficultStudentInfo.student.name" class="span6" <#if studentAward?? && studentAward.difficultStudentInfo?? && studentAward.difficultStudentInfo.student??> value="${((studentAward.difficultStudentInfo.student.name)!'')?html}"</#if> maxlength="225"/>
						 </div>
						 
						 <div class="span4">
							<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学号</span>
							<input id="student.stuNumber" name="difficultStudentInfo.student.stuNumber" class="span6" value="${((studentAward.difficultStudentInfo.student.stuNumber)!'')?html}" maxlength="225"/>
						 </div>
						 
						 <div class="span4">
						  <span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;奖助类型</span>
						    <select size="1" id="awardType.id" class="span6" name="awardType.id" aria-controls="dt_gal" >
					          <option value="" />请选择..</option>
							   <#if awardList??>
								<#list awardList as c>
									<#if studentAward?? && studentAward.awardType?? && c.id==studentAward.awardType.id>
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
						<span class="formTitle">学院</span>
						<select size="1" id="college" name="difficultStudentInfo.student.college.id" aria-controls="dt_gal" class="span6" onChange="cascade.changeCollage('college', 'majorId','classId');">
							<option value="" >请选择</option>
							<#if collegeList??>
								<#list collegeList as c>
									<#if studentAward?? && studentAward.difficultStudentInfo?? && studentAward.difficultStudentInfo.student?? && studentAward.difficultStudentInfo.student.college?? && c.id==studentAward.difficultStudentInfo.student.college.id>
										<option value="${c.id}" selected="selected">${c.name?html}</option>
									<#else>
										<option value="${c.id}">${c.name?html}</option>
									</#if>
								</#list>
							</#if>
						</select>
					</div>
					<div class="span4">
						<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;专业</span>
						<select size="1" id="majorId" name="difficultStudentInfo.student.major.id" aria-controls="dt_gal" class="span6 emptySelect" onChange="cascade.changeMajor('majorId','classId');">
							<option value="" >请选择</option>
							<#if majorList ?? >
								<#list majorList as m>
									<#if studentAward?? && studentAward.difficultStudentInfo?? && studentAward.difficultStudentInfo.student?? && studentAward.difficultStudentInfo.student.major?? &&  studentAward.difficultStudentInfo.student.major.id == m.id >
										<option value="${m.id}" selected >${m.majorName}</option>
									<#else>
										<option value="${m.id}">${m.majorName}</option>
									</#if>
								</#list>
							</#if>
						</select>
					</div>
				
					<div class="span4">
						<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;班级</span>
						<select size="1" id="classId" name="difficultStudentInfo.student.classId.id" aria-controls="dt_gal" class="span6 emptySelect" >
							<option value="" >请选择</option>
							<#if classList ?? >
								<#list classList as c>
									<#if studentAward?? && studentAward.difficultStudentInfo?? && studentAward.difficultStudentInfo.student?? && studentAward.difficultStudentInfo.student.classId?? && studentAward.difficultStudentInfo.student.classId.id == c.id >
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
						  <span class="formTitle">学年</span>
						    <select size="1" id="schoolYear" class="span6" name="schoolYear.id" aria-controls="dt_gal" >
					          <option value="" />请选择..</option>
								<#if yearList??>
									<#list yearList as d>
										<#if studentAward.schoolYear ?? && studentAward.schoolYear.id==d.id >
											<option  value="${d.id}" selected="selected" />${d.name?html}</option>
										<#else>
											<option value="${d.id}" />${d.name?html}</option>
										</#if>
									</#list>
								 </#if>
				         	</select>
						 </div>
						 
					<div class="span4">
					 <span class="formTitle">家庭经济情况</span>
						<select size="1" id="classId" name="familyFinance.id" aria-controls="dt_gal" class="span6" >
							<option value="" >请选择</option>
							<#if financeList ?? >
								<#list financeList as c>
									<#if studentAward?? && studentAward.familyFinance?? && studentAward.familyFinance.id == c.id >
										<option value="${c.id}" selected >${c.name}</option>
									<#else>
										<option value="${c.id}">${c.name}</option>
									</#if>
								</#list>
							</#if>
						</select>
					</div>
					<div class="span4">
					  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					  <input type="button" class="btn btn-info"  onclick="selectStudentAward();" value="查 询"/>
		              <input type="button" class="btn btn-info"  onclick="comp.clearForm('studentAwardQuery')" value="清 空"/>
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
									<th width="6%">序号</th>
									<th width="8%">姓名</th>
									<th width="8%">学号</th>
									<th width="8%">学年</th>
									<th width="10%">学院</th>
									<th width="12%">专业</th>
									<th width="15%">班级</th>
									<th width="8%">奖助类型</th>
									<th width="10%">家庭经济情况</th>
									<th width="8%">状态</th>
								</tr>
							</thead>
							<tbody>
								<#if page??>	
									<#list page.result as p>
										<tr>
											<td>${p_index+1}</td>
											<td class="autocut"><a target="_blank" href="${rc.contextPath}/sponsor/studentAward/opt-view/viewStudentAward.do?id=${(p.id)!''}" title="查看困难生信息"> ${(p.difficultStudentInfo.student.name)!""}</a></td>
											<td class="autocut">${(p.difficultStudentInfo.student.stuNumber)!""}</td>
											<td class="autocut">${(p.schoolYear.name)!""}</td>
											<td class="autocut">${(p.difficultStudentInfo.student.college.name)!""}</td>
											<td class="autocut">${(p.difficultStudentInfo.student.major.majorName)!""}</td>
											<td class="autocut">${(p.difficultStudentInfo.student.classId.className)!""}</td>
											<td class="autocut">${(p.awardType.name)!""}</td>
											<td class="autocut">${(p.familyFinance.name)!""}</td>
											<td class="autocut">${(p.status.name)!""}</td>
										</tr>
									</#list>
								 </#if> 
							</tbody>
						</table>
						 <#assign pageTagformId="studentAwardQuery"/>
						 <#include "/page.ftl">
					</div>
				</div>
			</div> 
		</div> 
	</div>
</div>

<#-- 脚本开始 -->
<script>
	
	//查询
	function selectStudentAward(){
	    $("#studentAwardQuery").attr("action","${rc.contextPath}/sponsor/studentAwardQuery/opt-query/queryStudentAward.do");
		$("#studentAwardQuery").submit();
	}
	
	
	
</script>
</body>
</html>