<h3 class="heading">讲座信息</h3>
<div class="formSep">
	<div class="row-fluid">
		<div class="span6">
			<div class="span4">
				<label>讲座名称</label>
			</div>
			<div class="span8">
				<input value="${((seminarManage.seminarName)!"")?html}" readonly/>
			</div>
		</div>
		<div class="span6">
			<div class="span4">
				<label>主讲人</label>
			</div>
			<div class="span8">
				<input value="${(seminarManage.outerUserId.userName)!""}" readonly/>
			</div>
		</div>
	</div>
</div>
<div class="formSep">
	<div class="row-fluid">
		<div class="span6">
			<div class="span4">
				<label>讲座时间</label>
			</div>
			<div class="span8">
				<input value="${((seminarManage.seminarDate?string("yyyy-MM-dd"))!"")?html} ${(seminarManage.beginDate)!""}至${(seminarManage.endDate)!""}" readonly/>
			</div>
		</div>
		<div class="span6">
			<div class="span4">
				<label>讲座地点</label>
			</div>
			<div class="span8">
				<input value="${((seminarManage.appointPlace)!"")?html}" readonly/>
			</div>
		</div>
	</div>
</div>
<#-->

<div class="formSep">
	<div class="row-fluid">
		<div class="span6">
			<div class="span4">
				<label>参加人数</label>
			</div>
			<div class="span8">
				<input value="${((seminarManage.attendNum)!"")?html}" readonly/>
			</div>
		</div>
	</div>
</div>
<-->
	<#-->
		<div class="formSep">
			<div class="row-fluid">
				<div class="span6">
					<div class="span4">
						<label>讲座主题</label>
					</div>
					<div class="span8">
						<textarea rows="5" cols="12" style="width: 595px; height: 37px;" readonly>${((seminarManage.seminarTheme)!"")?html}</textarea>
					</div>
				</div>
			</div>
		</div>
	<-->	
<div class="formSep">
	<div class="row-fluid">
		<div class="span6">
			<div class="span4">
				<label>备注</label>
			</div>
			<div class="span8">
				<textarea rows="5" cols="12" style="width: 605px; height: 125px;" readonly>${(seminarManage.comment)!""}</textarea>
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
<h3 class="heading">预约信息</h3>
<div class="formSep">
	<div class="row-fluid">
		<div class="span6">
			<div class="span4">
				<label>预约状态</label>
			</div>
			<div class="span8">
				<input value="${((subscribeInfo.appointStatus.name)!"未预约")?html}" readonly/>
			</div>
		</div>
		<div class="span6">
			<div class="span4">
				<label>预约时间</label>
			</div>
			<div class="span8">
				<input value="<#if subscribeInfo?? && subscribeInfo.appointTime??>${((subscribeInfo.appointTime?string("yyyy-MM-dd"))!"")?html} ${(subscribeInfo.beginDate)!""}至${(subscribeInfo.endDate)!""}</#if>" readonly/>
			</div>
		</div>
	</div>
</div>
<div class="formSep">
	<div class="row-fluid">
		<div class="span6">
			<div class="span4">
				<label>预约地点</label>
			</div>
			<div class="span8">
				<input value="${((subscribeInfo.appointPlace)!"")?html}" readonly/>
			</div>
		</div>
		<div class="span6">
			<div class="span4">
				<label>预约人数</label>
			</div>
			<div class="span8">
				<input value="${((subscribeInfo.appointNum)!"")?html}" readonly/>
			</div>
		</div>
	</div>
</div>
	<div class="formSep">
		<div class="row-fluid">
			<div class="span6">
				<div class="span4">
					<span class="formTitle">电话</span>
				</div>
				<div class="span8">
					<input id="appointPhone" name="appointPhone" value="${((subscribeInfo.appointPhone)!"")?html}"  readonly/>
				</div>
			</div>
			<div class="span6">
				<div class="span4">
					<span class="formTitle">邮箱</span>
				</div>
				<div class="span8">
					<input id="appointEmail" name="appointEmail" value="${((subscribeInfo.appointEmail)!"")?html}"  readonly/>
				</div>
			</div>
		</div>
	</div>
	
	<div class="formSep">
		<div class="row-fluid">
			<div class="span6">
				<div class="span4">
					<span class="formTitle">QQ号码</span>
				</div>
				<div class="span8">
					<input id="appointQQ" name="appointQQ" value="${((subscribeInfo.appointQQ)!"")?html}"  readonly/>
				</div>
			</div>
			<div class="span6">
				<div class="span4">
					<span class="formTitle">预约人</span>
				</div>
				<div class="span8">
					<input id="appointUserId" name="appointUserId.name" value="<#if subscribeInfo??&&subscribeInfo.appointUserId?? && subscribeInfo.appointUserId.name??>${((subscribeInfo.appointUserId.name)!"")?html}<#else>${user_key.userName!""}</#if>"  readonly/>
				</div>
			</div>
		</div>
	</div>