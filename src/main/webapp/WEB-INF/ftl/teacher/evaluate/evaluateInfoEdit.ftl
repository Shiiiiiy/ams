<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
 <link rel="stylesheet" href="${rc.contextPath}/css/bdp_comp.css" type="text/css" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<script src="${rc.contextPath}/js/common/common_approve.js"></script>
<link rel="stylesheet" href="${rc.contextPath}/lib/My97DatePicker/skin/WdatePicker.css" />
<script type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
<script src="${rc.contextPath}/lib/jquery-ui/jquery-ui-1.8.20.custom.min.js"></script>
<!-- animated progressbars -->
<script src="${rc.contextPath}/js/bdp_fileupload.progressbar.js"></script>
<!-- ajax form-->
<script src="${rc.contextPath}/js/jquery.form.js"></script>

<!-- bootstrap-fileupload -->	
<link rel="stylesheet" href="${rc.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.min.css" />
<script>
	function saveEvaluateInfo(status) {
		if(myValidator.form()){
			//验证附件不为空
			var  fileValidate = $("#fileUploadForm input[name='fileId']").size();
			if(fileValidate==0){
				comp.message("请上传附件！");
				return false;
			}
			if(status == 0){
				//保存
				$("#status_id").val("0");
				save();
			}else{
				//提交
				$("#status_id").val("1");
				//提交确认提示框
				comp.confirm("确认要提交吗？", function(result){
				if(!result){
					return; 
					}
					save();
				});
			}
		}
	}
	//业务保存
	function save(){
		$("#evaluateInfo").append($("#fileUploadForm input[name='fileId']"));
		$("#evaluateInfo").attr("action", "${rc.contextPath}/teacher/person/opt-save/evaluateInfo.do");
		$("#evaluateInfo").attr("method", "post");
		$("#evaluateInfo").submit();
	}
	 //数据校验
      var myValidator;
     $("document").ready(function(){
	   myValidator= $("#evaluateInfo").compValidate({
	      rules:{
			   workTime:{required:true, maxlength:24},
			   yearWorkSummary:{required:true,maxlength:500},
			   honour:{required:true,maxlength:500}
			},
			messages:{
			  workTime:{required:'工作时间不能为空',maxlength:'长度不超过24字'},
			  yearWorkSummary:{required:'工作总结不能为空，请填写工作总结',maxlength:'文本长度不超过500字'},
			  honour:{required:'所获荣誉不能为空，请填写所获荣誉',maxlength:'文本长度不超过500字'}
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
		//comp.message("提交了重复名称的文件请确认检查，如果确认内容重复可以手动删除。","info");
	//}
	//验证文件扩展名,该逻辑根据具体业务可自行调整
	var fileName=$(obj).val();
	fileName=fileName.substring(fileName.lastIndexOf("\\")+1,fileName.length);
	
	if(fileName.indexOf(".")>-1){
		var ext=fileName.substring(fileName.lastIndexOf(".")+1,fileName.length).toLowerCase();
		if("txt,ppt,rar,zip,doc,docx,xls,xlsx,ppt,pptx,wps,et,dps,".indexOf(ext+",")<0){
			comp.message("文件上传类型不正确，请重新选择文件。","error");
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
</script>
</head>
<body>
<div id="contentwrapper">
	<div class="main_content">
		<div class="row-fluid">
			<#if evaluateTeacher?? && evaluateTeacher.id??>
				<h3 class="heading">修改考核总结</h3>
			<#else>
				<h3 class="heading">新增考核总结</h3>
			</#if>
			<input name="errorText" id="errorText" type="hidden" value="${errorText!""}"/>
				<form id="evaluateInfo" name="evaluateInfo" class="form_validation_reg" method="post">
				<#if evaluateTeacher?? && evaluateTeacher.id??>
					<input id="id" name="id" type="hidden" value="${evaluateTeacher.id}"/>
				</#if>
					<input id="status_id" name="status_id" type="hidden"/>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<label>学年</label>
							</div>
							<div class="span9">
								<input id="" name="" value="${(evaluateTeacher.schoolYear.name)!""}" readonly/>
								<input id="schoolYear.id" name="schoolYear.id" value="${evaluateTeacher.schoolYear.id}" type="hidden"/>
							</div>
						</div>
						<div class="span6">
							<div class="span3">
								<label>学院</label>
							</div>
							<div class="span9">
								<input value="${(evaluateTeacher.teacher.org.name)!""}" readonly/>
								<input id="college.id" name="college.id" type="hidden" value="${evaluateTeacher.teacher.org.id!""}"/>
							</div>
						</div>
					</div>
				</div>	
				
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<label>姓名</label>
							</div>
							<div class="span9">
								<input value="${(evaluateTeacher.teacher.name)!""}" readonly/>
								<input id="teacher.id" name="teacher.id" type="hidden" value="${(evaluateTeacher.teacher.id)!""}"/>
							</div>
						</div>
						<div class="span6">
							<div class="span3">
								<label>性别</label>
							</div>
							<div class="span9">
								<input value="${(evaluateTeacher.teacher.gender.name)!""}" readonly/>
							</div>
						</div>
					</div>
				</div>
		
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<label>出生年月</label>
							</div>
							<div class="span9">
								<input value="${(evaluateTeacher.teacher.birthday ? string('yyyy-MM-dd'))!""}" readonly/>
							</div>
						</div>
									
						<div class="span6">
							<div class="span3">
								<label>民族</label>
							</div>
							<div class="span9">
								<input value="${(evaluateTeacher.teacher.nation)!""}" readonly />
							</div>
						</div>
					</div>
				</div>
				
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<label>工作时间<span class="f_req">*</span></label>
							</div>
							<div class="span9">
								<input id="workTime" name="workTime" value="${(evaluateTeacher.workTime)!""}" />
							</div>
						</div>
						<div class="span6">
							<div class="span3">
								<label>现任职务</label>
							</div>
							<div class="span9">
								<input id="presentJob" name="presentJob" value="<#if evaluateTeacher??>${evaluateTeacher.presentJob!""}</#if>" readonly/>
							</div>
						</div>
					</div>
				</div>
					
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<label>工作总结<span class="f_req">*</span></label>
							</div>
							<div class="span9">
								<textarea id="yearWorkSummary" name="yearWorkSummary" rows="5" cols="12" style="width: 775px; height: 134px;">${(evaluateTeacher.yearWorkSummary)!""}</textarea>
							</div>
						</div>
					</div>
				</div>
		
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<label>所获荣誉<span class="f_req">*</span></label>
							</div>
							<div class="span9">
								<textarea id="honour" name="honour" rows="5" cols="12" style="width: 775px; height: 134px;">${(evaluateTeacher.honour)!""}</textarea>
							</div>
						</div>
					</div>
				</div>
			</form>
			<div class="formSep">
				<div class="row-fluid">
					<div class="span9">
						<div class="span2">
							<label>相关附件<span class="f_req">*</span></label>
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
				        		<strong></strong> 
				        		文件支持格式：txt,ppt,rar,zip,doc,docx,xls,xlsx,ppt,pptx,wps,et,dps,且大小不能超过10M。
				        	</div>
							<#if uploadFileRefList??>	
							<#list uploadFileRefList as u>
								<div class="fileupload-info">
									<a class="close" data-dismiss="alert">×</a>
									<a href="${rc.contextPath}/sys/sysConfig/file.do?id=${u.uploadFile.id}"><strong>${u.uploadFile.name}&nbsp;(${u.uploadFile.fileSize})</strong></a>
									<input type="hidden" name="fileId" id="fileId" value="${u.uploadFile.id}"/>	
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
					<div class="span9" style="padding:10px 0px 0px 0px">
						<button class="btn btn-info" type="button" onclick="saveEvaluateInfo(0)">保存</button>
						<button class="btn btn-info" type="button" onclick="saveEvaluateInfo(1)">提交</button>
						<#if evaluateTeacher?? && evaluateTeacher.status?? && evaluateTeacher.status.name='已拒绝'>
							<button class="btn btn-info" type="button" onclick="approve.showApproveComments('${objectId!""}');">审核历史</button>
						</#if>
						<button class="btn" type="button" onclick="javascript:window.history.back(-1);">返回</button>
					</div>
				</div>
			</div>
			<input name="check_error" id="check_error" type="hidden" value="true"/>
		</div>
	</div>
</div>

<#-- 审核历史弹出框 begin-->
<div class="modal hide fade" id="auditHistoryBox">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3 id="title1">审核历史</h3>
	</div>
	<div class="modal-body" id="viewauditHistoryDiv"></div>
	<div class="modal-footer">
		<a href="#" class="btn btn" data-dismiss="modal">关闭</a>
	</div>
</div>
<#-- 审核历史弹出框  end-->
<#include "/common/approve/approveComment.ftl">
<script>
	//查看审核历史
	function auditHistoryView(){
		comp.showModal("auditHistoryBox", "1000px", "-180px 0 0 -380px");
   	 	$("#viewauditHistoryDiv").load("${rc.contextPath}/teacherInfo/view/nsm/auditHistory.do");
	}
</script>
</body>
</html>