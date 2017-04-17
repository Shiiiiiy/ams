<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<script src="${rc.contextPath}/js/jquery.form.js"></script>
	<script>
		//验证是否输入正确的星级评价
		function starApproveCheck(value){
			//正浮点数|正整数[1-5]
		     //var fee =/^(\d{1,2}\.\d{1,1}|\d{1,2}|100)$/;
		       var fee =/^(0?[1-5])$/;
	         return fee.exec(value);
		}
		
		//设置星级评价
		function starApproveCheck1(starGrade,param){
	 		if(starApproveCheck(starGrade)){
	 			comp.cssValidate('starGrade','ok');
				$.ajax({
					url:"${rc.contextPath}/association/maintain/opt-edit/associationStarApproveMul.do",
					async:false,
					cache:false,
					type:"POST",
					data:{ids:param,starGrade:starGrade},
					success:function(msg){
						var json=jQuery.parseJSON(msg); 
						var param = {};
						if('success'== json.flag){
							comp.message("星级评价设置成功 !");
							$("#associationForm").submit();
							//$("#associationListDiv").load("${rc.contextPath}/association/maintain/nsm/getAssociationLoadList.do",param,function(){});
						}
					}
				});
	 		}else{
	 			comp.message("请输入正确的星级评价!1-5之间的整数!");
	 			comp.cssValidate('starGrade','warn');
	 		}
		}
		
	    $(document).ready(function(){
	    	//十佳社团
		 	$("#topTen-button").click(function(){
				comp.getCheckboxValue('curAssociation','selectedBox');
				var param = $("#selectedBox").val().replace(",","_");
				if(comp.isNotNull(param)){
				    comp.confirm("确定要将所选项设置为十佳社团？",function(r){
		            if(r){
						$.ajax({
							url:"${rc.contextPath}/association/maintain/opt-edit/setTopTenAssociationMul.do",
							async:false,
							cache:false,
							type:"POST",
							data:{ids:param},
							success:function(msg){
								var json=jQuery.parseJSON(msg); 
								var param = {};
								if('success'== json.flag){
									comp.message("十佳社团设置成功 !");
									$("#associationForm").submit();
									//$("#associationListDiv").load("${rc.contextPath}/association/maintain/nsm/getAssociationLoadList.do",param,function(){});
								}else if("nodata"==json.flag){
									comp.message("请选择非十佳社团 !");
									$("#mainBox").removeAttr("checked");
									$("#mainBox").removeAttr("checked");
									$('input[name="curAssociation"]').removeAttr("checked");
								}
							}
						});
					}
					});
					
				}else{
					comp.message("请选择要处理的社团 !");
				}
		 	 });
		 	 
		 	 //星级评价
		 	$("#starApprove-button").click(function(){
				var starGrade = $("#starGrade").val();
				comp.getCheckboxValue('curAssociation','selectedBox');
				var param = $("#selectedBox").val().replace(",","_")
				if(comp.isNotNull(param)){
					if(comp.isNotNull(starGrade)){
						starApproveCheck1(starGrade,param);
						$("#span-star").removeAttr("style");
					}else{
						$("#span-star").css({color:"red"});
						comp.message("星级评价不可为空 !");
					}
				}else{
					comp.message("请选择要处理的社团 !");
				}
		 	 });
		 	 
		 	 //强制注销
		 	$("#cancel-button").click(function(){
				var starGrade = $("#starGrade").val();
				comp.getCheckboxValue('curAssociation','selectedBox');
				var param = $("#selectedBox").val().replace(",","_")
				if(comp.isNotNull(param)){
					comp.confirm("确定要强制注销选中的社团？", function(result) {
						if(!result)
							return;
						associationCancelMul(param);
					});
				}else{
					comp.message("请选择要处理的社团 !");
				}
		 	 });
		 	 
		 	 //确认注销
		 	$("#confirm-button").click(function(){
				var starGrade = $("#starGrade").val();
				comp.getCheckboxValue('curAssociation','selectedBox');
				var param = $("#selectedBox").val().replace(",","_")
				if(comp.isNotNull(param)){
					comp.confirm("确定同意注销？", function(result) {
						if(!result)
							return;
						associationCancelConfirm(param);
					});
				}else{
					comp.message("请选择要处理的社团 !");
				}
		 	 });
		 	 
		 	 
		});
	</script>
</head>
<body>
<div id="contentwrapper">
    <div class="main_content">   
    	   <div class="row-fluid">	
    		<form  id="associationForm"  action="${rc.contextPath}/association/maintain/opt-query/getAssociationList.do" method="post">
				<div class="span12">
					<div class="row-fluid">
						<div class="span4">
						    <span class="formTitle">所属学院</span>
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
					 <div class="row-fluid">
						<div class="span4">
							<span class="formTitle">是否注销</span>
							<div class="span9">
								 <select size="1" id="isCancelId" name="isCancel.id" aria-controls="dt_gal" style="cursor:pointer" class="span8">
										<option value="">请选择..</option>
										<#if isNoList ??>
											<#list isNoList as param>
												<#if abm.isCancel ?? &&  abm.isCancel.id == param.id >
													<option  value="${param.id}" selected="selected">${param.name?html}</option>
												<#else>
													<option value="${param.id}" >${param.name?html}</option>
												</#if>
											</#list>
										</#if>
								 </select>
							</div>
						</div>
						<div class="span4" style="padding-left:62px;">
			                 <button class="btn btn-info"  type="submit">查 询</button>
			                 <button class="btn btn-info" type="button" onclick="comp.clearForm('associationForm')">清 空</button>
			            </div>
					</div>
					 
					<div class="span12">
						<input type="hidden" id="selectedBox" name="selectedBox"/>
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
							                    <#if user_key.optMap['cancel']??>
							                            <button class="btn btn-info" type="button" id="cancel-button">强制注销</button>
												</#if>
							                    <#if user_key.optMap['confirm']?? && !(user_key.optMap['cancel']??)>
							                            <button class="btn btn-info" type="button" id="confirm-button">确认注销</button>
												</#if>
												<#if user_key.optMap['topTen']??>
							                        <button class="btn btn-info" type="button" id="topTen-button">十佳社团</button>
							                    </#if>
							                    <#if user_key.optMap['starApprove']??>
							                            <button class="btn btn-info" type="button" id="starApprove-button">星级评价</button>
							                            <span id="span-star">
							                            <input id="starGrade" name="starGrade" class="span2" style="text-align:center" maxlength="3"/>(星)
							                            </span>
												</#if>
											</#if>
										</div>
									</div>
								</div>
							</div>
						<#include "associationLoadList.ftl">
					</div>
				</div>
			</div>
			 
		</div> 
	</div>
</div>
<script>
function setTopTenAssociation(associationId){
	$.ajax({
		url:"${rc.contextPath}/association/maintain/opt-edit/setTopTenAssociation.do",
		async:false,
		cache:false,
		type:"POST",
		data:{id:associationId},
		success:function(msg){
			var json=jQuery.parseJSON(msg); 
			var param = {};
			if('success'== json.flag){
				comp.message("十佳社团设置成功 !");
				$("#associationListDiv").load("${rc.contextPath}/association/maintain/nsm/getAssociationLoadList.do",param,function(){});
			}
		}
	});
}

//社团强制注销
function associationCancel(associationId){
	comp.confirm("强制注销当前社团，可能会造成系统其他业务功能无法正常使用，确定要强制注销当前社团？", function(result) {
		if(!result)
			return;
		$.ajax({
			url:"${rc.contextPath}/association/maintain/opt-edit/associationCancel.do",
			async:false,
			cache:false,
			type:"POST",
			data:{associationId:associationId},
			success:function(msg){
				var json=jQuery.parseJSON(msg); 
				var param = {'associationPo.college.id':$("#collegeId").val()};
				if('success'== json.flag){
					comp.message("强制注销成功，等待校团委确认注销后社团将被完全注销掉 !","info");
					$("#associationForm").submit();
				}else if('error'== json.flag){
					comp.message("系统异常，请联系管理员 !","error");
				}
			}
		});
	});
}

//社团批量强制注销
function associationCancelMul(Ids){
	$.ajax({
		url:"${rc.contextPath}/association/maintain/opt-edit/associationCancelMul.do",
		async:false,
		cache:false,
		type:"POST",
		data:{associationIds:Ids},
		success:function(msg){
			var json=jQuery.parseJSON(msg); 
			var param = {'associationPo.college.id':$("#collegeId").val()};
			if('success'== json.flag){
				$("#associationForm").submit();
			}else if('error'== json.flag){
				comp.message("系统异常，请联系管理员 !","error");
			}
		}
	});
}

//社团强制注销确认
function associationCancelConfirm(associationId){
	comp.confirm("确定要强制注销当前社团？", function(result) {
		if(!result)
			return;
		$.ajax({
			url:"${rc.contextPath}/association/maintain/opt-edit/associationCancelConfirm.do",
			async:false,
			cache:false,
			type:"POST",
			data:{associationId:associationId},
			success:function(msg){
				var json=jQuery.parseJSON(msg); 
				var param = {'associationPo.college.id':$("#collegeId").val()};
				if('success'== json.flag){
					$("#associationForm").submit();
				}else if('error'== json.flag){
					comp.message("系统异常，请联系管理员 !","error");
				}
			}
		});
	});
}

//社团强制注销确认
function associationCancelRefuse(associationId){
	comp.confirm("确定要退回当前社团强制注销申请吗？", function(result) {
		if(!result)
			return;
		$.ajax({
			url:"${rc.contextPath}/association/maintain/opt-edit/associationCancelRefuse.do",
			async:false,
			cache:false,
			type:"POST",
			data:{associationId:associationId},
			success:function(msg){
				$("#associationForm").submit();
			}
		});
	});
}



//社团批量注销确认
function associationCancelConfirmMul(Ids){
	$.ajax({
		url:"${rc.contextPath}/association/maintain/opt-edit/associationCancelConfirmMul.do",
		async:false,
		cache:false,
		type:"POST",
		data:{associationIds:Ids},
		success:function(msg){
			var json=jQuery.parseJSON(msg); 
			var param = {'associationPo.college.id':$("#collegeId").val()};
			if('success'== json.flag){
				$("#associationListDiv").load("${rc.contextPath}/association/maintain/nsm/getAssociationLoadList.do",param,function(){});
			}else if('error'== json.flag){
				comp.message("系统异常，请联系管理员 !","error");
			}
		}
	});
}

</script>
</body>
</html>