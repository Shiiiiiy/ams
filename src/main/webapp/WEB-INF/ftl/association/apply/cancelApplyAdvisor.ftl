<html>
 <head>
 <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
    <!-- ajax form-->
	<script src="${rc.contextPath}/js/jquery.form.js"></script>
	<script src="${rc.contextPath}/js/common/common_approve.js"></script>
	<script src="${rc.contextPath}/js/apw/apw_check.js"></script>
</head>
<body>
<div id="contentwrapper">
    <div class="main_content">
        <div class="row-fluid">
        	<div class="row-fluid">
		   		<div class="span12">
		      		<h3 class="heading">社团注销申请</h3>
			  	</div>
			 </div> 
		 	<#include "/association/apply/applyNoramlView.ftl"/>	
			 <div class="formSep">
					<div class="row-fluid">
						<div class="span12">
						<div class="span1"><label>注销原因</label></div>
						<div class="span8">
							<textarea cols="80" rows="6" readonly name="applyReason" class="span12">${(applyModel.applyReason!"")?html}</textarea>
	                    </div>
	            	 </div>
				</div>
			</div>
            <div class="formSep">
					<div class="row-fluid">
						<div class="span12">
						<div class="span1"><label>财务清算</label></div>
						<div class="span8">
							<textarea cols="80" rows="6" readonly name="financialComments" class="span12">${(applyModel.financialComments!"")?html}</textarea>
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
		          <form  id="cancelApplyAdvisorForm" class="form_validation_reg" action="${rc.contextPath}/association/apply/opt-save/advisorSaveApplyInfo.do" method="post">	
					  <input name="check_error" id="check_error" type="hidden" value="true"/> 
					  <input id="id" type="hidden" name="id"  value="${(advisor.id)!""}">
					  <input id="applyId" type="hidden" name="associationApplyModel.id"  value="${(applyModel.id)!""}"> 
				  </form>	
		        	<br/>
		        	<div class="row-fluid">
						<div class="span12">
						<div class="span1"></div>
			        	<div class="span9">
			                <input class="btn btn-info"  type="button" onclick="onSub()" value="提交"/>
			                <input class="btn" type="button" onclick="onCancel()" value="取消"/>
			        	</div>	
		        	</div>	
	 	</div>
	 </div> 
	 <#include "/apw/instance/approvers.ftl"/>
</div>


<#--查看 -->
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
 
  
	 function onSub(){
	       if(confirm("提交后不可修改，确认提交?")){
		    $.ajax({
					url: "${rc.contextPath}/association/apply/opt-query/checkSubmitApplyInfo.do",
					async:false,
					cache:false,
					type:"POST",
					data:{advisorId:"",applyId:$("#applyId").val(),comments:""},
				    success: function(data){
				     if(data =="success")
			        {
			          apw.selectNextApprover($("#applyId").val(),"INIT","ASSOCIATION_APPLY_APPROVE",null);
			        }else{
			          saveAdvisorInfo();	
			        }
				}
		   });
	    }
	  } 
	
	  /**
	   * 执行指导老师提交操作
	   */
	 function saveAdvisorInfo(){
    	$.ajax({
			url: "${rc.contextPath}/association/apply/opt-save/advisorSubmitApplyInfo.do",
			async:false,
			cache:false,
			type:"POST",
			data:$('#cancelApplyAdvisorForm').serialize(),
		    success: function(data){
		       if(data =="success")
		       {
		          window.location.href="${rc.contextPath}/association/apply/opt-query/getAssociationApplyList.do";	
		       }
			}
	    });
	 }
	 
	 //获取选择的下一节点办理人
	function _getApprover()
	{
		var nextApproverId = $("input[name='approverId']:checked").val();
		var approveType = $("#apwApproveType").val();
		if(comp.isNull(nextApproverId)){
			apw.rollbackInstance($("#apwObjectId").val(),$("#curProcessKey").val(),"请选择待办人");		
		}else{
			comp.hideModal("_selectApprover");
			if("MUL"==approveType){
				var selectedRadioIndex = $("#selectedRadioIndex").val();
				apw.saveCurMulAction(selectedRadioIndex,approveType,$("#apwObjectId").val(),nextApproverId,$("#approveKey").val(),
																 $("approveStatus").val(),$("processStatusCode").val(),$("#apwSuggest").val());
			}else if("SINGLE"==approveType){
				apw.saveCurSingleAction(approveType,$("#apwObjectId").val(),nextApproverId,$("#approveKey").val(),$("#apwSuggest").val());
				saveAdvisorInfo();
			}
			mask.showShade();
		}
	}
	 
	   /*
	 * 初始化当前发起流程【doInitAction方法名不可修改】
	 */
    function doInitAction(objectId,userId){
        var url = "${rc.contextPath}/association/apply/opt-init/initCurrentProcess.do";
		apw.initCurProcess(url,objectId,userId);
	}
	
    //执行业务系统的操作
    function doAmsAction(userId,approveKey,approveStatus,processStatusCode,suggest){
       window.location.href="${rc.contextPath}/association/apply/opt-query/getAssociationApplyList.do";	
    }
</script>

</body>
</html>