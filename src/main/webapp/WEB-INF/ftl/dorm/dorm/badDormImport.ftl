<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- bootstrap-fileupload -->	
        <script src="${rc.contextPath}/js/bdp_fileupload.progressbar.js"></script>
		<link rel="stylesheet" href="${rc.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.min.css" />
 <script>
	function uploadfile(obj) {
		 	$("#resultsDiv").html($("#file").val());
	}
	
	//下面代码解决重名文件可以连续上传问题，该功能需要根据实际业务进行调整
	$('.close').live('click', function() {
		$(this).alert('close');
		var file = $("#file");
		file.after(file.clone().val(''));
		file.remove();
	});
	
	function importBadDormList(){
		if($("#file").val()==""){
			comp.message("请选择要导入的excel文件","error");
			return false;			
		}
	    $("#fileUpload").submit();
	}
	
	function goToList(){
	    window.location.href="${rc.contextPath}/dorm/dormInfo/opt-query/queryStudentDormInfoList.do";
	}
	
</script>
    </head>

<body>
<div id="contentwrapper">
    <div class="main_content"> 
    	<div class="row-fluid">	
			<form  id="fileUpload" action="${rc.contextPath}/dorm/dormInfo/opt-import/importGoodDormList.do" method="post"  enctype="multipart/form-data">
				 <input type="hidden" name="allowedExt" value="xls"/>
				 <input type="hidden" name="maxSize" value="2097152"/><!--2M-->
				  <div class="formSep">
					<div class="row-fluid">
					  <div class="span9">
						<div class="span2">较差宿舍导入</div>
						<div class="span8">
					 		<div>
				 				<a href="${rc.contextPath}/excel/template/import_dorm_bad_template.xls">较差宿舍导入模板</a>
				    		</div>
				    	</div>
				      </div>
			    	</div>
			     </div>
			     <div class="formSep">
					 <div class="row-fluid">
						 <div class="span9">						
							<div class="span2">
								<label>较差宿舍信息<span class="f_req">*</span></label>
							</div>
							<div class="span10" id="_upload_div">					
								 <div data-fileupload="file" class="fileupload fileupload-new">
									 <span class="btn btn-file">
										  <span class="fileupload-new">选择文件</span>											
										  <input id="file" type="file" name="file" onchange="uploadfile(this)">
									 </span>
								     <div id="resultsDiv"></div>											
							     </div>
						         <div class="alert alert-warning">
					    		    <strong>注意!</strong> 
					    		    <br>1.导入时请导入系统下载的模板,导入非系统下载的模板可能会导入失败。
					    		    <br>2.最大导入行数为1000行。
					    		    <br>3.导入的各条数据之间不要有空行。
					    		    <br>4.较差宿舍将以宿舍编号作为唯一标识进行比对，导入前请确认宿舍编号无误。
					    		    <br>5.删除整行数据时，点击鼠标右键选择"删除"操作，不要用"清除内容"和"Delete"键删除内容。 
					    		    <br>6.必填项目：列明标红均为必填项。
					    		    <br>7.导入的数据不做重复校验，若宿舍号相同则更新对应宿舍的信息。
					    		    <br>8.其中日期、时间、联系电话是按照字符串处理，请在上传是将对应的列转成文本格式。
				    	         </div>							 
						    </div>
						 </div>
					 </div>
			     </div>
				<br/>
				<div class="row-fluid">
					<div class="span9">						
						<div class="span2">&nbsp;</div>
						<div class="span8">
							<button class="btn btn-info" type="button" onclick="importBadDormList()">Excel导入</button>
							<button class="btn" type="button" onclick="goToList()">返  回</button>
						</div>
					</div>
				</div>
				<br/>
				<#if errorText??>
					<div class="formSep" style="border-top:#dcdcdc 1px dashed">
						<div class="row-fluid">	
							<#if (errorText?size > 0)>
								<#list errorText as e>
									<span class="f_req"> ${e!""} </span>
								</#list>
								<#else>
									<span>导入成功</span>
							</#if>		
						</div> 
					</div>
				</#if>	
			</form>
		</div>
	</div>
</div>
</body>
</html>