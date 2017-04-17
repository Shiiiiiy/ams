<html>
 <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- ajax form-->
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
		<!-- multiselect -->
	    <link rel="stylesheet" href="${rc.contextPath}/lib/multiselect/css/multi-select.css" />
		<script src="${rc.contextPath}/lib/multiselect/js/jquery.multi-select.min.js"></script>
    </head>
<body>
<div id="contentwrapper">
    <div class="main_content">
    	<div class="row-fluid">
	   		<div class="span12">
		    	<h3 class="heading">
					查看题目
				</h3>
	    	</div>
    	</div>
		<form  id="itemViewForm" class="form_validation_reg" 
		<#if quesItem?? && quesItem.id?? >
			action="${rc.contextPath}/question/itemManage/opt-edit/submitQuesItem.do" 
		<#else>
			action="${rc.contextPath}/question/itemManage/opt-add/submitQuesItem.do"
		</#if>
		method="post">
		<#if quesItem?? && quesItem.id?? >
		<#else>
			<@token/>
		</#if>
		<input id="itemId" type="hidden" name="id"  value="${(quesItem.id)!""}">
		<div class="formSep">
			<div class="row-fluid">
				<div class="span6">
					<div class="span2">
						<label>题目名称 </label>
					</div>
					<div class="span8">
						<input  type="text" id="itemName" name="itemName"  value="${(quesItem.itemName!"")?html}" readonly/>
					</div>
				</div>

				<div class="span6">
					<div class="span2">
						<label>问题类型 </label>
					</div>
					<div class="span8">
						<#if quesItem?? && quesItem.itemCategory??>
							<input  type="text"  id="itemCategory" name="itemCategory.id"  value="${(quesItem.itemCategory.name!"")?html}" readonly/>
						<#else>
							<input  type="text"  id="itemCategory" name="itemCategory.id"  value="" readonly/>
						</#if>
					</div>
				</div>
				
			</div>
		</div>
			
			<div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span2">
							<label>问题题型</label>
						</div>
						<div class="span8">
							<#if quesItem?? && quesItem.itemType??>
								<input  type="text"  id="itemType.id" name="itemType.id"  value="${(quesItem.itemType.name!"")?html}" readonly/>
							<#else>
								<input  type="text"  id="itemType.id" name="itemType.id"  value="" readonly/>							
							</#if>
						</div>
					</div>
					
					<div class="span6">
						<div class="span2">
							<label>是否必填 </label>
						</div>
						<div class="span8">
							<input  type="text"  id="required" name="required.id"  value="${(quesItem.required.name!"")?html}" readonly/>		
						</div>
					</div>					
					
				</div>
			</div>
			<div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span2">
							<label>问题状态</label>
						</div>
						<div class="span8">
								<input id="useStatus" name="useStatus.id"  value="${(quesItem.useStatus.name!"")?html}" readonly/>
						</div>
					</div>
				</div>
			</div>						
			<div  id="itemOption">
			<div class="formSep">
				<div class="row-fluid">
					<div class="span12">
						<div class="span1">选项列表</div>
						<div class="span9">
							<#include "optionView.ftl">
						</div>
					</div>
				</div>
			</div>	
				
			</div>
								
		</form>
		
		
		<div class="row-fluid">					
			<div class="span6">
				<div class="span2">
				</div>
				<div class="span8" style="padding:10px 0px 0px 0px">
					<button class="btn"   type="button" onclick="cancel()">
		         	关 闭
					</button>
				</div>
			</div>
		</div>
		
	</div>
</div>

	<script>
	
	//返回
	function cancel(){
		//window.location.href="${rc.contextPath}/question/itemManage/opt-query/quesItemQuery.do";
		window.close();
	}
	 </script>	
</body>
</html>
