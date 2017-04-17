<html>
<title>form elements</title>
<head>
	<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- jQuery UI theme-->
    <link rel="stylesheet" href="${rc.contextPath}/lib/jquery-ui/css/Aristo/Aristo.css" />
    <script src="${rc.contextPath}/lib/jquery-ui/jquery-ui-1.8.20.custom.min.js"></script>
    <!-- animated progressbars -->
    <script src="${rc.contextPath}/js/bdp_fileupload.progressbar.js"></script>
    <!-- ajax form-->
	<script src="${rc.contextPath}/js/jquery.form.js"></script>
	
	<!-- bootstrap-fileupload -->	
	<link rel="stylesheet" href="${rc.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.min.css" />
	<link rel="stylesheet" type="text/css" href="${rc.contextPath}/lib/imgAreaSelect/css/imgareaselect-default.css" />
  	<script type="text/javascript" src="${rc.contextPath}/lib/imgAreaSelect/scripts/jquery.imgareaselect.pack.js"></script>
</head>
<body>
<div id="contentwrapper">
    <div class="main_content">
    <div class="row-fluid">
	<h3 class="heading">图片裁剪</h3>
		
			<div class="formSep">
				<div class="row-fluid">					
					<div class="span6">
						
						<div class="span3">
								<label>附件 </label>
						</div>
						<div class="span9" id="_upload_div">
							<form  id="fileUploadForm"  name="fileUploadForm" action="" method="post"  enctype="multipart/form-data">	
							 	<div data-fileupload="file" class="fileupload fileupload-new">
									<span class="btn btn-file"><span class="fileupload-new">选择文件</span><input id="file" type="file" name="file" onchange="uploadFile(this)"></span>
								 </div>
							</form>
		        		</div>
		        		
					</div>
				</div>
			</div>
			<div class="formSep">
				<div class="row-fluid">					
					<div class="span12">
						
						<div class="span3">
								<label>图像 </label>
						</div>
						<div class="span9" id="srcDiv" style="text-align:center">
							
		        		</div>
		        		
					</div>
				</div>
			</div>
			<form method="post" name="cutForm" action="${rc.contextPath}/demo/imgcut/cut.do">
			<input type="hidden" id="fileId" name="id" value=""/>
			<input type="hidden" id="fw" name="fw" value=""/>
			<input type="hidden" id="fh" name="fh" value=""/>
			<div class="formSep" style="display:none">
				<div class="row-fluid">					
					<div class="span6">
						<div class="span3">
								<label>x1 </label>
						</div>
						<div class="span9" id="regionDiv" >
							<input type="text" id="x1" name="x1" value="" />
		        		</div>
					</div>
				</div>
			</div>
			<div class="formSep" style="display:none">
				<div class="row-fluid">					
					<div class="span6">
						<div class="span3">
								<label>y1 </label>
						</div>
						<div class="span9" id="regionDiv" >
							<input type="text" id="y1" name="y1" value="" />
		        		</div>
					</div>
				</div>
			</div>
			<div class="formSep" style="display:none">
				<div class="row-fluid">					
					<div class="span6">
						<div class="span3">
								<label>x2</label>
						</div>
						<div class="span9" id="regionDiv" >
							<input type="text" id="x2" name="x2" value="" />
		        		</div>
					</div>
				</div>
			</div>
			<div class="formSep" style="display:none">
				<div class="row-fluid">					
					<div class="span6">
						<div class="span3">
								<label>y2 </label>
						</div>
						<div class="span9" id="regionDiv" >
							<input type="text" id="y2" name="y2" value="" />
		        		</div>
					</div>
				</div>
			</div>
			<div class="formSep" style="display:none">
				<div class="row-fluid">					
					<div class="span6">
						<div class="span3">
								<label>w </label>
						</div>
						<div class="span9" id="regionDiv" >
							<input type="text" id="w" name="w" value="" />
		        		</div>
					</div>
				</div>
			</div>
			<div class="formSep" style="display:none">
				<div class="row-fluid">					
					<div class="span6">
						<div class="span3">
								<label>h </label>
						</div>
						<div class="span9" id="regionDiv" >
							<input type="text" id="h" name="h" value="" />
		        		</div>
					</div>
				</div>
			</div>
			<div class="span6">
	        	<p class="btnMargin">
			  		<button class="btn btn-info" type="button" onclick="doSubmit()">确定</button>
				</p>
			</div>
			
			</form>
	</div>	
	</div>
</div>
	<script>
	    var tag=0;
	    function doSubmit() {
	    	if (document.cutForm.h.value == null || document.cutForm.h.value == '' || document.cutForm.h.value == '0' || document.cutForm.w.value == null || document.cutForm.w.value == '' || document.cutForm.w.value == '0' ) {
	    		comp.message("请选择要裁剪的区域.","error");
	    	} else {
	    		document.cutForm.submit();
	    	}
	    }
		function uploadFile(obj){	
			canUpload = 1;
			//fileSize = $("#fileUploadForm input[name='fileIds']").size();
			if (canUpload == 1) {
				if($("#fileUploadForm .sepH_b").length>0||tag){//创建进度条以及包括页面中存在进度条时候不能再上传
					comp.message("同时只能上传一个文件，待上传完成后，再重试。","error");
					canUpload = 0;
				}
			}
			
			//验证文件扩展名,该逻辑根据具体业务可自行调整
			var fileName=$(obj).val();
			if (canUpload == 1) {
				fileName=fileName.substring(fileName.lastIndexOf("\\")+1,fileName.length);
				validExt="jpg";
				if(fileName.indexOf(".")>-1) {
					var ext=fileName.substring(fileName.lastIndexOf(".")+1,fileName.length);
					if(validExt.toLowerCase().indexOf(ext.toLowerCase())<0){
						comp.message("文件格式不支持，请重新选择文件。","error");
						canUpload = 0;
					}
				} else {
					comp.message("文件格式不支持，请重新选择文件。","error");
					canUpload = 0;
				}
			}
			if (canUpload == 1) {
				tag=1;
				var div=fileupload.create_fileupload_div($("#fileUploadForm"),$(obj).val());
				tag=0;	
							
				var param="?maxSize=10485760&isTempFile=false";//设置业务文件大小限制上限不能超过10M
				
				$("#fileUploadForm").attr("action","${rc.contextPath}/sys/sysConfig/singleFileUpload.do"+param);		
				$("#fileUploadForm").ajaxSubmit(function(data){
					
					if($.browser.msie&&($.browser.version=='8.0'||$.browser.version=='9.0')){
						try{//ie8才能执行如下代码
							data=$(data).unwrap().text();
						}catch(e){
						}
					}
						
					try{
						var obj=eval(data)[0];				
						if(obj.fileId==''){
							comp.message(obj.errorInfo,"error");
							$(div).remove();
						}else{
							
							$(div).append($("<input>",{						
								type:'hidden',
								val:obj.fileId,
								name:'fileIds',
							}));
							$(div).find("div").remove();
							$(div).find("a").remove();
							$(div).append("<a class=\"close\" data-dismiss=\"alert\" onclick=\"clearPage()\">×</a>");
							$(div).find("strong").append(("&nbsp;("+obj.fileSize+")"));
							$(div).find("strong").wrapAll("<a href=\"${rc.contextPath}/sys/sysConfig/file.do?id="+obj.fileId+"\"/>");
							$("#srcDiv").append("<img  id=\"srcImg\" src=\"${rc.contextPath}/sys/sysConfig/file.do?id="+obj.fileId+"\"/>");
							$('#fileId').val(obj.fileId);
							cuteImg();
							comp.message("上传文件完成。","info");
						}
					}catch(e){
						comp.message("文件提交服务器失败，请稍后刷新页面重试，如果还未成功请联系管理。","error");
					}
					$("#file").after($("#file").clone().val(''));
					$("#file").remove();					
				});
			} else {
				$("#file").after($("#file").clone().val(''));
				$("#file").remove();
			}
		}
		function cuteImg() {
		    //$('#srcImg').imgAreaSelect({ x1: 0, y1: 0, x2: 100, y2: 100 });
		    
		    $('#srcImg').imgAreaSelect({handles: true, fadeSpeed: 200, onSelectChange: preview });
		}
	    function preview(img, selection) {
	    	$('#fw').val($('#srcImg').width());
	    	$('#fh').val($('#srcImg').height());
		    $('#x1').val(selection.x1);
		    $('#y1').val(selection.y1);
		    $('#x2').val(selection.x2);
		    $('#y2').val(selection.y2);
		    $('#w').val(selection.width);
		    $('#h').val(selection.height)
		
		    
		}
		function clearPage() {
			$("#srcDiv").remove();
			location.href="${rc.contextPath}/demo/imgcut/view.do";
		}
	 </script>
</body>
</html>