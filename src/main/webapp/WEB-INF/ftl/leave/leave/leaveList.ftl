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
			<form id="leaveList" action="${rc.contextPath}/leave/leave/opt-query/queryLeavePage.do" method="post">
				<div class="span12">
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学院</span>
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
							<span class="formTitle">班级</span>
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
							<span class="formTitle">办理年份</span>
							<select name="year" size="1" aria-controls="dt_gal" class="span7">
								<option value="">请选择</option>
								<#if yearList??>
								<#list yearList as y>
									<#if (leave.year)?? && leave.year == y>
										<option value="${y}" selected="selected">${y}</option>
									<#else>
										<option value="${y}">${y}</option>
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
						<div class="row">
							<div class="span6">
								<div class="dt_actions">
									<div class="row-fluid">
										<button class="btn btn-info" type="button" onclick="mulOperate()">批量办理</button>
									</div>
								</div>
							</div>
						</div>
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl" >
							<thead>
								<tr>
									<th class="table_checkbox" width="6%">
										<input type="checkbox" id="totalCheck" onclick="comp.selectAllCheckbox('totalCheck','studentIds')"/>
									</th>
									<th width="13%">姓名</th>
									<th width="13%">学号</th>
									<th width="10%">办理年份</th>
									<!--th width="15%">学院</th>
									<th width="15%">专业</th>
									<th width="15%">班级</th-->
									<!--th width="6%">性别</th-->
									<th width="10%">图书信息中心</th>
									<th width="10%">公寓管理中心</th>
									<th width="10%">计财处</th>
									<th width="10%">教务处</th>
									<th width="10%">二级学院</th>
									<th width="8%">操作</th>
								</tr>
							</thead>
							<tbody>
								<#if page??>
									<#list page.result as p>
										<tr>
											<td class="autocut">
												<input type="checkbox" id="${(p[0].stuNumber)!""}"  name="studentIds" onclick="onClickSingleCheckbox(this);" value="${(p[0].stuNumber)!""}"/>
											</td>
											<td class="autocut tipTag" data="学院：${(p[0].college.name)!""}<br/>专业：${(p[0].major.majorName)!""}<br/>班级：${(p[0].classId.className)!""}<br/>">${(p[0].name)!""}</td>
											<td class="autocut">${(p[0].stuNumber)!""}</td>
											<td class="autocut" id=${p[0].id!""?html}_year>${(p[1].year)!""}</td>
											<!--td class="autocut">${(p[0].college.name)!""}</td>
											<td class="autocut">${(p[0].major.majorName)!""}</td>
											<td class="autocut">${(p[0].classId.className)!""}</td>
											<td class="autocut">${(p[0].genderDic.name)!""}</td-->
											<td class="autocut td_${p[0].id}" id="library${p[0].id}">
												<#if p[1] ?? && p[1].library ?? && p[1].library.code=="Y">
													<a  href="###"  onclick="singleCancel('${p[0].id}','library')">${(p[1].library.name)!""}</a>
												<#elseif  p[1] ?? && p[1].library ?? && p[1].library.code=="N">
													<a href="###"  onclick="singleOperate('${p[0].id}','library')">${(p[1].library.name)!""}</a>
												<#else>												
													<a href="###"  onclick="singleOperate('${p[0].id}','library')">否</a>
												</#if>
											</td>
											<td class="autocut td_${p[0].id}" id="dorm${p[0].id}">
												<#if p[1] ?? && p[1].dorm ?? && p[1].dorm.code=="Y">
													<a  href="###"  onclick="singleCancel('${p[0].id}','dorm')">${(p[1].dorm.name)!""}</a>
												<#elseif  p[1] ?? && p[1].dorm ?? && p[1].dorm.code=="N">
													<a href="###"  onclick="singleOperate('${p[0].id}','dorm')">${(p[1].dorm.name)!""}</a>
												<#else>												
													<a href="###"  onclick="singleOperate('${p[0].id}','dorm')">否</a>
												</#if>
											</td>
											<td class="autocut td_${p[0].id}" id="finance${p[0].id}">
												<#if p[1] ?? && p[1].finance ?? && p[1].finance.code=="Y">
													<a  href="###"  onclick="singleCancel('${p[0].id}','finance')">${(p[1].finance.name)!""}</a>
												<#elseif  p[1] ?? && p[1].finance ?? && p[1].finance.code=="N">
													<a href="###"  onclick="singleOperate('${p[0].id}','finance')">${(p[1].finance.name)!""}</a>
												<#else>												
													<a href="###"  onclick="singleOperate('${p[0].id}','finance')">否</a>
												</#if>
											</td>
											<td class="autocut td_${p[0].id}" id="edu${p[0].id}">
												<#if p[1] ?? && p[1].edu ?? && p[1].edu.code=="Y">
													<a  href="###"  onclick="singleCancel('${p[0].id}','edu')">${(p[1].edu.name)!""}</a>
												<#elseif  p[1] ?? && p[1].edu ?? && p[1].edu.code=="N">
													<a href="###"  onclick="singleOperate('${p[0].id}','edu')">${(p[1].edu.name)!""}</a>
												<#else>												
													<a href="###"  onclick="singleCancel('${p[0].id}','edu')">是</a>
												</#if>
											</td>
											<td class="autocut td_${p[0].id}" id="college${p[0].id}">
												<#if p[1] ?? && p[1].college ?? && p[1].college.code=="Y">
													<a  href="###"  onclick="singleCancel('${p[0].id}','college')">${(p[1].college.name)!""}</a>
												<#elseif  p[1] ?? && p[1].college ?? && p[1].college.code=="N">
													<a href="###"  onclick="singleOperate('${p[0].id}','college')">${(p[1].college.name)!""}</a>
												<#else>												
													<a href="###"  onclick="singleOperate('${p[0].id}','college')">否</a>
												</#if>
											</td>
											<td class="autocut" name=${p[0].id!""?html}_td>
												<a href="${rc.contextPath}/leave/studentView/view/queryStudentLeave.do?id=${(p[0].stuNumber)}&name=${(p[0].name)}" target="_blank" class="sepV_a" title="查看办理"><i class="icon-list-alt"></i></a>
												<a href="###"  onclick="operate('${p[0].id}')" title="全部办理"><i class="icon-share"></i></a>
												<a href="###"  onclick="cancel('${p[0].id}')" title="取消办理"><i class="icon-ban-circle"></i></a>
											</td>
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

function operate(id){
	comp.confirm("确认要修改？", function(result) {
    	if(!result){
    		return; 
		}
		$.ajax({
			url:'${rc.contextPath}/leave/leave/opt-edit/operateLeave.do',
			async:false,
			cache: false,
			type: "POST",
			data:{studentId : id },
			success: function(data){
				if("success" == data){
					$("#leaveList").attr("action","${rc.contextPath}/leave/leave/opt-query/queryLeavePage.do?pageNo="+$("#currentPageNo").val());
					$("#leaveList").submit();
				}else{
					comp.message("操作失败");
				}
		    }
		});
	}); 
}

function cancel(id){
	comp.confirm("确认要修改？", function(result) {
    	if(!result){
    		return; 
		}
		$.ajax({
			url:'${rc.contextPath}/leave/leave/opt-edit/cancelLeave.do',
			async:false,
			cache: false,
			type: "POST",
			data:{studentId : id },
			success: function(data){
				if("success" == data){
					$("#leaveList").attr("action","${rc.contextPath}/leave/leave/opt-query/queryLeavePage.do?pageNo="+$("#currentPageNo").val());
					$("#leaveList").submit();
				}else{
					comp.message("操作失败");
				}
		    }
		});
	}); 
}

function singleOperate(id, type){
	$.ajax({
		url:'${rc.contextPath}/leave/leave/opt-edit/singleOperateLeave.do',
		async:false,
		cache: false,
		type: "POST",
		data:{studentId : id , type: type},
		success: function(data){
			 $("#leaveList").attr("action","${rc.contextPath}/leave/leave/opt-query/queryLeavePage.do?pageNo="+$("#currentPageNo").val());
			 $("#leaveList").submit();
	    }
	});
}

function singleCancel(id, type){
	$.ajax({
		url:'${rc.contextPath}/leave/leave/opt-edit/singleCancelLeave.do',
		async:false,
		cache: false,
		type: "POST",
		data:{studentId : id, type: type},
		success: function(data){
			$("#leaveList").attr("action","${rc.contextPath}/leave/leave/opt-query/queryLeavePage.do?pageNo="+$("#currentPageNo").val());
			$("#leaveList").submit();
	    }
	});
}


//点击checkbox按钮 
function onClickSingleCheckbox(obj)
{
	var $subBox = $("input[name='studentIds']");
	$("#totalCheck").attr("checked",$subBox.length == $("input[name='studentIds']:checked").length ? true : false);
}
//批量取消
function mulOperate(){
	var num = $("input[name='studentIds']:checked");
	var stuId = "";
	var flag = true;
	if(num.length > 0){
		num.each(function(i){
		//验证所选记录中是否有重复学生，有的时候无法批量调整
			var id = $(this).attr("id");
			if(stuId.indexOf(id) > -1){
				comp.message("所选数据中有重复学生，无法批量调整，请重新选择","info");
				flag = false;
				return;
			}else{
				stuId = stuId + id + ",";
			}
		});
		if(flag){
			comp.confirm("确认要办理吗？", function(result){
			if(!result){
				return; }
				$.post(
					"${rc.contextPath}/leave/leave/opt-edit/mulOperate.do",
					{studentIds:stuId},
					function(data){
						$("#leaveList").attr("action","${rc.contextPath}/leave/leave/opt-query/queryLeavePage.do?pageNo="+$("#currentPageNo").val());
						$("#leaveList").submit();
					},
					"text"
				);
			});
		}
	}else{
		comp.message("请至少选择一条记录!","info");
	}
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