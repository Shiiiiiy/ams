<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- ajax form-->
	    <script src="${rc.contextPath}/js/jquery.form.js"></script>
        <!--date-->
	   <script language="javascript" type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>	
       <!-- multiselect -->
       <link rel="stylesheet" href="${rc.contextPath}/lib/multiselect/css/multi-select.css" />
	   <script src="${rc.contextPath}/lib/multiselect/js/jquery.multi-select.min.js"></script>	
      <!--javascript start-->
      <!--validata-->	
	  <script src="${rc.contextPath}/js/jquery.metadata.js"></script>
	  <script src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script>
	  <script src="${rc.contextPath}/js/myjs_message_cn.js"></script>
	  <!-- sticky messages -->
	   <script src="${rc.contextPath}/lib/sticky/sticky.min.js"></script>
    </head>
 <body id="body">
<div id="contentwrapper">
    <div class="main_content">
    	   <div class="row-fluid">
	    		<form  id="apwDefineQuery"  action="${rc.contextPath}/apw/define/opt-query/getDefinitionList.do" method="post">
					<div class="span12">
						<div class="row-fluid">
							<div class="span4">
								<span class="formTitle">流程名称</span>
								<input class="span6"  id="processName" name="processName" value="${(fdfPo.processName)!""}"  maxlength="100"/>	
							</div>
							<div class="span4">
								<span class="formTitle">流程KEY值</span>
								<input class="span6"  id="processKey" name="processKey" value="${(fdfPo.processKey)!""}"  maxlength="30"/>
							</div>
				            <div class="span4">
				            	<button type="button" class="btn btn-info" onclick="queryApwDefineList()">查 询</button>
			              		<input type="button" class="btn btn-info" onclick="comp.clearForm('apwDefineQuery')" value="清 空" />
				            </div>
   						 </div>
					</div>
				</form>
				  <div class="row-fluid" id="smpl_tbl">
					  <div class="span12">
							<h5 class="heading"></h5>
							 <#include "defineLoadList.ftl"/>
					</div>
				  </div>
				
		</div> 
	</div>
</div>
<!--pop start-->
<div class="modal hide fade" id="flowDefineModal">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3 id="title1">审批流程定义</h3>
	</div>
	<div class="modal-body"  id="stmp_apwdefine">
	  <form class="form_validation_reg" id="addapwForm" name="addapwForm" >
		<#include "addapwDefine.ftl">
	  </from>	
	</div>
	<div class="modal-footer">
		<a href="#" class="btn" data-dismiss="modal">取消</a>
		<a href="#" class="btn btn-info" onclick="popbakfun()">确定</a>
	</div>
</div>
<script>
        var myValidator;
         $("document").ready(function(){
          //验证流程key不能重复
	         var defineData={id:function(){return $("#id").val();},processKey:function(){return $("#processKey").val();}};
	         comp.validate.addRemote("processKeyCheck","${rc.contextPath}/apw/define/opt-isexit/isExitDefineKey.do",defineData,"流程key不能重复");
         //验证流程名称不能重复
	         var defineNameData={id:function(){return $("#id").val();},processName:function(){return $("#processName").val();}};
	         comp.validate.addRemote("processNameCheck","${rc.contextPath}/apw/define/opt-isexit/isExitDefineName.do",defineNameData,"流程名称不能重复");
			   myValidator= $("#addapwForm").compValidate({
			      rules:{
					   processName:{required:true,maxlength:50},
					   processKey:{required:true,maxlength:50}
					},
					messages:{
					  processName:{required:'流程名称能为空',maxlength:'流程名称长度不能超过50'},
					  processKey:{required:'流程key不能为空',maxlength:'流程key长度不能超过50'}
			   }
			});
		});

		//查询流程定义
		function queryApwDefineList(){
			var processName = $("#processName").val();
			var processKey = $("#processKey").val();
			var param = {processName:processName,processKey:processKey};
			$("#defineListDiv").load("${rc.contextPath}/apw/define/nsm/getDefinitionList.do",param,function(){});
		}
		
	     //编辑流程定义
		 function editProcessDefine(processId){
		 	if(comp.isNull(processId)){
		 		comp.showModal("flowDefineModal","600px","-300px 0 0 -300px");
		 		$("#stmp_apwdefine").load("${rc.contextPath}/apw/define/nsm/editProcessDefine.do",{processId:processId});
		 	}else{
		       $.ajax({
				url:'${rc.contextPath}/apw/define/opt-check/isProcessShutdown.do',
				async:false,
				cache: false,
				type: "POST",
				data:{processId:processId},
				success: function(data){
				    if(data=='success'){
				 		comp.showModal("flowDefineModal","600px","-300px 0 0 -300px");
				 		$("#stmp_apwdefine").load("${rc.contextPath}/apw/define/nsm/editProcessDefine.do",{processId:processId});
				     }else{
				     	comp.message("请先停用当前流程 !","error");
				     } 
			    }
		    }); 
	 	}
    }

		//提交流程定义
	     function popbakfun(){
	     if(myValidator.form()){
	     	  var id=$("#id_").val();
	     	  var processName=$("#processName_").val();
	     	  var processKey=$("#processKey_").val();
	     	  var statusId=$("input[type='radio']:checked").val();
	          $.ajax({
				url:"${rc.contextPath}/apw/define/opt-edit/submitDefinition.do",
				async:false,
				cache: false,
				type: "POST",
				data:{id:id,processName:processName,processKey:processKey,statusId:statusId},
				success: function(data){
					if(data=="success"){
					   $('#flowDefineModal').modal('hide');
					   $("#defineListDiv").load("${rc.contextPath}/apw/define/nsm/getDefinitionList.do?pageNo="+$("#currentPageNo").val(),{},function(){});
					}
			    }
		     }); 
    	   }
      }
      
      //禁用
      function stopAuth(processId)
      {
        $.ajax({
				url:"${rc.contextPath}/apw/define/opt-edit/processSwitch.do",
				async:false,
				cache: false,
				type: "POST",
				data:{processId:processId},
				success: function(data){
				    var parsedJson = jQuery.parseJSON(data);
			    	var appName = parsedJson.processName;
    				var appId = parsedJson.id;
					$.sticky(appName+"流程已停用！", {autoclose : 5000, position: "top-right", type: "st-info" });
					$("#"+appId+"_authStatus").attr("class","icon-green");
					$("#"+appId+"_authStatus").attr("title","已启用");
					$("#"+appId+"_authStatus_opt").attr("title","停用");
					$("#"+appId+"_authStatus_opt").attr("onclick","stopAuth('"+appId+"')");
					$("#"+appId+"_authStatus_opt").html("<i class=\"icon-play\">");
					$("#defineListDiv").load("${rc.contextPath}/apw/define/nsm/getDefinitionList.do?pageNo="+$("#currentPageNo").val(),{},function(){});
			   },
			   error: function(){
			   		bootbox.setDefaults({locale: "zh_CN"}); 
			   		bootbox.alert("链接超时，请重新登录！");
			   }
			  
			});
      }
      
      //启用
      function startAuth(processId){
        $.ajax({
			url:"${rc.contextPath}/apw/define/opt-edit/processSwitch.do",
			async:false,
			cache: false,
			type: "POST",
			data:{processId:processId},
			success: function(data){
		    	var parsedJson = jQuery.parseJSON(data);
		    	var appName = parsedJson.processName;
    			var appId = parsedJson.id;
				$.sticky(appName+"流程已启用！", {autoclose : 5000, position: "top-right", type: "st-info" });
				$("#"+appId+"_authStatus").attr("class","icon-green");
				$("#"+appId+"_authStatus").attr("title","已启用");
				$("#"+appId+"_authStatus_opt").attr("title","停用");
				$("#"+appId+"_authStatus_opt").attr("onclick","stopAuth('"+appId+"')");
				$("#"+appId+"_authStatus_opt").html("<i class=\"icon-stop\">");
				$("#defineListDiv").load("${rc.contextPath}/apw/define/nsm/getDefinitionList.do?pageNo="+$("#currentPageNo").val(),{},function(){});
		   },
		   error: function(){
		   		bootbox.setDefaults({locale: "zh_CN"}); 
		   		bootbox.alert("链接超时，请重新登录！");
		   }
		});
    }
    
      function loadConfig(id,code){
         if(code=='ENABLE') {
          		comp.message("请先停用当前流程 !","error");
         }else{
         		window.location.href="${rc.contextPath}/apw/config/opt-query/getConfigurationList.do?fid="+id;
     	 }
 	 }
    </script>
</body>
</html>