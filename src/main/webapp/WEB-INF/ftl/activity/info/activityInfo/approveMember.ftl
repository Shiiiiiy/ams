<div class="modal hide fade" id="approveMember">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3 id="title1">审核信息</h3>
	</div>
	<div class="modal-body"  id="approve">
        <input id="memberIds" name="memberIds" type="hidden"/>
		<div class="formSep">
			<div class="row-fluid">
				<div class="span12">
					<div class="span2">
						<label >审核意见<span class="f_req">*</span></label>
					</div>
					<div>
                        <textarea name="suggest" id="suggest" class="span8"  rows="3" maxlength="50" class="{required:true,messages:{required:'不能为空!'}}" onkeyup="value=value.replace(/\s/g,'')"></textarea>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<a href="#" class="btn" data-dismiss="modal" onclick="clear()">取消</a>
		<a href="#" class="btn btn-info" onclick="approveSubmit()">确定</a>
	</div>
</div>
		