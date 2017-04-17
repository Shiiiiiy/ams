<div id="advisorInfoDiv">
<input type="hidden" id="aamListSize" value="${aamList?size}"/>	
<form id="advisorInfoForm">
<#list aamList as p>
	<#if p.comments?? && p.comments!="">
		<div class="row-fluid">
			<div class="span12">
				<span class="span12" style="word-warp:break-word;word-break:break-all"><label class="text inline"><#if p.comments??>${(p.comments!"")?html}<#if p.updateTime??>【${(p.updateTime!"")?string('yyyy-MM-dd')}】</#if></#if></label></span>
				<input type="hidden" id="comment_${(p.advisorPo.code!"")?html}" name="advisorComment_" value="${p.comments!""}"/>	
			</div>
        </div>
	</#if>
</#list>
</form>
</div>