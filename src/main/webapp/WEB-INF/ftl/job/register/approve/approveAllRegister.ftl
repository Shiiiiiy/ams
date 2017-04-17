
<html>
	<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <script src="${rc.contextPath}/js/jquery.metadata.js"></script>
		<script src="${rc.contextPath}/js/myjs_message_cn.js"></script>
		<style>
			.error{color:red;font-weight:bold;}
		     input.error{border:1px solid red;}
		</style>
    </head>
	<body>
	<form id="approveRegister" action="${rc.contextPath}/job/register/opt-save/saveRegister.do" method="post">
		
		<table class="table table-bordered table-striped tablecut" id="smpl_tbl" >
			<thead>
				<th width="25%">姓名</th>
				<th width="25%">学号</th>
				<th width="25%">就业学年</th>
				<th width="25%">新报到证编号<span class="f_req">*</span></th>
			</thead>
			
			<tbody>
			<#if registers??>
				<#list registers as a>
				<tr><td class="autocut">${(a.student.name)!""}</td>
					<td class="autocut">${(a.student.stuNumber)!""}</td>
					<td class="autocut">${(a.employmentYear.name)!""}</td> 
					<td>
						<input name="registers[${a_index}].newRegisterCode" type="text" class="span2 {required:true,maxlength:20,messages:{required:'新的报到证编号不能为空', maxlength:'新报到证编号的长度不能超过20个字符'}}" />
						<input name="registers[${a_index}].id"  type="hidden" value="${(a.id!"")?html}" />
					</td>
				</tr>
				</#list>
			</#if> 
			</tbody>
		</table>
	<form>	
	
	
	</body>
</html>
