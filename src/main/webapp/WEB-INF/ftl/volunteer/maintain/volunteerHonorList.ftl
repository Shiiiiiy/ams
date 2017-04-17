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
    		<form  id="volunteerHonorForm"  action="${rc.contextPath}/volunteer/maintainHonor/opt-query/pageVolunteerHonorList.do" method="post">
				<div class="span12">
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学年</span>
						    <select size="1" class="span6" id="honorYear" name="honorYear.id" aria-controls="dt_gal" >
					          <option value="" />请选择..</option>
								<#if yearList??>
									<#list yearList as d>
										<#if vhm?? && vhm.honorYear?? && vhm.honorYear.id==d.id >
											<option  value="${d.id}" selected="selected" />${d.name?html}</option>
										<#else>
											<option value="${d.id}" />${d.name?html}</option>
										</#if>
									</#list>
								 </#if>
				         	</select>
						 </div>
						 
						 <div class="span4">
						 	 <span class="formTitle">学期</span>
								<select size="1" class="span6" id="honorTerm" name="honorTerm.id" aria-controls="dt_gal" >
									<option value="" >请选择</option>
									<#if termList??>
										<#list termList as t>
											<#if vhm?? && vhm.honorTerm?? && vhm.honorTerm.id==t.id >
												<option value="${t.id}"  selected="selected">${t.name?html}</option>
											<#else>
												<option value="${t.id}">${t.name?html}</option>
											</#if>
										</#list>
									</#if>
								</select>	
						 </div>
						  <div class="span4">
						 	 <span class="formTitle">荣誉级别</span>
								<select size="1" class="span6" id="honorLevel" name="honorLevel.id" aria-controls="dt_gal" >
									<option value="" >请选择</option>
									<#if honorTypeList??>
										<#list honorTypeList as h>
											<#if vhm?? && vhm.honorLevel?? && vhm.honorLevel.id==h.id >
												<option value="${h.id}"  selected="selected">${h.name?html}</option>
											<#else>
												<option value="${h.id}">${h.name?html}</option>
											</#if>
										</#list>
									</#if>
								</select>	
						 </div>
						 <div class="row-fluid">
								<div class="span4">
									<span class="formTitle">荣誉名称</span>
								   	<input id="honorName" name="honorName" class="span6" <#if vhm??  > value="${((vhm.honorName)!'')?html}"</#if>/>
						 		</div>
						 		<div class="span4">
						 			<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						 		
						 			<input type="button" class="btn btn-info"  onclick="selectHonorInfo();" value="查 询"/>
		              				<input type="button" class="btn btn-info"  onclick="comp.clearForm('volunteerHonorForm')" value="清 空"/>
						 		</div>
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
				                    	 <button class="btn btn-info" type="button" onclick="addHonor()">增加荣誉</button>
										&nbsp;&nbsp;<input class="btn btn-info" type="button" onclick="javascript:window.location.href='${rc.contextPath}/volunteer/maintain/opt-query/getVolunteerList.do'" value="返回"/>
										
									</div>
								</div>
							</div>
						</div>
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
							<thead>
								<tr>
								    <th width="3%">序号</th>
									<th width="6%">荣誉学年</th>
									<th width="6%">荣誉学期</th>
									<th width="12%">荣誉名称</th>
									<th width="6%">荣誉时间</th>
									<th width="6%">荣誉级别</th>
									<th width="3%">操作</th>
								</tr>
							</thead>
							<tbody>
								<#if page??>	
									<#list page.result as p>
										<tr>		
										    <td class="autocut">${p_index+1} </td>
		                                    <td class="autocut">${(p.honorYear.name!"")}</td>
		                                    <td class="autocut">${(p.honorTerm.name!"")}</td>
											<td class="autocut">${(p.honorName!"")}</td>
											<td class="autocut"><#if p.honorTime??>${p.honorTime?date}</#if></td>
											<td class="autocut">${(p.honorLevel.name!"")}</td>
											<td class="autocut">
												<#if user_key.optMap['update']??>
									   				<a href="${rc.contextPath}/volunteer/maintainHonor/opt-edit/editHonor.do?id=${p.id}" class="sepV_a" title="志愿者荣誉修改"><i class="icon-edit"></i></a>
												</#if>
												<#if user_key.optMap['del']?? >
										   			<a href="javascript:void(0);" onclick="deleteHonor('${p.id!""}');" class="sepV_a" title="删除志愿者荣誉信息"><i class="icon-trash"></i></a>
												</#if> 	
											</td>
										</tr>
									</#list>
								 </#if> 
							</tbody>
						</table>
						 <#assign pageTagformId="volunteerHonorForm"/>
						 <input id="pageTotalCount" name="pageTotalCount" type="hidden"  value="${page.totalCount}"/>
						 <#include "/page.ftl">
					</div>
				</div>
			</div> 
		</div> 
	</div>
</div>

<script>
	//查询
	function selectHonorInfo(){
		$("#volunteerHonorForm").submit();
	}
  	function addHonor(){
  		window.location.href="${rc.contextPath}/volunteer/maintainHonor/opt-edit/editHonor.do";
  
  	}
	//删除操作
	function deleteHonor(id)
	{
		comp.confirm("确定要删除该荣誉的信息吗？", function(result) {
		
	    	if(!result)
	    		return;  
			$.post("${rc.contextPath}/volunteer/maintainHonor/opt-del/deleteHonor.do", { id: id }, function(data){
				
				if(data === "success")
				{
					comp.message(name +"删除成功！","info");
					window.location.href="${rc.contextPath}/volunteer/maintainHonor/opt-query/pageVolunteerHonorList.do";
				}
			    
			   },"text");
		}); 
	}
  
</script>
</body>
</html>