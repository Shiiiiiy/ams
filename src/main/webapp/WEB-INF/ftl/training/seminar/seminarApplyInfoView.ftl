<div class="formSep">
	<div class="row-fluid">
		<div class="span6">
			<div class="span4">
				<label>讲座名称</label>
			</div>
			<div class="span8">
				<input value="<#if seminarManage?? && seminarManage.seminarName??>${(seminarManage.seminarName!"")?html}</#if>" readonly/>
			</div>
		</div>
		<div class="span6">
			<div class="span4">
				<label>主讲人</label>
			</div>
			<div class="span8">
				<input value="${((seminarManage.outerUserId.userName)!"")?html}" readonly/>
			</div>
		</div>
	</div>
</div>
<div class="formSep">
	<div class="row-fluid">
		<div class="span6">
			<div class="span4">
				<label>报名状态</label>
			</div>
			<div class="span8">
				<input value="<#if applyInfo?? && applyInfo.applyStatus?? && applyInfo.applyStatus.name??>${(applyInfo.applyStatus.name!"")?html}<#else>未报名</#if>" readonly/>
			</div>
		</div>
		<div class="span6">
			<div class="span4">
				<label>讲座时间</label>
			</div>
			<div class="span8">
				<input value="${((seminarManage.seminarDate?string("yyyy-MM-dd"))!"")?html} ${((seminarManage.beginDate)!"")?html}至${((seminarManage.endDate)!"")?html}" readonly/>
			</div>
		</div>
	</div>
</div>
<div class="formSep">
	<div class="row-fluid">
		<div class="span6">
			<div class="span4">
				<label>讲座地点</label>
			</div>
			<div class="span8">
				<input value="<#if seminarManage?? && seminarManage.appointPlace??>${(seminarManage.appointPlace!"")?html}</#if>" readonly/>
			</div>
		</div>
	<#-->	
		<div class="span6">
			<div class="span4">
				<label>参与人数</label>
			</div>
			<div class="span8">
				<input value="<#if seminarManage?? && seminarManage.attendNum??>${(seminarManage.attendNum!"")?html}</#if>" readonly/>
			</div>
		</div>
	<-->	
	</div>
</div>

<div class="formSep">
	<div class="row-fluid">
		<div class="span6">
			<div class="span4">
				<label>备注</label>
			</div>
			<div class="span8">
				<textarea rows="5" cols="12" style="width: 605px; height: 37px;" readonly>${((seminarManage.comment)!"")?html}</textarea>
			</div>
		</div>
	</div>
</div>
<div class="formSep">
	<div class="row-fluid">
		<div class="span12">
			<div class="span2">
				<label>资料附件</label>
			</div>
			<div class="span9">
				<#if uploadFileRefList??>	
					<#list uploadFileRefList as f>
						<div class="fileupload-info">
							<a href="${rc.contextPath}/sys/sysConfig/file.do?id=${f.uploadFile.id}"><strong>${f.uploadFile.name}&nbsp;(${f.uploadFile.fileSize})</strong></a>
						</div>					
					</#list>
				</#if>
			</div>
		</div>
	</div>
</div>

<script>
	function confirm() {
	comp.confirm("确认要报名吗？", function(result) {
		if(!result) {
			return;
		}
		var seminarId = $('#params').val();
		$.post(
			"${rc.contextPath}/training/apply/opt-apply/seminarApplyInfo.do",
			{seminarId:seminarId},
			function(data) {
				window.location.href="${rc.contextPath}/training/apply/opt-query/querySeminarApplyPage.do";
			},
			"text"
		);
	});
}
</script>