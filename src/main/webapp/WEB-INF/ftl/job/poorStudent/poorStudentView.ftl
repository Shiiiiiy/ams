<html>
 <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- jQuery UI theme-->
        <link rel="stylesheet" href="${rc.contextPath}/lib/jquery-ui/css/Aristo/Aristo.css" />
        <script src="${rc.contextPath}/lib/jquery-ui/jquery-ui-1.8.20.custom.min.js"></script>
    </head>
<body>
<div id="contentwrapper">
 <div class="main_content">
  <div class="row-fluid">
    <div class="row-fluid">
	   <div class="span12">
	      <h3 class="heading">
			  双困生信息查看
		   </h3>
		  </div>
		 </div> 
		 <input name="errorText" id="errorText" type="hidden" value="${errorText!""}"/>
		   <input id="difficultId" type="hidden" name="difficultStudentInfo.id"  value="${(difficultStudentInfo.id)!""}">
			 <div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>姓名<span class="f_req"></span></label>
						</div>
						<div class="span9">
						<#if poorStudent.difficultStudentInfo?? && poorStudent.difficultStudentInfo.student??>
							<input id="studentName" name="student.name" readOnly="true" value="${(poorStudent.difficultStudentInfo.student.name!"")?html}"/>
					    <#else>
					        <input id="studentName" name="student.name" readOnly="true" value="${(poorStudent.studentInfo.name!"")?html}"/>
					    </#if>
						</div>
					</div>
					
				  <div class="span6">	
			        <div class="span3">
						<label>学号<span class="f_req"></span></label>
					</div>
					<div class="span9">
					<#if poorStudent.difficultStudentInfo?? && poorStudent.difficultStudentInfo.student??>
						<input id="stuNumber" name="student.stuNumber" readOnly="true" value="${(poorStudent.difficultStudentInfo.student.stuNumber!"")?html}"/>
				    <#else>
				        <input id="stuNumber" name="student.stuNumber" readOnly="true" value="${(poorStudent.studentInfo.stuNumber!"")?html}"/>
				    </#if>
					</div>
				  </div>
			   </div>
			 </div>
			 
			  <div class="formSep"> 
			   <div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>学院<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="college" name="college.name" readOnly <#if poorStudent.difficultStudentInfo?? && poorStudent.difficultStudentInfo.student?? &&  poorStudent.difficultStudentInfo.student.college??> value="${(poorStudent.difficultStudentInfo.student.college.name!"")?html}"<#else> value="${(poorStudent.studentInfo.college.name!"")?html}"</#if>/>
						</div>
					</div>
						
					<div class="span6">
						<div class="span3">
							<label>专业<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="majorName" name="major.majorName" readOnly <#if poorStudent.difficultStudentInfo?? && poorStudent.difficultStudentInfo.student?? && poorStudent.difficultStudentInfo.student.major??>  value="${(poorStudent.difficultStudentInfo.student.major.majorName!"")?html}"<#else> value="${(poorStudent.studentInfo.major.majorName!"")?html}"</#if>/>
						</div>
					 </div>
				  </div>
			   </div>
			   
			  <div class="formSep"> 
			   <div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>班级<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="className" name="classId.className" readOnly <#if poorStudent.difficultStudentInfo?? && poorStudent.difficultStudentInfo.student?? && poorStudent.difficultStudentInfo.student.classId??>  value="${(poorStudent.difficultStudentInfo.student.classId.className!"")?html}"<#else> value="${(poorStudent.studentInfo.classId.className!"")?html}"</#if>/>
						</div>
					 </div>
						
					<div class="span6">
						<div class="span3">
							<label>学年<span class="f_req"></span></label>
						</div>
						<div class="span9">
						 <select size="1" disabled="disabled" id="schoolYear" name="schoolYear.id" aria-controls="dt_gal">
							  <option value="" />请选择..</option>
								<#if yearList ??>
									<#list yearList as d>
										<#if poorStudent.difficultStudentInfo?? && poorStudent.difficultStudentInfo.schoolYear ?? && poorStudent.difficultStudentInfo.schoolYear.id==d.id >
											<option  value="${d.id}" selected="selected" />${d.name?html}</option>
										<#elseif poorStudent?? && poorStudent.schoolYear?? && poorStudent.schoolYear.id==d.id>
										    <option  value="${d.id}" selected="selected" />${d.name?html}</option>
										<#else>
											<option value="${d.id}" />${d.name?html}</option>
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
							<label>困难类别<span class="f_req"></span></label>
						</div>
						<div class="span9">
						 <select size="1" disabled="disabled" id="difficultType" name="difficultType.id" aria-controls="dt_gal">
						  <option value="" />请选择..</option>
								<#if difficultTypeList ??>
									<#list difficultTypeList as d>
										<#if poorStudent?? && poorStudent.difficultType ?? && poorStudent.difficultType.id==d.id >
											<option  value="${d.id}" selected="selected" />${d.name?html}</option>
										<#else>
											<option value="${d.id}" />${d.name?html}</option>
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
					<label>困难原因<span class="f_req"></span></label>
				 </div>
				  <div class="span9">
					<#if poorStudent?? && poorStudent.reason??>
					    <textarea rows="5" cols="12" id="reason" name="reason" readOnly style="width: 772px; height: 148px;">${(poorStudent.reason!"")}</textarea>
					<#else>
					    <textarea rows="5" cols="12" id="reason" name="reason" readOnly style="width: 772px; height: 148px;"></textarea>
					</#if>	
				</div>
			  </div>
			 </div>
			</div>
			
			<#if poorStudent?? && poorStudent.status?? && poorStudent.status.code!="SAVE"> 
			 <div class="formSep">
				 <div class="row-fluid">
					 <div class="span6">
						<div class="span3">
							<label>审核意见<span class="f_req"></span></label>
						 </div>
					     <div class="span9">
							<#if poorStudent?? && poorStudent.approveReason??>
							    <textarea rows="5" cols="12" id="approveReason" name="approveReason" readOnly style="width: 775px; height: 134px;">${(poorStudent.approveReason!"")}</textarea>
							<#else>
							    <textarea rows="5" cols="12" id="approveReason" name="approveReason" readOnly style="width: 775px; height: 134px;"></textarea>
						</#if>	
					</div>
				 </div>
			  </div>
		   </div>
		 </#if> 
		<div class="formSep">
			<div class="row-fluid">					
			  <div class="span9">
			    <div class="span2">
					 <label>材料<span class="f_req"></span></label>
				    </div>
					<div class="span10" id="_upload_div">
						 <#if uploadFileRefList??>	
							<#list uploadFileRefList as p>
								<div class="fileupload-info">
									<a href="${rc.contextPath}/sys/sysConfig/file.do?id=${p.uploadFile.id}"><strong>${p.uploadFile.name}&nbsp;(${p.uploadFile.fileSize})</strong></a>
									<input type="hidden" name="fileId" value="${p.uploadFile.id}"/>	
								</div>					
							</#list>
						 </#if> 
					</div>
				</div>
			 </div>
		  </div>
		 </br>	  
	    <div class="row-fluid">
		 <div class="span6">
		  <div class="span3">
		   </div>
		      <div class="span9">
				   <button class="btn" type="button" onclick="javascript:window.close();">关 闭</button>
			  </div>
			</div>
			<input name="check_error" id="check_error" type="hidden" value="true"/>
		</div>
    </div>
  </div>
 </div>
<script>
	
	
</script>
</body>
</html>
