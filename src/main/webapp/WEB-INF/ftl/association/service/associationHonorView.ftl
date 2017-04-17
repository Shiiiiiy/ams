<html>
 <head>
 <meta charset="utf-8" />
    	<meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
   		<link rel="stylesheet" href="${rc.contextPath}/lib/My97DatePicker/skin/WdatePicker.css" />
		<script type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
     	<link rel="stylesheet" href="${rc.contextPath}/lib/jquery-ui/css/Aristo/Aristo.css" />
        <script src="${rc.contextPath}/lib/jquery-ui/jquery-ui-1.8.20.custom.min.js"></script>
        <script src="${rc.contextPath}/js/common/common_approve.js"></script>
		<!-- bootstrap-fileupload -->	
		<link rel="stylesheet" href="${rc.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.min.css" />
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
							<span class="span2"><label>姓名</label></span>
							<div class="span9">
							    <input id="name" readOnly  <#if honor?? && honor.member??&& honor.member.memberPo??>value="${(honor.member.memberPo.name!"")}"</#if> />
					        </div>
						 </div>
						  <div class="span6">
						 	 <span class="span2"><label>学号</label></span>
						 	 <div class="span8">
							    <input id="stuNumber" readOnly   <#if honor?? && honor.member??&& honor.member.memberPo??>value="${(honor.member.memberPo.stuNumber!"")}"</#if> />
						 	 
						 	 </div>
						 </div>
					</div>
				</div>
				<div class="formSep"> 
					<div class="row-fluid">
						<div class="span6">
							<span class="span2"><label>班级</label></span>
							<div class="span9">
							   		<input id="college" readOnly   <#if honor??&& honor.member?? && honor.member.memberPo??&& honor.member.memberPo.classId??>value="${(honor.member.memberPo.classId.className!"")}"</#if> />
					        </div>
						 </div>
						  <div class="span6">
						 	 <span class="span2"><label>专业</label></span>
						 	 <div class="span9">
						 	 		<input id="major" readOnly  <#if honor?? && honor.member??&&honor.member.memberPo??&& honor.member.memberPo.major??>value="${(honor.member.memberPo.major.majorName!"")}"</#if> />
						 	 	
						 	 </div>
						 </div>
					</div>
				</div>
				<div class="formSep"> 
					<div class="row-fluid">
						<div class="span6">
							<span class="span2"><label>荣誉学年</label></span>
							<div class="span9">
							    <select size="1"   disabled id="honorYear" name="honorYear.id" aria-controls="dt_gal" >
						          <option value=""><#if honor.honorYear?? >${honor.honorYear.name!""}</#if></option>
					         	</select>
					        </div>
						 </div>
						  <div class="span6">
						 	 <span class="span2"><label>荣誉学期</label></span>
						 	 <div class="span9">
						 	 	<select size="1"   disabled id="term" name="honorTerm.id" aria-controls="dt_gal" >
									<option value="" ><#if honor.honorTerm?? >${honor.honorTerm.name!""}</#if></option>
								</select>	
						 	 </div>
						 </div>
					</div>
				</div>
				<div class="formSep"> 
					<div class="row-fluid">
						 <div class="span6">
							<span class="span2"><label>荣誉级别</label></span>
						    <div class="span9">
							    <select size="1"   disabled id="honorLevel" name="honorLevel.id" aria-controls="dt_gal" >
						         	<option value="" ><#if honor.honorLevel?? >${honor.honorLevel.name!""}</#if></option>
					         	</select>
				         	</div>
						 </div>
						  <div class="span6">
						 	 <span class="span2"><label>荣誉时间</label></span>
						 	 <div class="span9">
						 	 	<input type="text" id="honorTime" name="honorTime"  readOnly <#if honor?? && honor.honorTime??>value="${honor.honorTime?date}"</#if>/>
						 	 	 
						 	 </div>
						 </div>
					</div>
				</div>
				<div class="formSep"> 
					<div class="row-fluid">
						<div class="span6">
							<span class="span2"><label>荣誉名称</label></span>
							<div class="span10">
					       		<input id="honorName" disabled name="honorName" <#if honor?? && honor.honorName??>value="${(honor.honorName!"")}"</#if> />
					       	 </div>
						 </div>
					</div>
				</div>
			  <div class="formSep">
				<div class="row-fluid">					
				  <div class="span12">
				       <div class="span1">
						 <label>荣誉附件</label>
					   </div>
						<div class="span8">
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
			 <br/>
		    <div class="row-fluid">
			 	<div class="span12">
			  		<div class="span1"><label></label></div>
			   		 <div class="span8">
						<button class="btn btn-info" type="button" onclick="approve.showApproveComments('${honor.id!""}');">审核历史</button>
		   				<button class="btn" type="button" onclick="javascript:window.close();">关 闭</button>
			   		</div>
			   	</div>
			</div>
        </div>
    </div>
   <#-- 审核历史弹出框  end-->
	<#include "/common/approve/approveComment.ftl">
</body>
</html>