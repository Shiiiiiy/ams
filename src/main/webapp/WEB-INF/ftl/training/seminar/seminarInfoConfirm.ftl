<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="${rc.contextPath}/css/bdp_comp.css" type="text/css" />
<link rel="stylesheet" href="${rc.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.min.css" />
<link rel="stylesheet" href="${rc.contextPath}/lib/My97DatePicker/skin/WdatePicker.css" />
<script src="${rc.contextPath}/js/common/common_approve.js"></script>
<script src="${rc.contextPath}/lib/jquery-ui/jquery-ui-1.8.20.custom.min.js"></script>
<script src="${rc.contextPath}/js/bdp_fileupload.progressbar.js"></script>
<script src="${rc.contextPath}/js/jquery.form.js"></script>
<script type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
</script>
</head>
<body>
<div id="contentwrapper">
	<div class="main_content">
		<div class="row-fluid">
			<h3 class="heading">讲座信息发布确认</h3>
			<input name="errorText" id="errorText" type="hidden" value="${errorText!""}"/>
			<input id="params" name="params" value="<#if seminarManage?? && seminarManage.id??>${(seminarManage.id!"")?html}</#if>" type="hidden"/>
			<div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>讲座名称</label>
						</div>
						<div class="span9">
							<input value="${(seminarManage.seminarName!"")?html}"readonly/>
						</div>
					</div>
					<div class="span6">
						<div class="span3">
							<label>主讲人</label>
						</div>
						<div class="span9">
							<input value="<#if seminarManage.outerUserId??>${(seminarManage.outerUserId.userName!"")?html}</#if>" readonly/>
						</div>
					</div>
				</div>
			</div>
			
			<div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>讲座人数</label>
						</div>
						<div class="span9">
							<input value="${(seminarManage.attendNum)!""}" readonly/>
						</div>
					</div>
				</div>
			</div>
		<#-->	
			<div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>讲座主题</label>
						</div>
						<div class="span9">
							<textarea rows="5" cols="12" style="width: 770px; height: 37px;" readonly>${((seminarManage.seminarTheme)!"")?html}</textarea>
						</div>
					</div>
				</div>
			</div>
		<-->	
			<div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>备注</label>
						</div>
						<div class="span9">
							<textarea rows="5" cols="12" style="width: 775px; height: 134px;" readonly >${(seminarManage.comment!"")?html}</textarea>
						</div>
					</div>
				</div>
			</div>
			
			<div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>资料附件</label>
						</div>
						<div class="span9">
							<input id="fileList" name="fileList" value="<#if fileList??>${fileList!""}</#if>" type="hidden"/>
							<#if uploadFileRefList??>	
								<#list uploadFileRefList as f>
									<div class="fileupload-info">
										<a href="${rc.contextPath}/sys/sysConfig/file.do?id=${f.uploadFile.id}"><strong>${f.uploadFile.name}&nbsp;(${f.uploadFile.fileSize})</strong></a>
									</div>					
								</#list>
							</#if>
						</div>
					</div>
				</div>
			</div>
			<div class="">
				<div class="span12">
					<h3 class="heading">学院预约信息</h3>
				</div>
			</div>
			<#if confirmPage??>
				<#list confirmPage.result as p>
					<div class="">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<label>预约学院</label>
								</div>
								<div class="span9">
									<input value="${((p.appointAcademy.name)!"")?html}" readonly/>
								</div>
							</div>
							<div class="span6">
								<div class="span3">
									<label>预约时间</label>
								</div>
								<div class="span9">
									<input value="${(p.appointTime?string("yyyy-MM-dd"))!""} ${(p.beginDate)!""}至${(p.endDate)!""}" readonly/>
								</div>
							</div>
						</div>
					</div>
					
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<label>预约地点</label>
								</div>
								<div class="span9">
									<input value="${((p.appointPlace)!"")?html}"readonly/>
								</div>
							</div>
							<div class="span6">
								<div class="span3">
									<label>预约人数</label>
								</div>
								<div class="span9">
									<input value="${(p.appointNum!"")?html}" readonly/>
								</div>
							</div>
						</div>
					</div>
					
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<span class="formTitle">电话</span>
								</div>
								<div class="span9">
									<input id="appointPhone" name="appointPhone" value="${((p.appointPhone)!"")?html}"  readonly/>
								</div>
							</div>
							<div class="span6">
								<div class="span3">
									<span class="formTitle">邮箱</span>
								</div>
								<div class="span9">
									<input id="appointEmail" name="appointEmail" value="${((p.appointEmail)!"")?html}"  readonly/>
								</div>
							</div>
						</div>
					</div>
	
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<span class="formTitle">QQ号码</span>
								</div>
								<div class="span9">
									<input id="appointQQ" name="appointQQ" value="${((p.appointQQ)!"")?html}"  readonly/>
								</div>
							</div>
							<div class="span6">
								<div class="span3">
									<span class="formTitle">预约人</span>
								</div>
								<div class="span9">
									<input id="appointUserId" name="appointUserId.name" value="<#if p.appointUserId?? && p.appointUserId.name??>${((p.appointUserId.name)!"")?html}</#if>"  readonly/>
								</div>
							</div>
						</div>
					</div>
				</#list>
			</#if>
			<div class="">
				<div class="span12">
					<h3 class="heading">讲座确定信息</h3>
				</div>
			</div>
			<form id="seminarInfoConfirm" name="seminarInfoConfirm" class="form_validation_reg" method="post">
			<div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<span class="formTitle">讲座日期</span><span class="formRed">*</span>
						</div>
						<div class="span9">
							<input name="seminarDateStr" id="seminarDateStr" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd', minDate:'%y-%M-%d', skin:'whyGreen'});" value="${(seminarManage.seminarDate?string("yyyy-MM-dd")!"")?html}"/>
						</div>
					</div>
					<div class="span6">
						<div class="span3">
							<span class="formTitle">起止时间</span><span class="formRed">*</span>
						</div>
						<div class="span9">
							<input name="beginDate" id="beginDate" class="Wdate span3" style="float:left; margin-right:10px;" onclick="WdatePicker({dateFmt:'HH:mm',maxDate:'#F{$dp.$D(\'endDate\')}', skin:'whyGreen', el:$dp.$('beginDate')});"value="${(seminarManage.beginDate)!""}"/>
							<span>至</span>
							<input name="endDate" id="endDate" class="Wdate span3" style="margin-left:10px;" onclick="WdatePicker({dateFmt:'HH:mm', minDate:'#F{$dp.$D(\'beginDate\')}', skin:'whyGreen', el:$dp.$('endDate')});"value="${(seminarManage.endDate)!""}"/>
						</div>
					</div>
				</div>
			</div>
			<div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<span class="formTitle">讲座地点</span><span class="formRed">*</span>
						</div>
						<div class="span9">
							<input id="appointPlace" name="appointPlace" value="${(seminarManage.appointPlace!"")?html}"/>
						</div>
					</div>
				<#-->	
					<div class="span6">
						<div class="span3">
							<span class="formTitle">讲座人数</span><span class="formRed">*</span>
						</div>
						<div class="span9">
							<input id="attendNum" name="attendNum" value="${(seminarManage.attendNum!"")?html}" />
						</div>
					</div>
				<-->	
				</div>
			</div>
			</br>
			<div class="row-fluid">
				<div class="span6">
					<div class="span3"></div>
					<div class="span9">
						<button class="btn btn-info" type="button" onclick="confirm()">确 定</button>
						<button class="btn" type="button" onclick="javascript:window.history.back(-1);">返 回</button>
					</div>
				</div>
			</div>
			</form>
			<input name="check_error" id="check_error" type="hidden" value="true"/>
		</div>
	</div>
</div>

<script>
function confirm() {
	var id = $('#params').val();
	var seminarDateStr = $('#seminarDateStr').val();
	var appointPlace = $('#appointPlace').val();
	var attendNum = $('#attendNum').val();
	var beginDate = $('#beginDate').val();
	var endDate = $('#endDate').val();
	var fileId = $('#fileList').val();
	if(myValidator.form()){
		comp.confirm("确认要发布吗？", function(result) {
			if(result) {
				$.post(
					"${rc.contextPath}/training/seminar/opt-pub/pubSeminarInfo.do",
					{seminarId:id, fileList:fileId, seminarDateStr:seminarDateStr, appointPlace:appointPlace, attendNum:attendNum,beginDate:beginDate,endDate:endDate},
					function(data) {
						window.location.href="${rc.contextPath}/training/seminar/opt-query/querySeminarInfoPage.do";
					},
					"text"
				);
			}
		});
	}
}
//数据校验
var myValidator;
$("document").ready(function(){
	myValidator= $("#seminarInfoConfirm").compValidate({
		rules:{
			attendNum:{required:true, isNumber:true},
			seminarDate:{required:true},
			beginDate:{required:true},
			endDate:{required:true},
			appointPlace:{required:true}
		},
		messages:{
			attendNum:{required:'请填写讲座人数！', isNumber:'请输入合法数字！'},
			seminarDate:{required:'请设置讲座日期！'},
			beginDate:{required:'请设置讲座开始时间！'},
			endDate:{required:'请设置讲座结束时间！'},
			appointPlace:{required:'请设置讲座地点！'},
   		}
	});
});
</script>
</body>
</html>