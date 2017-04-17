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
				<#if workApply?? && workApply.workApplyId??>
					勤工助学修改
				<#else>
					勤工助学申请 
				</#if>
		   </h3>
		  </div>
		 </div> 
		 <input name="errorText" id="errorText" type="hidden" value="${errorText!""}"/>
			<#if workApplyFile?? && workApplyFile.workApplyFileId??>
				<form  id="workStudyForm" class="form_validation_reg" action="${rc.contextPath}/sponsor/workStudy/opt-update/saveWorkStudy.do" method="post">
			<#else>
				<form  id="workStudyForm" class="form_validation_reg" action="${rc.contextPath}/sponsor/workStudy/opt-save/saveWorkStudy.do" method="post" >
			</#if>
		   
		    <input id="difficultStudentInfoId" type="hidden" name="difficultStudentInfo.id"  value="${(currentStudentInfo.id)!''}">
		    <input id="flags" type="hidden" name="flags"  value="${(flags)!""}">
			<div class="formSep">
			 	 <input type="hidden" id="workApplyId" name="workApplyId"  <#if workApply??> value="${(workApply.workApplyId!"")?html}" </#if>/>	
				 <#if workApplyFile??>
				 		<input type="hidden" id="workApplyFileId" name="workApplyFileId" value="${(workApplyFile.workApplyFileId!"")?html}"/>	
				 		<input type="hidden" id="applyFileId" name="applyFile.workApplyFileId" value="${(workApplyFile.workApplyFileId!"")?html}"/>	
				 <#else>	
						<input type="hidden" id="workApplyFileId" name="workApplyFileId" />	
				 		<input type="hidden" id="applyFileId" name="applyFile.workApplyFileId"/>				 	
				 </#if>
			 	 <div class="formSep"> 
			 		<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<lable>学年</lable>
							</div>
							<div class="span9">
								<select  disabled="disabled" id="year" size="1"  aria-controls="dt_gal" >
							  		<option value="" />请选择..</option>
									<#if yearList ??>
										<#list yearList as d>
											<#if workApplyFile?? && workApplyFile.schoolYear ?? && workApplyFile.schoolYear.id==d.id >
											     <option  value="${d.id}" selected="selected" />${d.name?html}</option>
											<#elseif nowYearDic?? && d.id==nowYearDic.id>
												<option value="${d.id}" selected="selected">${d.name}</option>
											<#else>
												<option value="${d.id}" >${d.name}</option>	
											</#if>
										</#list>
									</#if>
						   		</select>
						   		<#if workApplyFile?? && workApplyFile.schoolYear??>
						    		<input type="hidden" id="schoolYearId" name="schoolYear.id" value="${workApplyFile.schoolYear.id}"/>
								<#else>
						    		<input type="hidden" id="schoolYearId" name="schoolYear.id" value="${nowYearDic.id}"/>
								</#if>
						    
							</div>
						</div>
						
						<div class="span6">
							<div class="span3">
								<lable>学期</lable>
							</div>
							<div class="span9">
								<select  disabled="disabled" size="1" id="term" name="term.id" aria-controls="dt_gal" class="{required:true}" >
									<option value="" >请选择</option>
									<#if termList??>
										<#list termList as t>
											<#if workApplyFile?? && workApplyFile.term ?? && workApplyFile.term.id==t.id >
											     <option  value="${t.id}" selected="selected" />${t.name?html}</option>
											<#elseif nowTermDic?? && t.id==nowTermDic.id>
												<option value="${t.id}" selected="selected">${t.name}</option>
											<#else>
												<option value="${t.id}" >${t.name}</option>	
											</#if>
										</#list>
									</#if>
								</select>
								<#if workApplyFile?? && workApplyFile.term??>
						    		<input type="hidden" id="termId" name="term.id" value="${workApplyFile.term.id}"/>
								<#else>
									<input type="hidden" id="termId" name="term.id" <#if nowTermDic??>value="${nowTermDic.id}"</#if>/>
								</#if>
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
							<input id="student.name" name="student.name" readOnly <#if currentStudentInfo?? && currentStudentInfo.student??> value="${(currentStudentInfo.student.name!"")?html}" </#if>/>
						</div>
					</div>
					<div class="span6">
						<div class="span3">
							<label>性别</label>
						</div>
						<div class="span9">
						 <#if genderList??>
							<#list genderList as a>
				    			<#if currentStudentInfo ?? && currentStudentInfo.student?? && currentStudentInfo.student.genderDic?? && currentStudentInfo.student.genderDic.id==a.id >
										<input  id="sexId" name="student.genderDic.name" readOnly value="${a.name}" />
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
							<label>出生年月<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="brithDate" name="student.brithDate" readOnly <#if currentStudentInfo?? && currentStudentInfo.student?? && currentStudentInfo.student.brithDate??> value="${(currentStudentInfo.student.brithDate!"")?string("yyyy-MM-dd")}"</#if>/>
						</div>
					</div>
						
					<div class="span6">
						<div class="span3">
							<label>身份证号<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="certificateCode" name="student.certificateCode" readOnly <#if currentStudentInfo?? && currentStudentInfo.student?? && currentStudentInfo.student.certificateCode??>  value="${((currentStudentInfo.student.certificateCode)!"")?html}"</#if>/>
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
							<input id="college" name="difficultStudentInfo.student.college.name" readOnly <#if currentStudentInfo?? && currentStudentInfo.student?? && currentStudentInfo.student.college??> value="${(currentStudentInfo.student.college.name!"")?html}" </#if>/>
							<input id="collegeId"  type="hidden" name="student.college.id" <#if currentStudentInfo?? && currentStudentInfo.student?? && currentStudentInfo.student.college??>value="${(currentStudentInfo.student.college.id!"")?html}"</#if>/>
						</div>
					</div>
					<div class="span6">
						<div class="span3">
							<label>专业<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="major" name="difficultStudentInfo.student.major.name" readOnly <#if currentStudentInfo?? && currentStudentInfo.student?? && currentStudentInfo.student.major??> value="${(currentStudentInfo.student.major.majorName!"")?html}" </#if>/>
							<input id="majorId"  type="hidden" name="student.major.id" <#if currentStudentInfo?? && currentStudentInfo.student?? && currentStudentInfo.student.major??>value="${(currentStudentInfo.student.major.id!"")?html}"</#if>/>
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
							<input id="className" name="difficultStudentInfo.student.classId.className" readOnly <#if currentStudentInfo?? && currentStudentInfo.student?? && currentStudentInfo.student.classId??>  value="${(currentStudentInfo.student.classId.className!"")?html}"</#if>/>
							<input id="classId"  type="hidden" name="student.classId.code" <#if currentStudentInfo?? && currentStudentInfo.student?? && currentStudentInfo.student.classId??>value="${(currentStudentInfo.student.classId.code!"")?html}""</#if>/>
							
						</div>
					 </div>
					<div class="span6">
						<div class="span3">
							<label>学号<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="stuNumber" name="student.stuNumber" readOnly value="${((currentStudentInfo.student.stuNumber)!"")?html}"/>
						</div>
					</div>
						
					
				  </div>
			   </div>
			   
			  
			    <div class="formSep"> 
			   <div class="row-fluid">
			   		<div class="span6">
						<div class="span3">
							<label>困难等级<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="difficultLevel" name="difficultStudentInfo.difficultLevel.name" readOnly <#if currentStudentInfo?? && currentStudentInfo.difficultLevel??>  value="${((currentStudentInfo.difficultLevel.name)!"")?html}"</#if>/>
						</div>
					 </div>
			   		<div class="span6">
						<div class="span3">
							<label>联系方式<span class="f_req">*</span></label>
						</div>
						<div class="span9">
							<input id="phone" name="phone" <#if workApplyFile?? && workApplyFile.phone??>  value="${((workApplyFile.phone)!"")?html}"</#if>/>
						</div>
					 </div>
					
						
				  </div>
			   </div>
			     <div class="formSep"> 
			   	  <div class="row-fluid">
			  		<div class="span6">
						<div class="span3">
							<label>EMAIL <span class="f_req">*</span></label>
						</div>
						<div class="span9">
							<input id="attachEmail" name="attachEmail"  <#if workApplyFile?? && workApplyFile.phone??>value="${((workApplyFile.attachEmail)!"")?html}"</#if>/>
						</div>
					</div>
					<div class="span6">
						<div class="span3">
							<label>QQ <span class="f_req">*</span></label>
						</div>
						<div class="span9">
							<input id="attachQQ" name="attachQQ"  value="${((workApplyFile.attachQQ)!"")?html}"/>
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
						<label>特长<span class="f_req">*</span></label>
					 </div>
					  <div class="span9">
						<#if workApplyFile?? && workApplyFile.forte??>
						    <textarea rows="5" cols="12" id="forte" name="forte"  style="width: 730px; height: 134px;">${((workApplyFile.forte)!"")?html}</textarea>
						<#else>
						    <textarea rows="5" cols="12" id="forte" name="forte"  style="width: 730px; height: 134px;"></textarea>
						</#if>	
					</div>
				  </div>
				 </div>
				</div> 
			   <div class="formSep">
				<div class="row-fluid">
				
				  <div class="span6">
					  <div class="span3">
						<label>勤工助学经历<span class="f_req">*</span></label>
					  </div>
					  <div class="span9">
						<#if workApplyFile?? && workApplyFile.workExperience??>
						    <textarea rows="5" cols="12" id="workExperience" name="workExperience"  style="width: 730px; height: 134px;">${(workApplyFile.workExperience!"")}</textarea>
						<#else>
						    <textarea rows="5" cols="12" id="workExperience" name="workExperience"  style="width: 730px; height: 134px;"></textarea>
						</#if>	
					  </div>
				  </div>
				 </div>
				</div> 
			  <div class="formSep">
				<div class="row-fluid">
				  <div class="span6">
					<div class="span3">
						<label>家庭成员及工作收入情况<span class="f_req">*</span></label>
					 </div>
					  <div class="span9">
						<#if workApplyFile?? && workApplyFile.familyCondition??>
						    <textarea rows="5" cols="12" id="familyCondition" name="familyCondition" style="width: 730px; height: 134px;">${(workApplyFile.familyCondition!"")}</textarea>
						<#else>
						    <textarea rows="5" cols="12" id="familyCondition" name="familyCondition" style="width: 730px; height: 134px;"></textarea>
						</#if>	
					</div>
				  </div>
				 </div>
				 </div> 
			  <div class="formSep"> 
			 		<div class="row-fluid">
						<div class="span6">
							<div class="span3">
							<label>用工部门<span class="f_req">*</span></label>
						</div>
						<div class="span9 ">
							<select   id="orgId" name="workOrg.org.id" onChange="showPositionList()"  size="1"  aria-controls="dt_gal" >
							  		<option value="" >请选择..</option>
							  		<#if workOrgList ??>
										<#list workOrgList as d>
											<#if workApply?? && workApply.sponsorPosition ?? && workApply.sponsorPosition.workOrg.workOrgId==d.workOrgId >
											
									     		<option  value="${d.org.id}" selected="selected" >${d.org.name?html}</option>
											<#else>
												<option value="${d.org.id}" >${d.org.name}</option>	
											</#if>
										</#list>
									</#if>
							</select>
						</div>
					 </div>
						<div class="span6">
							<div class="span3">
								<label>申请岗位<span class="f_req">*</span></label>
							</div>
							<div class="span9 ">
								<#if workApply?? && workApply.sponsorPosition??>
							
										<input type="hidden" id="positionId" name="positionId" value="${workApply.sponsorPosition.positionId}"/>
									
								</#if>
								<select  id="sponsorPosition" name="sponsorPosition.positionId" size="1"  aria-controls="dt_gal" >
									
										
									
								</select>
						   </div>
							
						</div>
					</div>
				</div>
				 
			  <div class="formSep">
				 <div class="row-fluid">
				  <div class="span6">
					<div class="span3">
						<label>申请岗位理由<span class="f_req">*</span></label>
					 </div>
					  <div class="span9">
						<#if workApplyFile?? && workApplyFile.applyDesc??>
						    <textarea rows="5" cols="12" id="applyDesc" name="applyDesc"  style="width: 730px; height: 134px;">${(workApplyFile.applyDesc!"")}</textarea>
						<#else>
						    <textarea rows="5" cols="12" id="applyDesc" name="applyDesc"  style="width: 730px; height: 134px;"></textarea>
						</#if>	
					</div>
				  </div>
				 </div>
				</div>
				 
				 <!--课表安排信息-->
				  <div class="row-fluid">
					  <div class="span9">
						 <div class="span2">
							<label>课表安排<span class="f_req">*</span></label>
						  </div>
						  <div class="span9">
							 <#include "editSchedule.ftl"/>
						  </div>
					  </div>
				 </div>
				
				</div> 
		   </form>
				
			  <div class="formSep">
				<div class="row-fluid">					
				  <div class="span9">
				    <div class="span2">
						 <label>上传附件</label>
					   </div>
						<div class="span10" id="_upload_div">
						<form  id="fileUploadForm"  action="" method="post"  enctype="multipart/form-data">
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
				    <#if workApply??&&workApply.workApplyId??&& workApply.processStatus??&&workApply.processStatus=="REJECT">
				    <button class="btn btn-info" type="button" onclick="approve.showHis('${(workApply.workApplyId)!""}');">审批历史</button>
		  			</#if>
		  			<button class="btn" type="button" onclick="javascript:window.history.back(-1);">取 消</button>
			  	</div>
		   	</div>
		   	<input name="check_error" id="check_error" type="hidden" value="true"/>
		   	<input name="repeat_error" id="repeat_error" type="hidden" value="true"/>
		</div>
    	</div>
 	 </div>
  </div>
   <#include "/apw/instance/approvers.ftl"/>
 </div>
<#-- 审核历史查看 -->
   <#include "/apw/instance/approveHistory.ftl"> 
 <#-- 脚本开始 -->

<script>
	//校验电话号码
	jQuery.validator.addMethod("checkPhone",function(value,element){
	  		if(value != ""){
	      		var patrn = /^(0[0-9]{2,3}\-)?([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$|(^(13[0-9]|15[0|3|6|7|8|9]|18[8|9])\d{8}$)/;
	     		 return patrn.exec(value);
	   		}else{
	      		return true;
	   		}
  			return false;
	},"请输入正确的电话号码,并且只能是数字与-的组合");
		
	/*
	 *校验岗位重复
	 */
	jQuery.validator.addMethod("isRepeatPositionId", function(value,element) {
		var currentStudentInfoId=$("#difficultStudentInfoId").val();
		var positionId=$("#sponsorPosition option:selected").val();
		var workApplyId=$("#workApplyId").val();
		var yearId=$("#schoolYearId").val();
		var termId=$("#term").val();
		var optionalval = this.optional(element);
		var returnval;
		 $.ajax({
         	url:"${rc.contextPath}/sponsor/workStudy/opt-add/isRepeatPosition.do",
         	async:false,
			cache:false,
			type:"POST",
			data:{currentStudentInfoId:currentStudentInfoId,positionId:positionId,workApplyId:workApplyId,yearId:yearId,termId:termId},
         	success:function(msg){
         		returnval = optionalval||(msg=='success');
         	}
         });
			return returnval;
	}, "你已经申请过相同岗位了，请重新选择");
	
 

	$("document").ready(function(){
  		showPositionList();
  		//判断岗位是否已满人员。
  		var data={positionId:function(){return $("#sponsorPosition option:selected").val();}};
		comp.validate.addRemote("positionCheck","${rc.contextPath}/sponsor/workStudy/opt-query/positionCheck.do",data,"该岗位人数已满，请选择其他岗位。");
		//页面校验
		 $(".form_validation_reg").compValidate({
			rules:{   
					'attachEmail':{required:true,email:true,minlength:1,maxlength:50},
					'attachQQ':{required:true,digits:true,minlength:1,maxlength:20},
					'forte':{required:true,minlength:1,maxlength:200},
					'phone':{required:true,checkPhone:true,minlength:1,maxlength:20},
					'schoolYear.id':{required:true},
					'term.id': {required:true},
					'workExperience':{required:true,minlength:1,maxlength:200},
					'familyCondition':{required:true,minlength:1,maxlength:500},
					'applyDesc':{required:true,minlength:1,maxlength:100},
					'workOrg.org.id':{required:true},
					'sponsorPosition.positionId':{required:true,isRepeatPositionId:true,positionCheck:true},
					'lessonCheckBox':{required:true}
				},
				messages:{
					'attachEmail':{required:'邮箱不能为空',email:'邮箱不符合规则',maxlength:'邮箱不能超过50字'},
					'attachQQ':{required:'QQ不能为空',digits:'QQ只能为数字',maxlength:'QQ不能超过20字'},
					'forte':{required:'特长不能为空',maxlength:'特长不能超过200字'},
					'phone':{required:'电话不能为空',maxlength:'电话不能超过20字'},
					'schoolYear.id':{required:'学年不能为空！'},
					'term.id':{required:'学期不能为空！'},
					'workExperience':{required:'勤工助学经历不能为空！',maxlength:'勤工助学经历不能超过200字'},
					'familyCondition':{required:'家庭成员及工作收入情况不能为空',maxlength:'家庭成员情况不能超过500字'},
					'applyDesc':{required:'申请理由不能为空',maxlength:'申请理由不能超过100字'},
					'workOrg.org.id':{required:'用工部门不能为空'},
					'sponsorPosition.positionId':{required:'申请岗位不能为空'},
					'lessonCheckBox':{required:'课表不能为空'}
					
			 }		
		 });
     });
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
	
	
	

	//保存方法 
 	 function onSub(stas){
 	
 		 $("#flags").val(stas);
			if($("#workStudyForm").valid()){
				 if(stas=="1"){
			        if(confirm("提交信息后不能修改，确认要提交吗？")) {
	                	
	               		copyFileIdInput();
	                	var workApplyId=$("#workApplyId").val();
                		$.ajax({
							url: "${rc.contextPath}/sponsor/workStudyApprove/opt-save/submitWorkStudy.do",
							async:false,
							cache:false,
							type:"POST",
							data:$('#workStudyForm').serialize(),
				    		success: function(id){
								if(!isEmpty(id)){
									var strs= new Array(); //定义一数组
									strs=id.split("_"); //字符分割 
									
									$("#workApplyId").val(strs[0]);
									$("#workApplyFileId").val(strs[1]);
									$("#applyFileId").val(strs[1]);
								
									comp.message("岗位申请已经保存成功，选择下一个待办人后就会自动提交","info");
					       			apw.selectNextApprover(strs[0],"INIT","SPONSOR_WORK_STUDY_APPROVE",$("#approveReason").val());
					   	 		}else{
					    			$.sticky("岗位申请保存失败", {autoclose:5000, position:"top-right", type:"st-error"});
					    			return;
					    		}
							}
				 		});
	                	
	              	}
	             }else{
	            	copyFileIdInput();
	            	mask.showShade();
	            	$("#workStudyForm").submit();	
	            	
				 }
			}
      }
      
    
	/*
	 * 初始化当前发起流程【doInitAction方法名不可修改】
	 */
	function doInitAction(objectId,userId){
	    var url = "${rc.contextPath}/sponsor/workStudyApprove/opt-add/saveCurProcess.do";
		apw.initCurProcess(url,objectId,userId);
	}
    


	 /*
	  * 执行业务系统的操作
 	  */
	 function doAmsAction(userId,approveKey,approveStatus,processStatusCode,suggest){
		var workApplyId=$("#workApplyId").val()
		mask.showShade();
		window.location.href="${rc.contextPath}/sponsor/workStudy/opt-update/addSubmitStatus.do?workApplyId="+workApplyId;
		
	 }

	
	 /*
	  *上传附件
	  */
	 	
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
		$("#workStudyForm").append($("#fileUploadForm input[name='fileId']"));
		
	}
	
				
	function showPositionList()  
{  
   
   var orgId=$("#orgId").val();
   var yearId=$("#schoolYearId").val();
   var termId=$("#termId").val();
   var sponsorPositionId=$("#positionId").val();
  
   $.ajax({
     	url:"${rc.contextPath}/sponsor/workStudy/opt-add/getPositionList.do",
     	async:false,
		cache:false,
		type:"POST",
		dataType: "json",
		data:{orgId:orgId,yearId:yearId,termId:termId},
     	success:function(data){
     		
     		//清空
     		$("#sponsorPosition").empty();
         	var obj=eval(data);
         	// 添加一个空选项
         	var option="<option value=''>请选择..</option>";
			
         	for(var i in obj){
         		 if( sponsorPositionId==obj[i][0]){
         		  	option=option+"<option  value='"+obj[i][0]+"' selected>"+obj[i][1]+"</option>";
         		 }else{
            		option=option+"<option  value='"+obj[i][0]+"' >"+obj[i][1]+"</option>";
         		 
         		 }
         	}
         	
         	$("#sponsorPosition").append(option);
           
       }
   });
   
}  

 </script>
</body>
</html>
					   