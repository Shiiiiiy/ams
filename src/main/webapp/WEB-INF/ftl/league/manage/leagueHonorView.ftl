<html>
 <head>
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
		<!--date-->
		<script language="javascript" type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>	
		<!-- multiselect -->
	    <link rel="stylesheet" href="${rc.contextPath}/lib/multiselect/css/multi-select.css" />
		<script src="${rc.contextPath}/lib/multiselect/js/jquery.multi-select.min.js"></script>
        <script type="text/javascript" src="${rc.contextPath}/js/common/cascadecommon.js"></script>
    </head>
<body>
<div id="contentwrapper">
	<div class="main_content">
		<div class="row-fluid">
    		<div class="row-fluid">
	   			<div class="span12">
				      <h3 class="heading">
								团员荣誉查看
					  </h3>
		  		</div>
		 	</div> 
					<#if honor?? && honor.id??>
							<input type="hidden" id="honorId" name="id" value="${(honor.id!"")?html}"/>
						   	<input type="hidden"  name="memberInfo.id" value="${(honor.memberInfo.id!"")?html}"/>
					<#else>
							<input type="hidden" id="memberInfo.id" name="memberInfo.id" value="${(memberId!"")?html}"/>	
					</#if>
					<div class="formSep"> 
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<span class="formTitle">姓名<span class="f_req"></span></span>
								</div>
								<div class="span9">
								   	 <input  <#if honor?? && honor.memberInfo?? && honor.memberInfo.stuInfo??>value="${honor.memberInfo.stuInfo.name!''}"</#if> readOnly/>
						        </div>
							 </div>
							  <div class="span6">
							 	 <div class="span3">
									<span class="formTitle">学号<span class="f_req"></span></span>
								 </div>
							 	 <div class="span9">
							 	 	<input  <#if honor?? && honor.memberInfo?? && honor.memberInfo.stuInfo??>value="${honor.memberInfo.stuInfo.stuNumber!''}"</#if> readOnly/>
							 	 </div>
							 </div>
						</div>
					</div>
					<div class="formSep"> 
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<span class="formTitle">学院<span class="f_req"></span></span>
								</div>
								<div class="span9">
								    <input  <#if honor?? && honor.memberInfo?? && honor.memberInfo.stuInfo?? && honor.memberInfo.stuInfo.college??>value="${honor.memberInfo.stuInfo.college.name!''}"</#if> readOnly/>
						        </div>
							 </div>
							  <div class="span6">
							 	 <div class="span3">
									<span class="formTitle">专业<span class="f_req"></span></span>
								 </div>
							 	 <div class="span9">
							 	 	<input  <#if honor?? && honor.memberInfo?? && honor.memberInfo.stuInfo?? && honor.memberInfo.stuInfo.major??>value="${honor.memberInfo.stuInfo.major.majorName!''}"</#if> readOnly/>
							 	 </div>
							 </div>
						</div>
					</div>
					<div class="formSep"> 
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<span class="formTitle">班级<span class="f_req"></span></span>
								</div>
								<div class="span9">
									<input  <#if honor?? && honor.memberInfo?? && honor.memberInfo.stuInfo?? && honor.memberInfo.stuInfo.classId??>value="${honor.memberInfo.stuInfo.classId.className!''}"</#if> readOnly/>
						        </div>
							 </div>
							 
						</div>
					</div>
					<div class="formSep"> 
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<span class="formTitle">荣誉学年<span class="f_req"></span></span>
								</div>
								<div class="span9">
								    <select size="1" disabled  id="honorYear" name="honorYear.id" aria-controls="dt_gal" >
							          <option value="" >请选择</option>
										<#if yearList??>
												<#list yearList as y>
													<#if honor?? && honor.honorYear ??&& honor.honorYear.id==y.id >
														<option value="${y.id}"  selected="selected">${y.name?html}</option>
													<#else>
														<option value="${y.id}">${y.name?html}</option>
													</#if>
												</#list>
										</#if>
						         	</select>
						        </div>
							 </div>
							  <div class="span6">
							 	 <div class="span3">
									<span class="formTitle">荣誉学期<span class="f_req"></span></span>
								 </div>
							 	 <div class="span9">
							 	 	<select size="1" disabled   id="term" name="honorTerm.id" aria-controls="dt_gal" >
										<option value="" >请选择</option>
										<#if termList??>
											<#list termList as t>
												<#if honor?? && honor.honorTerm ??&& honor.honorTerm.id==t.id >
													<option value="${t.id}"  selected="selected">${t.name?html}</option>
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
								<div class="span3">
									<span class="formTitle">荣誉名称<span class="f_req"></span></span>
								</div>
								<div class="span9">
						       		<input id="honorName"  readOnly   name="honorName"  <#if honor?? && honor.honorName??> value="${(honor.honorName!"")?html}" </#if>/>
						       	</div>
							 </div>
							  <div class="span6">
							 	 <div class="span3">
									<span class="formTitle">荣誉时间<span class="f_req"></span></span>
								 </div>
							 	 <div class="span9">
							 	 	<input type="text" id="honorTime" name="honorTime"   <#if honor?? && honor.honorTime??> value="${(honor.honorTime)?date}" </#if> style="cursor:pointer;width:210px;" 
											readOnly	class="Wdate"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',skin:'whyGreen',el:$dp.$('honorTime')})" style="cursor:pointer"  />
							 	 	 
							 	 </div>
							 </div>
						</div>
					</div>
					<div class="formSep"> 
						<div class="row-fluid">
							<div class="span6">
							    <div class="span3">
									<span class="formTitle">荣誉级别<span class="f_req"></span></span>
								</div>
							    <div class="span9">
								    <select size="1" disabled  id="honorLevel" name="honorLevel.id" aria-controls="dt_gal" >
							         	<option value="" >请选择</option>
										<#if honorTypeList??>
											<#list honorTypeList as h>
												<#if honor?? && honor.honorLevel ??&& honor.honorLevel.id==h.id >
													<option value="${h.id}"  selected="selected">${h.name?html}</option>
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
								<span class="formTitle">荣誉证明材料</span>
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
			</div>
			 <br/>
	    <div class="row-fluid">
		 	<div class="span6">
		  		<div class="span3">
		   		</div>
		   		 <div class="span9">
		   				<button class="btn" type="button" onclick="javascript:window.close();">关 闭</button>
		   		</div>
		   	</div>
		</div>
		</div>
	</div> 
</div>
</body>
</html>