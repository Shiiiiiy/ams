﻿<html>
 <head>
 <meta charset="utf-8" />
    	<meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
   		<link rel="stylesheet" href="${rc.contextPath}/lib/My97DatePicker/skin/WdatePicker.css" />
		<script type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
     	<link rel="stylesheet" href="${rc.contextPath}/lib/jquery-ui/css/Aristo/Aristo.css" />
        <script src="${rc.contextPath}/lib/jquery-ui/jquery-ui-1.8.20.custom.min.js"></script>
        <!-- animated progressbars -->
        <script src="${rc.contextPath}/js/bdp_fileupload.progressbar.js"></script>
        <script src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script>
        <!-- ajax form-->
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
		<script src="${rc.contextPath}/js/apw/apw_check.js"></script>
		<!-- bootstrap-fileupload -->	
		<link rel="stylesheet" href="${rc.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.min.css" />
		<!-- multiselect -->
	    <link rel="stylesheet" href="${rc.contextPath}/lib/multiselect/css/multi-select.css" />
		<script src="${rc.contextPath}/lib/multiselect/js/jquery.multi-select.min.js"></script>
		<script src="${rc.contextPath}/js/common/common_approve.js"></script>
		<script type="text/javascript" src="${rc.contextPath}/js/common/cascadecommon.js"></script>
		
    </head>
<body>
<div id="contentwrapper">
    <div class="main_content">   
        <div class="row-fluid">
        	 <div class="row-fluid">
		   		<div class="span12">
		      		<h3 class="heading">
						<#if vhm?? && vhm.id??>
							修改志愿者荣誉
						<#else>
							增加志愿者荣誉
						</#if>
			   		</h3>
			  	</div>
			 </div> 	
    		<form  id="volunteerHonorEditForm" class="form_validation_reg" action="${rc.contextPath}/volunteer/maintainHonor/opt-save/saveHonor.do" method="post">
				<input type="hidden" name="id" <#if vhm?? && vhm.id??>value="${vhm.id}"</#if>/>
				<div class="formSep"> 
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<span class="formTitle">所获荣誉学年<span class="f_req">*</span></span>
							</div>
							<div class="span9">
							    <select size="1"    id="honorYear" name="honorYear.id" aria-controls="dt_gal" >
						          <option value="" >请选择</option>
									<#if yearList??>
										<#list yearList as y>
											<#if vhm?? && vhm.honorYear?? &&  vhm.honorYear.id==y.id>
												<option value="${y.id}" selected="selected">${y.name?html}</option>
											<#else>
												<option value="${y.id}">${y.name?html}</option>
											</#if>
										</#list>
									</#if>
					         	</select>
					        </div>
						 </div>
						  <div class="span6">
						  	 <div class="span3">
						  	 		<span class="formTitle">所获荣誉学期<span class="f_req">*</span></span>
						 	 </div>
						 	 <div class="span9">
						 	 	<select size="1"   id="term" name="honorTerm.id" aria-controls="dt_gal" >
									<option value="" >请选择</option>
									<#if termList??>
										<#list termList as t>
											<#if vhm?? && vhm.honorTerm?? &&  vhm.honorTerm.id==t.id>
												<option value="${t.id}" selected="selected">${t.name?html}</option>
											<#else>
												<option value="${t.id}">${t.name?html}</option>
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
							 <div class="span3">
						  	 		<span class="formTitle">所获荣誉名称<span class="f_req">*</span></span>
						 	 </div>
							 <div class="span9">
					       		<input id="honorName"  name="honorName" <#if vhm?? && vhm.honorName??>value="${(vhm.honorName!"")}"</#if> />
					       	 </div>
						 </div>
						  <div class="span6">
						 	 <div class="span3">
						  	 		<span class="formTitle">所获荣誉时间<span class="f_req">*</span></span>
						 	 </div>
						 	 <div class="span9">
						 	 	<input type="text" id="honorTime" name="honorTime"    style="cursor:pointer;width:210px;" <#if vhm?? && vhm.honorTime??>value="${vhm.honorTime?date}"</#if>
											class="Wdate"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',skin:'whyGreen',el:$dp.$('honorTime')})" style="cursor:pointer"  />
						 	 </div>
						 </div>
					</div>
				</div>
				<div class="formSep"> 
					<div class="row-fluid">
						<div class="span6">
							 <div class="span3">
						  	 		<span class="formTitle">所获荣誉级别<span class="f_req">*</span></span>
						 	 </div>
						    <div class="span9">
							    <select size="1"    id="honorLevel" name="honorLevel.id" aria-controls="dt_gal" >
						         	<option value="" >请选择</option>
									<#if honorTypeList??>
										<#list honorTypeList as h>
											<#if vhm?? && vhm.honorLevel?? &&  vhm.honorLevel.id==h.id>
												<option value="${h.id}" selected="selected">${h.name?html}</option>
											<#else>
												<option value="${h.id}">${h.name?html}</option>
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
							<div class="span3">
						  	 		<span class="formTitle">所获荣誉名单<span class="f_req">*</span></span>
						 	 </div>
						    <div class="span9">
						    	<input id="_stuIds" name="stuIds" type="hidden" class="span6" value="${(stuIds!"")?html}"/>
								<textarea  id="_stuNames" name="stuNames" cols="12" rows="5" class="span10" readonly="true">${(stuNames!"")?html}</textarea>
							    <button class="btn btn-info"  type="button" onclick="selectStudentCheck();">多选学生</button>
				         	</div>
						 </div>
					</div>
				</div>	
			</form>
			<br/> 
			  <div class="formSep">
				<div class="row-fluid">					
				  <div class="span9">
				       <div class="span2">
						 <label>上传附件</label>
					   </div>
						<div class="span10" id="_upload_div">
							<form  id="fileUploadForm"  action="" method="post"  enctype="multipart/form-data">
								 <div data-fileupload="file" class="fileupload fileupload-new">
										<span class="btn btn-file"><span class="fileupload-new">选择文件</span><input id="file" type="file" name="file" onchange="uploadfile(this)"></span>
								 </div>
								 <div class="upload-alert-message" style="word-break:break-all;">
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
	    <div class="row-fluid">
		 	<div class="span6">
		  		<div class="span3">
		   		</div>
		   		 <div class="span9">
		             <!--判断是保存还是提交，保存=0   提交=1 -->
				    <button class="btn btn-info" type="button" id="save-course" onclick="onSub()">保 存</button>
		  			<button class="btn" type="button" onclick="javascript:window.history.back(-1);">取 消</button>
		   		</div>
		   	</div>
		</div>
        </div>
    </div>
    <#-- 志愿者选择多选组件的引入-->
	<#include "queryVolunteerAllCheckBoxModal.ftl">
 <script>
 	
 // 多选学生
 	function selectStudentCheck()
	{
		_queryStudentVolunteerCheckAll($("#_stuIds").val(),"");
		
	}
	function setMultiEduClassSelectValue(studentIds,names)
	{	
			$("#_stuIds").val(studentIds);		
			$("#_stuNames").html(names);	
	}

 	//保存方法 
 	 function onSub(){
		if($("#volunteerHonorEditForm").valid()){
				copyFileIdInput();
               $("#volunteerHonorEditForm").submit();	
		}
     }
      
  
  	$("document").ready(function(){
		//页面校验
	
		  $(".form_validation_reg").compValidate({
			rules:{   
					'honorYear.id':{required:true},
					'honorTerm.id':{required:true},
					'honorName':{required:true,maxlength:32},
					'honorTime':{required:true},
					'honorLevel.id':{required:true},
					'stuNames':{required:true}
				},
			messages:{
					'honorYear.id':{required:'所获荣誉学年不能为空'},
					'honorTerm.id':{required:'所获荣誉学期不能为空'},
					'honorName':{required:'所获荣誉名称不能为空',maxlength:'所获荣誉名称最大长度为32'},
					'honorTime':{required:'所获荣誉时间不能为空'},
					'honorLevel.id':{required:'所获荣誉级别不能为空'},
					'stuNames':{required:'志愿者荣誉名单不能为空'}
					
			}		
		 });
		 
     });
     /*
	  *上传附件
	  */
	 	
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
			var ext=fileName.substring(fileName.lastIndexOf(".")+1,fileName.length).toLowerCase();
			if("jpg,jpeg,png,gif,txt,ppt,rar,zip,doc,docx,xls,xlsx,ppt,pptx,wps,et,dps,".indexOf(ext+",")<0){
				comp.message("文件上传类型只能是jpg,jpeg,png,gif,txt,ppt,rar,zip,doc,docx,xls,xlsx,ppt,pptx,wps,et,dps,请重新选择文件。","error");
				return;
			}
		}
		
		tag=1;
		var div=fileupload.create_fileupload_div($("#fileUploadForm"),$(obj).val());
		tag=0;	
		var param="?maxSize=10485760&isTempFile=false";//设置业务文件大小限制上线不能超过10M
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
			$("#volunteerHonorEditForm").append($("#fileUploadForm input[name='fileId']"));
	}
 </script>
</body>
</html>