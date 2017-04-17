<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>studentArmyImport</title>
        <!-- bootstrap-fileupload -->	
        <script src="${rc.contextPath}/js/bdp_fileupload.progressbar.js"></script>
		<link rel="stylesheet" href="${rc.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.min.css" />
 <script>
	function uploadfile(obj) {
		$("#resultsDiv").html($("#file").val());
	}
	
	//下面代码解决重名文件可以连续上传问题，该功能需要根据实际业务进行调整
	$('.close').live('click', function() {
		$(this).alert('close');
		var file = $("#file");
		file.after(file.clone().val(''));
		file.remove();
	});
	
	function importStudentArmy(){
		if($("#file").val()==""){
			comp.message("请选择要导入的excel文件","error");
			return false;			
		}
	    $("#fileUpload").submit();
	}
	
	function goToList(){
	    var activityId=$("#activityId").val();
	    window.location.href="${rc.contextPath}/activity/manage/opt-query/activityMemberList.do?activityId="+activityId;
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
						参与人员导入页面
				    </h3>
			    </div>
			 </div>
			<form  id="fileUpload" action="${rc.contextPath}/activity/manage/opt-modify/importActivityMember.do" method="post"  enctype="multipart/form-data">
				 <input type="hidden" name="allowedExt" value="xls"/>
				 <input type="hidden" name="activityId" id="activityId" value="${activityId!""}"/>
				 <input type="hidden" name="maxSize" value="2097152"/><!--2M-->
				  <div class="formSep">
					<div class="row-fluid">
					  <div class="span9">
						<div class="span2">参与人员导入模板</div>
						<div class="span8">
					 		<div >
				 				<a href="${rc.contextPath}/excel/template/import_activity_member.xls">活动参与人员导入模板</a>
				    		</div>
				    	</div>
				      </div>
			    	</div>
			     </div>
			     
			      <div class="formSep">
					<div class="row-fluid">
						<div class="span9">						
								<div class="span2">
									<label>导入参与人员信息<span class="f_req">*</span></label>
								</div>
								<div class="span8" id="_upload_div">					
									 <div data-fileupload="file" class="fileupload fileupload-new">
											<span class="btn btn-file">
												<span class="fileupload-new">选择文件</span>											
												<input id="file" type="file" name="file" onchange="uploadfile(this)">
											</span>
										<div id="resultsDiv"></div>											
									 </div>
									 <div class="alert alert-warning">
							    		<strong>注意!</strong> 
							    		<br>1.导入时请导入系统下载的模板,导入非系统下载的模板可能会导入失败。
							    		<br>2.最大导入行数为1000行。
							    		<br>3.导入的各条数据之间不要有空行。
							    		<br>4.参与人员信息将以学生的学号作为唯一标识进行比对，导入前请确认学号无误。
							    		<br>5.参与人员联系方式不可重复。
							    		<br>6.删除整行数据时，点击鼠标右键选择"删除"操作，不要用"清除内容"和"Delete"键删除内容。 
							    		<br>7.必填项目：除备注外均为必填项。
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
						<div class="span8">
							<button class="btn btn-info" type="button" onclick="importStudentArmy()">Excel导入</button>
							<button class="btn" type="button" onclick="goToList()">取 消</button>
						</div>
					</div>
				</div>
				<#if errorText??><br/>
				<div class="formSep" style="border-top:#dcdcdc 1px dashed">
					<div class="row-fluid">	
						<#if errorText??>
							<#if errorText!="">
								<span class="f_req">
									${errorText}
								</span>
							<#else>
								<span style="color:blue;font-size:15px">
									导入成功
								</span>
							</#if>		
						</#if>
					</div> 
				</div>	
				</#if>			
      		</form>
		</div>
	</div>
</div>
</body>
</html>