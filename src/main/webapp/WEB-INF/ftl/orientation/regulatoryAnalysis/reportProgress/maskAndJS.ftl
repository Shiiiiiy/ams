<div class="overlay" ></div>
<div id="AjaxLoading" class="showbox" style="display:none">
	<div class="loadingWord"> <img src="${rc.contextPath}/img/waiting.gif" />加载中...</div>
</div>

<script>
	//显示遮罩
	function showShade(){
		var h = $(document).height();
		$(".overlay").css({"height": h });	
		$(".overlay").css({'display':'block','opacity':'0.8'});
		$(".showbox").show();
		$(".showbox").stop(true).animate({'margin-top':'300px','opacity':'1'},200);
	}
	//隐藏遮罩
	function hideShade(){
		$(".showbox").stop(true).animate({'margin-top':'250px','opacity':'0'},400);
		$(".overlay").css({'display':'none','opacity':'0'});
		$(".showbox").hide();
	}
</script>