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
			function selectApproveSetWork(){
				$("#setWorkApproveQuery").submit();
			}
		</script>
    </head>
<body>
<div id="contentwrapper">
   		<div class="main_content">   
    	   <div class="row-fluid">
    		<form  id="setWorkApproveQuery"  action="${rc.contextPath}/sponsor/approveSetWork/opt-approve/approveSetWorkList.do" method="post">
				<div class="span12">			
					<div class="row-fluid"> 
					 <div class="span4">
					   	<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学年</span>
						<select size="1"  class="span6"  id="schoolYear" name="schoolYear.id" aria-controls="dt_gal">
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
						<select size="1" class="span6" id="term" name="term.id" aria-controls="dt_gal" >
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
						<input  id="orgId" name="org.id" type="hidden" <#if workOrg?? && workOrg.org??> value="${((workOrg.org.id)!'')?html}"</#if> />
						<input  class="span6" id="orgName" name="org.name" <#if workOrg?? && workOrg.org??> value="${((workOrg.org.name)!'')?html}"</#if> readonly/>
						<a style="cursor:pointer" onclick="selectOrg()">选择</a>&nbsp;	
					</div>
				  </div>
				  <div class="row-fluid"> 
					 <div class="span4">
						 	<span class="formTitle">审核状态</span>
							<select size="1" name="processStatus" aria-controls="dt_gal" class="span6">
								<option value="" >请选择..</option>
									<#list processStatusMap?keys as c>
										<#if workOrg ?? && workOrg.processStatus?? && workOrg.processStatus == c >
											<option value="${c}" selected >${processStatusMap[c]}</option>
										<#else>
											<option value="${c}">${processStatusMap[c]}</option>
										</#if>
									</#list>
							</select>	
				   	 </div>
				   	  <div class="span4">
				   	  	 <span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
				   	  	 <input type="button"  class="btn btn-info" onclick="selectApproveSetWork()" value="查 询">
	              		 <input type="button" class="btn btn-info"  onclick="comp.clearForm('setWorkApproveQuery')" value="清 空"/>
				   	  </div>
				  </div>
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
		                        		
		              				</div>
				                </div>
				            </div>
				        </div>
		       
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
							<thead>
								<tr>
									<th width="6%">序号</th>
									<th width="24%">用工部门</th>
									<th width="10%">学年</th>
									<th width="10%">学期</th>
									<th width="10%">岗位个数</th>
									<th width="10%">工作时间</th>
									<th width="10%">预算金额</th>
									<th width="10%">审核状态</th>
									<th width="10%">操作</th>
								</tr>
							</thead>
							<tbody>
								<#if page??>
									<#list page.result as p>
									
										<tr>
											<td class="autocut">${p_index+1}</td>
											<td class="autocut"><a  target="_blank" href="${rc.contextPath}/sponsor/setWork/opt-view/viewSetWork.do?workOrgId=${(p.workOrgId)!''}"  title="查看岗位信息"> ${(p.org.name)!""}</a></td>
											<td class="autocut">${((p.schoolYear.name)!'')?html}</td>
											<td class="autocut">${(p.term.name!'')?html}</td>
											<td class="autocut">${(p.workJobNumber)?html}</td>
											<td class="autocut">${(p.workTime!'')?html}</td>
											<td class="autocut">${(p.budgetSalary!'')?html}</td>
											<td class="autocut">
												<#if p.processStatus??>
													<#if p.nextApprover?? && userId??&& p.nextApprover.id==userId  >待审核
													<#elseif p.processStatus??>${processStatusMap[p.processStatus]}
									    			</#if>
									   			<#else>
													待审核
												</#if>
											</td>
											<td >
												<#if user_key.optMap??>
													 <#if user_key.optMap['approve']??>
														<#if p.nextApprover?? && userId??&& p.nextApprover.id==userId >
															<a  href="${rc.contextPath}/sponsor/approveSetWork/opt-edit/editApproveSetWork.do?workOrgId=${p.workOrgId}" class="sepV_a" title="审核"><i class="icon-check"></i></a>
													  	</#if>
													 </#if>
		                                    	</#if>
											</td>
											</tr>
											
										</#list> 
									</#if>
								</tbody>
						</table>
						
						<#assign pageTagformId="setWorkApproveQuery"/>
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