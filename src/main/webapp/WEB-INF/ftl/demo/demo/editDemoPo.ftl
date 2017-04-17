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
		<script>
	function cancel(){
		window.location.href="${rc.contextPath}/demo/demo/opt-query/demoPoList.do";
	}
	function onSub(){
		var check_error=$("#check_error").val();
		if(check_error == "true"){
			
			if($('#id').val()==""){
				copyFileIdInput();
				$('#demoPoForm').submit();
			}else{
				comp.confirm("修改该信息确认要修改？", function(result) {
	            	if(!result)
	            		return;  
	            	copyFileIdInput();	          		
				  	$('#demoPoForm').submit();
				}); 
			}
		}
	}
	
	$("document").ready(function(){
	
		var data={id:'${(demoPo.id)!""}',code:function(){return $("#code").val();}};
		comp.validate.addRemote("codecheck","${rc.contextPath}/demo/demo/opt-query/codeCheck.do",data,"编码重复");
        
      
           $(".form_validation_reg").compValidate({
				rules:{     
						name: {required:true,minlength:1,maxlength:30,uwsnumcharcn:true},
						code: {required:true,minlength:1,maxlength:32,codecheck:true,uwsnumchar:true}
					},
					messages:{
						name:{required:'名称不能为空'},
						code:{required:'编码不能为空'}
					}
				});
		changeRange();
				
				
	});
	
		function selectUser(){
			_initValues($("#_userIds").val());
			_queryUserSubmit();		
			comp.showModal("_selectUserModal");
		}
		
		function _getUsers(){

			comp.hideModal("_selectUserModal");
			$("#_userIds").val(_getUserIds());		
			$("#_userNames").html(_getUserNames());	
			
		}
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
				if("jpg,png,img,gif,txt,iso,zip,".indexOf(ext+",")<0){
					comp.message("文件上传类型只能是jpg,png,img,gif,txt,iso,zip,请重新选择文件。","error");
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
			$("#demoPoForm").append($("#fileUploadForm input[name='fileId']"));
		}
		function changeRange() {
			$.ajax({
				url : '${rc.contextPath}/demo/demo/opt-add/getDemoPos.do',
				async : false,
				cache : false,
				type : "POST",
				data : {
					lowerId : $("#lowerId").val(),
					upperId : $("#upperId").val()
				},
				dataType : "json",
				success : function(data) {
					var option = $("#rangeId").get(0).options;
					option.length = 0;
					if (data != null && data != undefined && data != "[]") {
						var json = eval(data);
						for ( var i in json) {
							var item = json[i];
							if (item != null && item != undefined) {
								var value = item.name;
								var label = item.code;
								if (label != null && label != undefined && value != null
										&& value != undefined) {
									var isSelected = false;
									var optionMajor = new Option(label, value, isSelected,isSelected);
									option.add(optionMajor);
								}
							}
						}
					}
				}
			});
		}
	 </script>
    </head>
<body>
<div id="contentwrapper">
    <div class="main_content">
    <div class="row-fluid">
    	<div class="row-fluid">
	   		 <div class="span12">
	    	<h3 class="heading">
				<#if demoPo?? && demoPo.id?? >
					修改DemoPo
				<#else>
					新增DemoPo
				</#if>
			</h3>
	    	</div>
    	</div>
		
		<input name="errorText" id="errorText" type="hidden" value="${errorText!""}"/>
		<form  id="demoPoForm" class="form_validation_reg" 
		<#if demoPo?? && demoPo.id?? >
			action="${rc.contextPath}/demo/demo/opt-update/submitDemoPo.do" 
		<#else>
			action="${rc.contextPath}/demo/demo/opt-add/submitDemoPo.do"
		</#if>
		method="post">
		<#if demoPo?? && demoPo.id?? >
		<#else>
			<@token/>
		</#if>
		<input id="id" type="hidden" name="id"  value="${(demoPo.id)!""}">
					
			<div class="formSep">
				<div class="row-fluid">
					<div class="span8">
						<div class="span2">
							<label>名称 <span class="f_req">*</span></label>
						</div>
						<div class="span10">
							<input id="name" name="name"  value="${(demoPo.name!"")?html}"/>
						</div>
					</div>
				</div>
			</div>
			
			<div class="formSep">
				<div class="row-fluid">
					<div class="span8">
						<div class="span2">
							<label>编码 <span class="f_req">*</span></label>
						</div>
						<div class="span10">
							<input id="code" name="code"  value="${(demoPo.code!"")?html}"/>
						</div>
					</div>
				</div>
			</div>
					
			<div class="formSep">
				<div class="row-fluid">
					<div class="span8">
						<div class="span2">
							<label>性别 <span class="f_req">*</span></label>
						</div>
						<div class="span10">
								<select size="1" id="genderId" name="genderId" aria-controls="dt_gal">
								<#if demoPo?? && demoPo.id?? >
									<#list genderDicList as d>
										<#if demoPo.gender.id==d.id >
											<option  value="${d.id}" selected="selected" />${d.name}</option>
										<#else>
											<option value="${d.id}" />${d.name?html}</option>
										</#if>
									</#list>
								<#else>
									<#list genderDicList as d>
										<option  value="${d.id}" />${d.name?html}</option>
									</#list>
								</#if>
							 </select>
						</div>
					</div>
				</div>
			</div>
			
			<div class="formSep">
				<div class="row-fluid">
				<div class="span8">
					<div class="span2">
							<label>人员列表 </label>
					</div>
					<div class="span10">
						<textarea name="userNames" id="_userNames" cols="12" rows="5" class="span6" readonly="true">${(demoPo.userNames!"")?html}</textarea>
						<a style="cursor:pointer" onclick="selectUser()">选择</a>
								
						<input id="_userIds" name="userIds" type="hidden" class="span6" value="${(demoPo.userIds!"")?html}"/>
					</div>
					</div>
				</div>
			</div>
			<div class="formSep">
				<div class="row-fluid">
					<div class="span8">
						<div class="span2">
							<label>开始值</label>
						</div>
						<div class="span10">
								<select size="1" id="lowerId" name="lowerId" aria-controls="dt_gal" onChange="changeRange();">
									<option  value="1" />1</option>
									<option  value="2" />2</option>
									<option  value="3" />3</option>
							 </select>
						</div>
					</div>
				</div>
			</div>
			<div class="formSep">
				<div class="row-fluid">
					<div class="span8">
						<div class="span2">
							<label>结束值</label>
						</div>
						<div class="span10">
								<select size="1" id="upperId" name="upperId" aria-controls="dt_gal" onChange="changeRange();">
									<option  value="7" />7</option>
									<option  value="8" />8</option>
									<option  value="9" />9</option>
							 </select>
						</div>
					</div>
				</div>
			</div>
			<div class="formSep">
				<div class="row-fluid">
					<div class="span8">
						<div class="span2">
							<label>范围</label>
						</div>
						<div class="span10">
								<select size="1" id="rangeId" name="rangeId" aria-controls="dt_gal">
							 </select>
						</div>
					</div>
				</div>
			</div>
			
			</form>
			
			<div class="formSep">
				<div class="row-fluid">					
					<div class="span8">
						<div class="span2">
								<label>文件列表 </label>
						</div>
						<div class="span10" id="_upload_div">
						<form  id="fileUploadForm"  action="" method="post"  enctype="multipart/form-data">
						<!--					    	 
							 <input type="hidden" name="allowedExt" value="jpg,png,img,gif,txt,iso,zip,rar"/>
							 <input type="hidden" name="maxSize" value="2097152000"/> 
							 <input type="hidden" name="isTempFile" value="false"/>
							 	-->						
							 <div data-fileupload="file" class="fileupload fileupload-new">
									<span class="btn btn-file"><span class="fileupload-new">选择文件</span><input id="file" type="file" name="file" onchange="uploadfile(this)"></span>
							 </div>
							 
							 <#if uploadFileRefList??>	
								<#list uploadFileRefList as p>
									<div class="alert alert-info">
										<a class="close" data-dismiss="alert">×</a>
										<a href="${rc.contextPath}/sys/sysConfig/file.do?id=${p.uploadFile.id}"><strong>${p.uploadFile.name}&nbsp;(${p.uploadFile.fileSize})</strong></a>
										<input type="hidden" name="fileId" value="${p.uploadFile.id}"/>	
									</div>					
								</#list>
							 </#if> 
							 
						</form>	
						</div>
					</div>
				</div>
			</div>
							
			<div class="span6">
	        	<p class="btnMargin">
	        		<button class="btn btn-info" type="button" onclick="onSub()">
	         	确定
				</button>
			  	<button class="btn" type="button" onclick="cancel()">取消</button>
			</p>
		</div>
		
		<input name="check_error" id="check_error" type="hidden" value="true"/>
	</div>
	</div>
</div>

<#include "/user/comp/queryUserCheckboxModal.ftl">
</body>
</html>
