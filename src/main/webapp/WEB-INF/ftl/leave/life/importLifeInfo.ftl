<!--讲师信息导入页面-->
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>importInfoDemo</title>
        <!-- bootstrap-fileupload -->	
		<link rel="stylesheet" href="${rc.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.min.css" />
		<script src="${rc.contextPath}/js/bdp_fileupload.progressbar.js"></script>
		
 <script>

	function importDemo(){
		if($("#file").val()==""){
			comp.message("请选择要导入的excel文件","error");
			return false;			
		}
  			var selectTime=$("#selectTime").val();
			var action=$("#fileUpload").attr("action");
			$("#fileUpload").submit();
	}
	function goToList() {
		window.location.href="${rc.contextPath}/leave/life/opt-query/queryLifePage.do";
	}

	//下面代码解决重名文件可以连续上传问题，该功能需要根据实际业务进行调整
		$('.close').click(function() {
			alert("重名且连续上传");
			$(this).alert('close');
			var file = $("#file");
			file.after(file.clone().val(''));
			file.remove();
		});

	function uploadfile(obj) {
		//如果上传多个文件，先清除前一个Excel文件，然后执行上传
		$(".fileupload-info").remove();
		var fileName = $("#file").val();
		fileName = fileName.substring(fileName.lastIndexOf("\\") + 1,
				fileName.length);
		if (fileName.indexOf(".") > -1) {
			var ext = fileName.substring(fileName.lastIndexOf(".") + 1,
					fileName.length);
			if ("xls".indexOf(ext) < 0) {
				comp.message("文件上传类型只能是xls类型,请重新选择文件。", "error");
				return;
			}
		}
		var lastFileDiv = $("div[class='alert alert-info']:last");
		if (lastFileDiv != null) {
			lastFileDiv.remove();
		}
		var div = fileupload.create_fileupload_div($("#_upload_div"), $(obj)
				.val());
		$(div).find("div").remove();
	}
	
</script>
    </head>

<body>
<div id="contentwrapper">
    <div class="main_content"> 
    	<div class="row-fluid">	
			<form  id="fileUpload" action="${rc.contextPath}/leave/life/opt-import/importLifeInfo.do" method="post" enctype="multipart/form-data">
				 <input type="hidden" name="allowedExt" value="xls"/>
				 <input type="hidden" name="maxSize" value="2097152"/><!--20M-->
				 
				<div class="formSep">
					<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<label>导入模板</label>
								</div>
								<div class="span9">
									<label><a href="${rc.contextPath}/excel/template/lifeInfo.xls">模板下载</a></label>
								</div>
							</div>
							
						</div>
					</div>
				
			     	<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<label>导入就业学生信息<span class="f_req">*</span></label>
								</div>
								<div class="span9" id="_upload_div">
									 <div data-fileupload="file" class="fileupload fileupload-new">
										<input type="hidden" name="allowedExt" value="xls" /> 
										<!--20M-->
										<span class="btn btn-file"> 
										    <span class="fileupload-new">选择文件</span>
											<input id="file" type="file" name="file" onchange="uploadfile(this)"> 
										</span>
									</div>
									<div class="upload-alert alert-info" style="display:none" id="upload-alertalert-info">
										  <div id="resultsDiv" display="none"></div>											
									 </div>
									 <div class="alert alert-warning" style="width:550px;">
							    		<strong>注意!<br/></strong> 
							    			1.导入时请导入系统下载的模板,导入非系统下载的模板可能会导入失败<br/>
							    			2.最大导入行数为1000行。<br/>
											3.导入的各条数据之间不要有空行。<br/>
											4.有序列的请选择序列条目。<br/>
											5.模版中的姓名、学号这些列中输入的数据需是当前系统中存在的名称相同。<br/> 
											6.删除整行数据时，点击鼠标右键选择"删除"操作，不要用"清除内容"和"Delete"键删除内容。<br/> 
											<br/>
							    	</div>							 
								</div>
							</div>
						</div>
					</div>
					
				
					<div class="row-fluid">
						<div class="span6">
							<div class="span3"></div>
							<div class="span9">
								<br/>
								<button class="btn btn-info" type="button" onclick="importDemo()">Excel导入</button>
								<button class="btn" type="button" onclick="goToList()">返 回</button>
							</div>
						</div>
					</div>
      		    </form>
				<#if importFlag?? && errorText??>
					<div class="row-fluid">
						<#if (errorText?size > 0)>
							<#list errorText as e>
								<span class="f_req"> ${e!""} </span>
							</#list>
						</#if>
					</div>
	            <#elseif importFlag?? && !(errorText??)>
		            <span style="color:blue;font-size:15px">导入成功</span>
				</#if>
		</div>
	</div>
</div>
	</body>
</html>