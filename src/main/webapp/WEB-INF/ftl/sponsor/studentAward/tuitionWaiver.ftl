      <input id="tuitionWaiverId" type="hidden" name="tuitionWaiverId"  value="${(tuitionWaiver.tuitionWaiverId)!""}">
      <div class="formSep">
		 <div class="row-fluid">
		   <div class="span6">
			  <div class="span3">
				  <label>困难类型<span class="f_req">*</span></label>
				</div>
				<div class="span9">
				   <select <#if flag?? && flag == "view">disabled="disabled"</#if> size="1" id="difficultType" name="difficultType.id" aria-controls="dt_gal" >
					 <option value="">请选择..</option>
					   <#if difficultTypeList ??>
							<#list difficultTypeList as d>
								<#if tuitionWaiver?? && tuitionWaiver.difficultType ?? && tuitionWaiver.difficultType.id==d.id >
									<option  value="${d.id}" selected="selected">${d.name?html}</option>
								<#else>
									<option value="${d.id}">${d.name?html}</option>
								</#if>
							</#list>
						</#if>
				    </select>
			     </div>
			  </div>
			  
			  <div class="span6">
				<div class="span3">
					<label>申请减免金额<span class="f_req">*</span></label>
				</div>
				<div class="span9">
					<input id="applyReduceMoney" name="applyReduceMoney" <#if flag?? && flag == "view">readOnly</#if> <#if tuitionWaiver?? && tuitionWaiver.applyReduceMoney??> value="${((tuitionWaiver.applyReduceMoney)!"")?html}"</#if>/>
				</div>
			 </div>
		    </div>
		  </div>
		  
		<div class="formSep">
	     <div class="row-fluid">
	       <div class="span6">
				<div class="span3">
					<label>是否存在上学年补考不及格科目<span class="f_req">*</span></label>
				</div>
				<div class="span9">
				 <#if isExamFailList??>
					<#list isExamFailList as a>
		    			<#if tuitionWaiver?? && tuitionWaiver.isExamFail?? && tuitionWaiver.isExamFail.id==a.id >
			    				<label class="radio inline">
									<input type="radio" id="isExamFail" name="isExamFail.id" <#if flag?? && flag == "view">disabled</#if> checked="checked" value="${a.id}" />${a.name?html}
								</label>
			    			
		    			<#else>
		    				<label class="radio inline">
								<input type="radio" id="isExamFail" name="isExamFail.id" <#if flag?? && flag == "view">disabled</#if> value="${a.id}" />${a.name?html}
							</label>
		    		   </#if>
    			    </#list>
    			  </#if>
				</div>
			 </div>
		  
		  <div class="span6">
			 <div class="span3">
				<label>上学年综合素质测评是否处于班级中等或以上水平<span class="f_req">*</span></label>
			  </div>
				<div class="span9">
				 <#if iSEvaluateMidelList??>
					<#list iSEvaluateMidelList as a>
		    			<#if tuitionWaiver?? && tuitionWaiver.iSEvaluateMidel?? && tuitionWaiver.iSEvaluateMidel.id==a.id >
			    				<label class="radio inline">
									<input type="radio" id="iSEvaluateMidel" name="iSEvaluateMidel.id" <#if flag?? && flag == "view">disabled</#if> checked="checked" value="${a.id}" />${a.name?html}
								</label>
			    			
		    			<#else>
		    				<label class="radio inline">
								<input type="radio" id="isEiSEvaluateMidelxamFail" name="iSEvaluateMidel.id" <#if flag?? && flag == "view">disabled</#if> value="${a.id}" />${a.name?html}
							</label>
		    		   </#if>
    			  </#list>
    			 </#if>
				</div>
			 </div>
		  </div>
	   </div>