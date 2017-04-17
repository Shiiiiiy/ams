<div class="row-fluid">
	<div class="span3">流程名称 :</div>
	<div class="span6">
		<input type="text"  id="processName_" name="processName" class="{processNameCheck:true} span8"  value="${fdpo.processName!""}"/>
	</div>
</div>
<div class="row-fluid">
	<div class="span3">流程key :</div>
	<div class="span6">
	<input type="text"  id="processKey_" name="processKey"  class="{processKeyCheck:true} span8" value="${fdpo.processKey!""}"/>
	<input type="hidden" id="id_" name="id" class="span8" value="${fdpo.id!""}"/>
	<#if fdpo?? && fdpo.status??>
		<input type="hidden" name="statusId_" class="span8" value="${fdpo.status.id!""}"/>
	<#else>
		<input type="hidden" name="statusId_" class="span8" />
	</#if>
	</div>
</div>
<div class="row-fluid">
	<div class="span3">流程状态 :</div>
	<div class="span6">
	<#if definDicList??>
	  <#list definDicList as dic>
		 	<input type="radio" value="${dic.id}" name="processStatus" 
		 	<#if fdpo?? && fdpo.status?? && fdpo.status.id==dic.id>
		 		checked
		 	<#else>
		 		checked
		 	</#if>
		 	/>&nbsp;${dic.name}
	    	<#if dic_index==0>
		 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	     	</#if>
	  </#list>
	</#if>
	</div>
</div>
