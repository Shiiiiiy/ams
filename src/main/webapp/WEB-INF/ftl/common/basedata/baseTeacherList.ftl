<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
</head>
<body>
<div id="contentwrapper">
    <div class="main_content">   
    	   <div class="row-fluid">	
    		<form  id="teacherQuery"  action="${rc.contextPath}/base/teacher/opt-query/listBaseTeacher.do" method="post">
				<div class="span12">			
					<div class="row-fluid">
						 <div class="span4">
							<span class="formTitle">职工号</span>
							<input id="id" name="id" class="span7" value="${baseTeacher.id!""?html}" />
						  </div>
						<div class="span4">
							<span class="formTitle">姓名</span>
							<input id="name" name="name" class="span7" value="${baseTeacher.name!""?html}" />
						</div>
						<div class="span4">
							<span class="formTitle">单位</span>
							<input id="orgId" name="org.id"  type="hidden"  value="<#if baseTeacher.org ?? >${baseTeacher.org.id!""?html}</#if>" />
							<input id="orgName" name="org.name" readonly class="span7" value="<#if baseTeacher.org ?? >${baseTeacher.org.name!""?html}</#if>" />
							<a style="cursor:pointer" onclick="selectOrg()">选择</a>&nbsp;							
							<a style="cursor:pointer" onclick="cleanOrg()">清除</a>
						 </div>
					</div>
		            <div class="btnCenter">
		              <button class="btn btn-info"  type="submit">查 询</button>
		              <button class="btn btn-info" type="button" onclick="comp.clearForm('teacherQuery');">清 空</button>
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
									<th width="8%">职工号</th>
									<th width="10%">姓名</th>
									<th width="12%">隶属单位</th>
									<th width="8%">性别</th>
									<th width="10%">出生日期</th>
									<th width="10%">籍贯</th>
									<th width="8%">学历等级</th>
									<th width="10%">文化程度</th>
									<th width="10%">入职日期</th>
									<th width="8%">状态</th>
								</tr>
							</thead>
							<tbody>
							<#if page??>	
								<#list page.result as p>
								<tr>
									<td>${p_index+1}</td>
									<td class="autocut">${p.id!""?html}</td>
									<td class="autocut">${p.name!""?html}</td>
									<td class="autocut">${p.org.name!""?html}</td>
									<td class="autocut">${p.gender.name!""?html}</td>
									<td class="autocut"><#if p.birthday ?? >${(p.birthday!"")?string("yyyy-MM-dd")}</#if></td>
									<td class="autocut">${p.nativePlace!""?html}</td>
									<td class="autocut">${p.studyLevel!""?html}</td>
									<td class="autocut">${p.degreeName!""?html}</td>
									<td class="autocut">${p.workHireDate!""?html}</td>
									<td class="autocut">${p.status!""?html}</td>
								</tr>
								</#list>
							 </#if> 
							</tbody>
						</table>
						 <#assign pageTagformId="teacherQuery"/>
						 <#include "/page.ftl">
					</div>
				</div>
			</div> 
		</div> 
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
$(function(){
	comp.orgSingleSelect("orgTree");
});
//组织机构选择
function selectOrg(){
	var treeObj = $.fn.zTree.getZTreeObj("orgTree");
	var orgId = $("#orgId").val();
	if(orgId!=""){
		var orgNode = treeObj.getNodeByParam("id",orgId, null);
		treeObj.selectNode(orgNode);
	}else
	{
		if(treeObj.getSelectedNodes().length==0){
			var node = treeObj.getNodes()[0];
			treeObj.selectNode(node);
			treeObj.expandNode(node, true, true, true);
		}
	}
	comp.showModal("orgModal");		
}
//组织机构清除选项
function cleanOrg(){
	$("#orgName").val("");
	$("#orgId").val("");
	var treeObj = $.fn.zTree.getZTreeObj("orgTree");
	var node = treeObj.getNodes()[0];
	treeObj.selectNode(node);
	$('#isHideDiv').hide();
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

</script>

</body>
</html>