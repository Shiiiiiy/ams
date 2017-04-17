<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
    <script src="${rc.contextPath}/js/jquery.form.js"></script> 
    <script>
    $(document).ready(function(){
	 	 //新增方法 
	 	$("#add-button").click( function () { 
	 		window.location.href="${rc.contextPath}/activity/manage/opt-add/addActivity.do";
	 	 });
	});
	function changIsSignStatus(id,activityName){
	   $.ajax({
			url:'${rc.contextPath}/activity/manage/opt-edit/editActivitySignStatus.do',
			async:false,
			cache: false,
			type: "POST",
			data:{id:id},
			success: function(data){
		 	 comp.message(activityName+"的报名状态修改成功!","info");
		    }
		});
		 $('#activityQuery').submit(); 
	}
	function deleteActivity(activityId){
		comp.confirm("确定要删除这些数据吗？",function(r){
			if(r){
				$.ajax({
						url:'${rc.contextPath}/activity/manage/opt-delete/deleteActivity.do',
						async:false,
						cache:false,
						type: "POST",
						data:{activityId:activityId},
						success: function(data){
							if(data){
					 			comp.message("删除失败，该活动已不存在!","info");
						    }else{
					 			comp.message("删除成功!","info");
					 		}
					    }
				});
				$('#activityQuery').submit();
			}
		});
		return;
	}
    </script>
</head>
<body>
<div id="contentwrapper">
    <div class="main_content">   
    	<div class="row-fluid">	
    		<form id="activityQuery" action="${rc.contextPath}/activity/manage/opt-query/listManageActivity.do" method="post">
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
						    <input id="activityName" name="activityName" maxlength="20" class="span7" value="${activity.activityName!""?html}" />
						</div>
						<div class="span4">
							<span class="formTitle">审核状态</span>
							<select size="1" name="processStatus" aria-controls="dt_gal" class="span7">
								<option value="" >请选择..</option>
									<#list processStatusMap?keys as c>
										<#if activity ?? && activity.processStatus?? && activity.processStatus == c >
											<option value="${c}" selected >${processStatusMap[c]}</option>
										<#else>
											<option value="${c}">${processStatusMap[c]}</option>
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
								    <th width="5%">序号</th>
									<th width="10%">活动名称</th>
									<th width="9%">活动类别</th>
									<th width="9%">活动类型</th>
									<th width="9%">活动级别</th>
									<th width="10%">学院</th>
									<th width="10%">专业</th>
									<th width="10%">班级</th>
									<th width="9%">参与人数</th>
									<th width="9%">审核状态</th>
									<th width="9%">操作</th>
								</tr>
							</thead>
							<tbody>
							<#if page??>	
								<#list page.result as p>
								<tr>		
								    <td>${p_index+1}</td>
									<td class="autocut"><a href="${rc.contextPath}/activity/manage/opt-query/queryManageActivity.do?activityId=${p.id} " target='_blank' class="sepV_a" title="查看">${p.activityName!""?html}</a></td>
									<td class="autocut"><#if p.activityCategory ?? >${p.activityCategory.name!""?html}</#if></td>
									<td class="autocut"><#if p.activityType ?? >${p.activityType.name!""?html}</#if></td>
									<td class="autocut"><#if p.activityLevel ?? >${p.activityLevel.name!""?html}</#if></td>
									<td class="autocut"><#if p.collegeIds ?? >${p.collegeIds!""?html}</#if></td>
									<td class="autocut"><#if p.majorIds ?? >${p.majorIds!""?html}</#if></td>
									<td class="autocut"><#if p.classIds ?? >${p.classIds!""?html}</#if></td>
									<td class="autocut"><#if p.members ?? >${p.members!""?html}</#if></td>
									<td class="autocut">
									<#if p.processStatus ?? && p.processStatus='PASS'&& !(p.suggest??)>
									
									<#elseif p.processStatus ??>
										${processStatusMap[p.processStatus]}
									</#if>
									</td>
									<td class="autocut">
									    <#if user_key.optMap??>
											<#if user_key.optMap['update']??>
												<a href="${rc.contextPath}/activity/manage/opt-query/activityMemberList.do?activityId=${p.id}"  target='_self' class="sepV_a" title="人员维护"><i class="icon-user"></i></a>
												<#if p.status!='SUBMIT' || (p.status=='SUBMIT' && p.processStatus ?? && p.processStatus=='REJECT')>
											        <a href="${rc.contextPath}/activity/manage/opt-edit/editActivity.do?id=${p.id}" class="sepV_a" title="修改"><i class="icon-edit"></i></a>
											    </#if>		
												<#if p.processStatus ?? && p.processStatus=='PASS' && (!(p.summaryStatus ??) ||(p.summaryStatus ?? && p.summaryStatus!='SUBMIT'))>
													<a href="${rc.contextPath}/activity/manage/opt-add/addActivitySummary.do?activityId=${p.id}" class="sepV_a" title="活动总结"><i class="icon-comment"></i></a>
													<#if p.isSignStatus ?? && p.registraForm.code=='ACTIVITY_ONLINE'>
													    <a href="javascript:void(0)" onclick="changIsSignStatus('${p.id}','${p.activityName!""?html}')" class="sepV_a" 
													    <#if p.isSignStatus.name =='是'>title="停止报名"<#else>title="开始报名"</#if>>
														<#if p.isSignStatus.name =='是'><i class="icon-ban-circle"></i><#else><i class="icon-ok-circle"></i></#if></a>
										            </#if>
												</#if>
											</#if>
									        <#if user_key.optMap['del']?? && p.status=='SAVE'>
												<a href="###" onclick="deleteActivity('${p.id}');" title="删除"><i class="icon-trash"></i></a>
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
		</div> 
	</div>
</div>
</body>
</html>