<!DOCTYPE html>
<html lang="en">
    
    <title>菜单授权</title>
    <head> 
		
		<script>
			//树基本属性配置
				var setting = {
					view: {
						selectedMulti: true,
						dblClickExpand: false,
						showLine: false,
						showIcon:true
					},
					check: {
						enable: true
					},
					data: {
						simpleData: {
							enable: true
							}
						},
					callback: {
					}
				};
				//初始化树
				function popRoleMenuTree(id){
					comp.initTree("roleMenuTree","${rc.contextPath}/res/menuAssign/opt-query/initRoleMenuTreeAjax.do",{roleId:id},null,null,setting); 
					document.menuForm.roleId.value=id;
					comp.showModal("treeModal");
				}
				function menuFormSubmit(){
					var nodes = comp.returnTreeValue("roleMenuTree");
					
					var length = nodes.length;
					var ids="";
					if (length>0) {
						for (i = 0; i < length; i++) {
							ids += nodes[i].id + ",";
						}
					}
					document.menuForm.menuIds.value=ids;
					document.menuForm.submit();
				}
			</script>
    </head>
    <body>
        	<div id="contentwrapper">
                <div class="main_content">
                	<div class="row-fluid">
                	<form  id="roleQuery"  action="${rc.contextPath}/res/menuAssign/opt-query/menuAssign.do" method="post">
                	<div class="span12">			
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">角色名称</span>
							<#if role.name?? >
								<input id="name" name="name" class="span6" value="${role.name?html}" />
							<#else>
								<input id="name" name="name" class="span6"  />
							</#if> 
						</div>
						<div class="span4">
							<span class="formTitle">角色类型</span>
							<select size="1" name="type" aria-controls="dt_gal" class="span5" >
								<option value="">请选择..</option>
								<#if role.type?? >
									<#list dicRoleType as dic>
										<#if dic.id==role.type >
											<option  value="${dic.id}" selected="selected" />${dic.name}</option>
										<#else>
											<option value="${dic.id}" />${dic.name}</option>
										</#if>
									</#list>
								<#else>
									<#list dicRoleType as dic>
										<option  value="${dic.id}" />${dic.name}</option>
									</#list>
								</#if>
							</select>
						</div>
						<div class="span4">
							<span class="formTitle">角色状态</span>
								<select size="1" id="status" name="status" aria-controls="dt_gal"  class="span5">
									<option value="">请选择..</option>
										<#if role.status?? >
											<#list dicStatus as dic>
													<#if dic.id==role.status >
														<option value="${dic.id}" selected="selected">${dic.name}</option>
													<#else>
														<option value="${dic.id}" >${dic.name}</option>
													</#if>
											</#list>
										<#else>
											<#list dicStatus as dic>
													<option value="${dic.id}" >${dic.name}</option>
											</#list> 
										</#if>
								</select>
								
						</div>
					</div>
					
		            <div class="btnCenter">
		              <button class="btn btn-info">查 询</button>
		            </div>
					</div>
					</form>
                	<div class="row-fluid">
                		
						<div class="span12">
							<div role="grid" class="dataTables_wrapper form-inline" id="dt_gal_wrapper">
								<h3 class="heading"></h3>
								<table class="table table-bordered table-striped" id="smpl_tbl">
									<thead>
										<tr>
											<th width="8%">序号</th>
											<th>角色名称</th>
											<th>角色编码</th>
											<th>角色类型</th>
											<th>角色状态</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
										<#if page??>
										<#list page.result as role>
										<tr>
											<td class="autocut">${role_index + 1}</td>
											<td class="autocut">${role.name!}</td>
											<td class="autocut">${role.code!}</td>
											<td class="autocut"><#if role.roleTypeDic??>${(role.roleTypeDic.name)!""}</#if></td>
											<td class="autocut"><#if role.statusDic??>${(role.statusDic.name)!""}</#if></td>
											<td>
												<a href="#" onclick="popRoleMenuTree('${role.id}');" class="sepV_a" title="授权"><i class="icon-edit"></i></a>
												<!--a data-toggle="modal" data-backdrop="static" href="#" onclick="popRoleMenuTree('${role.id}');">授权</a-->
											</td>
										</tr>
										</#list> 
										</#if>
									</tbody>
								</table>
								<#assign pageTagformId="roleQuery"/>
								<#include "/page.ftl" > 
							</div>
						</div>
						
					</div>
					</div>
                </div>
            </div> 
        
                		
        <form name="menuForm" method="post" action="${rc.contextPath}/res/menuAssign/opt-update/assignMenu2Role.do">
        <input type="hidden" name="roleId" value="">
        <input type="hidden" name="menuIds" value="">
        <div class="modal hide fade" id="treeModal" >
			<div class="modal-header">
				<button class="close" data-dismiss="modal">×</button>
				<h3 id="title1">选择菜单</h3>
			</div>
			<div class="modal-body">
				<div class="span3">
					<ul id="roleMenuTree" class="ztree"></ul>
				</div>
			</div>
			<div class="modal-footer">
				<a href="#" class="btn" data-dismiss="modal">取消</a>
				<button type="button" class="btn btn-info" onclick="menuFormSubmit();">&nbsp;确定&nbsp;</button>
			</div>
		</div>
		</form>
	</body>
</html>