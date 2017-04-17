<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
    <script src="${rc.contextPath}/js/jquery.form.js"></script> 
    <script>
    
    </script>
</head>
<body>
<div id="contentwrapper">
    <div class="main_content">   
    	<div class="row-fluid">
    	<#if student ??>
    		<form  id="activityQuery"  action="${rc.contextPath}/activity/signup/opt-query/listSignUpActivity.do" method="post">
				<div class="span12">
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">&#12288;&#12288;学院</span>
							<select size="1" id="collegeId" name="collegeIds" aria-controls="dt_gal" class="span7" onchange="cascade.changeCollage('collegeId','majorId','classId');" >
								<option value="">请选择..</option>
								<#if collegeList ??>
									<#list collegeList as c>
										<#if  activity ?? && activity.collegeIds ?? &&  activity.collegeIds == c.id >
											<option  value="${c.id}" selected="selected">${c.name?html}</option>
										<#else>
											<option value="${c.id}" >${c.name?html}</option>
										</#if>
									</#list>
								</#if>
							</select>
						 </div>
						 <div class="span4">
							<span class="formTitle">&#12288;&#12288;专业</span>
							<select size="1" id="majorId" name="majorIds" aria-controls="dt_gal" class="span7 emptySelect"  onchange="cascade.changeMajor('majorId','classId');">
								<option value="" >请选择..</option>
								<#if majorList ?? >
									<#list majorList as m>
										<#if activity ?? && activity.majorIds ?? &&  activity.majorIds == m.id >
											<option value="${m.id}" selected >${m.majorName?html}</option>
										<#else>
											<option value="${m.id}">${m.majorName?html}</option>
										</#if>
									</#list>
								</#if>
							</select>
						</div>
						<div class="span4">
							<span class="formTitle">&#12288;&#12288;班级</span>
							<select size="1" id="classId" name="classIds" aria-controls="dt_gal" class="span7 emptySelect">
								<option value="" >请选择..</option>
								<#if classList ?? >
									<#list classList as c>
										<#if activity ?? && activity.classIds ?? &&  activity.classIds == c.id >
											<option value="${c.id}" selected >${c.className?html}</option>
										<#else>
											<option value="${c.id}">${c.className?html}</option>
										</#if>
									</#list>
								</#if>
							</select>
						</div>
				    </div>				
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
					    
			                <button class="btn btn-info"  type="submit">查 询</button>
			                <button class="btn btn-info" type="button" onclick="comp.clearForm('activityQuery');">清 空</button>
		               </div>
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
								    <th width="7%">序号</th>
									<th width="14%">活动名称</th>
									<th width="10%">活动类别</th>
									<th width="10%">活动类型</th>
									<th width="10%">活动级别</th>
									<th width="12%">学院</th>
									<th width="15%">专业</th>
									<th width="15%">班级</th>
									<th width="7%">操作</th>
								</tr>
							</thead>
							<tbody>
							<#if page??>	
								<#list page.result as p>
								<tr>		
								    <td>${p_index+1}</td>
									<td class="autocut"><a href="${rc.contextPath}/activity/signup/opt-query/querySignUpActivity.do?activityId=${p.id} " target='_blank' class="sepV_a" title="查看">${p.activityName!""?html}</a></td>
									<td class="autocut"><#if p.activityCategory ?? >${p.activityCategory.name!""?html}</#if></td>
									<td class="autocut"><#if p.activityType ?? >${p.activityType.name!""?html}</#if></td>
									<td class="autocut"><#if p.activityLevel ?? >${p.activityLevel.name!""?html}</#if></td>
									<td class="autocut"><#if p.collegeIds ?? >${p.collegeIds!""?html}</#if></td>
									<td class="autocut"><#if p.majorIds ?? >${p.majorIds!""?html}</#if></td>
									<td class="autocut"><#if p.classIds ?? >${p.classIds!""?html}</#if></td>
									<td class="autocut">
									    <#if user_key.optMap??>
											<#if user_key.optMap['apply']??>
												<a href="${rc.contextPath}/activity/signup/opt-query/querySignUpActivity.do?status=signUp&&activityId=${p.id}" class="sepV_a" title="活动报名"><i class="icon-bullhorn"></i></a>
											</#if>
									    </#if>
                                    </td>
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
			<#else>
				<#include "/common/common/commonMessage.ftl">
			</#if>
		</div> 
	</div>
</div>
</body>
</html>