<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="${rc.contextPath}/css/bdp_comp.css" type="text/css" />
	<script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
</head>
<body>
<div id="contentwrapper">
	<div class="main_content">
		<div class="row-fluid">
			<form id="leaveLife" action="${rc.contextPath}/leave/life/opt-query/queryLifePage.do" method="post">
				<div class="span12">
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">学院</span>
							<select id="college" name="student.college.id" aria-controls="dt_gal" class="span7" onchange="cascade.changeCollage('college','major', 'class');">
								<option value="">请选择</option>
								<#if collegeList??>
								<#list collegeList as college>
									<#if (leave.student)?? && (leave.student.college)?? && leave.student.college.id == college.id>
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
							<select id="major" name="student.major.id" aria-controls="dt_gal" class="span7 emptySelect" onchange="cascade.changeMajor('major','class');">
								<option value="">请选择</option>
								<#if majorList??>
								<#list majorList as major>
									<#if (leave.student)?? && (leave.student.major)?? && leave.student.major.id == major.id>
										<option value="${major.id}" selected="selected">${major.majorName}</option>
									<#else>
										<option value="${major.id}">${major.majorName}</option>
									</#if>
								</#list>
								</#if>
							</select>
						</div>
						<div class="span4">
							<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;班级</span>
							<select id="class" name="student.classId.id" size="1" aria-controls="dt_gal" class="span7 emptySelect">
								<option value="">请选择</option>
								<#if classList??>
								<#list classList as class>
									<#if (leave.student)?? && (leave.student.classId)?? && leave.student.classId.id == class.id>
										<option value="${class.id}" selected="selected">${class.className}</option>
									<#else>
										<option value="${class.id}">${class.className}</option>
									</#if>
								</#list>
								</#if>
							</select>
						</div>
					</div>
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">姓名</span>
							<input class="span7" name="student.name" value="${(leave.student.name)!""}"/>
						</div>
						<div class="span4">
							<span class="formTitle">学号</span>
							<input class="span7" name="student.stuNumber" value="${(leave.student.stuNumber)!""}"/>
						</div>
						<div class="span4">
							<span class="formTitle">办理年份</span>
							<select name="year.id" size="1" aria-controls="dt_gal" class="span7">
								<option value="">请选择</option>
								<#if yearList??>
								 <#list yearList as y>
									<#if (leave.year)?? && leave.year.id == y.id>
										<option value="${y.id}" selected="selected">${y.name?html}</option>
									<#else>
										<option value="${y.id}">${y.name?html}</option>
									</#if>
								</#list>
								</#if>
							</select>
						</div>
					</div>
				</div>
				<div class="btnCenter">
					<button class="btn btn-info" type="button" onClick="queryLife();">查 询</button>
					<button class="btn btn-info" type="button" onclick="comp.clearForm('leaveLife')">清 空</button>
				</div>
			</form>
			<div class="row-fluid">
				<div class="span12">
					<h5 class="heading"></h5>
					<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
						<div class="row">
							<div class="span6">
								<div class="dt_actions">
									<div class="row-fluid">
									   <#if user_key.optMap??>
											<#if user_key.optMap['import']??>
					                            <button class="btn btn-info" type="button" onclick="report()">导 入</button>
											</#if>
											<#if user_key.optMap['del']??>
												<button class="btn btn-info" type="button" onclick="deleteStudent()">批量删除</button>
											</#if>
										</#if>	
									</div>
								</div>
							</div>
						</div>
					  <form  id="studentDelete"  action="${rc.contextPath}/leave/life/opt-del/deleteLifeInfo.do" method="post"> 
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl" >
							<thead>
								<tr>
									<th class="table_checkbox" width="8%">
									 <#if user_key.optMap??>
										<#if user_key.optMap['del']??>
											<input type="checkbox" id="totalCheck"  onclick="comp.selectAllCheckbox('totalCheck','lifeInfoId')"/>
										<#else>
											序号
										</#if>
									 </#if> 
									</th>
									<th width="8%">姓名</th>
									<th width="10%">学号</th>
									<th width="10%">学院</th>
									<th width="20%">专业</th>
									<th width="15%">班级</th>
									<th width="15%">办理年份</th>
									<th width="15%">欠费情况</th>
								</tr>
							</thead>
							<tbody>
								<#if page??>
									<#list page.result as p>
										<tr>
											<td class="autocut">
											 <#if user_key.optMap??>
												<#if user_key.optMap['del']??>
													<input type="checkbox" name="lifeInfoId" onclick="onClickSingleCheckbox(this);" value="${p.id!""}"/>
												<#else> 
													${p_index+1}
												</#if>
										     </#if>
											</td>
											<td class="autocut tipTag" data="学院：${(p.student.college.name)!""}<br/>专业：${(p.student.major.majorName)!""}<br/>班级：${(p.student.classId.className)!""}<br/>">${(p.student.name)!""}</td>
											<td class="autocut">${(p.student.stuNumber)!""}</td>
											<td class="autocut">${(p.student.college.name)!""}</td>
											<td class="autocut">${(p.student.major.majorName)!""}</td>
											<td class="autocut">${(p.student.classId.className)!""}</td>
											<td class="autocut">${(p.year.name)!""}</td>
											<td class="autocut">${(p.status.name)!""}</td>
										</tr>
									</#list>
									<input type="hidden" id="currentPageNo" name="currentPageNo" value="${page.currentPageNo}">
								</#if>
							</tbody>
						 </table>
					   </from>	
						<#assign pageTagformId="leaveLife"/>
						<#include "/page.ftl">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<#---脚本开始----->
<script>
function queryLife(){
	$("#leaveLife").submit();
}

//点击checkbox按钮 
function onClickSingleCheckbox(obj)
{
	var $subBox = $("input[name='lifeInfoId']");
	$("#totalCheck").attr("checked",$subBox.length == $("input[name='lifeInfoId']:checked").length ? true : false);
}

function deleteStudent()
{
	var $subBox = $("input[name='lifeInfoId']");
	var len =  $("input[name='lifeInfoId']:checked").length ;
	if(len >0)
	{
		comp.confirm("删除选中的水电费欠费学生信息，系统将不再保存和备份，确认要删除吗？", function(result) {
        	if(!result)
        		return;  
     		
     		$.ajax({
				url: "${rc.contextPath}/leave/life/opt-del/deleteLifeInfo.do",
				async:false,
				cache:false,
				type:"POST",
				data:$('#studentDelete').serialize(),
			    success: function(data){
					if(data == "success"){
				       $("#leaveLife").submit();
				    }else{
				    	$.sticky("水电费欠费学生信息删除失败", {autoclose:5000, position:"top-right", type:"st-error"});
				    	return;
				    }
				}
		   });

		}); 
	}
	else
	{
		comp.message("请选择要删除的水电费欠费学生信息!","info");
	}
}
//导入
function report(){
	window.location.href="${rc.contextPath}/leave/life/importLifeInfo.ftl";
}

</script>
</body>
</html>