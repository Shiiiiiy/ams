<html>
<head>
	<!-- ajax form-->
	<script src="${rc.contextPath}/js/jquery.form.js"></script>
<script type="text/javascript">

</script>
	
</head>
<body>

<div id="contentwrapper">
    <div class="main_content">
 		<div class="row-fluid">
 		<!--	-->
     	<h3 class="heading">测评网址</h3>
       <form  id="evaluationForm" class="form_validation_reg" action="" method="post">
     	 <div class="formSep">
      		<div class="row-fluid">
	      		<div class="span5">
	      		  	<div class="span4">
	        			<span class="formTitle">测评网址</span><span class="formRed"></span>
	        	 	</div>
	           	  	<div class="span4">
	           	  	<span class="formTitle"><a href="${(webUrl.value)!''}">职业测评<a></span><span class="formRed"></span>
	        		</div>   
	    		</div>   
        	</div>
     	  </div> 
      </form>
	    <input name="check_error" id="check_error" type="hidden" value="true"/>   
		</div>
	</div>
</div>

</body>
</html>
