mask = {
	//显示遮罩
	showShade:function(){
		var h = $(document).height();
		$(".overlay").css({"height": h });	
		$(".overlay").css({'display':'block','opacity':'0.8'});
		$(".showbox").show();
		$(".showbox").stop(true).animate({'margin-top':'300px','opacity':'1'},200);
	},
	//隐藏遮罩
	hideShade:function(){
		$(".showbox").stop(true).animate({'margin-top':'250px','opacity':'0'},400);
		$(".overlay").css({'display':'none','opacity':'0'});
		$(".showbox").hide();
	}
}