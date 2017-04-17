<html>
 <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- jQuery UI theme-->
        <link rel="stylesheet" href="${rc.contextPath}/lib/jquery-ui/css/Aristo/Aristo.css" />
        <script src="${rc.contextPath}/lib/jquery-ui/jquery-ui-1.8.20.custom.min.js"></script>
        <!-- animated progressbars -->
        <script src="${rc.contextPath}/js/bdp_fileupload.progressbar.js"></script>
        <script src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script>
        <!-- ajax form-->
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
		<script type="text/javascript" src="${rc.contextPath}/js/common/cascadecommon.js"></script>
		<!-- bootstrap-fileupload -->	
		<link rel="stylesheet" href="${rc.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.min.css" />
		<!-- multiselect -->
	    <link rel="stylesheet" href="${rc.contextPath}/lib/multiselect/css/multi-select.css" />
		<script src="${rc.contextPath}/lib/multiselect/js/jquery.multi-select.min.js"></script>	
    </head>
<body>
<div id="contentwrapper">
 <div class="main_content">
  <div class="row-fluid">
    <div class="row-fluid">
	   <div class="span12">
	      <h3 class="heading">
			 <#if poorStudent?? && poorStudent.id??>
				 双困生信息修改
			 <#else>
				 双困生信息维护
			 </#if>
		   </h3>
		  </div>
		 </div> 
		 <input name="errorText" id="errorText" type="hidden" value="${errorText!""}"/>
		 <#if poorStudent?? && poorStudent.id?? >
			<form  id="poorStudentInfoForm" class="form_validation_reg" action="${rc.contextPath}/job/poorStudent/opt-update/updatePoorStudentInfo.do" method="post"><@token/>
		 <#else>
			<form  id="poorStudentInfoForm" class="form_validation_reg" action="${rc.contextPath}/job/poorStudent/opt-save/savePoorStudentInfo.do" method="post"><@token/>
		 </#if>
		   <input id="id" type="hidden" name="id"  value="${(poorStudent.id)!""}">
		   <input id="college" type="hidden" name="college"  value="${collegeId!""}">
		   <input id="flag" type="hidden" name="flag">
			 <div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>姓名<span class="f_req">*</span></label>
						</div>
						<div class="span9 input-append">
						<#if poorStudent?? && poorStudent.studentInfo??>
							<input id="studentName" name="studentInfo.name" readOnly="true" value="${(poorStudent.studentInfo.name!"")?html}"/>
							<a style="cursor:pointer;margin-left:-4px;" onclick="selectStudentRadio(${(poorStudent.studentInfo.id)!''})" title="选择" class="btn"><i class="icon-search"></i></a>
					    <#else>
					        <input id="studentName" name="studentInfo.name"  readOnly="true" />
					        <a style="cursor:pointer;margin-left:-4px;" onclick="selectStudentRadio(${(poorStudent.studentInfo.id)!''})" title="选择" class="btn"><i class="icon-search"></i></a>
					    </#if>   
					        <input name="studentInfo.id" id="studentId" type="hidden" value="${(poorStudent.studentInfo.id)!''}"/> 
						</div>
					</div>
					
				  <div class="span6">	
			        <div class="span3">
						<label>学号<span class="f_req"></span></label>
					</div>
					<div class="span9">
					<#if poorStudent?? && poorStudent.studentInfo??>
						<input id="stuNumber" name="studentInfo.stuNumber" readOnly="true" value="${(poorStudent.studentInfo.stuNumber!"")?html}"/>
				    <#else>
				        <input id="stuNumber" name="studentInfo.stuNumber" readOnly="true"/>
				    </#if>
					</div>
				  </div>
			   </div>
			 </div>
			 
			  <div class="formSep"> 
			   <div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>学院<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="collegeName" name="studentInfo.college.name" readOnly <#if poorStudent?? && poorStudent.studentInfo?? &&  poorStudent.studentInfo.college??> value="${(poorStudent.studentInfo.college.name!"")?html}" </#if>/>
						</div>
					</div>
						
					<div class="span6">
						<div class="span3">
							<label>专业<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="majorName" name="studentInfo.major.majorName" readOnly <#if poorStudent?? && poorStudent.studentInfo?? && poorStudent.studentInfo.major??>  value="${(poorStudent.studentInfo.major.majorName!"")?html}"</#if>/>
						</div>
					 </div>
				  </div>
			   </div>
			   
			  <div class="formSep"> 
			   <div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>班级<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="className" name="studentInfo.classId.className" readOnly <#if poorStudent?? && poorStudent.studentInfo?? && poorStudent.studentInfo.classId??>  value="${(poorStudent.studentInfo.classId.className!"")?html}"</#if>/>
						</div>
					 </div>
						
					<div class="span6">
						<div class="span3">
							<label>学年<span class="f_req">*</span></label>
						</div>
						<div class="span9">
						 <select size="1" id="schoolYear" name="schoolYear.id" aria-controls="dt_gal">
							  <option value="" />请选择..</option>
								<#if yearList ??>
									<#list yearList as d>
										<#if poorStudent?? && poorStudent.schoolYear ?? && poorStudent.schoolYear.id==d.id >
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
						<div class="span3">
							<label>困难类别<span class="f_req">*</span></label>
						</div>
						<div class="span9">
						 <select size="1" id="difficultType" name="difficultType.id" aria-controls="dt_gal">
						  <option value="" />请选择..</option>
								<#if difficultTypeList ??>
									<#list difficultTypeList as d>
										<#if poorStudent?? && poorStudent.difficultType ?? && poorStudent.difficultType.id==d.id >
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
				<div class="span3">
					<label>困难原因<span class="f_req">*</span></label>
				 </div>
				  <div class="span9">
					<#if poorStudent?? && poorStudent.reason??>
					    <textarea rows="5" cols="12" id="reason" name="reason" style="width: 772px; height: 148px;">${(poorStudent.reason!"")}</textarea>
					<#else>
					    <textarea rows="5" cols="12" id="reason" name="reason" style="width: 772px; height: 148px;"></textarea>
					</#if>	
				</div>
			  </div>
			 </div>
			</div> 
		  </form>
		</div>
       
          <div class="formSep">
			<div class="row-fluid">					
			  <div class="span9">
			    <div class="span2">
					 <label>材料<span class="f_req"></span></label>
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
        <br/> 
 
	    <div class="row-fluid">
		 <div class="span6">
		  <div class="span3">
		   </div>
		      <div class="span9">
				    <button class="btn btn-info" type="button" id="save-course" onclick="onSub('0')">保 存</button>
				    <button class="btn btn-info" type="button" id="submit-button" onclick="onSub('1')">提 交</button>
		  			<button class="btn" type="button" onclick="javascript:window.history.back(-1);">取 消</button>
			  </div>
			</div>
			<input name="check_error" id="check_error" type="hidden" value="true"/>
		</div>
    </div>
  </div>
 </div>
  <#-- 学生选择单选组件的引入 -->
<#include "/comp/student/queryGraduateStudentRadioModal.ftl">
<script>
	
	 //判断数据是否为空
	function isEmpty(s){
	 return ((s==undefined || s==null || s=="" || s==0) ? true : false);
	}
	
	// 单选学生选择 
	function selectStudentRadio(id)
	{   
	    var collegeId = $("#college").val();
		_queryStudentRadioAll(id,collegeId);
	}
	
	function setStudentRadioSelectValue(student)
	{   
	    $("#studentId").val(student.id);
	    $("#studentName").val(student.name);
	    $("#stuNumber").val(student.id);
	    $("#collegeName").val(student.collegeName);
	    $("#majorName").val(student.majorName);
	    $("#className").val(student.className);
	 
	}
	
	
	var attachFlag;
	$("document").ready(function(){
		//页面校验
		var data={id:function(){return $("#id").val()},studentId:function(){return $("#studentId").val()},schoolYear:function(){return $("#schoolYear").val()}};
		comp.validate.addRemote("schoolYearCheck","${rc.contextPath}/job/poorStudent/opt-query/studentCheck.do",data,"同一学年学生只能申请一次双困生。");
		attachFlag = $(".form_validation_reg").compValidate({
			rules:{     
					    'schoolYear.id': {required:true,schoolYearCheck:true},
					     'difficultType.id': {required:true},
					             reason: {required:true,minlength:1,maxlength:500}
				
				},
				messages:{
					'schoolYear.id':{required:'学年不能为空！'},
					 'difficultType.id':{required:'困难类别不能为空！'},
					             reason:{required:'困难原因不能为空！',maxlength:'困难原因不能超过500字！'}
				}
		 });
	});
	
	
	function onSub(status){
	     var check_error=$("#check_error").val();
	     if(check_error == "true"){
	        copyFileIdInput();
	        if(status=='1'){
	        if(attachFlag.form()){
		           comp.confirm("提交信息后不能修改，确认要提交吗？", function(result) {
	                if(!result)
	                return; 
		           $("#flag").val("1");
		           $('#poorStudentInfoForm').submit();
		           });
		        }     
	        }else{
	            $("#flag").val("0");
	           $('#poorStudentInfoForm').submit();
	        }
	     }
	   }
    //隐藏原因
	function onChangeType(){
		var selVal = $("input[name='otherDifficult.id']:checked").val(); 
	     if(selVal=="4028900f40cd477c0140cd4afd8d0001"){
	     	$("#hideReason").show();
	     }else{
	     	$("#hideReason").hide();
	     }
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
							name:'fileId'
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
			$("#poorStudentInfoForm").append($("#fileUploadForm input[name='fileId']"));
		}
				
	
</script>
</body>
</html>
