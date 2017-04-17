<html>
<title>form elements</title>
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
	      <h3 class="heading">岗位审核</h3>
	  </div>
	 </div> 
		<input name="errorText" id="errorText" type="hidden" value="${errorText!""}"/>
		
		   <input id="workOrgId" type="hidden" name="workOrgId"  value="${(workOrg.workOrgId)!""}">
		 
		    <div class="formSep"> 
			   <div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<lable>学年</lable>
						</div>
						<div class="span9">
							<select disabled size="1" id="schoolYearId" name="schoolYear.id"  aria-controls="dt_gal" class="{required:true,messages:{required:'学年不能为空'}}"  onchange="changeTerm()">
							 
							<option value="${workOrg.schoolYear.id}" >${workOrg.schoolYear.name}</option>	
									
						    </select>
						</div>
					</div>
						
					<div class="span6">
						<div class="span3">
							<lable>学期</lable>
						</div>
						<div class="span9">
							<select disabled size="1" id="term" name="term.id" aria-controls="dt_gal"  class="{required:true,messages:{required:'学期不能为空'}}" onchange="changeTerm()">
								
								<option value="${workOrg.term.id}">${workOrg.term.name}</option>
									
							</select>
						</div>
					 </div>
				  </div>
			   </div>
			   
			 <div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<lable>用工部门</lable>
						</div>
						<div class="span9">
							<input id="orgId" readOnly name="org.name"  value="${(workOrg.org.name)!""}"/>
						</div>
					</div>
					<div class="span6">
						<div class="span3">
							<lable>用工岗位数</lable>
						</div>
						<div class="span9">
						 <input  readOnly id="workJobNumber" name="workJobNumber"  value="${(workOrg.workJobNumber)!""}"  />
						</div> 
					 </div>
				  </div>
			   </div>
			  
			 <div class="formSep"> 
			   <div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<lable>工作时间(小时/天)</lable>
						</div>
						<div class="span9">
							<input id="workTime" readOnly name="workTime"  value="${(workOrg.workTime)!""}"  />
						</div>
					</div>
						
					<div class="span6">
						<div class="span3">
							<lable>预算金额(元/月)</lable>
						</div>
						<div class="span9">
							<input id="budgetSalary" readOnly name="budgetSalary"  value="${(workOrg.budgetSalary)!""}" />
						</div>
					 </div>
				  </div>
			   </div>
			   <div class="formSep"> 
					<div class="row-fluid">
					  <div class="span6">
						  <div class="span3">
							<label>申请理由</label>
						  </div>
						  <div class="span9">
							<#if workOrg?? && workOrg.applyReason??>
							    <textarea readOnly rows="5" cols="12" id="applyReason" name="applyReason"  style="width: 775px; height: 134px;">${(workOrg.applyReason!"")}</textarea>
					
							</#if>	
						  </div>
					  </div>
				 	</div>
		 		</div>
			 	<div class="formSep"> 
     			 <div class="row-fluid">
				   <div class="span9">
				      <div class="span2">
				   		   岗位列表
				   	  </div>
				      <div class="span10">
				      	<table class="table table-bordered table-striped tablecut" id="smpl_tbl" width="788px;">
						<thead>
							<tr>
								<th width="8%">序号</th>
								<th width="30%">岗位名称</th>
								<th width="45%" >岗位说明</th>
								<th width="17%">岗位人数</th>
								
							</tr>
						</thead>
					<tbody>
				   <#if allPosition  ??>
					 <#list allPosition as p>
					  <tr>
						<input type='hidden'  id="positionId" name="positionList[${p_index}].positionId" value='${p.positionId!""}'/>
	                    <input type='hidden'   id="workOrg.workOrgId" name="workOrg.workOrgId" value='${p.workOrg.workOrgId!""}'/>
						<td class="autocut">${p_index+1}</td>								
						<td class="autocut">${(p.workName)!""}	</td>
				    	<td class="autocut">${(p.workDesc)!""}	</td>
						<td class="autocut">${(p.workNumber)!""} </td>
					
					 </tr>
				  </#list>	
				</#if>
					</tbody>
				</table>
				</div>
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
	<form id="approveSetWorkForm" action="${rc.contextPath}/sponsor/setWorkApprove/opt-save/saveApproveReasonSetWork.do" method="post">
		 <#if workOrg??>
			<input type="hidden" id="workOrgId" name="workOrgId" value="${(workOrg.workOrgId!"")?html}"/>
					
		 </#if>
		   <input type="hidden" id="isFinal" name="isFinal" value="false"/>
	       <div class="formSep"> 
				<div class="row-fluid">
				  <div class="span6">
					  <div class="span3">
						<label>审批意见</label>
					  </div>
					  <div class="span9">
							<textarea id="approveReason" name="approveReason" col="12" style="width: 766px; height: 111px;" rows="3"></textarea>
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
		           <!--判断是通过还是拒绝保存=0   提交=1 -->
					<button class="btn btn-info" type="button" id="save-pass" onclick="doApprove('PASS')">通 过</button>
					<button class="btn btn-info" type="button" id="save-refuse" onclick="doApprove('REJECT')">拒 绝</button>
			  		<button class="btn btn-info" type="button" onclick="approve.showHis('${(workOrg.workOrgId)!""}');">审批历史</button>
			  		<button class="btn" type="button" onclick="window.location.href='${rc.contextPath}/sponsor/approveSetWork/opt-approve/approveSetWorkList.do'">取 消</button>
			  		
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
			myValidator=$("#approveSetWorkForm").compValidate({
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
		if(myValidator.form()){
			if("PASS"==approveKey){
				fillDefaltMessage("通过");
				
				if(myValidator.form()){
					if(confirm("确定要通过？")){
						if(apw.isFinalTask($("#workOrgId").val())){//最后一个节点审批
								$("#isFinal").val("true");
								apw.approveCurProcess("SINGLE",$("#workOrgId").val(),'',"PASS",$("#approveReason").val());
						}else{//中间节点审批
							apw.selectNextApprover($("#workOrgId").val(),approveKey,"SPONSOR_SET_WORK_APPROVE", $("#approveReason").val());
						}
					}else{ 
						$("#approveReason").val(""); 
					}	
				}
				
			}else if("NOT_PASS"==approveKey){
			  	fillDefaltMessage("不通过");
			  	if(myValidator.form()){
					if(confirm("确定要不通过？")){
						apw.approveCurProcess("SINGLE",$("#workOrgId").val(),'',"NOT_PASS",$("#approveReason").val());
						
					}
				}	
				
			}else if("REJECT"==approveKey){
				fillDefaltMessage("驳回");
				if(myValidator.form()){
					if(confirm("确定要驳回？")){
						apw.approveCurProcess("SINGLE",$("#workOrgId").val(),'',"REJECT",$("#approveReason").val());
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
			url:"${rc.contextPath}/sponsor/setWorkApprove/opt-add/saveApproveAction.do",
			async:false,
			cache:false,
			type:'POST',
			data:{nextApproverId:userId,objectId:$("#workOrgId").val(),approveStatus:approveStatus,processStatusCode:processStatusCode},
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
	  	$('#approveSetWorkForm').submit();
	}
</script>
</body>
</html>
