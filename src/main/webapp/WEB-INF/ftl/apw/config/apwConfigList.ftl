<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- ajax form-->
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
		<script src="${rc.contextPath}/js/apw/apw_check.js"></script>
		<script language="javascript" type="text/javascript" src="/productoa/lib/My97DatePicker/WdatePicker.js"></script>
        <!-- multiselect -->
       <link rel="stylesheet" href="${rc.contextPath}/lib/multiselect/css/multi-select.css" />
	   <script src="${rc.contextPath}/lib/multiselect/js/jquery.multi-select.min.js"></script>	
      <!--validata-->	
	  <script src="${rc.contextPath}/js/jquery.metadata.js"></script>
	  <script src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script>
	  <script src="${rc.contextPath}/js/myjs_message_cn.js"></script>
	  <script src="${rc.contextPath}/lib/sticky/sticky.min.js"></script>
    </head>
    <body>
   <div id="contentwrapper">
    <div class="main_content">  
  	  <h3 class="heading">审批流程节点配置</h3> 
   		<div class="row-fluid">	
	    		<form  id="apwConfigQuery"  action="${rc.contextPath}/apw/config/opt-query/getConfigurationList.do" method="post">
	                <input type="hidden"  id="fid" name="fid"  value="${fdfid!""}"/>
	                <input type="hidden"  id="pname" name="pname"  value="${(processName!"")?html}"/>
				</form>
				<div class="row-fluid">
					<div class="span12">
						<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
							<div class="row">
							    <div class="span6">
							        <div class="dt_actions">
							                <button class="btn btn-info" type="button"  onclick="popedit('','${fdfid!""}')">
							                  	  新 增
							                </button>
							                <button class="btn btn-info" type="button"  onclick="goToList()">
							                  	 返 回
							                </button>
							        </div>
							    </div>
							</div>
							<div id="configLoadList">
								 <#include "configLoadList.ftl"/>
							</div>
						</div>
					</div>
				</div>
				
			</div>		
		</div>
	</div>
<!--pop start-->
	  <div class="modal hide fade" id="apwConfigModal" style="width:800px;hight:500px">
		<div class="modal-header">
			<button class="close" data-dismiss="modal">×</button>
			<h3 id="flowConfigTitle">流程配置</h3>
		</div>
		<div class="modal-body"  id="stmp_apwconfig"><#--
			<#include "addapwConfig.ftl">-->
		</div>
		<div class="modal-footer">
			<a href="#" id="rollback" class="btn" data-dismiss="modal">取消</a>
			<a href="#" id="makeSure" class="btn btn-info" onclick="popbakfun()">确定</a>
		</div>
	</div>
	<script>

	//点击新增或者修改，弹出编辑框
	 function popedit(configId,processId){
	 	if(comp.isNull(configId)){
	 		$("#flowConfigTitle").html("新增流程配置");
	 		comp.showModal("apwConfigModal","800px","-300px 0 0 -300px");
	 		$("#stmp_apwconfig").load("${rc.contextPath}/apw/config/nsm/editConfiguration.do",{processId:processId});
	 	}else{
	 		$("#flowConfigTitle").html("修改流程配置");
	 		comp.showModal("apwConfigModal","800px","-300px 0 0 -300px");
	 		$("#stmp_apwconfig").load("${rc.contextPath}/apw/config/nsm/editConfiguration.do",{processId:processId,configId:configId},function(){});
	 	}
	 }
	   
		function eisdResponse(r,s){
				var obj = eval("("+r+")");
				if(obj.success=="success" && obj.pageTarget=="CONFIGLIST"){
					$("#configLoadList").load("${rc.contextPath}/apw/config/nsm/getConfigurationList.do",{processId:$("#fid").val()},function(){});
				}
		}
	   
		//返回显示页面
		function goToList(){
		      	window.location.href="${rc.contextPath}/apw/define/opt-query/getDefinitionList.do";
		}
	</script> 
</body>
</html>
