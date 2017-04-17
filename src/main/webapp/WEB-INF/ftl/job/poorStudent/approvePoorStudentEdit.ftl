<html>
 <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- jQuery UI theme-->
        <link rel="stylesheet" href="${rc.contextPath}/lib/jquery-ui/css/Aristo/Aristo.css" />
        <script src="${rc.contextPath}/lib/jquery-ui/jquery-ui-1.8.20.custom.min.js"></script>
        <!-- animated progressbars -->
        <script src="${rc.contextPath}/js/bdp_fileupload.progressbar.js"></script>
        <script src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script>
        <!-- ajax form-->
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
		<script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
		<!-- bootstrap-fileupload -->	
		<link rel="stylesheet" href="${rc.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.min.css" />
		<!-- multiselect -->
	    <link rel="stylesheet" href="${rc.contextPath}/lib/multiselect/css/multi-select.css" />
		<script src="${rc.contextPath}/lib/multiselect/js/jquery.multi-select.min.js"></script>	
    </head>
<body>
<div id="contentwrapper">
 <div class="main_content">
  <div class="row-fluid">
    <div class="row-fluid">
	   <div class="span12">
	      <h3 class="heading">
			  双困生信息审核
		   </h3>
		  </div>
		 </div> 
		 <input name="errorText" id="errorText" type="hidden" value="${errorText!""}"/>
		   <input id="difficultId" type="hidden" name="difficult.id"  value="${(difficult.id)!""}">
			 <div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>姓名<span class="f_req"></span></label>
						</div>
						<div class="span9">
						<#if poorStudent.studentInfo??>
							<input id="studentName" name="student.name" readOnly="true" value="${(poorStudent.studentInfo.name!"")?html}"/>
					    <#else>
					        <input id="studentName" name="student.name" readOnly="true"/>
					    </#if>
						</div>
					</div>
					
				  <div class="span6">	
			        <div class="span3">
						<label>学号<span class="f_req"></span></label>
					</div>
					<div class="span9">
					<#if poorStudent.studentInfo??>
						<input id="stuNumber" name="student.stuNumber" readOnly="true" value="${(poorStudent.studentInfo.stuNumber!"")?html}"/>
				    <#else>
				        <input id="stuNumber" name="student.stuNumber" readOnly="true"/>
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
							<input id="college" name="college.name" readOnly <#if poorStudent.studentInfo?? &&  poorStudent.studentInfo.college??> value="${(poorStudent.studentInfo.college.name!"")?html}" </#if>/>
						</div>
					</div>
						
					<div class="span6">
						<div class="span3">
							<label>专业<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="majorName" name="major.majorName" readOnly <#if poorStudent.studentInfo?? && poorStudent.studentInfo.major??>  value="${(poorStudent.studentInfo.major.majorName!"")?html}"</#if>/>
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
							<input id="className" name="classId.className" readOnly <#if poorStudent.studentInfo?? && poorStudent.studentInfo.classId??>  value="${(poorStudent.studentInfo.classId.className!"")?html}"</#if>/>
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
										<#if poorStudent.schoolYear ?? && poorStudent.schoolYear.id==d.id >
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
						 <select disabled size="1" id="difficultType" name="difficultType.id" aria-controls="dt_gal">
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
			   
		  <#if poorStudent.otherDifficult?? && poorStudent.otherDifficult.code="Y">   
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
		   	 
		   <form id="poorStudentApproveForm" class="form_validation_reg" action="${rc.contextPath}/job/approvePoorStudent/opt-save/saveApprovePoorStudent.do" method="post"><@token/>
	        <input id="id" type="hidden" name="id"  value="${(poorStudent.id)!""}">
		    <input id="flag" type="hidden" name="flag">
			 <div class="formSep">
				 <div class="row-fluid">
					 <div class="span6">
						<div class="span3">
							<label>审核意见<span class="f_req"></span></label>
						 </div>
					     <div class="span9">
							<#if poorStudent?? && poorStudent.approveReason??>
							    <textarea rows="5" cols="12" id="approveReason" name="approveReason" style="width: 775px; height: 134px;">${(poorStudent.approveReason!"")}</textarea>
							<#else>
							    <textarea rows="5" cols="12" id="approveReason" name="approveReason" style="width: 775px; height: 134px;"></textarea>
						</#if>	
					</div>
				 </div>
			  </div>
		   </div> 
		</form>
		</br>	  
	    <div class="row-fluid">
		 <div class="span6">
		  <div class="span3">
		   </div>
		      <div class="span9">
				    <button class="btn btn-info" type="button" id="save-course" onclick="onSub('1')">通 过</button>
				    <button class="btn btn-info" type="button" id="submit-button" onclick="onSub('0')">拒 绝</button>
				    <button type="button" class="btn btn-info" onclick="cleanForm()">清 空</button>
		  			<button class="btn" type="button" onclick="javascript:window.history.back(-1);">取 消</button>
			  </div>
			</div>
			<input name="check_error" id="check_error" type="hidden" value="true"/>
		</div>
    </div>
  </div>
 </div>
<script>
	
	var attachFlag;
	$("document").ready(function(){
		//页面校验
		attachFlag = $(".form_validation_reg").compValidate({
			rules:{     
					approveReason: {minlength:1,maxlength:500}
				
				},
				messages:{
					approveReason:{maxlength:'审核意见不能超过500字'}
				}
		 });
	});
	
	
	 function onSub(status){
	     var check_error=$("#check_error").val();
	     if(check_error == "true"){
	        if(status=='1'){
	           fillDefaltMessage("通过");
	           comp.confirm("确认要通过吗？", function(result){
                if(!result)
                return; 
	           $("#flag").val("1");
	           $('#poorStudentApproveForm').submit();
	           });  
	        }else{
	            fillDefaltMessage("拒绝");
	            comp.confirm("确认要拒绝吗？", function(result){
                if(!result)
                return; 
	            $("#flag").val("0");
	           $('#poorStudentApproveForm').submit();
	           });  
	        }
	     }
	 }
	
    
        /**
		  * 为审批意见默认赋值
		  */
		function fillDefaltMessage(defultMsg){
		    var curMsg = $.trim($("#approveReason").val());
			if(comp.isNull(curMsg)){
				$("#approveReason").val(defultMsg);
			}
		}	
		
		
	function cleanForm(){
		$("#approveReason").val("");
	}		
	
</script>
</body>
</html>
