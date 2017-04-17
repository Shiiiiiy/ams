$(function() {
jQuery.validator.addMethod("numchar", function(value,element) {
	
	if(value!=""){
		var patrn=/^[A-Za-z0-9]*$/;
		return patrn.test(value);
	}else{
		return true;
	}
}, "只能输入数字或字母");
});
