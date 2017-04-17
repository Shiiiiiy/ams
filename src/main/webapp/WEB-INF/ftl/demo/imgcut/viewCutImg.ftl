<html>
<title>form elements</title>
<head>
	<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
<div id="contentwrapper">
    <div class="main_content">
    <div class="row-fluid">
	<h3 class="heading">图片裁剪结果</h3>
		
			
			<div class="formSep">
				<div class="row-fluid">					
					<div class="span12">
						
						<div class="span3">
								<label>图像 </label>
						</div>
						<div class="span9" id="srcDiv" >
							<img src="${rc.contextPath}/demo/imgcut/viewCutImg.do?id=${fileId!}">
		        		</div>
		        		
					</div>
				</div>
			</div>
			<div class="span6">
	        	<p class="btnMargin">
			  		<button class="btn" type="button" onclick="cancel()">返回</button>
				</p>
			</div>
	</div>	
	</div>
</div>
<script>
		function cancel(){
			window.location.href="${rc.contextPath}/demo/imgcut/view.do";
		}
</script>
</body>
</html>