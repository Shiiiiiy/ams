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
    		<form  id="approveProvinceGoodStudentQuery"  action="${rc.contextPath}/job/approveProvinceGoodStudent/opt-query/queryApproveProvinceGoodStudentList.do" method="post">
				<div class="span12">			
				   <div class="row-fluid">
			         <div class="span4">
						<span class="formTitle">姓名</span>
					    <input id="student.name" name="schoolGoodStudent.studentId.name" class="span6" <#if provinceGoodStudent.schoolGoodStudent?? && provinceGoodStudent.schoolGoodStudent.studentId??> value="${((provinceGoodStudent.schoolGoodStudent.studentId.name)!'')?html}"</#if> maxlength="225"/>
					  </div>
						 
					 <div class="span4">
						<span class="formTitle">学号</span>
						<input id="student.stuNumber" name="schoolGoodStudent.studentId.stuNumber" class="span6" value="${((provinceGoodStudent.schoolGoodStudent.studentId.stuNumber)!'')?html}" maxlength="225"/>
					 </div>
					 <div class="span4">
						  <span class="formTitle">学年</span>
						    <select size="1" id="schoolYear" class="span6" name="schoolGoodStudent.schoolYear.id" aria-controls="dt_gal" >
					          <option value="" />请选择..</option>
								<#if yearList??>
									<#list yearList as d>
										<#if provinceGoodStudent.schoolGoodStudent?? && provinceGoodStudent.schoolGoodStudent.schoolYear ?? && provinceGoodStudent.schoolGoodStudent.schoolYear.id==d.id >
											<option  value="${d.id}" selected="selected" />${d.name?html}</option>
										<#elseif yearDic?? && yearDic.id == d.id>
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
						<select size="1" id="college" name="schoolGoodStudent.studentId.college.id" aria-controls="dt_gal" class="span6" onChange="cascade.changeCollage('college', 'majorId','classId');">
							<option value="" >请选择..</option>
							<#if collegeList??>
								<#list collegeList as c>
									<#if provinceGoodStudent?? && provinceGoodStudent.schoolGoodStudent?? && provinceGoodStudent.schoolGoodStudent.studentId?? && provinceGoodStudent.schoolGoodStudent.studentId.college?? && c.id==provinceGoodStudent.schoolGoodStudent.studentId.college.id>
										<option value="${c.id}" selected="selected">${c.name?html}</option>
									<#else>
										<option value="${c.id}">${c.name?html}</option>
									</#if>
								</#list>
							</#if>
						</select>
					</div>
					<div class="span4">
						<span class="formTitle">专业</span>
						<select size="1" id="majorId" name="schoolGoodStudent.studentId.major.id" aria-controls="dt_gal" class="span6 emptySelect" onChange="cascade.changeMajor('majorId', 'classId');">
							<option value="" >请选择..</option>
							<#if majorList ?? >
								<#list majorList as m>
									<#if provinceGoodStudent?? && provinceGoodStudent.schoolGoodStudent?? && provinceGoodStudent.schoolGoodStudent.studentId?? && provinceGoodStudent.schoolGoodStudent.studentId.major?? &&  provinceGoodStudent.schoolGoodStudent.studentId.major.id == m.id >
										<option value="${m.id}" selected >${m.majorName}</option>
									<#else>
										<option value="${m.id}">${m.majorName}</option>
									</#if>
								</#list>
							</#if>
						</select>
					</div>
				
					<div class="span4">
						<span class="formTitle">班级</span>
						<select size="1" id="classId" name="schoolGoodStudent.studentId.classId.id" aria-controls="dt_gal" class="span6 emptySelect" >
							<option value="" >请选择..</option>
							<#if classList ?? >
								<#list classList as c>
									<#if provinceGoodStudent?? && provinceGoodStudent.schoolGoodStudent?? && provinceGoodStudent.schoolGoodStudent.studentId?? && provinceGoodStudent.schoolGoodStudent.studentId.classId?? && provinceGoodStudent.schoolGoodStudent.studentId.classId.id == c.id >
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
					    <select size="1" id="status" class="span6" name="status.name" aria-controls="dt_gal" >
				          <option value="" />请选择..</option>
							<#list processStatusMap?keys as c>
								<#if provinceGoodStudent ?? && provinceGoodStudent.status?? && provinceGoodStudent.status.name == c >
									<option value="${c}" selected >${processStatusMap[c]}</option>
								<#else>
									<option value="${c}">${processStatusMap[c]}</option>
								</#if>
							</#list>
			         	 </select>
					   </div>		
			        <div class="span4">
			            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  
					    <input type="button" class="btn btn-info"  onclick="selectStudentInfo();" value="查 询"/>
	                    <input type="button" class="btn btn-info"  onclick="comp.clearForm('approveProvinceGoodStudentQuery')" value="清 空"/>
				   </div>
			 </div>
			   <#-- 选中的数据项ID -->
		    	<input type="hidden" id="selectedBox" name="selectedBox" value="">
		       </div>
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
									<th width="5%"><input type="checkbox" id="totalCheck"  onclick="selectAllbox('totalCheck','approveProcess')"/></th>
									<th width="8%">姓名</th>
									<th width="10%">学号</th>
									<th width="8%">学年</th>
									<th width="12%">班级</th>
									<th width="8%">班级排名</th>
									<th width="7%">职务</th>
									<th width="10%">计算机等级</th>
									<th width="8%">外语等级</th>
									<th width="8%">状态</th>
									<th width="8%">操作</th>
								</tr>
							</thead>
							<tbody>
								<#if page??>	
									<#list page.result as p>
										<tr>
											<td width="5%">
											<#if p.status?? && p.status.code="APPLY">
											<input type="checkbox"  name="approveProcess" value="${p.id!""}"/>
											</#if>
											</td>
											<td class="autocut tipTag" data="学院：${(p.schoolGoodStudent.studentId.college.name)!''}<br/>专业：${(p.schoolGoodStudent.studentId.major.majorName)!''}<br/>班级：${(p.schoolGoodStudent.studentId.classId.className)!''}<br/>"><a target="_blank" href="${rc.contextPath}/job/approveProvinceGoodStudent/opt-view/approveProvinceGoodStudentView.do?id=${(p.id)!''}&&flag=view" title="查看省优秀毕业生信息">${(p.schoolGoodStudent.studentId.name)!""}</a></td>
											<td class="autocut">${(p.schoolGoodStudent.studentId.stuNumber)!""}</td>
											<td class="autocut">${(p.schoolGoodStudent.schoolYear.name)!""}</td>
											<td class="autocut">${(p.schoolGoodStudent.studentId.classId.className)!""}</td>
											<td class="autocut">${(p.schoolGoodStudent.classSort)!""}</td>
											<td class="autocut">${(p.schoolGoodStudent.post)!""}</td>
											<td class="autocut">${(p.schoolGoodStudent.computerLevel)!""}</td>
											<td class="autocut">${(p.schoolGoodStudent.englishLevel)!""}</td>
											<td class="autocut">
											   <#if p.status?? && p.status.code?? && p.status.code=="APPLY">
													待审核
												<#else>
													${(p.status.name)!""}
												</#if>
											</td>
											<td>
											<#if user_key.optMap['approve']?? && p.status?? && p.status.code="APPLY">
											   <a href="${rc.contextPath}/job/approveProvinceGoodStudent/opt-add/approveProvinceGoodStudent.do?id=${p.id}" class="sepV_a" title="省优秀毕业生审核"><i class="icon-check"></i></a>
											</#if>
											<#if user_key.optMap['del']??>
											    <#if p.status?? && p.status.code="APPLY_PASS">
													   <a href="javascript:void(0);" onclick="deleteStudentInfo('${(p.schoolGoodStudent.studentId.name)!""}','${(p.id)!""}');" class="sepV_a" title="撤销省优秀毕业生"><i class="icon-ban-circle"></i></a>
											    </#if>
											</#if>    	
											</td>
										</tr>
									</#list>
								 </#if> 
							</tbody>
						</table>
						 <#assign pageTagformId="approveProvinceGoodStudentQuery"/>
						 <#include "/page.ftl">
					</div>
				</div>
			</div> 
		</div> 
	</div>
</div>



<#-- 脚本开始 -->
<script>
	
	
     //判断数据是否为空
	function isEmpty(s){
	  return ((s==undefined || s==null || s=="" || s==0) ? true : false);
	}
	
	
	
	//查询
	function selectStudentInfo(){
	    $("#approveProvinceGoodStudentQuery").attr("action","${rc.contextPath}/job/approveProvinceGoodStudent/opt-query/queryApproveProvinceGoodStudentList.do");
		$("#approveProvinceGoodStudentQuery").submit();
	}
	
	
	
	
	 //批量审批
	function selectAllbox(mainbox,boxname){
		comp.selectAllCheckbox(mainbox,boxname);
	}
	
	function editMulProcess(){
		$("#approveProvinceGoodStudentQuery").attr("action","${rc.contextPath}/job/approveProvinceGoodStudent/opt-query/checkedApproveList.do").submit();
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
	
	
	//删除操作
	function deleteStudentInfo(name,id)
	{
		comp.confirm("确定要撤销【"+name+"】的省优秀资格吗？", function(result) {
        	if(!result)
        		return;  
    		$.post("${rc.contextPath}/job/provinceGoodStudent/opt-del/deleteProvinceGoodStudent.do", { id: id }, function(data){
    			if(data === "success")
    			{
    				comp.message(name +"取消成功！","info");
    				 window.location.href="${rc.contextPath}/job/approveProvinceGoodStudent/opt-query/queryApproveProvinceGoodStudentList.do";
    			}
			    
			   },"text");
		}); 
	}
			
	
</script>
</body>
</html>