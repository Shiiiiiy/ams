<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="${rc.contextPath}/css/bdp_comp.css" type="text/css"/>
		<!-- My97DatePicker -->
		<link rel="stylesheet" href="${rc.contextPath}/lib/My97DatePicker/skin/WdatePicker.css" />
		<script type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
		<!-- bootstrap-fileupload -->
		<link rel="stylesheet" href="${rc.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.min.css" />
	</head>
	<body>
		<div id="contentwrapper">
			<div class="main_content">
				<form id="fileUpload"  action="${rc.contextPath}/sponsor/temporaryWork/opt-query/importTemporaryWork.do" method="post"  enctype="multipart/form-data">
					<input type="hidden" name="objectId" value="${(logo.id)!""}"/>
					<input type="hidden" name="allowedExt" value="xls"/>
					<input type="hidden" name="maxSize" value="20971520"/>
					<!--2M-->
					<input type="hidden" name="TEMP_FILE" value="SYSCONFIG_FILE_SESSION_KEY"/>
					<!--临时文件存放sessionkey-->
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<label>下载模板</label>
								</div>
								<div class="span9">
									<label><a href="${rc.contextPath}/excel/template/import_sponsor_temporaryWork.xls">模板下载</a></label>
								</div>
							</div>
						</div>
					</div>
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<label>学年<span class="f_req">*</span></label>
								</div>
								<div class="span9">
									<select size="1" id="schoolYearCode" name="schoolYear.id" aria-controls="dt_gal" class="span6" >
										<option value="">请选择..</option>
										<#list years as year>
											<#if (temporaryWorkStudyModelVO.schoolYear)?? && temporaryWorkStudyModelVO.schoolYear.id == year.id >
												<option value="${year.id}" selected="selected">${year.name}</option>
											<#else>
												<option value="${year.id}">${year.name}</option>
											</#if>
										</#list>
									</select>
								</div>
							</div>
							<div class="span6">
								<div class="span3">
									<label>学期<span class="f_req">*</span></label>
								</div>
								<div class="span9">
									<select size="1" id="schoolTermCode" name="schoolTerm.id" aria-controls="dt_gal" class="span6" >
										<option value="">请选择..</option>
										<#list terms as term>
											<#if (temporaryWorkStudyModelVO.schoolTerm)?? && temporaryWorkStudyModelVO.schoolTerm.id == term.id>
												<option value="${term.id}" selected="selected">${term.name}</option>
											<#else>
												<option value="${term.id}">${term.name}</option>
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
									<label>用工部门<span class="f_req">*</span></label>
								</div>
								<div class="span9">
									<input id="orgName" name="orgName" class="span6" type="text" value="${(temporaryWorkStudyModelVO.orgName)!""}" />
								</div>
							</div>
							
							<div class="span6">
								<div class="span3">
									<label>月份<span class="f_req">*</span></label>
								</div>
								<div class="span9">
									<input id="workMonth" name="workMonth" class="Wdate span6" style="cursor:pointer;" type="text" value="${(temporaryWorkStudyModelVO.workMonth)!""}" onclick="WdatePicker({dateFmt:'MM',skin:'whyGreen'});" />
								</div>
							</div>
						</div>
					</div>
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<label>导入文件<span class="f_req">*</span></label>
								</div>
								<div class="span9" id="_upload_div">
									<div data-fileupload="file" class="fileupload fileupload-new">
										<span class="btn btn-file"><span class="fileupload-new">选择文件</span>
											<input id="file" type="file" name="file" onchange="uploadfile();">
										</span>
										<div id="resultsDiv"></div>
									</div>
									<div class="alert alert-warning" style="width:550px;">
										<strong>注意!</strong>
										<br>1.导入时请导入系统下载的模板,导入非系统下载的模板可能会导入失败。
										<br>2.最大导入行数为1000行。
										<br>3.导入的各条数据之间不要有空行。
										<br>4.模版中的学院、专业、班级，这些列中输入的数据需是当前系统中存在的名称相同。 
										<br>5.删除整行数据时，点击鼠标右键选择"删除"操作，不要用"清除内容"和"Delete"键删除内容。 
										<br>6.必填项目：学号、用工工时、银行卡号。
									</div>
								</div>
							</div>
						</div>
					</div>
					<#--用于判断是否重复提交-->
					<input id="isSubmit" name="isSubmit" type="hidden" value="false"/>
					<br/>
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
							</div>
							<div class="span9">
								<button class="btn btn-info" type="button" onclick="importTemporaryWork();"/>
									Excel导入
								</button>
								<button class="btn" type="button" onclick="goToList();">
									返回列表
								</button>
							</div>
						</div>
					</div>
					<br/>
				</form>
				<#if importFlag??>
					<#if errorText??>
						<div class="row-fluid">
							<#if (errorText?size > 0)>
								<#list errorText as e>
									<span class="f_req"> ${e!""} </span>
								</#list>
							</#if>
						</div>
					<#else>
						<div class="row-fluid">
							<span style="color:blue;font-size:15px">导入成功</span>
						</div>
					</#if>
				</#if>
				<#if reTemporaryWorkStudyModels??>
					<table class="table table-bordered table-striped tablecut">
						<thead>
							<th width="5%">序号</th>
							<th width="10%">Excel序号</th>
							<th width="10%">姓名</th>
							<th width="10%">学号</th>
							<th width="10%">班级</th>
							<th width="10%">二级学院</th>
							<th width="10%">月用工时</th>
							<th width="15%">银行卡号</th>
							<th width="20%">该生在本月勤工助学中的表现</th>
						</thead>
						<tbody>
							<#list reTemporaryWorkStudyModels as remodel>
								<tr>
									<td class="autocut">${remodel_index+1}</td>
									<td class="autocut">${(remodel.sortId)!""}</td>
									<td class="autocut">${(remodel.stuName)!""}</td>
									<td class="autocut">${(remodel.stuNo)!""}</td>
									<td class="autocut">${(remodel.className)!""}</td>
									<td class="autocut">${(remodel.collegeName)!""}</td>
									<td class="autocut">${(remodel.workHour)!'0'}</td>
									<td class="autocut">${(remodel.cardNum)!""}</td>
									<td class="autocut">${(remodel.workPerformance)!""}</td>
								</tr>
							</#list>
						</tbody>
					</table>
				</#if>
			</div>
		</div>
		<script type="text/javascript">
			//验证select是否选择
			jQuery.validator.addMethod("requiredSelect", function(value,element,param) {
				if(value == "" || value == null){
					return false;
				}else{
					return true;
				}
			}, "请选择：{0}");
			//前台验证
			$("#fileUpload").validate({
				onkeyup: false,
				errorClass: 'error',
				validClass: 'valid',
				focusCleanup:true,
				focusInvalid:false,
				highlight: function(element) {
					$(element).closest('div').addClass("f_error");
				},
				unhighlight: function(element) {
					$(element).closest('div').removeClass("f_error");
				},
				errorPlacement: function(error, element) {
					$(element).closest('div').append(error);
				},
				rules: {
					orgName : {
						required : true,
						maxlength : 50
					},
					workMonth : {
						required : true,
						isNumber : true,
						maxlength : 2
					},
					'schoolYear.id' : {
						requiredSelect : "学年"
					},
					'schoolTerm.id' : {
						requiredSelect : "学期"
					}
				},
				messages:{
					orgName:{required:"用工部门为必填项",maxlength:"用工部门名称的长度不能超过50"},
					workMonth:{required:"月份为必填项",isNumber:"月份必须是数字",maxlength:"月份的长度为2"}
				}
			});
			//上传组件
			function uploadfile() {
				$("#resultsDiv").attr("class","fileupload-info");
				$("#resultsDiv").html($("#file").val());
			}
			//导入
			function importTemporaryWork(){
				if(!$("#fileUpload").valid()){
					return false;
				}
				if($("#file").val() != ""){
					$.post(
						"${rc.contextPath}/sponsor/temporaryWork/opt-query/queryImportTemporaryWork.do",
						{'schoolYear.id':$("#schoolYearCode").val(),orgName:$("#orgName").val(),workMonth:$("#workMonth").val()},
						function(data){
							if(data == "true"){//之前导入过
								comp.confirm("该数据已经导入过，是否覆盖之前的数据？",function(result){
									if(result){
										$("#isSubmit").val("true");//重复标识置为true
										$("#fileUpload").submit();//覆盖提交，先逻辑删除后添加
									}
								});
							}else{
								$("#isSubmit").val("false");//重复标识置为false
								$("#fileUpload").submit();//正常提交
							}
						},
						"text"
					);
				}else{
					comp.message("请选择要导入的excel文件","err");
					return false;
				}
			}
			//返回列表页面
			function goToList(){
				window.location.href="${rc.contextPath}/sponsor/temporaryWork/opt-query/queryTemporaryWorkList.do";
			}
		</script>
	</body>
</html>