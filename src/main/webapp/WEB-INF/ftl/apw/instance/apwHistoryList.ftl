<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!--ztree-->
		<link rel="stylesheet" href="${rc.contextPath}/css/bdp_comp.css" type="text/css">
		<link rel="stylesheet" href="${rc.contextPath}/lib/ztree/css/zTreeStyle/zTreeStyle.css" type="text/css">
		<script type="text/javascript" src="${rc.contextPath}/lib/ztree/js/jquery.ztree.core-3.5.js"></script>
		<script type="text/javascript" src="${rc.contextPath}/lib/ztree/js/jquery.ztree.excheck-3.5.js"></script>
		<script type="text/javascript" src="${rc.contextPath}/lib/ztree/js/jquery.ztree.exedit-3.5.js"></script>
		<!-- multiselect -->
   		<link rel="stylesheet" href="${rc.contextPath}/lib/multiselect/css/multi-select.css" />
		<script src="${rc.contextPath}/lib/multiselect/js/jquery.multi-select.min.js"></script>
		<script src="${rc.contextPath}/js/bdp_comp.js"></script>
        <!-- ajax form-->
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
		<script language="javascript" type="text/javascript" src="/productoa/lib/My97DatePicker/WdatePicker.js"></script>
		<!-- sticky messages -->
	    <script src="${rc.contextPath}/lib/sticky/sticky.min.js"></script>
	    <script>
	    	//选人控件--单选
			function selectUsers(){
			  	_initValues(null,$("#userIds").val());	  
				_queryUserSubmit();
				comp.showModal("_selectUserModal");
				
			}
				function cleanUser(){
				$("#userName").val("");
				$("#initiatorId").val("");
			}
	    
	    function setUserSelectValue(userInfo,flag){
				   var sta=$("#_userQuery_status").val();
				   var name = userInfo[0].userName;	  
			       var id = userInfo[0].userId;
			       if(name.length>0){
				   	   name = name.split("/");    		 
				   }
				   $("#userName").val(name);
				   $("#initiatorId").val(id);
			}
        </script>
    </head>
    <body>
<div id="contentwrapper">
    <div class="main_content">   
    	   <div class="row-fluid">	
			    <form  id="apwHistoryForm" class="form_validation_reg"  action="${rc.contextPath}/apw/history/opt-query/getProcessHistory.do" method="post">
				<div class="span12">			
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">发起人</span>
							<input id="userName" name="userName" style="width:150px;cursor:pointer;background-color:#eee;border-color:#ddd;" value="${(userName!"")?html}" readOnly/>
							<input id="initiatorId" name="initiatorId" type="hidden" value="" readOnly/>
							<a href="###" onclick="selectUsers()"  title="选择" ><i class="icon-search"></i></a>&nbsp;
							<a style="cursor:pointer" onclick="cleanUser()" title="清除"><i class="icon-flush"></i></a>
						</div>
						<div class="span4">
							<span class="formTitle">流程状态</span>
							<select size="1" id="processStatus" name="processStatus" aria-controls="dt_gal"  class="span6 selectoption">
								    <option value="">请选择</option>
								      <#if processStatusList??>
									     <#list processStatusList as d>
									      <#if processStatus??> 
									           <#if processStatus==d.id>
									            <option value="${d.id}" selected="selected">${d.name?html}</option>
									            <#else>
									            <option value="${d.id}">${d.name?html}</option>
									           </#if>
									       <#else>
									           <option value="${d.id}">${d.name?html}</option>
									      </#if>
										</#list>
									</#if>
							</select>
						</div>
						<div class="span4">
							<span class="formTitle">提交日期</span>
							 <input type="text" id="startTime" name="startTime" style="width:92px;cursor:pointer" value="${(startTime!"")?html}"   class="Wdate" onclick="WdatePicker({skin:'whyGreen'});" readOnly/> 一
                             <input type="text" id="endTime" name="endTime" style="width:92px;cursor:pointer" value="${(endTime!"")?html}"   class="Wdate" onclick="WdatePicker({skin:'whyGreen'});" readOnly/> 
						</div>
					</div>
		            <div class="btnCenter">
		              <button class="btn btn-info">查&nbsp;询</button>
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
											<th width="9%"><div align="center" valign="center">序号</div></th>
											<th width="13%" ><div align="center">流程定义</div></th>
											<th width="13%" ><div align="center">审批环节</div></th>
											<th width="13%" ><div align="center">发起人</div></th>
											<th width="13%" ><div align="center">发起时间</div></th>
											<th width="13%" ><div align="center">审批人</div></th>
											<th width="13%" ><div align="center">审批状态</div></th>
											<th width="13%" ><div align="center">审批时间</div></th>
									</tr>
								</thead>
								<tbody>
								<#if page??>	
									<#list page.result as p>
										<tr>
												<td><div align="center">${p_index+1}</div></td>
												<td class="autocut"><div align="center">${(p.flowDefinePo.processName!"")?html}</div></td>
												<td class="autocut"><div align="center">${p.taskName!""}</div></td>
												<td class="autocut"><div align="center">${(p.initiator.name!"")?html}</div></td>
												<td class="autocut"><div align="center">${(p.submitTime!"")?string("yyyy-MM-dd")}</div></td>
												<td class="autocut"><div align="center">${(p.approver.name!"")?html}</div></td>
												<td class="autocut"><div align="center">${(p.approveResultDic.name!"")?html}</div></td>
												<td class="autocut"><div align="center"><#if p.approveTime??>${(p.approveTime!"")?string("yyyy-MM-dd")}</#if></div></td>
										</tr>
									</#list>
								 </#if> 
								</tbody>
							</table>
						
						</div>
						 <#assign pageTagformId="apwHistoryForm"/>
						 <!--用于用户导出 -->
						<input id="pageTotalCount" name="pageTotalCount" type="hidden"  value="${page.totalCount}"/>
						 <#include "/page.ftl">
					</div>
				</div>
				
		</div> 
	</div>
</div>
<#include "/user/comp/queryUserRadioModal.ftl">
</body>
</html>