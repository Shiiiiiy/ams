<form id="addapwForm" name="addapwForm" >
	<div class="row-fluid">
		<div class="span2">岗位类型&nbsp;<span class="f_req">*</span></div>
		<div class="span4">
			<select size="1" id="positionId" name="positionId" aria-controls="dt_gal"  class="span8 selectoption" onchange="onchangValue(this.value)">
			    <option value="">请选择</option>
			    <#if positioTypeList??>
				     <#list positioTypeList as d>
				     	<#if fcpo?? && fcpo.ptype?? && fcpo.ptype.id==d.id>
					    	<option value="${d.id};${d.code}" selected>${d.name?html}</option>
				     	<#else>
					    	<option value="${d.id};${d.code}">${d.name?html}</option>
				     	</#if>
					</#list>
				</#if>
			  </select>
		</div>
		<div class="span2">审批环节名称&nbsp;<span class="f_req">*</span></div>
		<div class="span4">
					<input type="text" id="taskName" name="taskName" class="span8"  value="${fcpo.taskName!""}"  maxlength="100"/>
					<input type="hidden" id="id" name="id" value="${fcpo.id!""}"/>
					<input type="hidden" id="processId" name="processId"   value="${processId!''}"/>
		</div>
	</div>
	<#if fcpo?? && fcpo.ptype??>
	<div id="positionRolePanel" class="row-fluid">
		<div class="span2" id="positionRoleLable">${fcpo.ptype.name}<span class="f_req">*</span></div>
		<div class="span4">
			<input type="text"  id="agentPosname" name="agentPosname" onblur="nsmLoadPosition()" class="span8" value="${fcpo.agentPosname!""}"  readonly/>
			<input type="hidden"  id="agentPosition" name="agentPosition" class="span8"  value="${fcpo.agentPosition!""}"/>
		</div>
	</div>
	<#else>
	<div id="positionRolePanel" class="row-fluid" style="display:none">
		<div class="span2" id="positionRoleLable"><span class="f_req">*</span></div>
		<div class="span4">
			<input type="text"  id="agentPosname" name="agentPosname" onblur="nsmLoadPosition()" class="span8" value="${fcpo.agentPosname!""}"  readonly/>
			<input type="hidden"  id="agentPosition" name="agentPosition" class="span8"  value="${fcpo.agentPosition!""}"/>
		</div>
	</div>
	</#if>
</form>
	<div class="row-fluid" style="float:left;position:relative;" id="postionRoleDiv">
		<div class="span12"  id="positionList">
			<#if approveType?? && approveType =='POSITION_SYS'><#include "approvePotionList.ftl"></#if>
			<#if approveType?? && approveType =='ROLE_SYS'><#include "approveRoleList.ftl"></#if>
		</div>
	</div>
<script>
//页面非空验证
	 var validator=$("#addapwForm").compValidate({
			rules:{
					taskName:{required:true,maxlength:100},
					positionId:{required:true},
					agentPosname:{required:true,maxlength:100}
				},
				messages:{
					optionName:{required:'审批环节名称不可为空',maxlength:'审批环节名称不能超过100字'},
					positionId:{required:'岗位类型'},
					agentPosname:{required:"审批岗位不可为空",maxlength:'审批岗位不能超过100字'}
				}
		});

	function popbakfun(){
		if(validator.form()==true){
			//验证通过就给确定按钮添加关闭弹出框的属性;
			$("#makeSure").attr("data-dismiss","modal");
			$.ajax({
				url: "${rc.contextPath}/apw/config/opt-edit/submitConfigInfo.do",
				async:false,
				cache:false,
				type:"POST",
				data:$('#addapwForm').serialize(),
				success: function(msg){
					if("success"==msg){
						$("#configLoadList").load("${rc.contextPath}/apw/config/nsm/getConfigurationList.do",{processId:$("#processId").val()},function(){});
					}else if("error"==msg){
						comp.message("审批节点配置出错，请联系管理员","error");
					}
				}
			});
		}
	}
	
	function positionSelector(positionName,approveType){
	    if('POSITION_SYS'==approveType){
			$("#positionList").load("${rc.contextPath}/apw/config/nsm/loadPositionList.do",{positionName:positionName,approveType:approveType},function(){});
	    }else if('ROLE_SYS'==approveType){
			$("#positionList").load("${rc.contextPath}/apw/config/nsm/loadRoleList.do",{roleName:positionName,approveType:approveType},function(){});		    
	    }
	}
	
	//初始化选中的角色
	function setSelectedPosition(positionId,positionName)
	{
		$('#taskName').val(positionName+"审批");
		$('#agentPosname').val(positionName);
    	$('#agentPosition').val(positionId);  
	}

 //根据岗位类型，选择赋值岗位名称
   function onchangValue(value)
   {
       //获取文本
       var positionName= $("#positionId").find("option:selected").text();
       var optionArray =   $("#positionId").find("option:selected").val().split(";");
       //初始化节点配置信息
       clearConfigInfo();
       //初始化【审批岗位】【审批角色】下拉列表
		initPositionRolePanel(value,positionName,optionArray);
   }
   
   /**
     * 初始化岗位角色选择面板
     */
     function initPositionRolePanel(value,positionName,optionArray){
	       if(comp.isNull(value)){
				$("#positionRolePanel").hide();
				$("#postionRoleDiv").hide();
	       }else{
		       $("#positionRolePanel").show();
		       $("#positionRoleLable").html(positionName+"&nbsp;<span class='f_req'>*</span>");
		       //重置选中id的value
		       if('POSITION_SYS'==optionArray[1] || 'ROLE_SYS'==optionArray[1]){
		           positionSelector($("#taskName").val(),optionArray[1]); 
				   openPositionFilter(optionArray[1]);
		           $('#postionRoleDiv').show();
		        }else if('POSITION_MONITOR'==optionArray[1]||'POSITION_INSTRUCTOR'==optionArray[1]){
				   $('#postionRoleDiv').hide();  
				   $("#agentPosname").attr("readonly","readonly");
		           $('#agentPosname').val(positionName);
		           $('#agentPosition').val(optionArray[0]);
		           $('#taskName').val(positionName+"审批");
		        }else{
		           $('#postionRoleDiv').hide();  
		        }
	       }
     }
   
	/**
	  * 清除节点配置信息
	  */
	function clearConfigInfo(){
       $('#agentPosname').val('');
       $('#agentPosition').val('');
       $('#taskName').val('');
       $('#approveType').val('');
	}
	
	/**
	  *  打开岗位过滤器
	  */
	function openPositionFilter(approveType){
		$("#agentPosname").removeAttr("readonly");
		$('#agentPosname').bind("refreshPosition",function(){
		    var positionName = $("#agentPosname").val();
		    if('POSITION_SYS'==approveType){
				$("#positionList").load("${rc.contextPath}/apw/config/nsm/loadPositionList.do",{positionName:positionName,approveType:approveType},function(){});
		    }else if('ROLE_SYS'==approveType){
				$("#positionList").load("${rc.contextPath}/apw/config/nsm/loadRoleList.do",{roleName:positionName,approveType:approveType},function(){});		    
		    }
		});
	}
	
	function nsmLoadPosition(){
		$('#agentPosname').trigger("refreshPosition");
	}
	
	function eisdResponse(r,s){
		var obj = eval("("+r+")");
		if(obj.success=="success"){
			var agentPosition = $("#agentPosition").val();
		    if('POSITION_SYS'==obj.approveType){
				$("#positionList").load("${rc.contextPath}/apw/config/nsm/loadPositionList.do",{pageNo:obj.pageNo,approveType:obj.approveType,agentPosition:agentPosition},function(){});
		    }else if('ROLE_SYS'==obj.approveType){
				$("#positionList").load("${rc.contextPath}/apw/config/nsm/loadRoleList.do",{pageNo:obj.pageNo,approveType:obj.approveType,agentPosition:agentPosition},function(){});
		    }
	    }
	}
</script>