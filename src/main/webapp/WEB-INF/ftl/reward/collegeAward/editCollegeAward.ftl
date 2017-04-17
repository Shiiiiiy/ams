 <html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- ajax form-->
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
		<script src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
		<script src="${rc.contextPath}/lib/jquery-ui/jquery-ui-1.8.20.custom.min.js"></script>
		<script src="${rc.contextPath}/js/bdp_fileupload.progressbar.js"></script>
		<script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
		<script type="text/javascript" src="${rc.contextPath}/lib/chosen/chosen.jquery.min.js"></script>
		<link rel="stylesheet" href="${rc.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.min.css" />
		<link rel="stylesheet" href="${rc.contextPath}/lib/jquery-ui/css/Aristo/Aristo.css" />
		<!-- multiselect -->
	    <link rel="stylesheet" href="${rc.contextPath}/lib/multiselect/css/multi-select.css" />
	    <link rel="stylesheet" href="${rc.contextPath}/lib/chosen/chosen.css" type="text/css">
		<style>
			.modal{width:320px;margin-top:-180px;margin-left:-80px}
			.fileupload-info{width:740px}
		</style>
    </head>
    <body>
		<div id="contentwrapper">
		    <div class="main_content">
						<h3 class="heading">奖励信息编辑页面</h3>
		    	<div class="row-fluid">
		    		<form id="editCollegeAward" method="post" action="${rc.contextPath}/reward/collegeaward/opt-save/saveCollegeAward.do">
		    			<input type="hidden" id="collegeAwardId" name="id" value="${collegeAward.id!""}">
		    			<input type="hidden" id="collegeId" name="collegeId" value="${collegeId!""}">
		    			
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span3">
				    					<span>姓名<span class="f_req">*</span></span>
		    						</div>
		    						<div class="span9">
		    							<input id="studentId.name" name="studentId.name" value="<#if collegeAward?? && collegeAward.studentId??>${collegeAward.studentId.name!""}</#if>" readonly>
		    							<#if collegeAward.id ??>
		    							<#else>
				    						<a id="course-lecture-select"  style="margin-left: -4px;margin-top:-10px" href="javascript:void(0);" onclick="selectStudentRadio();" class="btn"><i class="icon-search"></i></a>
				    					</#if>	
		    						</div>
		    					</div>
		    					<div class="span6">
		    						<div class="span3">
		    				    		<span>学号</span>
		    						</div>
		    						<div class="span9">
		    							<input id="studentId.stuNumber" name="studentId.stuNumber" value="<#if collegeAward?? && collegeAward.studentId??>${collegeAward.studentId.stuNumber!""}</#if>" readonly>
		    						</div>
	    				    	</div>
		    				</div>
	    				</div>
		    			
		    				
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span3">
			    				    	<span>学院</span>
		    						</div>
		    						<div class="span9">
										<input id="studentId.college.name" name="studentId.college.name"  value="<#if collegeAward?? && collegeAward.studentId??>${collegeAward.studentId.college.name!""}</#if>" readonly/>
		    						</div>
		    				    </div>
		    				    <div class="span6">
		    						<div class="span3">
			    				    	<span>专业</span>
		    						</div>
		    						<div class="span9">
										<input id="studentId.major.majorName" name="studentId.major.majorName"  value="<#if collegeAward?? && collegeAward.studentId??>${collegeAward.studentId.major.majorName!""}</#if>" readonly/>
		    						</div>
		    				    </div>
		    				</div>
		    			</div>
		    			
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span3">
			    				    	<span>班级</span>
		    						</div>
		    						<div class="span9">
										<input id="studentId.classId.className" name="studentId.classId.className"  value="<#if collegeAward?? && collegeAward.studentId??>${collegeAward.studentId.classId.className!""}</#if>" readonly/>
		    						</div>
		    				    </div>
		    				    <div class="span6">
		    						<div class="span3">
			    				    	<span>学年<span class="f_req">*</span></span>
		    						</div>
		    						<div class="span9">
										<select size="1" id="schoolYear" name="schoolYear.code" aria-controls="dt_gal" class="selectoption" >
											<option value="" />请选择..</option>
											<#list schoolYearList as d>
												<#if collegeAward?? && collegeAward.schoolYear?? && collegeAward.schoolYear.code==d.code>
	    					    	            	<option  value="${d.code}" selected="selected">${d.name?html}</option>
	    					    	            <#else>
	    					    	            	<option  value="${d.code}" >${d.name?html}</option>
	    					    	            </#if>
											</#list>
										</select>
		    						</div>
		    				    </div>
		    				</div>
		    			</div>
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span3">
		    				    		<span>学期<span class="f_req">*</span></span>
		    				    	</div>
		    				    	<div class="span9">	
										<select size="1" id="schoolTerm" name="schoolTerm.code" aria-controls="dt_gal" class="selectoption" >
											<option value="" />请选择..</option>
											<#list schoolTermList as d>
												<#if collegeAward?? && collegeAward.schoolTerm?? && collegeAward.schoolTerm.code==d.code>
	    					    	            	<option  value="${d.code}" selected="selected">${d.name?html}</option>
	    					    	            <#else>
	    					    	            	<option  value="${d.code}" >${d.name?html}</option>
	    					    	            </#if>
											</#list>
										</select>
									</div>	
		    				    </div>
		    				    <div class="span6">
		    						<div class="span3">
			    				    	<span>奖励名称<span class="f_req">*</span></span>
		    						</div>
		    						<div class="span9">
										<input id="awardName" name="awardName"  value="<#if collegeAward??>${collegeAward.awardName!""}</#if>"/>
		    						</div>
		    				    </div>
		    				</div>
		    			</div>	
		    			
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span3">
			    				    	<span>创建人</span>
		    						</div>
		    						<div class="span9">
										<input id="creator.name" name="creator.name"  value="<#if collegeAward?? && collegeAward.creator??&& collegeAward.creator.name??>${collegeAward.creator.name!""}<#else>${user_key.userName}</#if>" readonly="true"/>
										<input id="creator.id" name="creator.id" type="hidden"  value="<#if collegeAward?? && collegeAward.creator??>${collegeAward.creator.id!""}</#if>"/>
		    						</div>
		    				    </div>
		    				    <div class="span6">
		    						<div class="span3">
			    				    	<span>获奖日期</span>
		    						</div>
		    						<div class="span9">
										<input type="text" id="awardTime" name="awardTime" style="cursor:pointer" value="<#if collegeAward.awardTime??>${collegeAward.awardTime!""}</#if>"  class="Wdate" 
												onclick="WdatePicker({dateFmt:'yyyy-MM-dd',skin:'whyGreen'})"/>
		    						</div>
		    				    </div>
		    				</div>
		    			</div>	
		    			
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
	    				    		<div class="span3">
		    				    		<span>备注</span>
	    				    		</div>
		    				    	<div class="span9">
										<textarea id="comments" name="comments" col="12" rows="3" style="width: 770px; height: 111px;"><#if collegeAward??>${collegeAward.comments!""}</#if></textarea>
										</br>
										<font size="1" color="grey"  style="vertical-align:bottom;">(备注不超过500字)</font>
									</div>
	    				    	</div>
		    				</div>
		    			</div>
		    			
		    			
		    		</form>	
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span3">
							    		<label>附件</label>
							    	</div>
		    				    	<div class="span9">
										<form  id="fileUploadForm"  action="" method="post"  enctype="multipart/form-data">
											<div data-fileupload="file" class="fileupload fileupload-new">
												<span class="btn btn-file"><span class="fileupload-new">选择文件</span><input id="file" type="file" name="file" onchange="uploadfile(this)"></span>
											 </div>
											 <div class="upload-alert-message" style="word-break:break-all;width: 760px; height: 20px;">
							        		       	文件只支持：jpg,jpeg,png,gif,txt,ppt,rar,zip,doc,docx,xls,xlsx,ppt,pptx,wps,et,dps，且大小不超过10MB。
							        		 </div>
											 <#if uploadFileRefList??>	
												<#list uploadFileRefList as p>
													<div class="fileupload-info">
														<a class="close" data-dismiss="alert">×</a>
														<a href="${rc.contextPath}/sys/sysConfig/file.do?id=${p.uploadFile.id}"><strong>${p.uploadFile.name}&nbsp;(${p.uploadFile.fileSize})</strong></a>
														<input type="hidden" id="fileId" name="fileId" value="${p.uploadFile.id}">	
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
				    		<div class="span9" >
				              	<button class="btn btn-info" onclick="saveAdvisorInfo()">保 存</button>
				              	<button class="btn" onclick="javascript:window.history.back(-1);">返 回</button>
			           		</div>
			           	</div>
			         </div>
			         
<#include "/comp/student/queryStudentAllRadioModal.ftl">			         
	    </div>
	    </div>
	    </div>       		
		<script>
			//保存
			function saveAdvisorInfo(){
				copyFileIdInput();
				$("#editCollegeAward").submit();
			}
			
			function copyFileIdInput(){
				$("#editCollegeAward").append($("#fileUploadForm input[name='fileId']"));
			}
			
			function selectStudentRadio()
			{
				_queryStudentRadioAll("",$("#collegeId").val());
			}
			function setStudentRadioSelectValue(student)
			{
				$("#studentId\\.name").val(student.name);
				$("#studentId\\.stuNumber").val(student.stuNumber);
				$("#studentId\\.college\\.name").val(student.collegeName);
				$("#studentId\\.major\\.majorName").val(student.majorName);
				$("#studentId\\.classId\\.className").val(student.className);
			}
			
			$("document").ready(function(){
				var data = {schoolYear:function(){return $('#schoolYear').val();},schoolTerm:function(){return $('#schoolTerm').val();},
							studentId:function(){return $("#studentId\\.stuNumber").val();},awardName:function(){return $('#awardName').val();},
							awardId:function(){return $('#collegeAwardId').val();}};
				comp.validate.addRemote("awardNameCheck","${rc.contextPath}/reward/collegeaward/opt-query/checkCollegeAward.do",data,"所填获奖信息在系统中已存在");
           		$("#editCollegeAward").compValidate({
           		
					rules:{     
						'studentId.name': {required:true},
						'schoolYear.code': {required:true},
						'schoolTerm.code': {required:true},
						awardName: {required:true,maxlength:32,awardNameCheck:true},
						comments: {maxlength:500}
					},
					messages:{
						'studentId.name': {required:'请选择学生'},
						'schoolYear.code': {required:'请选择学年'},
						'schoolTerm.code': {required:'请选择学期'},
						awardName: {required:'请填写奖励名称',maxlength:'最多只能输入32字'},
						comments: {maxlength:'最多只能输入500字'}
					}
				});
			});
			
			
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
			fileName=fileName.substring(fileName.lastIndexOf("\\")+1,fileName.length).toLowerCase();
			
			if(fileName.indexOf(".")>-1){
				var ext=fileName.substring(fileName.lastIndexOf(".")+1,fileName.length);
				if("jpg,jpeg,png,gif,txt,ppt,rar,zip,doc,docx,xls,xlsx,ppt,pptx,wps,et,dps,".indexOf(ext+",")<0){
					comp.message("文件上传类型只能是jpg,jpeg,png,gif,</br>txt,ppt,rar,zip,doc,docx,xls,xlsx,ppt,</br>pptx,wps,et,dps,请重新选择文件。","error");
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
		</script>	           		
	</body>
</html>