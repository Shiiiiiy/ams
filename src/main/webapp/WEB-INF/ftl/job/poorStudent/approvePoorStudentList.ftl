<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <script type="text/javascript" src="${rc.contextPath}/js/common/cascadecommon.js"></script>
        <!-- multiselect -->
	    <link rel="stylesheet" href="${rc.contextPath}/lib/multiselect/css/multi-select.css" />
		<script src="${rc.contextPath}/lib/multiselect/js/jquery.multi-select.min.js"></script>
		<script src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script>	
        <!-- ajax form-->
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
    </head>
    <body>
	  <div id="contentwrapper">
   		<div class="main_content">   
    	   <div class="row-fluid">	
    		<form  id="approvePoorStudentQuery"  action="${rc.contextPath}/job/approvePoorStudent/opt-query/approvePoorStudentInfoList.do" method="post">
				<div class="span12">			
				   <div class="row-fluid">
			         <div class="span4">
						<span class="formTitle">姓名</span>
					    <input id="student.name" name="difficultStudentInfo.student.name" class="span6" <#if poorStudent.difficultStudentInfo?? && poorStudent.difficultStudentInfo.student??> value="${((poorStudent.difficultStudentInfo.student.name)!'')?html}"</#if> maxlength="225"/>
					  </div>
						 
					 <div class="span4">
						<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学号</span>
						<input id="student.stuNumber" name="difficultStudentInfo.student.stuNumber" class="span6" value="${((poorStudent.difficultStudentInfo.student.stuNumber)!'')?html}" maxlength="225"/>
					 </div>
					 <div class="span4">
						  <span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学年</span>
						    <select size="1" id="schoolYear" class="span6" name="difficultStudentInfo.schoolYear.id" aria-controls="dt_gal" >
					          <option value="" />请选择..</option>
								<#if yearList??>
									<#list yearList as d>
										<#if poorStudent.difficultStudentInfo?? && poorStudent.difficultStudentInfo.schoolYear?? && poorStudent.difficultStudentInfo.schoolYear.id==d.id >
											<option  value="${d.id}" selected="selected" />${d.name?html}</option>
										<#elseif yearDic?? && yearDic.id==d.id>
										    <option  value="${d.id}" selected="selected" />${d.name?html}</option>
										<#else>
											<option value="${d.id}" />${d.name?html}</option>
										</#if>
									</#list>
								 </#if>
				         	</select>
						 </div>
						</div>
						
				   <div class="row-fluid"> 
					 <div class="span4">
					   <span class="formTitle">学院</span>
						<select size="1" id="college" name="difficultStudentInfo.student.college.id" aria-controls="dt_gal" class="span6" onChange="cascade.changeCollage('college', 'majorId','classId');">
							<option value="" >请选择..</option>
							<#if collegeList??>
								<#list collegeList as c>
									<#if poorStudent?? && poorStudent.difficultStudentInfo?? && poorStudent.difficultStudentInfo.student?? && poorStudent.difficultStudentInfo.student.college?? && c.id==poorStudent.difficultStudentInfo.student.college.id>
										<option value="${c.id}" selected="selected">${c.name?html}</option>
									<#else>
										<option value="${c.id}">${c.name?html}</option>
									</#if>
								</#list>
							</#if>
						</select>
					</div>
					<div class="span4">
						<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;专业</span>
						<select size="1" id="majorId" name="difficultStudentInfo.student.major.id" aria-controls="dt_gal" class="span6 emptySelect" onChange="cascade.changeMajor('majorId', 'classId');">
							<option value="" >请选择..</option>
							<#if majorList ?? >
								<#list majorList as m>
									<#if poorStudent?? && poorStudent.difficultStudentInfo?? && poorStudent.difficultStudentInfo.student?? && poorStudent.difficultStudentInfo.student.major?? &&  poorStudent.difficultStudentInfo.student.major.id == m.id >
										<option value="${m.id}" selected >${m.majorName}</option>
									<#else>
										<option value="${m.id}">${m.majorName}</option>
									</#if>
								</#list>
							</#if>
						</select>
					</div>
				
					<div class="span4">
						<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;班级</span>
						<select size="1" id="classId" name="difficultStudentInfo.student.classId.id" aria-controls="dt_gal" class="span6 emptySelect" >
							<option value="" >请选择..</option>
							<#if classList ?? >
								<#list classList as c>
									<#if poorStudent?? && poorStudent.difficultStudentInfo?? && poorStudent.difficultStudentInfo.student?? && poorStudent.difficultStudentInfo.student.classId?? && poorStudent.difficultStudentInfo.student.classId.id == c.id >
										<option value="${c.id}" selected >${c.className}</option>
									<#else>
										<option value="${c.id}">${c.className}</option>
									</#if>
								</#list>
							</#if>
						</select>
					</div>
				</div>
				
				<div class="row-fluid"> 
				  <div class="span4">
					<span class="formTitle">状态</span>
						<select size="1" name="status.name" aria-controls="dt_gal" class="span6">
							<option value="" >请选择..</option>
								<#list processStatusMap?keys as c>
									<#if poorStudent ?? && poorStudent.status?? && poorStudent.status.name == c >
										<option value="${c}" selected >${processStatusMap[c]}</option>
									<#else>
										<option value="${c}">${processStatusMap[c]}</option>
									</#if>
								</#list>
						</select>	
				   </div>
			   <div class="span4">
				<span class="formTitle">困难类别</span>
				 <select size="1" id="difficultType" class="span6" name="difficultType.id" aria-controls="dt_gal" >
    			  <option value="" />请选择..</option>
					<#if difficultTypeList??>
						<#list difficultTypeList as d>
							<#if poorStudent?? && poorStudent.difficultType?? && poorStudent.difficultType.id==d.id >
								<option  value="${d.id}" selected="selected" />${d.name?html}</option>
							<#else>
								<option value="${d.id}" />${d.name?html}</option>
							</#if>
						</#list>
					 </#if>
				   </select>
				</div>
		        <div class="span4">
		            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				    <input type="button" class="btn btn-info"  onclick="selectApproveStudent();" value="查 询"/>
                    <input type="button" class="btn btn-info"  onclick="comp.clearForm('approvePoorStudentQuery')" value="清 空"/>
			   </div>
			   </div>
			   </div>
			    <#-- 选中的数据项ID -->
		    	<input type="hidden" id="selectedBox" name="selectedBox" value="">
			</form>
				<div class="row-fluid">
					<div class="span12">
						<h5 class="heading"></h5>
						<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
				        <div class="row">
				            <div class="span10">
				                <div class="dt_actions">
				                    <div class="row-fluid">
											<button class="btn btn-info" type="button" id="postMessage-button" onclick="submitMulProcess('approveProcess','selectedBox')">
					                   		                  批量审核
					                        </button>
				                    </div>
				                </div>
				            </div>
				        </div>
				        
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
							<thead>
								<tr>
									<th width="3%"><input type="checkbox" id="totalCheck"  onclick="selectAllbox('totalCheck','approveProcess')"/></th>
									<th width="8%">姓名</th>
									<th width="12%">学号</th>
									<th width="10%">学年</th>
									<th width="9%">学院</th>
									<th width="12%">专业</th>
									<th width="13%">班级</th>
									<th width="18%">困难类别</th>
									<th width="8%">状态</th>
									<th width="8%">操作</th>
								</tr>
							</thead>
							<tbody>
								<#if page??>	
									<#list page.result as p>
									   <#if p.studentInfo??>
									     <#assign student = p.studentInfo/>
									     <#assign schoolYear = p.schoolYear/>
									   <#else>  
									     <#assign student = p.difficultStudentInfo.student/>
									     <#assign schoolYear = p.difficultStudentInfo.schoolYear/>
									   </#if> 
										<tr>
											<td>
											<#if p.status?? && p.status.code="SUBMIT">
											   <input type="checkbox"  name="approveProcess" value="${p.id!""}"/>
											</#if>
											</td>   
											<td class="autocut tipTag" data="学院：${(student.college.name)!''}<br/>专业：${(student.major.majorName)!''}<br/>班级：${(student.classId.className)!''}<br/>"><a target="_blank" href="${rc.contextPath}/job/approvePoorStudent/opt-view/viewPoorStudent.do?id=${(p.id)!''}" title="查看双困生信息">${(student.name)!""}</a></td>
											<td class="autocut">${(student.stuNumber)!""}</td>
											<td class="autocut">${(schoolYear.name)!""}</td>
											<td class="autocut">${(student.college.name)!""}</td>
											<td class="autocut">${(student.major.majorName)!""}</td>
											<td class="autocut">${(student.classId.className)!""}</td>
										    <td class="autocut">${(p.difficultType.name)!""}</td>
											<td class="autocut">
												<#if p.status?? && p.status.code?? && p.status.code=="SUBMIT">
													待审核
												<#else>
													${(p.status.name)!""}
												</#if>
											</td>
											<td>
											<#if user_key.optMap['approve']?? && p.status?? && p.status.code="SUBMIT">
											   <a href="${rc.contextPath}/job/approvePoorStudent/opt-approve/approvePoorStudent.do?id=${p.id}" class="sepV_a" title="双困生审核"><i class="icon-check"></i></a>
											</#if>
											</td>
										</tr>
									</#list>
								 </#if> 
							</tbody>
						</table>
						 <#assign pageTagformId="approvePoorStudentQuery"/>
						 <#include "/page.ftl">
					</div>
				</div>
			</div> 
		</div> 
	</div>
</div>

<#-- 脚本开始 -->
<script>
	//查询
	function selectApproveStudent(){
	    $("#approvePoorStudentQuery").attr("action","${rc.contextPath}/job/approvePoorStudent/opt-query/approvePoorStudentInfoList.do");
		$("#approvePoorStudentQuery").submit();
	}
	
	
	
    //批量审批
	function selectAllbox(mainbox,boxname){
		comp.selectAllCheckbox(mainbox,boxname);
	}
	
	function editMulProcess(){
		$("#approvePoorStudentQuery").attr("action","${rc.contextPath}/job/approvePoorStudent/opt-query/checkedApproveList.do").submit();
	}
	
	function submitMulProcess(boxname,selectedBox){
		if(!comp.checkboxSelectValidator(boxname)){
			$.sticky("请选择要审批的信息!", {autoclose:5000, position:"top-right", type:"st-error"});
	        return;
		}else{
			comp.getCheckboxValue(boxname,selectedBox);
			editMulProcess();
		}
	}
	
	
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
  
		
</script>
</body>
</html>