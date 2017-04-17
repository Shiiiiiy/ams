     <input id="aidGrantId" type="hidden" name="aidGrantId"  value="${(aidGrant.aidGrantId)!""}">
     <div class="formSep">
		 <div class="row-fluid">
		   <div class="span6">
			  <div class="span3">
				  <label>助学金等级<span class="f_req">*</span></label>
				</div>
				<div class="span9">
				   <select <#if flag?? && flag == "view">disabled="disabled"</#if> size="1" id="aidLevel" name="aidLevel.id" aria-controls="dt_gal" >
					 <option value="">请选择..</option>
					   <#if aidLevelList ??>
							<#list aidLevelList as d>
								<#if aidGrant?? && aidGrant.aidLevel ?? && aidGrant.aidLevel.id==d.id >
									<option  value="${d.id}" selected="selected">${d.name?html}</option>
								<#else>
									<option value="${d.id}">${d.name?html}</option>
								</#if>
							</#list>
						</#if>
				    </select>
			     </div>
			  </div>
		    </div>
		  </div>
				  
	   <div class="formSep">
	     <div class="row-fluid">
	       <div class="span6">
				<div class="span3">
					<label>是否获得本学年国家助学金<span class="f_req">*</span></label>
				</div>
				<div class="span9">
				 <#if isNationalAwardList??>
					<#list isNationalAwardList as a>
		    			<#if aidGrant?? && aidGrant.isNationalAidAward?? && aidGrant.isNationalAidAward.id==a.id >
			    				<label class="radio inline">
									<input type="radio" id="isNationalAidAward" name="isNationalAidAward.id" <#if flag?? && flag == "view">disabled</#if> checked="checked" value="${a.id}" />${a.name?html}
								</label>
			    			
		    			<#else>
		    				<label class="radio inline">
								<input type="radio" id="isNationalAidAward" name="isNationalAidAward.id" <#if flag?? && flag == "view">disabled</#if> value="${a.id}" />${a.name?html}
							</label>
		    		   </#if>
    			    </#list>
    			  </#if>
				</div>
			 </div>
		  
		  <div class="span6">
			 <div class="span3">
				<label>是否存在上学年补考不及格科目<span class="f_req">*</span></label>
			  </div>
				<div class="span9">
				 <#if isExamFailList??>
					<#list isExamFailList as a>
		    			<#if aidGrant?? && aidGrant.isExamFail?? && aidGrant.isExamFail.id==a.id >
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
		  </div>
	   </div>