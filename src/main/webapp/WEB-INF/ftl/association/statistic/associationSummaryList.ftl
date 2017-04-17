<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<script src="${rc.contextPath}/js/jquery.form.js"></script>
</head>
<body>
<div id="contentwrapper">
    <div class="main_content">   
    	   <div class="row-fluid">	
    		<form  id="associationSummaryForm"  action="${rc.contextPath}/association/statistic/opt-query/associationSummaryInfo.do" method="post">
				<div class="span12">
					<div class="row-fluid">
						<div class="span4">
						    <span class="formTitle">社团名称</span>
							<div class="span9">
							<input name="associationName" class="span8" value="${(abm.associationName!"")?html}" maxlength="200"/>
							</div>
						 </div>
						<div class="span4">
						    <span class="formTitle">学院</span>
							<div class="span9">
							   <select size="1" id="collegeId" name="college.id" aria-controls="dt_gal" style="cursor:pointer" class="span9">
								<option value="">请选择..</option>
								<#if collegeList ??>
									<#list collegeList as c>
										<#if  abm.college ?? &&  abm.college.id == c.id >
											<option  value="${c.id}" selected="selected">${c.name?html}</option>
										<#else>
											<option value="${c.id}" >${c.name?html}</option>
										</#if>
									</#list>
								</#if>
							   </select>
							</div>
						 </div>
						<div class="span4">
						    <span class="formTitle">社团类型</span>
							<div class="span9">
								<select size="1" name="associationType.id" class="span8" aria-controls="dt_gal" style="cursor:pointer" style="cursor:pointer">
									<option value="">请选择..</option>
									<#if associationTypeDicList ??>
								      <#list associationTypeDicList as g>
										<#if abm.associationType ?? && abm.associationType.id == g.id>
												<option  value="${(g.id)?html}" selected="selected">${(g.name)?html}</option>	
											<#else>
												<option value="${(g.id)?html}" >${(g.name)?html}</option>
											</#if>
										</#list>
									</#if>
								</select>
							</div>
						</div>
					</div>
					<div class="row-fluid">
						<div class="span4">
						    <span class="formTitle">是否注销</span>
						    <div class="span9">
								<select size="1" name="isCancel.id" class="span8" aria-controls="dt_gal" style="cursor:pointer" style="cursor:pointer">
									<option value="">请选择..</option>
									<#if isLogic ??>
								      <#list isLogic as g>
										<#if abm.isCancel ?? && abm.isCancel.id == g.id>
												<option  value="${(g.id)?html}" selected="selected">${(g.name)?html}</option>	
											<#else>
												<option value="${(g.id)?html}" >${(g.name)?html}</option>
											</#if>
										</#list>
									</#if>
								</select>
							</div>
						 </div>
						 <div class="span4" style="padding-left:46px;">
							 <button class="btn btn-info"  type="submit">查 询</button>
			                 <button class="btn btn-info" type="button" onclick="comp.clearForm('associationSummaryForm')">清 空</button>
						 </div>
					</div>
				</div>
			</form>
			<div class="row-fluid">
					<div class="span12">
						<h5 class="heading"></h5>
						<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
						<div class="row">
				            <div class="span10">
				                <div class="dt_actions">
				                    <div class="row-fluid">
				                         <#if user_key.optMap??>
											<#if user_key.optMap['add']??>
					                            <button class="btn btn-info" type="button" id="add-button">新增</button>
											</#if>
										</#if>
									</div>
								</div>
							</div>
						</div>
				<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
							<thead>
								<tr>
								    <th width="6%">序号</th>
									<th width="25%">社团名称</th>
									<th width="12%">所属学院</th>
									<th width="10%">社团类型</th>
									<th width="10%">社长</th>
									<th width="8%">社团人数</th>
									<th width="8%">是否十佳</th>
									<th width="8%">社团性质</th>
									<th width="8%">是否注销</th>
								</tr>
							</thead>
							<tbody>
							<#if page??>	
								<#list page.result as p>
								<tr>		
								    <td><div align="center">${p_index+1}</div></td>
									<td class="autocut">${(p.associationName!"")?html}</td>
									<td class="autocut"><#if p.college??>${(p.college.name!"")?html}</#if></td>
									<td class="autocut"><#if p.associationType??>${(p.associationType.name!"")?html}</#if></td>
									<td class="autocut"><#if p.proprieter??>${(p.proprieter.name!"")?html}</#if></td>
									<td class="autocut">${(p.memberNums!"")?html}</td>
									<td class="autocut"><#if p.isTopten??>${(p.isTopten.name!"")?html}</#if></td>
									<td class="autocut"><#if p.isMajor??><#if p.isMajor.code=='Y'>专业<#elseif p.isMajor.code=='N'>非专业</#if></#if></td>
									<td class="autocut"><#if p.isCancel??>${(p.isCancel.name!"")?html}</#if></td>
								</tr>
								</#list>
							 </#if> 
							</tbody>
						</table>
						 <#assign pageTagformId="associationSummaryForm"/>
						 <input id="pageTotalCount" name="pageTotalCount" type="hidden"  value="${page.totalCount}"/>
						 <#include "/page.ftl">
					</div>
				</div>
			</div> 
		</div> 
	</div>
</div>
<script>
    $(document).ready(function(){
	 	 //新增方法 
	 	$("#add-button").click( function () { 
	 		//window.location.href="${rc.contextPath}/activity/manage/opt-add/addActivity.do";
	 		comp.message("新增社团注销申请");
	 	 });
	 	
	});
</script>
</body>
</html>