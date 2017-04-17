<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>importDemo</title>
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
				window.location.href="${rc.contextPath}/job/agreement/opt-query/agreementList.do";
			}
		</script>
	</head>

	<body>
		<div id="contentwrapper">
		<div class="main_content">
			<div class="row-fluid">
			<form id="fileUpload" action="${rc.contextPath}/job/aggreement/opt-import/importAgreementCode.do" method="post" enctype="multipart/form-data">
				<input type="hidden" name="objectId" value="${(logo.id)!""}"/>
				<input type="hidden" name="allowedExt" value="xls,xlsx"/>
				<input type="hidden" name="maxSize" value="20971520"/>
				<!--2M-->
				<input type="hidden" name="TEMP_FILE" value="SYSCONFIG_FILE_SESSION_KEY"/>
				<!--临时文件存放sessionkey-->

				<div class="formSep">
					<div class="row-fluid">
						<div class="span8">
							<div class="span2">
								<label>模板下载</label>
							</div>
							<div class="span8">
								<label> <a href="${rc.contextPath}/excel/template/import_agreement_code.xls">就业协议书编号导入模板</a> </label>
							</div>
						</div>
					</div>
				</div>
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
								<div class="alert alert-warning" style=" width : 560px">
					    		<strong>注意!<br/></strong> 
					    			1.导入时请导入系统下载的模板,导入非系统下载的模板可能会导入失败<br/>
					    			2.最大导入行数为5000行。<br/>
									3.导入的各条数据之间不要有空行。<br/>
									4.有序列的请选择序列条目。<br/>
									5.删除整行数据时，点击鼠标右键选择"删除"操作，不要用"清除内容"和"Delete"键删除内容。<br/> 
									6.必填项目：姓名、学号、就业协议书编号。<br/>
									7.需要导入的数据如果是从其他excel表中直接复制粘贴过来的，可能会导入失败。<br/>
					    	</div>
							</div>
						</div>
					</div>
				</div>
		</form>	
				<div class="row-fluid">
					<div class="span8">
						<div class="span2"></div>
						<div class="span8">
							<br/>
							<button class="btn btn-info" type="button" onclick="importDemo()">Excel导入</button>
							<button class="btn" type="button" onclick="goToList()">返 回</button>
						</div>
					</div>
				</div>
				
			
			<#if importFlag?? && errorText??>
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
			
			
			<#include "compareAgreementCode.ftl">
		</div>
		</div>
		</div>
	</body>
</html>