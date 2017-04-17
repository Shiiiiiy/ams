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
		     var check_error=$("#checkValue").val();
		     if(check_error == "true"){
		        copyFileIdInput();
		         $('#saveSheetForm').submit();
		     }
		 }
		
		 //判断数据是否为空
		function isEmpty(s){
		 return ((s==undefined || s==null || s=="" || s==0) ? true : false);
		}
		
		//单选教职工
		function selectSchoolTeacherRadio(teacherId)
		{  
		    if(isEmpty(teacherId))
		    {
		       teacherId = $("#currentUserId").val();
		    }
			_queryTeacherRadioAll(teacherId);
		}
		
		function _setTeacherRadioSelectValue(teacher)
		{
			if(teacher)
			{
			    $("#creatorId").val(teacher.id);
			    $("#creatorName").val(teacher.name);
			}
		}
	
		function cancel(){
			window.location.href = "${rc.contextPath}/integrate/sheet/opt-query/sheetList.do";
		}
	
		$("document").ready(function(){
        	$(".form_validation_reg").compValidate({
			rules:{     
					'title': {required:true,maxlength:500},
					'year.id': {required:true},
					'creator.name': {required:true},
					'warningType.id': {required:true},
					uploadDate: {required:true}
				},
				messages:{
					'title': {required:'标题不能为空！',maxlength:'标题最大长度不能超过500字'},
					'year.id': {required:'请选择报表上报学年！'},
					'creator.name': {required:'请选择上报人！'},
					uploadDate: {required:"上传日期不能为空！"}
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
			$("#saveSheetForm").append($("#fileUploadForm input[name='fileId']"));
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
	    	    <#if sheet?? && sheet.id??>
	    	 	             报表信息修改
	    	 	<#else>
	    	 	             报表信息维护
	    	 	</#if>
	    	   </h3>
	    	</div>
    	</div>
		<input name="checkValue" id="checkValue" type="hidden" value="true"/>
		   <#if sheet?? && sheet.id?? >
			<form  id="saveSheetForm" class="form_validation_reg" action="${rc.contextPath}/integrate/sheet/opt-edit/editSheet.do" method="post"><@token/>
		   <#else>
			<form  id="saveSheetForm" class="form_validation_reg" action="${rc.contextPath}/integrate/sheet/opt-submit/saveSheet.do" method="post"><@token/>
		    </#if>
			<input id="currentUserId" type="hidden" name="currentUserId"  value="${(currentUserId)!""}">
			<input id="id" type="hidden" name="id"  value="${(sheet.id)!""}">
			  <div class="formSep">
				<div class="row-fluid">
				  <div class="span6">	
			        <div class="span2">
						<label>标题<span class="f_req">*</span></label>
					 </div>
					<div class="span9">
						<input id="title" name="title" value="${(sheet.title)!''}"/>
					</div>
				  </div>
				   
				<div class="span6">
					<div class="span2">
						<label>上报学年<span class="f_req">*</span></label>
					</div>
					<div class="span9">
					 <select size="1" id="year" name="year.id" aria-controls="dt_gal">
						  <option value="" />请选择..</option>
							<#if yearList ??>
								<#list yearList as d>
									<#if sheet?? && sheet.year ?? && sheet.year.id==d.id >
										<option  value="${d.id}" selected="selected" />${d.name?html}</option>
									<#else>
										<option value="${d.id}" />${d.name?html}</option>
									</#if>
								</#list>
							</#if>
					 	</select>
					</div>
				</div>
			  </div>
		   </div>
					
		  <div class="formSep">
			<div class="row-fluid">
				<div class="span6">
					<div class="span2">
					  <label>上报人<span class="f_req">*</span></label>
					 </div>
					<div class="span9 input-append">
						<#if sheet?? && sheet.creator??>
							<input id="creatorName" name="creator.name" readOnly="true" value="${(sheet.creator.name!"")?html}"/>
							<a style="cursor:pointer;margin-left:-4px;" onclick="selectSchoolTeacherRadio(${(sheet.creator.id)!''})" title="选择" class="btn"><i class="icon-search"></i></a>
					    <#else>
					        <input id="creatorName" name="creator.name"  readOnly="true" />
					        <a style="cursor:pointer;margin-left:-4px;" onclick="selectSchoolTeacherRadio(${(sheet.creator.id)!''})" title="选择" class="btn"><i class="icon-search"></i></a>
					    </#if>   
					        <input name="creator.id" id="creatorId" type="hidden" value="${(sheet.creator.id)!''}"/> 
					</div>
				</div>
				<div class="span6">
				  <div class="span2">
					<label>上报日期<span class="f_req">*</span></label>
				   </div>
				   <div class="span9">
					   <input id="uploadDate" name="uploadDate" style="cursor:pointer" onclick="WdatePicker({skin:'whyGreen'});" <#if sheet?? && sheet.uploadDate??> value='${((sheet.uploadDate)!"")?string('yyyy-MM-dd')}'</#if>/>
				   </div>
				</div>
			  </div>
			</div>
		</form>
		<div class="formSep">
			<div class="row-fluid">					
			  <div class="span12">
			    <div class="span1">
					 <label>材料<span class="f_req"></span></label>
				    </div>
					<div class="span8">
					<form  id="fileUploadForm"  action="" method="post"  enctype="multipart/form-data">
					<!--					    	 
						 <input type="hidden" name="allowedExt" value="jpg,png,img,gif,txt,iso,zip,rar"/>
						 <input type="hidden" name="maxSize" value="2097152000"/> 
						 <input type="hidden" name="isTempFile" value="false"/>
						 	-->						
						 <div data-fileupload="file" class="fileupload fileupload-new">
								<span class="btn btn-file"><span class="fileupload-new">选择文件</span><input id="file" type="file" name="file" onchange="uploadfile(this)"></span>
						 </div>
						 <div class="upload-alert-message">
		        		        文件只支持：jpg,jpeg,png,gif,txt,ppt,rar,zip,doc,docx,xls,xlsx,ppt,pptx,wps,et,dps且大小不超过10MB。
		        		 </div>
						 <#if uploadFileRefList??>	
							<#list uploadFileRefList as p>
								<div class="fileupload-info">
									<a class="close" data-dismiss="alert">×</a>
									<a href="${rc.contextPath}/sys/sysConfig/file.do?id=${p.uploadFile.id}"><strong>${p.uploadFile.name}&nbsp;(${p.uploadFile.fileSize})</strong></a>
									<input type="hidden" id="fileId" name="fileId" value="${p.uploadFile.id}"/>	
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
    		<div class="span6">	
				<div class="span2"></div>
				<div class="span9">
	        		<button class="btn btn-info" type="button" onclick="onSub()">保 存</button>
			  		<button class="btn" type="button" onclick="cancel();">取 消</button>
		  		</div>
	  		</div>
		</div>
	</div>
  </div>
</div>

<#--教师单选-->
<#include "/comp/teacher/queryTeacherAllRadioModal.ftl">
</body>
</html>
