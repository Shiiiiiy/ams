<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <script type="text/javascript" src="${rc.contextPath}/js/common/cascadecommon.js"></script>
    	<!--date-->
		<script language="javascript" type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>	
    
		 <!-- animated progressbars -->
        <script src="${rc.contextPath}/js/bdp_fileupload.progressbar.js"></script>
       
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
		<!--date-->
		<script language="javascript" type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>	
		<!-- multiselect -->
	    <link rel="stylesheet" href="${rc.contextPath}/lib/multiselect/css/multi-select.css" />
		<script src="${rc.contextPath}/lib/multiselect/js/jquery.multi-select.min.js"></script>
    </head>
    <body>
	<div id="contentwrapper">
   		<div class="main_content">   
    	   <div class="row-fluid">	
    		<form  id="leagueMemberHonorQuery"  action="${rc.contextPath}/league/leagueManage/opt-save/saveHonor.do?classIdText=${classIdText}" method="post">
				
				<div class="span12">
					<#if honor?? && honor.id??>
						<input type="hidden" id="honorId" name="id" value="${(honor.id!"")?html}"/>
				   		<input type="hidden"  name="memberInfo.id" value="${(honor.memberInfo.id!"")?html}"/>
					<#else>
						<input type="hidden" id="memberInfo.id" name="memberInfo.id" value="${(memberId!"")?html}"/>	
					</#if>
					<input name="flags" id="flags" type="hidden" value="${flags!""}"/>
					<div class="formSep"> 
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<span class="formTitle">姓名<span class="f_req"></span></span>
								</div>
								<div class="span9">
								   <input value="${member.stuInfo.name}" readOnly/>
						        </div>
							 </div>
							  <div class="span6">
							 	 <div class="span3">
									<span class="formTitle">学号<span class="f_req"></span></span>
								 </div>
							 	 <div class="span9">
							 	 	  <input   value="${member.stuInfo.stuNumber}" readOnly/>
							 	 </div>
							 </div>
						</div>
					</div>
					<div class="formSep"> 				
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<span class="formTitle">荣誉学年<span class="f_req">*</span></span>
								</div>
								<div class="span9">
								    <select size="1"  id="honorYear" name="honorYear.id" aria-controls="dt_gal" >
								    
							          <option value="" >请选择</option>
										<#if yearList??>
												<#list yearList as y>
													<#if honor?? && honor.honorYear ??&& honor.honorYear.id==y.id >
														<option value="${y.id}"  selected="selected">${y.name?html}</option>
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
									<span class="formTitle">荣誉学期<span class="f_req">*</span></span>
								 </div>
							 	 <div class="span9">
							 	 	<select size="1"  id="term" name="honorTerm.id" aria-controls="dt_gal" >
										<option value="" >请选择</option>
										<#if termList??>
											<#list termList as t>
												<#if honor?? && honor.honorTerm ??&& honor.honorTerm.id==t.id >
													<option value="${t.id}"  selected="selected">${t.name?html}</option>
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
									<span class="formTitle">荣誉名称<span class="f_req">*</span></span>
								</div>
								<div class="span9">
						       		<input id="honorName"     name="honorName"  <#if honor?? && honor.honorName??> value="${(honor.honorName!"")?html}" </#if>/>
						       	</div>
							 </div>
							  <div class="span6">
							 	 <div class="span3">
									<span class="formTitle">荣誉时间<span class="f_req">*</span></span>
								 </div>
							 	 <div class="span9">
							 	 	<input type="text" id="honorTime" name="honorTime"   <#if honor?? && honor.honorTime??> value="${(honor.honorTime)?date}" </#if> style="cursor:pointer;width:210px;" 
												class="Wdate"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',skin:'whyGreen',el:$dp.$('honorTime')})" style="cursor:pointer"  />
							 	 	 
							 	 </div>
							 </div>
						</div>
					</div>
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
							    <div class="span3">
									<span class="formTitle">荣誉级别<span class="f_req">*</span></span>
								</div>
							    <div class="span9">
								    <select size="1"  id="honorLevel" name="honorLevel.id" aria-controls="dt_gal" >
							         	<option value="" >请选择</option>
										<#if honorTypeList??>
											<#list honorTypeList as h>
												<#if honor?? && honor.honorLevel ??&& honor.honorLevel.id==h.id >
													<option value="${h.id}"  selected="selected">${h.name?html}</option>
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
					</div>
				</form>
					 <div class="formSep">
						<div class="row-fluid">					
						  <div class="span9">
						       <div class="span2">
									<label>荣誉证明材料</label>
								</div>
								<div class="span10" id="_upload_div">
									
										<form  id="fileUploadForm"  action="" method="post"  enctype="multipart/form-data">
											 <div data-fileupload="file" class="fileupload fileupload-new">
													<span class="btn btn-file"><span class="fileupload-new">选择文件</span><input id="file" type="file" name="file" onchange="uploadfile(this)"></span>
											 </div>
											 <div class="upload-alert-message" style="word-break:break-all;">
							        		        文件只支持：jpg,jpeg,png,gif,txt,ppt,rar,zip,doc,docx,xls,xlsx,ppt,pptx,wps,et,dps且大小不超过10MB。
							        		 </div>
											 <#if fileList??>	
												<#list fileList as p>
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
							   		<#if user_key.optMap??>
										<#if user_key.optMap['honorMaintain']??>
								 	  		<button class="btn btn-info" type="button" id="save-course" onclick="saveHonor('add')">保存并新增</button>
								 	  		<button class="btn btn-info" type="button" id="save-course" onclick="saveHonor('back')">保存并返回</button>
							 	  		</#if>
									</#if>
			  						<button class="btn" type="button" onclick="javascript:window.location.href='${rc.contextPath}/league/leagueManage/opt-query/pageQueryLeagueMember.do?classIdText=${classIdText}'">取 消</button>
						 	   </div>
						   </div>
					 </div>
					<div class="row-fluid">
						<div class="span11">
							<h5 class="heading"></h5>
							<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
						        <div class="row-fluid">
									<div class="span12">
										<label>&nbsp;</label>
										<h3 class="heading">荣誉列表</h3>
									</div>
								</div>
								<table class="table table-bordered table-striped tablecut" id="smpl_tbl" >
									<thead>
										<tr>
											<th width="5%">序号</th>
											<th width="7%">姓名</th>
											<th width="10%">学号</th>
											<th width="10%">荣誉学年</th>
											<th width="10%">荣誉学期</th>
											<th width="20%">荣誉名称</th>
											<th width="9%">荣誉时间</th>
											<th width="9%">荣誉级别</th>
											<th width="10%">操作</th>
										</tr>
									</thead>
									<tbody>
										<#if honorList??>
											 <#list honorList as h>
												  <tr>
													<td class="autocut">${h_index+1}</td>
													<td class="autocut">${h.memberInfo.stuInfo.name?html}</td>
													<td class="autocut">${h.memberInfo.stuInfo.stuNumber?html}</td>		
													<td class="autocut">${h.honorYear.name?html}</td>
											    	<td class="autocut">${h.honorTerm.name?html}</td>						
											    	<td class="autocut">${h.honorName?html}</td>
											    	<td class="autocut">${h.honorTime?date}</td>
											    	<td class="autocut">${h.honorLevel.name?html}</td>
													<td>
														<a href="${rc.contextPath}/league/leagueManage/opt-view/viewMemberHonor.do?id=${h.id}&memberId=${memberId}&classIdText=${classIdText}" target="_blank" title="查看荣誉信息"> <i class="icon-list-alt"></i></a>										
														&nbsp;
														<#if user_key.optMap??>
															<#if user_key.optMap['honorMaintain']??>
																<a href="javascript:void(0);" onclick="editHonor('${h.id}');" class="sepV_a" title="编辑荣誉信息"><i class="icon-edit"></i></a>	
																<a href="javascript:void(0);" onclick="delHonor('${(h.honorName)!""}','${h.id!""}');" class="sepV_a" title="删除荣誉信息"><i class="icon-trash"></i></a>
															</#if>
														</#if>
													</td>
												 </tr>
											  </#list>
										 </#if>	
									</tbody>
								</table>
							</div>
						</div>
					</div> 
			</div> 
		</div>
	</div>
<#-- 脚本开始 -->
<script>
	
	// 编辑荣誉
	function editHonor(honorId){
	  window.location.href="${rc.contextPath}/league/leagueManage/opt-honorMaintain/memberHonorList.do?id="+honorId+"&memberId=${memberId}&classIdText=${classIdText}";
	}
	function saveHonor(str){
		if($("#leagueMemberHonorQuery").valid()){
			copyFileIdInput();
			$('#flags').val(str);
		  	$('#leagueMemberHonorQuery').submit();
		  
 		}
	}
	$("document").ready(function(){
	 	
	 	
	 	$("#leagueMemberHonorQuery").compValidate({
			rules:{   
					'honorYear.id':{required:true},
					'honorTerm.id':{required:true},
					'honorName':{required:true,maxlength:32},
					'honorTime':{required:true},
					'honorLevel.id':{required:true}
				},
			messages:{
					'honorYear.id':{required:'荣誉学年不能为空'},
					'honorTerm.id':{required:'荣誉学期不能为空'},
					'honorName':{required:'荣誉名称不能为空',maxlength:'荣誉名称最大长度为100'},
					'honorTime':{required:'荣誉时间不能为空'},
					'honorLevel.id':{required:'荣誉级别不能为空'}
					
			}		
		 });
	 	
	});
	
	//删除操作
	function delHonor(name,id)
	{
		comp.confirm("确定要删除荣誉为【"+name+"】的信息吗？", function(result) {
		
	    	if(!result)
	    		return;  
			$.post("${rc.contextPath}/league/leagueManage/opt-honorMaintain/deleteHonor.do", { id: id }, function(data){
				
				if(data === "success")
				{
					comp.message(name +"删除成功！","info");
					window.location.href="${rc.contextPath}/league/leagueManage/opt-honorMaintain/memberHonorList.do?memberId=${(member.id)!""}&classIdText=${unit.classId.id}";
				}
			    
			   },"text");
		}); 
	}
	
	
		//上传附件
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
			$("#leagueMemberHonorQuery").append($("#fileUploadForm input[name='fileId']"));
	}
	

	
</script>
</body>
</html>