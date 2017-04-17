<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<script src="${rc.contextPath}/js/jquery.form.js"></script>
	<script>
    $(document).ready(function(){
	 	 //荣誉批量审核
	 	$("#confirm-button").click( function () {
	 		comp.message("荣誉批量审核");
	 	 });
	});
	</script>
</head>
<body>
<div id="contentwrapper">
    <div class="main_content">   
    	   <div class="row-fluid">	
    		<form  id="associationServiceForm"  action="${rc.contextPath}/association/maintain/opt-query/getAssociationList.do" method="post">
				<div class="span12">
					<div class="row-fluid">
						<div class="span4">
						    <span class="formTitle">学院</span>
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
					    <div class="span12">
							<div class="btnCenter">
				                <button class="btn btn-info"  type="submit">查 询</button>
				                <button class="btn btn-info" type="button" onclick="comp.clearForm('associationServiceForm')">清 空</button>
				            </div>
		               </div>
					 </div>
						 
					</div>
				</div>
    			<div>
					<div class="span12">
						<input type="hidden" id="selectedBox" name="selectedBox"/>
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
											<#if user_key.optMap['confirm']?? >
												<button class="btn btn-info" type="button" id="confirm-button">批量同意</button>
											</#if>
										</#if>
									</div>
								</div>
							</div>
						</div>
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
							<thead>
								<tr>
								    <th width="4%">
								    	<div align="center">
								    			<input type="checkbox" id="mainBox" onclick="comp.selectAllCheckbox('mainBox','curAssociation')"/>
								    	</div>
								    </th>
									<th width="12%">所属学院</th>
									<th width="8%">社团编号</th>
									<th width="12%">社团名称</th>
									<th width="8%">社团类型</th>
									<th width="8%">社团人数</th>
									<th width="8%">申请时间</th>
									<th width="8%">是否十佳</th>
									<th width="8%">星级(星)</th>
									<th width="8%">社团性质</th>
									<th width="8%">是否注销</th>
									<th width="8%">操作</th>
								</tr>
							</thead>
							<tbody>
							<#if page??>	
							<#list page.result as p>
							<tr>		
							    <td>
								    <div align="center">
								    <#if (p.isValid?? && p.isValid.code=='Y')>
								    	<input type="checkbox" name="curAssociation" value="${(p.id!"")?html}"/>
								    </#if>
								    </div>
							    </td>
								<td class="autocut"><#if p.college??>${(p.college.name!"")?html}</#if></td>
								<td class="autocut">${(p.associationCode!"")?html}</td>
								<td class="autocut">
									<a href="${rc.contextPath}/association/maintain/opt-edit/viewAssociationInfo.do?associationId=${(p.id)?html}"  target='_self' class="sepV_a" title="查看">
									${(p.associationName!"")?html}</a>
								</td>
								<td class="autocut"><#if p.associationType??>${(p.associationType.name!"")?html}</#if></td>
								<td class="autocut">${(p.memberNums!"")?html}</td>
								<td class="autocut">${(p.applyTime!"")?html}</td>
								<td class="autocut"><#if p.isTopten??>${(p.isTopten.name!"")?html}</#if></td>
								<td class="autocut">${(p.honorRating!"")?html}</td>
								<td class="autocut"><#if p.isMajor??><#if p.isMajor.code=='Y'>专业<#elseif p.isMajor.code=='N'>非专业</#if></#if></td>
								<td class="autocut"><#if p.isCancel??>${(p.isCancel.name!"")?html}</#if></td>
								<td class="autocut">
						             <#if user_key.optMap??>
										<#if user_key.optMap['update']??>
											<a href="#"  target='_self' class="sepV_a" title="荣誉维护" onclick="comp.message('荣誉维护')"><i class="icon-user"></i></a>
						                </#if>
										<#if user_key.optMap['approve']??>
											<a href="#"  target='_self' class="sepV_a" title="荣誉审核" onclick="comp.message('荣誉审核')"><i class="icon-ok"></i></a>
						                </#if>
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

</body>
</html>