<!--待办人选择 -->
<div class="modal hide fade" id="_selectApprover">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3>待办人选择</h3>
	</div>
	<div class="modal-body" id="_selectApproverBody">
		<div class="row-fluid">
			<div class="span12">
				<div role="grid" class="dataTables_wrapper form-inline" id="dt_gal_wrapper">
					<table class="table table-bordered table-striped tablecut" id="mytable">
							<tr>
								<th width="4%"></th>
								<th width="32%" ><div align="center">姓名</div></th>
								<th width="32%" ><div align="center">岗位</div></th>
								<th width="32%" ><div align="center">部门</div></th>
							</tr>
					</table>
				</div>
			</div>
		</div>
		<div class="row-fluid">
			<div class="span12">
			<div id="approveInfoDiv">
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<a href="###" class="btn " data-dismiss="modal">取消</a>
		<a href="###" class="btn btn-info" data-dismiss="modal" onclick="_getApprover()">确定</a>		
	</div>
</div>

<script>
	//打开面板数据初始化
	function _initPanel(objectId,contentArray,approveKey,suggest){
		$('#_selectApprover').width(710).css("marginLeft","-350px").css("marginTop","-250px");
		$('#_selectApproverBody').css("max-height","320px");
		$('.approverRow').remove();
        $.each(contentArray, function(i, item) {
            $("#mytable").append(
					"<tr class=\"approverRow\">"+
					"<td><div align=\"center\">"+
					"<input type=\"radio\"  name=\"approverId\" value=\""+item.userId+"\"/>"+
					"</div></td>"+
					"<td class=\"autocut\"><div align=\"center\">"+item.userName+"</div></td>"+
					"<td class=\"autocut\"><div align=\"center\">"+item.positionName+"</div></td>"+
					"<td class=\"autocut\"><div align=\"center\">"+item.orgName+"</div></td>"+
					"</tr>");
        });
		$("#approveInfoDiv").append(
		"<input type=\"hidden\"  id=\"apwObjectId\" value=\""+objectId+"\"/>"+
		"<input type=\"hidden\"  id=\"approveKey\" value=\""+approveKey+"\"/>"+
		"<input type=\"hidden\"  id=\"apwSuggest\" value=\""+suggest+"\"/>");
	}
	
</script>