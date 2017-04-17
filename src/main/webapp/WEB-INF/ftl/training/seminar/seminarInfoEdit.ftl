<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="${rc.contextPath}/lib/chosen/chosen.css" type="text/css">
<link rel="stylesheet" href="${rc.contextPath}/css/bdp_comp.css" type="text/css" />
<link rel="stylesheet" href="${rc.contextPath}/lib/My97DatePicker/skin/WdatePicker.css" />
<link rel="stylesheet" href="${rc.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.min.css" />
<script src="${rc.contextPath}/js/common/common_approve.js"></script>
<script src="${rc.contextPath}/lib/jquery-ui/jquery-ui-1.8.20.custom.min.js"></script>
<script src="${rc.contextPath}/js/bdp_fileupload.progressbar.js"></script>
<script src="${rc.contextPath}/js/jquery.form.js"></script>
<script type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="${rc.contextPath}/lib/chosen/chosen.jquery.min.js"></script>
<script>
	function saveSeminarInfo(status) {
		if(myValidator.form()){
			$('#status_id').val(status);
			if(status == '1'){
				//提交确认提示框
				comp.confirm("确认要提交吗？", function(result){
		        	if(!result){
		        		return; 
					}
					save();
				});
			}else{
				save();
			}
		}
	}
	
	//业务保存
	function save(){
		$("#seminarInfo").append($("#fileUploadForm input[name='fileId']"));
		$("#seminarInfo").attr("action", "${rc.contextPath}/training/seminar/opt-save/seminarInfo.do");
		$("#seminarInfo").attr("method", "post");
		$("#seminarInfo").submit();
	}
	
	//数据校验
	var myValidator;
	$("document").ready(function(){
		$.validator.setDefaults({ ignore: ":hidden:not(select)" });
		myValidator= $("#seminarInfo").compValidate({
			rules:{
				seminarName:{required:true, maxlength:'20'},
				seminarTheme:{required:true,maxlength:'100'},
				'outerUserId.id':{required:true},
				attendNum:{required:true, isNumber:true, maxlength:'5'},
				semDate:{required:true},
				beginDate:{required:true},
				endDate:{required:true},
				appointPlace:{required:true, maxlength:'20'},
				comment:{maxlength:'500'}
			},
			messages:{
				seminarName:{required:'请填写讲座名称！', maxlength:'最多不超过20字！'},
				seminarTheme:{required:'请填写讲座主题！', maxlength:'最多不超过100字！'},
				'outerUserId.id':{required:'请选择主讲人！'},
				attendNum:{required:'请填写讲座人数！',isNumber:'请输入合法数字！', maxlength:'最大不超过5位数！'},
				semDate:{required:'请设置讲座日期！'},
				beginDate:{required:'请设置讲座开始时间'},
				endDate:{required:'请设置讲座结束时间'},
				appointPlace:{required:'请设置讲座地点！', maxlength:'最多不超过20字！'},
				comment:{maxlength:'最多不超过500字！'}
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
		if("doc,docx,xls,xlsx,zip,".indexOf(ext+",")<0){
			comp.message("文件上传类型只能是doc,docx,xls,xlsx,zip,请重新选择文件。","error");
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
			<#if vo?? && vo.id??>
				<h3 class="heading">修改讲座信息</h3>
			<#else>
				<h3 class="heading">新增讲座信息</h3>
			</#if>
			<input name="errorText" id="errorText" type="hidden" value="${errorText!""}"/>
				<form id="seminarInfo" name="seminarInfo" class="form_validation_reg" method="post">
				<#if vo?? && vo.id??>
					<input id="id" name="id" type="hidden" value="${(vo.id)!""}"/>
				</#if>
				<input id="status_id" name="status_id" type="hidden"/>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span2">
								<label>讲座名称<span class="f_req">*</span></label>
							</div>
							<div class="span9">
								<input id="seminarName" name="seminarName" value="${(vo.seminarName)!""}" />
							</div>
						</div>
						<div class="span6">
							<div class="span2">
								<label>讲座地点<span class="f_req">*</span></label>
							</div>
							<div class="span9">
								<input id="appointPlace" name="appointPlace" value="${(vo.appointPlace)!""}"/>
							</div>
						</div>
					</div>
				</div>
				
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span2">
								<label>主讲人<span class="f_req">*</span></label>
							</div>
							<div class="span9">
								<select id="outerUserId.id" name="outerUserId.id" aria-controls="dt_gal" class="chzn_a"  data-placeholder="" onchange="chooseTeacher(this)">
									<option value="">请选择</option>
									<#if outerUserList??>
									<#list outerUserList as oul>
										<#if (vo.outerUserId)?? && vo.outerUserId.id == oul.id>
											<option value="${oul.id}" selected="selected">${oul.userName}(${(oul.userType.name)!""})</option>
										<#else>
											<option value="${oul.id}" title="四级考试的加分考生">${oul.userName}(${(oul.userType.name)!""})</option>
										</#if>
									</#list>
									</#if>
								</select>
							</div>
						</div>
						<div class="span6">
							<div class="span2">
								<label>主讲人编号</label>
							</div>
							<div class="span9">
								<input id="userCode" value="${(vo.outerUserId.userCode)!""}" readonly/>
							</div>
						</div>
					</div>
				</div>
		
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span2">
								<label>讲座日期<span class="f_req">*</span></label>
							</div>
							<div class="span9">
								<input name="semDate" id="semDate" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd', minDate:'%y-%M-%d', skin:'whyGreen'});" value="${(vo.seminarDate?string("yyyy-MM-dd"))!""}"/>
							</div>
						</div>
						<div class="span6">
							<div class="span2">
								<label>起止时间<span class="f_req">*</span></label>
							</div>
							<div class="span9">
								<input name="beginDate" id="beginDate" class="Wdate span3" style="float:left; margin-right:10px;" onclick="WdatePicker({dateFmt:'HH:mm',maxDate:'#F{$dp.$D(\'endDate\')}', skin:'whyGreen', el:$dp.$('beginDate')});"value="${(vo.beginDate)!""}"/>
								<span>至</span>
								<input name="endDate" id="endDate" class="Wdate span3" style="margin-left:10px;" onclick="WdatePicker({dateFmt:'HH:mm', minDate:'#F{$dp.$D(\'beginDate\')}', skin:'whyGreen', el:$dp.$('endDate')});"value="${(vo.endDate)!""}"/>
							</div>
						</div>
					</div>
				</div>
				
				<div class="formSep">
					<div class="row-fluid">
						
						<div class="span6">
							<div class="span2">
								<label>讲座人数<span class="f_req">*</span></label>
							</div>
							<div class="span9">
								<input id="attendNum" name="attendNum" value="${(vo.attendNum)!""}"/>
							</div>
						</div>
					</div>
				</div>
			<#-->	
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span2">
								<label>讲座主题<span class="f_req">*</span></label>
							</div>
							<div class="span9">
								<textarea id="seminarTheme" name="seminarTheme" rows="5" cols="12" style="width: 770px; height: 37px;"  >${(vo.seminarTheme)!""}</textarea>
								</br>
								<font size="1" color="grey"  style="vertical-align:bottom;">(讲座主题不超过100字)</font>
							</div>
						</div>
					</div>
				</div>	
			<-->	
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span2">
								<label>备注</label>
							</div>
							<div class="span9">
								<textarea id="comment" name="comment" rows="5" cols="12" style="width: 770px; height: 134px;"  >${(vo.comment)!""}</textarea>
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
						<div class="span2">
							<label>相关附件</label>
						</div>
						<div class="span9" id="_upload_div">
						<form  id="fileUploadForm"  action="" method="post"  enctype="multipart/form-data">
							<div data-fileupload="file" class="fileupload fileupload-new">
								<span class="btn btn-file">
									<span class="fileupload-new ">选择文件</span>
									<input id="file" type="file" name="file" onchange="uploadfile(this)"/>
								</span>
							 </div>
							<div class="upload-alert-message">
								文件支持格式：doc,docx,xls,xlsx,zip，且大小不能超过10M。
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
			</br>
			<div class="row-fluid">
				<div class="span6">
					<div class="span2">
					</div>
					<div class="span9">
						<button class="btn btn-info" type="button" onclick="saveSeminarInfo('0')">保存</button>
						<button class="btn btn-info" type="button" onclick="saveSeminarInfo('1')">提交</button>
						<button class="btn" type="button" onclick="javascript:window.history.back(-1);">返回</button>
					</div>
				</div>
			</div>
			<input name="check_error" id="check_error" type="hidden" value="true"/>
		</div>
	</div>
</div>
<script>
dicCatagory_chosen = {
	init:function(){
		$(".chzn_a").chosen({
			search_contains:true,
			no_results_text:"没有匹配的结果:"
		});
	}
};
dicCatagory_chosen.init();

function chooseTeacher(obj){
	var outerUserId = $(obj).val();
	$.ajax({
		url: "${rc.contextPath}/training/chooseTeacher/opt-query/queryOuterUserInfoJson.do",
		async:false,
		cache:false,
		type:"post",
		data:{"id":outerUserId},
		success:function(info){
			$('#userCode').val(info);
		}
	});
	
}
</script>
</body>
</html>