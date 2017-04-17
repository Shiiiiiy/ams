<html>
<head>
	<link rel="stylesheet" href="${rc.contextPath}/lib/My97DatePicker/skin/WdatePicker.css" />
	<script type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
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
		     $(".form_validation_reg").compValidate({
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
</head>
<body>

<div id="contentwrapper">
    <div class="main_content">
 		<div class="row-fluid">
     	<h3 class="heading">时间配置</h3>
      <form  id="timeConfigForm" class="form_validation_reg" action="${rc.contextPath}/common/config/opt-submit/submitTimeConfig.do" method="post">
       <input type="hidden" name="id" value="${configModel.id!""?html}"/>
      <div class="formSep">
      		<div class="row-fluid">
	      		<div class="span5">
	      		  	<div class="span3">
	        			<span class="formTitle">名称</span><span class="formRed">*</span>
	        	 	</div>
	           	  	<div class="span8">
	       				<input name="name"  value="${(configModel.name!"")?html}"/>
	        		</div> 
	        	</div> 
	        	<div class="span5">
	      		  	<div class="span3">
	        			<span class="formTitle">编码</span><span class="formRed">*</span>
	        	 	</div>
	           	  	<div class="span8">
	           	  	  <#if user_key.optMap??>
						<#if user_key.optMap['add']??>
		       				<input name="code" value="${(configModel.code!"")?html}"/>
		       				<#else>
		       				<input name="code" readonly  value="${(configModel.code!"")?html}"/>
	       				</#if>
       				  </#if>
	        		</div>
	        	</div>
        	</div>     	
       </div> 
     
      <div class="formSep">
      		<div class="row-fluid">
      		<div class="span5">
      		  	<div class="span3">
        			<span class="formTitle">开始时间</span><span class="formRed">*</span>
        	 	</div>
           	  	<div class="span8">
       				<input name="beginDate" id="beginDate" class="Wdate"  onclick="WdatePicker({skin:'whyGreen'});"   value="${(configModel.beginDate!"")?html}"/>
        		</div>
        	</div>
        	<div class="span5">
      		  	<div class="span3">
        			<span class="formTitle">截止时间</span><span class="formRed">*</span>
        	 	</div>
           	  	<div class="span8">
       				<input name="endDate" id="endDate" class="Wdate"  onclick="WdatePicker({skin:'whyGreen'});" value="${(configModel.endDate!"")?html}"/>
        		</div>
        	</div>
        	</div>
       </div> 
      <div class="formSep">
      	<div class="row-fluid">
      	<div class="span5">
      		<div class="span3">
         		<span class="formTitle">学院单位</span><span class="formRed">*</span>
        	</div>
           	<div class="span8">
         		<select size="1" id="collegeId" name="college.id" aria-controls="dt_gal">
					<option value="">学生处</option>
					<#list collageList as d>
						<#if configModel.college ?? && configModel.college.id ==d.id >
							<option  value="${d.id}" selected="selected">${d.name?html}</option>
						<#else>
							<option value="${d.id}" >${d.name?html}</option>
						</#if>
					</#list>
				</select>										
      		</div>
      	</div>
      </div>
      </div>
      <br/><br/><br/><br/><br/>
      	<div class="row-fluid">
	      	<div class="span5">
	      		<div class="span3"></div>
	           	<div class="span8">
	         		<button class="btn btn-info" onclick="javascript:$('#timeConfigForm').submit();">保 存</button>		
	         		<button class="btn" onclick="javascript:window.history.back(-1);">返 回</button>							
	      		</div>
	      	</div>
	      </div>
      </form>
	</div>
  </div>
</div>

</body>
</html>
