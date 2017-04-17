<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>importDemo</title>
        <!-- bootstrap-fileupload -->	
		<link rel="stylesheet" href="${rc.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.min.css" />
		<script src="${rc.contextPath}/js/bdp_fileupload.progressbar.js"></script>
		<link rel="stylesheet" href="${rc.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.min.css" />
 <script>
 	//var areaId = request("areaId");
 	//导入学生报到信息的处理
	function importReport(){
		if($("#file").val()==""){
			comp.message("请选择要导入的excel文件","error");
			return false;			
		}
	    $("#fileUpload").submit();
	}
	
	function goToList(){
	
	    window.location.href="${rc.contextPath}/studentinfo/student/opt-query/queryStudent.do?flag=1";
	}
	
	//下面代码解决重名文件可以连续上传问题，该功能需要根据实际业务进行调整
	$('.close').live('click', function() {
		$(this).alert('close');
		var file = $("#file");
		file.after(file.clone().val(''));
		file.remove();
	});

	function uploadfile(obj) {
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
			<form  id="fileUpload"  action="${rc.contextPath}/off/line/opt-query/importReport.do" method="post"  enctype="multipart/form-data">
				 <input type="hidden" name="allowedExt" value="xls"/>
				 <input type="hidden" name="maxSize" value="2097152"/><!--20M-->
				  <div class="formSep">
					<div class="row-fluid">
						<div class="span2">
							下载报到信息模板
						</div>
						<div class="span8">
					 		<div >
				 				<#--<a href="${rc.contextPath}/excel/edus/studentImport.xls">模板下载</a>-->
				 				<a href="${rc.contextPath}/excel/template/import_report_info.xls">模板下载</a>
				    		</div>
				    	</div>
			    	</div>
			     </div>
			     <br><br>
			      <div class="formSep">
					<div class="row-fluid">
						<div class="span8">						
								<div class="span2">
										<label>导入报到信息<span class="f_req">*</span></label>
								</div>
								<div class="span10" id="_upload_div">
									 <div data-fileupload="file" class="fileupload fileupload-new">
										<input type="hidden" name="allowedExt" value="xls" /> 
										
										<!--20M-->
										<span class="btn btn-file"> <span class="fileupload-new">选择文件</span>
											<input id="file" type="file" name="file"
											onchange="uploadfile(this)"> </span>
									</div>
									 <div class="alert alert-warning">
							    		<strong>注意!</strong> 
							    		<br>1.导入时请导入系统下载的模板,导入非系统下载的模板可能会导入失败。
							    		<br>2.最大导入行数为1000行。
							    		<br>3.导入的各条数据之间不要有空行。
							    		<br>4.模版中的学院、专业、班级，这些列中输入的数据需是当前系统中存在的名称相同。 
							    		<br>5.删除整行数据时，点击鼠标右键选择"删除"操作，不要用"清除内容"和"Delete"键删除内容。 
							    		<!--<br>6.必填项目：校区、专业、专业编码、班级、班级编码、学籍号、学号、姓名、性别、出生日期、年龄、身份证号、政治面貌、入学日期、毕业日期、生源类型、第一监护人姓名、第一监护人与被监护人关系、第一监护人工作单位、第一监护人联系电话、第一监护人联系年龄、第一监护人联系政治面貌、第一监护人联系职务、第二监护人姓名、第二监护人与被监护人关系、第二监护人工作单位、第二监护人联系电话、第二监护人联系年龄、第二监护人联系政治面貌、第二监护人联系职务-->
							    	
							    	    <br>6.必填项目：学号、姓名、证件号码、绿色通道、报到时间、状态。
							    	</div>								 
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
				        	<p class="btnMargin">
								<button class="btn btn-info" type="button" onclick="importReport()">Excel导入</button>
								<#--<button class="btn" type="button" onclick="goToList()">返回列表</button>-->
							</p>
						</div>
					</div>
				</div>	
				<#if errorText??>
				<div class="formSep">
						<div class="row-fluid">	
							<#if errorText??>
								<#if errorText!="">
									<span class="f_req">
										${errorText}
									</span>
								<#else>
									<span style="color:blue;font-size:15px">
										导入成功
									</span>
								</#if>		
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