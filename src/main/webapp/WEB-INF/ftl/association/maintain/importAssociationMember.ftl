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
		
			
			 function uploadfile(){	
			 	$("#resultsDiv").html($("#file").val());
			 }
			function importAssociationMember(){
				if($("#file").val()==""){
					comp.message("请选择要导入的excel文件","error");
					return false;			
				}
			    $("#fileUpload").submit();
			}
			function goToList(){
			    window.location.href="${rc.contextPath}/association/maintain/opt-query/getAssociationMemberList.do?associationPo.id=${associationPoId!''}";
			}
			
		</script>
    </head>
<body>
<div id="contentwrapper">
    <div class="main_content"> 
    	<div class="row-fluid">	
			<form  id="fileUpload" action="${rc.contextPath}/association/maintain/opt-query/importAssociationMember.do" method="post"  enctype="multipart/form-data">
				 <input type="hidden" name="allowedExt" value="xls"/>
				 <input type="hidden" name="maxSize" value="2097152"/><!--2M-->
				 <input type="hidden" name="associationPoId" value="${associationPoId!''}"/>
				  <div class="formSep">
					<div class="row-fluid">
					  <div class="span9">
						<div class="span2">社员名单导入模板</div>
						<div class="span8">
					 		<div >
				 				<a href="${rc.contextPath}/excel/template/import_association_member.xls">社员名单导入模板</a>
				    		</div>
				    	</div>
				      </div>
			    	</div>
			     </div>
			     
			      <div class="formSep">
					<div class="row-fluid">
						<div class="span9">						
								<div class="span2">
									<label>导入社员名单<span class="f_req">*</span></label>
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
							    		<br>4.社员名单将以学生的学号作为唯一标识进行比对，导入前请确认学号无误。
							    		<br>5.模版中的专业、班级，这些列中输入的数据需是当前系统中存在的名称相同。 
							    		<br>6.删除整行数据时，点击鼠标右键选择"删除"操作，不要用"清除内容"和"Delete"键删除内容。 
							    		<br>7.必填项目：红色标识的字段均为必填项。
							    	</div>							 
								</div>
							</div>
						</div>
					</div>
				</div>
				<br/>
				<#if !(importFlag??) ||!(page??)>
					<div class="row-fluid">
						<div class="span9">						
							<div class="span2">&nbsp;</div>
							<div class="span8">
								<button class="btn btn-info" type="button" onclick="importAssociationMember()">Excel导入</button>
								<button class="btn" type="button" onclick="goToList()">取消</button>
							</div>
						</div>
					</div>
					</#if>
					<br/>
					<#if importFlag?? && errorText??>
					<div class="formSep" style="border-top:#dcdcdc 1px dashed">
						<div class="row-fluid">	
							<#if (errorText?size > 0)>
								<#list errorText as e>
									<span class="f_req"> ${e!""} </span>
								</#list>
							</#if>		
						</div> 
					</div>	
					</#if>	
				</form>
			<#include "association.ftl">
		</div>
	</div>
</div>
</body>
</html>