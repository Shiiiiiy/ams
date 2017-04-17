<html>
 <head>
	<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
     <!-- jQuery UI theme-->
        <link rel="stylesheet" href="${rc.contextPath}/lib/jquery-ui/css/Aristo/Aristo.css" />
        <script src="${rc.contextPath}/lib/jquery-ui/jquery-ui-1.8.20.custom.min.js"></script>
        <!-- animated progressbars -->
        <script src="${rc.contextPath}/js/bdp_fileupload.progressbar.js"></script>
        <script src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script>
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
		      		<h3 class="heading">社团注册申请</h3>
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
						<div class="span1"><label>个人简介</label><span class="f_req"></span></div>
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
					<div class="span1">&nbsp;</div>
					<div class="span8">
					    <input class="btn btn-info"  type="button" onclick="onSave('0')" value="保存"/>
			            <input class="btn btn-info"  type="button" onclick="onSub('1')" value="提交"/>
			            <input class="btn" type="button" onclick="goToView()" value="取消"/>
		       		</div>	
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
	 
	 //返回到查询信息页面
    function goToView(){
    	window.location.href="${rc.contextPath}/association/apply/opt-query/getAssociationApplyList.do";
    }
	 
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