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
    		<form id="associationHonorForm"  action="${rc.contextPath}/association/service/opt-query/getMemberHonorList.do" method="post">
				
				 <div class="span12">
				 	<input type="hidden" name="associationId" id="associationId" value="${associationId!""}"/>
				 	<input type="hidden" id="selectedBox" name="selectedBox"/>			
					<div class="row-fluid"> 
					 <div class="span4">
						<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学年</span>
						<select size="1" id="honorYear" name="honorYear.id" aria-controls="dt_gal" class="span6"">
							<option value="" >请选择</option>
							<#if yearList??>
								<#list yearList as c>
									<#if honor?? && honor.honorYear?? && honor.honorYear.id?? &&  c.id==honor.honorYear.id>
										<option value="${c.id}" selected="selected">${c.name?html}</option>
									<#else>
										<option value="${c.id}">${c.name?html}</option>
									</#if>
								</#list>
							</#if>
						</select>
					</div>
					<div class="span4">
						<span class="formTitle">学期</span>
						<select size="1" class="span6" id="term" name="honorTerm.id" aria-controls="dt_gal" >
							<option value="" >请选择</option>
							<#if termList??>
								<#list termList as t>
									<#if honor?? && honor.honorTerm ??&& honor.honorTerm.id??&& honor.honorTerm.id==t.id >
										<option value="${t.id}"  selected="selected">${t.name?html}</option>
									<#else>
										<option value="${t.id}">${t.name?html}</option>
									</#if>
								</#list>
							</#if>
						</select>
					</div>
					<div class="span4">
						<span class="formTitle">荣誉名称</span>
						<input name="honorName"  class="span6" <#if honor?? && honor.honorName??>value="${honor.honorName!''}"</#if>/>
					</div>
				  </div>
				  <div class="row-fluid"> 
					 <div class="span4">
						<span class="formTitle">荣誉级别</span>
						<select size="1" id="honorLevel" name="honorLevel.id" aria-controls="dt_gal" class="span6"">
							<option value="" >请选择</option>
							<#if honorTypeList??>
								<#list honorTypeList as c>
									<#if honor?? && honor.honorLevel?? && honor.honorLevel.id?? &&  c.id==honor.honorLevel.id>
										<option value="${c.id}" selected="selected">${c.name?html}</option>
									<#else>
										<option value="${c.id}">${c.name?html}</option>
									</#if>
								</#list>
							</#if>
						</select>
					</div>
					<div class="span4">
						<span class="formTitle">状态</span>
						<select size="1" class="span6" id="term" name="operateStatus.id" aria-controls="dt_gal" >
							<option value="" >请选择</option>
							<#if operateStatusList??>
								<#list operateStatusList as t>
									<#if honor?? && honor.operateStatus ??&& honor.operateStatus.id??&& honor.operateStatus.id==t.id >
										<option value="${t.id}"  selected="selected">${t.name?html}</option>
									<#else>
										<option value="${t.id}">${t.name?html}</option>
									</#if>
								</#list>
							</#if>
						</select>
					</div>
					<div class="span4">
						<span class="formTitle">审核状态</span>
						<select size="1" class="span6" id="term" name="approveResult.id" aria-controls="dt_gal" >
							<option value="" >请选择</option>
							<#if approveResultList??>
								<#list approveResultList as t>
									<#if honor?? && honor.approveResult ??&& honor.approveResult.id??&& honor.approveResult.id==t.id >
										<option value="${t.id}"  selected="selected">${t.name?html}</option>
									<#else>
										<option value="${t.id}">${t.name?html}</option>
									</#if>
								</#list>
							</#if>
						</select>
					</div>
				  </div>
				  <div class="btnCenter">
		              <input type="button" class="btn btn-info"  onclick="selectStudentInfo();" value="查 询"/>
		              <input type="button" class="btn btn-info"  onclick="comp.clearForm('associationHonorForm')" value="清 空"/>
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
											<#--<#if user_key.optMap['approve']??>
					                            <button class="btn btn-info" type="button" id="approve-button">审核</button>
											</#if>-->
										</#if>
			                            <button class="btn btn-info" type="button" id="return-button">返回</button>
									</div>
								</div>
							</div>
						</div>
						<#include "associationHonorLoadList.ftl"/>
					</div>
				</div>
			</div> 
		</div> 
	</div>
</div>
   <#include "/common/approve/approve.ftl">  
<script>
	//删除操作
	function deleteAssociationHonor(name,id)
	{
		comp.confirm("确定要删除【"+name+"】该荣誉信息吗？", function(result) {
		
        	if(!result)
        		return;  
    		$.post("${rc.contextPath}/association/service/opt-del/delAssociationHonor.do", { id: id }, function(data){
    			
    			if(data === "success")
    			{
    				comp.message(name +"删除成功！","info");
    				window.location.href="${rc.contextPath}/association/service/opt-query/getMemberHonorList.do?associationId=${associationId!""}";
    			}
			    
			   },"text");
		}); 
	}
    $(document).ready(function(){
	 	 //新增方法 
	 	$("#add-button").click( function () { 
	 		window.location.href="${rc.contextPath}/association/service/opt-add/editMemberHonor.do?associationId=${associationId!""}";
	 	 });
	 	 //审核方法 
	 	$("#approve-button").click( function () { 
	 		comp.getCheckboxValue('memberService','selectedBox');
	 		doPassMul();
	 	 });
	 	 
	 	 //返回方法 
	 	$("#return-button").click( function () { 
	 			window.location.href="${rc.contextPath}/association/service/opt-query/getMemberServiceList.do";
	 	 });
	 	
	});
	
	function applyApprove(memberIds){
		approve.applyApprove(memberIds,"SINGLE");
    }
    
	//批量审核
	function doPassMul(){
	  var ids = $("#selectedBox").val();
	  if(comp.isNotNull(ids)){
			approve.applyApprove(ids,"MUL");
	    }else{
	  		comp.message("请选择要审批的荣誉记录 !");
	    }
    }
    
	//审核回写
	function applyApprove(ids,approveType,approveStatus,approveSuggest){
	    var url="";
		//if(approveType=="SINGLE"){
			url='${rc.contextPath}/association/service/opt-edit/memberHonorApprove.do';
		//}else if(approveType=="MUL"){
		//	url='${rc.contextPath}/association/service/opt-edit/memberHonorApproveMul.do';
		//}
		
	 	 if(confirm("确定要提交吗？")){
			 $.ajax({
				url:url,
				async:false,
				cache: false,
				type: "POST",
				data:{associationId:$("#associationId").val(),ids:ids,approveStatus:approveStatus,approveSuggest:approveSuggest},
				success: function(msg){
				var json=jQuery.parseJSON(msg); 
					if(json.flag=="success"){
						var param = {'associationId':$("#associationId").val()};
						$("#associationHonorLoadDiv").load("${rc.contextPath}/association/service/nsm/loadMemberHonorList.do",param,function(){});
				 	}else if(json.flag=="nodata"){
				 	     comp.message("该社团不存在","error");
				 	}else if(json.flag=="error"){
				 	     comp.message("系统异常，请联系管理员","error");
				 	}
			    }
			});
		}
	}
	//查询
	function selectStudentInfo(){
		$("#associationHonorForm").submit();
	}
</script>
</body>
</html>