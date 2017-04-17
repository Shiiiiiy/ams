<html>
 <head>
 <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
   <link rel="stylesheet" href="${rc.contextPath}/lib/jquery-ui/css/Aristo/Aristo.css" />
    <link rel="stylesheet" href="${rc.contextPath}/lib/My97DatePicker/skin/WdatePicker.css" />
	<script type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
    <script src="${rc.contextPath}/lib/jquery-ui/jquery-ui-1.8.20.custom.min.js"></script>
	<!-- bootstrap-fileupload -->	
	<link rel="stylesheet" href="${rc.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.min.css" />
	<!-- multiselect -->
    <link rel="stylesheet" href="${rc.contextPath}/lib/multiselect/css/multi-select.css" />
	<script src="${rc.contextPath}/lib/multiselect/js/jquery.multi-select.min.js"></script>
    <!-- animated progressbars -->
    <script src="${rc.contextPath}/js/bdp_fileupload.progressbar.js"></script>
    <script src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script>
    <!-- diy js file -->
    <script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
    <script src="${rc.contextPath}/js/apw/apw_check.js"></script>
    <script src="${rc.contextPath}/js/jquery.form.js"></script>
    <script src="${rc.contextPath}/js/common/common_approve.js"></script>
    <script>
	var formValidator;
	$("document").ready(function(){
	    formValidator = $("#cancelApplyEditForm").compValidate({
			rules:{
							'applyReason': {required:true,maxlength:200},
							'financialComments': {required:true,maxlength:200}
			},
			messages:{
							'applyReason': {required:'变更理由不能为空',maxlength:'变更理由不可超过200字'},
							'financialComments': {required:'财务清算不能为空',maxlength:'财务清算不可超过200字'}
			}
		 });
 	});
	 
	//上传附件
	var tag=0;
	function uploadfile(obj,formId,fileId){	
		if($("#"+formId+" .sepH_b").length>0||tag){//创建进度条以及包括页面中存在进度条时候不能再上传，平台只提供一个用户同时只能上传一个文件
			comp.message("同时只能上传一个文件，待上传完成后，再重试。","error");
			return;
		}
		
		if($("#"+formId+" .alert-info strong:contains('"+$(obj).val()+"')").length>0){
			comp.message("提交了重复名称的文件请确认检查，如果确认内容重复可以手动删除。","info");
		}
		
		//验证文件扩展名,该逻辑根据具体业务可自行调整
		var fileName=$(obj).val();
		fileName=fileName.substring(fileName.lastIndexOf("\\")+1,fileName.length);
		
		if(fileName.indexOf(".")>-1){
			var ext=fileName.substring(fileName.lastIndexOf(".")+1,fileName.length).toLowerCase();
			if("jpg,jpeg,png,gif,txt,ppt,rar,zip,doc,docx,xls,xlsx,ppt,pptx,wps,et,dps,".indexOf(ext+",")<0){
				comp.message("文件上传类型只能是jpg,jpeg,png,gif,txt,ppt,rar,zip,doc,docx,xls,xlsx,ppt,pptx,wps,et,dps,请重新选择文件。","error");
				return;
			}
		}
		
		//附件上传执行操作
			tag=1;
			var div=fileupload.create_fileupload_div($("#"+formId),$(obj).val());
			tag=0;	
			var param="?maxSize=10485760&isTempFile=false";//设置业务文件大小限制上线不能超过10M
			$("#"+formId).attr("action","${rc.contextPath}/sys/sysConfig/singleFileUpload.do"+param);		
			$("#"+formId).ajaxSubmit(function(data){
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
							name:fileId,
						}));
						$(div).find("div").remove();
						$(div).find("strong").append(("&nbsp;("+obj.fileSize+")"));
						$(div).find("strong").wrapAll("<a href=\"${rc.contextPath}/sys/sysConfig/file.do?id="+obj.fileId+"\"/>");
					}
				}catch(e){
					comp.message("文件提交服务器失败，请稍后刷新页面重试，如果还未成功请联系管理。","error");
				}
						
				//下面代码解决重名文件可以连续上传问题，该功能需要根据实际业务进行调整	
				var file=$("#"+fileId);
				file.after(file.clone().val(''));
				file.remove();
			});
	}
	
	function copyFileIdInput(){
			$("#cancelApplyEditForm").append($("#financeFileUploadForm input[name='financeFileId']"));
	}
	 
	</script>
</head>
<body>
<div id="contentwrapper">
    <div class="main_content">
        <div class="row-fluid">
        	<div class="row-fluid">
		   		<div class="span12">
		      		<h3 class="heading">社团注销维护</h3>
			  	</div>
			 </div> 
		 	<#include "/association/apply/applyNoramlView.ftl"/>	
			<form  id="cancelApplyEditForm" class="form_validation_reg" method="post">
			<input name="status" id="status" type="hidden" value="10" />
			<input name="id" id="applyId" type="hidden" value="${applyModel.id!""}" />
			<input name="associationPo.id" id="associationId" type="hidden" value="${applyModel.associationPo.id!""}" />
			 <div class="formSep">
					<div class="row-fluid">
						<div class="span12">
						<div class="span1"><label>注销原因<span class="f_req">*</span></label></div>
						<div class="span8">
							<textarea cols="80" rows="6" name="applyReason" class="span12">${(applyModel.applyReason!"")?html}</textarea>
	                    	<br><font size="1" color="grey"  style="vertical-align:bottom; padding-bottom:10px">(不超过200字)</font>
	                    </div>
	            	 </div>
				</div>
			</div>
            <div class="formSep">
					<div class="row-fluid">
						<div class="span12">
						<div class="span1"><label>财务清算<span class="f_req">*</span></label></div>
						<div class="span8">
							<textarea cols="80" rows="6" name="financialComments" class="span12">${(applyModel.financialComments!"")?html}</textarea>
	                    	<br><font size="1" color="grey"  style="vertical-align:bottom; padding-bottom:10px">(不超过200字)</font>
	                    </div>
	            	 </div> </div>
				</div>
			</form>

				<div class="formSep">
						<div class="row-fluid">
							 <div class="span12">
								<div class="span1"><label>附件<span class="f_req">*</span></label> </div>
								<div class="span8" id="_finance_upload_div">
									<form  id="financeFileUploadForm"  method="post"  enctype="multipart/form-data">
										<#if user_key.optMap??><#if user_key.optMap['save']??>
										 <div data-fileupload="file" class="fileupload fileupload-new">
												<span class="btn btn-file">
													<span class="fileupload-new">选择文件</span>
														<input id="file" type="file" name="file" onchange="uploadfile(this,'financeFileUploadForm','financeFileId')">
												</span>
										 </div>
										 <div class="upload-alert-message" style="word-break:break-all">
						        		        文件只支持：jpg,jpeg,png,gif,txt,ppt,rar,zip,doc,docx,xls,xlsx,ppt,pptx,wps,et,dps且大小不超过10MB。
						        		 </div>
										</#if></#if>
										 <#if fileList??>	
											<#list fileList as p>
												<div class="fileupload-info">
													<#if user_key.optMap??><#if user_key.optMap['save']??>
													<a class="close" data-dismiss="alert">×</a>
													</#if></#if>
													<a href="${rc.contextPath}/sys/sysConfig/file.do?id=${(p.uploadFile.id)?html}"><strong>${(p.uploadFile.name)?html}&nbsp;(${(p.uploadFile.fileSize)?html})</strong></a>
													<input type="hidden" id="financeFileId" name="financeFileId" value="${(p.uploadFile.id)?html}"/>	
												</div>					
											</#list>
										 </#if> 
									 </form>	
								</div>
					   		</div>
		            	</div>
		            </div>	
		        	<br/>
		        	<div class="row-fluid">
						<div class="span12">
						<div class="span1"></div>
			        	<div class="span9">
		        			<input class="btn btn-info"  type="button" onclick="saveInfo('10')" value="保 存"/>
				            <input class="btn btn-info"  type="button" onclick="saveInfo('20')" value="提 交"/>
				            <input class="btn" type="button" onclick="onCancel()" value="取 消"/>
			        	</div>	
		        	</div>	
	 	</div>
	 </div> 
</div>

<#--查看 -->
<div class="modal hide fade" id="view_id">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3 id="view_title"></h3>
	</div>
	<div class="modal-body" id="view_body">
		
	</div>
	<div class="modal-footer">
		<a href="#" class="btn" data-dismiss="modal">关闭</a>
	</div>
</div>



<script>

	  // 指导老师简介查看
	  function viewAdvisorDetail(id){
	  		$("#view_title").html("指导老师简介");
	  		comp.showModal("view_id","680px","-250px 0 0 -300px");
			$("#view_body").load("${rc.contextPath}/association/apply/nsm/viewAdvisor.do?id="+id);
	  }
	  
	  // 社员信息查看
	 function viewMember(id){
	 		$("#view_title").html("社团成员列表");
	 		comp.showModal("view_id","800px","-250px 0 0 -350px");
			$("#view_body").load("${rc.contextPath}/association/apply/nsm/viewMember.do?id="+id);
	 }
	  
	  //返回到查询信息页面
	  function onCancel(){
	    	window.location.href="${rc.contextPath}/association/apply/opt-query/getAssociationApplyList.do";
	  }	
	 //保存、提交的方法
	 function saveInfo(status)
	 {
		
		 if(formValidator.form()==true)
		 {
			if(!financeFileValidator()){
		 		comp.message("社团注销材料不可为空，请上传附件 !","error");
		 		return false;
	 		}
	 		if(status == '20')
	 		{
				comp.confirm("注销申请后可能影响系统数据的正常使用,确认要提交？", function(result) {
	            	if(!result)
	            		return; 
            		$("#status").val(status);
        			 mask.showShade();
					copyFileIdInput();
			        $('#cancelApplyEditForm').attr("action","${rc.contextPath}/association/apply/opt-edit/SaveCancelApply.do").submit();

    			}); 
	 		}else{
	 			$("#status").val(status);
        		mask.showShade();
				copyFileIdInput();
		        $('#cancelApplyEditForm').attr("action","${rc.contextPath}/association/apply/opt-edit/SaveCancelApply.do").submit();

	 		}
		 }
	 }
	 
	 //附件验证的方法
	 function financeFileValidator(){
		var financeIds = $("#financeFileUploadForm input[name='financeFileId']");
		if(financeIds.length>0){
			return true;
		}else{
			return false;
		}
	 }
</script>			
</body>
</html>