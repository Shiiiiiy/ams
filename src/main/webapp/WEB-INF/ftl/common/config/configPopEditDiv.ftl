<!-- ajax form-->
<script src="${rc.contextPath}/js/jquery.form.js"></script>
<link rel="stylesheet" href="${rc.contextPath}/lib/My97DatePicker/skin/WdatePicker.css" />
<script type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>

<div class="modal hide fade" id="_timeConfigEditDiv">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3 id="title1">时间设置</h3>
	</div>
	<div class="modal-body" id="_time_config_body">
		
	</div>
	<div class="modal-footer">
		<a href="javascript:void(0);" class="btn btn-info" onclick="timeConfig._saveTimeConfig()">保存</a>
		<a href="javascript:void(0);" class="btn" data-dismiss="modal">关闭</a>
	</div>
</div>