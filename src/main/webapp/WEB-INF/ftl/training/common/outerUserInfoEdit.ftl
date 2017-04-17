<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="${rc.contextPath}/css/bdp_comp.css" type="text/css" />
	<script src="${rc.contextPath}/lib/jquery-ui/jquery-ui-1.8.20.custom.min.js"></script>
	<!-- animated progressbars -->
	<script src="${rc.contextPath}/js/bdp_fileupload.progressbar.js"></script>
	<!-- ajax form-->
	<script src="${rc.contextPath}/js/jquery.form.js"></script>
	<link rel="stylesheet" href="${rc.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.min.css" />
</head>
<body>
<div id="contentwrapper">
	<div class="main_content">
		<div class="row-fluid">
			<#if vo?? && vo.id??>
				<h3 class="heading">讲师/导师信息变更</h3>
			<#else>
				<h3 class="heading">讲师/导师信息新增</h3>
			</#if>
			<input name="errorText" id="errorText" type="hidden" value="${errorText!""}"/>
				<form id="outerUserInfoForm" name="outerUserInfoForm" class="form_validation_reg">
				<#if vo?? && vo.id??>
					<input name="id" value="${(vo.id)!""}" type="hidden"/>
					<input name="userCode" value="${(vo.userCode)!""}" type="hidden"/>
				</#if>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span2">
								<label>姓名<span class="f_req">*</span></label>
							</div>
							<div class="span10">
								<input id="userName" name="userName" value="${(vo.userName)!""}" />
							</div>
						</div>
						<div class="span6">
							<div class="span2">
								<label>性别<span class="f_req">*</span></label>
							</div>
							<div class="span10">
								<#if gender??>
									<#list gender as g>
										<#if vo?? && vo.gender?? && vo.gender.id==g.id >
											<label class="radio inline">
												<input type="radio" id="gender" name="gender.id" checked="checked" value="${g.id}" />${g.name?html}
											</label>
										<#else>
											<label class="radio inline">
												<input type="radio" id="gender" name="gender.id" value="${g.id}" />${g.name?html}
											</label>
										</#if>
									</#list>
								</#if>
							</div>
						</div>
					</div>
				</div>	
				
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span2">
								<label>类型<span class="f_req">*</span></label>
							</div>
							<div class="span10">
								<select class="span6" id="userType.id" name="userType.id" aria-controls="dt_gal" >
									<option value="">请选择</option>
									<#if advisor??>
										<#list advisor as userType>
											<#if vo?? && (vo.userType)?? && vo.userType.id == userType.id>
												<option value="${userType.id}" selected="selected">${userType.name}</option>
											<#else>
												<option value="${userType.id}">${userType.name}</option>
											</#if>
										</#list>
									</#if>
								</select>
							</div>
						</div>
						<div class="span6">
							<div class="span2">
								<label>启用状态<span class="f_req">*</span></label>
							</div>
							<div class="span10">
								<#if userStatus??>
									<#list userStatus as u>
										<#if (vo.id)??>
											<#if vo?? && vo.userStatus?? && vo.userStatus.id==u.id >
												<label class="radio inline">
													<input type="radio" id="userStatus" name="userStatus.id" checked="checked" value="${u.id}" />${u.name?html}
												</label>
											<#else>
												<label class="radio inline">
													<input type="radio" id="userStatus" name="userStatus.id" value="${u.id}" />${u.name?html}
												</label>
											</#if>
										<#else>
											<#if u_index == 0>
												<label class="radio inline">
													<input type="radio" id="userStatus" name="userStatus.id" checked="checked" value="${u.id}" />${u.name?html}
												</label>
											<#else>
												<label class="radio inline">
													<input type="radio" id="userStatus" name="userStatus.id" value="${u.id}" />${u.name?html}
												</label>
											</#if>
										</#if>
									</#list>
								</#if>
							</div>
						</div>
					</div>
				</div>
		
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span2">
								<label>联系方式<span class="f_req">*</span></label>
							</div>
							<div class="span10">
								<input id="phoneNum" name="phoneNum" value="${(vo.phoneNum)!""}" />
							</div>
						</div>
						<div class="span6">
							<div class="span2">
								<label>职位</label>
							</div>
							<div class="span10">
								<input id="duty" name="duty" value="${(vo.duty)!""}" />
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span2">
								<label>邮箱</label>
							</div>
							<div class="span10">
								<input id="email" name="email" value="${(vo.email)!""}"/>
							</div>
						</div>
						<div class="span6">
							<div class="span2">
								<label>参与项目</label>
							</div>
							<div class="span10">
								<#if projectList??>
									<#list projectList as d>
										<#if vo?? && vo.participateProjectStr?? && vo.participateProjectStr?index_of("${d.code}") != -1>
											<input type="checkbox" name="participateProject.code" value="${d.code}" checked="true">&nbsp;&nbsp;${d.name}
										<#else>
											<input type="checkbox" name="participateProject.code" value="${d.code}">&nbsp;&nbsp;${d.name}
										</#if>		
									</#list>
								</#if>		
							</div>
						</div>
						
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span2">
								<label>单位</label>
							</div>
							<div class="span10">
								<textarea id="unit" name="unit" rows="5" cols="12" style="width: 775px; height: 36px;">${(vo.unit)!""}</textarea>
								</br>
								<font size="1" color="grey"  style="vertical-align:bottom;">(单位描述不超过100字)</font>
							</div>
						</div>
					</div>
				</div>
					
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span2">
								<label>个人简介</label>
							</div>
							<div class="span10">
								<textarea id="userProfile" name="userProfile" rows="5" cols="12" style="width: 775px; height: 134px;">${(vo.userProfile)!""}</textarea>
								</br>
								<font size="1" color="grey"  style="vertical-align:bottom;">(个人简介不超过500字)</font>
							</div>
						</div>
					</div>
				</div>
			</form>
			
			<div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span2">
							<label>头像选择</label>
						</div>
						<div class="span10" id="_upload_div">
							<form  id="fileUploadForm"  action="" method="post"  enctype="multipart/form-data">
								 <div id="fileButton" data-fileupload="file" class="fileupload fileupload-new">
									<span class="btn btn-file">
										<span class="fileupload-new ">选择照片</span>
										<input id="file" type="file" name="file" onchange="uploadfile(this)"/>
									</span>
								 </div>
								 <div id="fileWarring" class="upload-alert-message">文件只支持jpg,jpeg,png,JPG,JPEG,PNG且大小不能超过10M。</div>
							</form>	
							<#if listFile?? && (listFile?size > 0)>	
								 <#list listFile as lf>
									<a class="close" id="closeImg">×</a>
									<img src="${rc.contextPath}/sys/sysConfig/file.do?id=${lf.uploadFile.id}" id="headerImg"  width="260px" height="280px;"/>
									<input type="hidden" id="fileId" name="fileId" value="${lf.uploadFile.id}"/>	
								 </#list>
							 <#else>
								 	<a class="close" id="closeImg">×</a>
								 	<img src="${rc.contextPath}/img/default_person.jpg" style="display:block;" width="260px" height="280px;" id="headerImg" />
								 	<input type="hidden" id="fileId" name="fileId" value=""/>	
							 </#if> 
						</div>
					</div>
				</div>
			
			</div>	
			
			<div class="row-fluid">
				<div class="span6">
					<div class="row-fluid">
						<div class="span2"></div>
						<div class="span10" style="padding:10px 0px 0px 0px">
							<button class="btn btn-info" type="button" onclick="saveInfo()">保 存</button>
							<button class="btn" type="button" onclick="javascript:window.history.back(-1);">取 消</button>
						</div>
					</div>
				</div>
			</div>
			<input name="check_error" id="check_error" type="hidden" value="true"/>
		</div>
	</div>
</div>

<#---脚本开始--->
<script>
//业务存储
function saveInfo(params) {
	if(myValidator.form()) {
		//提交确认提示框
		comp.confirm("确定要保存吗？", function(result){
			if(result){
				submitInfo();
			}
		});
	}
}
function submitInfo() {
	$("#outerUserInfoForm").append($("#fileId"));
	$("#outerUserInfoForm").attr("action", "${rc.contextPath}/training/maintain/opt-save/outerUserInfo.do");
	$("#outerUserInfoForm").attr("method", "post");
	$("#outerUserInfoForm").submit();
}
//附件上传方法
var tag=0;
function uploadfile(obj){	
	if($("#fileShowForm .sepH_b").length>0||tag){//创建进度条以及包括页面中存在进度条时候不能再上传，平台只提供一个用户同时只能上传一个文件
		comp.message("同时只能上传一个图片，待上传完成后，再重试。","error");
		return;
	}
	if($("#fileShowForm .img-sty").length==1){
		comp.message("您已经上传头像，如果替换头像请先删除原头像。","error");
		return;
	}
	
	//验证文件扩展名,该逻辑根据具体业务可自行调整
	var fileName=$(obj).val();
	fileName=fileName.substring(fileName.lastIndexOf("\\")+1,fileName.length);
	
	if(fileName.indexOf(".")>-1){
		var ext=fileName.substring(fileName.lastIndexOf(".")+1,fileName.length).toLowerCase();
		if("jpg,jpeg,png,".indexOf(ext+",")<0){
			comp.message("文件上传类型只能是jpg,jpeg,png,JPG,JPEG,PNG请重新选择图片。","error");
			return;
		}
	}
	
	tag=1;
	var div=fileupload_img.create_fileupload_div($("#fileShowForm"),$(obj).val());
	tag=0;	
	var param="?maxSize=24204800&isTempFile=false";//设置业务文件大小限制上线不能超过200M
	$("#fileUploadForm").attr("action","${rc.contextPath}/sys/sysConfig/singleFileUpload.do"+param);		
	$("#fileUploadForm").ajaxSubmit(function(data) {
		try {//ie8才能执行如下代码
			data=$(data).unwrap().text();
		}catch(e) {
			//ff chrome浏览器
			}
			
		try {
			var obj=eval(data)[0];				
			if(obj.fileId==''){
				comp.message(obj.errorInfo,"error");
				$(div).remove();
			}else {
				comp.message("上传文件完成。","info");
				/**$(div).append($("<input>",{						
					type:'hidden',
					val:obj.fileId,
					name:'fileId',
				}));*/
				$("#headerImg").attr("src","${rc.contextPath}/sys/sysConfig/file.do?id="+obj.fileId);
				$("#headerImg").attr("value","${rc.contextPath}/sys/sysConfig/file.do?id="+obj.fileId);
				$("#headerImg").css("width","260px").css("height","280px");
				$("#fileId").val(obj.fileId);
			}
		}catch(e) {
			comp.message("头像提交服务器失败，请稍后刷新页面重试，如果还未成功请联系管理。","error");
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
				var str="<div class=\"img-sty span6\"><a class=\"close\" id=\"closeImg\">×</a><strong>"+fileName+"</strong>"
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
	$("#headerImg").attr("src","${rc.contextPath}/img/default_person.jpg");
	$("#fileId").val('');
	$("#headerImg").css("width","260px").css("height","280px");
});

//数据校验
var myValidator;
$("document").ready(function() {
	myValidator = $("#outerUserInfoForm").compValidate({
		rules:{
			userName:{required:true,maxlength:12},
			'gender.id':{required:true},
			unit:{maxlength:100},
			duty:{maxlength:20},
			'userType.id':{required:true},
			phoneNum:{required:true, phoneCheck:true},
			email:{email:true},
			userProfile:{maxlength:500}
		},
		messages:{
			userName:{required:'姓名不能为空！',maxlength:'最大长度为12字！'},
			'gender.id':{required:'性别不能为空！'},
			unit:{maxlength:'最大长度为100字!'},
			duty:{maxlength:'最大长度为20字！'},
			'userType.id':{required:'用户类型不能为空！'},
			phoneNum:{required:'联系方式不能为空！'},
			email:{email:'邮箱格式不对！'},
			userProfile:{maxlength:'最大长度为500字!'}
		}
	});
});

//验证是否输入的是手机号
jQuery.validator.addMethod("phoneCheck",function(value,element){
   if(value != ""){
      var phone =/^((13|15|17|18|14)[0-9]{9}(?!\d))|(0[1-9]\d{1,2}-[1-9]\d{6,7})$/;
      return phone.exec(value);
   }else{
      return true;
   }
  return false;
},"请输入11位的手机号码或者带区号的固定电话号码.");
	
<#---脚本结束---->
</script>
</body>
</html>