<#--学工信息查看开始-->
<div class="modal hide fade" id="stuJob_view_div" style="z-index:99999">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3 id="stuJob_title">学工信息查询</h3>
	</div>
	<div class="modal-body" id="stuJob_view_body">
		
	</div>
	<div class="modal-footer">
		<a href="#" class="btn btn" data-dismiss="modal">关 闭</a>
	</div>
</div>
<#--学工信息查看结束-->
<script>
function viewStuJob(id,name) {
	$("#stuJob_view_body").empty();
	$("#stuJob_title").html(name);
	comp.showModal("stuJob_view_div","750px","-300px 0 0 -380px"); 
	$("#stuJob_view_body").load("${rc.contextPath}/teacher/maintain/nsm/viewTeacherInfo.do?.temp="+Math.random(),{"id":id, "flag":"view"},function(){});
}
</script>