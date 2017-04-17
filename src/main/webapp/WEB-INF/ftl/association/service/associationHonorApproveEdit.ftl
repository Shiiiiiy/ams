<html>
 <head>
 <meta charset="utf-8" />
    	<meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
   		<link rel="stylesheet" href="${rc.contextPath}/lib/My97DatePicker/skin/WdatePicker.css" />
		<script type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
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
		<script type="text/javascript" src="${rc.contextPath}/js/common/cascadecommon.js"></script>
		
    </head>
<body>
<div id="contentwrapper">
    <div class="main_content">   
        <div class="row-fluid">
        	 <div class="row-fluid">
		   		<div class="span12">
		      		<h3 class="heading">
							社员荣誉查看
			   		</h3>
			  	</div>
			 </div> 	
			
				<div class="formSep"> 
					<div class="row-fluid">
						<div class="span6">
							<span class="span3">姓名<span class="f_req"></span></span>
							<div class="span9">
							    <input id="name" readOnly class="span9"  <#if honor?? && honor.member??&& honor.member.memberPo??>value="${(honor.member.memberPo.name!"")}"</#if> />
							    
					        </div>
						 </div>
						  <div class="span6">
						 	 <span class="span3">学号<span class="f_req"></span></span>
						 	 <div class="span9">
							    <input id="stuNumber" readOnly class="span9"  <#if honor?? && honor.member??&& honor.member.memberPo??>value="${(honor.member.memberPo.stuNumber!"")}"</#if> />
						 	 
						 	 </div>
						 </div>
					</div>
				</div>
				<div class="formSep"> 
					<div class="row-fluid">
						<div class="span6">
							<span class="span3">学院<span class="f_req"></span></span>
							<div class="span9">
							   		<input id="college" readOnly class="span9"  <#if honor??&& honor.member??&& honor.member.memberPo??&& honor.member.memberPo.college??>value="${(honor.member.memberPo.college.name!"")}"</#if> />
							   
					        </div>
						 </div>
						  <div class="span6">
						 	 <span class="span3">专业<span class="f_req"></span></span>
						 	 <div class="span9">
						 	 		<input id="major" readOnly class="span9"  <#if honor?? && honor.member??&&honor.member.memberPo??&& honor.member.memberPo.major??>value="${(honor.member.memberPo.major.majorName!"")}"</#if> />
						 	 	
						 	 </div>
						 </div>
					</div>
				</div>
				<div class="formSep"> 
					<div class="row-fluid">
						<div class="span6">
							<span class="span3">班级<span class="f_req"></span></span>
							<div class="span9">
							   		<input id="college" readOnly class="span9"  <#if honor??&& honor.member?? && honor.member.memberPo??&& honor.member.memberPo.classId??>value="${(honor.member.memberPo.classId.className!"")}"</#if> />
					        </div>
						 </div>
						
					</div>
				</div>
				<div class="formSep"> 
					<div class="row-fluid">
						<div class="span6">
							<span class="span3">所获荣誉学年<span class="f_req"></span></span>
							<div class="span9">
							    <select size="1"   class="span9" disabled id="honorYear" name="honorYear.id" aria-controls="dt_gal" >
						          <option value="" >请选择</option>
									<#if yearList??>
										<#list yearList as y>
											<#if honor?? && honor.honorYear?? &&  honor.honorYear.id==y.id>
												<option value="${y.id}" selected="selected">${y.name?html}</option>
											<#else>
												<option value="${y.id}">${y.name?html}</option>
											</#if>
										</#list>
									</#if>
					         	</select>
					        </div>
						 </div>
						  <div class="span6">
						 	 <span class="span3">所获荣誉学期<span class="f_req"></span></span>
						 	 <div class="span9">
						 	 	<select size="1"  class="span9" disabled id="term" name="honorTerm.id" aria-controls="dt_gal" >
									<option value="" >请选择</option>
									<#if termList??>
										<#list termList as t>
											<#if honor?? && honor.honorTerm?? &&  honor.honorTerm.id==t.id>
												<option value="${t.id}" selected="selected">${t.name?html}</option>
											<#else>
												<option value="${t.id}">${t.name?html}</option>
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
							<span class="span3">所获荣誉名称<span class="f_req"></span></span>
							<div class="span9">
					       		<input id="honorName" class="span9" disabled name="honorName" <#if honor?? && honor.honorName??>value="${(honor.honorName!"")}"</#if> />
					       	 </div>
						 </div>
						  <div class="span6">
						 	 <span class="span3">所获荣誉时间<span class="f_req"></span></span>
						 	 <div class="span9">
						 	 	<input type="text" id="honorTime" name="honorTime"  readOnly  style="cursor:pointer;width:260px;" <#if honor?? && honor.honorTime??>value="${honor.honorTime?date}"</#if>
											class="Wdate" />
						 	 	 
						 	 </div>
						 </div>
					</div>
				</div>
				<div class="formSep"> 
					<div class="row-fluid">
						<div class="span6">
							<span class="span3">所获荣誉级别<span class="f_req"></span></span>
						    <div class="span9">
							    <select size="1"  class="span9" disabled id="honorLevel" name="honorLevel.id" aria-controls="dt_gal" >
						         	<option value="" >请选择</option>
									<#if honorTypeList??>
										<#list honorTypeList as h>
											<#if honor?? && honor.honorLevel?? &&  honor.honorLevel.id==h.id>
												<option value="${h.id}" selected="selected">${h.name?html}</option>
											<#else>
												<option value="${h.id}">${h.name?html}</option>
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
				  <div class="span9">
				       <div class="span2">
						 <label>上传附件</label>
					   </div>
						<div class="span10">
							<#if fileList??>	
								<#list fileList as p>
										<div class="fileupload-info">
											<a href="${rc.contextPath}/sys/sysConfig/file.do?id=${p.uploadFile.id}"><strong>${p.uploadFile.name}&nbsp;(${p.uploadFile.fileSize})</strong></a>
											<input   type="hidden" id="fileId" name="fileId" value="${p.uploadFile.id}"/>	
										</div>	
								</#list>
							 </#if> 
						</div>
					</div>
				 </div>
			 </div>
			  <form  id="honorApproveForm" class="form_validation_reg" action="${rc.contextPath}/association/service/opt-save/memberHonorApprove.do" method="post">
				<input id="id" type="hidden" name="id" <#if honor??> value="${honor.id}" </#if> /> 	
				<input id="associationId" type="hidden" name="associationId" <#if associationId??> value="${associationId}" </#if> />
				 	
		        <input id="approveKey" type="hidden" name="approveKey"  value="${(approveKey)!""}">
		        <div class="row-fluid">
					<div class="span12">
						<label>&nbsp;</label>
						<h3 class="heading">审批信息</h3>
					</div>
				</div>
		        <div class="formSep"> 	
					 <div class="row-fluid">
					  	<div class="span6">
							<div class="span3">
				    			<span>审批意见<span class="f_req">*</span></span>
							</div>
				    	  	<div class="span9">
				    	  		 <textarea rows="5" cols="12" id="suggest" name="suggest"  style="width: 730px; height: 134px;"></textarea>
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
							<button class="btn btn-info" type="button" onclick="approve.showApproveComments('${honor.id!""}');">审核历史</button>
			  				<button class="btn" type="button" onclick="javascript:window.history.back(-1);">取 消</button>
			   				
			   		</div>
			   	</div>
			</div>
        </div>
    </div>
   <#-- 审核历史弹出框  end-->
	<#include "/common/approve/approveComment.ftl">
 <script>
 	
 	var myValidator;
  	$("document").ready(function(){
		//页面校验
		 myValidator=$(".form_validation_reg").compValidate({
			rules:{   
					'suggest':{required:true,maxlength:200}
				},
			messages:{
					'suggest':{required:'审批意见不能为空',maxlength:'审批意见最大长度为200'}
			}		
		 });
		 
     });
    function doApprove(approveKey){
    	
    	if("PASS"==approveKey){
			var message = $("#suggest").val();
			if(message == null || message == "" || message =="undefined")
				$("#suggest").val("通过");
				
			if(myValidator.form()){
				comp.confirm("确定要通过吗？", function(result) {
								
					if(!result){
						return; 
					}
					$("#approveKey").val(approveKey);
					$("#honorApproveForm").submit();	
				});
			}
			
		}else if("REJECT"==approveKey){
		  	if(myValidator.form()){
				comp.confirm("确定要拒绝吗？", function(result) {
							
					if(!result){
						return; 
					}
					$("#approveKey").val(approveKey);
					$("#honorApproveForm").submit();	
				});
			}	
		}
    
    }
 </script>
</body>
</html>