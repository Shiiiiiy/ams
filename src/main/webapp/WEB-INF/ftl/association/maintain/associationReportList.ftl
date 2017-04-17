<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<script src="${rc.contextPath}/js/jquery.form.js"></script>
    <script src="${rc.contextPath}/js/common/common_approve.js"></script>
</head>
<body>
<div id="contentwrapper">
    <div class="main_content">   
    	   <div class="row-fluid">	
    		<form  id="associationReportForm"  action="${rc.contextPath}/association/report/opt-query/getAssociationReportList.do" method="post">
				<div class="span12">
					<div class="row-fluid">
						<div class="span4">
						    <span class="formTitle">学院</span>
							<div class="span9">
							   <select size="1" id="collegeId" name="college.id" aria-controls="dt_gal" style="cursor:pointer" class="span8">
								<option value="">请选择..</option>
								<#if collegeList ??>
									<#list collegeList as c>
										<#if abm.college ?? &&  abm.college.id == c.id >
											<option  value="${c.id}" selected="selected">${c.name?html}</option>
										<#else>
											<option value="${c.id}" >${c.name?html}</option>
										</#if>
									</#list>
								</#if>
							   </select>
							</div>
						 </div>
						<div class="span4">
						    <span class="formTitle">社团类型</span>
							<div class="span9">
							   <select size="1" id="associationTypeId" name="associationType.id" aria-controls="dt_gal" style="cursor:pointer" class="span8">
								<option value="">请选择..</option>
								<#if associationTypeDicList ??>
									<#list associationTypeDicList as param>
										<#if abm.associationType ?? &&  abm.associationType.id == param.id >
											<option  value="${param.id}" selected="selected">${param.name?html}</option>
										<#else>
											<option value="${param.id}" >${param.name?html}</option>
										</#if>
									</#list>
								</#if>
							   </select>
							</div>
						 </div>
						<div class="span4">
						    <span class="formTitle">社团名称</span>
							<div class="span9">
							    <input id="associationName" name="associationName" class="span8" value="${(abm.associationName!"")?html}" maxlength="200"/>
							</div>
						 </div>
					</div>
					<div class="btnCenter">
		                <button class="btn btn-info"  type="submit">查 询</button>
		                <button class="btn btn-info" type="button" onclick="comp.clearForm('associationReportForm')">清 空</button>
		            </div>
				</div>
			</form>
			<div class="row-fluid">
					<div class="span12">
						<h5 class="heading"></h5>
						<#include "associationReportLoadList.ftl"/>
				</div>
			</div> 
		</div> 
	</div>
</div>

<script>
function applyJoinCurAssociation(associationId){
	comp.confirm("确定要报名改社团吗？", function(result) {
    	if(!result)
    		return;
			$.ajax({
				url:"${rc.contextPath}/association/maintain/opt-report/exeAssociationReport.do",
				async:false,
				cache:false,
				type:"POST",
				data:{associationId:associationId},
				success:function(msg){
					var json = jQuery.parseJSON(msg); 
					if('error'== json.flag){
						comp.message("系统报错，请联系管理员 !","error");
					}else if('success'== json.flag){
						comp.message("报名完成，等待负责人审核");
						$("#associationReportForm").submit();
						//$("#reportLoadListDiv").load("${rc.contextPath}/association/report/nsm/getAssociationReportLoadList.do");
					}
				}
			});
		});	
}
</script>


  <#-- 审核历史查看 -->
  <#include "/common/approve/approveComment.ftl">	 

</body>
</html>