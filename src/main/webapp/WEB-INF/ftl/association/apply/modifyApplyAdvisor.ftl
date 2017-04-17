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
		      		<h3 class="heading">社团变更维护</h3>
			  	</div>
			 </div> 
			 <#--原社团信息-->
			 <div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span2"><label>社团名称 </label></div>
						<div class="span10">
							<input type="hidden" name="orignAssociationName" value="${applyModel.orignAssociationName!""}"/>
							<input id="orignAssociationName"  readonly  class="span6" name="sssociationName" <#if applyModel??>value="${(applyModel.orignAssociationName!"")?html}"</#if>/>
						</div>
					</div>
					<div class="span6">
						<div class="span2"><label>社团编号</label></div>
		                <div class="span10">
		                   <input id="associationCode" class="span6" readonly name="associationCode" <#if applyModel?? && applyModel.associationPo??>value="${(applyModel.associationPo.associationCode!"")?html}"</#if>/>
						</div>
					</div>
				</div>
			</div>
		    <div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span2"><label>社团类型</label></div>
						<div class="span10">
						<input type="hidden" name="orignAssociationType.id" value="${applyModel.orignAssociationType.id!""}"/>
						<select size="1" id="orignAssociationType" class="span6" name="orignAssociationTypeId" disabled aria-controls="dt_gal">
							<option value="">${applyModel.orignAssociationType.name}</option>
						</select>
						</div>
					</div>
					<div class="span6">
						<div class="span2"><label>所属学院</label></div>
						<div class="span10">
						<input type="hidden" name="college.id" value="${applyModel.college.id!""}"/>
						<select size="1" id="collegeId" name="collegeId" class="span6" disabled aria-controls="dt_gal">
							<option value="">${applyModel.college.name!""}</option>
						</select>
						</div>	
		            </div>
		        </div>
		    </div>
		    	
		    	<div class="formSep">
					<div class="row-fluid">
						 <div class="span6 ">
							<div class="span2"><label>社团性质</label></div>
							<div  class="span10">
								<input type="hidden" id="orignIsMajorId" name="orignIsMajor.id" value="${applyModel.orignIsMajor.id!""}"/>
								<input type="text" id="orignIsMajorName"  class="span6" disabled value="${applyModel.orignIsMajor.name!""}"/>
								<#--
									<#if associationKind ??>
										<#list associationKind as c>
										<label class="radio inline">
											<input type="radio" disabled value="${c.id!""}"  name="orignIsMajor.id" <#if applyModel?? && applyModel.orignIsMajor?? && applyModel.orignIsMajor.id == c.id> checked</#if>/>
											${c.name!""}
										</label>
										</#list>
									</#if>
								-->
							</div>
		                </div>
						<div class="span6">
							<div class="span2"><label>成立时间</label></div>
							<div class="span10">
								<input id="applyTime" class="span6" disabled name="applyTime" <#if applyModel?? && applyModel.associationPo??>value="${(applyModel.associationPo.applyTime!"")?html}"</#if>/>
							</div>
		           		</div>
		    		</div>
				</div>
		    	
		    	<div class="formSep">
					<div class="row-fluid">
						 <div class="span6 ">
							<div class="span2"><label>指导老师</label></div>
							<div  class="span10">
								<input type="hidden" id="orignAdvisorId" name="orignAdvisorId" value="${applyModel.orignAdvisorId!""}"/>
								<input type="text" id="orignAdvisorName" class="span6" disabled name="orignAdvisorName" value="${applyModel.orignAdvisorName!""}"/>
							</div>
		                </div>
						<div class="span6">
							<div class="span2"><label>负责人</label></div>
							<div class="span10">
								<input type="hidden" id="orignManagerId" name="orignManagerId" value="${applyModel.orignManagerId!""}"/>
								<input type="text" id="orignManagerName" disabled class="span6" name="orignManagerName" value="${applyModel.orignManagerName!""}"/>
							</div>
		           		</div>
		    		</div>
				</div>
		    	
		    	<#--变更项目-->
		    	<div class="formSep">
					<div class="row-fluid">
						<div class="span12">
							<div class="span1"><label>变更项目</label></div>
							<div class="span8">
							<#if modifyItemMap??>
								<#list modifyItemMap?keys as key>
									<label class="checkbox inline">
										<input type="checkbox" disabled <#if applyModel?? && applyModel.modifyItem?contains(key)>checked</#if>  name="modifyItem" value="${key!""}" />${modifyItemMap[key]} 
									</label>
								</#list>
							</#if>
		                    </div>
		                </div>
		            </div>
				</div>
		    	
		    	 <div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span2"><label>变更后名称 </label></div>
						<div class="span10">
							<input id="ASSOCIATION_NAME" class="span6" disabled name="changedAssociationName" <#if applyModel??>value="${(applyModel.changedAssociationName!"")?html}"</#if>/>
						</div>
					</div>
					<div class="span6">
						<div class="span2"><label>变更后类型</label></div>
						<div class="span10">
						<select size="1" id="ASSOCIATION_TYPE" disabled  name="changedAssociationType.id" class="span6" disabled aria-controls="dt_gal">
							<#if applyModel ?? && applyModel.changedAssociationType ?? >
								<option selected="selected">${applyModel.changedAssociationType.name}</option>	
							<#else>
								<option value="">请选择..</option>
							</#if>
						</select>
						</div>
					</div>
				</div>
			</div>
		    <div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span2"><label>变更后性质</label></div>
						<div class="span10">
							<input id="OTHERS" disabled name="otherModifyItem"  class="span6" <#if applyModel?? && applyModel.changedIsMajor??>value="${(applyModel.changedIsMajor.name!"")?html}"</#if>/>
						</div>
					</div>
					<div class="span6">
						<div class="span2"><label>其他变更</label></div>
						<div class="span10">
							<input id="OTHERS" disabled name="otherModifyItem"  class="span6" <#if applyModel??>value="${(applyModel.otherModifyItem!"")?html}"</#if>/>
						</div>	
		            </div>
		        </div>
		    </div>
		    	
		        <div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span2"><label>变更指导人</label></div>
							<div class="span10">
								<input type="hidden" id="changedAdvisorId" name="changedAdvisorId" value="${applyModel.changedAdvisorId!""}"/>
								<input type="text" id="ASSOCIATION_ADVISOR" class="span6" disabled name="changedAdvisorName" value="<#if applyModel.changedAdvisorId??>${applyModel.changedAdvisorName!""}</#if>"/>
		                    </div>
		                </div>
						<div class="span6">
							<div class="span2"><label>变更负责人</label></div>
		                    <div class="span10">
								<input type="hidden" id="changedManagerId" name="changedManagerId" value="${applyModel.changedManagerId!""}"/>
								<input type="text" id="ASSOCIATION_MANAGER" class="span6" disabled name="changedManagerName" value="<#if applyModel.changedManagerId??>${applyModel.changedManagerName!""}</#if>"/>
		                    </div>
		            	</div>
	                    </div>
	            	</div>
        	   	<div class="formSep">
					<div class="row-fluid">
		            	<div class="span6">
							<div class="span2"><label>变更时间</label></div>
							<div class="span10">
								<input id="applyDate" class="span6" disabled name="applyDate" <#if applyModel?? && applyModel.applyDate??>value="${(applyModel.applyDate!"")?string("yyyy-MM-dd")}"</#if>/>
							</div>
		           		</div>
		        	</div>
		        </div>
			 <#--变更后的社团信息-->
			 
			 
			 <#--变更材料信息-->
			 <div class="formSep">
					<div class="row-fluid">
						<div class="span12">
						<div class="span1"><label>变更原因</label></div>
						<div class="span8">
							<textarea cols="80" rows="6" name="applyReason" disabled class="span12">${(applyModel.applyReason!"")?html}</textarea>
	                    </div>
	            	 </div>
				</div>
			</div>

				<div class="formSep">
						<div class="row-fluid">
							 <div class="span12">
								<div class="span1"><label>变更附件</label> </div>
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
			       <form  id="associationAdvisorForm" class="form_validation_reg" action="${rc.contextPath}/association/apply/opt-save/advisorSaveApplyInfo.do" method="post">	
					  <input name="check_error" id="check_error" type="hidden" value="true"/> 
					  <input id="id" type="hidden" name="id"  value="${(advisor.id)!""}">
					  <input id="applyId" type="hidden" name="associationApplyModel.id"  value="${(applyModel.id)!""}">   
			          <div class="formSep">
					    <div class="row-fluid">
						  <div class="span12">
							<div class="span1"><label>个人简介<span class="f_req">*</span></label></div>
							<div class="span8">
								<textarea cols="120" rows="8" id="comments" name="comments" class="span12">${(advisor.comments)!""}</textarea>
		                    </div>
	            		 </div>
	        		  </div>
					</div>	
				   </form>	
		        	<br/>
		        	<div class="row-fluid">
						<div class="span12">
						<div class="span1"></div>
			        	<div class="span9">
				            <input class="btn btn-info"  type="button" onclick="onSave()" value="保存"/>
				            <input class="btn btn-info"  type="button" onclick="onSub()" value="提交"/>
				            <input class="btn" type="button" onclick="onCancel()" value="取消"/>
			        	</div>	
		        	</div>	
	 	</div>
	 </div> 
	 <#include "/apw/instance/approvers.ftl"/>
</div>

<script>

    var attachFlag;
	$("document").ready(function(){
		//页面校验
		attachFlag = $(".form_validation_reg").compValidate({
			rules:{     
						comments: {required:true,maxlength:1000}
				
				},
				messages:{
					    comments:{required:'个人简介不能为空！',maxlength:'个人简介长度不能超过1000字！'}
				}
		 });
	});
	 
	 
	 /**
	  *指导老师保存
	  */
	  function onSave(status){
	     var check_error=$("#check_error").val();
	     if(check_error == "true"){
                $('#associationAdvisorForm').submit();        
	       }
	   }  
	   
	    function onSub(status){
	    if(attachFlag.form()==true){
	       if(confirm("提交后不可修改，确认提交?")){
		    $.ajax({
					url: "${rc.contextPath}/association/apply/opt-query/checkSubmitApplyInfo.do",
					async:false,
					cache:false,
					type:"POST",
					data:{advisorId:$("#id").val(),applyId:$("#applyId").val(),comments:$("#comments").val()},
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
	  } 
	
	  /**
	   * 执行指导老师提交操作
	   */
	 function saveAdvisorInfo(){
	    if(attachFlag.form()==true){
        	$.ajax({
				url: "${rc.contextPath}/association/apply/opt-save/advisorSubmitApplyInfo.do",
				async:false,
				cache:false,
				type:"POST",
				data:$('#associationAdvisorForm').serialize(),
			    success: function(data){
			       if(data =="success")
			       {
			          window.location.href="${rc.contextPath}/association/apply/opt-query/getAssociationApplyList.do";	
			       }
				}
		   });
	 	}
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