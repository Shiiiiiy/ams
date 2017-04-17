<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
    <link rel="stylesheet" href="${rc.contextPath}/lib/My97DatePicker/skin/WdatePicker.css" />
	<script type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
    <script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
    <!-- animated progressbars -->
    <script src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script>
    <script src="${rc.contextPath}/js/apw/apw_check.js"></script>
    <script src="${rc.contextPath}/js/jquery.form.js"></script>
    <script src="${rc.contextPath}/js/common/common_approve.js"></script>
</head>
<body>
<div id="contentwrapper">
    <div class="main_content">   
    	   <div class="row-fluid">	
    		<form  id="volunteerServiceForm"  action="${rc.contextPath}/volunteer/maintainService/opt-query/pageVolunteerServiceList.do" method="post">
				<div class="span12">
					<div class="row-fluid">
						<div class="span4">
							 <span class="formTitle">服务日期</span>
						     <input type="text" id="serviceDate" name="serviceDateStr"    style="cursor:pointer;width:155px;" <#if vsm?? && vsm.serviceDate??>value="${vsm.serviceDate?date}"</#if>
											class="Wdate"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',skin:'whyGreen',el:$dp.$('serviceDate')})" style="cursor:pointer"  />
						</div>
						<div class="span4">
							 <span class="formTitle">服务时长(小时)</span>
							 <input id="serviceHour"  class="span6"  name="serviceHourStr"  <#if vsm?? &&vsm.serviceHour?? &&vsm.serviceHour!=0.0>value="${(vsm.serviceHour!"")}"</#if>  />
							 
						</div>
						<div class="span4">
							  <span class="formTitle">服务记录</span>
							  <input id="serviceRecord"  class="span6"  name="serviceRecord"  <#if vsm?? &&vsm.serviceRecord??>value="${(vsm.serviceRecord!"")}"</#if>  />
						</div>
					</div>
					<div class="btnCenter">
			 			<input type="button" class="btn btn-info"  onclick="selectServiceInfo();" value="查 询"/>
          				<input type="button" class="btn btn-info"  onclick="comp.clearForm('volunteerServiceForm')" value="清 空"/>
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
				                    	 <button class="btn btn-info" type="button" onclick="addService()">增加服务记录</button>
										&nbsp;&nbsp;<input class="btn btn-info" type="button" onclick="javascript:window.location.href='${rc.contextPath}/volunteer/maintain/opt-query/getVolunteerList.do'" value="返 回"/>
									</div>
								</div>
							</div>
						</div>
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
							<thead>
								<tr>
								    <th width="2%">序号</th>
									<th width="6%">服务日期</th>
									<th width="6%">服务时长(小时)</th>
									<th width="6%">服务人数</th>
									<th width="12%">服务记录</th>
									<th width="3%">操作</th>
								</tr>
							</thead>
							<tbody>
								<#if page??>	
									<#list page.result as p>
										<tr>		
										    <td class="autocut">${p_index+1} </td>
		                                    <td class="autocut"><#if p.serviceDate??>${p.serviceDate?date} </#if></td>
		                                    <td class="autocut"><#if p.serviceHour??>${p.serviceHour} </#if></td>
		                                    <td class="autocut"><#if p.serviceHour??>${p.serviceStuNums!''} </#if></td>
											<td class="autocut"><#if p.serviceRecord??>${p.serviceRecord} </#if></td>
											<td class="autocut">
												<#if user_key.optMap['update']??>
									   				<a href="${rc.contextPath}/volunteer/maintainService/opt-edit/editService.do?id=${p.id}" class="sepV_a" title="志愿者服务修改"><i class="icon-edit"></i></a>
												</#if>
												<#if user_key.optMap['del']?? >
										   			<a href="javascript:void(0);" onclick="deleteService('${p.id!""}');" class="sepV_a" title="删除志愿者服务信息"><i class="icon-trash"></i></a>
												</#if> 	
											</td>
										</tr>
									</#list>
								 </#if> 
							</tbody>
						</table>
						 <#assign pageTagformId="volunteerServiceForm"/>
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
	function selectServiceInfo(){
		$("#volunteerServiceForm").submit();
	}
  	function addService(){
  		window.location.href="${rc.contextPath}/volunteer/maintainService/opt-edit/editService.do";
  
  	}
	//删除操作
	function deleteService(id)
	{
		comp.confirm("确定要删除该服务的信息吗？", function(result) {
		
	    	if(!result)
	    		return;  
			$.post("${rc.contextPath}/volunteer/maintainService/opt-del/deleteService.do", { id: id }, function(data){
				
				if(data === "success")
				{
					comp.message(name +"删除成功！","info");
					window.location.href="${rc.contextPath}/volunteer/maintainService/opt-query/pageVolunteerServiceList.do";
				}
			    
			   },"text");
		}); 
	}
  
</script>
</body>
</html>