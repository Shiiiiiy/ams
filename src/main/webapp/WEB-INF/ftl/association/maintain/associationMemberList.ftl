<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<script src="${rc.contextPath}/js/jquery.form.js"></script>
    <script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
	<script src="${rc.contextPath}/js/common/common_approve.js"></script>
	<script>
	    $(document).ready(function(){
		 	 //新增操作 
		 	$("#add-button").click( function () { 
	    	    	_queryStudentCheckAll("","");
		 	 });
		 	 //导入操作 
		 	$("#import-button").click( function () { 
	    	    	
	    	    	window.location.href="${rc.contextPath}/association/maintain/opt-query/toImportPage.do?associationPoId=${amm.associationPo.id}";
	    	    	
		 	 });
		 	 //同意操作 
		 	$("#confirm-button").click( function () { 
		 			comp.getCheckboxValue('curMember','selectedBox');
	    	    	doPassMul();
		 	 });
		 	 //删除操作 
		 	$("#delete-button").click( function () {
		 			comp.getCheckboxValue('curMember','selectedBox');
	    	    	deleteMemberMul();
		 	 });
		 	 //返回操作 
		 	$("#return-button").click( function () { 
	    	    	window.location.href="${rc.contextPath}/association/maintain/opt-query/getAssociationList.do";
		 	 });
		});
	</script>
</head>
<body>
<div id="contentwrapper">
    <div class="main_content">   
        <div class="row-fluid">	
    		<form  id="associationMemberForm"  action="${rc.contextPath}/association/maintain/opt-query/getAssociationMemberList.do" method="post">
				<div class="span12">
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">学院</span>
							<div class="span8">
							    <select size="1" id="collegeId" name="associationPo.college.id" aria-controls="dt_gal" style="cursor:pointer" class="span8" onchange="cascade.changeCollage('collegeId','majorId','classId');" >
									<option value="">请选择..</option>
									<#if collegeList ??>
										<#list collegeList as c>
											<#if  amm ?? && amm.associationPo?? && amm.associationPo.college ?? &&  amm.associationPo.college.id == c.id >
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
						    <span class="formTitle">姓名</span>
							<div class="span8">
							    <input id="memberName" name="memberPo.name" class="span8" 
							    <#if amm?? && amm.memberPo??>value="${(amm.memberPo.name!"")?html}"</#if> maxlength="200"/>
							</div>
						</div>
						<div class="span4">
						    <span class="formTitle">学号</span>
							<div class="span8">
							    <input id="stuNumber" name="memberPo.stuNumber" class="span8" 
							    <#if amm?? && amm.memberPo??>value="${(amm.memberPo.stuNumber!"")?html}"</#if> maxlength="200"/>
							</div>
						</div>
					</div>
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">状态</span>
							<div class="span8">
							    <select size="1" id="approveStatus" name="memberStatus.code" aria-controls="dt_gal" style="cursor:pointer" class="span8">
									<option value="">请选择..</option>
									<#if approveStatusList??>
						                <#list approveStatusList as key> 
											<#if amm.memberStatus?? && amm.memberStatus.code==key.code>  
										       <option value="${key.code}" selected>${key.name}</option>  
										    <#else>
										       <option value="${key.code}">${key.name}</option>  
										    </#if>
						                </#list>
						            </#if>
							   </select>
							</div>
						</div>
						<div class="span4">
							<span class="formTitle">性别</span>
							<div class="span8">
							    <select size="1" id="genderId" name="memberPo.genderDic.id" aria-controls="dt_gal" style="cursor:pointer" class="span8">
									<option value="">请选择..</option>
									<#if genderList?exists>
						                <#list genderList as dic> 
											<#if amm.memberPo?? && amm.memberPo.genderDic?? && amm.memberPo.genderDic.id==dic.id>  
										       <option value="${dic.id}" selected>${dic.name}</option>  
										    <#else>
										       <option value="${dic.id}">${dic.name}</option>  
										    </#if>
						                </#list>
						            </#if>
							   </select>
							</div>
						</div>
						<div class="span4">
							 <button class="btn btn-info" type="submit">查 询</button>
			                 <button class="btn btn-info" type="button" onclick="comp.clearForm('associationMemberForm')">清 空</button>
			                 <input type="hidden" id="selectedBox" name="selectedBox"/>
							 <input type="hidden" id="associationId" name="associationPo.id" 
							 <#if amm?? && amm.associationPo??>value="${(amm.associationPo.id!"")?html}"</#if>/>
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
												 <#if user_key.optMap['add']??>
							                     	<button class="btn btn-info" type="button" id="add-button">新增</button>
												 </#if>
												 <#if user_key.optMap['import']??>
							                        <button class="btn btn-info" type="button" id="import-button">导入</button>
												 </#if>
												 <#--
												 <#if user_key.optMap['approve']??>
							                        <button class="btn btn-info" type="button" id="confirm-button">审核</button>
												 </#if>
												 -->
												 <#if user_key.optMap['del']??>
							                        <button class="btn btn-info" type="button" id="delete-button">删除</button>
												 </#if>
											 </#if>
											 <button class="btn btn-info" type="button" id="return-button">返回</button>
										</div>
									</div>
								</div>
							</div>
						<#include "associationMemberLoadList.ftl"/>
						</div>
				</div>
			</div>
			 
		</div> 
	</div>
</div>
<script>
	//新增社团成员
	function setMultiEduClassSelectValue(managerIds,names)
	{
		$.ajax({
			url:"${rc.contextPath}/association/maintain/opt-add/addAssociationMember.do",
			async:false,
			cache:false,
			type:"POST",
			data:{associationId:$("#associationId").val(),memberIds:managerIds},
			success:function(msg){
				var json=jQuery.parseJSON(msg); 
				var param = {'associationPo.id':$("#associationId").val(),
										   'associationPo.college.id':$("#collegeId").val(),
										   'memberPo.name':$("#memberName").val(),
										   'memberPo.stuNumber':$("#stuNumber").val(),
										   'memberStatus.code':$("#approveStatus").val(),
										   'memberPo.genderDic.id':$("#genderId").val()};
				if('success'== json.flag){
					$("#memberLoadListDiv").load("${rc.contextPath}/association/maintain/nsm/asynLoadMemberList.do",param,function(){});
				}else if("nodata"==json.flag){
					comp.message("未选择要添加的学生");
				}else if("repeatdata"==json.flag){
					comp.message("选择的学生已存在");
				}
			}
		});
	}
	
	//批量删除社团成员
	function deleteMemberMul()
	{
	  var memberIds = $("#selectedBox").val();
	  if(comp.isNotNull(memberIds)){
			if(confirm("确定删除选中的成员 ?")){
				$.ajax({
					url:"${rc.contextPath}/association/maintain/opt-delete/deleteMemberMul.do",
					async:false,
					cache:false,
					type:"POST",
					data:{associationId:$("#associationId").val(),memberIds:memberIds},
					success:function(msg){
						var json=jQuery.parseJSON(msg); 
						var param = {'associationPo.id':$("#associationId").val(),
												   'associationPo.college.id':$("#collegeId").val(),
												   'memberPo.name':$("#memberName").val(),
												   'memberPo.stuNumber':$("#stuNumber").val(),
												   'memberStatus.code':$("#approveStatus").val(),
												   'memberPo.genderDic.id':$("#genderId").val()};
						if('success'== json.flag){
							$("#memberLoadListDiv").load("${rc.contextPath}/association/maintain/nsm/asynLoadMemberList.do",param,function(){});
						}else if('error'== json.flag){
							comp.message("系统异常，请联系管理员 !","error");
						}
					}
				});
		  	}
		}else{
		  		comp.message("请选择要删除的成员 !");
	  	}
	}
	
	//删除社团成员
	function deleteMember(memberId)
	{
		if(confirm("确定删除该成员 ?")){
				$.ajax({
					url:"${rc.contextPath}/association/maintain/opt-delete/deleteAssociationMember.do",
					async:false,
					cache:false,
					type:"POST",
					data:{associationId:$("#associationId").val(),memberId:memberId},
					success:function(msg){
						var json=jQuery.parseJSON(msg); 
						var param = {'associationPo.id':$("#associationId").val(),
												   'associationPo.college.id':$("#collegeId").val(),
												   'memberPo.name':$("#memberName").val(),
												   'memberPo.stuNumber':$("#stuNumber").val(),
												   'memberStatus.code':$("#approveStatus").val(),
												   'memberPo.genderDic.id':$("#genderId").val()};
						if('success'== json.flag){
							$("#memberLoadListDiv").load("${rc.contextPath}/association/maintain/nsm/asynLoadMemberList.do",param,function(){});
						}else if('error'== json.flag){
							comp.message("系统异常，请联系管理员 !","error");
						}
					}
				});
			}
	}
	//审核通过
    function pass(memberIds){
    	comp.confirm("确定要审核通过吗？",function(r){
		   if(r){
		   var associationId=$("#associationId").val();
    	   $.ajax({
					url:'${rc.contextPath}/association/maintain/opt-edit/approveAssociationMember.do',
					async:false,
					cache: false,
					type: "POST",
					data:{associationId : associationId, memberIds : memberIds, approveStatus : '2c9d5081506a167301506a3ac0ad0002', suggest : ''},
					success: function(msg){
			            var json=jQuery.parseJSON(msg); 
						if('success'== json.flag){
                             $("#"+memberIds+"_td").html("通过");
					 	     if($("#"+memberIds+"_reject").attr("title")){
						 	     $("#"+memberIds+"_pass").hide();
						 	     $("#"+memberIds+"_reject").show();
					 	     }else{
					 	         $("#"+memberIds+"_pass").attr("onclick","applyApprove("+memberIds+")");
					 	         $("#"+memberIds+"_pass").attr("title","拒绝");
					 	         $("#"+memberIds+"_pass").attr("id",memberIds+"_reject");
					 	     }
					 	     comp.message("参与人员维护成功!","info");
					 	     $("#associationMemberForm").submit();
					 	}else if('error'== json.flag){
							comp.message("系统异常，请联系管理员 !","error");
						}
				    }
				});
    	}
    	});
    }
	//单次报名审核
	function applyApprove(memberId,approveType){
		approve.applyApprove(memberId,"SINGLE");
    }
	
	//批量报名审核
	function doPassMul(){
	  var memberIds = $("#selectedBox").val();
	  if(comp.isNotNull(memberIds)){
			approve.applyApprove(memberIds,"MUL");
	    }else{
	  		comp.message("请选择报名的学生 !");
	    }
    }
	
	//报名审核回写
	function approveSubmit(memberIds,approveType,approveSuggest){
	    var url="";
		if(approveType=="SINGLE"){
			url="${rc.contextPath}/association/maintain/opt-edit/doPass.do";
		}else if(approveType=="MUL"){
			url="${rc.contextPath}/association/maintain/opt-edit/doPassMul.do";
		}
			$.ajax({
			url:url,
			async:false,
			cache:false,
			type:"POST",
			data:{associationId:$("#associationId").val(),memberIds:memberIds,
			approveStatus:'2c9d5081506a167301506a3b04540003',approveSuggest:approveSuggest},
			success:function(msg){
				var json=jQuery.parseJSON(msg); 
				var param = {'associationPo.id':$("#associationId").val(),
										   'associationPo.college.id':$("#collegeId").val(),
										   'memberPo.name':$("#memberName").val(),
										   'memberPo.stuNumber':$("#stuNumber").val(),
										   'memberStatus.code':$("#approveStatus").val(),
										   'memberPo.genderDic.id':$("#genderId").val()};
				if('success'== json.flag){
	                $("#"+memberIds+"_td").html("拒绝");
			 	    if($("#"+memberIds+"_pass").attr("title")){
				 	     $("#"+memberIds+"_pass").show();
			 	         $("#"+memberIds+"_reject").hide();
			 	    }else{
			 	         $("#"+memberIds+"_reject").attr("onclick","pass("+memberIds+")");
			 	         $("#"+memberIds+"_reject").attr("title","通过");
			 	         $("#"+memberIds+"_reject").attr("id",memberIds+"_pass");
			 	    }
			 	    comp.message("参与人员维护成功!","info");
			 	    $("#associationMemberForm").submit();			
				}else if('error'== json.flag){
					comp.message("系统异常，请联系管理员 !","error");
				}
			}
		});
	}
</script>
<#include "/common/approve/approve.ftl">
<#include "/comp/student/queryStudentAllCheckBoxModal.ftl"> 
</body>
</html>