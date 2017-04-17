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
			<form  id="associationMulApproveForm"  class="form_validation_reg"  
						   action="${rc.contextPath}/association/approve/opt-apporve/mulAssociationApprove.do" method="post">
				<input type="hidden" id="mulResults" name="mulResults"/>
			</form>
			<#include "/association/approve/selectedAssociationApplyList.ftl">
			<#include "/apw/instance/mulProcessEdit.ftl">
		</div>
	</div>
	<script>
	
		//执行系统业务操作
		function doMulAction(resultsArray){
			 $("#mulResults").val(JSON.stringify(resultsArray));
		     $("#associationMulApproveForm").submit();
		}
	</script>
	</body>
</html>