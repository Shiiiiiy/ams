<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <script src="${rc.contextPath}/js/jquery/jquery-1.5.2.min.js"></script>
	  <script src="${rc.contextPath}/lib/sticky/sticky.min.js"></script>
	  <script>
			$(document).ready(function(){
			
					$(".goTop").click(function(){
					    $(".goTop").anchorGoWhere({target:1});
					});
					
					$(".goDown").click(function(){
						$(".goDown").anchorGoWhere({target:1});
					});
					
					$(".goNext").click(function(){
						$(".goNext").anchorGoWhere({target:1});
					});
					
					$(".goFront").click(function(){
						$(".goFront").anchorGoWhere({target:1});
					});
					
					$(".goVertical").click(function(){
						$(".goVertical").anchorGoWhere({target:2});
					});
			});
			
			jQuery.fn.anchorGoWhere = function(options){
			    var obj = jQuery(this);
			    var defaults = {target:0, timer:1000};
			    var o = jQuery.extend(defaults,options);
			    obj.each(function(i){
			        jQuery(obj[i]).click(function(){
			            var _rel = jQuery(this).attr("href").substr(1);
			            switch(o.target){
			                case 1: 
			                    var _targetTop = jQuery("#"+_rel).offset().top;
			                    jQuery("html,body").animate({scrollTop:_targetTop},o.timer);
			                    break;
			                case 2:
			                    var _targetLeft = jQuery("#"+_rel).offset().left;
			                    jQuery("html,body").animate({scrollLeft:_targetLeft},o.timer);
			                    break;
			            }
			            return false;
			        });                  
			    });
			};
      </script> 
    </head>
    <body id="body">
   <div id="contentwrapper">
    <div class="main_content">   
				<a href="#menu1" class="goDown">菜单一</a>
				<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
				<a href="#menu2" class="goNext">懒人们，点这里看第二章节</a>
				<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
				<a href="#menu1" class="goFront">怎么了，前面一章忘记了？</a>
				<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
				<a href="#right" 	   class="goVertical">还没看过瘾，我带你到右边去看看-&gt;</a>
				<br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>
				<a href="#body"  	   class="goTop">返回顶部</a>
	</div>
</div>
</body>
</html>
