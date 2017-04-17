<html>
 <head>
    <meta charset="utf-8" />
    
    <!-- jQuery UI theme-->
    <link rel="stylesheet" href="${rc.contextPath}/lib/jquery-ui/css/Aristo/Aristo.css" />
    <script src="${rc.contextPath}/lib/jquery-ui/jquery-ui-1.8.20.custom.min.js"></script>
    <script src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script>
    <!-- ajax form-->
	<script src="${rc.contextPath}/js/jquery.form.js"></script>
    <script src="${rc.contextPath}/js/bdp_fileupload.progressbar.js"></script>
	<link rel="stylesheet" href="${rc.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.min.css" />
    <script src="${rc.contextPath}/lib/jquery-ui/jquery-ui-1.8.20.custom.min.js"></script>
    <script>
      $("document").ready(function(){
	      var activityCategory=$("#activityCategory").val();
		    if(activityCategory){
		       if(activityCategory=='402890ef5065538001506560a2d60001'){
		       	    $(".activityCategoryIn").show();
		       	    $(".activityCategoryOut").hide();
		       }else{
		       	    $(".activityCategoryIn").hide();
		       	    $(".activityCategoryOut").show();
		       }
		    }else{	    
	       	   $(".activityCategoryIn").hide();
		       $(".activityCategoryOut").hide();
		    }
	     var holdStatus=$('input:radio[name="holdStatus.id"]:checked').val();
	     if(holdStatus){
	       if(holdStatus=='4028900f40cd477c0140cd4afd8d0001'){
	       	    $(".holdStatus").show();
	       	    $(".noHoldStatus").hide();
	       }else{
	       	    $(".holdStatus").hide();
	       	    $(".noHoldStatus").show();
	       }
	     }else{
	            $(".holdStatus").hide();
	       	    $(".noHoldStatus").hide();
	     }
	     //社团
	    var activityType=$("#activityType").val();
	    if(activityType=='402890ef50655380015065649de70004'){
		     $("#association").show();
		}else{
		     $("#association").hide();
		}
		 //志愿者
	   if(activityType=='402890ef506553800150656876e10006'){
	       $(".vaddress").show();
	       $(".address").hide();
	   }else{
		   $(".vaddress").hide();
	       $(".address").show();
	   } 
	    //页面校验
		attachFlag = $(".form_validation_reg").compValidate({
			rules:{ 
					//summary: {required:true,minlength:1,maxlength:200},
					summary: {maxlength:200},
					reason: {required:true,minlength:1,maxlength:200},
				  },
			messages:{
					//summary:{required:'活动总结不能为空！',maxlength:'活动总结不能超过200字'},
					summary:{maxlength:'活动总结不能超过200字'},
					reason: {required:'活动未举办原因不能为空！',maxlength:'活动未举办原因不能超过200字'},
				}
		 });
	});
	function changHoldStatus(){
	 var holdStatus=$('input:radio[name="holdStatus.id"]:checked').val();
	    if(holdStatus){
	       if(holdStatus=='4028900f40cd477c0140cd4afd8d0001'){
	       	    $(".holdStatus").show();
	       	    $(".noHoldStatus").hide();
	       }else{
	       	    $(".holdStatus").hide();
	       	    $(".noHoldStatus").show();
	       }
	    }
	}
	//文件上传
	var tag=0;
	function uploadfile(obj){	
		if($("#fileUploadForm .sepH_b").length>0||tag){//创建进度条以及包括页面中存在进度条时候不能再上传，平台只提供一个用户同时只能上传一个文件
			comp.message("同时只能上传一个文件，待上传完成后，再重试。","error");
			return;
		}
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
		$("#activityInfoForm").append($("#fileUploadForm input[name='fileId']"));
	}
	
	//保存方法 
 	 function onSub(stas){
 	     var holdStatus=$('input:radio[name="holdStatus.id"]:checked').val();
	     if(holdStatus){
	       if(holdStatus=='4028900f40cd477c0140cd4afd8d0001'){
	       	    copyFileIdInput();
		 	    var Files = $("#activityInfoForm input[name='fileId']").size();
				if(Files==null || Files == 0 ){
					comp.message("请上传证明材料。","error");
					return false;
				}
				if(attachFlag.form()==false){
		 		    return false;
		 		}
		 		if(stas=="1"){
		 			$("#summaryStatus").attr("value","SUBMIT");
		 			if(!confirm("提交信息后不能修改，确认要提交吗？")){
              		return;
                }
		 		}else{
		 			$("#summaryStatus").attr("value","SAVE");
		 		}
		 		mask.showShade();
		 		$("#activityInfoForm").submit();
	       }else{
	      		if(attachFlag.form()==false){
		 		    return false;
		 		}
	      		if(stas=="1"){
		 			$("#summaryStatus").attr("value","SUBMIT");
		 			if(!confirm("提交信息后不能修改，确认要提交吗？")){
              		return;
                }
		 		}else{
		 			$("#summaryStatus").attr("value","SAVE");
		 		}
		 		mask.showShade();
		 		$("#activityInfoForm").submit();
	       }
	     }else{
		 comp.message("请选择活动是否举办!","error");
	     return;
	     }
 	}
 	  //返回到查询信息页面
    function goToView(){
    window.location.href="${rc.contextPath}/activity/manage/opt-query/listManageActivity.do";
    }
	</script>
 </head>
    <body>
    <div id="contentwrapper">
        <div class="main_content">   
            <div class="row-fluid">
				<div class="span12">
		            <div class="row-fluid">	
				        <div class="span12">
				            <h3 class="heading">
							      活动总结编辑页面
					        </h3>
					    </div>
					</div>
					<form id="activityInfoForm" class="form_validation_reg" action="${rc.contextPath}/activity/manage/opt-edit/editActivitySummary.do" method="post"><@token/>
					    <input type="hidden" name="id" id="activityId" value="${activity.id!""}"/>
					    <input type="hidden" name="summaryStatus" id="summaryStatus" value="${activity.summaryStatus!""}"/>
	                	<#include "/activity/info/activityInfo/activityInfo.ftl">
					    <div class="formSep">
							<div class="row-fluid">
							    <div class="span6">
									<div class="span3">
										<label>活动是否举办<span class="f_req">*</span></label>
									</div>
									<div class="span9">
										<#if holdStatusDicList??>
									        <#list holdStatusDicList as g>
											    <#if activity ?? && activity.holdStatus??  && activity.holdStatus.id==g.id >
													<label class="radio inline"><input type="radio" id="holdStatus" name="holdStatus.id" value="${g.id}" onclick="changHoldStatus()" checked />${g.name?html}</label>
												<#else>
													<label class="radio inline"><input type="radio" id="holdStatus" name="holdStatus.id" value="${g.id}" onclick="changHoldStatus()" />${g.name?html}</label>
												</#if>
											</#list>
										</#if>
								    </div>		
		                        </div>
							 </div>
	                    </div>
	                    <div class="noHoldStatus" style="display:none">
	                        <div class="formSep">
								<div class="row-fluid">
								    <div class="span9">
									    <div  class="span2">
											<label>未举办原因<span class="f_req">*</span></label>
									    </div>		
			                            <div class="span10">
			                                <textarea name="reason" id="reason" class="span10"  rows="10" ><#if activity ??>${(activity.reason)!""}</#if></textarea>
			                            </div>
			                        </div>
								</div>
		                    </div>
	                    </div>
	                    <div class="holdStatus" style="display:none">
	                        <div class="formSep">
								<div class="row-fluid">
								    <div class="span9">
									    <div  class="span2">
											<label>活动总结</label>
									    </div>		
			                            <div class="span10">
			                                <textarea name="summary" id="summary" class="span10"  rows="10" ><#if activity ??>${(activity.summary)!""}</#if></textarea>
			                            </div>
			                        </div>
								</div>
		                    </div>
	                    </div>
					</form>
	                <div class="holdStatus" style="display:none">
	                    <div class="formSep">
							<div class="row-fluid">
							    <div class="span9">
								    <div class="span2">
										<label>活动材料<span class="f_req">*</span></label>									
									</div>
			                        <div class="span10" sytle="padding-left:0">
			                        	<form  id="fileUploadForm"  action="" method="post"  enctype="multipart/form-data">
			                            <div data-fileupload="file" class="fileupload fileupload-new">
											<span class="btn btn-file">
											<span class="fileupload-new">选择文件</span>
											<input id="file" type="file" name="file" onchange="uploadfile(this)">
											</span>
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
		            </div>
		            <br/>
		        	<div class="row-fluid">
			        	<div class="span6">
							<div class="span3">
							</div>
							<div class="span9">
								<button class="btn btn-info" type="button" id="save-course" onclick="onSub('0')">保 存</button>
						        <button class="btn btn-info" type="button" id="submit-button" onclick="onSub('1')">提 交</button>
					            <button class="btn" type="button" onclick="goToView()">返 回</button>
							</div>
				        </div>
			        </div>
				</div>
			</div>
		</div>
	</div>	
   </body>
</html>