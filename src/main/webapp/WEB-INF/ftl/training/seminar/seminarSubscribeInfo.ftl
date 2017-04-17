<script src="${rc.contextPath}/js/jquery.form.js"></script>
<form id="seminarSubscribeConfirm" name="seminarSubscribeConfirm" class="form_validation_reg">
<h3 class="heading">讲座信息</h3>
	<div class="formSep">
		<div class="row-fluid">
			<div class="span6">
				<div class="span4">
					<label>讲座名称</label>
				</div>
				<div class="span8">
					<input value="${((seminarManage.seminarName)!"")?html}" readonly/>
				</div>
			</div>
			<div class="span6">
				<div class="span4">
					<label>主讲人</label>
				</div>
				<div class="span8">
					<input value="${((seminarManage.outerUserId.userName)!"")?html}" readonly/>
				</div>
			</div>
		</div>
	</div>
<#-->	
	<div class="formSep">
		<div class="row-fluid">
			<div class="span6">
				<div class="span4">
					<label>讲座主题</label>
				</div>
				<div class="span8">
					<textarea rows="5" cols="12" style="width: 595px; height: 37px;" readonly>${((seminarManage.seminarTheme)!"")?html}</textarea>
				</div>
			</div>
		</div>
	</div>
<-->	
	<div class="formSep">
		<div class="row-fluid">
			<div class="span6">
				<div class="span4">
					<label>讲座时间</label>
				</div>
				<div class="span8">
					<input value="${((seminarManage.seminarDate?string("yyyy-MM-dd HH:mm"))!"")?html}" readonly/>
				</div>
			</div>
			<div class="span6">
				<div class="span4">
					<label>讲座地点</label>
				</div>
				<div class="span8">
					<input value="${((seminarManage.appointPlace)!"")?html}" readonly/>
				</div>
			</div>
		</div>
	</div>
	
	<div class="formSep">
		<div class="row-fluid">
			<div class="span6">
				<div class="span4">
					<label>讲座人数</label>
				</div>
				<div class="span8">
					<input value="${((seminarManage.attendNum)!"")?html}" readonly/>
				</div>
			</div>
		</div>
	</div>
	<div class="formSep">
		<div class="row-fluid">
			<div class="span6">
				<div class="span4">
					<label>备注</label>
				</div>
				<div class="span8">
					<textarea rows="5" cols="12" style="width: 608px; height: 125px;" readonly>${(seminarManage.comment)!""}</textarea>
				</div>
			</div>
		</div>
	</div>
	<div class="formSep">
		<div class="row-fluid">
			<div class="span12">
				<div class="span2">
					<label>资料附件</label>
				</div>
				<div class="span9">
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
<h3 class="heading">预约信息</h3>
<div class="formSep">
		<div class="row-fluid">
			<div class="span6">
				<div class="span4">
					<label>预约学院</label>
				</div>
				<div class="span8">
					<input id="appointAcademy.id" name="appointAcademy.id" value="<#if ss?? && ss.appointAcademy??>${(ss.appointAcademy.id!"")?html}</#if>" type="hidden" />
					<input value="<#if subscribeInfo?? && subscribeInfo.appointAcademy??>${(subscribeInfo.appointAcademy.name!"")?html}</#if>"readonly/>
				</div>
			</div>
			<div class="span6">
				<div class="span4">
					<span class="formTitle">预约地点<span class="formRed">*</span></span>
				</div>
				<div class="span8">
					<input id="appointPlace" name="appointPlace" value="${((seminarManage.appointPlace)!"")?html}" />
				</div>
			</div>
		</div>
	</div>
	
	<div class="formSep">
		<div class="row-fluid">
			<div class="span6">
				<div class="span4">
					<span class="formTitle">预约日期<span class="formRed">*</span></span>
				</div>
				<div class="span8">
					<input id="appointTime" name="appointTime" class="Wdate" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',skin:'whyGreen'});" value="${((seminarManage.seminarDate?string("yyyy-MM-dd"))!"")?html}" />
				</div>
			</div>
			<div class="span6">
				<div class="span4">
					<span class="formTitle">起止时间<span class="formRed">*</span></span>
				</div>
				<div class="span8">
					<input name="beginDate" id="beginDate" class="Wdate span5" style="float:left; margin-right:5px;" onclick="WdatePicker({dateFmt:'HH:mm',maxDate:'#F{$dp.$D(\'endDate\')}', skin:'whyGreen', el:$dp.$('beginDate')});"value="${(seminarManage.beginDate)!""}"/>
					<span>至</span>
					<input name="endDate" id="endDate" class="Wdate span5" style="margin-left:5px;" onclick="WdatePicker({dateFmt:'HH:mm', minDate:'#F{$dp.$D(\'beginDate\')}', skin:'whyGreen', el:$dp.$('endDate')});"value="${(seminarManage.endDate)!""}"/>
				</div>
			</div>
		</div>
	</div>
	<div class="formSep">
		<div class="row-fluid">
			<div class="span6">
				<div class="span4">
					<span class="formTitle">预约人数<span class="formRed">*</span></span>
				</div>
				<div class="span8">
					<input id="appointNum" name="appointNum" value="${((seminarManage.attendNum)!"")?html}"  />
				</div>
			</div>
			<div class="span6">
				<div class="span4">
					<span class="formTitle">预约人</span>
				</div>
				<div class="span8">
					<input id="appointUserId" name="appointUserId.name" value="${((subscribeInfo.appointUserId.name)!"")?html}"  readonly/>
				</div>
			</div>
		</div>
	</div>
	
	<div class="formSep">
		<div class="row-fluid">
			<div class="span6">
				<div class="span4">
					<span class="formTitle">电话<span class="formRed">*</span></span>
				</div>
				<div class="span8">
					<input id="appointPhone" name="appointPhone" value="${((subscribeInfo.appointPhone)!"")?html}"  />
				</div>
			</div>
			<div class="span6">
				<div class="span4">
					<span class="formTitle">邮箱<span class="formRed">*</span></span>
				</div>
				<div class="span8">
					<input id="appointEmail" name="appointEmail" value="${((subscribeInfo.appointEmail)!"")?html}"  />
				</div>
			</div>
		</div>
	</div>
	
	<div class="formSep">
		<div class="row-fluid">
			<div class="span6">
				<div class="span4">
					<span class="formTitle">QQ号码<span class="formRed">*</span></span>
				</div>
				<div class="span8">
					<input id="appointQQ" name="appointQQ" value="${((subscribeInfo.appointQQ)!"")?html}"  />
				</div>
			</div>
		</div>
	</div>
	
</form>
<script>
function confirm() {
	if(myValidator.form()){
		comp.confirm("确认要预约吗？", function(result) {
			if(!result) {
				return;
			}
		var id = $('#params').val();
		var appointTime = $('#appointTime').val();
		var beginDate = $('#beginDate').val();
		var endDate = $('#endDate').val();
		var appointNum = $('#appointNum').val();
		var appointPlace = $('#appointPlace').val();
		var appointEmail = $('#appointEmail').val();
		var appointPhone = $('#appointPhone').val();
		var appointQQ = $('#appointQQ').val();
			$.post(
				"${rc.contextPath}/training/subscribe/opt-sub/subscribeInfo.do",
				{seminarId:id,appointPlace:appointPlace,appointNum:appointNum,appointTime:appointTime,beginDate:beginDate,endDate:endDate,
				appointEmail:appointEmail,appointPhone:appointPhone,appointQQ:appointQQ},
				function(data) {
					window.location.href="${rc.contextPath}/training/subscribe/opt-query/querySubscribeInfoPage.do";
				},
				"text"
			);
		});
	}
}


//数据校验
var myValidator;
$("document").ready(function() {
	myValidator = $("#seminarSubscribeConfirm").compValidate({
		rules:{
			appointTime:{required:true},
			beginDate:{required:true},
			endDate:{required:true},
			appointPlace:{required:true,maxlength:32},
			appointEmail:{required:true,email:true,maxlength:32},
			appointPhone:{required:true,phoneCheck:true,maxlength:32},
			appointQQ:{required:true,isNumber:true,maxlength:32},
			appointNum:{required:true, isNumber:true}
		},
		messages:{
			appointTime:{required:'讲座日期不能为空！'},
			beginDate:{required:'讲座开始时间不能为空！'},
			endDate:{required:'讲座结束时间不能为空！'},
			appointPlace:{required:'讲座地点不能为空！',maxlength:'最多只能输入32字！'},
			appointEmail:{email:'邮箱格式不正确',maxlength:'最多只能输入32字'},
			appointPhone:{maxlength:'最多只能输入32字'},
			appointQQ:{isNumber:'请输入合法数字！',maxlength:'最多只能输入32字'},
			appointNum:{required:'参与人数不能为空！', isNumber:'请输入合法数字！'}
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
</script>