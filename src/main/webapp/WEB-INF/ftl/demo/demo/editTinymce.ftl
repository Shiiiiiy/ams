<html>
<title></title>
<head>
<script src="${rc.contextPath}/lib/tinymce/tinymce.min.js"></script>
</head>
<body>
	<div id="contentwrapper">
	    <div class="main_content">
	    	<div class="row-fluid">
		   		 <div class="span12">
			    	<h3 class="heading">
						tinymce
					</h3>
			    </div>
	    	</div>
		
			<form  id="testForm" class="form_validation_reg" action="${rc.contextPath}/demo/testMce/opt-update/submitTinymce.do" method="post">
			<div class="formSep">
				<div class="row-fluid">
					<div class="span8">
						<div class="span2">
							<label>名称 </label>
						</div>
						<div class="span10">
							<input id="name" name="name"  value="${name!}" />
						</div>
					</div>
				</div>
			</div>
			<div class="formSep">
				<div class="row-fluid">
					<div class="span8">
						<div class="span2">
							<label>区域 </label>
						</div>
						<div class="span10">
							<textarea name="comments" id="comments" cols="12" rows="5" class="span12">${comments!}</textarea>
						</div>
					</div>
				</div>
			</div>

			
			<div class="span6">
	        	<p class="btnMargin">
	        		<button class="btn btn-info" type="submit">确定</button>
			  		<button class="btn" type="button">取消</button>
				</p>
			</div>
			</form>
		</div>
	</div>
	<script>
	    tinymce.init({
		    selector: "textarea#comments",
		    language:'zh_CN',
		    menubar: false,
		    statusbar : false,
		    toolbar_items_size: 'small',
		    theme: "modern",
		    plugins: [
		         "advlist autolink link image lists charmap print preview hr anchor pagebreak",
		         "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
		         "save table contextmenu directionality emoticons template paste textcolor"
		   ],
		   toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | print preview media fullpage | forecolor backcolor fontselect fontsizeselect emoticons",
		   fontsize_formats: "8pt 10pt 12pt 14pt 18pt 24pt 36pt"
		});     
	 </script>
</body>
</html>
