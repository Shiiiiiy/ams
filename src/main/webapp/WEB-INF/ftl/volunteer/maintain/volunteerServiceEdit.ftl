<html>
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
		      			<#if vsm?? &&vsm.id??>志愿者服务修改
		      			<#else>志愿者服务增加
		      			</#if>
						
			   		</h3>
			  	</div>
			 </div> 	
    		<form  id="volunteerServiceEditForm" class="form_validation_reg" action="${rc.contextPath}/volunteer/maintainService/opt-save/saveService.do" method="post">
				<input type="hidden" name="id"<#if vsm??&& vsm.id??>value="${vsm.id}"</#if>/>
				<div class="formSep"> 
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<span class="formTitle">服务日期<span class="f_req">*</span></span>
							</div>
							<div class="span9">
							 <input type="text" id="serviceDate" name="serviceDate"    style="cursor:pointer;width:210px;" <#if vsm?? && vsm.serviceDate??>value="${vsm.serviceDate?date}"</#if>
											class="Wdate"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',skin:'whyGreen',el:$dp.$('serviceDate')})" style="cursor:pointer"  />
						 	 	 
					        </div>
						 </div>
						  <div class="span6">
						 	 <div class="span3">
								<span class="formTitle">服务时长(小时)<span class="f_req">*</span></span>
							 </div>
						 	 <div class="span9">
					       		<input id="serviceHour"  name="serviceHour"  <#if vsm?? &&vsm.serviceHour??>value="${(vsm.serviceHour!"")}"</#if>  />
						 	 	
						 	 </div>
						 </div>
					</div>
				</div>
				<div class="formSep"> 
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<span class="formTitle">服务记录<span class="f_req">*</span></span>
							</div>
							<div class="span9">
					       		<#if vsm?? && vsm.serviceRecord??>
						    		<textarea rows="5" cols="12" id="serviceRecord" name="serviceRecord" style="width: 730px; height: 134px;">${(vsm.serviceRecord!"")}</textarea>
								<#else>
								    <textarea rows="5" cols="12" id="serviceRecord" name="serviceRecord" style="width: 730px; height: 134px;"></textarea>
								</#if>	
					       	</div>
						 </div>
						 
					</div>
				</div>
		        <div class="formSep"> 
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<span class="formTitle">服务名单<span class="f_req">*</span></span>
							</div>
						    <div class="span9">
						    	<input id="_stuIds" name="stuIds" type="hidden" class="span6" value="${(stuIds!"")?html}"/>
						    	<input id="serviceStuNums" name="serviceStuNums" type="hidden" class="span6" value="${(vsm.serviceStuNums!"")?html}"/>
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
    <#-- 学生选择多选组件的引入-->
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
			var strs= new Array(); //定义一数组
			strs=studentIds.split(","); //字符分割 	
			var nums;
			if(strs==undefined || strs==null || strs=="" ){
				nums=0;
			}else{
				nums=strs.length;
			}
			$("#serviceStuNums").val(nums);
			
	}
	
 	//保存方法 
 	 function onSub(){
		if($("#volunteerServiceEditForm").valid()){
				copyFileIdInput();
               $("#volunteerServiceEditForm").submit();	
		}
     }
      
      	$("document").ready(function(){
		//页面校验
	
		  $(".form_validation_reg").compValidate({
			rules:{   
					'serviceDate':{required:true},
					'serviceHour':{required:true,serviceHourCheck:true,maxlength:8},
					'serviceRecord':{required:true,maxlength:500},
					'stuNames':{required:true}
					
				},
			messages:{
					'serviceDate':{required:'服务日期不能为空'},
					'serviceHour':{required:'服务时长不能为空',maxlength:'服务时长的最大长度为8'},
					'serviceRecord':{required:'服务记录不能为空',maxlength:'服务记录最大长度为500'},
					'stuNames':{required:'服务名单不能为空'}
					
			}		
		 });
		 
     });
	 //验证是否输入的是大于0小于等于24，并且只有一位小数
		jQuery.validator.addMethod("serviceHourCheck",function(value,element){
	  		if(value != ""){
	      		
	      		var patrn=/^(0\.[1-9]|[1-9](\.\d)?|1\d(\.\d)?|2[0-3](\.\d{1})?|24)$/
	     		 return patrn.exec(value);
	   		}else{
	      		return true;
	   		}
	  		return false;
		},"请输入大于0小于24的有效数字，并且最多只能有一位小数");
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
			$("#volunteerServiceEditForm").append($("#fileUploadForm input[name='fileId']"));
	}
 </script>
</body>
</html>