<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
</head>
<body>
<div id="contentwrapper">
	<div class="main_content">
		<div class="row-fluid">
			<h3 class="heading">讲座信息</h3>
			<input name="errorText" id="errorText" type="hidden" value="${errorText!""}"/>
				<input id="status_id" name="status_id" type="hidden"/>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<label>讲座名称</label>
							</div>
							<div class="span9">
								<input value="${(seminarManage.seminarName)!""}" readonly/>
							</div>
						</div>
						<div class="span6">
							<div class="span3">
								<label>主讲人</label>
							</div>
							<div class="span9">
								<input value="${(seminarManage.outerUserId.userName)!""}" readonly/>
							</div>
						</div>
					</div>
				</div>	
				
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<label>讲座时间</label>
							</div>
							<div class="span9">
								<input value="${((seminarManage.seminarDate?string("yyyy-MM-dd"))!"")?html} ${(seminarManage.beginDate)!""}至${(seminarManage.endDate)!""}" readonly/>
							</div>
						</div>
						<div class="span6">
							<div class="span3">
								<label>讲座地点</label>
							</div>
							<div class="span9">
								<input value="${(seminarManage.appointPlace)!""}" readonly/>
							</div>
						</div>
					</div>
				</div>
		
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<label>讲座人数</label>
							</div>
							<div class="span9">
								<input value="${(seminarManage.attendNum)!""}" readonly/>
							</div>
						</div>
					</div>
				</div>
			<#-->	
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<label>讲座主题</label>
							</div>
							<div class="span9">
								<textarea rows="5" cols="12" style="width: 770px; height: 37px;" readonly>${((seminarManage.seminarTheme)!"")?html}</textarea>
							</div>
						</div>
					</div>
				</div>
			<-->	
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<label>备注</label>
							</div>
							<div class="span9">
								<textarea rows="5" cols="12" style="width: 775px; height: 134px;" readonly><#if seminarManage.comment??>${(seminarManage.comment)!""}</#if></textarea>
							</div>
						</div>
					</div>
				</div>

				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<label>相关附件</label>
							</div>
							<div class="span9" id="_upload_div">
								<#if uploadFileRefList??>
									<#list uploadFileRefList as f>
										<div class="fileupload-info">
											<a href="${rc.contextPath}/sys/sysConfig/file.do?id=${f.uploadFile.id}"><strong>${f.uploadFile.name}&nbsp;(${f.uploadFile.fileSize})</strong></a>
										</div>					
									</#list>
								</#if> 
							</div>
						</div>
					</div>
				</div>
			</br>
			<div class="row-fluid">
				<div class="span6">
					<div class="span3">
					</div>
					<div class="span9">
						<button class="btn" type="button" onclick="closeWindow()">关 闭</button>
					</div>
				</div>
			</div>
			<input name="check_error" id="check_error" type="hidden" value="true"/>
		</div>
	</div>
</div>
<script>
	//关闭页面
	function closeWindow(){   
		window.close();
	}
</script>
</body>
</html>