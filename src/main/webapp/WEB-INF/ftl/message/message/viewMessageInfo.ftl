<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
</head>
<body>
<div id="contentwrapper">
	   <div class="row-fluid">
				<div class="span11" style="text-align:center">
					<h2>${messageInfo.title!""}</h2>
					<p>类别 : <#if messageInfo.messageType??>${messageInfo.messageType.name!""}</#if><span>&nbsp;&nbsp;&nbsp;&nbsp;发布日期：${messageInfo.postDate!""}</span></p> 
				</div>
				<div class="span11">
					${messageInfo.messageContent!""}
				</div>
				<#if listFile?? && (listFile?size &gt; 0)>
				<div class="span11">
					<hr>
					<#list listFile as lf>
						<div class="fileupload-info">
						<a href="${rc.contextPath}/sys/sysConfig/file.do?id=${lf.uploadFile.id}"><strong>${lf.uploadFile.name}&nbsp;(${lf.uploadFile.fileSize})</strong></a>
						<input type="hidden" name="fileId" id="fileId" value="${lf.uploadFile.id}"/>	
						</div>	
					</#list>			
				</div>
				</#if> 
			</div>
	</div>
</body>
</html>
