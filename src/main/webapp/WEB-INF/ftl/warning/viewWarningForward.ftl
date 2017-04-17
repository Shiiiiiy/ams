<html>
 <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
         <!-- jQuery UI theme-->
        <link rel="stylesheet" href="${rc.contextPath}/lib/jquery-ui/css/Aristo/Aristo.css" />
        <script src="${rc.contextPath}/lib/jquery-ui/jquery-ui-1.8.20.custom.min.js"></script>
        <!-- animated progressbars -->
        <script src="${rc.contextPath}/js/bdp_fileupload.progressbar.js"></script>
        <!-- ajax form-->
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
		<!-- bootstrap-fileupload -->	
		<link rel="stylesheet" href="${rc.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.min.css" />
		<!-- My97DatePicker -->
    	<link rel="stylesheet" href="${rc.contextPath}/lib/My97DatePicker/skin/WdatePicker.css" />
		<script type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
    </head>
<body>
<div id="contentwrapper">
    <div class="main_content">
    <div class="row-fluid">
    	<div class="row-fluid">
	   		 <div class="span12">
	    	 	<h3 class="heading">预警信息查看</h3>
	    	 </div>
    	 </div>
			<div class="formSep">
				<div class="row-fluid">
					<div class="span4">
						 <div class="span3"><label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学院</label></div>
						 <select size="1" id="collegeId" name="college.id" aria-controls="dt_gal" class="span7" disabled>
							<option value=""><#if warningForward.college ?? &&  warningForward.college.id ??>${warningForward.college.name!""}</#if></option>
						  </select>
					 </div>
					 <div class="span4">
						 <div class="span3"><label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学年</label></div>
						 <select size="1" id="yearId" name="yearDic.id" aria-controls="dt_gal" class="span7" disabled>
							<option value=""><#if warningForward.yearDic ?? >${ warningForward.yearDic.name!""}</#if></option>
						   </select>
					  </div>
					<div class="span3">
						<div class="span3"><label>学期</label></div>
						<select size="1" id="termId" name="termDic.id" aria-controls="dt_gal" class="span8" disabled>
							<option value=""><#if warningForward.termDic ?? >${ warningForward.termDic.name!""}</#if></option>
					    </select>
					</div>
				</div>
				</div>
				<div class="formSep">
				<div class="row-fluid">
					<div class="span4">
						<div class="span3"><label>预警类型</label></div>
						<select size="1" id="warningType" name="warningType.id" aria-controls="dt_gal" class="span7" disabled>
							<option value=""><#if warningForward.warningType ??>${warningForward.warningType.name!""}</#if></option>
					    </select>
					 </div>
					 <div class="span4">
						<div class="span3"><label>上报日期</label></div>
						<input id="warningDate" name="warningDate" class="span7" disabled value='${(warningForward.warningDate!"")?string('yyyy-MM-dd')}' />
					  </div>
				</div>
			</div>
			<#-- 
			<br/>
			 <div class="row-fluid">
		   		 <div class="span12">
		    	 	<h3 class="heading">预警附件列表</h3>
		    	 </div>
	    	 </div>	-->
			<div class="formSep">
				<div class="row-fluid">	
					<div class="span10">
						<div class="span1"><label>附件列表</label></div>
						<div class="span10" id="_upload_div">
							 <#if uploadFileRefList??>	
								<#list uploadFileRefList as p>
									<div class="fileupload-info">
										<a href="${rc.contextPath}/sys/sysConfig/file.do?id=${p.uploadFile.id}"><strong>${p.uploadFile.name}&nbsp;&nbsp;&nbsp;&nbsp;[于 ${p.createTime!""} 上传，文件大小为  ${p.uploadFile.fileSize}]</strong></a>
										<input type="hidden" name="fileId" value="${p.uploadFile.id}"/>	
									</div>					
								</#list>
							 </#if> 
						</div>
					</div>
				</div>
			</div>
			<br/>	
			<div class="row-fluid">	
				<div class="span10">
					<div class="span1">&nbsp;</div>
					<div class="span10">
		        		<button class="btn btn-info" type="button" onclick="javascript:window.close();">关 闭</button>
			  		</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
