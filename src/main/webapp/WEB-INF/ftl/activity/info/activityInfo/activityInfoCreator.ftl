<h5 class="heading">活动申请人信息</h5>
<div class="formSep">
	<div class="row-fluid">
		<div class="span6">
			<div class="span3">
			    <label>姓名</label>
			</div>
			<div class="span9">
				<input id="name" name="" <#if activity?? && activity.creator ??> value="${activity.creator.name!""?html}" </#if> readonly />
			</div>
		</div>
		<div class="span6">
			<div class="span3">
				<label>手机号码</label>
			</div>
			<div class="span9">  
				<input id="phone" name="" <#if activity ??>value="${activity.creator.phone1!""?html}"</#if> readonly/>
			</div>
		</div>
	</div>
</div>