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
			<form id="leaveList" action="${rc.contextPath}/leave/caucus/opt-query/queryCaucusPage.do" method="post">
				<div class="span12">
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学院</span>
							<select id="college" name="student.college.id" aria-controls="dt_gal" class="span7" onchange="cascade.changeCollage('college','major', 'class');">
								<option value="">请选择</option>
								<#if collegeList??>
								<#list collegeList as college>
									<#if (leave.student)?? && (leave.student.college)?? && leave.student.college.id == college.id>
										<option value="${college.id!''}" selected="selected">${college.name!''}</option>
									<#else>
										<option value="${college.id!''}">${college.name!''}</option>
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
										<option value="${major.id!''}" selected="selected">${major.majorName!''}</option>
									<#else>
										<option value="${major.id!''}">${major.majorName!''}</option>
									</#if>
								</#list>
								</#if>
							</select>
						</div>
						<div class="span4">
							<span class="formTitle">班级</span>
							<select id="class" name="student.classId.id" size="1" aria-controls="dt_gal" class="span7 emptySelect">
								<option value="">请选择</option>
								<#if classList??>
								<#list classList as class>
									<#if (leave.student)?? && (leave.student.classId)?? && leave.student.classId.id == class.id>
										<option value="${class.id!''}" selected="selected">${class.className!''}</option>
									<#else>
										<option value="${class.id!''}">${class.className!''}</option>
									</#if>
								</#list>
								</#if>
							</select>
						</div>
					</div>
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">办理年份</span>
							<select name="year" size="1" aria-controls="dt_gal" class="span7">
								<option value="">请选择</option>
								<#if yearList??>
								<#list yearList as y>
									<#if (leave.year)?? && leave.year == y>
										<option value="${y!''}" selected="selected">${y!''}</option>
									<#else>
										<option value="${y!''}">${y!''}</option>
									</#if>
								</#list>
								</#if>
							</select>
						</div>
						<div class="span4">
							<span class="formTitle">姓名</span>
							<input class="span7" name="student.name" value="${(leave.student.name)!""}"/>
						</div>
						<div class="span4">
							<span class="formTitle">学号</span>
							<input class="span7" name="student.stuNumber" value="${(leave.student.stuNumber)!""}"/>
						</div>
					</div>
				</div>
				<div class="btnCenter">
					<button class="btn btn-info" type="button" onClick="queryLeave();">查 询</button>
					<button class="btn btn-info" type="button" onclick="comp.clearForm('leaveList')">清 空</button>
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
									<th width="10%">学号</th>
									<th width="12%">学院</th>
									<th width="15%">专业</th>
									<th width="18%">班级</th>
									<th width="8%">办理年份</th>
									<th width="8%">党组织</th>
									<th width="8%">离校状态</th>
									<#if user_key.optMap['update']??>
									<th width="6%">操作</th>
									</#if>
								</tr>
							</thead>
							<tbody>
								<#if page??>
									<#list page.result as p>
									<tr>
										<td class="autocut">${p_index+1}</td>
										<#--
										<td class="autocut tipTag" data="学院：${(p.student.college.name)!""}<br/>专业：${(p.student.major.majorName)!""}<br/>班级：${(p.student.classId.className)!""}<br/>">${(p.student.name)!""}</td>
										-->
										<td class="autocut">${(p.student.name)!""}</td>
										<td class="autocut">${(p.student.stuNumber)!""}</td>
										<td class="autocut">${(p.student.college.name)!""}</td>
										<td class="autocut">${(p.student.major.majorName)!""}</td>
										<td class="autocut">${(p.student.classId.className)!""}</td>
										<td class="autocut" id=${p.id!""?html}_year>${(p.year)!""}</td>
										<td class="autocut"><#if p.caucus=='0'>未办理<#elseif p.caucus=='1'>已办理</#if></td>
										<td class="autocut"><#if p.status=='0'>未发起<#elseif p.status=='1'>发起<#else>办结</#if></td>
										<#if user_key.optMap['update']??>
										<td class="autocut" name=${p.id!""?html}_td>
										<#if p.status=='1' && p.caucus=='0'>
											<a href="###"  onclick="operate('${p.id}','1')" title="办理"><i class="icon-share"></i></a>
										<#elseif p.status=='1' && p.caucus=='1'>
											<a href="###"  onclick="operate('${p.id}','0')" title="取消办理"><i class="icon-ban-circle"></i></a>
										</#if>
										</td>
										</#if>
									</tr>
									</#list>
									<input type="hidden" id="currentPageNo" name="currentPageNo" value="${page.currentPageNo}">
								</#if>
							</tbody>
						</table>
						<#assign pageTagformId="leaveList"/>
						<#include "/page.ftl">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<#---脚本开始----->
<script>
function queryLeave(){
	$("#leaveList").submit();
}
//发起
function operate(id, status){
	var str="确认要办理？";
	if(status == '0'){
		str="确认要取消办理？";
	}
	comp.confirm(str, function(result) {
    	if(!result){
    		return; 
		}
		$.ajax({
			url:'${rc.contextPath}/leave/operate/opt-edit/operateCaucus.do',
			async:false,
			cache: false,
			type: "POST",
			data:{studentId : id , status: status},
			success: function(data){
				if("success" == data){
					$("#leaveList").attr("action","${rc.contextPath}/leave/caucus/opt-query/queryCaucusPage.do?pageNo="+$("#currentPageNo").val());
					$("#leaveList").submit();
				}else{
					comp.message("操作失败");
				}
		    }
		});
	}); 
}

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
</script>
</body>
</html>