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
		<script src="${rc.contextPath}/js/apw/apw_check.js"></script>
		<script src="${rc.contextPath}/js/common/common_approve.js"></script>
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
				<#if difficultStudent?? && difficultStudent.id??>
					困难生修改
				<#else>
					困难生申请
				</#if>
		   </h3>
		  </div>
		 </div> 
		 <input name="errorText" id="errorText" type="hidden" value="${errorText!""}"/>
				<#if difficultStudent.id?? >
					<form  id="studentInfoForm" class="form_validation_reg" action="${rc.contextPath}/sponsor/difficultStudent/opt-update/saveDifficultStudent.do" method="post"><@token/>
				<#else>
					<form  id="studentInfoForm" class="form_validation_reg" action="${rc.contextPath}/sponsor/difficultStudent/opt-save/saveDifficultStudent.do" method="post" ><@token/>
				</#if>
		   <input id="id" type="hidden" name="id"  value="${(difficultStudent.id)!""}">
		   <input id="studentId" type="hidden" name="student.id"  value="${(user_key.userId)!''}">
		   <input id="flags" type="hidden" name="flags"  value="${(flags)!""}">
			 <div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>姓名<span class="f_req">*</span></label>
						</div>
						<div class="span9">
							<input id="student.name" name="student.name" readOnly <#if studentInfo??> value="${(studentInfo.name!"")?html}" </#if>/>
						</div>
					</div>
					<div class="span6">
						<div class="span3">
							<label>学号<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="stuNumber" name="stuNumber" readOnly value="${((studentInfo.stuNumber)!"")?html}"/>
						</div>
					</div>	
				  </div>
			   </div>
			<#-- 
			 <div class="formSep"> 
			   <div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>名族<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="national" name="national" readOnly <#if studentInfo??> value="${(studentInfo.national!"")?html}" </#if>/>
						</div>
					</div>
						
					<div class="span6">
						<div class="span3">
							<label>身份证号<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="certificateCode" name="certificateCode" readOnly <#if studentInfo?? && studentInfo.certificateCode??>  value="${((studentInfo.certificateCode)!"")?html}"</#if>/>
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
							<input id="college" name="college.name" readOnly <#if studentInfo?? && studentInfo.college??> value="${(studentInfo.college.name!"")?html}" </#if>/>
						</div>
					</div>
						
					<div class="span6">
						<div class="span3">
							<label>班级<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="className" name="classId.className" readOnly <#if studentInfo?? && studentInfo.classId??>  value="${(studentInfo.classId.className!"")?html}"</#if>/>
						</div>
					 </div>
				  </div>
			   </div>
			   
			  <div class="formSep"> 
			   <div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>性别<span class="f_req"></span></label>
						</div>
						<div class="span9">
						 <#if genderList??>
							<#list genderList as a>
				    			<#if studentInfo?? && studentInfo.genderDic?? && studentInfo.genderDic.id==a.id >
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
						
					<div class="span6">
						<div class="span3">
							<label>政治面貌<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="politicalDic" name="politicalDic.name" readOnly <#if studentInfo?? && studentInfo.politicalDic??>  value="${((studentInfo.politicalDic.name)!"")?html}"</#if>/>
						</div>
					 </div>
				  </div>
			   </div>
			   
			   <div class="formSep"> 
			   <div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>出生年月<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="brithDate" name="brithDate" readOnly <#if studentInfo?? && studentInfo.brithDate??> value="${(studentInfo.brithDate!"")?string("yyyy-MM-dd")}"</#if>/>
						</div>
					</div>
						
					<div class="span6">
						<div class="span3">
							<label>联系方式<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="phone1" name="phone1" readOnly <#if studentInfo?? && studentInfo.phone1??>  value="${((studentInfo.phone1)!"")?html}"</#if>/>
						</div>
					 </div>
				  </div>
			   </div>
			  -->   
			    <div class="formSep">
				 <div class="row-fluid">
				   <div class="span6">
					  <div class="span3">
						  <label>学年<span class="f_req">*</span></label>
						</div>
						<div class="span9">
						   <select size="1" id="schoolYear" name="schoolYear.id" aria-controls="dt_gal" >
							  <option value="" />请选择..</option>
								<#if yearList ??>
									<#list yearList as d>
										<#if difficultStudent?? && difficultStudent.schoolYear ?? && difficultStudent.schoolYear.id==d.id >
											     <option  value="${d.id}" selected="selected" />${d.name?html}</option>
										<#elseif nowYearDic?? && d.id==nowYearDic.id>
												<option value="${d.id}" selected="selected">${d.name}</option>
										<#else>
												<option value="${d.id}" >${d.name}</option>	
										</#if>
									</#list>
								</#if>
						    </select>
					    </div>
					</div>
						
					 <div class="span6">
						<div class="span3">
							<label>助学贷款<span class="f_req"></span></label>
						</div>
					   <div class="span9">
					     <select size="1" id="isStudentLoan" name="isStudentLoan.id" aria-controls="dt_gal">
			    			 <#if isStudnetList ??>
								<#list isStudnetList as d>
									<#if difficultStudent?? && difficultStudent.isStudentLoan ?? && difficultStudent.isStudentLoan.id==d.id >
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
							<label>人均年收入<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="perCapita" name="perCapita" value="${(difficultStudent.perCapita!"")?html}"/>(元)
						</div>
					</div>
						
					<div class="span6">
						<div class="span3">
							<label>家庭经济情况<span class="f_req"></span></label>
						</div>
						<div class="span9">
						    <select size="1" id="familyFinance" name="familyFinance.id" aria-controls="dt_gal">
							  <option value="" />请选择..</option>
								<#if financeList ??>
									<#list financeList as d>
										<#if difficultStudent?? && difficultStudent.familyFinance ?? && difficultStudent.familyFinance.id==d.id >
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
							<label>户口类型<span class="f_req"></span></label>
						</div>
						<div class="span9">
						  <#if accountList??>
							<#list accountList as a>
				    			<#if difficultStudent?? && difficultStudent.accountType?? && difficultStudent.accountType.id==a.id >
    				    			<label class="radio inline">
											<input type="radio" id="accountType" name="accountType.id" checked="checked" value="${a.id}" />${a.name?html}
									</label>
    				    		<#elseif accountDic?? && accountDic.id == a.id>
    				    		    <label class="radio inline">
											<input type="radio" id="accountType" name="accountType.id" checked="checked" value="${a.id}" />${a.name?html}
									</label>	
				    			<#else>
				    				<label class="radio inline">
										<input type="radio" id="accountType" name="accountType.id" value="${a.id}" />${a.name?html}
									</label>
				    		   </#if>
		    			   </#list>
		    			 </#if>
					  </div>
					</div>
						
					<div class="span6">
						<div class="span3">
							<label>是否烈士子女<span class="f_req"></span></label>
						</div>
						<div class="span9">
						  <#if martyrList??>
							<#list martyrList as a>
				    			<#if difficultStudent?? && difficultStudent.isMartyr?? && difficultStudent.isMartyr.id==a.id >
				    				<label class="radio inline">
										<input type="radio" id="isMartyr" name="isMartyr.id" checked="checked" value="${a.id}" />${a.name?html}
									</label>
    				    		<#elseif singleDic?? && singleDic.id == a.id>
    				    		    <label class="radio inline">
										<input type="radio" id="isMartyr" name="isMartyr.id" checked="checked" value="${a.id}" />${a.name?html}
									</label>	
				    			<#else>
				    				<label class="radio inline">
										<input type="radio" id="isMartyr" name="isMartyr.id" value="${a.id}" />${a.name?html}
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
							<label>经济情况调查表<span class="f_req"></span></label>
						</div>
						<div class="span9">
						 <#if surveyList??>
							<#list surveyList as a>
				    			<#if difficultStudent?? && difficultStudent.familySurvey?? && difficultStudent.familySurvey.id==a.id >
    				    			<label class="radio inline">
											<input type="radio" id="familySurvey" name="familySurvey.id" checked="checked" value="${a.id}" />${a.name?html}
									</label>
    				    		<#elseif noDic?? && noDic.id == a.id>
    				    		    <label class="radio inline">
											<input type="radio" id="familySurvey" name="familySurvey.id" checked="checked" value="${a.id}" />${a.name?html}
									</label>	
				    			<#else>
				    				<label class="radio inline">
										<input type="radio" id="familySurvey" name="familySurvey.id" value="${a.id}" />${a.name?html}
									</label>
				    		   </#if>
		    			  </#list>
		    			 </#if>
						</div>
					</div>
						
					<div class="span6">
						<div class="span3">
							<label>村级（社区）证明<span class="f_req"></span></label>
						</div>
						<div class="span9">
						 <#if villageList??>
							<#list villageList as a>
				    			<#if difficultStudent?? && difficultStudent.villageProve?? && difficultStudent.villageProve.id==a.id >
    				    			<label class="radio inline">
											<input type="radio" id="villageProve" name="villageProve.id" checked="checked" value="${a.id}" />${a.name?html}
									</label>
    				    		<#elseif noDic?? && noDic.id == a.id>	
    				    		    <label class="radio inline">
											<input type="radio" id="villageProve" name="villageProve.id" checked="checked" value="${a.id}" />${a.name?html}
									</label>
				    			<#else>
				    				<label class="radio inline">
										<input type="radio" id="villageProve" name="villageProve.id" value="${a.id}" />${a.name?html}
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
							<label>镇级（街道）证明<span class="f_req"></span></label>
						</div>
						<div class="span9">
						 <#if townList??>
							<#list townList as a>
				    			<#if difficultStudent?? && difficultStudent.townProve?? && difficultStudent.townProve.id==a.id >
				    				<label class="radio inline">
										<input type="radio" id="townProve" name="townProve.id" checked="checked" value="${a.id}" />${a.name?html}
									</label>
    				    		<#elseif noDic?? && noDic.id == a.id>	
    				    		    <label class="radio inline">
										<input type="radio" id="townProve" name="townProve.id" checked="checked" value="${a.id}" />${a.name?html}
									</label>
				    			<#else>
				    				<label class="radio inline">
										<input type="radio" id="townProve" name="townProve.id" value="${a.id}" />${a.name?html}
									</label>
				    		   </#if>
		    			  </#list>
		    			 </#if>
						</div>
					</div>
						
					<div class="span6">
						<div class="span3">
							<label>县级（区、市）证明<span class="f_req"></span></label>
						</div>
						<div class="span9">
						 <#if countyList??>
							<#list countyList as a>
				    			<#if difficultStudent?? && difficultStudent.countyProve?? && difficultStudent.countyProve.id==a.id >
				    				<label class="radio inline">
										<input type="radio" id="countyProve" name="countyProve.id" checked="checked" value="${a.id}" />${a.name?html}
									</label>
    				    		<#elseif noDic?? && noDic.id == a.id>
    				    		    <label class="radio inline">
										<input type="radio" id="countyProve" name="countyProve.id" checked="checked" value="${a.id}" />${a.name?html}
									</label>		
				    			<#else>
				    				<label class="radio inline">
										<input type="radio" id="countyProve" name="countyProve.id" value="${a.id}" />${a.name?html}
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
							<label>是否是孤儿<span class="f_req"></span></label>
						</div>
					   <div class="span9">
					     <#if isOrphanList??>
							<#list isOrphanList as a>
				    			<#if difficultStudent?? && difficultStudent.isOrphan?? && difficultStudent.isOrphan.id==a.id >
				    				<label class="radio inline">
										<input type="radio" id="isOrphan" name="isOrphan.id" checked="checked" value="${a.id}" />${a.name?html}
									</label>
    				    		<#elseif singleDic?? && singleDic.id == a.id>
    				    		    <label class="radio inline">
										<input type="radio" id="isOrphan" name="isOrphan.id" checked="checked" value="${a.id}" />${a.name?html}
									</label>	
				    			<#else>
				    				<label class="radio inline">
										<input type="radio" id="isOrphan" name="isOrphan.id" value="${a.id}" />${a.name?html}
									</label>
				    		   </#if>
		    			  </#list>
		    			 </#if>
					  </div>
					</div>
						
					<div class="span6">
						<div class="span3">
							<label>是否单亲<span class="f_req"></span></label>
						</div>
						<div class="span9">
						 <#if isSingleList??>
							<#list isSingleList as a>
				    			<#if difficultStudent?? && difficultStudent.isSingle?? && difficultStudent.isSingle.id==a.id >
				    				<label class="radio inline">
										<input type="radio" id="isSingle" name="isSingle.id" checked="checked" value="${a.id}" />${a.name?html}
									</label>
    				    		<#elseif singleDic?? && singleDic.id == a.id>
    				    		    <label class="radio inline">
										<input type="radio" id="isSingle" name="isSingle.id" checked="checked" value="${a.id}" />${a.name?html}
									</label>	
				    			<#else>
				    				<label class="radio inline">
										<input type="radio" id="isSingle" name="isSingle.id" value="${a.id}" />${a.name?html}
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
							<label>低保证<span class="f_req"></span></label>
						</div>
						<div class="span9">
						   <#if lowList??>
							<#list lowList as a>
				    			<#if difficultStudent?? && difficultStudent.lowAssuranceLevel?? && difficultStudent.lowAssuranceLevel.id==a.id >
				    				<label class="radio inline">
										<input type="radio" id="lowAssuranceLevel" name="lowAssuranceLevel.id" checked="checked" value="${a.id}" />${a.name?html}
									</label>
    				    		<#elseif noDic?? && noDic.id == a.id>
    				    		    <label class="radio inline">
										<input type="radio" id="lowAssuranceLevel" name="lowAssuranceLevel.id" checked="checked" value="${a.id}" />${a.name?html}
									</label>		
				    			<#else>
				    				<label class="radio inline">
										<input type="radio" id="lowAssuranceLevel" name="lowAssuranceLevel.id" value="${a.id}" />${a.name?html}
									</label>
				    		   </#if>
		    			  </#list>
		    			 </#if>
						</div>
					</div>
					
					<div class="span6">
						<div class="span3">
							<label>救助证<span class="f_req"></span></label>
						</div>
						<div class="span9">
						   <#if aidList??>
							<#list aidList as a>
				    			<#if difficultStudent?? && difficultStudent.aidCertificateLevel?? && difficultStudent.aidCertificateLevel.id==a.id >
				    				<label class="radio inline">
										<input type="radio" id="aidCertificateLevel" name="aidCertificateLevel.id" checked="checked" value="${a.id}" />${a.name?html}
									</label>
    				    		<#elseif noDic?? && noDic.id == a.id>
    				    		    <label class="radio inline">
										<input type="radio" id="aidCertificateLevel" name="aidCertificateLevel.id" checked="checked" value="${a.id}" />${a.name?html}
									</label>		
				    			<#else>
				    				<label class="radio inline">
										<input type="radio" id="aidCertificateLevel" name="aidCertificateLevel.id" value="${a.id}" />${a.name?html}
									</label>
				    		   </#if>
		    			  </#list>
		    			 </#if>
						</div>
					</div>
				  </div>
			   </div>
			 <#-->  
			   <div class="formSep">
				<div class="row-fluid">
					<div class="span6" id="lowNumber">
						<div class="span3">
							<label>低保证编号<span class="f_req"></span></label>
						</div>
						<div class="span9">
						    <input id="lowAssuranceNumber" name="lowAssuranceNumber"  value="${((difficultStudent.lowAssuranceNumber)!"")?html}"/>
						</div>
					 </div>
						
					<div class="span6" id="aidNumber">
						<div class="span3">
							<label>救助证编号<span class="f_req"></span></label>
						</div>
						<div class="span9">
						    <input id="aidCertificateNumber" name="aidCertificateNumber"  value="${((difficultStudent.aidCertificateNumber)!"")?html}"/>
						</div>
					 </div>
				  </div>
			   </div>
			 -->  
			   <div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>是否残疾<span class="f_req"></span></label>
						</div>
						<div class="span9">
						  <#if disablilityList??>
							<#list disablilityList as a>
				    			<#if difficultStudent?? && difficultStudent.disabilityCertificateKind?? && difficultStudent.disabilityCertificateKind.id==a.id >
				    				<label class="radio inline">
										<input type="radio" id="disabilityCertificateKind" name="disabilityCertificateKind.id" checked="checked" value="${a.id}" />${a.name?html}
									</label>
    				    		<#elseif singleDic?? && singleDic.id == a.id>
    				    		    <label class="radio inline">
										<input type="radio" id="disabilityCertificateKind" name="disabilityCertificateKind.id" checked="checked" value="${a.id}" />${a.name?html}
									</label>		
				    			<#else>
				    				<label class="radio inline">
										<input type="radio" id="disabilityCertificateKind" name="disabilityCertificateKind.id" value="${a.id}" />${a.name?html}
									</label>
				    		   </#if>
		    			  </#list>
		    			 </#if>
						</div>
					</div>
						
					<div class="span6" id="disaLevel">
						<div class="span3">
							<label>残疾证级别<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="disabilityCertificateLevel" name="disabilityCertificateLevel" value="${(difficultStudent.disabilityCertificateLevel!"")?html}"/>
						</div>
					 </div>
				  </div>
			   </div>
			  <#--> 
			   <div class="formSep" id="disaNumber">
				<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>残疾证编号<span class="f_req"></span></label>
						</div>
						<div class="span9">
						     <input id="disabilityCertificateNumber" name="disabilityCertificateNumber"  value="${((difficultStudent.disabilityCertificateNumber)!"")?html}"/>
						</div>
					</div>
				  </div>
			   </div>
			 -->  
			  <div class="formSep">
				<div class="row-fluid">
				  <div class="span6">
					<div class="span3">
						<label>申请理由<span class="f_req">*</span></label>
					 </div>
					  <div class="span9">
						<#if difficultStudent?? && difficultStudent.applyReason??>
						    <textarea rows="5" cols="12" id="applyReason" name="applyReason" class="span6 tipTag" data="1.家庭成员情况(年龄，学习工作情况，身体状况等)&lt;br/&gt;2.家庭经济来源&lt;br/&gt;3.其他情况" style="width: 775px; height: 134px;">${(difficultStudent.applyReason!"")}</textarea>
						<#else>
						    <textarea rows="5" cols="12" id="applyReason" name="applyReason" class="span6 tipTag" data="1.家庭成员情况(年龄，学习工作情况，身体状况等)&lt;br/&gt;2.家庭经济来源&lt;br/&gt;3.其他情况" style="width: 775px; height: 134px;"></textarea>
						</#if>	
					</div>
				  </div>
				 </div>
				</div> 
		   </form>
				
			  <div class="formSep">
				<div class="row-fluid">					
				  <div class="span9">
				    <div class="span2">
						 <label>证明材料<span class="f_req">*</span></label>
					    </div>
						<div class="span10" id="_upload_div">
						<form  id="fileUploadForm"  action="" method="post"  enctype="multipart/form-data">
						<!--					    	 
							 <input type="hidden" name="allowedExt" value="jpg,png,img,gif,txt,iso,zip,rar"/>
							 <input type="hidden" name="maxSize" value="2097152000"/> 
							 <input type="hidden" name="isTempFile" value="false"/>
							 	-->						
							 <div data-fileupload="file" class="fileupload fileupload-new">
									<span class="btn btn-file"><span class="fileupload-new">选择文件</span><input id="file" type="file" name="file" onchange="uploadfile(this)"></span>
							 </div>
							 <div class="upload-alert-message" style="word-break:break-all;">
			        		        文件只支持：jpg,jpeg,png,gif,txt,ppt,rar,zip,doc,docx,xls,xlsx,ppt,pptx,wps,et,dps且大小不超过10MB。
			        		 </div>
							 <#if uploadFileRefList??>	
								<#list uploadFileRefList as p>
									<div class="fileupload-info">
										<a class="close" data-dismiss="alert">×</a>
										<a href="${rc.contextPath}/sys/sysConfig/file.do?id=${p.uploadFile.id}"><strong>${p.uploadFile.name}&nbsp;(${p.uploadFile.fileSize})</strong></a>
										<input type="hidden" id="fileId" name="fileId" value="${p.uploadFile.id}"/>	
									</div>					
								</#list>
							 </#if> 
						  </form>	
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
		            <!--判断是保存还是提交，保存=0   提交=1 -->
				    <button class="btn btn-info" type="button" id="save-course" onclick="onSub('0')">保 存</button>
				    <button class="btn btn-info" type="button" id="submit-button" onclick="onSub('1')">提 交</button>
				    <#if difficultStudent?? && difficultStudent.processStatus?? && difficultStudent.processStatus="REJECT">
				    <button class="btn btn-info" type="button" onclick="approve.showHis('${difficultStudent.id}');">审批历史</button>
				    </#if>
		  			<button class="btn" type="button" onclick="javascript:window.history.back(-1);">取 消</button>
			  </div>
			</div>
			<input name="check_error" id="check_error" type="hidden" value="true"/>
		</div>
    </div>
  </div>
   <#include "/apw/instance/approvers.ftl"/>
 </div>
<#-- 审核历史查看 -->
<#include "/apw/instance/approveHistory.ftl">	
<script>

    <!--显示提示框-->
	$(function(){
		$('.tipTag').poshytip({
			className: 'tip-yellowsimple',
			alignTo: 'target',
			alignX: 'right',
			alignY: 'center',
			offsetX: 5
		});
	});

	
     //判断数据是否为空
	function isEmpty(s){
	 return ((s==undefined || s==null || s=="" || s==0) ? true : false);
	}
	
	var attachFlag;
	$("document").ready(function(){
	    var name=$("#disabilityCertificateKind").find("option:selected").text();
	    if(name=="无"){
	     	$("#disaLevel").hide();
	     }else{
	     	$("#disaLevel").show();
	     }
	    var id = $('#id').val();
		if(id==null || id==""){
		 $('#perCapita').val("");
		 }
		var data={id:'${(difficultStudent.id)!""}',schoolYear:function(){return $("#schoolYear").val();}};
		comp.validate.addRemote("schoolYearCheck","${rc.contextPath}/sponsor/difficultStudent/opt-query/schoolYearCheck.do",data,"同一学年学生只能申请一次困难生。");
		//页面校验
		attachFlag = $(".form_validation_reg").compValidate({
			rules:{     
					'student.name': {required:true,minlength:1,maxlength:50},
					'schoolYear.id': {required:true,schoolYearCheck:true},
					 applyReason: {required:true,minlength:1,maxlength:500},
					 disabilityCertificateLevel: {minlength:1,maxlength:100},
					 perCapita: {floatCheck:true,minlength:1,maxlength:9}
				
				},
				messages:{
					'student.name':{required:'姓名不能为空！',maxlength:'课程名称不能超过50字'},
					'schoolYear.id': {required:'学年不能为空！'},
					   applyReason:{required:'申请理由不能为空！',maxlength:'申请理由不能超过500字'},
					   disabilityCertificateLevel:{maxlength:'残疾证级别不能超过100字'},
					     perCapita:{maxlength:'家庭人均收入不能超过9位'}
				}
		 });
	});
	
	
	
	
	//验证是否输入的是小数
	jQuery.validator.addMethod("floatCheck",function(value,element){
	   if(value != ""){
	      var patrn = /^(?:[1-9]\d{0,8}(?:\.\d{2})?|0\.\d{2})$/;
	      return patrn.exec(value);
	   }else{
	      return true;
	   }
	  return false;
	},"请输入不小于等于0的有效数字(正整数部分不能超过8位，小数点后保留两位小数).");
	
	
		//保存方法 
	 	 function onSub(stas){
	 	 	copyFileIdInput();
	 	    var Files = $("#studentInfoForm input[name='fileId']").size();
			if(Files==null || Files == 0 )
			{
				comp.message("请上传证明材料。","error");
				return false;
			}
			if(attachFlag.form()==false){
	 		    return false;
	 		}
	 		var check_error=$("#check_error").val();
	 		$("#flags").val(stas);
			if(check_error == "true"){
			   if(stas=="1"){
                  	if(!confirm("提交信息后不能修改，确认要提交吗？"))
                  		return;
                  	if(!isEmpty($("#id").val())){
                  	  apw.selectNextApprover($("#id").val(),"INIT","SPONSOR_DIFFICULT_STUDENT_APPROVE",$("#approveReason").val());
                  	}else{
	                  	$.ajax({
						url: "${rc.contextPath}/common/config/nsm/getUuid.do",
						async:false,
						cache:false,
						type:"POST",
						success: function(id){
							if(!isEmpty(id)){
							   $("#id").val(id);
						       apw.selectNextApprover(id,"INIT","SPONSOR_DIFFICULT_STUDENT_APPROVE",$("#approveReason").val());
						    }else{
						    	$.sticky("困难生信息保存失败", {autoclose:5000, position:"top-right", type:"st-error"});
						    	return;
						    }
						}
					   });
					}   
		        }else{
	            	 copyFileIdInput();	          	
		             $('#studentInfoForm').submit();
			    }
			  }
 	       }
 	  
		
		/*
		 * 初始化当前发起流程【doInitAction方法名不可修改】
		 */
		function doInitAction(objectId,userId){
		    var url = "${rc.contextPath}/sponsor/diffapprove/opt-add/saveCurProcess.do";
			apw.initCurProcess(url,objectId,userId);
		}
		
		
         /*
         * 执行业务系统的操作
         */
        function doAmsAction(userId,approveKey,approveStatus,processStatusCode,suggest){
          	copyFileIdInput();
            $('#studentInfoForm').submit();
           //window.location.href="${rc.contextPath}/sponsor/difficultStudent/opt-query/queryDifficultStudentList.do";	
        }

	    var tag=0;
		function uploadfile(obj){	
			if($("#fileUploadForm .sepH_b").length>0||tag){//创建进度条以及包括页面中存在进度条时候不能再上传，平台只提供一个用户同时只能上传一个文件
				comp.message("同时只能上传一个文件，待上传完成后，再重试。","error");
				return;
			}
			//if($("#fileUploadForm .alert-info strong:contains('"+$(obj).val()+"')").length>0){
			//	comp.message("提交了重复名称的文件请确认检查，如果确认内容重复可以手动删除。","info");
			//}
			
			//验证文件扩展名,该逻辑根据具体业务可自行调整
			var fileName=$(obj).val();
			fileName=fileName.substring(fileName.lastIndexOf("\\")+1,fileName.length);
			
			if(fileName.indexOf(".")>-1){
				var ext=fileName.substring(fileName.lastIndexOf(".")+1,fileName.length).toLowerCase();
				if("jpg,jpeg,png,gif,txt,ppt,rar,zip,doc,docx,xls,xlsx,ppt,pptx,wps,et,dps,".indexOf(ext+",")<0){
					comp.message("文件上传类型只能是jpg,jpeg,png,gif,txt,ppt,rar,zip,doc,docx,xls,xlsx,ppt,pptx,wps,et,dps,请重新选择文件。","error");
					return;
				}
			}
			
			tag=1;
			var div=fileupload.create_fileupload_div($("#fileUploadForm"),$(obj).val());
			tag=0;	
			var param="?maxSize=10485760&isTempFile=false";//设置业务文件大小限制上线不能超过10M
			$("#fileUploadForm").attr("action","${rc.contextPath}/sys/sysConfig/singleFileUpload.do"+param);		
			$("#fileUploadForm").ajaxSubmit(function(data){
				
				try{//ie8才能执行如下代码
					data=$(data).unwrap().text();
					}catch(e){//ff chrome浏览器
					}
					
				try{
					var obj=eval(data)[0];				
					if(obj.fileId==''){
						comp.message(obj.errorInfo,"error");
						$(div).remove();
					}else{
						comp.message("上传文件完成。","info");
						$(div).append($("<input>",{						
							type:'hidden',
							val:obj.fileId,
							name:'fileId',
						}));
						$(div).find("div").remove();
						$(div).find("strong").append(("&nbsp;("+obj.fileSize+")"));
						$(div).find("strong").wrapAll("<a href=\"${rc.contextPath}/sys/sysConfig/file.do?id="+obj.fileId+"\"/>");
					}
				}catch(e){
					comp.message("文件提交服务器失败，请稍后刷新页面重试，如果还未成功请联系管理。","error");
				}				
				//下面代码解决重名文件可以连续上传问题，该功能需要根据实际业务进行调整	
				var file=$("#file");
				file.after(file.clone().val(''));
				file.remove();
			});
		}
				
		function copyFileIdInput(){
			$("#studentInfoForm").append($("#fileUploadForm input[name='fileId']"));
		}
		
		
	//选择低保证的无时，低保证编号隐藏。
	function onChangeType(){
		var name=$("#lowAssuranceLevel").find("option:selected").text();
	     if(name=="无"){
	     	$("#lowNumber").hide();
	     }else{
	     	$("#lowNumber").show();
	     }
	}
	
	//选择救助证的无时，救助证编号隐藏。
	function changeAidNum(){
		var name=$("#aidCertificateLevel").find("option:selected").text();
	     if(name=="无"){
	     	$("#aidNumber").hide();
	     }else{
	     	$("#aidNumber").show();
	     }
	}
	
	//选择残疾证的无时，残疾证级别，残疾证编号隐藏。
	function changeDisaType(){
		var name=$("#disabilityCertificateKind").find("option:selected").text();
	     if(name=="无"){
	     	$("#disaLevel").hide();
	     	$("#disaNumber").hide();
	     }else{
	     	$("#disaLevel").show();
	     	$("#disaNumber").show();
	     }
	}
		
				
	
	 </script>
</body>
</html>
