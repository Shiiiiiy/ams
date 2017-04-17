<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<script src="${rc.contextPath}/js/jquery.form.js"></script>
	<script type="text/javascript" src="${rc.contextPath}/js/common/cascadecommon.js"></script>
	
</head>
<body>
<div id="contentwrapper">
    <div class="main_content">   
    	   <div class="row-fluid">	
    	   
    	   <#if isCollegeTeacher??&& isCollegeTeacher="false">
    	   		<#include "/common/common/commonMessage.ftl"/>
    	   <#else>
    	   
    		<form  id="volunteerOfficeForm"  action="${rc.contextPath}/volunteer/office/opt-query/getVolunteerOfficeList.do" method="post">
				<div class="span12">
					<div class="row-fluid">
						<div class="span4">
						   <span class="formTitle">学院</span>
						    <select size="1" <#if isCollegeLeague?? && isCollegeLeague=="true">disabled  class="span6 notClear"</#if> id="collegeId" name="college.id" aria-controls="dt_gal" class="span6" onchange="cascade.changeCollage('collegeId','majorId','classId');" >
								<option value="">请选择..</option>
								<#if collegeList ??>
									<#list collegeList as c>
										<#if  vom ?? && vom.college?? && vom.college ?? && vom.college.id?? && vom.college.id == c.id >
											<option  value="${c.id}" selected="selected">${c.name?html}</option>
										<#else>
											<option value="${c.id}" >${c.name?html}</option>
										</#if>
									</#list>
								</#if>
						    </select>
						    <#if isCollegeLeague?? && isCollegeLeague=="true">
						    	<input name="college.id"  type="hidden" value="${teacherOrgId}"/>
						    </#if>
						 </div>
						 <div class="span4">
								<span class="formTitle">基地地址</span>
							   	<input id="officeAddress" name="officeAddress" class="span6" <#if vom?? && vom.officeAddress??> value="${vom.officeAddress?html}"</#if>/>
						 </div>
						 <div class="span4">
								<span class="formTitle">基地负责人</span>
							   	<input id="manager" name="manager" class="span6" <#if vom?? && vom.manager??> value="${vom.manager?html}"</#if>/>
						 </div>
					</div>
					<div class="btnCenter">
						 	<input type="button" class="btn btn-info"  onclick="selectOfficeInfo();" value="查 询"/>
		              		<input type="button" class="btn btn-info"  onclick="comp.clearForm('volunteerOfficeForm')" value="清 空"/>
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
									<th width="10%">学院</th>
									<th width="20%">基地地址</th>
									<th width="15%">成立时间</th>
									<th width="10%">基地负责人</th>
									<th width="12%">负责人电话</th>
									<th width="10%">负责人QQ</th>
									<th width="10%">其他联系方式</th>
									<#if isCollegeLeague?? && isCollegeLeague=="true">
									<th width="7%">操作</th>
									</#if> 
								</tr>
							</thead>
							<tbody>
							<#if page??>	
								<#list page.result as p>
								<tr>		
								    <td>${p_index+1}</td>
									<td class="autocut"><#if p.college??>${p.college.name!''}</#if></td>
									<td class="autocut">${p.officeAddress!''}</td>
									<td class="autocut"><#if p.foundedTime??>${p.foundedTime?date}</#if></td>
									<td class="autocut"><#if p.manager??>${p.manager!''}</#if></td>
									<td class="autocut">${p.managerPhone!''}</td>
									<td class="autocut">${p.managerQQ!''}</td>
									<td class="autocut">${p.otherWay!''}</td>
									<#if isCollegeLeague?? && isCollegeLeague=="true">
										<td class="autocut">
											<#if user_key.optMap??>
												<#if user_key.optMap['update']??>
											   		<a href="${rc.contextPath}/volunteer/office/opt-query/editVolunteerOffice.do?id=${p.id}" class="sepV_a" title="编辑志愿者基地信息"><i class="icon-edit"></i></a>
												</#if>
	
												<#if user_key.optMap['del']??>
														<#if p.comments?? &&p.comments=="canDel">
																<a href="javascript:void(0);" onclick="deleteVolunteerOffice('${(p.officeAddress)!""}','${p.id!""}');" class="sepV_a" title="删除志愿者基地信息"><i class="icon-trash"></i></a>
														</#if>
														
												</#if>
											</#if> 
	                                    </td>
	                                  </#if>
								</tr>
								</#list>
							 </#if> 
							</tbody>
						</table>
						 <#assign pageTagformId="volunteerOfficeForm"/>
						 <input id="pageTotalCount" name="pageTotalCount" type="hidden"  value="${page.totalCount}"/>
						 <#include "/page.ftl">
					</div>
				</div>
			</div> 
			</#if>
		</div> 
	</div>
</div>
<script>
	//删除操作
	function deleteVolunteerOffice(name,id)
	{
		comp.confirm("确定要删除【"+name+"】的基地信息吗？", function(result) {
		
        	if(!result)
        		return;  
    		$.post("${rc.contextPath}/volunteer/office/opt-del/deleteOffice.do", { id: id }, function(data){
    			if(data === "notDelete"){
    				comp.message(name +"的基地信息已经被使用，不能被删除，请重现刷新页面","error");
    			}else if(data === "success")
    			{
    				comp.message(name +"删除成功！","info");
    				window.location.href="${rc.contextPath}/volunteer/office/opt-query/getVolunteerOfficeList.do";
    			}
			    
			},"text");
		}); 
	}
	//查询
	function selectOfficeInfo(){
		$("#volunteerOfficeForm").submit();
	}	
    $(document).ready(function(){
	 	 //新增方法 
	 	$("#add-button").click( function () { 
	 		window.location.href="${rc.contextPath}/volunteer/office/opt-query/editVolunteerOffice.do";
	 		
	 	 });
	 	
	});
</script>
</body>
</html>