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
				就业信息查看
		   </h3>
		  </div>
		 </div> 
		 <input name="errorText" id="errorText" type="hidden" value="${errorText!""}"/>
			 <div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>姓名<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="studentName" name="student.name" readOnly="true" <#if employmentInfo?? && employmentInfo.student??> value="${(employmentInfo.student.name!"")?html}"</#if>/>
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
							<label>学校<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="schoolName" name="schoolName" readOnly value="杭州科技职业技术学院"/>
						</div>
					</div>
						
					<div class="span6">
						<div class="span3">
							<label>学院<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="college" name="college.name" readOnly <#if employmentInfo?? && employmentInfo.student?? &&  employmentInfo.student.college??> value="${(employmentInfo.student.college.name!"")?html}" </#if>/>
						</div>
					</div>
				  </div>
			   </div>
			   
			  <div class="formSep"> 
			   <div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>专业<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="majorName" name="major.majorName" readOnly <#if employmentInfo?? && employmentInfo.student?? && employmentInfo.student.major??>  value="${(employmentInfo.student.major.majorName!"")?html}"</#if>/>
						</div>
					 </div>
						
					<div class="span6">
						<div class="span3">
							<label>班级<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="className" name="classId.className" readOnly <#if employmentInfo?? && employmentInfo.student?? && employmentInfo.student.classId??>  value="${(employmentInfo.student.classId.className!"")?html}"</#if>/>
						</div>
					 </div>
				  </div>
			   </div>
			   
			  <div class="formSep"> 
			   <div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>民族<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="national" name="national" readOnly <#if employmentInfo?? && employmentInfo.student??>  value="${(employmentInfo.student.national!"")?html}"</#if>/>
						</div>
					 </div>
						
					<div class="span6">
						<div class="span3">
							<label>政治面貌<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="politicalDic" name="politicalDic" readOnly <#if employmentInfo?? && employmentInfo.student?? && employmentInfo.student.politicalDic??>  value="${(employmentInfo.student.politicalDic.name!"")?html}"</#if>/>
						</div>
					 </div>
				  </div>
			   </div>
			   
			  <div class="formSep"> 
			   <div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>出生日期<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="brithDate" name="brithDate" readOnly <#if employmentInfo?? && employmentInfo.student??>  value="${(employmentInfo.student.brithDate!"")?string("yyyy-MM")}"</#if>/>
						</div>
					 </div>
						
					<div class="span6">
						<div class="span3">
							<label>生源地<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="sourceLand" name="sourceLand" readOnly <#if native?? && native.name??> value="${(native.name!"")?html}"</#if>/>
						</div>
					 </div>
				  </div>
			   </div> 
			   
			  <div class="formSep"> 
			   <div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>学号<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="stuNumber" name="stuNumber" readOnly <#if employmentInfo?? && employmentInfo.student?? && employmentInfo.student.stuNumber??> value="${((employmentInfo.student.stuNumber)!"")?html}" </#if>/>
						</div>
					 </div>
						
					<div class="span6">
						<div class="span3">
							<label>考生号<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="examNumber" name="examNumber" readOnly <#if employmentInfo?? && employmentInfo.examNumber??> value="${(employmentInfo.examNumber!"")?html}"</#if>/>
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
							<input id="enterDate" name="enterDate" readOnly <#if employmentInfo.enterDate??> value="${(employmentInfo.enterDate!"")?string("yyyy-MM")}"</#if>/>
						</div>
					 </div>
						
					  <div class="span6">
						<div class="span3">
							<label>毕业年月<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="graduateDate" name="graduateDate" readOnly <#if employmentInfo.graduateDate??> value="${(employmentInfo.graduateDate!"")?string("yyyy-MM")}"</#if>/>
						</div>
					</div>
				  </div>
			   </div>
			   
			 <div class="formSep"> 
			   <div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>联系电话<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="homeTel" name="homeTel" readOnly <#if employmentInfo?? && employmentInfo.student??> value="${((employmentInfo.student.homeTel)!"")?html}" </#if>/>
						</div>
					 </div>
						
					<div class="span6">
						<div class="span3">
							<label>手机号<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="phone1" name="phone1" readOnly <#if employmentInfo?? && employmentInfo.student??> value="${(employmentInfo.student.phone1!"")?html}"</#if>/>
						</div>
					 </div>
				  </div>
			   </div>
			   
			 <div class="formSep"> 
			   <div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>QQ号码<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="qq" name="qq" readOnly <#if employmentInfo?? && employmentInfo.student??> value="${((employmentInfo.student.qq)!"")?html}" </#if>/>
						</div>
					 </div>
						
					<div class="span6">
						<div class="span3">
							<label>联系地址<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="homeAddress" name="homeAddress" readOnly <#if employmentInfo?? && employmentInfo.student??> value="${(employmentInfo.student.homeAddress!"")?html}"</#if>/>
						</div>
					 </div>
				  </div>
			   </div>
			   
			 <div class="formSep"> 
			   <div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>电子邮箱<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="email" name="email" readOnly <#if employmentInfo?? && employmentInfo.student??> value="${((employmentInfo.student.email)!"")?html}" </#if>/>
						</div>
					 </div>
						
					<div class="span6">
						<div class="span3">
							<label>邮编<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="homePostCode" name="homePostCode" readOnly <#if employmentInfo?? && employmentInfo.student??> value="${(employmentInfo.student.homePostCode!"")?html}"</#if>/>
						</div>
					 </div>
				  </div>
			   </div>
			   
			  <div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>学历<span class="f_req"></span></label>
						</div>
						<div class="span9">
						 <select disabled="disabled" size="1" id="education" name="education.id" aria-controls="dt_gal">
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
							<label>学制<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="schoolLenth" name="schoolLenth" readOnly <#if employmentInfo?? && employmentInfo.student?? && employmentInfo.student.major??> value="${(employmentInfo.student.major.schoolYear!"")?html}"</#if>/>
						</div>
					 </div>
				  </div>
			   </div> 
			   
			   <div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>学历层次<span class="f_req"></span></label>
						</div>
						<div class="span9">
						 <select disabled="disabled" size="1" id="education" name="education.id" aria-controls="dt_gal">
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
							<label>师范生类别<span class="f_req"></span></label>
						</div>
						<div class="span9">
						 <select disabled="disabled" size="1" id="normalType" name="normalType.id" aria-controls="dt_gal" onchange="changeAidNum()">
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
							<label>招生类别<span class="f_req"></span></label>
						</div>
						<div class="span9">
						 <select disabled="disabled" size="1" id="recruitStudentType" name="recruitStudentType.id" aria-controls="dt_gal">
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
							<label>培养方式<span class="f_req"></span></label>
						</div>
						<div class="span9">
						 <select disabled="disabled" size="1" id="cultureType" name="cultureType.id" aria-controls="dt_gal">
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
			   
			   <div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>困难类别<span class="f_req"></span></label>
						</div>
						<div class="span9">
						 <select disabled="disabled" size="1" id="difficultType" name="difficultType.id" aria-controls="dt_gal">
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
					
					  <div class="span6">
						<div class="span3">
							<label>专业方向<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="majorFrom" name="majorFrom" readOnly <#if employmentInfo?? && employmentInfo.majorFrom??> value="${(employmentInfo.majorFrom!"")?html}"</#if>/>
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
			<input name="check_error" id="check_error" type="hidden" value="true"/>
		</div>
    </div>
  </div>
 </div>
<script>
	
</script>
</body>
</html>
