

<div class="row-fluid">
	<div class="row-fluid" id ="menuRoleDiv">
		<#if submitButtonStyle??>
			<#if submitButtonStyle == "show">
				<button id="submitButton" type="button" class="btn btn-info" onclick="submitResRoleOptForm()">确定</button>
			<#else>
				<!--<button id="submitButton" type="button" class="btn disabled">确定</button>-->
			</#if>
		<#else>
			<!--<button id="submitButton" type="button" class="btn disabled">确定</button>-->
		</#if>
		<div class="row-fluid" style="padding-top:20px;">
		<form id="resRoleOptForm" method="post" action="${rc.contextPath}/res/optAssign/opt-query/submitResOptRoleAjax.do">
		<input type="hidden" name="menuId" value="${menuId!}">
		<input type="hidden" name="queryResRoleIds" value="${queryResRoleIds!}">
		<input type="hidden" name="queryResOptIds" value="${queryResOptIds!}">
		<#if resOptCollList??>
		<#if resOptCollList?size gt 1>
			<div class="tabbable tabs-left">
				<ul class="nav nav-tabs">
					<#list resOptCollList as resOptList>
					<li<#if resOptList_index == 0> class="active"</#if>><a href="#tab_l${resOptList_index + 1}" data-toggle="tab">第${resOptList_index + 1}页</a></li>
					</#list>
				</ul>
				<div class="tab-content">
					<#list resOptCollList as resOptList>
					<div class="tab-pane<#if resOptList_index == 0> active</#if>" id="tab_l${resOptList_index + 1}">

							<table class="table table-bordered table-striped">
								<thead>
									<tr>
										<th>角色\操作</th>
											<#list resOptList as resOpt>
												<th>${resOpt.opt.name!}</th>
											</#list> 
									</tr>
								</thead>
								<tbody>
								<#if resRoleList??>
									<#list resRoleList as resRole>
										<tr>
											<td>${resRole.role.name}</td>
											<#if resOptList??>
												<#list resOptList as resOpt>
													<td><input type="checkbox"  name="${resRole.resource.id}_${resRole.role.id}" value="${resOpt.resource.id}_${resOpt.opt.id}" class="uni_style" <#if resRoleOptIds?contains(resRole.resource.id + "_" + resRole.role.id + "__" + resOpt.resource.id + "_" + resOpt.opt.id)> <#else> checked="true" </#if>></td>
												</#list> 
											</#if>
										</tr>
									</#list> 
								</#if>
								</tbody>
							</table>
						
					</div>
					</#list>
				</div>
			</div>
		</#if>
		</#if>
		<#if resOptCollList??>
		<#if resOptCollList?size lt 2>
		<table class="table table-bordered table-striped">
			<thead>
				<tr>
					<th>角色\操作</th>
					<#list resOptCollList as resOptList>
						<#list resOptList as resOpt>
							<th>${resOpt.opt.name!}</th>
						</#list> 
					</#list>
				</tr>
			</thead>
			<tbody>
			<#if resRoleList??>
				<#list resRoleList as resRole>
					<tr>
						<td>${resRole.role.name}</td>
						<#list resOptCollList as resOptList>
							<#list resOptList as resOpt>
								<td><input type="checkbox"  name="${resRole.resource.id}_${resRole.role.id}" value="${resOpt.resource.id}_${resOpt.opt.id}" class="uni_style" <#if resRoleOptIds?contains(resRole.resource.id + "_" + resRole.role.id + "__" + resOpt.resource.id + "_" + resOpt.opt.id)> <#else> checked="true" </#if>></td>
							</#list> 
						</#list>
					</tr>
				</#list> 
			</#if>
			</tbody>
		</table>
		</#if>
		</#if>
		</form>
		</div>
	</div>
</div>
<script src="${rc.contextPath}/js/jquery.form.js"></script>
<script>
	$("document").ready(function(){
		
		var options = { 
        	success:       showResponse
    	}; 
		$('#resRoleOptForm').ajaxForm(options); 
	});
	function submitResRoleOptForm() {
		$('#resRoleOptForm').submit();
	}
	function showResponse(responseText, statusText)  { 
	    $.sticky(responseText, {autoclose : 5000, position: "top-right", type: "st-info" });
	} 
</script>

