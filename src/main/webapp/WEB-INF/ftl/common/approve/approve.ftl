<div class="modal hide fade" id="ams_approveHonor">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3 id="title1">审核信息</h3>
	</div>
	<div class="modal-body"  id="ams_approveBody">
	    <form id="associationForm" >
		    <input id="amsApplyApproveIds" type="hidden"/>
		    <input id="amsApplyApproveType" type="hidden"/>
			<#-- 
			<div class="formSep">
				<div class="row-fluid">
					<div class="span12">
						<div class="span2">
							<label >审核状态</label>
						</div>
						<div>
							<select size="1" id="amsApproveStatus" name="amsApproveStatus" aria-controls="dt_gal" class="span3"
							class="{required:true,messages:{required:'审核状态不能为空!'}}">
								<option value="">请选择..</option>
									<#if applyApproveStatusList??>
								        <#list applyApproveStatusList as g>
											<option value="${g.code}" >${g.name}</option>
									    </#list>
									</#if>
					        </select>	
						</div>
					</div>
				</div>
		    </div>
		    -->
			<div class="formSep">
				<div class="row-fluid">
					<div class="span12">
						<div class="span2">
							<label >审核意见<span class="f_req">*</span></label>
						</div>
						<div>
			                <textarea name="amsApproveSuggest" id="amsApproveSuggest" class="span8" maxlength="50" rows="3" onkeyup="value=value.replace(/\s/g,'')"></textarea>
						</div>
					</div>
				</div>
		    </div>
	    </form>
	</div>
		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal" onclick="doClearAction()">取消</a>
			<a href="#" class="btn btn-info" onclick="doOkAction()">确定</a>
		</div>
		</div>
<script>
	/**
	  * 打开面板数据初始化
	  * @ids  当前审批记录id
	  * @approveType  审批类型【单次审批 SINGLE、批量审批：MUL】
	  */
	function _initApplyApprovePanel(ids,approveType){
		$('#ams_approveHonor').width(600).css("marginLeft","-350px").css("marginTop","-250px");
		$('#ams_approveBody').css("max-height","320px");
		$('#amsApplyApproveIds').val(ids);
		$('#amsApplyApproveType').val(approveType);
	}
	
	function doOkAction(){
		var amsApproveSuggest = $("#amsApproveSuggest").val();
		if(!amsApproveSuggest){
		     comp.message("审核意见为必填项且长度不超过50！","error");
		     return;
		}
		var memberIds = $("#amsApplyApproveIds").val();
		var amsApplyApproveType = $("#amsApplyApproveType").val();
		//var amsApproveStatus = $("#amsApproveStatus").val();
		var amsApproveSuggest = $("#amsApproveSuggest").val();
		approveSubmit(memberIds,amsApplyApproveType,'',amsApproveSuggest);
	    comp.hideModal("ams_approveHonor");
	    doClearAction();
	}
	
    function doClearAction(){
		$("#amsApplyApproveIds").val("");
		$("#amsApplyApproveType").val("");
		//$("#amsApproveStatus").val("");
		$("#amsApproveSuggest").val("");
    }
</script>