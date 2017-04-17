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
						变更社团申请审核
			   		</h3>
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
			                    	<br><font size="1" color="grey"  style="vertical-align:bottom; padding-bottom:10px">(不超过200字)</font>
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
					</div>
		<#-- 选人控件 -->
		<#include "/apw/instance/approvers.ftl"/>
		</div>
    </div>
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
					var param = {pageNo:obj.pageNo,objectId:$("#associationId").val(),managerIds:$("#hiddenManagerIds").val(),returnFlag:'view'};
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