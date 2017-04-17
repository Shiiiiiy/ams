<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
    <script src="${rc.contextPath}/js/jquery.form.js"></script> 
    <script>
         function clearForm(){
			$("#majorId").attr("value","");
			$("#name").attr("value","");
			$("#stuNumber").attr("value","");
			$("#grade").attr("value","");
			
			if($("#classId option").length>1) {
				var option = $("#classId").get(0).options;
				option.length = 0;
				var nullOption = new Option("请选择", "", false, false);
				option.add(nullOption);
			}
 		 }
    </script>
</head>
<body>
<div id="contentwrapper">
    <div class="main_content">   
    	<div class="row-fluid">
    		<form  id="activityQuery"  action="${rc.contextPath}/activity/statistic/opt-query/listStatisticActivity.do" method="post">
				<div class="span12">
				    <div class="row-fluid">
						 <div class="span4">
							<span class="formTitle">活动类别</span>
                            <select size="1" id="activityCategory" name="activityCategory.id" aria-controls="dt_gal" class="span7">
								<option value="">请选择..</option>
								<#if activityCategoryDicList??>
							      <#list activityCategoryDicList as g>
									<#if activity ?? && activity.activityCategory ?? && activity.activityCategory.id == g.id>
											<option  value="${g.id}" selected="selected">${g.name}</option>	
										<#else>
											<option value="${g.id}" >${g.name}</option>
										</#if>
									</#list>
								</#if>
							</select>															
						 </div>
						 <div class="span4">
							<span class="formTitle">活动类型</span>
                            <select size="1" id="activityType" name="activityType.id" aria-controls="dt_gal" class="span7">
								<option value="">请选择..</option>
								<#if activityTypeDicList??>
							      <#list activityTypeDicList as g>
									<#if activity ?? && activity.activityType ?? && activity.activityType.id == g.id>
											<option  value="${g.id}" selected="selected">${g.name}</option>	
										<#else>
											<option value="${g.id}" >${g.name}</option>
										</#if>
									</#list>
								</#if>
							</select>															
						 </div>
						 <div class="span4">
							<span class="formTitle">活动级别</span>
                            <select size="1" id="activityLevel" name="activityLevel.id" aria-controls="dt_gal" class="span7">
								<option value="">请选择..</option>
								<#if activityLevelDicList??>
							      <#list activityLevelDicList as g>
									<#if activity ?? && activity.activityLevel ?? && activity.activityLevel.id == g.id>
											<option  value="${g.id}" selected="selected">${g.name}</option>	
										<#else>
											<option value="${g.id}" >${g.name}</option>
										</#if>
									</#list>
								</#if>
							</select>															
						 </div>
					</div>
				    <div class="row-fluid">
				        <div class="span4">
							<span class="formTitle">活动名称</span>
							<input id="activityName" name="activityName" class="span7" maxlength="20" value="${activity.activityName!""?html}" />
						</div>
				        <div class="span4">
					    	<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
				        
			                <button class="btn btn-info" type="submit">查 询</button>
			                <button class="btn btn-info" type="button" onclick="comp.clearForm('activityQuery');">清 空</button>
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
					                            <button class="btn btn-info" type="button" id="add-button">新 增</button>
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
									<th width="10%">活动名称</th>
									<th width="9%">活动类别</th>
									<th width="9%">活动类型</th>
									<th width="9%">活动级别</th>
									<th width="12%">学院</th>
									<th width="14%">专业</th>
									<th width="14%">班级</th>
									<th width="9%">参与人数</th>
									<th width="11%">活动时间</th>
								</tr>
							</thead>
							<tbody>
							<#if page??>	
								<#list page.result as p>
								<tr>		
								    <td>${p_index+1}</td>
									<td class="autocut"><a href="${rc.contextPath}/activity/statistic/opt-query/queryStatisticActivity.do?activityId=${p.id} " target='_blank' class="sepV_a" title="查看">${p.activityName!""?html}</a></td>
									<td class="autocut"><#if p.activityCategory ?? >${p.activityCategory.name!""?html}</#if></td>
									<td class="autocut"><#if p.activityType ?? >${p.activityType.name!""?html}</#if></td>
									<td class="autocut"><#if p.activityLevel ?? >${p.activityLevel.name!""?html}</#if></td>
									<td class="autocut"><#if p.collegeIds ?? >${p.collegeIds!""?html}</#if></td>
									<td class="autocut"><#if p.majorIds ?? >${p.majorIds!""?html}</#if></td>
									<td class="autocut"><#if p.classIds ?? >${p.classIds!""?html}</#if></td>
									<td class="autocut">${p.members!""?html}</td>
									<td class="autocut"><#if p.activityTime ??>${(p.activityTime!"")?string("yyyy-MM-dd")}</#if></td>
								</tr>
								</#list>
							 </#if> 
							</tbody>
						</table>
						 <#assign pageTagformId="activityQuery"/>
						 <input id="pageTotalCount" name="pageTotalCount" type="hidden"  value="${page.totalCount}"/>
						 <#include "/page.ftl">
					</div>
				</div>
			</div>
		</div> 
	</div>
</div>
</body>
</html>