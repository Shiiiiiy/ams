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
		<script src="${rc.contextPath}/js/apw/apw_check.js"></script>
		<!-- bootstrap-fileupload -->	
		<link rel="stylesheet" href="${rc.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.min.css" />
		<!-- multiselect -->
	    <link rel="stylesheet" href="${rc.contextPath}/lib/multiselect/css/multi-select.css" />
		<script src="${rc.contextPath}/lib/multiselect/js/jquery.multi-select.min.js"></script>	
   		<script src="${rc.contextPath}/js/common/common_approve.js"></script>
    </head>
<body>
<div id="contentwrapper">
 	<div class="main_content">
  		<div class="row-fluid">
    		<div class="row-fluid">
	   			<div class="span12">
	      			<h3 class="heading">
						勤工助学审批
		   			</h3>
		  		</div>
		 	</div> 
		 	<input name="errorText" id="errorText" type="hidden" value="${errorText!""}"/>
		  	<input id="studentId" type="hidden" name="student.id"  value="${(user_key.userId)!''}">
		   	<input id="flags" type="hidden" name="flags"  value="${(flags)!""}">
			<#if workApply??>
		 		<input type="hidden" id="workApplyId" name="workApplyId" value="${(workApply.workApplyId!"")?html}"/>	
			 </#if>
		 	<#if workApplyFile??>
		 		<input type="hidden" id="workApplyFileId" name="workApplyFileId" value="${(workApplyFile.workApplyFileId!"")?html}"/>	
		 	</#if>
		 	<#if schedule??>
		 		<input type="hidden" id="scheduleId" name="scheduleId" value="${(schedule.scheduleId!"")?html}"/>	
			</#if>
		 	<div class="formSep"> 	
		 		<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<lable>学年</lable>
						</div>
						<div class="span9">
							<select  disabled="disabled" size="1"  aria-controls="dt_gal" >
						 		<option value="" />请选择..</option>
								<#if workApplyFile?? && workApplyFile.schoolYear ?? >
								     <option  value="${workApplyFile.schoolYear.name}" selected="selected" />${workApplyFile.schoolYear.name?html}</option>
								</#if>
					    	</select>
						</div>
					</div>
				
					<div class="span6">
						<div class="span3">
							<lable>学期</lable>
						</div>
						<div class="span9">
							<select disabled="disabled" size="1" id="term" name="term.id" aria-controls="dt_gal" class="{required:true}" >
								<option value="" >请选择</option>
								<#if workApplyFile?? && workApplyFile.term?? >
									<option value="${workApplyFile.term.name}"  selected="selected">${workApplyFile.term.name?html}</option>
									<input type="hidden" id="term.id" name="term.id" value="${workApplyFile.term.id}"/>
								</#if>
							</select>
						</div>
					</div>
				</div>
			</div>
			<div class="formSep"> 	
				<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>姓名</label>
						</div>
						<div class="span9">
							<input id="student.name" name="student.name" readOnly <#if workApply?? && workApply.difficultStudentInfo?? > value="${(workApply.difficultStudentInfo.student.name!"")?html}" </#if>/>
						</div>
					</div>
					<div class="span6">
						<div class="span3">
							<label>性别</label>
						</div>
						<div class="span9">
						 	<input  id="sexId" name="genderDic.name" readOnly <#if workApply?? && workApply.difficultStudentInfo?? >value="${workApply.difficultStudentInfo.student.genderDic.name}" </#if>/>
				    		  
						</div>
					 </div>
			  	</div>
		   </div>
		  
		   <div class="formSep"> 
		   		<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>出生年月</label>
						</div>
						<div class="span9">
							<input id="brithDate" name="brithDate" readOnly <#if workApply?? && workApply.difficultStudentInfo?? > value="${(workApply.difficultStudentInfo.student.brithDate!"")?string("yyyy-MM-dd")}"</#if>/>
						</div>
					</div>
					
					<div class="span6">
						<div class="span3">
							<label>身份证号</label>
						</div>
						<div class="span9">
							<input id="certificateCode" name="certificateCode" readOnly  <#if workApply?? && workApply.difficultStudentInfo?? > value="${((workApply.difficultStudentInfo.student.certificateCode)!"")?html}"</#if>/>
						</div>
				 	</div>
			  	</div>
		   </div>
		   
		   <div class="formSep"> 
		   		<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>学院</label>
						</div>
						<div class="span9">
							<input id="college" name="difficultStudentInfo.student.college.name" readOnly  <#if workApply?? && workApply.difficultStudentInfo?? >value="${(workApply.difficultStudentInfo.student.college.name!"")?html}" </#if>/>
						</div>
					</div>
					<div class="span6">
						<div class="span3">
							<label>专业</label>
						</div>
						<div class="span9">
							<input id="college" name="difficultStudentInfo.student.major.majorName" readOnly  <#if workApply?? && workApply.difficultStudentInfo?? >value="${(workApply.difficultStudentInfo.student.major.majorName!"")?html}" </#if>/>
						</div>
					</div>
					
			  	</div>
		  </div>
		   
		  <div class="formSep"> 
		   		<div class="row-fluid">
		   			<div class="span6">
						<div class="span3">
							<label>班级</label>
						</div>
						<div class="span9">
							<input id="className" name="difficultStudentInfo.student.BaseClassModel.className" readOnly  <#if workApply?? && workApply.difficultStudentInfo?? > value="${(workApply.difficultStudentInfo.student.classId.className!"")?html}"</#if>/>
						</div>
					 </div>
					<div class="span6">
						<div class="span3">
							<label>学号</label>
						</div>
						<div class="span9">
							<input id="stuNumber" name="difficultStudentInfo.studnet.stuNumber" readOnly <#if workApply?? && workApply.difficultStudentInfo?? > value="${((workApply.difficultStudentInfo.student.stuNumber)!"")?html}" </#if>/>
						</div>
					</div>
						
				
			  	</div>
		 </div>
		 <div class="formSep"> 
		   		<div class="row-fluid">
		   			<div class="span6">
						<div class="span3">
							<label>困难等级</label>
						</div>
						<div class="span9">
							<input id="difficultLevel" name="difficultStudentInfo.student.difficultLevel" readOnly   <#if workApply?? && workApply.difficultStudentInfo?? > value="${((workApply.difficultStudentInfo.difficultLevel.name)!"")?html}"</#if>/>
						</div>
					 </div>
		   			<div class="span6">
						<div class="span3">
							<label>联系方式<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="phone" name="phone" readOnly <#if workApplyFile?? && workApplyFile.phone??>  value="${((workApplyFile.phone)!"")?html}"</#if>/>
						</div>
					 </div>
					
			  	</div>
		</div>
		<div class="formSep"> 
	    	<div class="row-fluid">
	    		<div class="span6">
					<div class="span3">
						<label>EMAIL</label>
					</div>
					<div class="span9">
						<input id="attachEmail" name="attachEmail"  readOnly <#if workApplyFile?? && workApplyFile.phone??>value="${((workApplyFile.attachEmail)!"")?html}"</#if>/>
					</div>
				</div>
				<div class="span6">
					<div class="span3">
						<label>QQ</label>
					</div>
					<div class="span9">
						<input id="attachQQ" name="attachQQ"  readOnly value="${((workApplyFile.attachQQ)!"")?html}"/>
					</div>
				</div>
				
			 </div>
		</div>  
		<div class="formSep"> 
	   	  <div class="row-fluid">
	  		<div class="span9">
				<div class="span2">
					<label>曾获奖助和奖学金情况</label>
				</div>
				<div class="span10">
					<table class="table table-bordered table-striped tablecut" id="smpl_tbl" width="788px;">
						<thead>
							<tr>
								<th width="20%">序号</th>
								<th width="40%">学年</th>
								<th width="40%">奖助/奖学金</th>
							</tr>
						</thead>
						<tbody>
							<#if listBurse??>	
							  <#list listBurse as b>
							  <tr>
								  <td class="autocut">${b_index+1}	</td>
								  <td class="autocut">${b.schoolYear.name!''}</td>
								  <td class="autocut">${b.burseName.name!''}</td>
							  </tr>
							  </#list>
						    </#if> 
						    <#list listAward as a>
							  	<tr>
									<td class="autocut">
										<#if listBurse??>${listBurse?size+a_index+1}	
										<#else>
											${a_index+1}
										</#if>
									</td>
									<td class="autocut">
										<#if a.awardTypeId??&&a.awardTypeId.schoolYear??>${a.awardTypeId.schoolYear.name!''}</#if>	</td>
									<td class="autocut">
										<#if a.id?? >${a.id!''}
										</#if>
									</td>
								</tr>
						   </#list>
						</tbody>
					</table>
				</div>
			</div>
		  </div>
	    </div>
		<div class="formSep">
			<div class="row-fluid">
				<div class="span6">
					<div class="span3">
						<label>特长</label>
					</div>
					<div class="span9">
						
						<#if workApplyFile?? && workApplyFile.workExperience??>
						    <textarea rows="5" cols="12" readOnly id="forte" name="forte"   style="width: 730px; height: 134px;">${(workApplyFile.forte!"")}</textarea>
						<#else>
						    <textarea rows="5" cols="12" readOnly id="forte" name="forte"  style="width: 730px; height: 134px;"></textarea>
						</#if>	
					</div>
				 </div>
			</div>
		</div> 
		<div class="formSep">
			<div class="row-fluid">
			 	<div class="span6">
					<div class="span3">
						<label>勤工助学经历</label>
					 </div>
					 <div class="span9">
						<#if workApplyFile?? && workApplyFile.workExperience??>
						    <textarea rows="5" cols="12" readOnly id="workExperience" name="workExperience"  style="width: 730px; height: 134px;">${(workApplyFile.workExperience!"")}</textarea>
						<#else>
						    <textarea rows="5" cols="12" readOnly id="workExperience" name="workExperience"  style="width: 730px; height: 134px;"></textarea>
						</#if>	
					 </div>
			  	</div>
			</div>
		</div> 
		<div class="formSep">
			<div class="row-fluid">
			  	<div class="span6">
					<div class="span3">
						<label>家庭成员及工作收入情况</label>
				 	</div>
					<div class="span9">
						<#if workApplyFile?? && workApplyFile.familyCondition??>
						    <textarea rows="5" cols="12" readOnly id="familyCondition" name="familyCondition"  style="width: 730px; height: 134px;">${(workApplyFile.familyCondition!"")}</textarea>
						<#else>
						    <textarea rows="5" cols="12" readOnly id="familyCondition" name="familyCondition" style="width: 730px; height: 134px;"></textarea>
						</#if>	
					</div>
			  	</div>
			</div>
		</div>
		<div class="formSep"> 	
			 <div class="row-fluid">
			 	<div class="span6">
	 				<div class="span3">
						<label>用工部门</label>
					</div>
					<div class="span9 ">
						<select  disabled id="orgId" name="workOrg.org.id"  size="1"  aria-controls="dt_gal" >
						  		<option value="" />请选择..</option>
								<#if workApply?? && workApply.sponsorPosition ??  >
						     		<option  value="${workApply.sponsorPosition.workOrg.org.id}" selected="selected" />${workApply.sponsorPosition.workOrg.org.name?html}</option>
								</#if>
						</select>
					</div>
			 	</div>
				<div class="span6">
					<div class="span3">
						<label>申请岗位</label>
					</div>
					<div class="span9">
						<div class="span9 ">
							<select disabled  id="positionId" name="sponsorPosition.positionId" size="1"  aria-controls="dt_gal" >
						  		<option value="" />请选择..</option>
						  		
								<#if workApply?? && workApply.sponsorPosition ??  >
						     		<option  value="${workApply.sponsorPosition.positionId}" selected="selected" />${workApply.sponsorPosition.workName?html}</option>
								</#if>
							</select>
						</div>
						
					</div>
				</div>
			</div>
		</div>
		<div class="formSep"> 	
			<div class="row-fluid">
				<div class="span6">
					<div class="span3">
						<label>申请岗位理由</label>
				 	</div>
				  	<div class="span9">
						<#if workApplyFile?? && workApplyFile.applyDesc??>
						    <textarea rows="5" cols="12" readOnly  id="applyDesc" name="applyDesc"   style="width: 730px; height: 134px;">${(workApplyFile.applyDesc!"")}</textarea>
						<#else>
						    <textarea rows="5" cols="12" readOnly id="applyDesc" name="applyDesc" style="width: 730px; height: 134px;"></textarea>
						</#if>	
					</div>
			  	</div>
			</div>
		</div>
		<div class="formSep"> 	
			   <!--课表安排信息-->
			<div class="row-fluid">
				<div class="span9">
					 <div class="span2">
						<label>课表安排</label>
					  </div>
					  <div class="span9">
						 <#include "/sponsor/work/workStudy/approveSchedule.ftl"/>
					  </div>
			  	</div>
			</div>
		</div> 
			
		<div class="formSep">
			<div class="row-fluid">					
				<div class="span9">
			        <div class="span2">
					  <label>上传附件</label>
				    </div>
					<div class="span10" id="_upload_div">
						 <#if uploadFileRefList??>	
							<#list uploadFileRefList as p>
								<div class="fileupload-info">
									<a href="${rc.contextPath}/sys/sysConfig/file.do?id=${p.uploadFile.id}"><strong>${p.uploadFile.name}&nbsp;(${p.uploadFile.fileSize})</strong></a>
									<input type="hidden" name="fileId" value="${p.uploadFile.id}"/>	
								</div>					
							</#list>
						 </#if> 
					</div>
			  	</div>
			 </div>
		</div>
		<div class="row-fluid">	
	    <div class="span12">
	      <h3 class="heading">
			审核信息
		  </h3>
		  </div>
		 </div>
		<form id="approveWorkStudyForm" action="${rc.contextPath}/sponsor/workStudyApprove/opt-save/saveApproveReasonWorkStudy.do" method="post">
			 	<#if workApply??>
					<input type="hidden" id="workApplyId" name="workApplyId" value="${(workApply.workApplyId!"")?html}"/>	
			 	</#if>
			 	<input type="hidden" id="isAbandoned" name="isAbandoned" value="false"/>	
			 	<input type="hidden" id="isFinal" name="isFinal" value="false"/>
			 	 <div class="formSep"> 	
					 <div class="row-fluid">
					  	<div class="span6">
							<div class="span3">
				    			<span>审批意见</span>
							</div>
				    	  	<div class="span9">
								<textarea id="approveReason" name="approveReason" col="12" style="width: 766px; height: 111px;" rows="3"></textarea>
							</div>
					  	</div>
					 </div>
    		  	</div>	
	   	</form>
	   	<br/> 
		<#--审核结果和审核页面-->
		<div class="row-fluid" name="endApproveResultDiv">
			<div class="span6">
				<div class="span3"></div>
				<div class="span9">
					<!--判断是通过还是拒绝保存=0   提交=1 -->
					<button class="btn btn-info" type="button" id="save-pass" onclick="doApprove('PASS')">通 过</button>
					<button class="btn btn-info" type="button" id="save-refuse" onclick="doApprove('REJECT')">拒 绝</button>
					<button class="btn btn-info" type="button" onclick="approve.showHis('${(workApply.workApplyId)!""}');">审批历史</button>
					<button class="btn" type="button" onclick="window.location.href='${rc.contextPath}/sponsor/workStudyApprove/opt-approve/approveWorkStudyList.do'">取 消</button>
					
				</div>
			</div>
			<input name="check_error" id="check_error" type="hidden" value="true"/>
	    </div>
	  </div>
   </div>
   <#include "/apw/instance/approvers.ftl"/>
	
</div>
 <#-- 审核历史查看 -->
   <#include "/apw/instance/approveHistory.ftl">   
<script>
  
   var myValidator;
   $(document).ready(function(){
		myValidator=$("#approveWorkStudyForm").compValidate({
				rules:{
					approveReason:{maxlength:200}
				},
				messages:{
					approveReason:{maxlength:'审批意见太长【默认不超过200字符】'}
				}
		 });
    });

	//表单提交
	function doApprove(approveKey){

			//判断该审批流是否被禁止
			var workApplyId=$("#workApplyId").val();
    		$.ajax({
				url: "${rc.contextPath}/sponsor/workStudyApprove/opt-query/isAbandoned.do",
				async:false,
				cache:false,
				type:"POST",
				data:{workApplyId:workApplyId},
	    		success: function(date){
					if("isAbandoned"==date){
						$("#isAbandoned").val("true");
						comp.message("该学生已经放弃了该岗位,该审批流已经被废止,请点击取消按钮","error");
						return;
		   	 		}
				}
	 		});
	        if("false"==$("#isAbandoned").val()){ 
	        	if("PASS"==approveKey){
					fillDefaltMessage("通过");
					if(myValidator.form()){
						if(confirm("确定要通过？")){
							if(apw.isFinalTask($("#workApplyId").val())){//最后一个节点审批
								$("#isFinal").val("true");
								apw.approveCurProcess("SINGLE",$("#workApplyId").val(),'',"PASS",$("#approveReason").val());
							}else{//中间节点审批
								apw.selectNextApprover($("#workApplyId").val(),approveKey,"SPONSOR_WORK_STUDY_APPROVE", $("#approveReason").val());
							}
						}else{ 
							$("#approveReason").val(""); 
						}	
					}
					
				}else if("NOT_PASS"==approveKey){
				  	fillDefaltMessage("不通过");
				  	if(myValidator.form()){
						if(confirm("确定要不通过？")){
							apw.approveCurProcess("SINGLE",$("#workApplyId").val(),'',"NOT_PASS",$("#approveReason").val());
						}
					}	
				}else if("REJECT"==approveKey){
					fillDefaltMessage("驳回");
					if(myValidator.form()){
						if(confirm("确定要驳回？")){
							apw.approveCurProcess("SINGLE",$("#workApplyId").val(),'',"REJECT",$("#approveReason").val());
						}
					}
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
	
	//执行业务系统操作---保存在审批流程表中
	function doAmsAction(userId,approveKey,approveStatus,processStatusCode){
		
		$.ajax({
			url:"${rc.contextPath}/sponsor/workStudyApprove/opt-add/saveApproveAction.do",
			async:false,
			cache:false,
			type:'POST',
			data:{nextApproverId:userId,objectId:$("#workApplyId").val(),approveStatus:approveStatus,processStatusCode:processStatusCode},
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
		mask.showShade();
	  	$('#approveWorkStudyForm').submit();
	}
</script>
</body>
</html>
					   