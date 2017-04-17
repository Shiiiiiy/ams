<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>importDemo</title>
		<!-- bootstrap-fileupload -->
		<link rel="stylesheet" href="${rc.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.min.css" />
		<script>
			function importDemo() {
				if ($("#file").val() == "") {
					comp.message("请选择要导入的excel文件", "error");
					return false;
				}
				$("#fileUpload").submit();
			}
			
			function uploadfile() {
				$("#resultsDiv").html($("#file").val());
			}
			
			function goToList() {
				window.location.href="${rc.contextPath}/sponsor/originLoan/opt-query/originLoanList.do";
			}
		</script>
	</head>

	<body>
		<div id="contentwrapper">
			<div class="main_content">
				<div class="row-fluid">
					<form  id="fileUpload"  action="${rc.contextPath}/sponsor/originLoan/opt-import/importOriginLoan.do" method="post"  enctype="multipart/form-data">
						<input type="hidden" name="objectId" value="${(logo.id)!""}"/>
						<input type="hidden" name="allowedExt" value="xls"/>
						<input type="hidden" name="maxSize" value="20971520"/>
						<!--2M-->
						<input type="hidden" name="TEMP_FILE" value="SYSCONFIG_FILE_SESSION_KEY"/>
						<!--临时文件存放sessionkey-->

						<div class="formSep">
							<div class="row-fluid">
								<div class="span8">
									<div class="span2">
										模板下载
									</div>
									<div class="span8">
										<div >
											<a href="${rc.contextPath}/excel/template/import_origin_loan.xls">生源地助学贷款导入模板</a>
										</div>
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
										<div class="alert alert-warning">
							    		<strong>注意!<br/></strong> 
							    			1.导入时请导入系统下载的模板,导入非系统下载的模板可能会导入失败<br/>
							    			2.最大导入行数为1000行。<br/>
											3.导入的各条数据之间不要有空行。<br/>
											4.有序列的请选择序列条目。<br/>
											5.导入的模板毕业日期这一列必须为日期格式， 贷款学年必须要在当前系统维护的学年范围之内。<br/> 
											6.删除整行数据时，点击鼠标右键选择"删除"操作，不要用"清除内容"和"Delete"键删除内容。<br/> 
											7.必填项目：姓名、学号、贷款学年、贷款银行、合同金额、贷款次数。<br/>
											8.需要导入的数据如果是从其他excel表中直接复制粘贴过来的，可能会导入失败。<br/>
							    	</div>
									</div>
								</div>
							</div>
						</div>
						<div class="formSep">
							<div class="row-fluid">
								<div class="span8">
									<div class="span2"></div>
									<div class="span8">
										<button class="btn btn-info" type="button" onclick="importDemo()">
											Excel导入
										</button>
										<button class="btn" type="button" onclick="goToList()">
											返回列表
										</button>
									</div>
								</div>
							</div>
						</div>
					</form>
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
					<#include "compareOriginLoan.ftl">
				</div>
			</div>
		</div>
	</body>
</html>