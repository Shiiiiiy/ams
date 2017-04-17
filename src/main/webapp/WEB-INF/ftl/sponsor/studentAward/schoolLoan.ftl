      <input id="schoolLoanId" type="hidden" name="schoolLoanId"  value="${(schoolLoan.schoolLoanId)!""}">
      <div class="formSep">
		 <div class="row-fluid">
		   <div class="span6">
			  <div class="span3">
				  <label>申请金额<span class="f_req">*</span></label>
				</div>
				<div class="span9">
				   <input id="applyMoney" name="applyMoney" <#if flag?? && flag == "view">readOnly</#if> <#if schoolLoan??> value="${((schoolLoan.applyMoney)!'')}"</#if>/>
			     </div>
			  </div>
			  <div class="span6">
				<div class="span3">
					<label>还款日期<span class="f_req">*</span></label>
				</div>
				<div class="span9">
					<input id="returnTime" name="returnTime" class="Wdate"  style="cursor:pointer" onclick="WdatePicker({skin:'whyGreen', dateFmt:'yyyy-MM-dd'});" 
				  <#if flag?? && flag == "view">readOnly</#if> <#if schoolLoan?? && schoolLoan.returnTime??> value="${(schoolLoan.returnTime)?string('yyyy-MM-dd')}" </#if> />
				</div>
			 </div>
		    </div>
		  </div>
		  
		   <div class="formSep">
				<div class="row-fluid">
				  <div class="span6">
					<div class="span3">
						<label>家长意见<span class="f_req">*</span></label>
					 </div>
					  <div class="span9">
						<#if schoolLoan?? && schoolLoan.parentOpinion??>
						    <textarea rows="5" cols="12" id="parentOpinion" name="parentOpinion" <#if flag?? && flag == "view">readOnly</#if> style="width: 775px; height: 80px;">${(schoolLoan.parentOpinion!"")}</textarea>
						<#else>
						    <textarea rows="5" cols="12" id="parentOpinion" name="parentOpinion" <#if flag?? && flag == "view">readOnly</#if> style="width: 775px; height: 80px;"></textarea>
						</#if>	
					</div>
				  </div>
				 </div>
				</div>
				
			  <div class="formSep">
				<div class="row-fluid">
				  <div class="span6">
					<div class="span3">
						<label>班主任意见<span class="f_req">*</span></label>
					 </div>
					  <div class="span9">
						<#if schoolLoan?? && schoolLoan.teacherOpinion??>
						    <textarea rows="5" cols="12" id="teacherOpinion" name="teacherOpinion"  <#if flag?? && flag == "view">readOnly</#if> style="width: 775px; height: 80px;">${(schoolLoan.teacherOpinion!"")}</textarea>
						<#else>
						    <textarea rows="5" cols="12" id="teacherOpinion" name="teacherOpinion"  <#if flag?? && flag == "view">readOnly</#if> style="width: 775px; height: 80px;"></textarea>
						</#if>	
					</div>
				  </div>
				 </div>
				</div>  