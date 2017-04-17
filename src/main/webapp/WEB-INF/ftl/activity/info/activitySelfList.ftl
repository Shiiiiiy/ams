<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
    <script src="${rc.contextPath}/js/jquery.form.js"></script> 
    <script src="${rc.contextPath}/js/common/common_approve.js"></script>
    <script>
    </script>
</head>
<body>
<div id="contentwrapper">
    <div class="main_content">   
    	<div class="row-fluid">	
    		<form  id="activityQuery"  action="${rc.contextPath}/activity/info/opt-query/listSelfActivity.do" method="post">
				<div class="span12">
					<div class="row-fluid">
				        <div class="span4">
							<span class="formTitle">活动类别</span>
	                            <select size="1" id="activityCategory" name="activityPo.activityCategory.id" aria-controls="dt_gal" class="span7">
									<option value="">请选择..</option>
									<#if activityCategoryDicList??>
								      <#list activityCategoryDicList as g>
										<#if activityMember ?? && activityMember.activityPo ?? && activityMember.activityPo.activityCategory ?? && activityMember.activityPo.activityCategory.id == g.id>
												<option  value="${g.id}" selected="selected">${g.name}</option>	
											<#else>
												<option value="${g.id}" >${g.name}</option>
											</#if>
										</#list>
									</#if>
								</select>															
						</div>
						<div class="span4">
							<span class="formTitle">&#12288;&#12288;活动类型</span>
	                            <select size="1" id="activityType" name="activityPo.activityType.id" aria-controls="dt_gal" class="span7">
									<option value="">请选择..</option>
									<#if activityTypeDicList??>
								      <#list activityTypeDicList as g>
										<#if activityMember ?? && activityMember.activityPo ?? && activityMember.activityPo.activityType ?? && activityMember.activityPo.activityType.id == g.id>
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
	                            <select size="1" id="activityLevel" name="activityPo.activityLevel.id" aria-controls="dt_gal" class="span7">
									<option value="">请选择..</option>
									<#if activityLevelDicList??>
								      <#list activityLevelDicList as g>
										<#if activityMember ?? && activityMember.activityPo ?? && activityMember.activityPo.activityLevel ?? && activityMember.activityPo.activityLevel.id == g.id>
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
							    <input id="activityName" name="activityPo.activityName" maxlength="20" class="span7" <#if activityMember ?? && activityMember.activityPo ??>value="${activityMember.activityPo.activityName!""?html}"</#if> />
						</div>
				        <div class="span4">
						    <span class="formTitle">报名审核状态</span>
								<select size="1" id="approveStatus" name="approveStatus.id" aria-controls="dt_gal" class="span7">
									<option value="" >请选择..</option>
										<#list applyApproveList as a>
											 <#if activityMember ?? && activityMember.approveStatus?? && activityMember.approveStatus.id == a.id >
												<option value="${a.id}" selected >${a.name}</option>
											 <#else>
												<option value="${a.id}">${a.name}</option>
											 </#if>
										</#list>
								</select>
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
								    <th width="6%">序号</th>
									<th width="12%">活动名称</th>
									<th width="10%">活动类别</th>
									<th width="10%">活动类型</th>
									<th width="10%">活动级别</th>
									<th width="12%">学院</th>
									<th width="15%">专业</th>
									<th width="15%">班级</th>
									<th width="10%">审核状态</th>
									<th width="6%">操作</th>
								</tr>
							</thead>
							<tbody>
							<#if page??>	
								<#list page.result as p>
								<#if p.activityPo ??>
								<tr>		
								    <td>${p_index+1}</td>
									<td class="autocut"><a href="${rc.contextPath}/activity/info/opt-query/querySelfActivity.do?activityId=${p.activityPo.id} " target='_blank' class="sepV_a" title="查看">${p.activityPo.activityName!""?html}</a></td>
									<td class="autocut"><#if p.activityPo.activityCategory ?? >${p.activityPo.activityCategory.name!""?html}</#if></td>
									<td class="autocut"><#if p.activityPo.activityType ?? >${p.activityPo.activityType.name!""?html}</#if></td>
									<td class="autocut"><#if p.activityPo.activityLevel ?? >${p.activityPo.activityLevel.name!""?html}</#if></td>
									<td class="autocut"><#if p.activityPo.collegeIds ?? >${p.activityPo.collegeIds!""?html}</#if></td>
									<td class="autocut"><#if p.activityPo.majorIds ?? >${p.activityPo.majorIds!""?html}</#if></td>
									<td class="autocut"><#if p.activityPo.classIds ?? >${p.activityPo.classIds!""?html}</#if></td>
									<td class="autocut">${p.approveStatus.name!""?html}</td>
									<td>
										<a href="javascript:void(0);" onclick="approve.showHis('${p.id}');" class="sepV_a" title="审核意见查看"><i class="icon-list"></i></a>
									</td>
								</tr>
								</#if>
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

  <#-- 审核历史查看 -->
  <#include "/apw/instance/approveHistory.ftl">	 
</body>
</html>