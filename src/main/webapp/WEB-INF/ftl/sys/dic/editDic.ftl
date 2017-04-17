<html>
<head>
<link rel="stylesheet" href="${rc.contextPath}/lib/chosen/chosen.css" type="text/css">
<script type="text/javascript" src="${rc.contextPath}/lib/chosen/chosen.jquery.min.js"></script>
</head>
<body>
<div id="contentwrapper">
    <div class="main_content">
    	<div class="row-fluid">
	   		 <div class="span12">
	    	<h3 class="heading">
				<#if dic?? && dic.id?? >
					修改数据字典
				<#else>
					新增数据字典
				</#if>
			</h3>
	    	</div>
    	</div>
		
		<input name="errorText" id="errorText" type="hidden" value="${errorText!""}"/>
		<form  id="dicForm" class="form_validation_reg" 
		<#if dic?? && dic.id?? >
			action="${rc.contextPath}/sys/dic/opt-update/submitDic.do" 
		<#else>
			action="${rc.contextPath}/sys/dic/opt-add/submitDic.do"
		</#if>
		method="post">
		<#if dic?? && dic.id?? >
		<#else>
			<@token/>
		</#if>
		<input id="id" type="hidden" name="id"  value="${(dic.id)!""}">
					
			<div class="formSep">
				<div class="row-fluid">
					<div class="span8">
						<div class="span2">
							<label>字典名称 <span class="f_req">*</span></label>
						</div>
						<div class="span10">
							<input id="name" name="name"  value="${(dic.name!"")?html}"/>
						</div>
					</div>
				</div>
			</div>
			
			<div class="formSep">
				<div class="row-fluid">
					<div class="span8">
						<div class="span2">
							<label>字典编码 <span class="f_req">*</span></label>
						</div>
						<div class="span10">
							<input id="code" name="code"  value="${(dic.code!"")?html}"/>
						</div>
					</div>
				</div>
			</div>
					
			<div class="formSep">
				<div class="row-fluid">
					<div class="span8">
						<div class="span2">
							<label>字典分类 <span class="f_req">*</span></label>
						</div>
						<div class="span10">
								<select size="1" id="dicCategoryId" name="dicCategoryId" aria-controls="dt_gal" class="chzn_a" data-placeholder="">
								<#if dicCategoryId?? >
									<#list dicCategoryList as d>
										<#if dicCategoryId==d.id >
											<option  value="${d.id}" selected="selected" />${d.name}</option>
										<#else>
											<option value="${d.id}" />${d.name?html}</option>
										</#if>
									</#list>
								<#else>
									<#list dicCategoryList as d>
										<option  value="${d.id}" />${d.name?html}</option>
									</#list>
								</#if>
							 </select>
						</div>
					</div>
				</div>
			</div>
			
			<div class="formSep">
				<div class="row-fluid">	
					<div class="span8">	
						<div class="span2">
							<label>字典状态<span class="f_req">*</span></label>
						</div>
						<div class="span10">						
							<#if dic.status??>
								<label class="radio inline">
										<input type="radio" value="1" name="status"  class="{required:true}" 
											<#if dic.status=="1">
											checked="checked"
											</#if>
										/>启用									
								</label>
								<label class="radio inline">									
										<input type="radio" value="0" name="status"  class="{required:true}" 
											<#if dic.status=="0">
											checked="checked"
											</#if>
										/>禁用							
								</label>
							<#else>
								<label class="radio inline">
										<input type="radio" value="1" name="status"  class="{required:true}" checked="checked"/>启用									
								</label>
								<label class="radio inline">									
										<input type="radio" value="0" name="status"  class="{required:true}" />禁用							
								</label>
							</#if>
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
							<textarea name="comments" id="comments" cols="12" rows="5" class="span6">${(dic.comments!"")?html}</textarea>
						</div>
					</div>
				</div>
			</div>			
			
			<div class="span6">
	        	<p class="btnMargin">
	        		<button class="btn btn-info" type="button" onclick="onSub()">
	         	确定
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
		window.location.href="${rc.contextPath}/sys/dic/opt-query/dicList.do";
	}
	function onSub(){
		var check_error=$("#check_error").val();
		if(check_error == "true"){
			
			if($('#id').val()=="")
				$('#dicForm').submit();
			else{
				comp.confirm("修改该字典信息可能会造成系统其他业务功能无法正常使用，确认要修改？", function(result) {
	            	if(!result)
	            		return;            		
				  	$('#dicForm').submit();
				}); 
			}
		}
	}
	
	$("document").ready(function(){
	
		var data={id:'${(dic.id)!""}',code:function(){return $("#code").val();},dicCategoryId:function(){return $("#dicCategoryId").val();}};
        comp.validate.addRemote("codecheck","${rc.contextPath}/sys/dic/opt-query/codeCheck.do",data,"当前词典分类内，词典编码重复");
        
        var data={id:'${(dic.id)!""}',name:function(){return $("#name").val();},dicCategoryId:function(){return $("#dicCategoryId").val();}};
        comp.validate.addRemote("namecheck","${rc.contextPath}/sys/dic/opt-query/nameCheck.do",data,"当前词典分类内，词典名称重复");
        /*
         comp.validate.addRule("codecheck", function(value,element) {
         	var optionalval = this.optional(element);
			var returnval;
			var c=$("#code").val();
			var dic=$("#dicCategoryId").val();
			$.ajax({
				url:"${rc.contextPath}/sys/dic/opt-query/codeCheck.do",
				async:false,
				cache: false,
				type: "POST",
				data:{id:'${(dic.id)!""}',code:c,dicCategoryId:dic},
				success: function(msg){
			    	returnval = optionalval||(msg=='yes');
			   }
			});
			return returnval;
			}, "当前词典分类内，词典编码重复");
			
          comp.validate.addRule("namecheck", function(value,element) {
			var optionalval = this.optional(element);
			var returnval;
			$.ajax({
				url:"${rc.contextPath}/sys/dic/opt-query/nameCheck.do",
				async:false,
				cache: false,
				type: "POST",
				data:{id:'${(dic.id)!""}',name:$("#name").val(),dicCategoryId:$("#dicCategoryId").val()},
				success: function(msg){
			    	returnval = optionalval||(msg=='yes');
			   }
			});
			return returnval;
			}, "当前词典分类内，词典名称重复");
        */
           $(".form_validation_reg").compValidate({
				rules:{     
						name: {required:true,minlength:1,maxlength:30,namecheck:true},
						code: {required:true,minlength:1,maxlength:32,codecheck:true,uwsnumchar:true},
						dicCategoryId:{required:true,codecheck:true,namecheck:true},
						comments:{maxlength:500}
					},
					messages:{
						name:{required:'字典名称不能为空'},
						code:{required:'字典编码不能为空'}
					}
				});
	});
	
	dicCatagory_chosen = {
		init:function(){
			$(".chzn_a").chosen({
				search_contains:true,
				no_results_text:"没有匹配的结果:"
			});
		}
	};
	dicCatagory_chosen.init();
	 </script>
</body>
</html>
