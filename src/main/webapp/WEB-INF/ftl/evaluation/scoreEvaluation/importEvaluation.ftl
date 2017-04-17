<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>importEvaluation</title>
		<!-- bootstrap-fileupload -->
		<link rel="stylesheet" href="${rc.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.min.css" />
		<script>
			function uploadfile() {
				$("#resultsDiv").html($("#file").val());
			}

			function importDemo() {
				if ($("#file").val() == "") {
					comp.message("请选择要导入的excel文件", "error");
					return false;
				}
				$("#fileUpload").submit();
			}

			function goToList() {
				window.location.href="${rc.contextPath}/evaluation/score/opt-query/queryEvaluationList.do";
			}

		</script>
	</head>

	<body>
		<div id="contentwrapper">
			<div class="main_content">
				<div class="row-fluid">
					<form  id="fileUpload"  action="${rc.contextPath}/evaluation/score/opt-query/importEvaluationDetail.do" method="post"  enctype="multipart/form-data">
						<input type="hidden" name="objectId" value="${(logo.id)!""}"/>
						<input type="hidden" name="allowedExt" value="xls"/>
						<input type="hidden" name="maxSize" value="2097152"/>
						<!--2M-->
						<input type="hidden" name="TEMP_FILE" value="SYSCONFIG_FILE_SESSION_KEY"/>
						<!--临时文件存放sessionkey-->

						<div class="formSep">
							<div class="row-fluid">
								<div class="span8">
									<div class="span2">
										<label>导入文件<span class="f_req">*</span></label>
									</div>
									<div class="span10" id="_upload_div">
										<div data-fileupload="file" class="fileupload fileupload-new">
											<span class="btn btn-file"> <span class="fileupload-new">选择文件</span>
												<input id="file" type="file" name="file" onchange="uploadfile()">
											</span>
											<div id="resultsDiv"></div>
										</div>
										<div class="alert alert-warning">
							    		<strong>注意!<br/></strong> 
							    			1.导入前请导出测评明细,然后选择导出的文件进行填写分数,其他列请不要做多余修改<br/>
							    			2.最大导入行数为1000行。<br/>
											3.导入的各条数据之间不要有空行。<br/>
											4.有序列的请选择序列条目。<br/>
											5.删除整行数据时，点击鼠标右键选择"删除"操作，不要用"清除内容"和"Delete"键删除内容。<br/> 
							    	</div>
									</div>
								</div>
							</div>
						</div>
						
					<#if importFlag?? && !(errorText??)>
						<div class="formSep">
					<#elseif errorText?? &&(errorText?size>0)>
						<div class="formSep">
					<#else>
						<div>
					</#if>
							<div class="row-fluid">
								<div class="span8">
									<p class="btnMargin">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										<button class="btn btn-info" type="button" onclick="importDemo()">
											Excel导入
										</button>
										<button class="btn" type="button" onclick="goToList()">
											返回列表
										</button>
									</p>
								</div>
							</div>
						</div>
					</form>
					<#if importFlag?? && !(errorText??)>
						<span style="color:blue;font-size:15px">导入成功</span>
					<#elseif errorText?? &&(errorText?size>0)>
						<div class="formSep">
							<div class="row-fluid">
								<#if (errorText?size > 0)>
									<#list errorText as e>
										<span class="f_req"> ${e!""} </span>
									</#list>
								</#if>
							</div>
						</div>
					</#if>
				</div>
			</div>
		</div>
	</body>
</html>