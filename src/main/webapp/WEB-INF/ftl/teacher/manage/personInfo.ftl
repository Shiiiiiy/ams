<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<script src="${rc.contextPath}/lib/jquery-ui/jquery-ui-1.8.20.custom.min.js"></script>
	<script src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script>
	<!-- ajax form-->
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
	<!-- bootstrap-fileupload -->	
		<link rel="stylesheet" href="${rc.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.min.css" />
	<!-- animated progressbars -->
        <script src="${rc.contextPath}/js/bdp_fileupload.progressbar.js"></script>
	<script>
	$("document").ready(function(){
		//校验
		$("#personInfoForm").compValidate({
			rules:{
					email:{email:true, maxlength:60},
					address:{maxlength:100},
					cellphone:{maxlength:11,regphone:true},
					phoneNumber:{isTelPhone:true},
					honour:{maxlength:1000},
					teachingStyle:{maxlength:1000},
					postCode:{regPost:true}
					
				},
				messages:{
					email:{email:"邮箱格式不正确", maxlength:"不能超过60字"},
					address:{maxlength:"联系地址不能超过100字"},
					cellphone:{maxlength:"手机号不超过11位"},
					honour:{maxlength:"所获荣誉不能超过1000字"},
					teachingStyle:{maxlength:"授课风格不能超过1000字"}
				}
		});
	});
	
	//保存方法
	function saveInfo() {
		$("#personInfoForm").attr("action", "${rc.contextPath}/teacher/maintain/opt-save/savePersonInfo.do");
		//$("#personInfoForm").append($("#fileUploadForm input[name='fileId']"));
		$("#personInfoForm").submit();
	}
	</script>
	<style>
		.img-sty{background:#fff; width:190px; height:275px; border:1px solid #bce8f1;}
		.img-this{width:190px; height:275px; margin-left:-30px;}
	</style>
</head>
<body>
<div id="contentwrapper">
	<div class="main_content">
		<div class="row-fluid">
		<#if tim??>
			<h2 class="heading">个人信息维护</h2>
			<form id="personInfoForm" name="personInfoForm" class="form_validation_reg" method="post">
				<input name="id" value="${tim.id!''}" type="hidden" />
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span2">
								<label>教师姓名</label>
							</div>
							<div class="span9">
								<input id="teacherName" name="teacher.name" value="<#if tim.teacher ??>${(tim.teacher.name)!""}</#if>" readonly/>
							</div>
						</div>
						<div class="span6">
							<div class="span2">
								<label>学院&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
							</div>
							<div class="span9">
								<input id="college" name="college.name" value="<#if college??>${college.name!""}</#if>" readonly/>
							</div>
						</div>
					</div>
				</div>	
				
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span2">
								<label>教师工号</label>
							</div>
							<div class="span9">
								<input id="teacher.id" name="teacher.id" value="<#if tim.teacher??>${(tim.teacher.id)!""}</#if>" readonly/>
							</div>
						</div>
						<div class="span6">
							<div class="span2">
								<label>出生日期</label>
							</div>
							<div class="span9">
								<input id="birthday" name="teacher.birthday" value="<#if tim.teacher?? && tim.teacher.birthday??>${(tim.teacher.birthday)?string("yyyy-MM-dd")}</#if>" readonly/>
							</div>
						</div>
					</div>
				</div>
		
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span2">
								<label>性别&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
							</div>
							<div class="span9">
								<input id="gender" name="teacher.gender.name" value="<#if tim.teacher??&& tim.teacher.gender??>${(tim.teacher.gender.name)!""}</#if>" readonly/>
							</div>
						</div>
									
						<div class="span6">
							<div class="span2">
								<label>年龄&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
							</div>
							<div class="span9">
								<input id="age" name="age" value="<#if age??>${age!""}</#if>" readonly>
							</div>
						</div>
					</div>
				</div>
				
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span2">
								<label>身份证号</label>
							</div>
							<div class="span9">
								<input id="idNumber" name="teacher.idNumber" value="<#if tim.teacher??>${(tim.teacher.idNumber)!""}</#if>" readonly/>
							</div>
						</div>
						<div class="span6">
							<div class="span2">
								<label>邮箱&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
							</div>
							<div class="span9">
								<input id="email" name="email" class="email" value="${tim.email!""}" />
							</div>
						</div>
					</div>
				</div>
		
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span2">
								<label>家庭地址</label>
							</div>
							<div class="span9">
								<input id="address" name="address" value="<#if tim.address ??>${tim.address!""}</#if>"/>
							</div>
						</div>
						<div class="span6">
							<div class="span2">
								<label>手机号码</label>
							</div>
							<div class="span9">
								<input id="cellphone" name="cellphone" value="<#if tim.cellphone ??>${tim.cellphone!""}</#if>"/>
							</div>
						</div>
					</div>
				</div>
					
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span2">
								<label>工作电话</label>
							</div>
							<div class="span9">
								<input id="phoneNumber" name="phoneNumber" value="<#if tim.phoneNumber ??>${tim.phoneNumber!""}</#if>"/>
							</div>
						</div>
						<div class="span6">
							<div class="span2">
								<label>邮编&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
							</div>
							<div class="span9">
								<input id="postCode" name="postCode" value="<#if tim.postCode ??>${tim.postCode!""}</#if>"/>
							</div>
						</div>
					</div>
				</div>
		
				<div class="formSep">
					<div class="row-fluid">
						<div class="span12">
							<div class="span1">
								<lable>所获荣誉</lable>
							</div>
							<div class="span9">
								<textarea class="span12" name="honour" rows="12" style="width:775px;">${tim.honour!""}</textarea>
								<br/><font color="gray" style="display:inline">（所获荣誉不超过1000字）</font>
							</div>
						</div>
					</div>
				</div>
				
				<div class="formSep">
					<div class="row-fluid">
						<div class="span12">
							<div class="span1">
								<lable>授课风格</lable>
							</div>
							<div class="span9">
								<textarea class="span12" name="teachingStyle" rows="12" style="width:775px;">${tim.teachingStyle!""}</textarea>
								<br/><font color="gray" style="display:inline">（授课风格不超过1000字）</font>
							</div>
						</div>
					</div>
				</div>
			</form>	
			<#--
			<div class="formSep">
				<div class="row-fluid">
					<div class="span12">
						<div class="span1">
							<lable>头像选择</lable>
						</div>
						<div class="span10" id="_upload_div">
							<form  id="fileUploadForm"  action="" method="post"  enctype="multipart/form-data">
								 <div id="fileButton" data-fileupload="file" class="fileupload fileupload-new <#if listFile?? && listFile?size lt 0>hide</#if>">
									<span class="btn btn-file">
										<span class="fileupload-new ">选择文件</span>
										<input id="file" type="file" name="file" onchange="uploadfile(this)"/>
									</span>
								 </div>
								 <div id="fileWarring" class="alert alert-warning <#if listFile?? && listFile?size lt 0>hide</#if>">
			        				<strong>注意！</strong> 
			        				文件只支持jpg,jpeg,png,gif且大小不能超过10M。
			        			 </div>
								 <#if listFile??>	
								 <#list listFile as lf>
									<div class="alert alert-info img-sty">
										<a class="close" id="closeImg">×</a>
										<img src="${rc.contextPath}/sys/sysConfig/file.do?id=${lf.uploadFile.id}" class="img-this" />
										<input type="hidden" name="fileId" value="${lf.uploadFile.id}"/>	
									</div>	
								 </#list>			
								 </#if> 
							</form>	
						</div>
					</div>
				</div>
			</div>
			-->
			<div class="row-fluid" style="margin-top:10px;">
				<div class="span12">
					<div class="span1"></div>
					<div class="span9">
						<button class="btn btn-info" type="button" onclick="saveInfo()">保 存</button>
						<#--<button class="btn" type="button" onclick="javascript:window.history.back(-1);">返回</button>-->
					</div>
				</div>
			</div>
		<#else>
				<style>
					#wrap{width:100%; overflow:hidden; margin: 0 auto;}
					.content {
							width: 750px;
							height: 400px;
							margin: 0 auto;
							overflow:hidden;
							padding-left:200px;
						}
					.content .right p{height:50px; font-size:20px; font-family:"微软雅黑"; font-weight:500; color:#7b7b7b;}
					.content .right h1{font-family:"黑体";}
					.left{float:left; width:30%;padding-left:70px; height:400px; margin-top:140px;}
					.right{width:60%; height:345px; margin-top:140px;}
				
				</style>
				<div id="wrap">
			    	<div class="content">
			            
			            <div class="right">
			                <h1>提示：</h1><br/>
			                <p>您没有权限访问此页面！如需访问，请联系系统管理员。</p>
			            </div>
			        </div>
	    		</div>
			</#if>
		</div>
	</div>
</div>
<script>
	/**
	//附件上传方法
	var tag=0;
	function uploadfile(obj){	
		if($("#fileUploadForm .sepH_b").length>0||tag){//创建进度条以及包括页面中存在进度条时候不能再上传，平台只提供一个用户同时只能上传一个文件
			comp.message("同时只能上传一个文件，待上传完成后，再重试。","error");
			return;
		}
		if($("#fileUploadForm .alert-info").length==1){
			comp.message("您已经上传头像，如果替换头像请先删除原头像。","error");
			return;
		}
		
		//验证文件扩展名,该逻辑根据具体业务可自行调整
		var fileName=$(obj).val();
		fileName=fileName.substring(fileName.lastIndexOf("\\")+1,fileName.length);
		
		if(fileName.indexOf(".")>-1){
			var ext=fileName.substring(fileName.lastIndexOf(".")+1,fileName.length);
			if("jpg,jpeg,png,gif,".indexOf(ext+",")<0){
				comp.message("文件上传类型只能是jpg,jpeg,png,gif请重新选择文件。","error");
				return;
			}
		}
		
		tag=1;
		var div=fileupload_img.create_fileupload_div($("#fileUploadForm"),$(obj).val());
		tag=0;	
		var param="?maxSize=24204800&isTempFile=false";//设置业务文件大小限制上线不能超过200M
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
					$(div).find("strong").wrapAll("<img src=\"${rc.contextPath}/sys/sysConfig/file.do?id="+obj.fileId+"\" class=\"img-this\" />");
					$("#fileButton").addClass("hide");
					$("#fileWarring").addClass("hide");
					
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
	jQuery.fn.anim_progressbar_img = function (aOptions) {
	
		// def options
		var aDefOpts = {
			start: new Date(), // now
			
			interval: 1000,
			callback: function() {}
		}
		var aOpts = jQuery.extend(aDefOpts, aOptions);
		var vPb = this;
		var iPerc =0 ; 
		var url=comp.contextPath()+"/sys/sysConfig/getFileProgress.do";
		// each progress bar
		return this.each(
			function() {
				
				// calling original progressbar
				$(vPb).children('.pbar').progressbar();
	
				// looping process
				var vInterval = setInterval(
					function(){
						
						// display current positions and progress
						$(vPb).children('.percent').html('<b>'+iPerc.toFixed(1)+'%</b>');
						$(vPb).children('.pbar').children('.ui-progressbar-value').css('width', iPerc+'%');
						
						$.ajax({
							async : false,
							cache:false,
							type: 'POST',
							url: url,
							error: function () {
								//iPerc=0;
							},
							success:function(data){ 
								
								iPerc=eval(data)[0].progress;
								
								// in case of Finish
								if (iPerc >= 100) {
									clearInterval(vInterval);
									$(vPb).children('.percent').html('<b>100%</b>');
									$(vPb).children('.pbar').children('.ui-progressbar-value').css('width', '100%');
									aDefOpts.callback.call(this);
								}
							}
						});
						
					} ,aOpts.interval
				);
			}
		);
	};
	
	
	fileupload_img = {		
			i:1 ,
			create_fileupload_div:function(parent,fileName){
					if(fileName.lastIndexOf("\\")){
							fileName=fileName.substring(fileName.lastIndexOf("\\")+1,fileName.length);
					}
					var id="progress"+this.i;
					var str="<div class=\"alert alert-info img-sty\"><a class=\"close\" id=\"closeImg\">×</a><strong>"+fileName+"</strong>"
					+"<div id=\""+id+"\" class=\"sepH_b\"><div class=\"percent\"></div><div class=\"pbar\"></div><div class=\"elapsed\"></div></div></div>";
					
					$(parent).append(str);
					
					$('#'+id).anim_progressbar_img({				
						callback: function() {						
						}
					});
					this.i++;
					return $('#'+id).parent();
			}
	};
	//关闭按钮监听
	jQuery("#closeImg").live("click", function() {
		$("#fileButton").removeClass("hide");
		$("#fileWarring").removeClass("hide");
		$(this).parent().remove();
	});
	**/
</script>
</body>
</html>