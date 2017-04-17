<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="${rc.contextPath}/css/bdp_comp.css" type="text/css"/>
		<!-- My97DatePicker -->
		<link rel="stylesheet" href="${rc.contextPath}/lib/My97DatePicker/skin/WdatePicker.css" />
		<script type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
		<!-- bootstrap-fileupload -->
		<link rel="stylesheet" href="${rc.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.min.css" />
	</head>
	<body>
		<div id="contentwrapper">
			<div class="main_content">
				<form id="fileUpload"  action="${rc.contextPath}/job/employmentScheme/opt-query/importEmploymentScheme.do" method="post"  enctype="multipart/form-data">
					<input type="hidden" name="objectId" value="${(logo.id)!""}"/>
					<input type="hidden" name="allowedExt" value="xls,xlsx"/>
					<input type="hidden" name="maxSize" value="20971520"/>
					<!--2M-->
					<input type="hidden" name="TEMP_FILE" value="SYSCONFIG_FILE_SESSION_KEY"/>
					<!--临时文件存放sessionkey-->
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<label>下载模板</label>
								</div>
								<div class="span9">
									<label><a href="${rc.contextPath}/excel/template/import_employment_scheme.xls">模板下载</a></label>
								</div>
							</div>
						</div>
					</div>
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<label>导入文件<span class="f_req">*</span></label>
								</div>
								<div class="span9" id="_upload_div">
									<div data-fileupload="file" class="fileupload fileupload-new">
										<span class="btn btn-file"><span class="fileupload-new">选择文件</span>
											<input id="file" type="file" name="file" onchange="uploadfile();">
										</span>
										<div id="resultsDiv"></div>
									</div>
									<div class="alert alert-warning" style="width:550px;">
										<strong>注意!</strong>
										<br>1.导入时请导入系统下载的模板,导入非系统下载的模板可能会导入失败。
										<br>2.最大导入行数为5000行。
										<br>3.导入的各条数据之间不要有空行。
										<br>4.模版中的姓名、身份证号，这些列中输入的数据需是当前系统中存在的名称相同。 
										<br>5.删除整行数据时，点击鼠标右键选择"删除"操作，不要用"清除内容"和"Delete"键删除内容。 
										<br>6.必填项目：学号。
									</div>
								</div>
							</div>
						</div>
					</div>
					<br/>
					<div <#if importFlag?? && errorText??>class="formSep"</#if> >
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
								</div>
								<div class="span9">
									<button class="btn btn-info" type="button" onclick="importEmploymentScheme();"/>
										Excel导入
									</button>
									<button class="btn" type="button" onclick="goToList();">
										返回列表
									</button>
								</div>
							</div>
						</div>
						<br/>
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
				</#if>
				<#include "compareEmploymentScheme.ftl">
			</div>
		</div>
		<script type="text/javascript">
			//上传组件
			function uploadfile() {
				$("#resultsDiv").attr("class","fileupload-info");
				$("#resultsDiv").html($("#file").val());
			}
			//导入
			function importEmploymentScheme(){
				var fileUpload = $("#fileUpload");
				fileUpload.submit();
			}
			//返回列表页面
			function goToList(){
				window.location.href="${rc.contextPath}/job/employmentScheme/opt-query/queryEmploymentSchemeList.do";
			}
		</script>
	</body>
</html>