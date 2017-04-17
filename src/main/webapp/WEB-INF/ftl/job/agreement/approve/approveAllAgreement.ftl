

<html>
	<head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <!-- ajax form-->
        
       	<script src="${rc.contextPath}/js/jquery.metadata.js"></script>
		<script src="${rc.contextPath}/js/myjs_message_cn.js"></script>
		<style>
			.error{color:red; font-weight:bold;}
		     input.error{border:1px solid red;}
		</style>
    </head>
	<body>
	<form id="approveAgreement" action="${rc.contextPath}/job/agreement/opt-save/saveAgreement.do"" method="post">
		<table class="table table-bordered table-striped tablecut" id="smpl_tbl" >
			<thead>
				<th width="25%">姓名</th>
				<th width="25%">学号</th>
				<th width="25%">就业学年</th>
				<th width="25%">新就业协议书编号<span class="f_req">*</span></th>
			</thead>
			<tbody>
			<#if agreements ??>
				<#list agreements as a>
				<tr>
					
					<td class="autocut">${(a.student.name)!""}</td>
					<td class="autocut">${(a.student.stuNumber)!""}</td>
					<td class="autocut">${(a.employmentYear.name)!""}</td> 
					<td>
						<input name="agreements[${a_index}].newAgreementCode" type="text" class="span2 {required:true,maxlength:20,messages:{required:'新就业协议书编号不能为空', maxlength:'新就业协议书编号的长度不能超过20个字符'}}" />
						<input name="agreements[${a_index}].id"  type="hidden" value="${(a.id!"")?html}" />
					</td>
				</tr>
				</#list>
			</#if> 
			</tbody>
		</table>
	</form>	
	
	</body>
</html>
