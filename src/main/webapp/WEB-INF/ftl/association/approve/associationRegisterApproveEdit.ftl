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
						注册社团申请审核
			   		</h3>
			  	</div>
			 </div> 
    		  <div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span2"><label>社团名称 </label></div>
							<div class="span10">
								<input id="associationName" class="apan8" readonly name="orignAssociationName" <#if applyModel??>value="${(applyModel.orignAssociationName!"")?html}"</#if>/>
							</div>
						</div>
						<div class="span6">
							<div class="span2"><label>申请时间</label></div>
                            <div class="span10">
	                            <input id="applyTime" name="applyDate" class="Wdate span5" readonly style="cursor:pointer" onclick="WdatePicker({skin:'whyGreen'});"
									<#if applyModel.applyDate?? >value="${(applyModel.applyDate!"")?string('yyyy-MM-dd')}"</#if>/>						
							</div>
						</div>
					</div>
				</div>
                <div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span2"><label>社团类型</label></div>
							<div class="span10">
							<select size="1" id="associationType" name="orignAssociationType.id" disabled aria-controls="dt_gal">
								<option value="">${applyModel.orignAssociationType.name}</option>
							</select>
							</div>
						</div>
						<div class="span6">
							<div class="span2"><label>所属学院</label></div>
							<div class="span10">
							<select size="1" id="collegeId" name="college.id" class="span5" disabled aria-controls="dt_gal">
								<option value="">${applyModel.college.name!""}</option>
							</select>
							</div>	
                        </div>
		            </div>
		        </div>
	            <div class="formSep">
					<div class="row-fluid">
					<div class="span12">
						<div class="span1"><label>社团宗旨组织模式经费来源</label></div>
						<div class="span8">
							<textarea cols="120" rows="6" readonly name="associationAim" class="span12"><#if applyModel?? >${(applyModel.associationAim!"")?html}</#if></textarea>
	                    </div>
            		 </div>
        		  </div>
				</div>
		           
		         
	           	 <div class="formSep">
					<div class="row-fluid">
						<div class="span6">
								<div class="span2"><label>缴费金额</label></div>
								<div class="span10">
									<input id="associationFee" class="span3" readonly name="associationFee" value="<#if applyModel??>${(applyModel.associationFee!"")?html}<#else>0</#if>"/>(单位:元, 0为不需要缴费)
		                     	</div>
	                     	</div>
	                    	
	                    </div>
	            	</div>
	            	
	            	<div class="formSep">
						<div class="row-fluid">
							 <div class="span6 ">
								<div class="span2"><label>社团性质</label></div>
								<div  class="span10">
									<#if associationKind ??>
										<#list associationKind as c>
										<label class="radio inline">
											<input type="radio" id="isMajor_" disabled value="${c.id!""}"  name="orignIsMajor.id" <#if applyModel?? && applyModel.orignIsMajor?? && applyModel.orignIsMajor.id == c.id> checked</#if>/>
											${c.name!""}
										</label>
										</#list>
									</#if>
								</div>
		                    </div>
							<div class="span6">
								<div class="span2"><label>开放范围</label></div>
								<div class="span10">
								<#if openScope ??>
									<#list openScope as c>
									<label class="radio inline"  style="padding-bottom:10px;">
										<input type="radio" disabled id="isMajor_"  value="${c.id!""}"  name="openScope.id" <#if applyModel?? && applyModel.openScope?? && applyModel.openScope.id == c.id> checked</#if>/>
										${c.name!""}
									</label>
									</#list>
								</#if>
								</div>
	                   		</div>
	            		</div>
					</div>
					
					<div class="formSep" id="selectedMajors" <#if !applyModel?? || !applyModel.openScope ?? || applyModel.openScope.id == allScope.id  >style="display:none"</#if>>
						<div class="row-fluid">
							<div class="span12">
								<div class="span1"><label>所选专业<span class="f_req"></span></label></div>
								<div class="span8">
					            	<input type="hidden" id="majorIds" name="majorId" value="${applyModel.majorId!""}">
									<textarea cols="80" rows="5" id="majorNames" name="majorName" class="span12" readonly>${applyModel.majorName!""}</textarea>
			                    </div>
			            	</div>
		            	 </div>
					</div>	
	            	
		            <div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span2"><label>指导老师</label></div>
								<div class="span10">
									<#if advisorList??>
										<#list advisorList as advisor>
											<label>${advisor.advisorPo.name!""} <a href="javascript:void(0);" onclick="viewAdvisorDetail('${advisor.id!""}','${advisor.associationApplyModel.id!""}','${advisor.advisorPo.id!""}');">[查看简介]</a></label>
										</#list>
									</#if>
			                    </div>
                            </div>
                        </div>
					</div>
					
					<div class="formSep">
						<div class="row-fluid">
							<div class="span12">
								<div class="span1"><label>成员</label></div>
			                    <div class="span8">
			                    	<label><a href="javascript:void(0);" onclick="viewMember('${applyModel.id!""}');">[注册成员查看]</a></label>
			                    	<#--<#include "/association/memberSelectedList.ftl"/>-->
			                    </div>
			            	</div>
		            	</div>
		            </div>
				
				   <div class="formSep">
						<div class="row-fluid">
					   		<div class="span12">
								<div class="span1"><label>附件</label></div>
								<div class="span8" id="_upload_div">
										 <#if fileList??>	
											<#list fileList as p>
												<div class="fileupload-info">
													<a href="${rc.contextPath}/sys/sysConfig/file.do?id=${(p.uploadFile.id)?html}"><strong>${(p.uploadFile.name)?html}&nbsp;(${(p.uploadFile.fileSize)?html})</strong></a>
													<input type="hidden" id="applyFileId" name="applyFileId" value="${(p.uploadFile.id)?html}"/>	
												</div>					
											</#list>
										 </#if> 
									 </form>	
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
	  function viewAdvisorDetail(id,applyId,teacherId){
	  		$("#view_title").html("指导老师简介");
	  		comp.showModal("view_id","680px","-250px 0 0 -300px");
			$("#view_body").load("${rc.contextPath}/association/apply/nsm/viewAdvisor.do?id="+id+"&applyId="+applyId+"&teacherId="+teacherId);
	  }
	  
	  // 社员信息查看
	 function viewMember(id){
	 		$("#view_title").html("社团注册成员列表");
	 		comp.showModal("view_id","800px","-250px 0 0 -350px");
			$("#view_body").load("${rc.contextPath}/association/apply/nsm/viewRegisterMember.do?id="+id);
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
						var isFinalTask = apw.isFinalTask($("#applyId").val());
						if(isFinalTask){//最后一个节点审批
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