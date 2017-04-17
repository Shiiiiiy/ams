<script>
	$("document").ready(function() {
		$("#addFamily").click(function(){
			comp.showModal("editNewStudentFamilyBox","720px","-220px 0 0 -380px");
			$("#editNewStudentFamilyDiv").load("${rc.contextPath}/newstudent/register/nsm/editNewStudentFamily.do");
		});
		
	});
	
	function modifyFamily(familyId){
		comp.showModal("editNewStudentFamilyBox","720px","-220px 0 0 -380px");
		$("#editNewStudentFamilyDiv").load("${rc.contextPath}/newstudent/register/nsm/editNewStudentFamily.do",{"id":familyId});
	}
	
	function deleteFamily(familyId){
		comp.confirm("确认要删除该家长信息吗？",function(result){
			if (!result)
				return;
			$.ajax({
				url:"${rc.contextPath}/newstudent/register/deleteNewStudentFamily.do",
				async:false,
				cache: false,
				type: "POST",
				data:{"id":familyId},
				success: function(data){
					if(data.result=="success") {
						comp.message(data.message,"info");
						$("#familyInfo").load("${rc.contextPath}/newstudent/register/loadNewStudentFamily.do",{"newStudentId":$("#newStudentId").val()});
					}else{
						comp.message(data.message,"error");
					} 
				},dataType:"json"
			});
		});
	}
</script>

<div class="row-fluid" id="familyInfo">
	<div class="span12">
		<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
			<div id="addFamilyButtonDiv" class="row">
				<div class="span6">
					<div class="dt_actions">
						<div class="btn-group">
							<#if newStudentFamilyList?? && (newStudentFamilyList?size<3)>
								<button id="addFamily" class="btn btn-info" type="button">新增</button>
							<#else>
								<button class="btn btn-info" type="button" onclick="comp.message('家长总数不能超过三人','error');">新增</button>
							</#if>
						</div>
					</div>
				</div>
			</div>
			<table class="table table-bordered table-striped tablecut"
				id="smpl_tbl">
				<thead>
					<tr>
						<th width="8%">序号</th>
						<th>姓名</th>
						<th>关系</th>
						<th>手机号码</th>
						<th>邮箱</th>
						<th>邮政编码</th>
						<th>通讯地址</th>
						<th>是否监护人</th>
						<th class="familyOpt">操作</th>
					</tr>
				</thead>
				<tbody>
					<#if newStudentFamilyList??>
						<#list newStudentFamilyList as family>
							<tr>
								<td class="autocut">${family_index+1}</td>
								<td class="autocut">${(family.name)!""}</td>
								<td class="autocut">${(family.type)!""}</td>
								<td class="autocut">${(family.phone)!""}</td>
								<td class="autocut">${(family.mail)!""}</td>
								<td class="autocut">${(family.zipCode)!""}</td>
								<td class="autocut">${(family.address)!""}</td>
								<td class="autocut">${(family.isGuardian.name)!""}</td>
								<td class="autocut familyOpt">
									<a href="#" id="modify_opt" onclick="modifyFamily('${family.id}');return false;" class="sepV_a" title="修改"><i class="icon-pencil"></i></a>
									<a href="#" id="delete_opt" onclick="deleteFamily('${family.id}');return false;" class="sepV_a" title="删除"><i class="icon-trash"></i></a>
								</td>
							</tr>
						</#list>
					</#if>
				</tbody>
			</table>
		</div>
	</div>
</div>
