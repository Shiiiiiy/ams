<html>
 <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
    <script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
    <!-- animated progressbars -->
    <script src="${rc.contextPath}/js/bdp_fileupload.progressbar.js"></script>
    <script src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script> 
    <script src="${rc.contextPath}/js/apw/apw_check.js"></script> 
    <script src="${rc.contextPath}/js/common/common_approve.js"></script>
    
    <script>
    //返回到查询信息页面
    function goToView(){
    window.location.href="${rc.contextPath}/student/manage/opt-query/listApproveStudent.do";
    }
    var myValidator;
     //声明验证对象
   $(document).ready(function(){
		myValidator=$(".form_validation_reg").compValidate({
				rules:{
					approveReason:{required:true,maxlength:200}
				},
				messages:{
					approveReason:{required:'审批意见不能为空',maxlength:'审批意见太长【默认不超过200字符】'}
				}
		 });
    });
	
	//表单提交
	function doApprove(approveKey){
		if("PASS"==approveKey){
				fillDefaltMessage("通过");
				if(myValidator.form()){
					if(confirm("确定要通过？")){
						if(apw.isFinalTask($("#id").val())){//最后一个节点审批
							apw.approveCurProcess("SINGLE",$("#id").val(),"","PASS",$("#approveReason").val());
						}else{//中间节点审批
							apw.selectNextApprover($("#id").val(),approveKey,"STUDENT_INFO_UPDATE_APPROVE",$("#approveReason").val());
						}
					}else{ return; }
				}
			}else if("NOT_PASS"==approveKey){
				fillDefaltMessage("不通过");
				if(myValidator.form()){
					if(confirm("确定要拒绝？")){
						apw.approveCurProcess("SINGLE",$("#id").val(),"NOT_PASS",$("#approveReason").val());
					}else{ return; }
				}	
			}else if("REJECT"==approveKey){
				fillDefaltMessage("驳回");
				if(myValidator.form()){
					if(confirm("确定要驳回？")){
						apw.approveCurProcess("SINGLE",$("#id").val(),'',"REJECT",$("#approveReason").val());
					}else{ return; }
				}
			}
	}
	
    
	/**
	  * 为审批意见默认赋值
	  */
	function fillDefaltMessage(defultMsg){
	    var curMsg = $.trim($("#approveReason").val());
		if(comp.isNull(curMsg)){
			$("#approveReason").val(defultMsg);
		}
	}
	
	//执行业务系统操作
	function doAmsAction(userId,approveKey,approveStatus,processStatusCode){
		$.ajax({
					url:"${rc.contextPath}/student/manage/opt-add/saveApproveAction.do",
					async:false,
					cache:false,
					type:'POST',
					data:{nextApproverId:userId,objectId:$("#id").val(),approveStatus:approveStatus,processStatusCode:processStatusCode},
					success: function(data){
						var parsedJson = jQuery.parseJSON(data); 
						if(parsedJson.resultFlag=="success"){
						    comp.message("当前流程审批已操作完成!","info");
						}else if(parsedJson.resultFlag=="deprecated"){
							comp.message("审批流已废弃 !","error");
						}else if(parsedJson.resultFlag=="error"){
							comp.message("系统异常，请联系管理员 !","error");
						}
			   		}
			 }); 
			//window.location.href="${rc.contextPath}/student/manage/opt-query/listApproveStudent.do"; 
	        $('#studentUpdateApproveForm').submit();
	}
	//审核历史
	//function showApproveCommnets(){
		//参数为objectId
		//var id=$("#id").val();
		//approve.showApproveComments(id);
	//}
 </script>
 </head>
<body>
<div id="contentwrapper">
    <div class="main_content">   
        <div class="row-fluid">	
        <div class="row-fluid">	
	    <div class="span12">
	      <h3 class="heading">
			学生更新信息审核
		  </h3>
		  </div>
		 </div>
		 <input name="errorText" id="errorText" type="hidden" value="${errorText!""}"/>
		 <form  id="studentUpdateApproveForm" class="form_validation_reg" action="${rc.contextPath}/student/manage/opt-save/saveApproveReason.do" method="post"><@token/>	
				<input id="id" type="hidden" name="id"  value="${(studentInfo.id)!""}">
				<div class="span12">	
				    <#include "/integrate/student/studentEdit/disStudentInfo.ftl">
				    <div class="formSep">
					    <div class="row-fluid">
							<div class="span9">
								<label class="span2">审核意见</label>
								<textarea rows="5" cols="12" class="span9" id="approveReason" name="approveReason" maxlength="200"></textarea>
						    </div>
				        </div>
			        </div> 
				</div>
			</form>  
			<br/>
			<div class="span12">
	           <div class="span9" style="padding-top:10px;">
	              <div class="span2"></div>
		            <!--判断是通过还是拒绝保存=0   提交=1 -->
				    <button class="btn btn-info" type="button" id="save-pass" onclick="doApprove('PASS')">通 过</button>
				    <button class="btn btn-info" type="button" id="save-refuse" onclick="doApprove('REJECT')">拒 绝</button>
				    <button class="btn btn-info" type="button" onclick="approve.showHis('${(studentInfo.id)!""}')">审核历史</button>
					<button class="btn" type="button" onclick="goToView()">返 回</button>
				</div>
					<input name="check_error" id="check_error" type="hidden" value="true"/>
				</div>
			</div>
	  </div>
        <#-- 审核选人弹出框 -->        
        <#include "/apw/instance/approvers.ftl"/>
        <#-- 审核历史查看 -->
        <#include "/apw/instance/approveHistory.ftl">	 
</body>
</html>
