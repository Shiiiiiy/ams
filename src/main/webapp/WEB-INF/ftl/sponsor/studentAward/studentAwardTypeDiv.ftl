  <#if awardTypeId??>
   <#if inspirationDic.id == awardTypeId >
	<#include "inspirationalAward.ftl">
   <#elseif aidGrantDic.id == awardTypeId>
    <#include "aidGrant.ftl">
   <#elseif jobGrantDic.id == awardTypeId> 
    <#include "jobGrant.ftl">
   <#elseif schoolLoanDic.id == awardTypeId> 
    <#include "schoolLoan.ftl">
   <#elseif tuitionDic.id == awardTypeId>    
    <#include "tuitionWaiver.ftl">
   <#else> 
    <#include "otherAward.ftl">
   </#if>
</#if>
			
