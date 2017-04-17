<style type="text/css">
	.table tbody tr:hover td, .table tbody tr:hover th {background-color:#fff;}
</style>
<table class="table table-bordered">
	<tr>
		<td rowspan="6" width="35%" align="center" style="text-align: center;">
			<#if flag?? && flag=='true'>
				<#if listFile??>	
				<#list listFile as lf>
					<img src="${rc.contextPath}/sys/sysConfig/file.do?id=${lf.uploadFile.id}" style="display:block;width:238px;height:258px;"  class="img-this" />
				</#list>
				</#if>
			<#else>
				<img src="${rc.contextPath}/img/default_person.jpg" style="display:block;" class="img-this" />
			</#if>
		</td>
		<td width="30%">姓名：&nbsp;&nbsp;${(vo.userName)!""}</td>
		<td width="35%">性别：&nbsp;&nbsp;${(vo.gender.name)!""}</td>
	</tr>
	<tr>
		<td width="20%">类型：&nbsp;&nbsp;${(vo.userType.name)!""}</td>
		<td width="20%">职位：&nbsp;&nbsp;${(vo.duty)!""}</td>
	</tr>
	<tr>
		<td width="20%">手机：&nbsp;&nbsp;${(vo.phoneNum)!""}</td>
		<td width="20%">邮箱：&nbsp;&nbsp;${(vo.email)!""}</td>
	</tr>
	<tr>
		<td colspan="2">参与项目：&nbsp;&nbsp;${(projectName)!""}</td>
	</tr>
	<tr>
		<td colspan="2">单位：&nbsp;&nbsp;${(vo.unit)!""}</td>
	</tr>
	<tr>
		<td colspan="2">介绍：&nbsp;&nbsp;${(vo.userProfile)!""}</td>
	</tr>
</table>
