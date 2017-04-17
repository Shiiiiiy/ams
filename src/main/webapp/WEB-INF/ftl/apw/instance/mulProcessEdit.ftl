		<script src="${rc.contextPath}/js/apw/apw_check.js"></script>
		<form  id="mulProcessForm"  class="form_validation_reg"  action="${rc.contextPath}/apw/instance/opt-add/submitMulProcess.do" method="post">
		<#if tokenId??>
		<#else>
			<@token/>
		</#if>
    	
	   <div class="row-fluid">
			<div class="span8">
				<input type="hidden" id="objectIds" name="objectIds" value="${objectIds!""}"/>
			</div>
	    </div>
	    <div class="formSep">
		<div class="row-fluid">
			<div class="span12">
				<div class="span1">
					<span class="formTitle">审批意见<span class="f_req">*</span></span>
				</div>
				<div class="span10">
					<textarea name="suggest" id="suggest" cols="20" rows="6" class="span8" style="cursor:pointer"></textarea>
					<br><font size="1" color="grey"  style="vertical-align:bottom; padding-bottom:10px">(不超过200字)</font>
				</div>	
			</div>
		</div>
		</div>
		</br>
		<div class="row-fluid">
			<div class="span12">
				<div class="span1">
				</div>
				<div class="span10">
					<button type="button" class="btn btn-info" onclick="mulDoPass()">通&nbsp;&nbsp;过</button>&nbsp;
					<!-- 
					<button type="button" class="btn btn-info" onclick="mulDoNotPass()">不通过</button>&nbsp;
					 -->
					<button type="button" class="btn btn-info" onclick="mulDoReject()">驳&nbsp;&nbsp;回</button>&nbsp;
					<button type="button" class="btn btn-info" onclick="cleanForm()">清&nbsp;&nbsp;空</button>&nbsp;
					<button type="button" class="btn btn-info" onclick="javascript:window.history.back(-1);">返&nbsp;&nbsp;回</button>
				</div>
			</div>
		</div>
<script>
	
	//声明验证对象
	var myValidator;
   $(document).ready(function(){
		myValidator=$("#mulProcessForm").compValidate({
									rules:{
				 						suggest:{required:true,maxlength:200}
									},
									messages:{
										suggest:{required:'审批意见不能为空',maxlength:'审批意见太长【默认不超过200字符】'}
									}
							});
    });
   
	//表单提交
	function mulDoPass(){
		apw.fillDefaltMessage("suggest","通过");
		if(myValidator.form()){
			if(confirm("确定要通过？")){
				apw.mulApproveCurProcess($("#objectIds").val(),"PASS",$("#suggest").val());
			}else{clearApproveMessage()}
		}
	}
	
	//表单提交
	function mulDoNotPass(){
		apw.fillDefaltMessage("suggest","不通过");
		if(myValidator.form()){
			if(confirm("确定要不通过？")){
				apw.mulApproveCurProcess($("#objectIds").val(),"NOT_PASS",$("#suggest").val());
			}else{clearApproveMessage()}
		}
	}
    
	//表单提交
	function mulDoReject(){
		apw.fillDefaltMessage("suggest","驳回");
		if(myValidator.form()){
			if(confirm("确定要驳回？")){
				apw.mulApproveCurProcess($("#objectIds").val(),"REJECT",$("#suggest").val());
			}else{clearApproveMessage()}
		}
	}
	
	function clearApproveMessage(){
		var curMsg = $.trim($("#suggest").val());
		if(curMsg=="通过" || curMsg=="驳回" || curMsg=="不通过"){
			$("#suggest").val("");
		}
	}
	
	function cleanForm(){
		$("#suggest").val("");
	}

</script>
 <#include "/apw/instance/approvers.ftl">