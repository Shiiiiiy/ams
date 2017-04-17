<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<script src="${rc.contextPath}/js/jquery.form.js"></script>
	<script>
	</script>
</head>
<body>
<div id="contentwrapper">
    <div class="main_content">   
    	   <div class="row-fluid">	
    		<form  id="associationServiceForm"  action="${rc.contextPath}/association/service/opt-query/getMemberServiceList.do" method="post">
				<div class="span12">
					<div class="row-fluid">
						<div class="span4">
						    <span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学院</span>
							<div class="span9">
							   <select size="1" id="collegeId" name="college.id" aria-controls="dt_gal" style="cursor:pointer" class="span8">
								<option value="">请选择..</option>
								<#if collegeList ??>
									<#list collegeList as c>
										<#if abm.college ?? &&  abm.college.id == c.id >
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
							   <select size="1" id="associationTypeId" name="associationType.id" aria-controls="dt_gal" style="cursor:pointer" class="span8">
								<option value="">请选择..</option>
								<#if associationTypeDicList ??>
									<#list associationTypeDicList as param>
										<#if abm.associationType ?? &&  abm.associationType.id == param.id >
											<option  value="${param.id}" selected="selected">${param.name?html}</option>
										<#else>
											<option value="${param.id}" >${param.name?html}</option>
										</#if>
									</#list>
								</#if>
							   </select>
							</div>
						</div>
						<div class="span4">
						    <span class="formTitle">社团名称</span>
							<div class="span9">
							    <input id="associationName" name="associationName" class="span8" value="${(abm.associationName!"")?html}" maxlength="200"/>
							</div>
						</div>
					</div>
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">是否注销</span>
							<div class="span9">
								 <select size="1" id="isCancelId" name="isCancel.id" aria-controls="dt_gal" style="cursor:pointer" class="span8">
										<option value="">请选择..</option>
										<#if isNoList ??>
											<#list isNoList as param>
												<#if abm.isCancel ?? &&  abm.isCancel.id == param.id >
													<option  value="${param.id}" selected="selected">${param.name?html}</option>
												<#else>
													<option value="${param.id}" >${param.name?html}</option>
												</#if>
											</#list>
										</#if>
								 </select>
							</div>
						</div>
						<div class="span4" style="padding-left:62px;">
			                <button class="btn btn-info"  type="submit">查 询</button>
			                <button class="btn btn-info" type="button" onclick="comp.clearForm('associationServiceForm')">清 空</button>
			            </div>
					</div>
					
					<div class="span12">
						<input type="hidden" id="selectedBox" name="selectedBox"/>
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
								    <th width="5%">序号</th>
									<th width="15%">社团名称</th>
									<th width="8%">社团编号</th>
									<th width="10%">所属学院</th>
									<th width="8%">社团类型</th>
									<th width="8%">社团人数</th>
									<th width="8%">是否十佳</th>
									<th width="8%">星级(星)</th>
									<th width="8%">社团性质</th>
									<th width="8%">是否注销</th>
									<th width="6%">操作</th>
								</tr>
							</thead>
							<tbody>
							<#if page??>	
							<#list page.result as p>
							<tr>		
							    <td>
								    <div align="center">${p_index+1}</div>
							    </td>
								<td class="autocut">
									<a href="${rc.contextPath}/association/maintain/opt-edit/viewAssociationInfo.do?associationId=${(p.id)?html}" target='_blank' class="sepV_a" title="查看">
									${(p.associationName!"")?html}</a>
								</td>
								<td class="autocut">${(p.associationCode!"")?html}</td>
								<td class="autocut"><#if p.college??>${(p.college.name!"")?html}</#if></td>
								<td class="autocut"><#if p.associationType??>${(p.associationType.name!"")?html}</#if></td>
								<td class="autocut">${(p.memberNums!"")?html}</td>
								<td class="autocut"><#if p.isTopten??>${(p.isTopten.name!"")?html}</#if></td>
								<td class="autocut">${(p.honorRating!"")?html}</td>
								<td class="autocut"><#if p.isMajor??>${ p.isMajor.name}</#if></td>
								<td class="autocut"><#if p.isCancel??>${(p.isCancel.name!"")?html}</#if></td>
								<td class="autocut">
						             <#if p.isCancel?? && p.isCancel.code=="N">
						             	<#if user_key.optMap??>
											<#if user_key.optMap['update']??>
												<a href="javascript:void(0);"  target='_self' class="sepV_a" title="荣誉维护" onclick="getMemberHonor('${(p.id!"")?html}')"><i class="icon-edit"></i></a>
							                </#if>
											<#if user_key.optMap['approve']??>
												<a href="javascript:void(0);"  target='_self' class="sepV_a" title="社员荣誉审核" onclick="getMemberHonor('${(p.id!"")?html}')"><i class="icon-user"></i></a>
							                </#if>
							            </#if>
									</#if>
									<#if isTeacher ?? && isTeacher == true>
										<a href="${rc.contextPath}/association/service/opt-query/viewMemberHonorList.do?associationId=${p.id}" target="_blank" class="sepV_a" title="社员荣誉查看"><i class="icon-list-alt"></i></a>
									<#else>
										<a href="javascript:void(0);" class="sepV_a" title="社员荣誉查看" onclick="viewMemberHonor('${(p.id!"")?html}')"><i class="icon-list-alt"></i></a>
									</#if>
								</td>
							</tr>
							</#list>
						 </#if> 
						</tbody>
						</table>
						 <#assign pageTagformId="associationServiceForm"/>
						 <input id="pageTotalCount" name="pageTotalCount" type="hidden"  value="${page.totalCount}"/>
						 <#include "/page.ftl">
					</div>
				</div>
			</div>
			 
		</div> 
	</div>
</div>


<#--查看 -->
<div class="modal hide fade" id="view_id">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3 id="view_title"></h3>
	</div>
	<div class="modal-body" id="view_body">
		
	</div>
	<div class="modal-footer">
		<a href="#" class="btn" data-dismiss="modal">关闭</a>
	</div>
</div>

<script>
function getMemberHonor(associationId){
	window.location.href="${rc.contextPath}/association/service/opt-query/getMemberHonorList.do?associationId="+associationId;
}

//学生查看荣誉列表
function viewMemberHonor(id){
	if(id)
	{
		$("#view_title").html("社员荣誉查看");
  		comp.showModal("view_id","800px","-200px 0 0 -350px");
  		$("#view_body").empty();
		$("#view_body").load("${rc.contextPath}/association/service/nsm/viewMemberHonor.do?id="+id);
	}
}

</script>
</body>
</html>