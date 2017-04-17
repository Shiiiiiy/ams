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
						<h3 class="heading">导师值班信息编辑页面</h3>
		    	<div class="row-fluid">
		    		<form id="editAdvisorInfo" method="post" action="${rc.contextPath}/training/setadvisor/opt-save/saveAdvisorInfo.do">
		    			<input type="hidden" id="flag" name="flag" value="edit">
		    			<input type="hidden" id="advisorInfoId" name="id" value="${advisorInfo.id!""}">
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span3">
				    					<span>导师姓名<span class="f_req">*</span></span>
		    						</div>
		    						<div class="span9">
		    							<select id="outerUserId" name="outerUserInfo.id" aria-controls="dt_gal" class="chzn_a"  data-placeholder="" >
											<option value="">请选择</option>
											<#if outerUserList??>
											<#list outerUserList as d>
												<#if advisorInfo?? && advisorInfo.outerUserInfo?? && advisorInfo.outerUserInfo.id == d.id>
													<option value="${d.id}" selected="selected">${d.userName}(${(d.userType.name)!""})</option>
												<#else>
													<option value="${d.id}">${d.userName}(${(d.userType.name)!""})</option>
												</#if>
											</#list>
											</#if>
										</select>
		    						</div>
		    					</div>
		    					<div class="span6">
		    						<div class="span3">
		    				    		<span>值班日期<span class="f_req">*</span></span>
		    						</div>
		    						<div class="span9">
				    					<input type="text" id="advisorDateStr" name="advisorDateStr" style="cursor:pointer" 
										value="<#if advisorInfo.advisorDate??>${advisorInfo.advisorDate?string('yyyy-MM-dd')!""}</#if>"  class="Wdate" 
												onclick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'%y-%M-{%d+1}',skin:'whyGreen'})" 
												style="cursor:pointer"/>
		    						</div>
	    				    	</div>
		    				</div>
	    				</div>
		    			
		    				
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span3">
			    				    	<span>值班时间段<span class="f_req">*</span></span>
		    						</div>
		    						<div class="span5 tipTag" data="建议时间段格式为：例 9:00-11:00,14:00-16:00">
										<input id="advisorTime" name="advisorTime"  value="<#if advisorInfo.advisorTime??>${advisorInfo.advisorTime!""}</#if>"/>
		    						</div>
		    				    </div>
		    				</div>
		    			</div>
		    			
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
	    				    		<div class="span3">
		    				    		<span>辅导内容简介</span>
	    				    		</div>
		    				    	<div class="span9">
										<textarea id="advisorIntro" name="advisorIntro" col="12" rows="3" style="width: 770px; height: 111px;">${advisorInfo.advisorIntro!""}</textarea>
										</br>
										<font size="1" color="grey"  style="vertical-align:bottom;">(辅导内容简介不超过500字)</font>
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
				              	<button class="btn btn-info" onclick="publishAdvisorInfo()">发 布</button>
				              	<button class="btn" onclick="javascript:window.history.back(-1);">返 回</button>
			           		</div>
			           	</div>
			         </div>
			         
			         
	    </div>
	    </div>
	    </div>       		
		<script>
			//保存
			function saveAdvisorInfo(){
				copyFileIdInput();
				$("#editAdvisorInfo").submit();
			}
			//发布
			function publishAdvisorInfo(){
				copyFileIdInput();
				$("#editAdvisorInfo").attr("action","${rc.contextPath}/training/setadvisor/opt-save/pubAdvisorInfo.do")				
				$("#editAdvisorInfo").submit();
			}
			
			function copyFileIdInput(){
				$("#editAdvisorInfo").append($("#fileUploadForm input[name='fileId']"));
			}
			
			$("document").ready(function(){
				$.validator.setDefaults({ ignore: ":hidden:not(select)" });
				var data = {outerUserId:function(){return $('#outerUserId').val();},advisorDate:function(){return $('#advisorDateStr').val();},
				id:function(){return $('#advisorInfoId').val();}};
				comp.validate.addRemote("advisorCheck","${rc.contextPath}/training/setadvisor/opt-query/checkAdvisorInfo.do",data,"该导师在该天已有值班信息");
           		$("#editAdvisorInfo").compValidate({
           		
					rules:{     
						'outerUserInfo.id': {required:true,advisorCheck:true},
						advisorDateStr: {required:true,advisorCheck:true},
						advisorTime: {required:true,maxlength:100},
						advisorIntro: {maxlength:500}
					},
					messages:{
						'outerUserInfo.id': {required:'请选择导师'},
						advisorDateStr: {required:'请选择值班日期'},
						advisorTime: {required:'请输入值班时间',maxlength:'最多只能输入100字'},
						advisorIntro: {maxlength:'最多只能输入500字'}
					}
				});
			});
			
		//初始化自动匹配	
		dicCatagory_chosen = {
		init:function(){
			$(".chzn_a").chosen({
				search_contains:true,
				no_results_text:"没有匹配的结果:"
			});
		}
		};
		dicCatagory_chosen.init();
		
		$(function(){
			$('.tipTag').poshytip({
				className: 'tip-yellowsimple',
				showOn: 'hover',
				alignTo: 'target',
				alignX: 'right',
				alignY: 'center',
				offsetX: 5
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