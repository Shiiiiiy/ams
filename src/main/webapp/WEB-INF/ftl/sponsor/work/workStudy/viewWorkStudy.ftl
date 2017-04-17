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
		<!-- multiselect -->
	    <link rel="stylesheet" href="${rc.contextPath}/lib/multiselect/css/multi-select.css" />
		<script src="${rc.contextPath}/lib/multiselect/js/jquery.multi-select.min.js"></script>
    	<script src="${rc.contextPath}/js/common/common_approve.js"></script>
 </head>
<body>
<div id="contentwrapper">
 	<div class="main_content">
  		<div class="row-fluid">
    		<div class="row-fluid">
	   			<div class="span12">
		      		<h3 class="heading">
						勤工助学查看
			   		</h3>
		  		</div>
		 	</div> 
		   	<input id="studentId" type="hidden" name="student.id"  value="${(user_key.userId)!''}">
		   	<input id="flags" type="hidden" name="flags"  value="${(flags)!""}">
			<div class="formSep">
				<div class="row-fluid">
				 	<div class="span6">
					 	<div class="span3">
							<lable>学年</lable>
					 	</div>
					 	<div class="span9">
							<select  disabled="disabled" size="1"  aria-controls="dt_gal" >
								<#if workApplyFile?? && workApplyFile.schoolYear ?? >
								 	<option  value="${workApplyFile.schoolYear.id}" selected="selected" />${workApplyFile.schoolYear.name?html}</option>
								</#if>
				    		</select>
						</div>
					</div>
					<div class="span6">
						<div class="span3">
							<lable>学期</lable>
						</div>
						<div class="span9">
							<select disabled="disabled"　size="1" id="term" name="term.id" aria-controls="dt_gal" class="{required:true}" >
								<option value="" >请选择</option>
									<#if workApplyFile?? && workApplyFile.term?? >
										<option value="${workApplyFile.term.id}"  selected="selected">${workApplyFile.term.name?html}</option>
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
							<label>姓名</label>
						</div>
						<div class="span9">
							<input readOnly id="student.name" name="student.name" readOnly  value="${(difficultStudentInfo.student.name!"")?html}" />
						</div>
					</div>
					<div class="span6">
						<div class="span3">
							<label>性别</label>
						</div>
						<div class="span9">
			    			<#if difficultStudentInfo ?? && difficultStudentInfo.student?? && difficultStudentInfo.student.genderDic??  >
										<input  readOnly id="sexId" name="genderDic.name" readOnly value="${difficultStudentInfo.student.genderDic.name}" />
			    		    </#if>
						</div>
					 </div>
				</div>
			</div>
			<div class="formSep"> 
				<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>出生年月</label>
						</div>
						<div class="span9">
							<input readOnly id="brithDate" name="brithDate" readOnly <#if difficultStudentInfo?? && difficultStudentInfo.student?? && difficultStudentInfo.student.brithDate??> value="${(difficultStudentInfo.student.brithDate!"")?string("yyyy-MM-dd")}"</#if>/>
						</div>
					</div>
					<div class="span6">
						<div class="span3">
							<label>身份证号</label>
						</div>
						<div class="span9">
							<input readOnly id="certificateCode" name="certificateCode" readOnly <#if difficultStudentInfo?? && difficultStudentInfo.student?? && difficultStudentInfo.student.certificateCode??>  value="${((difficultStudentInfo.student.certificateCode)!"")?html}"</#if>/>
						</div>
					 </div>
				 </div>
			</div>
			<div class="formSep"> 
			    <div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>学院</label>
						</div>
						<div class="span9">
							<input readOnly id="college" name="difficultStudentInfo.student.college.name" readOnly <#if difficultStudentInfo?? && difficultStudentInfo.student?? && difficultStudentInfo.student.college??> value="${(difficultStudentInfo.student.college.name!"")?html}" </#if>/>
						</div>
					</div>
					<div class="span6">
						<div class="span3">
							<label>专业</label>
						</div>
						<div class="span9">
							<input readOnly id="major" name="difficultStudentInfo.student.major.majorName" readOnly <#if difficultStudentInfo?? && difficultStudentInfo.student?? && difficultStudentInfo.student.major??> value="${(difficultStudentInfo.student.major.majorName!"")?html}" </#if>/>
						</div>
					</div>
				 </div>
			</div>
			<div class="formSep"> 
			   <div class="row-fluid">
			    	<div class="span6">
						<div class="span3">
							<label>班级</label>
						</div>
						<div class="span9">
							<input readOnly id="className" name="BaseClassModel.className" readOnly <#if difficultStudentInfo?? && difficultStudentInfo.student?? && difficultStudentInfo.student.classId.className??>  value="${(difficultStudentInfo.student.classId.className!"")?html}"</#if>/>
						</div>
					 </div>
					<div class="span6">
						<div class="span3">
							<label>学号</label>
						</div>
						<div class="span9">
							<input readOnly id="stuNumber" name="difficultStudentInfo.student.stuNumber" readOnly <#if difficultStudentInfo?? && difficultStudentInfo.student?? && difficultStudentInfo.student.stuNumber??>  value="${(difficultStudentInfo.student.stuNumber!"")?html}"</#if>/>
						</div>
					</div>
				</div>
			 </div>
		  
			 <div class="formSep"> 
			   	<div class="row-fluid">
				   		<div class="span6">
							<div class="span3">
								<label>困难等级</label>
							</div>
							<div class="span9">
								<input readOnly id="difficultLevel" name="difficultStudentInfo.student.difficultLevel" readOnly <#if difficultStudentInfo?? && difficultStudentInfo.difficultLevel??>  value="${((difficultStudentInfo.difficultLevel.name)!"")?html}"</#if>/>
							</div>
						 </div>
				   		<div class="span6">
							<div class="span3">
								<label>联系方式</label>
							</div>
							<div class="span9">
								<input readOnly id="phone" name="phone" <#if workApplyFile?? && workApplyFile.phone??>  value="${((workApplyFile.phone)!"")?html}"</#if>/>
							</div>
						 </div>
				  </div>
			 </div>
			 <div class="formSep"> 
			   	<div class="row-fluid">
				   		<div class="span6">
							<div class="span3">
								<label>EMAIL</label>
							</div>
							<div class="span9">
								<input readOnly id="attachEmail" name="attachEmail"  <#if workApplyFile?? && workApplyFile.phone??>value="${((workApplyFile.attachEmail)!"")?html}"</#if>/>
							</div>
						</div>
						<div class="span6">
							<div class="span3">
								<label>QQ</label>
							</div>
							<div class="span9">
								<input readOnly id="attachQQ" name="attachQQ"  value="${((workApplyFile.attachQQ)!"")?html}"/>
							</div>
						</div>
				 </div>
			</div>
			 <div class="formSep"> 
			   	  <div class="row-fluid">
			  		<div class="span9">
						<div class="span2">
							<label>曾获奖助和奖学金情况</label>
						</div>
						<div class="span10">
							<table class="table table-bordered table-striped tablecut" id="smpl_tbl" width="788px;">
								<thead>
									<tr>
										<th width="20%">序号</th>
										<th width="40%">学年</th>
										<th width="40%">奖助/奖学金</th>
									</tr>
								</thead>
								<tbody>
									<#if listBurse??>	
									  <#list listBurse as b>
									  	<tr>
											<td class="autocut">${b_index+1}	</td>
											<td class="autocut">${b.schoolYear.name!''}	</td>
											<td class="autocut">${b.burseName.name!''}	</td>
										</tr>
									  </#list>
								    </#if> 
								    <#list listAward as a>
									  	<tr>
											<td class="autocut">
												<#if listBurse??>${listBurse?size+a_index+1}	
												<#else>
													${a_index+1}
												</#if>
											</td>
											<td class="autocut">
												<#if a.awardTypeId??&&a.awardTypeId.schoolYear??>${a.awardTypeId.schoolYear.name!''}</#if>	</td>
											<td class="autocut">
												<#if a.id?? >${a.id!''}
												</#if>
											</td>
										</tr>
								   </#list>
								</tbody>
							</table>
						</div>
					</div>
				 </div>
			</div>
			<div class="formSep">
				 <div class="row-fluid">
				  	<div class="span6">
						<div class="span3">
							<label>特长</label>
						 </div>
						 <div class="span9">
							<#if workApplyFile?? && workApplyFile.forte??>
							    <textarea readOnly rows="5" cols="12" id="forte" name="forte"  class="span6" style="width: 730px; height: 134px;">${((workApplyFile.forte)!"")?html}</textarea>
							<#else>
							    <textarea readOnly rows="5" cols="12" id="forte" name="forte"   class="span6" style="width: 730px; height: 134px;"></textarea>
							</#if>	
						 </div>
				  	</div>
				 </div>
			</div> 
			<div class="formSep">
				<div class="row-fluid">
				  	<div class="span6">
						<div class="span3">
							<label>勤工助学经历</label>
						</div>
						 <div class="span9">
							<#if workApplyFile?? && workApplyFile.workExperience??>
							    <textarea  readOnly rows="5" cols="12" id="workExperience" name="workExperience" class="span6 tipTag"  style="width: 730px; height: 134px;">${(workApplyFile.workExperience!"")}</textarea>
							<#else>
							    <textarea readOnly rows="5" cols="12" id="workExperience" name="workExperience" class="span6 tipTag" style="width: 730px; height: 134px;"></textarea>
							</#if>	
						</div>
				  	</div>
				 </div>
			</div> 
			<div class="formSep">
				<div class="row-fluid">
				  <div class="span6">
					<div class="span3">
						<label>家庭成员及工作收入情况</label>
					 </div>
					  <div class="span9">
						<#if workApplyFile?? && workApplyFile.familyCondition??>
						    <textarea readOnly rows="5" cols="12" id="familyCondition" name="familyCondition" class="span6 tipTag"  style="width: 730px; height: 134px;">${(workApplyFile.familyCondition!"")}</textarea>
						<#else>
						    <textarea readOnly rows="5" cols="12" id="familyCondition" name="familyCondition" class="span6 tipTag"  style="width: 730px; height: 134px;"></textarea>
						</#if>	
					</div>
				  </div>
				 </div>
			</div>
			<div class="formSep"> 
			 	<div class="row-fluid">
					<div class="span6">
							<div class="span3">
								<label>用工部门</label>
							</div>
							<div class="span9 ">
								<select  disabled id="orgId" name="workOrg.org.id" <#if workApply?? && workApply.sponsorPosition??> title="${workApply.sponsorPosition.workOrg.org.name?html}" </#if> size="1"  aria-controls="dt_gal" >
								  		<option value="" />请选择..</option>
										<#if workApply?? && workApply.sponsorPosition ??  >
								     		<option  value="${workApply.sponsorPosition.workOrg.org.id}" selected="selected" />${workApply.sponsorPosition.workOrg.org.name?html}</option>
										</#if>
								</select>
							</div>
					 </div>
					<div class="span6">
							<div class="span3">
								<label>申请岗位</label>
							</div>
							<div class="span9 ">
								<select disabled  id="positionId" name="sponsorPosition.positionId" size="1"  aria-controls="dt_gal" >
							  		<option value="" />请选择..</option>
							  		
									<#if workApply?? && workApply.sponsorPosition ??  >
							     		<option  value="${workApply.sponsorPosition.positionId}" selected="selected" />${workApply.sponsorPosition.workName?html}</option>
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
						<label>申请岗位理由</label>
					  </div>
					  <div class="span9">
						<#if workApplyFile?? && workApplyFile.applyDesc??>
						    <textarea readOnly rows="5" cols="12" id="applyDesc" name="applyDesc" class="span6 tipTag"  style="width: 730px; height: 134px;">${(workApplyFile.applyDesc!"")}</textarea>
						<#else>
						    <textarea readOnly rows="5" cols="12" id="applyDesc" name="applyDesc" class="span6 tipTag"  style="width: 730px; height: 134px;"></textarea>
						</#if>	
					 </div>
				  </div>
				 </div>
			</div>
				 <!--课表安排信息-->
			<div class="formSep">
				  <div class="row-fluid">
				   <div class="span9">
					  <div class="span2">
						<label>课表安排</label>
					  </div>
					  <div class="span9">
							<#include "/sponsor/work/workStudy/approveSchedule.ftl"/>
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
						<div class="span10" id="_upload_div">
							<form  id="fileUploadForm"  action="" method="post"  enctype="multipart/form-data">
								 <#if uploadFileRefList??>	
									<#list uploadFileRefList as p>
										<div class="fileupload-info">
											
											<a href="${rc.contextPath}/sys/sysConfig/file.do?id=${p.uploadFile.id}"><strong>${p.uploadFile.name}&nbsp;(${p.uploadFile.fileSize})</strong></a>
											<input   type="hidden" id="fileId" name="fileId" value="${p.uploadFile.id}"/>	
										</div>					
									</#list>
								 </#if> 
						  	</form>	
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
				<button class="btn btn-info" type="button" onclick="approve.showHis('${(workApply.workApplyId)!""}');">审批历史</button>
	  			<button class="btn" type="button" onclick="javascript:window.close();">关闭</button>
			</div>
    	</div>
 	</div>
    </div>
   </div>
 <#-- 审核历史查看 -->
 <#include "/apw/instance/approveHistory.ftl">   
</div>
</body>
</html>
					   