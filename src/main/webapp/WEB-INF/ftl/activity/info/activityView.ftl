<html>
 <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!--选人弹出框-->
    <script src="${rc.contextPath}/js/jquery.form.js"></script>
    <script src="${rc.contextPath}/js/common/common_approve.js"></script>
     <script>
      $(function(){
		var activityCategory=$("#activityCategory").val();
	    if(activityCategory){
	       if(activityCategory=='402890ef5065538001506560a2d60001'){
	       	    $(".activityCategoryIn").show();
	       	    $(".activityCategoryOut").hide();
	       }else{
	       	    $(".activityCategoryIn").hide();
	       	    $(".activityCategoryOut").show();
	       }
	    }else{	    
       	   $(".activityCategoryIn").hide();
	       $(".activityCategoryOut").hide();
	    }
	     var holdStatus=$('input:radio[name="holdStatus.id"]:checked').val();
	     if(holdStatus){
	       if(holdStatus=='4028900f40cd477c0140cd4afd8d0001'){
	       	    $(".holdStatus").show();
	       	    $(".noHoldStatus").hide();
	       }else{
	       	    $(".holdStatus").hide();
	       	    $(".noHoldStatus").show();
	       }
	     }else{
	            $(".holdStatus").hide();
	       	    $(".noHoldStatus").hide();
	     }
	    //社团
	    var activityType=$("#activityType").val();
	    if(activityType=='402890ef50655380015065649de70004'){
		     $("#association").show();
		}else{
		     $("#association").hide();
		}
		 //志愿者
	   if(activityType=='402890ef506553800150656876e10006'){
	       $(".vaddress").show();
	       $(".address").hide();
	   }else{
		   $(".vaddress").hide();
	       $(".address").show();
	   } 
	});
</script>
 </head>
    <body>
    <div id="contentwrapper">
        <div class="main_content">   
            <div class="row-fluid">
				<div class="span12">
				    <div class="row-fluid">	
				        <div class="span12">
					        <h3 class="heading">
								活动信息查看页面
						    </h3>
					    </div>
					</div>
					<input id="activityId" name="activityId" value="${activity.id!""?html}" type="hidden" />
				    <#include "/activity/info/activityInfo/activityInfo.ftl">
					<#if status ?? && status='approve'>
	                    <br/>
		                <#include "/activity/info/activityInfo/activityInfoCreator.ftl">
		            </#if>
	                <#if activity ?? && activity.summaryStatus='SUBMIT'>
	                	<#include "/activity/info/activityInfo/activityInfoSummary.ftl">
	                </#if>
	                <br/>
		        	<div class="row-fluid">
		        	<div class="span6">
						<div class="span3">
						</div>
						<div class="span9">
							<#if noApproveStatus ?? && noApproveStatus='noApprove' || status ?? && status=='approve'>
				            <button class="btn btn-info" type="button" onclick="approve.showHis('${(activity.id)!""}')">审核历史</button>
				            </#if>
				            <button class="btn" type="button" onclick="window.close()">关 闭</button>
				        </div>
			        </div>
			        </div>			
				</div>
			</div>
		</div>
	</div>
        <#-- 审核历史查看 -->
        <#include "/apw/instance/approveHistory.ftl">	
   </body>
</html>