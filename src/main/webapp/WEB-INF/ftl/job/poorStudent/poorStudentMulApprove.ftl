<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<script language="javascript" type="text/javascript" src="/productoa/lib/My97DatePicker/WdatePicker.js"></script>
        <link rel="stylesheet" href="${rc.contextPath}/lib/jquery-ui/css/Aristo/Aristo.css" />
        <script src="${rc.contextPath}/lib/jquery-ui/jquery-ui-1.8.20.custom.min.js"></script>
        <!-- ajax form-->
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
		<!-- sticky messages -->
	   <script src="${rc.contextPath}/lib/sticky/sticky.min.js"></script>
	    <!--validata-->
	    <script src="${rc.contextPath}/lib/validation/jquery.validate.min.js" charset="UTF-8" ></script>
    </head>
    <body>
	<div id="contentwrapper">
	    <div class="main_content">   
			<h3 class="heading">批量审批</h3>
			<form  id="stuMulApproveForm"  class="form_validation_reg"  action="${rc.contextPath}/job/approvePoorStudent/opt-save/saveApprovePoorStudents.do" method="post">
				<input type="hidden" id="objectIds" name="objectIds" value="${objectIds!""}"/>
				<input id="flag" type="hidden" name="flag">
				<input type="hidden" id="mulResults" name="mulResults"/>
			    <#include "/job/poorStudent/selectedPoorStudentApproveList.ftl">
				 <div class="formSep">
					<div class="row-fluid">
						<div class="span12">
							<div class="span2">
								<span class="formTitle">审批意见<span class="f_req"></span></span>
							</div>
							<div class="span8">
								<textarea name="approveReason" id="approveReason" cols="20" rows="6" class="span9" style="cursor:pointer"></textarea>
								<font size="1" color="grey"  style="vertical-align:bottom; padding-bottom:10px">(不超过500字)</font>
							</div>	
						</div>
					</div>
					</div>
					</br>
					<div class="row-fluid">
						<div class="span12">
							<div class="span2">
							</div>
							<div class="span8">
								<button type="button" class="btn btn-info" onclick="onSub('1')">通 过</button>&nbsp;
								<!-- 
								<button type="button" class="btn btn-info" onclick="mulDoNotPass()">不通过</button>&nbsp;
								 -->
								<button type="button" class="btn btn-info" onclick="onSub('0')">拒 绝</button>&nbsp;
								<button type="button" class="btn btn-info" onclick="cleanForm()">清 空</button>&nbsp;
								<button type="button" class="btn btn-info" onclick="javascript:window.history.back(-1);">返 回</button>
							</div>
						</div>
					</div>
					<input name="check_error" id="check_error" type="hidden" value="true"/>
	        </form>
		</div>
	</div>
	<script>
	/**
	var attachFlag;
	$("document").ready(function(){
		//页面校验
		attachFlag = $(".form_validation_reg").compValidate({
			rules:{     
					approveReason: {minlength:1,maxlength:500}
				
				},
				messages:{
					approveReason:{maxlength:'审核意见不能超过500字'}
				}
		 });
	});
	*/
	
	 function onSub(status){
	     var check_error=$("#check_error").val();
	     if(check_error == "true"){
	        if(status=='1'){
	           fillDefaltMessage("通过");
	           comp.confirm("确认要通过吗？", function(result){
                if(!result)
                return; 
	           $("#flag").val("1");
	           $('#stuMulApproveForm').submit();
	           });  
	        }else{
	            fillDefaltMessage("拒绝");
	            comp.confirm("确认要拒绝吗？", function(result){
                if(!result)
                return; 
	            $("#flag").val("0");
	           $('#stuMulApproveForm').submit();
	           });  
	        }
	     }
	 }
	 
	 
	 	/**
		  * 为审批意见默认赋值
		  */
		function fillDefaltMessage(defultMsg){
		    var curMsg = $.trim($("#approveReason").val());
			if(comp.isNull(curMsg)){
				$("#approveReason").val(defultMsg);
			}
		}	
	
	
	function cleanForm(){
		$("#approveReason").val("");
	}
	
	
	<!--显示提示框-->
	$(function(){
		$('.tipTag').poshytip({
			className: 'tip-yellowsimple',
			alignTo: 'target',
			alignX: 'right',
			alignY: 'center',
			offsetX: 5
		});
	});
		
	</script>
	</body>
</html>