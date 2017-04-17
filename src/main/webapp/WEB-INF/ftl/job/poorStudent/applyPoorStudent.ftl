  <form class="form_validation_reg" id="editPoorStudentForm">
	<div class="formSep">
	  <div class="row-fluid">
		 <div class="span6">
			<div class="span3">
				<label>困难类别<span class="f_req">*</span></label>
			  </div>
			   <div class="span9">
			    <select size="1" id="difficultType" name="difficultType.id" aria-controls="dt_gal">
			      <option value="" />请选择..</option>
					<#if difficultTypeList ??>
						<#list difficultTypeList as d>
							<#if poorStudent?? && poorStudent.difficultType ?? && poorStudent.difficultType.id==d.id >
								<option  value="${d.id}" selected="selected" />${d.name?html}</option>
							<#else>
								<option value="${d.id}" />${d.name?html}</option>
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
				<label>困难原因<span class="f_req">*</span></label>
			 </div>
			  <div class="span9">
				<#if poorStudent?? && poorStudent.reason??>
				    <textarea rows="5" cols="12" id="reason" name="reason" style="width: 402px; height: 148px;">${(poorStudent.reason!"")}</textarea>
				<#else>
				    <textarea rows="5" cols="12" id="reason" name="reason" style="width: 402px; height: 148px;"></textarea>
				</#if>	
			</div>
		  </div>
		 </div>
		</div> 
    </form>