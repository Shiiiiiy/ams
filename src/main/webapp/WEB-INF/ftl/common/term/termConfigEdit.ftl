<script type="text/javascript">

jQuery.validator.methods.compareValidateDate = function(value, element, param) {
    var startDate = jQuery(param).val();
    return comp.compareDate(startDate,value)
};

$("document").ready(function(){
     $("#_termConfigForm").compValidate({
		rules:{     
				'yearDic.id': {required:true},
				'termDic.id':{required:true},
				beginDate:{required:true},
				endDate:{required:true,compareValidateDate:'#beginDate'}
			},
			messages:{
				'yearDic.id':{required:'请选择学年'},
				'termDic.id':{required:'请选择学期'},
				beginDate:{required:'开始日期不能为空'},
				endDate:{required:'结束日期不能为空',compareValidateDate:'结束日期不能早于开始日期'}
			}
	});
});
</script>

<div class="row-fluid">
	  <form  id="_termConfigForm" class="form_validation_reg" action="${rc.contextPath}/common/config/opt-submit/ajaxSubmitTimeConfig.do" method="post">
	  <input type="hidden" name="id" value="${termModel.id!""?html}"/>
	  <div class="formSep">
	  		<div class="row-fluid">
	      		<div class="span6">
	      		  	<div class="span4">
	      		  		<label>学年<span class="f_req">*</span></label>
	        	 	</div>
	           	  	<div class="span8">
	       				<select size="1" id="yearId" name="yearDic.id" aria-controls="dt_gal" class="span8">
							<option value="" >请选择..</option>
							<#if yearList ?? >
								<#list yearList as m>
									<#if termModel ?? && termModel.yearDic ?? &&  termModel.yearDic.id == m.id >
										<option value="${m.id}" selected >${m.name?html}</option>
									<#else>
										<option value="${m.id}">${m.name?html}</option>
									</#if>
								</#list>
							</#if>
						</select>
	        		</div> 
	        	</div> 
	        	<div class="span6">
	      		  	<div class="span4">
	        			<label>学期<span class="f_req">*</span></label>
	        	 	</div>
	           	  	<div class="span8">
	       				<select size="1" id="termId" name="termDic.id" aria-controls="dt_gal" class="span8">
							<option value="" >请选择..</option>
							<#if termList ?? >
								<#list termList as m>
									<#if termModel ?? && termModel.termDic ?? &&  termModel.termDic.id == m.id >
										<option value="${m.id}" selected >${m.name?html}</option>
									<#else>
										<option value="${m.id}">${m.name?html}</option>
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
	  		  	<div class="span4">
	  		  		<label>开始日期<span class="f_req">*</span></label>
	    	 	</div>
	       	  	<div class="span8">
	   				<input name="beginDate" id="beginDate" class="Wdate span8"  onclick="WdatePicker({skin:'whyGreen'});"  <#if termModel.beginDate ??> value="${(termModel.beginDate!"")?string("yyyy-MM-dd")}" </#if> />
	    		</div>
	    	</div>
	    	<div class="span6">
	  		  	<div class="span4">
	  		  		<label>结束日期<span class="f_req">*</span></label>
	    	 	</div>
	       	  	<div class="span8">
	   				<input name="endDate" id="endDate" class="Wdate span8"  onclick="WdatePicker({skin:'whyGreen'});" <#if termModel.endDate ??> value="${(termModel.endDate!"")?string("yyyy-MM-dd")}" </#if> />
	    		</div>
	    	</div>
	    	</div>
	   </div> 

	  </form>
</div>

