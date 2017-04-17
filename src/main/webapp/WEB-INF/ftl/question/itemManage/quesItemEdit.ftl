<html>
 <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- ajax form-->
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
		<!-- multiselect -->
	    <link rel="stylesheet" href="${rc.contextPath}/lib/multiselect/css/multi-select.css" />
		<script src="${rc.contextPath}/lib/multiselect/js/jquery.multi-select.min.js"></script>
		<script type="text/javascript" src="${rc.contextPath}/lib/ztree/js/jquery.ztree.exhide-3.5.min.js"></script>
		
    </head>
<body>
<div id="contentwrapper">
    <div class="main_content">
    	<div class="row-fluid">
	   		<div class="span12">
		    	<h3 class="heading">
					<#if quesItem?? && quesItem.id?? >
						编辑题目
					<#else>
						新增题目
					</#if>
				</h3>
	    	</div>
    	</div>
		<form  id="itemEditForm" class="form_validation_reg" 
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
		<input id="itemId" type="hidden" name="id"  value="${(quesItem.id)!""}"/>
		<input id="itemTypeEssayId" type="hidden" name="itemTypeEssayId"  value="${(itemTypeEssayId)!""}"/>
		<div class="formSep">
			<div class="row-fluid">
				<div class="span6">
					<div class="span2">
						<label>题目名称 <span class="f_req">*</span></label>
					</div>
					<div class="span8">
						<input id="itemName" name="itemName"  value="${(quesItem.itemName!"")?html}"/>
					</div>
				</div>

				<div class="span6">
					<div class="span2">
						<label>问题类型 <span class="f_req">*</span></label>
					</div>
					<div class="span8">
						<select size="1" id="itemCategory" name="itemCategory.id" aria-controls="dt_gal" class="span5" >
							<option value="" />请选择..</option>
							<#if quesItem.itemCategory??>
								<#list categoryList as d>
									<#if quesItem.itemCategory.id==d.id >
										<option  value="${d.id}" selected="selected" />${d.name?html}</option>
									<#else>
										<option value="${d.id}" />${d.name?html}</option>
									</#if>
								</#list>
							<#else>
								<#list categoryList as d>
									<option  value="${d.id}"/>${d.name?html}</option>
								</#list>
							</#if>
						</select>
					</div>
				</div>
				
			</div>
		</div>
			
			<div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span2">
							<label>题型 <span class="f_req">*</span></label>
						</div>
						<div class="span8">
								<select size="1" id="itemType" name="itemType.id" aria-controls="dt_gal" onChange="onChangeType()">
									<option value="" />请选择..</option>
									<#if quesItem?? && quesItem.itemType??>
										<#list itemTypeList as r>
											<#if quesItem.itemType.id==r.id >
												<option  value="${r.id}" selected="selected">${r.name}</option>
											<#else>
												<option value="${r.id}">${r.name?html}</option>
											</#if>
										</#list>
									<#else>
										<#list itemTypeList as r>
											<option  value="${r.id}">${r.name?html}</option>
										</#list>
									</#if>
							 </select>
						</div>
					</div>
					
					<div class="span6">
						<div class="span2">
							<label>是否必填 <span class="f_req">*</span></label>
						</div>
						<div class="span8">
							<#if quesItem.required?? >
								<#list requiredList as dic>
									<label class="radio inline">
										<#if dic.id==quesItem.required.id >
											<input type="radio" value="${dic.id}" name="required.id"  class="{required:true}" checked="checked"/>&nbsp;${dic.name}&nbsp;&nbsp;&nbsp;
										<#else>
											<input type="radio" value="${dic.id}" name="required.id"  class="{required:true}" />&nbsp;${dic.name}
										</#if>
									</label>
								</#list> 
							<#else>
								<#list requiredList as dic>
									<label class="radio inline">
										<#if dic_index==0>
											<input type="radio" value="${dic.id}" name="required.id"  checked="checked" class="{required:true}" />&nbsp;${dic.name} &nbsp;&nbsp;&nbsp;
										<#else>
											<input type="radio" value="${dic.id}" name="required.id"  class="{required:true}" />&nbsp;${dic.name}
										</#if>
									</label>
								</#list> 
							</#if>
						</div>
					</div>					
					
				</div>
			</div>
		<#if quesItem?? && quesItem.itemType?? >
			<div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span2">
							<label>状态</label>
						</div>
						<div class="span8">
								<input id="useStatus.id" name="useStatus.id"  value="${(quesItem.useStatus.name!"")?html}" readonly/>
						</div>
					</div>
				</div>
			</div>
		</#if>
			<#if quesItem?? && quesItem.id?? >		
				<div  id="itemOption">
					<#include "optionList.ftl">
				</div>
			</#if>					
		</form>
		
		
		<div class="row-fluid">					
			<div class="span6">
				<div class="span2">
				</div>
				<div class="span8" style="padding:10px 0px 0px 0px">
					<#if quesItem?? && quesItem.id??>
						<#if quesItem.useStatus?? && quesItem.useStatus.code=='STATUS_SAVE'>
							<button class="btn btn-info"   type="button" onclick="saveNoPublish('SAVE')">
				         	保 存
							</button>
						</#if>
						<#if quesItem.useStatus?? && quesItem.useStatus.code=='STATUS_DISABLE'>
							<button class="btn btn-info"   type="button" onclick="saveNoPublish('DIS')">
				         	保 存
							</button>					
						</#if>
						<button class="btn btn-info"   type="button" onclick="saveAndPublish('ENA')">
			         	启 用
						</button>
					<#else>
						<button class="btn btn-info"   type="button" onclick="saveNoPublish('SAVE')">
			         	保 存
						</button>					
					</#if>
					<button class="btn"   type="button" onclick="cancel()">
		         	取 消
					</button>
				</div>
			</div>
		</div>
		
	</div>
</div>

	<div class="modal hide fade" id="myModal1">
		<div class="modal-header">
			<button class="close" data-dismiss="modal">×</button>
			<h3 id="title1">题目选项</h3>
		</div>
		<div class="modal-body" id="stmp_project1">
			<#include "optionEdit.ftl">
		</div>
		<div class="modal-footer">
		</div>
	</div>	
	<script>
	
	//取消
		function cancel(){
				window.location.href="${rc.contextPath}/question/itemManage/opt-query/quesItemQuery.do";
			}
	//启用
		 function saveAndPublish(publishStatus) {
			//获取题目类型为问答类型的Id
			var itemTypeEssay = $("#itemTypeEssayId").val();
		 	var optionSize=$("#optionSize").val();
		 	var itemType=$("#itemType").val();
		 	
		 	if(itemTypeEssay!=itemType && optionSize<=0){
		 		comp.message("请新增选项后再启用该题目！","error");
		 		return;
		 	}
			$("#itemEditForm").attr("action","${rc.contextPath}/question/itemManage/opt-edit/submitQuesItem.do?ustatus="+publishStatus);
	    	$("#itemEditForm").submit();
		}
	//保存
		 function saveNoPublish(publishStatus) {
			$("#itemEditForm").attr("action","${rc.contextPath}/question/itemManage/opt-edit/submitQuesItem.do?ustatus="+publishStatus);
	    	$("#itemEditForm").submit();
		}
	$("document").ready(function(){
		
		var param={id:'${(quesItem.id)!""}',itemName:function(){return $("#itemName").val();},itemCategoryId:function(){return $("#itemCategory").val();},itemTypeId:function(){return $("#itemType").val();}};
		comp.validate.addRemote("itemNameCheck","${rc.contextPath}/question/itemManage/opt-query/itemNameCheck.do",param,"题目名称重复");
		
	   $(".form_validation_reg").compValidate({
			rules:{     
					itemName: {required:true,minlength:1,maxlength:255,itemNameCheck:true},
					'itemCategory.id':{required:true},
					'itemType.id':{required:true}
				},
				messages:{
					itemName: {required:'题目名称不能为空',maxlength:'题目名称不能超过255字'},
					'itemCategory.id':{required:'问题类型不能为空'},
					'itemType.id':{required:'题型不能为空'}
				}
			});
		//题型为问答题时，去掉下方的答案选项	
		//获取题目类型为问答类型的Id
		 var itemTypeEssay = $("#itemTypeEssayId").val();
		 var selectedId=$("#itemType").val();
	     if(selectedId==itemTypeEssay){
	     	$("#itemOption").hide();
	     }else{
	     	$("#itemOption").show();
	     }
	});
	//题型为问答题时，去掉下方的答案选项	
	function onChangeType(){
		 var itemTypeEssay = $("#itemTypeEssayId").val();
		 var selectedId=$("#itemType").val();
	     if(selectedId==itemTypeEssay){
	     	$("#itemOption").hide();
	     }else{
	     	$("#itemOption").show();
	     }
	}
	//点击新增或者修改，弹出编辑框
	 function popedit(optionId){
	 	var optionSize = $("#optionSize").val();
	 	if(optionId==''){
		 	if(optionSize=='9'){
		 		comp.message("系统最多支持9个选项","error");
		 		return;
		 	}
	 		comp.showModal("myModal1","900px","-250px 0 0 -300px");
	 		$("#stmp_project1").load("${rc.contextPath}/question/itemManage/nsm/editOption.do");
	 	}else{
	 		comp.showModal("myModal1","900px","-250px 0 0 -300px");
	 		$("#stmp_project1").load("${rc.contextPath}/question/itemManage/nsm/editOption.do",{optionId:optionId},function(){});
	 	}
	 }
	//弹出编辑框回调方法
	 function popbakfun(){
		$('#myModal1').modal('hide');
	 }		 
 </script>	
</body>
</html>
