<div class="formSep">
<div class="row-fluid">
	<div class="span2">&#12288;&#12288;姓名<span class="f_req"></span></div>
	<div class="span4">
		<#if aam_.advisorPo?? >${(aam_.advisorPo.name!"")?html}</#if>
		<input type="hidden" id="aamId" value="${aam_.id!""}"/>
    </div>
	<div class="span2">&#12288;&#12288;工号<span class="f_req"></span></div>
	<div class="span4">
		<#if aam_.advisorPo?? >${(aam_.advisorPo.code!"")?html}</#if>
    </div>
</div>
</div>
<div class="row-fluid"><div class="span12"></div>&nbsp;</div>
<div class="formSep">
<div class="row-fluid">
	<div class="span12">
		<span class="span2">教师简介<span class="f_req"></span></span>
		<textarea cols="40" rows="15" id="advisorComments" name="comments" class="span10" 
		onkeyup="value=value.replace(/\s/g,'')"><#if aam_.comments?? && aam_.comments!="">${(aam_.comments!"")?html}<#elseif aam_.advisorPo??>${(aam_.advisorPo.name!"")?html}，</#if></textarea>
    	<br><font size="1" color="grey"  style="vertical-align:bottom; padding-bottom:10px">(不超过500字)</font>
    	<input type="hidden" id="advisorId_" value="<#if aam_.advisorPo?? >${(aam_.advisorPo.code!"")?html}</#if>"/>
    </div>
</div>
</div>