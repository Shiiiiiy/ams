      <div class="formSep">
		 <div class="row-fluid">
	       <div class="span6">
			  <div class="span3">
				  <label>推荐档次<span class="f_req">*</span></label>
				</div>
				<div class="span9">
				   <select size="1" id="difficultLevel" name="difficultLevel.id" aria-controls="dt_gal" >
					  <option value="" />请选择..</option>
						<#if difficultList ??>
							<#list difficultList as d>
								<#if difficultStudent?? && difficultStudent.difficultLevel ?? && difficultStudent.difficultLevel.id==d.id >
									     <option  value="${d.id}" selected="selected" />${d.name?html}</option>
								<#else>
										<option value="${d.id}" >${d.name}</option>	
								</#if>
							</#list>
						</#if>
				 	</select>
				</div>
			 </div>
		  </div> 
	   </div>
	 <#--
	 <div class="formSep">
	  <div class="row-fluid">
	   <div class="span6">
	    <div class="span3">
		  <label>初审意见<span class="f_req"></span></label>
		 </div>
		<div class="span9">
		  <div id="dt_gal_wrapper"  style="width:785px;" role="grid">
			<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
				 <thead>
				       <tr>
							<th width="10%">审核人</th>
							<th width="10%">审核结果</th>
							<th width="80%">审核意见</th>
					   </tr>
				  </thead>
				 <tbody>
				  <#if instanceList??>	
					 <#list instanceList as p>
						<tr>
							<td class="autocut">${(p.approver.name)!""}</td>
							<td class="autocut">${(p.approveResultDic.name)!""}</td>
							<td class="autocut">${(p.suggest)!""}</td>
						</tr>
					  </#list>
				   </#if>	
					</tbody>
				</table>
			</div>
		</div>
	 </div>
   </div>
  </div> 
  -->
	 <div class="formSep">
		 <div class="row-fluid">
			 <div class="span6">
				<div class="span3">
					<label>审核意见<span class="f_req"></span></label>
				 </div>
			     <div class="span9">
					<#if difficultStudent?? && difficultStudent.approveReason??>
					    <textarea rows="5" cols="12" id="approveReason" name="approveReason" style="width: 775px; height: 134px;">${(difficultStudent.approveReason)!""}</textarea>
					<#else>
					    <textarea rows="5" cols="12" id="approveReason" name="approveReason" style="width: 775px; height: 134px;"></textarea>
				</#if>	
			</div>
		 </div>
	  </div>
   </div> 
   