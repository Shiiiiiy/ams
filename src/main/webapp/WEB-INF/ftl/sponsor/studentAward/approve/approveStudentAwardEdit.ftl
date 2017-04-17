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
		<script src="${rc.contextPath}/js/common/common_approve.js"></script>
        <!-- animated progressbars -->
        <script src="${rc.contextPath}/js/bdp_fileupload.progressbar.js"></script>
        <script src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script>
    </head>
<body>
<div id="contentwrapper">
 <div class="main_content">
  <div class="row-fluid">
    <div class="row-fluid">
	   <div class="span12">
	      <h3 class="heading">
			       困难生奖助审核
		   </h3>
		  </div>
		 </div> 
		 <input name="errorText" id="errorText" type="hidden" value="${errorText!""}"/>
			 <div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>姓名<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="student.name" name="student.name" readOnly <#if studentAward?? && studentAward.difficultStudentInfo?? && studentAward.difficultStudentInfo.student??> value="${(studentAward.difficultStudentInfo.student.name!"")?html}" </#if>/>
						</div>
					</div>
						
					<div class="span6">
						<div class="span3">
							<label>性别<span class="f_req"></span></label>
						</div>
						<div class="span9">
						 <#if genderList??>
							<#list genderList as a>
				    			<#if studentAward?? && studentAward.difficultStudentInfo?? && studentAward.difficultStudentInfo.student?? && studentAward.difficultStudentInfo.student.genderDic?? && studentAward.difficultStudentInfo.student.genderDic.id==a.id >
    				    				<label class="radio inline">
											<input type="radio" id="sexId" name="genderDic.name" disabled checked="checked" value="${a.id}" />${a.name?html}
										</label>
    				    			
				    			<#else>
				    				<label class="radio inline">
										<input type="radio" id="sexId" name="genderDic.name" disabled  value="${a.id}" />${a.name?html}
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
					<div class="span6">
						<div class="span3">
							<label>名族<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="national" name="national" readOnly <#if studentAward?? && studentAward.difficultStudentInfo?? && studentAward.difficultStudentInfo.student??> value="${(studentAward.difficultStudentInfo.student.national!"")?html}" </#if>/>
						</div>
					</div>
						
					<div class="span6">
						<div class="span3">
							<label>身份证号<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="certificateCode" name="certificateCode" readOnly <#if studentAward?? && studentAward.difficultStudentInfo?? && studentAward.difficultStudentInfo.student??>  value="${((studentAward.difficultStudentInfo.student.certificateCode)!"")?html}"</#if>/>
						</div>
					 </div>
				  </div>
			   </div>
			   
			   <div class="formSep"> 
			   <div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>学院<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="college" name="college.name" readOnly <#if studentAward?? && studentAward.difficultStudentInfo?? && studentAward.difficultStudentInfo.student?? && studentAward.difficultStudentInfo.student.college??> value="${(studentAward.difficultStudentInfo.student.college.name!"")?html}" </#if>/>
						</div>
					</div>
						
					<div class="span6">
						<div class="span3">
							<label>班级<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="className" name="classId.className" readOnly <#if studentAward?? && studentAward.difficultStudentInfo?? && studentAward.difficultStudentInfo.student?? && studentAward.difficultStudentInfo.student.classId??>  value="${(studentAward.difficultStudentInfo.student.classId.className!"")?html}"</#if>/>
						</div>
					 </div>
				  </div>
			   </div>
			   
			  <div class="formSep"> 
			   <div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>学号<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="stuNumber" name="stuNumber" readOnly <#if studentAward?? && studentAward.difficultStudentInfo?? && studentAward.difficultStudentInfo.student??> value="${((studentAward.difficultStudentInfo.student.stuNumber)!"")?html}" </#if>/>
						</div>
					</div>
						
					<div class="span6">
						<div class="span3">
							<label>政治面貌<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="politicalDic" name="politicalDic.name" readOnly <#if studentAward?? && studentAward.difficultStudentInfo?? && studentAward.difficultStudentInfo.student?? && studentAward.difficultStudentInfo.student.politicalDic??>  value="${((studentAward.difficultStudentInfo.student.politicalDic.name)!"")?html}"</#if>/>
						</div>
					 </div>
				  </div>
			   </div>
			   
			   <div class="formSep"> 
			   <div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>出生年月<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="brithDate" name="brithDate" readOnly <#if studentAward?? && studentAward.difficultStudentInfo?? && studentAward.difficultStudentInfo.student?? && studentAward.difficultStudentInfo.student.brithDate??> value="${(studentAward.difficultStudentInfo.student.brithDate!"")?string("yyyy-MM-dd")}"</#if>/>
						</div>
					</div>
						
					<div class="span6">
						<div class="span3">
							<label>联系方式<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="phone1" name="phone1" readOnly <#if studentAward?? && studentAward.difficultStudentInfo?? && studentAward.difficultStudentInfo.student?? && studentAward.difficultStudentInfo.student.phone1??>  value="${((studentAward.difficultStudentInfo.student.phone1)!"")?html}"</#if>/>
						</div>
					 </div>
				  </div>
			   </div>
			   
			    <div class="formSep">
				 <div class="row-fluid">
				   <div class="span6">
					  <div class="span3">
						  <label>学年<span class="f_req"></span></label>
						</div>
						<div class="span9">
						   <select disabled="disabled" size="1" id="schoolYear" name="schoolYear.id" aria-controls="dt_gal" >
							  <option value="" />请选择..</option>
								<#if yearList ??>
									<#list yearList as d>
										<#if studentAward?? && studentAward.schoolYear ?? && studentAward.schoolYear.id==d.id >
											     <option  value="${d.id}" selected="selected" />${d.name?html}</option>
										<#elseif nowYearDic?? && d.id==nowYearDic.id>
												<option value="${d.id}" selected="selected">${d.name}</option>
										<#else>
												<option value="${d.id}" >${d.name}</option>	
										</#if>
									</#list>
								</#if>
						    </select>
					    </div>
					</div>
						
					 <div class="span6">
						<div class="span3">
							<label>家庭经济情况<span class="f_req"></span></label>
						</div>
						<div class="span9">
						    <select disabled="disabled" size="1" id="familyFinance" name="familyFinance.id" aria-controls="dt_gal">
							  <option value="" />请选择..</option>
								<#if financeList ??>
									<#list financeList as d>
										<#if studentAward?? && studentAward.familyFinance ?? && studentAward.familyFinance.id==d.id >
											<option  value="${d.id}" selected="selected" />${d.name?html}</option>
										<#else>
											<option value="${d.id}" />${d.name?html}</option>
										</#if>
									</#list>
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
						  <label>奖助类型<span class="f_req"></span></label>
						</div>
						<div class="span9">
						   <select disabled="disabled" size="1" id="awardType" name="awardType.id" aria-controls="dt_gal" onchange="onChangeType()">
							   <#if awardList ??>
									<#list awardList as d>
										<#if studentAward?? && studentAward.awardType ?? && studentAward.awardType.id==d.id >
											<option  value="${d.id}" selected="selected" />${d.name?html}</option>
										<#else>
											<option value="${d.id}"/>${d.name?html}</option>
										</#if>
									</#list>
								</#if>
						    </select>
					     </div>
					  </div>
				    </div>
				  </div>
				  
			 <!--各个奖项填写的内容 -->
			  	<div id="awardTypeContent">
			  	  <#if studentAward?? && studentAward.awardType ?? >
			  	   <#if inspirationDic.id == studentAward.awardType.id>
			  			<#include "/sponsor/studentAward/inspirationalAward.ftl">
			  	   <#elseif aidGrantDic.id == studentAward.awardType.id>
			  		    <#include "/sponsor/studentAward/aidGrant.ftl">
			  	   <#elseif jobGrantDic.id == studentAward.awardType.id> 
			  	        <#include "/sponsor/studentAward/jobGrant.ftl">
			  	   <#elseif schoolLoanDic.id == studentAward.awardType.id> 
			  	        <#include "/sponsor/studentAward/schoolLoan.ftl">
			  	   <#elseif tuitionDic.id == studentAward.awardType.id>  
			  	        <#include "/sponsor/studentAward/tuitionWaiver.ftl">
			  	   </#if>
	  			</#if>
			  </div>	    
			   
			  <div class="formSep">
				<div class="row-fluid">
				  <div class="span6">
					<div class="span3">
						<label>家庭成员情况<span class="f_req"></span></label>
					 </div>
					  <div class="span9">
						<#if studentAward?? && studentAward.familyCondition??>
						    <textarea rows="5" cols="12" id="familyCondition" name="familyCondition" readOnly class="span6 tipTag" data="1.家庭成员情况(年龄，学习工作情况，身体状况等)&lt;br/&gt;2.家庭经济来源&lt;br/&gt;3.其他情况" style="width: 780px; height: 134px;">${(studentAward.applyReason!"")}</textarea>
						<#else>
						    <textarea rows="5" cols="12" id="familyCondition" name="familyCondition" readOnly class="span6 tipTag" data="1.家庭成员情况(年龄，学习工作情况，身体状况等)&lt;br/&gt;2.家庭经济来源&lt;br/&gt;3.其他情况" style="width: 780px; height: 134px;"></textarea>
						</#if>	
					</div>
				  </div>
				 </div>
				</div>
				
			  <div class="formSep">
				<div class="row-fluid">
				  <div class="span6">
					<div class="span3">
						<label>申请理由<span class="f_req"></span></label>
					 </div>
					  <div class="span9">
						<#if studentAward?? && studentAward.familyCondition??>
						    <textarea rows="5" cols="12" id="applyReason" name="applyReason" readOnly style="width: 775px; height: 134px;">${(studentAward.applyReason!"")}</textarea>
						<#else>
						    <textarea rows="5" cols="12" id="applyReason" name="applyReason" readOnly style="width: 775px; height: 134px;"></textarea>
						</#if>	
					</div>
				  </div>
				 </div>
				</div>
		   <form id="studentAwardApproveForm" class="form_validation_reg" action="${rc.contextPath}/sponsor/studentAwardApprove/opt-save/saveStudentAwardApprove.do" method="post"><@token/>
	       <input id="id" type="hidden" name="id"  value="${(studentAward.id)!""}">
	       <!--审批信息 开始--> 
			<div class="row-fluid">
		      <div class="span12">
		        <h3 class="heading">
				 审批信息
			    </h3>
			  </div>
			 </div> 
			 <div class="formSep">
				 <div class="row-fluid">
					 <div class="span6">
						<div class="span3">
							<label>审核意见<span class="f_req"></span></label>
						 </div>
					     <div class="span9">
							<#if studentAward?? && studentAward.approveReason??>
							    <textarea rows="5" cols="12" id="approveReason" name="approveReason" style="width: 775px; height: 134px;"></textarea>
							<#else>
							    <textarea rows="5" cols="12" id="approveReason" name="approveReason" style="width: 775px; height: 134px;"></textarea>
						</#if>	
					</div>
				 </div>
			  </div>
		   </div> 
			</form>	  
	        <br/> 
		    <div class="row-fluid">
			 <div class="span6">
			  <div class="span3">
			   </div>
			      <div class="span9">
			  			<button class="btn btn-info" type="button" id="save-pass" onclick="doApprove('PASS')">通 过</button>
					    <button class="btn btn-info" type="button" id="save-refuse" onclick="doApprove('REJECT')">拒 绝</button>
					    <button class="btn btn-info" type="button" onclick="approve.showHis('${studentAward.id}');">审批历史</button>
			  			<button class="btn" type="button" onclick="javascript:window.history.back(-1);">取 消</button>
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
	  //声明验证对象
	   var myValidator;
	   $(document).ready(function(){
			myValidator=$("#studentAwardApproveForm").compValidate({
					rules:{
						approveReason:{maxlength:400}
					},
					messages:{
						approveReason:{maxlength:'审批意见太长【默认不超过400字符】'}
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
									apw.approveCurProcess("SINGLE",$("#id").val(),'',"PASS",$("#approveReason").val());
								}else{//中间节点审批
									apw.selectNextApprover($("#id").val(),approveKey,"SPONSOR_DIFFICULT_STUDENT_APPROVE",$("#approveReason").val());
								}
							}
						}
					}else if("NOT_PASS"==approveKey){
						fillDefaltMessage("不通过");
						if(myValidator.form()){
							if(confirm("确定要不通过？")){
								 apw.approveCurProcess("SINGLE",$("#id").val(),'',"NOT_PASS",$("#approveReason").val());
							}
						}	
					}else if("REJECT"==approveKey){
						fillDefaltMessage("驳回");
						if(myValidator.form()){
							if(confirm("确定要驳回？")){
							     apw.approveCurProcess("SINGLE",$("#id").val(),'',"REJECT",$("#approveReason").val());
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
	
	
	//执行业务系统操作
	function doAmsAction(userId,approveKey,approveStatus,processStatusCode){
		$.ajax({
					url:"${rc.contextPath}/sponsor/studentAwardApprove/opt-add/saveApproveAction.do",
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
	     $('#studentAwardApproveForm').submit();
	}
</script>
</body>
</html>
