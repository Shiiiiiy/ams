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
		<!-- bootstrap-fileupload -->	
		<link rel="stylesheet" href="${rc.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.min.css" />
		<script src="${rc.contextPath}/js/common/common_approve.js"></script>
    </head>
<body>
<div id="contentwrapper">
 <div class="main_content">
  <div class="row-fluid">
    <div class="row-fluid">
	   <div class="span12">
	      <h3 class="heading">
			 困难生信息查看
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
							<input id="student.name" name="student.name" readOnly <#if difficultStudent?? && difficultStudent.student??> value="${((difficultStudent.student.name)!"")?html}" </#if>/>
						</div>
					</div>
						
					<div class="span6">
						<div class="span3">
							<label>性别<span class="f_req"></span></label>
						</div>
						<div class="span9">
						 <#if genderList??>
							<#list genderList as a>
				    			<#if difficultStudent?? && difficultStudent.student?? && difficultStudent.student.genderDic?? && difficultStudent.student.genderDic.id==a.id >
    				    				<label class="radio inline">
											<input type="radio" id="sexId" name="student.genderDic.name" disabled checked="checked" value="${a.id}" />${a.name?html}
										</label>
    				    			
				    			<#else>
				    				<label class="radio inline">
										<input type="radio" id="sexId" name="student.genderDic.name" disabled  value="${a.id}" />${a.name?html}
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
							<label>民族<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="national" name="student.national" readOnly <#if difficultStudent?? && difficultStudent.student?? && difficultStudent.student.national??> value="${(difficultStudent.student.national!"")?html}" </#if>/>
						</div>
					</div>
						
					<div class="span6">
						<div class="span3">
							<label>身份证号<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="certificateCode" name="student.certificateCode" readOnly <#if difficultStudent?? && difficultStudent.student??>  value="${((difficultStudent.student.certificateCode)!'')?html}"</#if>/>
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
							<input id="college" name="student.college.name" readOnly <#if difficultStudent?? && difficultStudent.student?? && difficultStudent.student.college??> value="${(difficultStudent.student.college.name!"")?html}" </#if>/>
						</div>
					</div>
						
					<div class="span6">
						<div class="span3">
							<label>班级<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="className" name="student.classId.className" readOnly <#if  difficultStudent?? && difficultStudent.student?? && difficultStudent.student.classId??>  value="${(difficultStudent.student.classId.className!"")?html}"</#if>/>
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
							<input id="stuNumber" name="student.stuNumber" readOnly value="${((difficultStudent.student.stuNumber)!"")?html}"/>
						</div>
					</div>
						
					<div class="span6">
						<div class="span3">
							<label>政治面貌<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="politicalDic" name="student.politicalDic.name" readOnly <#if difficultStudent?? && difficultStudent.student?? && difficultStudent.student.politicalDic??>  value="${((difficultStudent.student.politicalDic.name)!"")?html}"</#if>/>
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
							<input id="brithDate" name="student.brithDate" readOnly <#if difficultStudent?? && difficultStudent.student?? && difficultStudent.student.brithDate??> value="${(difficultStudent.student.brithDate!"")?string("yyyy-MM-dd")}"</#if>/>
						</div>
					</div>
						
					<div class="span6">
						<div class="span3">
							<label>联系方式<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="phone1" name="student.phone1" readOnly <#if difficultStudent?? && difficultStudent.student?? && difficultStudent.student.phone1??>  value="${((difficultStudent.student.phone1)!"")?html}"</#if>/>
						</div>
					 </div>
				  </div>
			   </div>
			   
			    <div class="formSep">
				 <div class="row-fluid">
				   <div class="span6">
					  <div class="span3">
						  <label>学年<span class="f_req"></span></label>
						</div>
						<div class="span9">
						   <select disabled="disabled" size="1" id="schoolYear" name="schoolYear.id" aria-controls="dt_gal" >
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
					     <select disabled="disabled" size="1" id="isStudentLoan" name="isStudentLoan.id" aria-controls="dt_gal">
					      <option value="" />请选择..</option>
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
							<label>家庭人均收入<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="perCapita1" name="perCapita" readOnly value="${(difficultStudent.perCapita!"")?html}">元
						</div>
					</div>
						
					<div class="span6">
						<div class="span3">
							<label>家庭经济情况<span class="f_req"></span></label>
						</div>
						<div class="span9">
						    <select disabled="disabled" size="1" id="familyFinance" name="familyFinance.id" aria-controls="dt_gal">
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
											<input type="radio" id="accountType" name="accountType.id" disabled checked="checked" value="${a.id}" />${a.name?html}
									</label>
    				    			
				    			<#else>
				    				<label class="radio inline">
										<input type="radio" id="accountType" name="accountType.id" disabled value="${a.id}" />${a.name?html}
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
										<input type="radio" id="isMartyr" name="isMartyr.id" disabled checked="checked" value="${a.id}" />${a.name?html}
									</label>
    				    			
				    			<#else>
				    				<label class="radio inline">
										<input type="radio" id="isMartyr" name="isMartyr.id" disabled value="${a.id}" />${a.name?html}
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
											<input type="radio" id="familySurvey" name="familySurvey.id" disabled checked="checked" value="${a.id}" />${a.name?html}
									</label>
    				    			
				    			<#else>
				    				<label class="radio inline">
										<input type="radio" id="familySurvey" name="familySurvey.id" disabled value="${a.id}" />${a.name?html}
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
											<input type="radio" id="villageProve" name="villageProve.id" disabled checked="checked" value="${a.id}" />${a.name?html}
									</label>
    				    			
				    			<#else>
				    				<label class="radio inline">
										<input type="radio" id="villageProve" name="villageProve.id" disabled value="${a.id}" />${a.name?html}
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
										<input type="radio" id="townProve" name="townProve.id" disabled checked="checked" value="${a.id}" />${a.name?html}
									</label>
    				    			
				    			<#else>
				    				<label class="radio inline">
										<input type="radio" id="townProve" name="townProve.id" disabled value="${a.id}" />${a.name?html}
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
										<input type="radio" id="countyProve" name="countyProve.id" disabled checked="checked" value="${a.id}" />${a.name?html}
									</label>
    				    			
				    			<#else>
				    				<label class="radio inline">
										<input type="radio" id="countyProve" name="countyProve.id" disabled value="${a.id}" />${a.name?html}
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
										<input type="radio" id="isOrphan" name="isOrphan.id" disabled checked="checked" value="${a.id}" />${a.name?html}
									</label>
    				    			
				    			<#else>
				    				<label class="radio inline">
										<input type="radio" id="isOrphan" name="isOrphan.id" disabled value="${a.id}" />${a.name?html}
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
										<input type="radio" id="isSingle" name="isSingle.id" disabled checked="checked" value="${a.id}" />${a.name?html}
									</label>
    				    			
				    			<#else>
				    				<label class="radio inline">
										<input type="radio" id="isSingle" name="isSingle.id" disabled value="${a.id}" />${a.name?html}
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
										<input type="radio" id="lowAssuranceLevel" name="lowAssuranceLevel.id" disabled checked="checked" value="${a.id}" />${a.name?html}
									</label>
    				    		<#elseif noDic?? && noDic.id == a.id>
    				    		    <label class="radio inline">
										<input type="radio" id="lowAssuranceLevel" name="lowAssuranceLevel.id" disabled checked="checked" value="${a.id}" />${a.name?html}
									</label>		
				    			<#else>
				    				<label class="radio inline">
										<input type="radio" id="lowAssuranceLevel" name="lowAssuranceLevel.id" disabled value="${a.id}" />${a.name?html}
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
										<input type="radio" id="aidCertificateLevel" name="aidCertificateLevel.id" disabled checked="checked" value="${a.id}" />${a.name?html}
									</label>
    				    		<#elseif noDic?? && noDic.id == a.id>
    				    		    <label class="radio inline">
										<input type="radio" id="aidCertificateLevel" name="aidCertificateLevel.id" disabled checked="checked" value="${a.id}" />${a.name?html}
									</label>		
				    			<#else>
				    				<label class="radio inline">
										<input type="radio" id="aidCertificateLevel" name="aidCertificateLevel.id" disabled value="${a.id}" />${a.name?html}
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
						    <input id="lowAssuranceNumber" name="lowAssuranceNumber" readOnly value="${((difficultStudent.lowAssuranceNumber)!"")?html}"/>
						</div>
					 </div>
						
					<div class="span6" id="aidNumber">
						<div class="span3">
							<label>救助证编号<span class="f_req"></span></label>
						</div>
						<div class="span9">
						    <input id="aidCertificateNumber" name="aidCertificateNumber" readOnly value="${((difficultStudent.aidCertificateNumber)!"")?html}"/>
						</div>
					 </div>
				  </div>
			   </div>
			 <-->  
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
										<input type="radio" id="disabilityCertificateKind" name="disabilityCertificateKind.id" disabled checked="checked" value="${a.id}" />${a.name?html}
									</label>
    				    		<#elseif singleDic?? && singleDic.id == a.id>
    				    		    <label class="radio inline">
										<input type="radio" id="disabilityCertificateKind" name="disabilityCertificateKind.id" disabled checked="checked" value="${a.id}" />${a.name?html}
									</label>		
				    			<#else>
				    				<label class="radio inline">
										<input type="radio" id="disabilityCertificateKind" name="disabilityCertificateKind.id" disabled value="${a.id}" />${a.name?html}
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
						   <input id="disabilityCertificateLevel" name="disabilityCertificateLevel" readOnly value="${(difficultStudent.disabilityCertificateLevel!"")?html}"/>
						</div>
					 </div>
				  </div>
			   </div>
			 <#-->  
			   <div class="formSep">
				<div class="row-fluid">
					<div class="span6" id="disaNumber">
						<div class="span3">
							<label>残疾证编号<span class="f_req"></span></label>
						</div>
						<div class="span9">
						     <input id="disabilityCertificateNumber" name="disabilityCertificateNumber" readOnly value="${((difficultStudent.disabilityCertificateNumber)!"")?html}"/>
						</div>
					</div>
				  </div>
			   </div>
			  <--> 
			  <div class="formSep">
				<div class="row-fluid">
				  <div class="span6">
					<div class="span3">
						<label>申请理由<span class="f_req"></span></label>
					 </div>
					  <div class="span9">
						<#if difficultStudent?? && difficultStudent.applyReason??>
						    <textarea rows="5" cols="12" id="applyReason" name="applyReason" readOnly style="width: 775px; height: 134px;">${(difficultStudent.applyReason!"")}</textarea>
						<#else>
						    <textarea rows="5" cols="12" id="applyReason" name="applyReason" readOnly style="width: 775px; height: 134px;"></textarea>
						</#if>	
					</div>
				  </div>
				 </div>
				</div> 
				
			  <div class="formSep">
				<div class="row-fluid">					
				  <div class="span9">
				    <div class="span2">
						 <label>证明材料<span class="f_req"></span></label>
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
		   </div>
		 <#--  
		<div class="row-fluid">
	      <div class="span12">
	        <h3 class="heading">
			 审批信息
		    </h3>
		  </div>
		 </div>
		--> 
		<div class="formSep">
		 <div class="row-fluid">
	       <div class="span6">
			  <div class="span3">
				  <label>推荐档次<span class="f_req"></span></label>
				</div>
				<div class="span9">
				   <select disabled="disabled" size="1" id="difficultLevel" name="difficultLevel.id" aria-controls="dt_gal" >
					  <option value="" />请选择..</option>
						<#if difficultList ??>
							<#list difficultList as d>
								<#if difficultStudent?? && difficultStudent.difficultLevel ?? && difficultStudent.difficultLevel.id==d.id >
									     <option  value="${d.id}" selected="selected" />${d.name?html}</option>
								<#else>
										<option value="${d.id}" >${d.name}</option>	
								</#if>
							</#list>
						</#if>
				 	</select>
				</div>
			 </div>
		  </div> 
	   </div>
	 <#-- 
	 <div class="formSep">
	  <div class="row-fluid">
	   <div class="span6">
	    <div class="span3">
		  <label>初审意见<span class="f_req"></span></label>
		 </div>
		<div class="span9">
		  <div id="dt_gal_wrapper"  style="width:785px;" role="grid">
			<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
				 <thead>
				       <tr>
							<th width="10%">审核人</th>
							<th width="10%">审核结果</th>
							<th width="80%">审核意见</th>
					   </tr>
				  </thead>
				 <tbody>
				   <#if instanceList??>	
					 <#list instanceList as p>
						<tr>
							<td class="autocut">${(p.approver.name)!""}</td>
							<td class="autocut">${(p.approveResultDic.name)!""}</td>
							<td class="autocut">${(p.suggest)!""}</td>
						</tr>
					  </#list>
				   </#if>	
					</tbody>
				</table>
			</div>
		</div>
	 </div>
   </div>
  </div> 
	-->	  
       <br/> 
	    <div class="row-fluid">
		 <div class="span6">
		  <div class="span3">
		   </div>
		      <div class="span9">
		  			<button class="btn btn-info" type="button" onclick="approve.showHis('${difficultStudent.id}');">审批历史</button>
		  			<button class="btn" type="button" onclick="javascript:window.close();">关 闭</button>
			  </div>
			</div>
			<input name="check_error" id="check_error" type="hidden" value="true"/>
		</div>
    </div>
  </div>
 </div>
 <#-- 审核历史查看 -->
<#include "/apw/instance/approveHistory.ftl">	 
<script>
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
});		 
</script>
</body>
</html>
