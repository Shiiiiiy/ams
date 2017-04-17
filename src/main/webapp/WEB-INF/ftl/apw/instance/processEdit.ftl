<script src="${rc.contextPath}/js/apw/apw_check.js"></script>
<div class="row-fluid">
	<div class="span12"></div>
</div>
   <h3 class="heading">审批记录</h3>
   <div class="row-fluid">
	<div class="span12" id="approveHistoryDiv">
			<#include   "approveHistoryList.ftl"/>
	</div>
   </div>
<form  id="singleProcessForm"  class="form_validation_reg"  action="${rc.contextPath}/apw/instance/opt-add/submitProcess.do" method="post">
<#if tokenId??>
<#else>
	<@token/>
</#if>
   <div class="row-fluid">
	<div class="span8">
			<input type="hidden" id="objectId" name="objectId" value="${objectId!""}"/>
	</div>
   </div>
<div class="row-fluid">
	<div class="span8">
		<span class="formTitle">审批意见<span class="f_req">*</span></span>
		<textarea name="suggest" id="suggest" cols="20" rows="6" class="span9" style="cursor:pointer"></textarea>
		<font size="1" color="grey"  style="vertical-align:bottom; padding-bottom:10px">(不超过200字)</font>
	</div>
</div>
</form>
<div class="row-fluid">
	<div class="span8">
		<button type="button" class="btn btn-info" onclick="doPass()">通&nbsp;&nbsp;过</button>&nbsp;
		<button type="button" class="btn btn-info" onclick="doNotPass()">不通过</button>&nbsp;
		<button type="button" class="btn btn-info" onclick="doReject()">驳&nbsp;&nbsp;回</button>&nbsp;
		<button type="button" class="btn btn-info" onclick="cleanForm()">清&nbsp;&nbsp;空</button>
	</div>
</div>
<script>
	
	//声明验证对象
	var myValidator;
   $(document).ready(function(){
		myValidator=$("#singleProcessForm").compValidate({
									rules:{
				 						suggest:{required:true,maxlength:200}
									},
									messages:{
										suggest:{required:'审批意见不能为空',maxlength:'审批意见太长【默认不超过200字符】'}
									}
							});
    });
    
	/**
	  * 为审批意见默认赋值
	  */
	function fillDefaltMessage(defultMsg){
	    var curMsg = $.trim($("#suggest").val());
		if(comp.isNull(curMsg)){
			$("#suggest").val(defultMsg);
		}
	}
    
	//表单提交
	function doPass(){
		fillDefaltMessage("通过");
		if(myValidator.form()){
			comp.confirm("确定要通过？",function(r){if(r){
				$.ajax({
						url:"${rc.contextPath}/apw/instance/opt-add/doPass.do",
						async:false,
						cache:false,
						type:'POST',
						data:{suggest:$("#suggest").val(),objectId:$("#objectId").val()},
						success: function(data){
							var parsedJson = jQuery.parseJSON(data); 
							if(parsedJson.resultFlag=="success"){
								var nextApproverArray = parsedJson.nextApproverList;
								//alert(parsedJson.approveStatus+":"+parsedJson.processStatusCode);
								if(parsedJson.processStatusCode=="APPROVEING"){
									if(nextApproverArray.length>=1){
										apw_instance.nextApproverSelect($("#objectId").val(),parsedJson.processKey,parsedJson.nextTaskName,nextApproverArray);
									}else if(nextApproverArray.length == 0){
							 			apw_instance.rollbackInstance($("#objectId").val(),parsedJson.processKey,"下一节点办理人不存在 !");		
							 		}
								}else{
									 
								     doEduAction();//执行业务系统操作
								}
							}else if(parsedJson.resultFlag=="deprecated"){
								comp.error("审批流已废弃 !");
							}
					  }
				}); 
			}});
		}
	}
    
	//表单提交
	function doNotPass(){
		fillDefaltMessage("不通过");
		if(myValidator.form()){
		comp.confirm("确定要不通过？",function(r){if(r){
				$.ajax({
						url:"${rc.contextPath}/apw/instance/opt-add/doNotPass.do",
						async:false,
						cache:false,
						type:'POST',
						data:{suggest:$("#suggest").val(),objectId:$("#objectId").val()},
						success: function(data){
							var parsedJson = jQuery.parseJSON(data); 
							if(parsedJson.resultFlag=="success"){
								doEduAction();//执行业务系统操作
							}else if(parsedJson.resultFlag=="deprecated"){
								comp.error("审批流已废弃 !");
							}
					  }
				}); 
			}
		}
	}
    
	//表单提交
	function doReject(){
		fillDefaltMessage("驳回");
		if(myValidator.form()){
			if(confirm("确定要驳回？")){
				$.ajax({
						url:"${rc.contextPath}/apw/instance/opt-add/doReject.do",
						async:false,
						cache:false,
						type:'POST',
						data:{suggest:$("#suggest").val(),objectId:$("#objectId").val()},
						success: function(data){
							var parsedJson = jQuery.parseJSON(data); 
							if(parsedJson.resultFlag=="success"){
								doEduAction();//执行业务系统操作
							}else if(parsedJson.resultFlag=="deprecated"){
								comp.error("审批流已废弃 !");
							}
					  }
				}); 
			}
		}
	}
	
	//表单提交
	function initNextApprover(objectId,userId){
		$.ajax({
					url:"${rc.contextPath}/apw/instance/opt-add/initNextApprover.do",
					async:false,
					cache:false,
					type:'POST',
					data:{objectId:objectId,userId:userId},
					success: function(data){
						var parsedJson = jQuery.parseJSON(data); 
						if(parsedJson.resultFlag=="success"){
							doEduAction();//执行业务系统操作
						}else if(parsedJson.resultFlag=="deprecated"){
							comp.error("审批流已废弃 !");
						}
				  }
			}); 
	}
	
	function cleanForm(){
		$("#suggest").val("");
	}
	
	function eisdResponse(r,s){
		var obj = eval("("+r+")");
		if(obj.success=="success"){
			$("#approveHistoryDiv").load("${rc.contextPath}/apw/instance/nsm/loadApproveHistory.do",{pageNo:obj.pageNo,objectId:$("#objectId").val()},function(){});
		}
	}
	
	//执行教务系统业务操作
	function doEduAction(){
	     $("#boxForm").submit();
	}
	
</script>
 <#include "/apw/instance/approvers.ftl">