<div class="formSep">
	<div class="row-fluid">
		<div class="span6">
			<div class="span2"><label>姓名</label></div>
			<div class="span10">
				<input id="teacherName" class="span8"  readonly name="teacherName" <#if advisor?? && advisor.advisorPo ??>value="${(advisor.advisorPo.name!"")?html}"</#if>/>
			</div>
		</div>
		<div class="span6">
			<div class="span2"><label>工号</label></div>
            <div class="span10">
               <input id="teacherCode" class="span8" readonly name="teacherCode" <#if advisor?? && advisor.advisorPo ??>value="${(advisor.advisorPo.code!"")?html}"</#if>/>
			</div>
		</div>
	</div>
</div>
<div class="formSep">
	<div class="row-fluid">
		<div class="span12">
			<div class="span1"><label>简介 </label></div>
			<div class="span11">
				<textarea cols="180" rows="8" name="comments" class="span10" readonly style="width:505px;"><#if advisor??>${advisor.comments!""}</#if></textarea>
			</div>
		</div>
	</div>
</div>
