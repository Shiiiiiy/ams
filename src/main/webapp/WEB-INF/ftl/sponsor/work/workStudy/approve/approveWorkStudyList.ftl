<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <script type="text/javascript" src="${rc.contextPath}/js/common/cascadecommon.js"></script>
    </head>
    <body>
		<div id="contentwrapper">
   		<div class="main_content">   
    	   <div class="row-fluid">	
    		<form  id="workStudyApprove"  action="${rc.contextPath}/sponsor/workStudyApprove/opt-approve/approveWorkStudyList.do" method="post">
				<div class="span12">			
					<div class="row-fluid"> 
					 <div class="span4">
						<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学院</span>
						<select size="1" id="college" name="difficultStudentInfo.student.college.id" aria-controls="dt_gal" class="span6" onChange="cascade.changeCollage('college', 'majorId');">
							<option value="" >请选择</option>
							<#if collegeList??>
								<#list collegeList as c>
									<#if workApply?? && workApply.difficultStudentInfo?? && workApply.difficultStudentInfo.student?? && workApply.difficultStudentInfo.student.college?? && c.id==workApply.difficultStudentInfo.student.college.id>
										<option value="${c.id}" selected="selected">${c.name?html}</option>
									<#else>
										<option value="${c.id}">${c.name?html}</option>
									</#if>
								</#list>
							</#if>
						</select>
					</div>
					<div class="span4">
						<span class="formTitle">专业</span>
						<select size="1" id="majorId" name="difficultStudentInfo.student.major.id" aria-controls="dt_gal" class="span6 emptySelect" onChange="cascade.changeMajor('majorId', 'classId');">
							<option value="" >请选择</option>
							<#if majorList ?? >
								<#list majorList as m>
									<#if workApply?? && workApply.difficultStudentInfo?? && workApply.difficultStudentInfo.student?? && workApply.difficultStudentInfo.student.major?? &&  workApply.difficultStudentInfo.student.major.id == m.id >
										<option value="${m.id}" selected >${m.majorName}</option>
									<#else>
										<option value="${m.id}">${m.majorName}</option>
									</#if>
								</#list>
							</#if>
						</select>
					</div>
				
					<div class="span4">
						<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;班级</span>
						<select size="1" class="span6 emptySelect" id="classId" name="difficultStudentInfo.student.classId.id" aria-controls="dt_gal"  >
							<option value="" >请选择</option>
							<#if classList ?? >
								<#list classList as c>
									<#if workApply?? && workApply.difficultStudentInfo?? && workApply.difficultStudentInfo.student?? && workApply.difficultStudentInfo.student.classId?? && workApply.difficultStudentInfo.student.classId.id == c.id >
										<option value="${c.id}" selected >${c.className}</option>
									<#else>
										<option value="${c.id}">${c.className}</option>
									</#if>
								</#list>
							</#if>
						</select>
					</div>
				</div>
					 <div class="row-fluid">
						<div class="span4">
							<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;姓名</span>
						    <input id="student.name" name="difficultStudentInfo.student.name" class="span6" <#if workApply?? && workApply.difficultStudentInfo?? && workApply.difficultStudentInfo.student??> value="${((workApply.difficultStudentInfo.student.name)!'')?html}"</#if> maxlength="225"/>
						 </div>
						 
						 <div class="span4">
							<span class="formTitle">学号</span>
							<input id="student.stuNumber" name="difficultStudentInfo.student.stuNumber" class="span6" <#if workApply?? && workApply.difficultStudentInfo?? && workApply.difficultStudentInfo.student??>value="${((workApply.difficultStudentInfo.student.stuNumber)!'')?html}"</#if> maxlength="225"/>
						 </div>
						 <div class="span4">
							<span class="formTitle">用工部门</span>
							<input  id="orgId" name="sponsorPosition.workOrg.org.id" type="hidden"  <#if workApply?? && workApply.sponsorPosition?? && workApply.sponsorPosition.wrokOrg??> value="${((workApply.sponsorPosition.workOrg.org.id)!'')?html}"</#if> />
							<input class="span6" id="orgName" name="sponsorPosition.workOrg.org.name"  <#if workApply?? && workApply.sponsorPosition?? && workApply.sponsorPosition.workOrg??> value="${((workApply.sponsorPosition.workOrg.org.name)!'')?html}"</#if> readonly/>
							<a style="cursor:pointer" onclick="selectOrg()">选择</a>&nbsp;	
						 </div>
					 </div>
					<div class="row-fluid">
						 <div class="span4">
							<span class="formTitle">申请岗位</span>
							<input id="sponsorPosition.workName" name="sponsorPosition.workName" class="span6" value="${((workApply.sponsorPosition.workName)!'')?html}"/>
						 </div>
						<div class="span4">
						  <span class="formTitle">学年</span>
						    <select size="1" id="schoolYear" class="span6" name="applyFile.schoolYear.id" aria-controls="dt_gal" >
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
						  	  <span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学期</span>
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
					 </div>
					 <div class="row-fluid">
						 <div class="span4">
								<span class="formTitle">审核状态</span>
								<select size="1" name="processStatus" aria-controls="dt_gal" class="span6">
									<option value="" >请选择..</option>
										<#list processStatusMap?keys as c>
											<#if workApply ?? && workApply.processStatus?? && workApply.processStatus == c >
												<option value="${c}" selected >${processStatusMap[c]}</option>
											<#else>
												<option value="${c}">${processStatusMap[c]}</option>
											</#if>
										</#list>
										<#if workApply ?? && workApply.processStatus?? && workApply.processStatus == "ABANDONED" >
											<option value="ABANDONED" selected>废止</option>
										<#else>
											<option value="ABANDONED">废止</option>
										</#if>
								</select>	
						 </div>
						 <div class="span4">
				   	  	 	<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
		              		<input type="button" class="btn btn-info"  onclick="selectStudentInfo();" value="查 询"/>
		              		<input type="button" class="btn btn-info"  onclick="comp.clearForm('workStudyApprove')" value="清 空"/>
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
					                 
				                    </div>
				                </div>
				            </div>
				        </div>
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl" >
							<thead>
								<tr>
									<!--<th width="4%"><input id="_totalSelect" type="checkbox"/></th>-->
									<th width="5%">序号</th>
									<th width="6%">姓名</th>
									<th width="10%">学号</th>
									<th width="9%">学年</th>
									<th width="8%">学期</th>
									<th width="9%">困难等级</th>
									<th width="11%">联系方式</th>
									<th width="9%">申请部门</th>
									<th width="7%">申请岗位</th>
									<th width="8%">审核状态</th>
									<th width="8%">岗位状态</th>
									<th width="5%">操作</th>
								</tr>
							</thead>
							<tbody>
								<#if page??>	
									<#list page.result as p>
										<tr>
											<!--<td><input name="infoCheck" type="checkbox" /></td>-->
											<input type="hidden" id="workApplyId" name="workApplyId" value="${p.workApplyId}" />
											<td>${p_index+1}</td>
											<td class="autocut tipTag" data="学院：${(p.difficultStudentInfo.student.college.name)!''}<br/>专业：${(p.difficultStudentInfo.student.major.majorName)!''}<br/>班级：${(p.difficultStudentInfo.student.classId.className)!''}<br/>">
												<a href="${rc.contextPath}/sponsor/workStudy/opt-view/viewWorkStudy.do?workApplyId=${(p.workApplyId)!''}" target="_blank" title="查看勤工助学信息"> ${(p.difficultStudentInfo.student.name)!""}</a></td>											
											<td class="autocut">${(p.difficultStudentInfo.student.stuNumber)!""}</td>
											<td class="autocut">${(p.applyFile.schoolYear.name)!""}</td>
											<td class="autocut">${(p.applyFile.term.name)!""}</td>
											<td class="autocut">${(p.difficultStudentInfo.difficultLevel.name)!""}</td>
											<td class="autocut">${(p.applyFile.phone)!""}</td>
											<td class="autocut">${(p.sponsorPosition.workOrg.org.name)!""}</td>
											<td class="autocut">${(p.sponsorPosition.workName)!""}</td>
											<td class="autocut">
												<#if p.processStatus ??> 
													<#if userId?? && p.nextApprover?? && p.nextApprover.id==userId>
														待审核
													<#else>
														${processStatusMap[p.processStatus]}
													</#if>
												</#if>
											</td>
											<td class="autocut"><#if p.postStatus??>${(p.postStatus.name)!""}</#if></td>
											<td>
												<#if user_key.optMap['approve']??  >
													<#if p.nextApprover?? && userId??&& p.nextApprover.id==userId >
											   			<a href="${rc.contextPath}/sponsor/approveWorkStudy/opt-edit/editApproveWorkStudy.do?workApplyId=${p.workApplyId}" class="sepV_a" title="审核"><i class="icon-check"></i></a>
													</#if>
												</#if>
																					   	
											</td>
										</tr>
									</#list>
								 </#if> 
							</tbody>
						</table>
						 <#assign pageTagformId="workStudyApprove"/>
						  <!--用于用户导出 -->
						<input id="pageTotalCount" name="pageTotalCount" type="hidden"  value="${page.totalCount}"/>
						 <#include "/page.ftl">
					</div>
				</div>
			</div> 
		</div> 
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
	//查询
	function selectStudentInfo(){
	    $("#workStudyApprove").attr("action","${rc.contextPath}/sponsor/workStudyApprove/opt-approve/approveWorkStudyList.do");
		$("#workStudyApprove").submit();
	}
	
	//全选复选框
	jQuery("#_totalSelect").click(function(){
	
		if($("#_totalSelect").attr("checked")) {
			$("input[name='infoCheck']").attr("checked",true);
		}else {
	    	$("input[name='infoCheck']").attr("checked",false);
	    }	
	});
	
	jQuery("input[name='infoCheck']").click(function() {
		$("#_totalSelect").attr("checked",false);
	});
	
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