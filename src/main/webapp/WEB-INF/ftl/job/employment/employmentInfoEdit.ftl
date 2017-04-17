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
        <script type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
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
				<#if employmentInfo?? && employmentInfo.id??>
					生源信息修改
				<#else>
					生源信息维护
				</#if>
		   </h3>
		  </div>
		 </div> 
		 <input name="errorText" id="errorText" type="hidden" value="${errorText!""}"/>
		 <#if employmentInfo?? && employmentInfo.id?? >
			<form  id="employmentInfoForm" class="form_validation_reg" action="${rc.contextPath}/job/employment/opt-update/updateEmploymentInfo.do" method="post"><@token/>
		 <#else>
			<form  id="employmentInfoForm" class="form_validation_reg" action="${rc.contextPath}/job/employment/opt-save/saveEmploymentInfo.do" method="post"><@token/>
		 </#if>
		   <input id="id" type="hidden" name="id"  value="${(employmentInfo.id)!""}">
		   <input id="college" type="hidden" name="college"  value="${collegeId!""}">
			 <div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>姓名<span class="f_req">*</span></label>
						</div>
						<div class="span9 input-append">
						<#if employmentInfo?? && employmentInfo.student??>
							<input id="studentName" name="student.name" readOnly="true" value="${(employmentInfo.student.name!"")?html}"/>
							<a style="cursor:pointer;margin-left:-4px;" onclick="selectStudentRadio(${(employmentInfo.student.id)!''})" title="选择" class="btn"><i class="icon-search"></i></a>
					    <#else>
					        <input id="studentName" name="student.name"  readOnly="true" />
					        <a style="cursor:pointer;margin-left:-4px;" onclick="selectStudentRadio(${(employmentInfo.student.id)!''})" title="选择" class="btn"><i class="icon-search"></i></a>
					    </#if>   
					        <input name="student.id" id="studentId" type="hidden" value="${(employmentInfo.student.id)!''}"/> 
						</div>
					</div>
					
					<div class="span6">
						<div class="span3">
							<label>性别<span class="f_req"></span></label>
						</div>
						<div class="span9">
						 <#if genderList??>
							<#list genderList as a>
				    			<#if employmentInfo?? && employmentInfo.student?? && employmentInfo.student.genderDic.id==a.id >
    				    				<label class="radio inline">
											<input type="radio" id="sexId" name="genderDic.name" disabled checked="checked" value="${a.id}" />${a.name?html}
										</label>
    				    			
				    			<#else>
				    				<label class="radio inline">
										<input type="radio" id="sexId" name="genderDic.name" disabled  value="${a.id}" />${a.name?html}
									</label>
				    		   </#if>
		    			  </#list>
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
							<input id="collegeName" name="college.name" readOnly <#if employmentInfo?? && employmentInfo.student?? &&  employmentInfo.student.college??> value="${(employmentInfo.student.college.name!"")?html}" </#if>/>
						</div>
					</div>
						
					<div class="span6">
						<div class="span3">
							<label>专业<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="majorName" name="major.majorName" readOnly <#if employmentInfo?? && employmentInfo.student?? && employmentInfo.student.major??>  value="${(employmentInfo.student.major.majorName!"")?html}"</#if>/>
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
							<input id="className" name="classId.className" readOnly <#if employmentInfo?? && employmentInfo.student?? && employmentInfo.student.classId??>  value="${(employmentInfo.student.classId.className!"")?html}"</#if>/>
						</div>
					 </div>
						
					<div class="span6">
						<div class="span3">
							<label>学号<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="stuNumber" name="stuNumber" readOnly <#if employmentInfo?? && employmentInfo.student?? && employmentInfo.student.stuNumber??> value="${((employmentInfo.student.stuNumber)!"")?html}" </#if>/>
						</div>
					 </div>
				  </div>
			   </div>
			   
			   <div class="formSep"> 
			    <div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>身份证号<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="certificateCode" name="certificateCode" readOnly <#if employmentInfo?? && employmentInfo.student??>  value="${(employmentInfo.student.certificateCode!"")?html}"</#if>/>
						</div>
					 </div>
						
					  <div class="span6">
						<div class="span3">
							<label>考生号<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="examNumber" name="examNumber" <#if employmentInfo?? && employmentInfo.examNumber??> value="${(employmentInfo.examNumber!"")?html}"</#if>/>
						</div>
					</div>
				  </div>
			   </div>
			  
			   <div class="formSep"> 
			    <div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>入学年月<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="enterDate" name="enterDate" <#if employmentInfo.enterDate??> value="${(employmentInfo.enterDate!"")?string("yyyy-MM")}"</#if> onclick="WdatePicker({dateFmt:'yyyy-MM',skin:'whyGreen'});"/>
						</div>
					 </div>
						
					  <div class="span6">
						<div class="span3">
							<label>毕业年月<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="graduateDate" name="graduateDate" <#if employmentInfo.graduateDate??> value="${(employmentInfo.graduateDate!"")?string("yyyy-MM")}"</#if> onclick="WdatePicker({dateFmt:'yyyy-MM',skin:'whyGreen'});"/>
						</div>
					</div>
				  </div>
			   </div>
			  
			  <#--> 
			   <div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>生源地<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="sourceLand" name="sourceLand" readOnly <#if employmentInfo?? && employmentInfo.student?? && employmentInfo.student.sourceLand??> value="${(employmentInfo.student.sourceLand!"")?html}"</#if>/>
						</div>
					</div>
						
					   <div class="span6">
						<div class="span3">
							<label>生源地代码<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="sourceLandCode" name="sourceLandCode" <#if employmentInfo?? && employmentInfo.sourceLandCode??> value="${(employmentInfo.sourceLandCode!"")?html}"</#if>/>
						</div>
					 </div>
				  </div>
			   </div>
			   -->
			   <div class="formSep">
				 <div class="row-fluid">
					 <div class="span6">
						<div class="span3">
							<label>专业方向<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="majorFrom" name="majorFrom" <#if employmentInfo?? && employmentInfo.majorFrom??> value="${(employmentInfo.majorFrom!"")?html}"</#if>/>
						</div>
					 </div>
					 
					 <div class="span6">
						<div class="span3">
							<label>困难类别<span class="f_req">*</span></label>
						</div>
						<div class="span9">
						 <select size="1" id="difficultType" name="difficultType.id" aria-controls="dt_gal">
						  <option value="" />请选择..</option>
								<#if difficultTypeList ??>
									<#list difficultTypeList as d>
										<#if employmentInfo?? && employmentInfo.difficultType ?? && employmentInfo.difficultType.id==d.id >
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
							<label>学历<span class="f_req">*</span></label>
						</div>
						<div class="span9">
						 <select size="1" id="education" name="education.id" aria-controls="dt_gal">
							  <option value="" />请选择..</option>
								<#if educationList ??>
									<#list educationList as d>
										<#if employmentInfo?? && employmentInfo.education ?? && employmentInfo.education.id==d.id >
											<option  value="${d.id}" selected="selected" />${d.name?html}</option>
										<#else>
											<option value="${d.id}" />${d.name?html}</option>
										</#if>
									</#list>
								</#if>
						 	</select>
						</div>
					</div>
					
					<div class="span6">
						<div class="span3">
							<label>师范生类别<span class="f_req">*</span></label>
						</div>
						<div class="span9">
						 <select size="1" id="normalType" name="normalType.id" aria-controls="dt_gal" onchange="changeAidNum()">
							  <option value="" />请选择..</option>
								<#if normalList ??>
									<#list normalList as d>
										<#if employmentInfo?? && employmentInfo.normalType ?? && employmentInfo.normalType.id==d.id >
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
							<label>招生类别<span class="f_req">*</span></label>
						</div>
						<div class="span9">
						 <select size="1" id="recruitStudentType" name="recruitStudentType.id" aria-controls="dt_gal">
							  <option value="" />请选择..</option>
								<#if recruitList ??>
									<#list recruitList as d>
										<#if employmentInfo?? && employmentInfo.recruitStudentType ?? && employmentInfo.recruitStudentType.id==d.id >
											<option  value="${d.id}" selected="selected" />${d.name?html}</option>
										<#else>
											<option value="${d.id}" />${d.name?html}</option>
										</#if>
									</#list>
								</#if>
						 	</select>
						</div>
					</div>
					
					<div class="span6">
						<div class="span3">
							<label>培养方式<span class="f_req">*</span></label>
						</div>
						<div class="span9">
						 <select size="1" id="cultureType" name="cultureType.id" aria-controls="dt_gal">
							  <option value="" />请选择..</option>
								<#if cultureList ??>
									<#list cultureList as d>
										<#if employmentInfo?? && employmentInfo.cultureType ?? && employmentInfo.cultureType.id==d.id >
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
			   
			   <#-->
			   <div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>学年<span class="f_req">*</span></label>
						</div>
						<div class="span9">
						 <select size="1" id="schoolYear" name="schoolYear.id" aria-controls="dt_gal">
							  <option value="" />请选择..</option>
								<#if yearList ??>
									<#list yearList as d>
										<#if employmentInfo?? && employmentInfo.schoolYear ?? && employmentInfo.schoolYear.id==d.id >
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
			  </div>-->	
		     </form>
         <br/> 
	    <div class="row-fluid">
		 <div class="span6">
		  <div class="span3">
		   </div>
		      <div class="span9">
				    <button class="btn btn-info" type="button" id="save-course" onclick="onSub()">保 存</button>
		  			<button class="btn" type="button" onclick="javascript:window.history.back(-1);">取 消</button>
			  </div>
			</div>
			<input name="check_error" id="check_error" type="hidden" value="true"/>
		</div>
    </div>
  </div>
 </div>
 <#-- 学生选择单选组件的引入 -->
<#include "/comp/student/queryGraduateStudentRadioModal.ftl">
<script>

    var attachFlag;
    // 单选学生选择 
	function selectStudentRadio(id)
	{   
	    var collegeId = $("#college").val();
		_queryStudentRadioAll(id,collegeId);
	}
	function setStudentRadioSelectValue(student)
	{   
	    $("#studentId").val(student.id);
	    $("#studentName").val(student.name);
	    if(studentIdCheck() ==true){
		    $("#stuNumber").val(student.id);
		    $("#sourceLand").val(student.sourceLand);
			$(":radio[name='genderDic.name'][value="+student.genderId+"]").attr("checked",true);
		    $("#collegeName").val(student.collegeName);
		    $("#majorName").val(student.majorName);
		    $("#className").val(student.className);
		    $("#certificateCode").val(student.certificateCode);
	    }
	}
	
	
	
	$("document").ready(function(){
		//页面校验
		//var data={id:'${(employmentInfo.id)!""}',studentId:function(){return $("#studentId").val();}};
		//comp.validate.addRemote("studentIdCheck","${rc.contextPath}/job/employment/opt-query/studentCheck.do",data,"该学生已经维护了就业信息。");
		attachFlag = $(".form_validation_reg").compValidate({
			rules:{     
					'student.name': {required:true},
					majorFrom: {minlength:1,maxlength:100},
					'isWork.id': {required:true},
					'isIndependent.id': {required:true},
					'recruitStudentType.id': {required:true},
					'cultureType.id': {required:true},
					'education.id': {required:true},
					'normalType.id': {required:true},
					'difficultType.id': {required:true},
					directional: {minlength:1,maxlength:100},
					'schoolYear.id': {required:true}
				
				},
				messages:{
					'student.name':{required:'姓名不能为空！'},
					 majorFrom:{maxlength:'专业方向不能超过100字'},
					'education.id':{required:'学历不能为空！'},
					'normalType.id':{required:'师范类别不能为空！'},
					'isWork.id':{required:'是否在职不能为空！'},
					'isIndependent.id':{required:'是否独立不能为空！'},
					'recruitStudentType.id':{required:'招生类别不能为空！'},
					'cultureType.id':{required:'培养方式不能为空！'},
					'difficultType.id':{required:'困难类别不能为空！'},
					directional:{maxlength:'定向或委培单位不能超过100字'},
					'schoolYear.id':{required:'学年不能为空！'}
				}
		 });
	});
	
	
	
	//判断添加的学生是否存在
	function studentIdCheck(){
		var flag = false;
		var studentName = $("#studentName").val();
		$.ajax({
			url:"${rc.contextPath}/job/employment/opt-query/studentCheck.do",
			data:{id:$("#id").val(),studentId:$("#studentId").val()},
			dataType:"text",
			type:"POST",
			async:false,
			success:function(data){
				if(data == "false"){
					flag =  true;//不存在
				}else{
					flag =  false;//存在
					$.sticky(studentName+"同学已经维护过就业信息了！", {autoclose:5000, position:"top-right", type:"st-error"});
				}
			}
		});
		return flag;
	}

	
	 function onSub(){
	     if(studentIdCheck() ==true){
		     var check_error=$("#check_error").val();
		     if(check_error == "true"){
		         $('#employmentInfoForm').submit();
		     }
		  }   
	 }
	
   
				
	
</script>
</body>
</html>
