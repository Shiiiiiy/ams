      <input id="jobGrantId" type="hidden" name="jobGrantId"  value="${(jobGrant.jobGrantId)!""}">
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
								<#if jobGrant?? && jobGrant.difficultType ?? && jobGrant.difficultType.id==d.id >
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
					<label>就业去向<span class="f_req">*</span></label>
				</div>
				<div class="span9">
					<input id="employeeDesc" name="employeeDesc" <#if flag?? && flag == "view">readOnly</#if> <#if jobGrant??> value="${((jobGrant.employeeDesc)!"")?html}"</#if>/>
				</div>
			 </div>
		    </div>
		  </div>