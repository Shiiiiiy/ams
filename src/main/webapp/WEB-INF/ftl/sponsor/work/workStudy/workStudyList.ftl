<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="${rc.contextPath}/css/starSelect.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${rc.contextPath}/js/common/cascadecommon.js"></script>
    </head>
    <body>
		<div id="contentwrapper">
   		<div class="main_content">   
    	   <div class="row-fluid">	
    		<form  id="workStudyQuery"  action="${rc.contextPath}/sponsor/workStudy/opt-query/queryWorkStudyList.do" method="post">
				<div class="span12">			
					 <div class="row-fluid">
						<div class="span4">
							 <span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学年</span>
						    <select size="1" class="span6" id="schoolYear" name="applyFile.schoolYear.id" aria-controls="dt_gal" >
					          <option value="" />请选择..</option>
								<#if yearList??>
									<#list yearList as d>
										<#if workApply?? && workApply.applyFile?? &&  workApply.applyFile.schoolYear ?? && workApply.applyFile.schoolYear.id==d.id >
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
								<select size="1" class="span6" id="term" name="applyFile.term.id" aria-controls="dt_gal" >
									<option value="" >请选择</option>
									<#if termList??>
										<#list termList as t>
											<#if workApply?? && workApply.applyFile ??&& workApply.applyFile.term??&& workApply.applyFile.term.id==t.id >
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
						 	<#if userOrg ?? &&  userOrg.id ?? && userOrg.id != studentOfficId >
								<input  id="orgId" name="org.id" type="hidden" class="span6" value="${((userOrg.id)!'')?html}"/>
								<input class="span6" id="org.name" name="org.name" class="span6" value="${userOrg.name}" readonly/>
							<#else>
								<input  id="orgId" name="sponsorPosition.workOrg.org.id" type="hidden"  <#if workApply?? && workApply.sponsorPosition?? && workApply.sponsorPosition.wrokOrg??> value="${((workApply.sponsorPosition.workOrg.org.id)!'')?html}"</#if> />
								
								<input class="span6" id="orgName" name="sponsorPosition.workOrg.org.name"  <#if workApply?? && workApply.sponsorPosition?? && workApply.sponsorPosition.workOrg??> value="${((workApply.sponsorPosition.workOrg.org.name)!'')?html}"</#if> readonly/>
								<a style="cursor:pointer" onclick="selectOrg()">选择</a>&nbsp;	
							
							</#if>
						    
						 </div>
					 </div>
					 
					<div class="row-fluid">
						 <div class="span4">
							<span class="formTitle">申请岗位</span>
							<input id="sponsorPosition.workName" name="sponsorPosition.workName" class="span6" value="${((workApply.sponsorPosition.workName)!'')?html}"/>
						 </div>
						 <div class="span4">
							<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						 	<input type="button" class="btn btn-info"  onclick="selectStudentInfo();" value="查 询"/>
		              	 	<input type="button" class="btn btn-info"  onclick="comp.clearForm('workStudyQuery')" value="清 空"/>
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
				                    	<#if termStr=="do">
				                        	<#if isDifficult=="do">
					                        	<#if selectTwoPosition=="do">
					                        			<#if notSurePosition=="do">
					                        					<#if user_key.optMap??>
																	<#if user_key.optMap['add']?? >
					                        							<button class="btn btn-info" type="button" id="add-button">
				                               		 						申 请
					                            						</button>
					                            					</#if>
					                            					<#--if user_key.optMap['formCopy']?? >
					                            						&nbsp;&nbsp; <button class="btn btn-info" type="button" onclick="javascript:window.location.href='${rc.contextPath}/sponsor/workStudy/opt-formCopy/copyWorkStudy.do'">快速设置</button>
					                            					</#if-->
																</#if>	
					                            		<#else>
					                            			 <font color="red"><b>你已经有确定岗位了，不能再申请</b> </font>
					                           			</#if>
					                            <#else>
					                            	<font color="red"><b>同一个学期， 每个学生最多选择两个岗位，只能确认其中一个 </b> </font>
				                            	</#if>
				                            <#else>
				                            	<font color="red"><b>你暂时还不是困难生，还不能申请勤工助学</b> </font>
				                            </#if>
				                       <#else>
				                            <font color="red"><b>当前时间不可申请勤工助学</b> </font>
				                       </#if>
				                    </div>
				                </div>
				            </div>
				        </div>
				        
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl" >
							<thead>
								<tr>
									<th width="5%">序号</th>
									<th width="6%">姓名</th>
									<th width="10%">学号</th>
									<th width="9%">学年</th>
									<th width="7%">学期</th>
									<th width="9%">困难等级</th>
									<th width="11%">联系方式</th>
									<th width="9%">用工部门</th>
									<th width="7%">申请岗位</th>
									<th width="6%">状态</th>
									<th width="7%">审核状态</th>
									<th width="8%">岗位状态</th>
									<th width="6%">操作</th>
								</tr>
							</thead>
							<tbody>
								<#if page??>	
									<#list page.result as p>
										<tr>
											<td>${p_index+1}</td>
											<td class="autocut tipTag" data="学院：${(p.difficultStudentInfo.student.college.name)!''}<br/>专业：${(p.difficultStudentInfo.student.major.majorName)!''}<br/>班级：${(p.difficultStudentInfo.student.classId.className)!''}<br/>">
											    <a target="_blank"  href="${rc.contextPath}/sponsor/workStudy/opt-view/viewWorkStudy.do?workApplyId=${(p.workApplyId)!''}"  title="查看勤工助学信息"> ${(p.difficultStudentInfo.student.name)!""}</a></td>											
											<td class="autocut">${(p.difficultStudentInfo.student.stuNumber)!""}</td>
											<td class="autocut">${(p.applyFile.schoolYear.name)!""}</td>
											<td class="autocut">${(p.applyFile.term.name)!""}</td>
											<td class="autocut">${(p.difficultStudentInfo.difficultLevel.name)!""}</td>
											<td class="autocut">${(p.applyFile.phone)!""}</td>
											<td class="autocut">${(p.sponsorPosition.workOrg.org.name)!""}</td>
											<td class="autocut">${(p.sponsorPosition.workName)!""}</td>
											<!--402891da4ee2d245014ee2fb74b40002-->
											<td class="autocut">
												<#if p.status??&& p.status.id?? &&p.status.id="402891da4ee2d245014ee2fbb0dd0003" >
													已提交
												<#else>
													${(p.status.name)!""}
												</#if>
											</td>
											<td class="autocut">
												<#if p.processStatus??>
													<#if p.processStatus=="ABANDONED">废止
													<#else>
													${processStatusMap[p.processStatus]}
													</#if>
									   			<#else>
									    			<#if  p.status.code=="SUBMIT" >
													待审核
									    			</#if>
												</#if>
											</td>
											<td class="autocut"><#if p.postStatus??>${(p.postStatus.name)!""}</#if></td>
											
											<td>
												<#if user_key.optMap??>
													<#if user_key.optMap['update']?? &&  notSurePosition=="do" && ((p.status?? && p.status.code="SAVE")||(p.processStatus?? && p.processStatus=="REJECT") )>
												   		<a href="${rc.contextPath}/sponsor/workStudy/opt-update/editWorkStudy.do?workApplyId=${p.workApplyId}" class="sepV_a" title="编辑岗位申请信息"><i class="icon-edit"></i></a>
													</#if>
													<#if user_key.optMap['del']?? && notSurePosition=="do" && p.status?? && p.status.code="SAVE" &&(!p.processStatus??)>
												   		<a href="javascript:void(0);" onclick="deleteWorkApply('${(p.difficultStudentInfo.student.name)!""}','${p.workApplyId!""}');" class="sepV_a" title="删除岗位申请信息"><i class="icon-trash"></i></a>
													</#if> 	
												</#if> 	
												<#if  p.processStatus?? && p.processStatus=="PASS" && !p.postStatus??>									   		
													<a href="javascript:void(0);" onclick="confirmPosition('${(p.sponsorPosition.workOrg.org.name)!""}','${(p.sponsorPosition.workName)!""}','${p.workApplyId!""}');" class="sepV_a" title="确认申请岗位信息"><i class="icon-ok-sign"></i></a>
													<a href="javascript:void(0);" onclick="wastePosition('${(p.sponsorPosition.workOrg.org.name)!""}','${(p.sponsorPosition.workName)!""}','${p.workApplyId!""}');" class="sepV_a" title="放弃本次岗位申请"><i class="icon-remove-sign"></i></a>
												</#if> 
											</td>
										</tr>
									</#list>
								 </#if> 
							</tbody>
						</table>
						 <#assign pageTagformId="workStudyQuery"/>
						  <!--用于用户导出 -->
						<input id="pageTotalCount" name="pageTotalCount" type="hidden"  value="${page.totalCount}"/>
						 <#include "/page.ftl">
					</div>
				</div>
			</div> 
		</div> 
	</div>
</div>
<div class="modal hide fade" id="exportdemo">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3 id="title1">导出demo</h3>
	</div>
	<div class="modal-body" id="export_workStudy">
		
	</div>
	<div class="modal-footer">
		<a href="#" class="btn" data-dismiss="modal">关闭</a>
	</div>
</div>
 <#include "/user/comp/queryUserRadioModal.ftl">
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
	function wastePosition(orgName,positionName,workApplyId){
		comp.confirm("确定要放弃【"+orgName+"】部门的【"+positionName+"】岗位吗？", function(result) {
			
        	if(!result)
        		return;  
    		$.post("${rc.contextPath}/sponsor/workStudy/opt-update/wasteWorkStudy.do", { workApplyId: workApplyId }, function(data){
    			
    			if(data == "success")
    			{
    				window.location.href="${rc.contextPath}/sponsor/workStudy/opt-query/queryWorkStudyList.do";
    				comp.message("【"+orgName+"】部门的【"+positionName+"】岗位 放弃成功","info");
    			}
			    
			   },"text");
		}); 
	
	}
	function confirmPosition(orgName,positionName,workApplyId){
		comp.confirm("确定要去【"+orgName+"】部门的【"+positionName+"】岗位吗？", function(result) {
		
        	if(!result)
        		return; 
    		$.post("${rc.contextPath}/sponsor/workStudy/opt-update/confirmWorkStudy.do", { workApplyId: workApplyId }, function(data){
    			
    			if(data =="true")
    			{
    				comp.message("【"+orgName+"】部门的【"+positionName+"】岗位 人数已满","error");
    			}else{
    				window.location.href="${rc.contextPath}/sponsor/workStudy/opt-query/queryWorkStudyList.do";
    				//comp.message("【"+orgName+"】部门的【"+positionName+"】岗位 确认成功","info");
    				
    			}
			    
			   },"text");
		}); 
	
	}
	$(document).ready(function(){
	 
	 	//新增方法 
	 	$("#add-button").click( function () { 
	 		window.location.href="${rc.contextPath}/sponsor/workStudy/opt-add/editWorkStudy.do";
	 	 });
	 	
	});
	
	
	
	//查询
	function selectStudentInfo(){
	    $("#workStudyQuery").attr("action","${rc.contextPath}/sponsor/workStudy/opt-query/queryWorkStudyList.do");
		$("#workStudyQuery").submit();
	}
	
	
	//删除操作
	function deleteWorkApply(name,workApplyId)
	{
		comp.confirm("确定要删除【"+name+"】的信息吗？", function(result) {
		
        	if(!result)
        		return;  
    		$.post("${rc.contextPath}/sponsor/workStudy/opt-del/deleteWorkStudy.do", { workApplyId: workApplyId }, function(data){
    			
    			if(data === "success")
    			{
    				comp.message(name +"删除成功！","info");
    				window.location.href="${rc.contextPath}/sponsor/workStudy/opt-query/queryWorkStudyList.do";
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
	

$(function(){
	$('.tipTag').poshytip({
		className: 'tip-yellowsimple',
		alignTo: 'target',
		alignX: 'right',
		alignY: 'center',
		offsetX: 5
	});
});
	
</script>
</body>
</html>