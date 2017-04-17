<form class="editMenuForm">
	<div class="row-fluid">
		<div class="span2">上级菜单 </div>
		<div class="span6">${fatherMenu?html}</div>
	</div>
	<div class="row-fluid">
		<div class="span2">菜单名称<span class="f_req"> *</span> </div>
		<div class="span5"><input type="text" value="${res.name?html}" id="menuname_" name="menuname_"></div>
	</div>
	<div class="row-fluid">
		<div class="span2">菜单链接 </div>
		<#if res.link??>
			<div class="span5"><input type="text" value="${res.link?html}" id="menulink_" name="menulink_"></div>
		<#else>
			<div class="span5"><input type="text" value="" id="menulink_" name="menulink_"></div> 
		</#if>
		<div class="span5"><font size="1">菜单链接命名规范：菜单标识（模块/子模块）/权限/方法名（可选）</font></div>
	</div>
	<#if level??>
		<#if level!='3'>
			<div class="row-fluid">
				<div class="span2">图标样式 </div>
				<#if res.classCode??>
					<div class="span5"><input type="text" value="${res.classCode?html}" id="classCode_" name="classCode_" onblur="ob()"></div>
				<#else>
					<div class="span5"><input type="text" value="" id="classCode_" name="classCode_" onblur="ob()"></div>
				</#if>
				<div class="span1"><div style="background:#1786b3;width:25px;height:25px;text-align:center;vertical-align:middle;line-height:25px;"><i id="iconShow_"></i></div></div>
				<div class="span3"><font size="1">图标预览区域</font></div>
			</div>
		</#if>
	</#if>
	<div class="row-fluid">
		<div class="span2">备注 </div>
		<#if res.comments??>
			<div class="span3"><textarea id="comments_" name="comments_" cols="20" rows="3">${res.comments?html}</textarea></div>
		<#else>
			<div class="span3"><textarea id="comments_" name="comments_" cols="20" rows="3"></textarea></div> 
		</#if>
	</div>
</form>