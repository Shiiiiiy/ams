<form class="addMenuForm">
	<div class="row-fluid">
		<div class="span2">上级菜单 </div>
		<div class="span6"><p id="fathermenu"></p></div>
	</div>
	<div class="row-fluid">
		<div class="span2">菜单名称<span class="f_req"> *</span> </div>
		<div class="span5"><input type="text" value="" id="menuname" name="menuname"></div>
	</div>
	<div class="row-fluid">
		<div class="span2">菜单链接 </div>
		<div class="span5"><input type="text" value="" id="menulink" name="menulink"></div>
		<div class="span5"><font size="1">菜单链接命名规范：菜单标识（模块/子模块）/权限/方法名（可选）</font></div>
	</div>
	<div class="row-fluid" id="menuIconDiv">
		<div class="span2">图标样式 </div>
		<div class="span5"><input type="text" value="" id="classCode" name="classCode"></div>
		<div class="span1"><div style="background:#1786b3;width:25px;height:25px;text-align:center;vertical-align:middle;line-height:25px;"><i id="iconShow"></i></div></div>
		<div class="span3"><font size="1">图标预览区域</font></div>
	</div>
	<div class="row-fluid">
		<div class="span2">备注 </div>
		<div class="span3"><textarea id="comments" name="comments" cols="20" rows="3"></textarea></div>
	</div>
	<@token/>
</form>
