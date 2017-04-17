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
				window.location.href="${rc.contextPath}/reward/helpaward/opt-query/queryHelpBursePage.do";
			}

		</script>
	</head>

	<body>
		<div id="contentwrapper">
			<div class="main_content">
				<div class="row-fluid">
					<form  id="fileUpload"  action="${rc.contextPath}/reward/helpaward/opt-query/importHelpBurse.do" method="post"  enctype="multipart/form-data">
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
										模板下载
									</div>
									<div class="span8">
										<div >
											<a href="${rc.contextPath}/excel/template/import_reward_helpBurse.xls">国家奖助导入模板</a>
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
											5.模版中的学号、学年、资助档次，这些列中输入的数据需是当前系统中存在的名称相同。<br/> 
											6.删除整行数据时，点击鼠标右键选择"删除"操作，不要用"清除内容"和"Delete"键删除内容。<br/> 
											7.必填项目：学号、学年、资助档次。<br/>
							    	</div>
									</div>
								</div>
							</div>
						</div>
						</br>
							<div class="row-fluid">
								<div class="span8">
									<div class="span2">
									</div>
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
					<#include "compareHelpBurse.ftl">
				</div>
			</div>
		</div>
	</body>
</html>