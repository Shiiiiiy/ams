<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<style>
	#wrap{width:100%; overflow:hidden; margin: 0 auto;}
	.content {
			width: 850px;
			height: 400px;
			margin: 0 auto;
			overflow:hidden;
			padding-left:200px;
		}
	.content .right p{height:50px; font-size:20px; font-family:"微软雅黑"; font-weight:500; color:#7b7b7b;}
	.content .right h1{font-family:"黑体";}
	.left{float:left; width:30%;padding-left:70px; height:400px; margin-top:140px;}
	.right{width:60%; height:345px; margin-top:140px;}

</style>

</head>
<body>
<div id="contentwrapper">
	<div class="main_content">
		<div class="row-fluid">
		<#if name??>
			<h3 class="heading">以下是${(name)!""}同学离校项目办理情况：</h3>
			<input name="errorText" id="errorText" type="hidden" value="${errorText!""}"/>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span4">
								<label>计财处：</label>
							</div>
							<div class="span8">
								<label><#if leaveInfo?? && leaveInfo.finance?? && leaveInfo.finance.code == "Y">已办理<#else>未办理</#if></label>
							</div>
						</div>
					</div>
				</div>	
				
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span4">
								<label>公寓管理中心：</label>
							</div>
							<div class="span8">
								<label><#if leaveInfo?? && leaveInfo.dorm?? && leaveInfo.dorm.code == "Y">已办理<#else>未办理</#if></label>
							</div>
						</div>
					</div>
				</div>
		
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span4">
								<label>图书信息中心：</label>
							</div>
							<div class="span8">
								<label><#if leaveInfo?? && leaveInfo.library?? && leaveInfo.library.code == "Y">已办理<#else>未办理</#if></label>
							</div>
						</div>
					</div>
				</div>
				
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span4">
								<label>组织部：</label>
							</div>
							<div class="span8">
								<label><#if caucus?? && caucus.handleStatus??>${caucus.handleStatus.name}<#else>无</#if></label>
							</div>
						</div>
					</div>
				</div>
				
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span4">
								<label>教务处：</label>
							</div>
							<div class="span8">
								<label><#if leaveInfo?? && leaveInfo.edu?? && leaveInfo.edu.code == "N">未办理<#else>已办理</#if></label>
							</div>
						</div>
					</div>
				</div>

			<div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span4">
							<label>二级学院：</label>
						</div>
						<div class="span8">
						<label><#if leaveInfo?? && leaveInfo.college?? && leaveInfo.college.code == "Y">已办理<#else>未办理</#if></label>
						</div>
					</div>
				</div>
			</div>
			<input name="check_error" id="check_error" type="hidden" value="true"/>
		<#else>
			<div class="content">
	            <div class="right">
	                <h1>提示：</h1><br/>
	                <p>您没有权限访问此页面！如需访问，请联系系统管理员。</p>
	            </div>
	        </div>
		</#if>
		<div class="row-fluid">
		<div class="span6">
    		<div class="span9">
  			<button class="btn" type="button" onclick="javascript:window.close()">关 闭</button>
	    	</div>
		</div>
	</div>
		</div>
	</div>
</div>
</body>
</html>