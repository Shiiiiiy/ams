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
        <script src="${rc.contextPath}/js/common/common_approve.js"></script>
    </head>
<body>
<div id="contentwrapper">
 <div class="main_content">
  <div class="row-fluid">
    <div class="row-fluid">
	   <div class="span12">
	      <h3 class="heading">
			       困难生奖助查看
		   </h3>
		  </div>
		 </div> 
		 <input name="errorText" id="errorText" type="hidden" value="${errorText!""}"/>
		 <input id="id" type="hidden" name="id"  value="${(studentAward.id)!""}">
			 <div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>姓名<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="student.name" name="student.name" readOnly <#if studentAward?? && studentAward.difficultStudentInfo?? && studentAward.difficultStudentInfo.student??> value="${(studentAward.difficultStudentInfo.student.name!"")?html}" </#if>/>
						</div>
					</div>
						
					<div class="span6">
						<div class="span3">
							<label>性别<span class="f_req"></span></label>
						</div>
						<div class="span9">
						 <#if genderList??>
							<#list genderList as a>
				    			<#if studentAward?? && studentAward.difficultStudentInfo?? && studentAward.difficultStudentInfo.student?? && studentAward.difficultStudentInfo.student.genderDic?? && studentAward.difficultStudentInfo.student.genderDic.id==a.id >
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
							<label>名族<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="national" name="national" readOnly <#if studentAward?? && studentAward.difficultStudentInfo?? && studentAward.difficultStudentInfo.student??> value="${(studentAward.difficultStudentInfo.student.national!"")?html}" </#if>/>
						</div>
					</div>
						
					<div class="span6">
						<div class="span3">
							<label>身份证号<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="certificateCode" name="certificateCode" readOnly <#if studentAward?? && studentAward.difficultStudentInfo?? && studentAward.difficultStudentInfo.student??>  value="${((studentAward.difficultStudentInfo.student.certificateCode)!"")?html}"</#if>/>
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
							<input id="college" name="college.name" readOnly <#if studentAward?? && studentAward.difficultStudentInfo?? && studentAward.difficultStudentInfo.student?? && studentAward.difficultStudentInfo.student.college??> value="${(studentAward.difficultStudentInfo.student.college.name!"")?html}" </#if>/>
						</div>
					</div>
						
					<div class="span6">
						<div class="span3">
							<label>班级<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="className" name="classId.className" readOnly <#if studentAward?? && studentAward.difficultStudentInfo?? && studentAward.difficultStudentInfo.student?? && studentAward.difficultStudentInfo.student.classId??>  value="${(studentAward.difficultStudentInfo.student.classId.className!"")?html}"</#if>/>
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
							<input id="stuNumber" name="stuNumber" readOnly <#if studentAward?? && studentAward.difficultStudentInfo?? && studentAward.difficultStudentInfo.student??> value="${((studentAward.difficultStudentInfo.student.stuNumber)!"")?html}" </#if>/>
						</div>
					</div>
						
					<div class="span6">
						<div class="span3">
							<label>政治面貌<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="politicalDic" name="politicalDic.name" readOnly <#if studentAward?? && studentAward.difficultStudentInfo?? && studentAward.difficultStudentInfo.student?? && studentAward.difficultStudentInfo.student.politicalDic??>  value="${((studentAward.difficultStudentInfo.student.politicalDic.name)!"")?html}"</#if>/>
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
							<input id="brithDate" name="brithDate" readOnly <#if studentAward?? && studentAward.difficultStudentInfo?? && studentAward.difficultStudentInfo.student?? && studentAward.difficultStudentInfo.student.brithDate??> value="${(studentAward.difficultStudentInfo.student.brithDate!"")?string("yyyy-MM-dd")}"</#if>/>
						</div>
					</div>
						
					<div class="span6">
						<div class="span3">
							<label>联系方式<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="phone1" name="phone1" readOnly <#if studentAward?? && studentAward.difficultStudentInfo?? && studentAward.difficultStudentInfo.student?? && studentAward.difficultStudentInfo.student.phone1??>  value="${((studentAward.difficultStudentInfo.student.phone1)!"")?html}"</#if>/>
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
										<#if studentAward?? && studentAward.schoolYear ?? && studentAward.schoolYear.id==d.id >
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
							<label>家庭经济情况<span class="f_req"></span></label>
						</div>
						<div class="span9">
						    <select disabled="disabled" size="1" id="familyFinance" name="familyFinance.id" aria-controls="dt_gal">
							  <option value="" />请选择..</option>
								<#if financeList ??>
									<#list financeList as d>
										<#if studentAward?? && studentAward.familyFinance ?? && studentAward.familyFinance.id==d.id >
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
						  <label>奖助类型<span class="f_req"></span></label>
						</div>
						<div class="span9">
						   <select disabled="disabled" size="1" id="awardType" name="awardType.id" aria-controls="dt_gal" onchange="onChangeType()">
							   <#if awardList ??>
									<#list awardList as d>
										<#if studentAward?? && studentAward.awardType ?? && studentAward.awardType.id==d.id >
											<option  value="${d.id}" selected="selected" />${d.name?html}</option>
										<#else>
											<option value="${d.id}"/>${d.name?html}</option>
										</#if>
									</#list>
								</#if>
						    </select>
					     </div>
					  </div>
				    </div>
				  </div>
				  
			 	<!--各个奖项填写的内容 -->
			  	<div id="awardTypeContent">
			  	  <#if studentAward?? && studentAward.awardType ?? >
			  	   <#if inspirationDic.id == studentAward.awardType.id>
			  			<#include "inspirationalAward.ftl">
			  	   <#elseif aidGrantDic.id == studentAward.awardType.id>
			  		    <#include "aidGrant.ftl">
			  	   <#elseif jobGrantDic.id == studentAward.awardType.id> 
			  	        <#include "jobGrant.ftl">
			  	   <#elseif schoolLoanDic.id == studentAward.awardType.id> 
			  	        <#include "schoolLoan.ftl">
			  	   <#elseif tuitionDic.id == studentAward.awardType.id>  
			  	        <#include "tuitionWaiver.ftl">
			  	   </#if>
	  			</#if>
			  </div>	    
			   
			  <div class="formSep">
				<div class="row-fluid">
				  <div class="span6">
					<div class="span3">
						<label>家庭成员情况<span class="f_req"></span></label>
					 </div>
					  <div class="span9">
						<#if studentAward?? && studentAward.familyCondition??>
						    <textarea rows="5" cols="12" id="familyCondition" name="familyCondition" readOnly class="span6 tipTag" data="1.家庭成员情况(年龄，学习工作情况，身体状况等)&lt;br/&gt;2.家庭经济来源&lt;br/&gt;3.其他情况" style="width: 775px; height: 134px;">${(studentAward.applyReason!"")}</textarea>
						<#else>
						    <textarea rows="5" cols="12" id="familyCondition" name="familyCondition" readOnly class="span6 tipTag" data="1.家庭成员情况(年龄，学习工作情况，身体状况等)&lt;br/&gt;2.家庭经济来源&lt;br/&gt;3.其他情况" style="width: 775px; height: 134px;"></textarea>
						</#if>	
					</div>
				  </div>
				 </div>
				</div>
				
			  <div class="formSep">
				<div class="row-fluid">
				  <div class="span6">
					<div class="span3">
						<label>申请理由<span class="f_req"></span></label>
					 </div>
					  <div class="span9">
						<#if studentAward?? && studentAward.familyCondition??>
						    <textarea rows="5" cols="12" id="applyReason" name="applyReason" readOnly style="width: 775px; height: 134px;">${(studentAward.applyReason!"")}</textarea>
						<#else>
						    <textarea rows="5" cols="12" id="applyReason" name="applyReason" readOnly style="width: 775px; height: 134px;"></textarea>
						</#if>	
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
			  			<button class="btn btn-info" type="button" onclick="approve.showHis('${studentAward.id}');">审批历史</button>
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
</script>
</body>
</html>
