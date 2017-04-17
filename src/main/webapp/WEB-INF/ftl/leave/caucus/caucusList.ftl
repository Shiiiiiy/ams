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
			<form id="caucusList" action="" method="post">
				<div class="span12">
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">学院</span>
							<select id="college" name="student.college.id" aria-controls="dt_gal" class="span7" onchange="cascade.changeCollage('college','major', 'classId');">
								<option value="">请选择</option>
								<#if collegeList??>
								<#list collegeList as college>
									<#if (po.student)?? && (po.student.college)?? && po.student.college.id == college.id>
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
							<select id="major" name="student.major.id" aria-controls="dt_gal" class="span7 emptySelect" onchange="cascade.changeMajor('major','classId');">
								<option value="">请选择</option>
								<#if majorList??>
								<#list majorList as major>
									<#if (po.student)?? && (po.student.major)?? && po.student.major.id == major.id>
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
							<select id="classId" name="student.classId.id" size="1" aria-controls="dt_gal" class="span7 emptySelect">
								<option value="">请选择</option>
								<#if classList??>
								<#list classList as class>
									<#if (po.student)?? && (po.student.classId)?? && po.student.classId.id == class.id>
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
							<input class="span7" name="student.name" value="${(po.student.name)!""}"/>
						</div>
						<div class="span4">
							<span class="formTitle">学号</span>
							<input class="span7" name="student.stuNumber" value="${(po.student.stuNumber)!""}"/>
						</div>
						<div class="span4">
							<span class="formTitle">学年</span>
							<select name="yearDic.id" size="1" aria-controls="dt_gal" class="span7">
								<option value="">请选择</option>
								<#if yearList??>
								<#list yearList as y>
									<#if po.yearDic?? && po.yearDic.id == y.id>
										<option value="${y.id!""}" selected="selected">${y.name!""}</option>
									<#else>
										<option value="${y.id!""}">${y.name!""}</option>
									</#if>
								</#list>
								</#if>
							</select>
						</div>
					</div>
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">状态</span>
							<select name="handleStatus.id" size="1" aria-controls="dt_gal" class="span7">
								<option value="">请选择</option>
								<#if handleStauts??>
								<#list handleStauts as hs>
									<#if (po.handleStatus)?? && po.handleStatus.id == hs.id>
										<option value="${hs.id}" selected="selected">${hs.name}</option>
									<#else>
										<option value="${hs.id}">${hs.name}</option>
									</#if>
								</#list>
								</#if>
							</select>
						</div>
						<div class="span4" style="padding-left:32px;">
							<button class="btn btn-info" type="button" onClick="queryCaucus();">查 询</button>
							<button class="btn btn-info" type="button" onclick="comp.clearForm('caucusList')">清 空</button>
						</div>
					</div>
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
											<button class="btn btn-info" type="button" onclick="importData()">导 入</button>
										</#if>
									</#if>
									</div>
								</div>
							</div>
						</div>
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl" >
							<thead>
								<tr>
									<th width="5%">序号</th>
									<th width="8%">姓名</th>
									<th width="12%">学号</th>
									<th width="6%">性别</th>
									<th width="15%">身份证号</th>
									<th width="9%">学年</th>
									<th width="8%">关系类型</th>
									<th width="8%">办理情况</th>
									<th width="12%">接受党组织</th>
									<th width="10%">转出时间</th>
									<th width="6%">操作</th>
								</tr>
							</thead>
							<tbody>
								<#if page??>
									<#list page.result as p>
										<tr>
											<td class="autocut">${p_index+1}</td>
											<td class="autocut tipTag" data="学院：${(p.student.college.name)!""}<br/>专业：${(p.student.major.majorName)!""}<br/>班级：${(p.student.classId.className)!""}<br/>"><a href="javascript:void(0);" onclick="showDetail('${p.id!""}');">${(p.student.name)!""}</a></td>
											<td class="autocut">${(p.student.stuNumber)!""}</td>
											<td class="autocut"><#if p.student.genderDic??>${(p.student.genderDic.name)!""}</#if></td>
											<td class="autocut"><#if p.student??>${(p.student.certificateCode)!""}</#if></td>
											<td class="autocut"><#if p.yearDic??>${(p.yearDic.name)!""}</#if></td>
											<td class="autocut">${(p.caucusType)!""}</td>
											<td class="autocut">${(p.handleStatus.name)!""}</td>
											<td class="autocut">${(p.acceptedBranchName)!""}</td>
											<td class="autocut">${(p.transferDateStr)!""}</td>
											<td class="autocut"><a href="javascript:void(0);" onclick="showDetail('${p.id!""}');" title="查看"><i class="icon-list-alt"></i></a></td>
										</tr>
									</#list>
								</#if>
							</tbody>
						</table>
						<#assign pageTagformId="caucusList"/>
						<#include "/page.ftl">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal hide fade" id="notice_view">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3 id="title1">党团关系查看</h3>
	</div>
	<div class="modal-body" id="notice_view_body">
		
	</div>
	<div class="modal-footer">
		<a href="#" class="btn" data-dismiss="modal">关闭</a>
	</div>
</div>

<#---脚本开始----->
<script>
<!--显示提示框-->
	$(function(){
		$('.tipTag').poshytip({
			className: 'tip-yellowsimple',
			alignTo: 'target',
			alignX: 'right',
			alignY: 'center',
			offsetX: -20
		});
	});
//业务查询
function queryCaucus() {
	$("#caucusList").attr("action", "${rc.contextPath}/leave/caucus/opt-query/queryCaucusPage.do");
	$("#caucusList").attr("method", "post");
	$("#caucusList").submit();
}

//导入
function importData() 
{
	window.location.href="${rc.contextPath}/leave/caucus/caucusImport.ftl";
}

function showDetail(id)
{
	comp.showModal("notice_view","800px","-250px 0 0 -350px");
	$("#notice_view_body").load("${rc.contextPath}/leave/caucus/nsm/viewcaucus.do?id="+id);
}

</script>
</body>
</html>