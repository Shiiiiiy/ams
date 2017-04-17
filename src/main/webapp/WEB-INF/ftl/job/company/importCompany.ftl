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
				<form id="fileUpload"  action="${rc.contextPath}/job/companyInfo/opt-query/importCompanyInfo.do" method="post"  enctype="multipart/form-data">
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
									<label><a href="${rc.contextPath}/excel/template/import_company_info.xls">模板下载</a></label>
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
										<br>4.删除整行数据时，点击鼠标右键选择"删除"操作，不要用"清除内容"和"Delete"键删除内容。 
										<br>5.必填项目：企业名称、企业性质、企业详细地址、联系人、是否签订校企合作协议、是否批量就业单位。
										<br>6.导入数据按所属学院、企业名称和企业性质排除重复数据，如果导入的数据和数据库中存在的数据重复，则将数据库中的数据覆盖。
										<br>7.所属学院只有招生就业处的教师可以不填，其它学院的教师需要填写教师自己所在学院，如果招生就业处教师没有填写所属学院，则导入数据的所属学院为招生就业处。
									</div>
								</div>
							</div>
						</div>
					</div>
					<br/>
					<div <#if importFlag?? && errorText?? && errorText?size gt 0>class="formSep"</#if> >
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
								</div>
								<div class="span9">
									<button class="btn btn-info" type="button" onclick="importCompanyInfo();"/>
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
				<#if importFlag?? && errorText?? && errorText?size gt 0>
					<div class="row-fluid">
						<#if (errorText?size > 0)>
							<#list errorText as e>
								<span class="f_req"> ${e!""} </span>
							</#list>
						</#if>
					</div>
				</#if>
				<#if importFlag?? && (!(errorText??) || errorText?size == 0) >
					<span style="color:blue;font-size:15px">导入成功</span>
				</#if>
			</div>
		</div>
		<script type="text/javascript">
			//上传组件
			function uploadfile() {
				$("#resultsDiv").attr("class","fileupload-info");
				$("#resultsDiv").html($("#file").val());
			}
			//导入
			function importCompanyInfo(){
				var fileUpload = $("#fileUpload");
				fileUpload.submit();
			}
			//返回列表页面
			function goToList(){
				window.location.href="${rc.contextPath}/job/companyInfo/opt-query/queryCompanyInfoList.do";
			}
		</script>
	</body>
</html>