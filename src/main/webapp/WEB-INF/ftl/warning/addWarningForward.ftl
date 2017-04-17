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
		<script>
		function onSub(){
			var checkValue = $("#checkValue").val();
			if(checkValue == "false")
			{
				comp.message("当前预警设置条件已存在,请通过编辑功能修改预警信息");
				return ;
			}
			if($('#id').val()==""){
			
				copyFileIdInput();
				$('#saveWarningForm').submit();
			}else{
				comp.confirm("确认要修改预警信息吗？", function(result) {
	            	if(!result)
	            		return;  
	            	copyFileIdInput();	
				  	$('#saveWarningForm').submit();
				}); 
			}
		}
	
		function cancel()
		{
			window.location.href = "${rc.contextPath}/warning/manage/opt-query/warningForwardList.do";
		}
	
	  $("document").ready(function(){
          $(".form_validation_reg").compValidate({
			rules:{     
					'college.id': {required:true},
					'yearDic.id': {required:true},
					'termDic.id': {required:true},
					'warningType.id': {required:true},
					warningDate: {required:true}
				},
				messages:{
					'college.id': {required:'请选择预警上报学院'},
					'yearDic.id': {required:'请选择预警上报学年'},
					'termDic.id': {required:'请选择预警上报学期'},
					'warningType.id': {required:'请选择预警上报类型'},
					warningDate: {required:"请选择预警上报日期"}
				}
			});
		});
	
		var tag=0;
		function uploadfile(obj){	
			if($("#fileUploadForm .sepH_b").length>0||tag){//创建进度条以及包括页面中存在进度条时候不能再上传，平台只提供一个用户同时只能上传一个文件
				comp.message("同时只能上传一个文件，待上传完成后，再重试。","error");
				return;
			}
			if($("#fileUploadForm .fileupload-info strong:contains('"+$(obj).val().toLowerCase()+"')").length>0){
				comp.message("提交了重复名称的文件请确认检查，如果确认内容重复可以手动删除。","info");
				//return ;
			}
			//验证文件扩展名,该逻辑根据具体业务可自行调整
			var fileName=$(obj).val();
			fileName=fileName.substring(fileName.lastIndexOf("\\")+1,fileName.length);
			
			if(fileName.indexOf(".")>-1){
				var ext=fileName.substring(fileName.lastIndexOf(".")+1,fileName.length).toLowerCase();
				if("jpg,jpeg,png,gif,txt,ppt,rar,zip,doc,docx,xls,xlsx,ppt,pptx,wps,et,dps,".indexOf(ext+",")<0){
					comp.message("文件上传类型只能是jpg,jpeg,png,gif,txt,ppt,rar,zip,doc,docx,xls,xlsx,ppt,pptx,wps,et,dps请重新选择文件。","error");
					return;
				}
			}
			tag=1;
			var div=fileupload.create_fileupload_div($("#fileUploadForm"),$(obj).val());
			tag=0;	
						
			var param="?maxSize=21474836480&isTempFile=false";//设置业务文件大小限制上线不能超过2G
			
			$("#fileUploadForm").attr("action","${rc.contextPath}/sys/sysConfig/singleFileUpload.do"+param);		
			$("#fileUploadForm").ajaxSubmit(function(data){
				
				try{//ie8才能执行如下代码
					data=$(data).unwrap().text();
					}catch(e){//ff chrome浏览器
					}
					
				try{
					var obj=eval(data)[0];				
					if(obj.fileId==''){
						comp.message(obj.errorInfo,"error");
						$(div).remove();
					}else{
						comp.message("上传文件完成。","info");
						$(div).append($("<input>",{						
							type:'hidden',
							val:obj.fileId,
							name:'fileId',
						}));
						$(div).find("div").remove();
						$(div).find("strong").append(("&nbsp;("+obj.fileSize+")"));
						$(div).find("strong").wrapAll("<a href=\"${rc.contextPath}/sys/sysConfig/file.do?id="+obj.fileId+"\"/>");
					}
				}catch(e){
					comp.message("文件提交服务器失败，请稍后刷新页面重试，如果还未成功请联系管理。","error");
				}				
				//下面代码解决重名文件可以连续上传问题，该功能需要根据实际业务进行调整	
				var file=$("#file");
				file.after(file.clone().val(''));
				file.remove();
			});
		}
		
		function copyFileIdInput(){
			$("#saveWarningForm").append($("#fileUploadForm input[name='fileId']"));
		}
		
		function queryByConditions()
		{
			var college = $("#collegeId").val();
			var year = $("#yearId").val();
			var term = $("#termId").val();
			var warningType = $("#warningType").val();
			if(college != "" && year != "" && term != "" && warningType != "" )
			{
			  	var param = {college:college,term:term,warningType:warningType,year:year};
				$.post("${rc.contextPath}/warning/manage/opt-check/checkWarningForward.do",param,function(data) {
				  if(data!='') {
					  	comp.message("当前预警设置条件已存在,请通过编辑功能修改预警信息","info")
						$("#checkValue").val("false");
					}else
					{
						$("#checkValue").val("true");
					}
				},"text");				    
			 }
		}
		
	 </script>
    </head>
<body>
<div id="contentwrapper">
    <div class="main_content">
    <div class="row-fluid">
    	<div class="row-fluid">
	   		 <div class="span12">
	    	 	<h3 class="heading">预警信息维护</h3>
	    	 </div>
    	</div>
		<input name="checkValue" id="checkValue" type="hidden" value="true"/>
		<form  id="saveWarningForm" class="form_validation_reg"  action="${rc.contextPath}/warning/manage/opt-submit/saveWarningForward.do" method="post">
			<input id="id" type="hidden" name="id"  value="${(warningForward.id)!""}">
				<div class="formSep">
				<div class="row-fluid">
					<div class="span4">
							<div class="span3"><label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学院<span class="f_req">*</span></label></div>
							 <select size="1" id="collegeId" name="college.id" aria-controls="dt_gal" class="span7" <#if isCollege?? && isCollege == true>disabled</#if> onchange="queryByConditions();" >
								<#if collegeList ??>
									<option value="">请选择..</option>
									<#list collegeList as c>
										<#if  warningForward ?? && warningForward.college ?? &&  warningForward.college.id ?? &&  warningForward.college.id == c.id >
											<option  value="${c.id}" selected="selected">${c.name?html}</option>
										<#else>
											<option value="${c.id}" >${c.name?html}</option>
										</#if>
									</#list>
								</#if>
							   </select>
						 </div>
						 <div class="span4">
							 <div class="span3"><label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学年<span class="f_req">*</span></label></div>
							 <select size="1" id="yearId" name="yearDic.id" aria-controls="dt_gal" class="span7"  onchange="queryByConditions();" >
								<option value="">请选择..</option>
								<#if yearList ??>
									<#list yearList as c>
										<#if  warningForward ?? && warningForward.yearDic ?? &&  warningForward.yearDic.id == c.id >
											<option  value="${c.id}" selected="selected">${c.name?html}</option>
										<#else>
											<option value="${c.id}" >${c.name?html}</option>
										</#if>
									</#list>
								</#if>
							   </select>
						  </div>
						<div class="span3">
							<div class="span3"><label>学期<span class="f_req">*</span></label></div>
							<select size="1" id="termId" name="termDic.id" aria-controls="dt_gal" class="span8"  onchange="queryByConditions();" >
								<option value="">请选择..</option>
								<#if termList ??>
									<#list termList as c>
										<#if  warningForward ?? && warningForward.termDic ?? &&  warningForward.termDic.id == c.id >
											<option  value="${c.id}" selected="selected">${c.name?html}</option>
										<#else>
											<option value="${c.id}" >${c.name?html}</option>
										</#if>
									</#list>
								</#if>
							   </select>
						</div>
					</div>
					</div>
					<div class="formSep">
					<div class="row-fluid">
					<div class="span4">
							<div class="span3"><label>预警类型<span class="f_req">*</span></label></div>
							<select size="1" id="warningType" name="warningType.id" aria-controls="dt_gal" class="span7"  onchange="queryByConditions();" >
								<option value="">请选择..</option>
								<#if warningTypeList ??>
									<#list warningTypeList as c>
										<#if  warningForward ?? && warningForward.warningType ?? &&  warningForward.warningType.id == c.id >
											<option  value="${c.id}" selected="selected">${c.name?html}</option>
										<#else>
											<option value="${c.id}" >${c.name?html}</option>
										</#if>
									</#list>
								</#if>
							   </select>
						 </div>
						 <div class="span4">
							<div class="span3"><label>上报日期<span class="f_req">*</span></label></div>
							<input id="warningDate" name="warningDate" class="Wdate span7" style="cursor:pointer" onclick="WdatePicker({skin:'whyGreen'});"  value='${(warningForward.warningDate!"")?string('yyyy-MM-dd')}' />
						  </div>
					</div>
					</div>
				</form>
				<#--- 
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
						<div class="span10">
							<div class="span10" id="_upload_div">
							<form  id="fileUploadForm"  action="" method="post"  enctype="multipart/form-data">
								 <div data-fileupload="file" class="fileupload fileupload-new">
										<span class="btn btn-file"><span class="fileupload-new">选择文件</span><input id="file" type="file" name="file" onchange="uploadfile(this)"></span>
								 </div>
								 <div class="upload-alert-message" style="word-break:break-all;">
				        		        文件只支持：jpg,jpeg,png,gif,txt,ppt,rar,zip,doc,docx,xls,xlsx,ppt,pptx,wps,et,dps格式。
				        		 </div>
								 <#if uploadFileRefList??>	
									<#list uploadFileRefList as p>
										<div class="fileupload-info">
											<a class="close" data-dismiss="alert">×</a>
											<a href="${rc.contextPath}/sys/sysConfig/file.do?id=${p.uploadFile.id}"><strong>${p.uploadFile.name}&nbsp;&nbsp;&nbsp;&nbsp;[于 ${p.createTime!""} 上传，文件大小为  ${p.uploadFile.fileSize}]</strong></a>
											<input type="hidden" name="fileId" value="${p.uploadFile.id}"/>	
										</div>					
									</#list>
								 </#if> 
							</form>	
							</div>
						</div>
					</div>
				</div>
			</div>
			<br/>			
		 	<div class="row-fluid">
        		<div class="span10">	
					<div class="span1">&nbsp;</div>
					<div class="span10">
		        		<button class="btn btn-info" type="button" onclick="onSub()">保 存</button>
				  		<button class="btn" type="button" onclick="cancel();">取 消</button>
			  		</div>
		  		</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>
