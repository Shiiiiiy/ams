<!--待办人选择 -->
<div class="modal hide fade" id="_selectApprover">
	<div class="modal-header">
		<button class="close" data-dismiss="modal" onclick="approverRollBack()">×</button>
		<h3><span id="nextTaskTitle"></span>待办人选择</h3>
	</div>
	<div class="modal-body" id="_selectApproverBody">
		<div class="row-fluid">
			<div class="span12">
				<div role="grid" class="dataTables_wrapper form-inline" id="dt_gal_wrapper">
					<table class="table table-bordered table-striped tablecut" id="mytable">
							<thead>
								<th width="4%"></th>
								<th width="32%" ><div align="center">姓名</div></th>
								<th width="32%" ><div align="center">岗位(角色)</div></th>
								<th width="32%" ><div align="center">部门</div></th>
							</thead>
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
	</div>
	<div class="modal-footer">
		<a href="javascript:void(0);" class="btn " data-dismiss="modal" onclick="approverRollBack()">关 闭</a>
		<a href="javascript:void(0);" class="btn btn-info" onclick="_getApprover()">确 定</a>		
	</div>
</div>

<script>
	//打开面板数据初始化
	function _initPanel(approveType,approveKey,objectId,result,suggest){
		$('#_selectApprover').width(710).css("marginLeft","-350px").css("marginTop","-250px");
		$('#_selectApproverBody').css("max-height","320px");
		$('.approverRow').remove();
        $.each(result.nextApproverList, function(i, item) {
            $("#mytable").append(
					"<tr class=\"approverRow\">"+
					"<td><div align=\"center\">"+
					"<input type=\"radio\"  name=\"approverId\" value=\""+item.userId+"\"/ onclick=\"getSelectedRadio('"+i+"')\">"+
					"</div></td>"+
					"<td class=\"autocut\"><div align=\"center\">"+item.userName+"</div></td>"+
					"<td class=\"autocut\"><div align=\"center\">"+item.positionName+"</div></td>"+
					"<td class=\"autocut\"><div align=\"center\">"+item.orgName+"</div></td>"+
					"</tr>");
        });
        	var apwObjectId="";
			if("MUL"==approveType){
				apwObjectId=result.objectId;
			}else if("SINGLE"==approveType){
				apwObjectId=objectId;
			}
        
		$("#approveInfoDiv").append(
		"<input type=\"hidden\"  id=\"selectedRadioIndex\"/>"+
		"<input type=\"hidden\"  id=\"apwApproveType\" value=\""+approveType+"\"/>"+
		"<input type=\"hidden\"  id=\"apwObjectId\" value=\""+apwObjectId+"\"/>"+
		"<input type=\"hidden\"  id=\"approveKey\" value=\""+approveKey+"\"/>"+
		"<input type=\"hidden\"  id=\"curProcessKey\" value=\""+result.processKey+"\"/>"+
		"<input type=\"hidden\"  id=\"approveStatus\" value=\""+result.approveStatus+"\"/>"+
		"<input type=\"hidden\"  id=\"processStatusCode\" value=\""+result.processStatusCode+"\"/>"+
		"<input type=\"hidden\"  id=\"apwSuggest\" value=\""+suggest+"\"/>");
	}
	
	function getSelectedRadio(i){
		$("#selectedRadioIndex").val(i);
	}

	//获取选择的下一节点办理人
	function _getApprover()
	{
		var nextApproverId = $("input[name='approverId']:checked").val();
		var approveType = $("#apwApproveType").val();
		if(comp.isNull(nextApproverId)){
			apw.rollbackInstance($("#apwObjectId").val(),$("#curProcessKey").val(),"请选择待办人");		
		}else{
			comp.hideModal("_selectApprover");
			if("MUL"==approveType){
				var selectedRadioIndex = $("#selectedRadioIndex").val();
				apw.saveCurMulAction(selectedRadioIndex,approveType,$("#apwObjectId").val(),nextApproverId,$("#approveKey").val(),
																 $("approveStatus").val(),$("processStatusCode").val(),$("#apwSuggest").val());
			}else if("SINGLE"==approveType){
				apw.saveCurSingleAction(approveType,$("#apwObjectId").val(),nextApproverId,$("#approveKey").val(),$("#apwSuggest").val());
			}
			mask.showShade();
		}
	}
	
	function approverRollBack(){
		var approveType = $("#apwApproveType").val();
		if("MUL"==approveType){
			apw.rollbackInstance($("#apwObjectId").val(),$("#curProcessKey").val(),"");	
		}
	}
</script>