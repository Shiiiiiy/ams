<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
<div id="contentwrapper">
	<div class="main_content">
		<div class="row-fluid">
		<#if name??>
			<h3 class="heading">${name!""}同学，<#if leave??&&leave!=null>您的离校流程：<font color="red">
				<#if leave.status??&&leave.status=='0'>未发起<#elseif leave.status??&&leave.status=='1'>已发起<#else>已办结（办结时间：${leave.updateTime?string('yyyy-MM-dd HH:MM:ss')}）</#if></font></h3>
			<table class="table table-bordered table-striped tablecut" style="width:50%;" id="smpl_tbl" >
				<thead>
					<tr>
						<th width="15%">部门名称</th>
						<th width="30%">办理情况</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="autocut">图书信息中心</td>
						<td class="autocut"><#if leave.status??&&leave.status=='0'>未办理<#else><#if leave.library??&&(leave.library)?lower_case=='true'>已办理<#else>${leave.library!""}</#if></#if></td>
					</tr>
					<tr>
						<td class="autocut">公寓管理中心</td>
						<td class="autocut">${leave.dorm!""?html}</td>
					</tr>
					<tr>
						<td class="autocut">计财处</td>
						<td class="autocut"><#if leave.finance?? && leave.finance=="缴清">${leave.finance!""?html}<#else><a target="_blank" href="http://yxt.hzpt.edu.cn:8828/EducationManager/login2.jsp">${leave.finance!""?html}</a></#if></td>
					</tr>
					<tr>
						<td class="autocut">一卡通</td>
						<td class="autocut"><#if leave.oneCard?? && leave.oneCard !='数据同步异常'>${(leave.oneCard?number)/100}<#else>${leave.oneCard!""?html}</#if></td>
					</tr>
					<tr>
						<td class="autocut">党组织</td>
						<td class="autocut"><#if leave.student?? && leave.student.politicalDic?? 
											  && (leave.student.politicalDic.code=="02" ||leave.student.politicalDic.code=="01")>
											       <#if leave.caucus=='0'>未办理<#else>已办理</#if>
											  <#else>不需办理
											  </#if>
						</td>
					</tr>
					<tr>
						<td class="autocut">保卫处</td>
						<td class="autocut"><#if leave.security??&&leave.security=='0'>不需办理<#elseif leave.security??&&leave.security=='1'>未办理<#else>已办理</#if></td>
					</tr>
					<tr>
						<td class="autocut">二级学院</td>
						<td class="autocut"><#if leave.college??&&leave.college=='0'>未办理<#elseif leave.college??&&leave.college=='1'>已办理</#if></td>
					</tr>
				</tbody>
			</table>
			<#else>
				暂无离校流程！
			</#if>
		<#else>
			<#include "/common/common/commonMessage.ftl">
		</#if>
		</div>
	</div>
</div>
</body>
</html>