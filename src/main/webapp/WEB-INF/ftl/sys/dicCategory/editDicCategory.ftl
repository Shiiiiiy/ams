<html>
<body>
<div id="contentwrapper">
    <div class="main_content">
    	<div class="row-fluid">
	   		 <div class="span12">
	    	<h3 class="heading">
				<#if dicCategory?? && dicCategory.id?? >
					修改数据字典分类
				<#else>
					新增数据字典分类
				</#if>
			</h3>
	    	</div>
    	</div>
		
		<input name="errorText" id="errorText" type="hidden" value="${errorText!""}"/>
		<form  id="dicCategoryForm" class="form_validation_reg" 
		<#if dicCategory?? && dicCategory.id?? >
			action="${rc.contextPath}/sys/dicCategory/opt-update/submitDicCategory.do" 
		<#else>
			action="${rc.contextPath}/sys/dicCategory/opt-add/submitDicCategory.do"
		</#if>
		method="post">
		<#if dicCategory?? && dicCategory.id?? >
		<#else>
			<@token/>
		</#if>
		<input id="id" type="hidden" name="id"  value="${(dicCategory.id)!""}">
					
			<div class="formSep">
				<div class="row-fluid">
					<div class="span8">
						<div class="span2">
							<label>分类名称 <span class="f_req">*</span></label>
						</div>
						<div class="span10">
							<input id="name" name="name"  value="${(dicCategory.name!"")?html}"/>
						</div>
						</div>
				</div>
			</div>
			
			<div class="formSep">
				<div class="row-fluid">
					<div class="span8">
						<div class="span2">
							<label>分类编码 <span class="f_req">*</span></label>
						</div>
						<div class="span10">
							<input id="code" name="code"  value="${(dicCategory.code!"")?html}"/>
						</div>
					</div>
				</div>
			</div>
					
			<div class="formSep">
				<div class="row-fluid">
					<div class="span8">
						<div class="span2">
							<label>分类类型 <span class="f_req">*</span></label>
						</div>
						<div class="span10">
							<input id="categoryType" name="categoryType"  value="${(dicCategory.categoryType!"")?html}"/>
						</div>
					</div>
				</div>
			</div>	
			
			<div class="formSep">
				<div class="row-fluid">
					<div class="span8">
						<div class="span2">
							<label>备注 </label>
						</div>
						<div class="span10">
							<textarea name="comments" id="comments" cols="12" rows="5" class="span6">${(dicCategory.comments!"")?html}</textarea>
						</div>
					</div>
				</div>
			</div>			
			
			<div class="span6">
	        	<p class="btnMargin">
	        		<button class="btn btn-info" type="button" onclick="onSub()">确定
					</button>
			  	<button class="btn" type="button" onclick="cancel()">取消</button>
			</p>
		</div>
		</form>
		<input name="check_error" id="check_error" type="hidden" value="true"/>
	</div>
</div>
<script>
	function cancel(){
		window.location.href="${rc.contextPath}/sys/dicCategory/opt-query/dicCategoryList.do";
	}
	function onSub(){
		var check_error=$("#check_error").val();
		if(check_error == "true"){
			if($('#id').val()=="")
				$('#dicCategoryForm').submit();
			else{
				comp.confirm("修改该分类信息可能会造成系统其他业务功能无法正常使用，确认要修改？", function(result) {
	            	if(!result)
	            		return;            		
				  	$('#dicCategoryForm').submit();
				}); 
			}
		}
	}
	
	$("document").ready(function(){

        var data={id:'${(dicCategory.id)!""}',name:function(){return $("#name").val();}};
        comp.validate.addRemote("namecheck","${rc.contextPath}/sys/dicCategory/opt-query/nameCheck.do",data,"词典分类名称重复");
        
        var data={id:'${(dicCategory.id)!""}',code:function(){return $("#code").val();}};
        comp.validate.addRemote("codecheck","${rc.contextPath}/sys/dicCategory/opt-query/codeCheck.do",data,"词典分类编码重复");
        
  
        $(".form_validation_reg").compValidate({
					rules:{
							name: {required:true,minlength:1,maxlength:30,namecheck:true,uwsnumcharcn:true},
							code: {required:true,minlength:1,maxlength:32,codecheck:true,uwsnumchar:true},
							categoryType:{required:true,minlength:1,maxlength:30,uwsnumcharcn:true},
							comments:{maxlength:500}
						},
					messages:{
						name:{required:'分类名称不能为空'},
						code:{required:'分类编码不能为空'},
						categoryType:{required:'分类类型不能为空'}
					}
				});
			
			
			
	});
	
	 </script>
</body>
</html>
