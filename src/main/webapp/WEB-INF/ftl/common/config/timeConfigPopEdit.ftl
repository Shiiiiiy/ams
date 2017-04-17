<script type="text/javascript">

jQuery.validator.methods.compareValidateDate = function(value, element, param) {
    var startDate = jQuery(param).val();
    return comp.compareDate(startDate,value)
};

jQuery.validator.methods.compareValidateEndDate = function(value, element, param) {
    var endDate = jQuery(param).val();
    return comp.compareDate(value,endDate)
};


$("document").ready(function(){
     $("#_timeConfigForm").compValidate({
		rules:{     
				name: {required:true},
				code:{required:true},
				beginDate:{required:true,compareValidateEndDate:'#endDate'},
				endDate:{required:true,compareValidateDate:'#beginDate'}
			},
			messages:{
				name:{required:'显示名称不能为空'},
				code:{required:'编码不能为空'},
				beginDate:{required:'开始时间不能为空',compareValidateEndDate:'截止时间不能早于开始时间'},
				endDate:{required:'截止时间不能为空',compareValidateDate:'截止时间不能早于开始时间'}
			}
	});
});
</script>
<div class="row-fluid">
  <form  id="_timeConfigForm" class="form_validation_reg" action="${rc.contextPath}/common/config/opt-submit/ajaxSubmitTimeConfig.do" method="post">
  <input type="hidden" name="id" value="${configModel.id!""?html}"/>
  <div class="formSep">
  		<div class="row-fluid">
      		<div class="span6">
      		  	<div class="span3">
        			<span class="formTitle">名称</span>
        	 	</div>
           	  	<div class="span8">
       				<input name="name" readonly value="${(configModel.name!"")?html}"/>
        		</div> 
        	</div> 
        	<div class="span6">
      		  	<div class="span3">
        			<span class="formTitle">编码</span>
        	 	</div>
           	  	<div class="span8">
       				<input name="code" readonly  value="${(configModel.code!"")?html}"/>
        		</div>
        	</div>
    	</div>     	
   </div> 
 
  <div class="formSep">
  		<div class="row-fluid">
  		<div class="span6">
  		  	<div class="span3">
    			<span class="formTitle">开始日期</span><span class="formRed">*</span>
    	 	</div>
       	  	<div class="span8">
   				<input name="beginDate" id="beginDate" class="Wdate"  onclick="WdatePicker({skin:'whyGreen'});"   value="${(configModel.beginDate!"")?string("yyyy-MM-dd")}"/>
    		</div>
    	</div>
    	<div class="span6">
  		  	<div class="span3">
    			<span class="formTitle">截止日期</span><span class="formRed">*</span>
    	 	</div>
       	  	<div class="span8">
   				<input name="endDate" id="endDate" class="Wdate"  onclick="WdatePicker({skin:'whyGreen'});" value="${(configModel.endDate!"")?string("yyyy-MM-dd")}"/>
    		</div>
    	</div>
    	</div>
   </div> 
  <div class="formSep">
  	<div class="row-fluid">
  	<div class="span6">
  		<div class="span3">
     		<span class="formTitle">学院单位</span>
    	</div>
       	<div class="span8">
     		<select size="1" id="collegeId" name="college.id" readonly aria-controls="dt_gal">
				<#if configModel.college ?? && configModel.college.id ?? >
					<option  value="${configModel.college .id}" selected="selected">${configModel.college .name?html}</option>
				<#else>
					<option value="" selected="selected">学生处</option>
				</#if>
			</select>										
  		</div>
  	</div>
  </div>
  </div>
  </form>
</div>

