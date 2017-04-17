<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<script>
			function addSetWork(){
				
				window.location.href="${rc.contextPath}/sponsor/setWork/opt-add/editSetWork.do";
			}
			//查询
			function selectStudentInfo(){
			    $("#workOrgQuery").attr("action","${rc.contextPath}/sponsor/setWork/opt-query/queryWorkOrgList.do");
				$("#workOrgQuery").submit();
			}
		</script>
    </head>
<body>
<div id="contentwrapper">
   		<div class="main_content">   
		 <div class="row-fluid">	
    		<form  id="workOrgQuery"  action="${rc.contextPath}/sponsor/setWork/opt-query/queryWorkOrgList.do" method="post">
				<div class="span12">
				<div class="row-fluid">
					<div class="span4">
						<span class="formTitle">学年</span>
					
							<select size="1" id="schoolYear" name="schoolYear.id" aria-controls="dt_gal" class="span6">
							 	<option value="">请选择..</option>
								<#if yearList ??>
									<#list yearList as d>
										<#if workOrg?? && workOrg.schoolYear ?? && workOrg.schoolYear.id==d.id >
										    <option  value="${d.id}" selected="selected" >${d.name?html}</option>
										<#elseif nowYearDic?? && d.id==nowYearDic.id>
											<option value="${d.id}" selected="selected">${d.name}</option>
										<#else>
											<option value="${d.id}" >${d.name}</option>	
										</#if>
									</#list>
								</#if>
						    </select>
						
					</div>
					
					<div class="span4">
						<span class="formTitle">学期</span>
							<select size="1" id="term" name="term.id" aria-controls="dt_gal"  class="span6">
								<option value="" >请选择</option>
								<#if termList??>
									<#list termList as t>
										<#if workOrg?? && workOrg.term??&& workOrg.term.id==t.id >
											<option value="${t.id}"  selected="selected">${t.name?html}</option>
										<#else>
											<option value="${t.id}">${t.name?html}</option>
										</#if>
									</#list>
								</#if>
							</select>						
					</div>
					<div class="span4">
						<span class="formTitle">用工部门</span>
					
							<#if userOrg ?? &&  userOrg.id ??  >
								<input  id="orgId" name="org.id" type="hidden" value="${((userOrg.id)!'')?html}"/>
								<input  class="span6 notClear" id="org.name" name="org.name" value="${userOrg.name}" readonly/>
							<#else>
								<input  id="orgId" name="org.id" type="hidden" <#if workOrg?? && workOrg.org??> value="${((workOrg.org.id)!'')?html}"</#if> />
								<input  class="span6" id="orgName" name="org.name" <#if workOrg?? && workOrg.org??> value="${((workOrg.org.name)!'')?html}"</#if> readonly/>
								<a style="cursor:pointer" onclick="selectOrg()">选择</a>&nbsp;	
							</#if>
					
					</div>
					</div>
	            <div class="btnCenter">
	              <button class="btn btn-info">查 询</button>
	              <#if userOrg ?? &&  userOrg.id ?? && userOrg.id != studentOfficId >
	           		  <input type="button" class="btn btn-info"  onclick="clearConditionForm()" value="清 空"/>
	              <#else>
	                  <input type="button" class="btn btn-info"  onclick="comp.clearForm('workOrgQuery')" value="清 空"/>
	              </#if>
	            </div>
			</form> 
		</div>
			
			<div class="row-fluid">
					<div class="span12">
						<h5 class="heading"></h5>
						<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
				        <div class="row">
				            <div class="span10">
				                <div class="dt_actions">
				                    <div class="row-fluid">
		                        		<#if user_key.optMap??>
											<#if user_key.optMap['add']?? >
		              							 	<button class="btn btn-info" type="button" onclick="addSetWork()">新 增</button>
		              						</#if>
		              						<#if user_key.optMap['formCopy']?? >
		              								<button class="btn btn-info" type="button" onclick="javascript:window.location.href='${rc.contextPath}/sponsor/setWork/opt-formCopy/copySetWork.do'">快速设置</button>
		              							
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
							<th width="22%">用工部门</th>
							<th width="12%">学年</th>
							<th width="12%">学期</th>
							<th width="10%">岗位个数</th>
							<th width="10%">工作时间</th>
							<th width="10%">预算金额</th>
							<th width="10%">状态</th>
							<th width="8%">操作</th>
						</tr>
					</thead>
					<tbody>
						<#if page??>
							<#list page.result as p>
							
								<tr>
									<td class="autocut">${p_index+1}</td>
									<td class="autocut"><a target="_blank"  href="${rc.contextPath}/sponsor/setWork/opt-view/viewSetWork.do?workOrgId=${(p.workOrgId)!''}"  title="查看岗位信息"> ${(p.org.name)!""}</a></td>
									<td class="autocut">${((p.schoolYear.name)!'')?html}</td>
									<td class="autocut">${(p.term.name!'')?html}</td>
									<td class="autocut">${(p.workJobNumber)?html}</td>
									<td class="autocut">${(p.workTime!'')?html}</td>
									<td class="autocut">${(p.budgetSalary!'')?html}</td>
									<td class="autocut">
										<#if p.status??&& p.status.id?? &&p.status.code=="SUBMIT" >
											<#if p.processStatus??>
												${processStatusMap[p.processStatus]}
								   			<#else>待审核</#if>
										<#else>
											${(p.status.name)!""}
										</#if>
									</td>
									<#--
									<td class="autocut">${ p.processStatus}
										<#if p.processStatus??>
											${processStatusMap[p.processStatus]}
							   			<#else>
							    			<#if  p.status.code=="SUBMIT" >
											待审核
							    			</#if>
										</#if>
									</td>-->
									<td >
										<#if user_key.optMap['update']?? && ((p.status?? && p.status.code="SAVE")||(p.processStatus?? && p.processStatus=="REJECT") )>
											<a href="${rc.contextPath}/sponsor/setWork/opt-update/editSetWork.do?workOrgId=${p.workOrgId}&isUpdate=true" class="sepV_a" title="编辑岗位"><i class="icon-edit"></i></a>
										</#if>
										<#if user_key.optMap['del']?? && p.status?? && p.status.code="SAVE" && !p.processStatus?? >
											<a href="javascript:void(0);" onclick="deleteWorkOrg('${(p.org.name)!""}','${p.workOrgId!""}');" class="sepV_a" title="删除部门岗位"><i class="icon-trash"></i></a>
										</#if>
									</td>
									</tr>
									
								</#list> 
							</#if>
						</tbody>
					
						</table>
						 <#assign pageTagformId="workOrgQuery"/>
						 <#include "/page.ftl">
					</div>
				</div>
			</div> 
		</div> 
	</div>
</div>
<#-- 脚本开始 -->

<!--组织机构选择 -->
<div class="modal hide fade" id="orgModal">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3>组织机构选择</h3>
	</div>
	<div class="modal-body">
		<div class="row-fluid">
				<ul id="orgTree" class="ztree "></ul>
		</div>
	</div>
	<div class="modal-footer">
		<a href="#" class="btn btn" data-dismiss="modal">取消</a>
		<a href="#" class="btn btn-info" data-dismiss="modal" onclick="getOrg()">确定</a>
	</div>
</div>


<script>

//删除操作
	function deleteWorkOrg(workOrgName,workOrgId)
	{
		comp.confirm("删除【"+workOrgName+"】部门 后，其部门下的所有岗位将全部删除，确定要删除吗？", function(result) {
		
        	if(!result)
        		return;  
    		$.post("${rc.contextPath}/sponsor/setWork/opt-del/deleteWorkOrg.do", { workOrgId: workOrgId }, function(data){
    			
    			if(data === "success")
    			{
    				comp.message("删除成功！","info");
    				window.location.href="${rc.contextPath}/sponsor/setWork/opt-query/queryWorkOrgList.do";
    			}
			    
			   },"text");
		}); 
	}
$(function(){
	comp.orgSingleSelect("orgTree");
});	
	
//组织机构选择
function selectOrg(){
	var treeObj = $.fn.zTree.getZTreeObj("orgTree");
	if(treeObj.getSelectedNodes().length==0){
		var node = treeObj.getNodes()[0];
		treeObj.selectNode(node);
	}
	comp.showModal("orgModal");		
}
function getOrg(){
	var treeObj = $.fn.zTree.getZTreeObj("orgTree");
	var orgName=treeObj.getSelectedNodes()[0].name;
	var orgId=treeObj.getSelectedNodes()[0].id;
	var level=treeObj.getSelectedNodes()[0].level;
	if(level!=0){
		$("#orgName").val(orgName);
		$("#orgId").val(orgId);
		comp.hideModal("orgModal");
	}else{
		$("#orgName").val("全部");
		$("#userOrgId").val("");
		comp.hideModal("orgModal");
	}
}	

//清空操作
function clearConditionForm()
{
	$("#schoolYear").val("");
	$("#term").val("");
}		
	

</script>
</body>
</html>