<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="${rc.contextPath}/css/bdp_comp.css" type="text/css" />
	<script src="${rc.contextPath}/js/jquery.metadata.js"></script>
	<script src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script>
	<script src="${rc.contextPath}/js/myjs_message_cn.js"></script>
	<script src="${rc.contextPath}/lib/sticky/sticky.min.js"></script>
	<script src="${rc.contextPath}/js/jquery.form.js"></script>
    <script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
</head>
<body>
<div id="contentwrapper">
	<div class="main_content">
		<div class="row-fluid">
			<div class="row-fluid">
		   		 <div class="span12">
			    	<h3 class="heading">
						党团关系维护
					</h3>
		    	</div>
	    	</div>
			<input name="check_error" id="check_error" type="hidden" value="true"/>
			<input name="deptId" id="deptId" type="hidden" value="${deptId!""}"/>
			<form id="caucusEdit" action="" method="post">
				<div class="formSep">
					<div class="row-fluid">
						<div class="span5">
							<div class="span3">
								<span class="formTitle">办理状态<span class="f_req">*</span></span>
							</div>
							<div class="span9">
								<#if handleStatus??>
									<#list handleStatus as hs>
										<#if (po.handleStatus)?? && po.handleStatus.id==hs.id >
											<label class="radio inline">
												<input type="radio" id="handleStatus" name="handleStatusCode" checked="checked" value="${(hs.code)!""}" />${hs.name?html}
											</label>
										<#else>
											<label class="radio inline">
												<input type="radio" id="handleStatus" name="handleStatusCode" value="${(hs.code)!""}" />${hs.name?html}
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
						<div class="span5">
							<div class="span3">
								<label>学生<span class="f_req">*</span></label>
							</div>
							<div class="span9">
								<input id="_stuIds" name="stuIds" type="hidden" class="span6" value="${(stuIds!"")?html}"/>
								<textarea name="stuNames" id="_stuNames" cols="12" rows="5" class="span10" readonly>${(stuNames!"")?html}</textarea>
								<button class="btn btn-info" type="button" onclick="selectStudentCheck()">选择</button>
							</div>
						</div>
					</div>
				</div>
			</form>
			<input name="check_error" id="check_error" type="hidden" value="true"/>
			<div class="row-fluid">
				<div class="span5">
					<div class="row-fluid">
						<div class="span3"></div>
						<div class="span9" style="padding:10px 0px 0px 0px">
							<button class="btn btn-info" type="button" onclick="saveInfo('1')">确 定</button>
							<button class="btn" type="button" onclick="javascript:window.history.back(-1);">取 消</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<#-- 学生选择多选组件的引入-->
<#include "/comp/student/queryGraduateStudentCheckBoxModal.ftl"> 
<#---脚本开始----->
<script>
//业务存储
function saveInfo() {
	var studentId = $('#_stuIds').val();
	if(myValidator.form()) {
		if(studentId=="") {
			comp.message("请选择学生！");
			return false;
		}
		$("#caucusEdit").attr("action", "${rc.contextPath}/leave/caucus/opt-save/saveCaucusHandleInfo.do");
		$("#caucusEdit").attr("method", "post");
		$("#caucusEdit").submit();
	}
}

//选择学生
function selectStudentCheck(){
	_queryStudentCheckAll($("#_stuIds").val());
}
function setMultiEduClassSelectValue(studentIds,names) {
	$("#_stuIds").val(studentIds);		
	$("#_stuNames").html(names);	
}

//数据校验
var myValidator;
$("document").ready(function() {
	myValidator = $("#caucusEdit").compValidate({
		rules:{
			handleStatusCode:{required:true}
		},
		messages:{
			handleStatusCode:{required:'办理状态不能为空！'}
		}
	});
});
</script>
<#--脚本结束--->
</body>
</html>