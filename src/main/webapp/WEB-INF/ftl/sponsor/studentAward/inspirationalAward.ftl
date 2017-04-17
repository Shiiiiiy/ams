     <input id="inspirationalAwardId" type="hidden" name="inspirationalAwardId"  value="${(inspirationalAward.inspirationalAwardId)!""}">
     <div class="formSep">
		 <div class="row-fluid">
		   <div class="span6">
			  <div class="span3">
				  <label>获奖类型<span class="f_req">*</span></label>
				</div>
				<div class="span9">
				   <select <#if flag?? && flag == "view">disabled="disabled"</#if> size="1" id="awardKind" name="awardKind.id" aria-controls="dt_gal" >
					 <option value="">请选择..</option>
					   <#if awardKindList ??>
							<#list awardKindList as d>
								<#if inspirationalAward?? && inspirationalAward.awardKind ?? && inspirationalAward.awardKind.id==d.id >
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
					<label>是否获得上学年奖学金<span class="f_req">*</span></label>
				</div>
				<div class="span9">
				 <#if nationAwardList??>
					<#list nationAwardList as a>
		    			<#if inspirationalAward?? && inspirationalAward.nationalInspirationalAward?? && inspirationalAward.nationalInspirationalAward.id==a.id >
			    				<label class="radio inline"> 
									<input type="radio" id="nationalInspirationalAward" name="nationalInspirationalAward.id" <#if flag?? && flag == "view">disabled</#if> checked="checked" value="${a.id}" />${a.name?html}
								</label>
			    			
		    			<#else>
		    				<label class="radio inline">
								<input type="radio" id="nationalInspirationalAward" name="nationalInspirationalAward.id" <#if flag?? && flag == "view">disabled</#if> value="${a.id}" />${a.name?html}
							</label>
		    		   </#if>
    			    </#list>
    			  </#if>
				</div>
			 </div>
		  
		  <div class="span6">
			 <div class="span3">
				<label>是否获得上学年行知奖学金<span class="f_req">*</span></label>
			  </div>
				<div class="span9">
				 <#if xingZhiAwardList??>
					<#list xingZhiAwardList as a>
		    			<#if inspirationalAward?? && inspirationalAward.xingZhiAward?? && inspirationalAward.xingZhiAward.id==a.id >
			    				<label class="radio inline">
									<input type="radio" id="xingZhiAward" name="xingZhiAward.id" <#if flag?? && flag == "view">disabled</#if> checked="checked" value="${a.id}" />${a.name?html}
								</label>
			    			
		    			<#else>
		    				<label class="radio inline">
								<input type="radio" id="xingZhiAward" name="xingZhiAward.id"  <#if flag?? && flag == "view">disabled</#if> value="${a.id}" />${a.name?html}
							</label>
		    		   </#if>
    			  </#list>
    			 </#if>
				</div>
			 </div>
		  </div>
	   </div>