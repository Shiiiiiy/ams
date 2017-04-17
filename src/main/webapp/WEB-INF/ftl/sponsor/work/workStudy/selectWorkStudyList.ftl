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
    		<form  id="selectWorkStudyQuery"  action="${rc.contextPath}/sponsor/selectWorkStudy/opt-query/selectWorkStudyList.do" method="post">
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
							 	<#if (userOrg ?? &&  userOrg.id ?? && userOrg.id != studentOfficId)&&(!isSchoolHeader) >
									<input  id="orgId" name="org.id" type="hidden"  value="${((userOrg.id)!'')?html}"/>
									<input id="org.name" name="org.name" class="span6 notClear" value="${userOrg.name}" readonly/>
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
							<span class="formTitle">岗位状态</span>
							<select size="1" class="span6" id="postStatusId" name="postStatus.id" aria-controls="dt_gal" >
									<option value="" >请选择</option>
									<#if postList??>
										<#list postList as d>
											<#if workApply?? && workApply.postStatus??&& workApply.postStatus.id==d.id >
												<option value="${d.id}"  selected="selected">${d.name?html}</option>
											<#else>
												<option value="${d.id}">${d.name?html}</option>
											</#if>
										</#list>
									</#if>
							</select>	
						 </div>
						  <div class="span4">
						  	<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						  	
						 	<input type="button" class="btn btn-info"  onclick="selectStudentInfo();" value="查 询"/>
		              	 	<input type="button" class="btn btn-info"  onclick="comp.clearForm('selectWorkStudyQuery')" value="清 空"/>
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
						                    <#if user_key.optMap??>
						              			<#if user_key.optMap['export']??>
					              						<div class="input-append">
					              							<input id="exportSize" name="exportSize" type="hidden" class="span3"  value="500" title="excel单页条数" />
					            							<button class="btn btn-info" type="button" onclick="exportWorkStudyList()">Excel导出</button>
					              						</div>
					              				 </#if>	
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
										<th width="8%">学号</th>
										<th width="8%">学年</th>
										<th width="8%">学期</th>
										<th width="9%">困难等级</th>
										<th width="11%">联系电话</th>
										<th width="13%">用工部门</th>
										<th width="11%">申请岗位</th>
										<th width="8%">审核状态</th>
										<th width="8%">岗位状态</th>
										<#if user_key.optMap??>
											<#if user_key.optMap['del']??>
												<th width="5%">操作</th>
											</#if> 
										</#if> 
									</tr>
								</thead>
								<tbody>
									<#if page??>	
										<#list page.result as p>
											<tr>
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
												<td class="autocut"><#if p.processStatus??>${processStatusMap[p.processStatus]}</#if></td>
												<td class="autocut"><#if p.postStatus??>${(p.postStatus.name)!""}<#else>待确认</#if></td>
												<#if user_key.optMap??>
													<#if user_key.optMap['del']??>
														<td class="autocut">
															<#if  p.postStatus?? && p.postStatus.code="STATUS_IS_POST" >
																<a href="javascript:void(0);" onclick="dismissWorkApply('${(p.difficultStudentInfo.student.name)!""}','${p.workApplyId!""}');" class="sepV_a" title="强制离岗"><i class="icon-ban-circle"></i></a>
															</#if> 
														</td>
													</#if> 
												</#if> 	
											</tr>
										</#list>
									 </#if> 
								</tbody>
							</table>
						 <#assign pageTagformId="selectWorkStudyQuery"/>
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
		<h3 id="title1">导出勤工助学</h3>
	</div>
	<div class="modal-body" id="export_workStudy">
		
	</div>
	<div class="modal-footer">
		<a href="#" class="btn" data-dismiss="modal">关闭</a>
	</div>
</div>
 <#include "/user/comp/queryUserRadioModal.ftl">
<#-- 脚本开始 -->
<div class="modal hide fade" id="exportdemo">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3 id="title1">导出勤工助学</h3>
	</div>
	<div class="modal-body" id="export_workStudy">
		
	</div>
	<div class="modal-footer">
		<a href="#" class="btn" data-dismiss="modal">关闭</a>
	</div>
</div>
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
	//强制离岗操作
	function dismissWorkApply(name,workApplyId)
	{
		comp.confirm("确定要将【"+name+"】强制离岗吗？", function(result) {
		
        	if(!result)
        		return;  
    		$.post("${rc.contextPath}/sponsor/workStudyApprove/opt-del/dismissWorkApply.do", { workApplyId: workApplyId }, function(data){
    			
    			if(data === "success")
    			{
    				comp.message(name +"强制离岗成功！","info");
    				window.location.href="${rc.contextPath}/sponsor/selectWorkStudy/opt-query/selectWorkStudyList.do";
    			}
			    
			   },"text");
		}); 
	}
	
		<!--导出-->
	function exportWorkStudyList(){
		var pageTotalCount= $("#pageTotalCount").val();
		var exportSize= $("#exportSize").val();
		var patrn=/^[0-9]{1,20}$/; 
		if(exportSize==""){
			comp.message("请输入大于0的正整数","error");
		}else if(!patrn.exec(exportSize)){
			comp.message("请输入大于0的正整数","error");
		}else if(exportSize<1){
			comp.message("请输入大于0的正整数","error");
		}else if(exportSize>10000){
			comp.message("请输入小于10000的正整数","error");
		}else{
			comp.showModal("exportdemo","500px","-250px 0 0 -250px");
			$("#export_workStudy").load("${rc.contextPath}/sponsor/workStudyApprove/opt-query/nsm/exportWorkApplyList.do?pageTotalCount="+pageTotalCount+"&exportSize="+exportSize);
		}
	}
	
	function exportDate(exportSize,exportPage){
	
		$("#selectWorkStudyQuery").attr("action","${rc.contextPath}/sponsor/workStudyApprove/opt-query/exportWorkStudy.do");
		var fo=$("#selectWorkStudyQuery");
		if($("#selectWorkStudyQuery_exportPage").length==0){
			fo.append($("<input>",{
				id:'selectWorkStudyQuery_exportSize',
				type:'hidden',
				name:'selectWorkStudyQuery_exportSize',
				val:exportSize
			}));
			fo.append($("<input>",{
				id:'selectWorkStudyQuery_exportPage',
				type:'hidden',
				name:'selectWorkStudyQuery_exportPage',
				val:exportPage
			}));
		}else{
			$("#selectWorkStudyQuery_exportSize").val(exportSize);
			$("#selectWorkStudyQuery_exportPage").val(exportPage);
		}
		fo.submit();
	}
	
	//查询
	function selectStudentInfo(){
	    $("#selectWorkStudyQuery").attr("action","${rc.contextPath}/sponsor/selectWorkStudy/opt-query/selectWorkStudyList.do");
		$("#selectWorkStudyQuery").submit();
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