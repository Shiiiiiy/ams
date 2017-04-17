<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<script src="${rc.contextPath}/js/jquery.form.js"></script>
</head>
<body>
<div id="contentwrapper">
    <div class="main_content">   
    	   <div class="row-fluid">	
    		<form  id="associationListForm"  action="${rc.contextPath}/association/apply/opt-query/getAssociationApplyList.do" method="post">
				<div class="span12">
					<div class="row-fluid">
						<div class="span4">
						    <span class="formTitle">所属学院</span>
							<div class="span8">
							   <select size="1" id="collegeId" name="associationPo.college.id" aria-controls="dt_gal" style="cursor:pointer" class="span8">
								<option value="">请选择..</option>
								<#if collegeList ??>
									<#list collegeList as c>
										<#if  aam ?? && aam.associationPo??&& aam.associationPo.college ?? &&  aam.associationPo.college.id == c.id >
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
						    <span class="formTitle">申请类型</span>
							<div class="span8">
							   <select size="1" id="applyId" name="applyTypeDic.id" aria-controls="dt_gal" style="cursor:pointer" class="span8">
								<option value="">请选择..</option>
								<#if applyTypeList ??>
									<#list applyTypeList as c>
										<#if  aam ?? && aam.applyTypeDic ?? &&  aam.applyTypeDic.id == c.id >
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
							<div class="span8">
									<select size="1" id="associationTypeId" name="associationPo.associationType.id" aria-controls="dt_gal" style="cursor:pointer" class="span8">
										<option value="">请选择..</option>
										<#if associationTypeDicList ??>
									      <#list associationTypeDicList as g>
											<#if aam.associationPo?? && aam.associationPo.associationType ?? && aam.associationPo.associationType.id == g.id>
													<option  value="${(g.id)?html}" selected="selected">${(g.name)?html}</option>	
												<#else>
													<option value="${(g.id)?html}" >${(g.name)?html}</option>
												</#if>
											</#list>
										</#if>
									</select>
							</div>
						 </div>
					</div>
					
					<div class="row-fluid">
						<div class="span4">
						    <span class="formTitle">社团名称</span>
							<div class="span8">
							    <input id="associationName" name="associationPo.associationName" class="span8" 
							    <#if aam?? && aam.associationPo??>value="${(aam.associationPo.associationName!"")?html}"</#if> maxlength="200"/>
							</div>
						 </div>
						<div class="span4">
						    <span class="formTitle">社团编号</span>
							<div class="span8">
							    <input id="associationCode" name="associationPo.associationCode" class="span8" 
							    <#if aam?? && aam.associationPo??>value="${(aam.associationPo.associationCode!"")?html}"</#if> maxlength="200"/>
							</div>
						 </div>
						<div class="span4">
				                <button class="btn btn-info"  type="submit">查 询</button>
				                <button class="btn btn-info" type="button" onclick="comp.clearForm('associationListForm')">清 空</button>
						 </div>
					</div>
					
				</div>
			</form>
			<div class="row-fluid">
					<div class="span12">
						<h5 class="heading"></h5>
						<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
						<div class="row">
				            <div class="span10">
				                <div class="dt_actions">
				                    <div class="row-fluid">
				                         <#if user_key.optMap??>
											<#if user_key.optMap['apply']?? || user_key.optMap['add']?? >
												<button class="btn btn-info" type="button" id="register-button">注册申请</button>
											</#if>
											<#if user_key.optMap['apply']??>
												<button class="btn btn-info" type="button" id="modify-button">变更申请</button>
												<button class="btn btn-info" type="button" id="cancel-button">注销申请</button>
											</#if>
										</#if>
									</div>
								</div>
							</div>
						</div>
						<#include "associationApplyLoadList.ftl"/>
					</div>
				</div>
			</div> 
			
		</div> 
	</div>
</div>
<script>
    $(document).ready(function(){
	 	 //注册申请
	 	$("#register-button").click( function () {
	 		window.location.href="${rc.contextPath}/association/apply/opt-add/addAssociationRegisterApply.do";
	 	 });
	 	 
	 	 //变更申请 
	 	$("#modify-button").click( function () {
	 			selectAssociation("MODIFY");
	 	 });
	 	 
	 	 //注销申请 
	 	$("#cancel-button").click( function () {
	 		selectAssociation("CANCEL");
	 	 });
	});
	
	//选择社团
	function selectAssociation(flag){
		try  {
		 		comp.showModal("associationSelectDiv","800px","-250px 0 0 -300px");
		 		$("#memberAssociationList").load("${rc.contextPath}/association/maintain/nsm/getAssociationRadioList.do?applyType="+flag+"&amstimestamp="+Math.random());
	     }catch(exception) {
	     	alert(exception);
	     }
	}
	
	//获取选中的社团信息
	function initSelectedAssociation(){
		var flag=$("#applyType").val();
		var validAssociationArray = $("input[name='selectedAssociation']");
		var selectedAssociation = $("input[name='selectedAssociation']:checked").val();
		if(validAssociationArray.length==0){
			comp.message("权限内暂无有效的社团 !");
		}else if(!comp.isValid(selectedAssociation)){
			comp.message("请选择对应社团 !");
		}else{
			modifyApplyCheck(selectedAssociation,flag);
		}
	}
	
	//校验社团社否完成上次申请
	function modifyApplyCheck(selectedAssociation,flag){
			$.ajax({
				url:"${rc.contextPath}/association/apply/opt-query/isModifyApplyFinish.do",
				async:false,
				cache:false,
				type:"POST",
				data:{associationId:selectedAssociation,applyType:flag},
				success:function(msg){
					var json=jQuery.parseJSON(msg); 
					if('yes'== json.flag){
						if(flag=="MODIFY"){
						
							$("#associationListForm").attr("action","${rc.contextPath}/association/apply/opt-edit/addAssociationModifyApply.do?associationId="+selectedAssociation).submit();
						}else if(flag=="CANCEL"){
						
							$("#associationListForm").attr("action","${rc.contextPath}/association/apply/opt-edit/addAssociationCancelApply.do?associationId="+selectedAssociation).submit();
						}
					}else if("no"==json.flag){
						comp.message("请先完成本社团上次申请 !","error");
					}else if("error"==json.flag){
						comp.message("系统异常、请联系管理员 !","error");
					}
				}
			});
	}
	
	function deleteCurApply(applyId,applyType){
		if(confirm("确定删除当前申请 ?")){
			$.ajax({
				url:"${rc.contextPath}/association/apply/opt-delete/deleteAssociationApply.do",
				async:false,
				cache:false,
				type:"POST",
				data:{applyId:applyId,applyType:applyType},
				success:function(msg){
					var json=jQuery.parseJSON(msg); 
					var param = {'associationPo.college.id':$("#collegeId").val(),
											   'applyTypeDic.id':$("#applyId").val(),
											   'associationPo.associationType.id':$("#associationTypeId").val(),
											   'associationPo.associationName':$("#associationName").val(),
											   'associationPo.associationCode':$("#associationCode").val()};
					if('success'== json.flag){
						$("#applyLoadListDiv").load("${rc.contextPath}/association/apply/nsm/asynLoadApplyList.do",param,function(){});
					}else if("error"==json.flag){
						comp.message("系统异常、请联系管理员 !","error");
					}
				}
			});
		}
	}
</script>
<div class="modal hide fade" id="associationSelectDiv">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3 id="title1">社团选择</h3>
	</div>
	<div class="modal-body" id="memberAssociationList">
		<#include "/association/maintain/queryAssocitionRadio4CurAM.ftl">
	</div>
	<div class="modal-footer">
		<a href="###" class="btn " data-dismiss="modal">取消</a>
		<a href="###" class="btn btn-info" data-dismiss="modal" onclick="initSelectedAssociation()">确定</a>		
	</div>
</div>
</body>
</html>