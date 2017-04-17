<html>
 <head>
 <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
   <link rel="stylesheet" href="${rc.contextPath}/lib/jquery-ui/css/Aristo/Aristo.css" />
    <script src="${rc.contextPath}/lib/jquery-ui/jquery-ui-1.8.20.custom.min.js"></script>
    <script src="${rc.contextPath}/js/jquery.form.js"></script>
	<script src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script>
    <script src="${rc.contextPath}/js/apw/apw_check.js"></script>
    <script src="${rc.contextPath}/js/common/common_approve.js"></script>
<script>
var myValidator;
$("document").ready(function(){
    myValidator = $("#approveEditForm").compValidate({
		rules:{
						'suggest': {required:true,maxlength:200}
		},
		messages:{
						'suggest': {required:'审批意见不可为空 !',maxlength:"最大可输入200字"}
		}
	 });
});
</script>
</head>
<body>
<div id="contentwrapper">
    <div class="main_content">
        <div class="row-fluid">
        	<div class="row-fluid">
		   		<div class="span12">
		      		<h3 class="heading">
						注销社团申请审核
			   		</h3>
			  	</div>
			 </div> 	
    		<#include "/association/apply/applyNoramlView.ftl"/>	
			 <div class="formSep">
					<div class="row-fluid">
						<div class="span12">
						<div class="span1"><label>注销原因</label></div>
						<div class="span8">
							<textarea cols="80" rows="6" readonly name="applyReason" class="span12">${(applyModel.applyReason)!""}</textarea>
	                    </div>
	            	 </div>
				</div>
			</div>
            <div class="formSep">
					<div class="row-fluid">
						<div class="span12">
						<div class="span1"><label>财务清算</label></div>
						<div class="span8">
							<textarea cols="80" rows="6" readonly name="financialComments" class="span12">${(applyModel.financialComments)!""}</textarea>
	                    </div>
	            	 </div> 
	               </div>
				</div>

				<div class="formSep">
						<div class="row-fluid">
							 <div class="span12">
								<div class="span1"><label>附件</label> </div>
								<div class="span8" id="_finance_upload_div">
									 <#if fileList??>	
										<#list fileList as p>
											<div class="fileupload-info">
												<a href="${rc.contextPath}/sys/sysConfig/file.do?id=${(p.uploadFile.id)?html}"><strong>${(p.uploadFile.name)?html}&nbsp;(${(p.uploadFile.fileSize)?html})</strong></a>
												<input type="hidden" id="financeFileId" name="financeFileId" value="${(p.uploadFile.id)?html}"/>	
											</div>					
										</#list>
									 </#if> 
								</div>
					   		</div>
		            	</div>
		            </div>	
		            <div class="formSep">
						<div class="row-fluid">
							<form id="approveEditForm" method="post" >
								<div class="span12">
									<div class="span1"><label>审批意见<span class="f_req">*</span></label></div>
									<div class="span8">
						    			<#-- 主键id -->
			    						<input id="applyId" type="hidden" name="associationApplyModel.id"  value="${(applyModel.id)!""}">   
									    <input id="applyType" type="hidden" name="applyType"  value="${(applyType)!""}">   
										<textarea cols="80" rows="6" id="approveMessage" name="suggest" class="span12"></textarea>
				                    	<font size="1" color="grey"  style="vertical-align:bottom; padding-bottom:10px">(不超过200字)</font>
				                    </div>
			                     </div>
							</form>
			            </div>
	            	 </div>
	            	 	
	            	 	<br/>
						<div class="row-fluid">
							<div class="span1"></div>
				        	<div class="span8">
							    	<button class="btn btn-info" type="button" id="save-pass" onclick="doApprove('PASS')">通 过</button>
							    	<button class="btn btn-info" type="button" id="save-refuse" onclick="doApprove('REJECT')">拒 绝</button>
					  				<button class="btn btn-info" type="button" onclick="approve.showHis('${(applyModel.id)!""}');">审批历史</button>
						            <button class="btn" type="button" onclick="goToView()">取消</button>
					        </div>
			           
					</div>
		<#-- 选人控件 -->
		<#include "/apw/instance/approvers.ftl"/>
		</div>
    </div>
</div>
#--查看 -->
<div class="modal hide fade" id="view_id">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3 id="view_title"></h3>
	</div>
	<div class="modal-body" id="view_body">
		
	</div>
	<div class="modal-footer">
		<a href="#" class="btn" data-dismiss="modal">关闭</a>
	</div>
</div>

<script>

      // 指导老师简介查看
	  function viewAdvisorDetail(id){
	  		$("#view_title").html("指导老师简介");
	  		comp.showModal("view_id","680px","-250px 0 0 -300px");
			$("#view_body").load("${rc.contextPath}/association/apply/nsm/viewAdvisor.do?id="+id);
	  }
  
	  // 社员信息查看
	 function viewMember(id){
	 		$("#view_title").html("社团成员列表");
	 		comp.showModal("view_id","800px","-250px 0 0 -350px");
			$("#view_body").load("${rc.contextPath}/association/apply/nsm/viewMember.do?id="+id);
	 }


	/**
	  * 为审批意见默认赋值
	  */
	function fillDefaltMessage(defultMsg){
	    var curMsg = $.trim($("#approveMessage").val());
		if(comp.isNull(curMsg)){
			$("#approveMessage").val(defultMsg);
		}
	}
	
	function clearApproveMessage(){
		var curMsg = $.trim($("#approveMessage").val());
		if(curMsg=="通过" || curMsg=="驳回" || curMsg=="不通过"){
			$("#approveMessage").val("");
		}
	}
    
	//表单提交
	function doApprove(approveKey){
			if("PASS"==approveKey){
				fillDefaltMessage("通过");
				if(myValidator.form()){
					if(confirm("确定要通过？")){
						if(apw.isFinalTask($("#applyId").val())){//最后一个节点审批
							apw.approveCurProcess("SINGLE",$("#applyId").val(),'',"PASS",$("#approveMessage").val());
						}else{//中间节点审批
							apw.selectNextApprover($("#applyId").val(),approveKey,"ASSOCIATION_APPLY_APPROVE",$("#approveMessage").val());
						}
					}else{clearApproveMessage()}
				}
			}else if("NOT_PASS"==approveKey){
				fillDefaltMessage("不通过");
				if(myValidator.form()){
					if(confirm("确定要不通过？")){
						apw.approveCurProcess("SINGLE",$("#applyId").val(),'',"NOT_PASS",$("#approveMessage").val());
					}else{clearApproveMessage()}
				}
			}else if("REJECT"==approveKey){
				fillDefaltMessage("驳回");
				if(myValidator.form()){
					if(confirm("确定要驳回？")){
						apw.approveCurProcess("SINGLE",$("#applyId").val(),'',"REJECT",$("#approveMessage").val());
					}else{clearApproveMessage()}
				}
			}
	}
			
	//执行业务系统操作
	function doAmsAction(userId,approveKey,approveStatus,processStatusCode){
		$("#approveEditForm").attr("action","${rc.contextPath}/association/approve/opt-apporve/approveAssociationApply.do?objectId="+
																					 $("#applyId").val()+"&nextApproverId="+userId+"&approveStatus="+approveStatus+
																					 "&processStatusCode="+processStatusCode+"&approveKey="+approveKey+"&applyType="+$("#applyType").val()).submit();
	}
			
    //返回到查询信息页面
    function goToView(){
    	window.location.href="${rc.contextPath}/association/approve/opt-query/getAssociationApproveList.do";
    }
    
	function eisdResponse(r,s){
			var obj = eval("("+r+")");
			if(obj.success=="success"){
				if(obj.listType=="LIST_MANAGER"){
					var param = {pageNo:obj.pageNo,objectId:$("#associationId").val(),managerIds:${hiddenManagerIds!"''"},returnFlag:'view'};
					$("#managerViewPage").load("${rc.contextPath}/association/apply/nsm/asynLoadManagerList.do",param,function(){});
				}else if(obj.listType=="LIST_ADVISOR"){
					var param = {pageNo:obj.pageNo,objectId:$("#associationId").val(),teacherIds:${hiddenTeacherIds!"''"},returnFlag:'view'};
					$("#teacherViewPage").load("${rc.contextPath}/association/apply/nsm/asynLoadAdvisorList.do",param,function(){});
				}
			}
	}
</script>
<#-- 审核历史查看 -->
<#include "/apw/instance/approveHistory.ftl">      	
</body>
</html>