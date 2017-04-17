<form id="editOption">

	<div class="row-fluid">
		<div class="span6">
			<div class="span3">选项名称<span class="f_req">*</span></div>
			<div class="span8">
				<#if option??>
					<input type="text" id="optionName" name="optionName"  value="${(option.optionName!"")?html}" />
				<#else>
					<input type="text" id="optionName" name="optionName"  value=""/>
				</#if>
			</div>
		</div>
		<div class="span6">
			<div class="span3">选项链接 </div>
			<div class="span8">
				<#if option??>
					<input type="text" id="optionUrl" name="optionUrl" value="${(option.optionUrl!"")?html}"/>
				<#else>
					<input type="text" id="optionUrl" name="optionUrl"  value=""/>
				</#if>
			</div>
		</div>
	</div>

	<div class="row-fluid">
		<div class="span12">
			<div class="span5"></div>
			<div>
				<a href="#" class="btn btn-info"  onclick="sure()" id="submitYes">确 定</a>&nbsp;&nbsp;&nbsp;
				<a href="#" class="btn" data-dismiss="modal" onclick="popbakfun()">关 闭</a>
			</div>
		</div>
	</div>
	<#if option??>
		<input type="hidden" value="${(option.id!"")?html}" id="id" name="id"/>
	<#else>
		<input type="hidden" value="" id="id" name="id"/>
	</#if>	
	<input type="hidden" value="" id="itemid" name="itemid"/>
</form>
<script>
	function sure(){
			if(validator.form()==false){
			}else{
					//验证通过就给确定按钮添加关闭弹出框的属性；
					$("#submitYes").attr("data-dismiss","modal");
					//获取题目id
					$("#itemid").val($("#itemId").val());
					var itemId=$("#itemid").val();
					$.ajax({
						url: "${rc.contextPath}/question/itemManage/opt-edit/submitOption.do",
						async:false,
						cache:false,
						type:"POST",
						data:$('#editOption').serialize(),
						    success: function(msg){
							if("success" == msg){
								var time=Date.parse(new Date());
								$("#itemOption").load("${rc.contextPath}/question/itemManage/nsm/optionList.do?id="+itemId+"&time="+time);
						    }else {
						    	if(msg.indexOf("<html>")!= -1){
						    		window.location.reload();
						    		return;
						    	}
						    	$.sticky("操作失败", {autoclose:5000, position:"top-right", type:"st-error"});
						    	return;
						    }
						}
					});
				}
			}
			
		//对需要输入数字的字段进行验证
  		jQuery.validator.addMethod("numCheck", function(value,element) {
			if(value!=""){
				//请输入不小于0的数
				var patrn=/^[0-9]+(\.[0-9]{1,})?$/; 
				var  flag=patrn.exec(value);
				return flag;
			}else{
				return true;
			}
		}, "请输入不小于0的合法的数字");
			
		//对选项链接地址进行验证
  		jQuery.validator.addMethod("urlCheck", function(value,element) {
  			if(value==''||value==null){
  				return true;
  			}else{
				return value.match(/http(s)?:\/\/([\w-]+\.)+[\w-]+(\/[\w- .\/?%&=]*)?/);
  			}
		}, "请输入合法的URL地址");
		
		//验证选项名称是否重复
		var param={id:function(){return $("#id").val();},optionName:function(){return $("#optionName").val();},itemId:function(){return $("#itemId").val();}};
		comp.validate.addRemote("optionNameCheck","${rc.contextPath}/question/itemManage//opt-query/optionNameCheck.do",param,"选项名称重复");		
	 	//页面非空验证
		 var validator=$("#editOption").compValidate({
					rules:{     
							optionName:{required:true,maxlength:1000,optionNameCheck:true},
							seqNum:{required:true,maxlength:5,numCheck:'#seqNum'},
							optionUrl:{urlCheck:true}
						},
						messages:{
							optionName:{required:'选项名称不能为空',maxlength:'选项名称不能超过255字'},
							seqNum:{required:'选项顺序不能为空',maxlength:'请输入小于5位数的正整数'}
						}
				});
</script>
