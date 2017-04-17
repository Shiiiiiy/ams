<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<script src="${rc.contextPath}/js/jquery.form.js"></script> 
		<script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
		<script src="${rc.contextPath}/js/common/common_approve.js"></script>
    </head>
    <body>
<div id="contentwrapper">
    <div class="main_content">   
    	   <div class="row-fluid">	
    		<form  id="majorQuery"  action="${rc.contextPath}/base/major/opt-query/listBaseMajor.do" method="post">
				<div class="span12">			
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">专业名称</span>
							<input id="majorName" name="majorName" data="提示信息&lt;br/&gt;adfasdfasd" class="span6 tipTag" value="${baseMajor.majorName!""?html}" />
						 </div>
						 <div class="span4">
							<span class="formTitle">专业编码</span>
						    <input id="majorCode" name="majorCode" data="提示信息&lt;br/&gt;安康放假了都是放假 " class="span6 tipTag" value="${baseMajor.majorCode!""?html}" />
						  </div>
						<div class="span4">
							<span class="formTitle">科学门类</span>
						    <input id="categotyCode" name="categotyCode" class="span6" value="${baseMajor.categotyCode!""?html}" />
						</div>
					</div>
		            <div class="btnCenter">
		              <button class="btn btn-info"  type="submit">查 询</button>
		              <button class="btn btn-info" type="button" onclick="comp.clearForm('majorQuery');">清 空</button>
		              <!--选择组件的调用方法  代码完成 示例代码 删除-->
		              <button class="btn btn-info"  type="button" onclick="selectStudentRadio();">单选学生</button>
		              <button class="btn btn-info"  type="button" onclick="selectStudentCheck();">多选学生</button>
		              <button class="btn btn-info"  type="button" onclick="selectStudentByClassRadio();">单选学生班级过滤</button>
		              <button class="btn btn-info"  type="button" onclick="selectStudentByClassCheck();">多选学生班级过滤</button>
		              <button class="btn btn-info" type="button" onclick="selectTeacherCheck()">教职工多选</button>
		              <button class="btn btn-info" type="button" onclick="selectSchoolTeacherRadio()">教职工单选</button>
		              <button class="btn btn-info" type="button" onclick="selectTeacherRadio()">学院教师单选</button>
		               <button class="btn btn-info" type="button" onclick="showApproveCommnets()">审核历史</button>
		              <!--选择组件的调用方法-->
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
									<th width="30%">专业名称</th>
									<th width="15%">专业编码</th>
									<th width="15%">学制</th>
									<th width="20%">学院单位</th>
									<th width="15%">学科门类</th>
								</tr>
							</thead>
							<tbody>
							<#if page??>	
								<#list page.result as p>
								<tr>
									<td>${p_index+1}</td>
									<td class="autocut">${p.majorName!""?html}</td>
									<td class="autocut">${p.majorCode!""?html}</td>
									<td class="autocut">${p.schoolYear!""?html}</td>
									<td class="autocut"><#if p.collage??>${p.collage.name!""?html}</#if></td>
									<td class="autocut">${p.categoryCode!""?html}</td>
								</tr>
								</#list>
							 </#if> 
							</tbody>
						</table>
						 <#assign pageTagformId="majorQuery"/>
						 <#include "/page.ftl">
					</div>
				</div>
			</div> 
		</div> 
	</div>
</div>

<#-- 学生选择单选组件的引入 -->
<#include "/comp/student/queryStudentAllRadioModal.ftl">

<#-- 学生选择多选组件的引入-->
<#include "/comp/student/queryStudentAllCheckBoxModal.ftl"> 

<#-- 学生按照班级选择单选组件的引入-->
<#include "/comp/student/queryStudentByClassRadioModal.ftl"> 

<#-- 学生按照班级选择单选组件的引入-->
<#include "/comp/student/queryStudentByClassCheckBoxModal.ftl"> 

<#--用户选择 多选-->
<#include "/comp/teacher/queryTeacherCheckBoxModal.ftl">

<#--教师单选-->
<#include "/comp/teacher/queryTeacherAllRadioModal.ftl">

<#-- 学院教师单选 -->
<#include "/comp/teacher/queryCollegeTeacherAllRadioModal.ftl">

<#-- 审核历史查看 -->
<#include "/common/approve/approveComment.ftl">

<script>
	<!--显示提示框-->
	$(function(){
		$('.tipTag').poshytip({
			className: 'tip-yellowsimple',
			showOn: 'focus',
			alignTo: 'target',
			alignX: 'right',
			alignY: 'center',
			offsetX: 5
		});
	});
	// 单选学生选择 
	function selectStudentRadio()
	{
		_queryStudentRadioAll("","20");
	}
	function setStudentRadioSelectValue(student)
	{
		alert(student.id + " : " + student.name + " : " + student.majorName+ " : " + student.genderName+ " : " + student.collegeName+ " : " + student.className);
	}
	
	// 多选学生
	function selectStudentCheck()
	{
		_queryStudentCheckAll("2012030224,2012030225","1");
	}
	
	function setMultiEduClassSelectValue(studentIds,names)
	{
		alert(studentIds + " : " + names);
	}
	
	function setMultiEduClassSelectObjValue(obj)
	{
		if(obj.length>0)
		{
			for(var i=0;i<obj.length;i++)
			{
				alert(obj[i].id);
			}
		}
	}
	
	//按照班级过滤的选择单选
	function selectStudentByClassRadio()
	{
		_queryStudentRadioByClass("","");
	}
	function setClassStudentSelectValue(student)
	{
		alert(student.id + " : " + student.name + " : " + student.majorName+ " : " + student.genderName+ " : " + student.collegeName+ " : " + student.className+ " : " + student.birthDay+ " : " + student.nativeName);
	}
	
	// 多选学生按照班级过滤
	function selectStudentByClassCheck()
	{
		_queryStudentByClassCheck("2012030224","","1");
	}
	/**function setClassStudentSelectCheckValue(studentIds,names)
	{
		alert(studentIds + " : " + names);
	}*/
	/***/
	function setClassStudentSelectCheckObjValue(obj)
	{
		if(obj.length>0)
		{
			for(var i=0;i<obj.length;i++)
			{
				alert(obj[i].id);
			}
		}
	}
	
	// 多选教职工
	function selectTeacherCheck()
	{
		_queryTeacherCheckAll("");
	}
	function setTeacherSelectValue(teacherIds,names)
	{
		alert(teacherIds + " : " + names);
	}
	
	//单选教职工
	function selectSchoolTeacherRadio()
	{
		_queryTeacherRadioAll("1986006");
	}
	function _setTeacherRadioSelectValue(teacher)
	{
		if(teacher)
		{
			alert(teacher.id + " : " + teacher.name);
		}
	}
	
	//学院教师单选
	function selectTeacherRadio()
	{
		//参数，第一个为教师ID，第二个 为学院ID 都可为空
		_queryCollegeTeacherRadio("","20");
	}
	function setCollegeTeacherRadioSelectValue(teacher)
	{
		if(teacher)
		{
			alert(teacher.name + " : " + teacher.orgName + " : " + teacher.id+ " : " + teacher.code);
		}
	}
	
	//审核历史
	function showApproveCommnets()
	{
		//参数为objectId
		approve.showApproveComments('');
	}
	
</script>

</body>
</html>