<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<!-- jQuery UI theme-->
		<link rel="stylesheet" href="${rc.contextPath}/lib/jquery-ui/css/Aristo/Aristo.css" />
		<script src="${rc.contextPath}/lib/jquery-ui/jquery-ui-1.8.20.custom.min.js"></script>
		<!-- ajax form-->
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
		<!-- My97DatePicker -->
		<link rel="stylesheet" href="${rc.contextPath}/lib/My97DatePicker/skin/WdatePicker.css" />
		<script type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
		<!-- bootstrap-fileupload -->	
		<link rel="stylesheet" href="${rc.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.min.css" />
		<!-- animated progressbars -->
        <script src="${rc.contextPath}/js/bdp_fileupload.progressbar.js"></script>
		<!-- 富文本编辑器 -->
		<script src="${rc.contextPath}/lib/tinymce/tinymce.min.js"></script>
	</head>
	<body>
	<style type="text/css">
	  .fc_error { display: block;font-size: 11px;font-weight: 700;color: #C62626;}
	</style>
	
	<div id="contentwrapper">
	    <div class="main_content">
	    <div class="row-fluid">
	    	<div class="row-fluid">
		   		 <div class="span12">
		    	<h3 class="heading">
					<#if messageInfo?? && messageInfo.id?? >
						修改信息
					<#else>
						新增信息
					</#if>
				</h3>
		    	</div>
	    	</div>
			
			<form  id="messageInfoForm" class="form_validation_reg" ><@token/>
			<input id="id" type="hidden" name="id"  value="${(messageInfo.id)!""}"/>
			
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<label> 标 题<span class="f_req">*</span></label>
							</div>
							<div class="span9">
								<input id="title" name="title"  value="${(messageInfo.title!"")?html}" style="width:500px;"/>
							</div>
						</div>
					</div>
				</div>
				
				
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<label>类 型<span class="f_req">*</span></label>
							</div>
							<div class="span9">
								<select size="1" id="messageType" name="messageType.id" aria-controls="dt_gal" class="span7" >
									<option value=""  >请选择</option>
									<#if listMessageType??>
									<#list listMessageType as mt>
										<#if messageInfo ?? && messageInfo.messageType ?? && messageInfo.messageType.id == mt.id>
											<option value="${mt.id}" data-code="${mt.code?html}" selected="selected">${mt.name?html}</option>	
										<#else>
											<option value="${mt.id}" data-code="${mt.code?html}" >${mt.name?html}</option>	
										</#if>
									</#list>
									</#if>
								</select>
							</div>
						</div>
						
						<div class="span6">
							<div class="span3">
								<label>发送到<span class="f_req">*</span></label>
							</div>
							<div class="span9">
								<label class="checkbox inline">
									<input type="checkbox" id="item_1" name="sendType" value="WECHAT" 
									<#if (messageInfo.sendType??)&&
											 (messageInfo.sendType)?contains('WECHAT')>checked</#if>/>&nbsp;微信平台&#12288; 
									</label>
									
								<label class="checkbox inline">
									<input type="checkbox" id="item_2" name="sendType"  value="EMAIL" 
									<#if (messageInfo.sendType??)&&
										 (messageInfo.sendType)?contains('EMAIL')>checked</#if>/>&nbsp;邮箱&#12288; 
								</label>
							</div>
						</div>
					</div>
				</div>
				
				<div class="formSep">
					<div class="row-fluid">
					    <div class="span6">
							<div class="span3">
								<label>内 容</label>	
							</div>
							<div class="span9">
							 	<textarea name="messageContent" id="messageContent" class="span12">${(messageInfo.messageContent!"")?html}</textarea>
							</div>
						</div>
				 	</div>
				</div>   
			</form>
			
			<div class="formSep">
			<div class="row-fluid">
			<div class="span12">
				<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
					<div class="row-fluid">
					<div class="span9">
						<div class="span2">
							<label>附 件</label>
						</div>
						<div class="span10" id="_upload_div">
							<form  id="fileUploadForm"  action="" method="post"  enctype="multipart/form-data">
								 <div data-fileupload="file" class="fileupload fileupload-new">
									<span class="btn btn-file">
										<span class="fileupload-new ">选择文件</span>
										<input id="file" type="file" name="file" onchange="uploadfile(this)"/>
									</span>
								 </div>
								 <div class="upload-alert-message">
			        				文件只支持jpg,jpeg,png,gif,txt,ppt,rar,zip,doc,docx,xls,xlsx,ppt,pptx,wps,et,dps，且大小不能超过10M。
			        			</div>
								 <#if listFile??>	
								 <#list listFile as lf>
									<div class="fileupload-info">
										<a class="close" data-dismiss="alert">×</a>
										<a href="${rc.contextPath}/sys/sysConfig/file.do?id=${lf.uploadFile.id}"><strong>${lf.uploadFile.name}&nbsp;(${lf.uploadFile.fileSize})</strong></a>
										<input type="hidden" name="fileId" value="${lf.uploadFile.id}"/>	
									</div>	
								 </#list>			
								 </#if> 
							</form>	
						</div>
					</div>
					</div>
				</div>
			</div>
			</div>
			</div>				
			<br/>
			<div class="row-fluid">
				<div class="span9">
					<div class="span2">&nbsp;</div>
						<div class="span10">
		        			<button class="btn btn-info" type="submit" id="sub-button" >保 存</button>
		        			<button class="btn btn-info" type="button" id="post-button" >发 布</button>
				  			<button class="btn" type="button" onClick="javascript:window.history.back(-1);">返 回</button>
			  			</div>
					</div>
				</div>
			</div>
		<input name="check_error" id="check_error" type="hidden" value="true"/>
	</div>
	</div>
</div>
	
	<#-- 发布按钮弹窗 -->
	<div class="modal hide fade" id="_showPostModel">
		<div class="modal-header">
			<button class="close" data-dismiss="modal">×</button>
			<h3 id="title1">置顶标红</h3>
		</div>
		<div class="modal-body " style="overflow:hidden" >
			<div class="span12 row-fluid">
				<div class="span4">
					<span class="formTitle">置顶</span>
					<input type="checkbox" class="span7" name="isUp" />
				</div>
				
				<div class="span4">
					<span class="formTitle">标红</span>
					<input type="checkbox" class="span7" id="" name="isRed" />
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal">关闭</a>
			<a href="#" class="btn btn-info" onclick="_postMessage()">确定</a>
		</div>
	</div>
	<#-- 发布按钮弹窗 -->
	<script>
	
		//富文本插件初始化
		tinymce.init({
		    selector: "textarea#messageContent",
		    language:'zh_CN',
		    menubar: false,
		    statusbar : false,
		    toolbar_items_size: 'small',
		    theme: "modern",
		    width:800,
		    height:210,
		    plugins: [
		         "advlist autolink link image lists charmap print preview hr anchor pagebreak",
		         "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
		         "save table contextmenu directionality emoticons template paste textcolor"
		   ],
		   toolbar: "insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | print preview media fullpage | forecolor backcolor fontselect fontsizeselect emoticons",
		   fontsize_formats: "8pt 10pt 12pt 14pt 18pt 24pt 36pt"
		});  
		
		//附件上传方法
		var tag=0;
		function uploadfile(obj){	
			if($("#fileUploadForm .sepH_b").length>0||tag){//创建进度条以及包括页面中存在进度条时候不能再上传，平台只提供一个用户同时只能上传一个文件
				comp.message("同时只能上传一个文件，待上传完成后，再重试。","error");
				return;
			}
			//if($("#fileUploadForm .alert-info strong:contains('"+$(obj).val()+"')").length>0){
			//	comp.message("提交了重复名称的文件请确认检查，如果确认内容重复可以手动删除。","info");
			//}
			
			//验证文件扩展名,该逻辑根据具体业务可自行调整
			var fileName=$(obj).val();
			fileName=fileName.substring(fileName.lastIndexOf("\\")+1,fileName.length);
			
			if(fileName.indexOf(".")>-1){
				var ext=fileName.substring(fileName.lastIndexOf(".")+1,fileName.length);
				if("jpg,jpeg,png,gif,txt,ppt,rar,zip,doc,docx,xls,xlsx,ppt,pptx,wps,et,dps".indexOf(ext+",")<0){
					comp.message("文件上传类型只能是jpg,jpeg,png,gif,txt,ppt,rar,zip,doc,docx,xls,xlsx,ppt,pptx,wps,et,dps请重新选择文件。","error");
					return;
				}
			}
			
			tag=1;
			var div=fileupload.create_fileupload_div($("#fileUploadForm"),$(obj).val());
			tag=0;	
			var param="?maxSize=24204800&isTempFile=false";//设置业务文件大小限制上线不能超过200M
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
		//保存方法
		$("#sub-button").click(function() {
			/**
			if($("#messageType option:selected").attr("data-code")=="MESSAGE_ORIENTATION") {
				if($("#messageColumn").val()==0) {
					$("#messageColumn").closest('div').removeClass("f_error").find("label.error").remove().end().find('br').remove();
					$("#messageColumn").closest('div').addClass("f_error").append("<label class='error' >栏目不能为空</label>")
				}
			}
			*/
			
			$("#messageInfoForm").append($("#fileUploadForm input[name='fileId']"));
			$("#messageInfoForm").attr("action", "${rc.contextPath}/message/message/opt-save/saveMessageInfo.do"); 
			$("#messageInfoForm").attr("method", "post");
			$("#messageInfoForm").submit();
		});		
		
		//发布按钮
		$("#post-button").click(function() {
			comp.showModal("_showPostModel");
		});
		//点击弹窗确定按钮
		function _postMessage() {
			$("#messageInfoForm").append($("#fileUploadForm input[name='fileId']"));
			
			isUp=$("input[name='isUp']").attr("checked")?1:0;
			isRed=$("input[name='isRed']").attr("checked")?1:0;
			
			$("#messageInfoForm").attr("action", "${rc.contextPath}/message/message/opt-post/postMessage.do?isUp="+isUp+"&isRed="+isRed); 
			$("#messageInfoForm").attr("method", "post");
			$("#messageInfoForm").submit();
		}
		//栏目随类型变化
		$("#messageType").change(function() {
			//迎新要有栏目，其他类型没有栏目
			if($("#messageType option:selected").attr("data-code")=="MESSAGE_ORIENTATION") {
				$("#columnControl").removeClass("hidden");
			}else {
				$("#messageColumn").val("");
				$("#columnControl").removeClass().addClass("span6 hidden");
			}
		});
		//页面校验
		$("#messageInfoForm").compValidate({
			rules:{
				title:{required:true, maxlength:30},
				"messageType.id":{required:true},
				sendType:{required:true},
				"messageColumn.id":{required:function(){
					var flag = false;
					if($("#messageType option:selected").attr("data-code")=="MESSAGE_ORIENTATION") {
						flag = ($("#messageColumn").val()==0);
					}
					return flag;
				}}
			},
			messages:{
				title:{required:'标题不能为空', maxlength:'标题长度不能超过30个字'},
				"messageType.id":{required: '类型不能为空'},
				    sendType:{required: '发送不能为空'},
				"messageColumn.id":{required:'栏目不能为空'}
			}
		});
	</script>
	
	</body>
</html>
