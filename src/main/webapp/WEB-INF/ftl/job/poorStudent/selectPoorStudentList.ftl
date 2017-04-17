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
    		<form  id="selectPoorStudentQuery"  action="${rc.contextPath}/job/queryPoorStudent/opt-query/queryPoorStudentInfoList.do" method="post">
				<div class="span12">			
				   <div class="row-fluid">
			         <div class="span4">
						<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;姓名</span>
					    <input id="student.name" name="difficultStudentInfo.student.name" class="span6" <#if poorStudent.difficultStudentInfo?? && poorStudent.difficultStudentInfo.student??> value="${((poorStudent.difficultStudentInfo.student.name)!'')?html}"</#if> maxlength="225"/>
					  </div>
						 
					 <div class="span4">
						<span class="formTitle">学号</span>
						<input id="student.stuNumber" name="difficultStudentInfo.student.stuNumber" class="span6" value="${((poorStudent.difficultStudentInfo.student.stuNumber)!'')?html}" maxlength="225"/>
					 </div>
					 <div class="span4">
						  <span class="formTitle">学年</span>
						    <select size="1" id="schoolYear" class="span6" name="difficultStudentInfo.schoolYear.id" aria-controls="dt_gal" >
					          <option value="" />请选择..</option>
								<#if yearList??>
									<#list yearList as d>
										<#if poorStudent.difficultStudentInfo?? && poorStudent.difficultStudentInfo.student?? && poorStudent.difficultStudentInfo.student.schoolYear ?? && poorStudent.difficultStudentInfo.student.schoolYear.id==d.id >
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
					   <span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学院</span>
						<select size="1" <#if collegeStatus?? && collegeStatus=="false">disabled</#if> id="college" name="strCollege.id" aria-controls="dt_gal" class="span6" onChange="cascade.changeCollage('college','majorId');">
							<option value="" >请选择..</option>
							<#if collegeList??>
								<#list collegeList as c>
									<#if poorStudent?? && poorStudent.strCollege?? && c.id==poorStudent.strCollege.id>
										<option value="${c.id}" selected="selected">${c.name?html}</option>
									<#elseif college?? && college.id==c.id>
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
						<select size="1" id="majorId" name="strMajor.id" aria-controls="dt_gal" class="span6 emptySelect" onChange="cascade.changeMajor('majorId','classId');">
							<option value="" >请选择..</option>
							<#if majorList ?? >
								<#list majorList as m>
									<#if poorStudent?? && poorStudent.strMajor?? &&  poorStudent.strMajor.id == m.id >
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
						<select size="1" id="classId" name="strClassId.id" aria-controls="dt_gal" class="span6 emptySelect" >
							<option value="" >请选择..</option>
							<#if classList ?? >
								<#list classList as c>
									<#if poorStudent?? && poorStudent.strClassId?? && poorStudent.strClassId.id == c.id >
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
				      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
				      <input type="button" class="btn btn-info"  onclick="selectStudentInfo();" value="查 询"/>
                      <input type="button" class="btn btn-info"  onclick="comp.clearForm('selectPoorStudentQuery')" value="清 空"/>
			      </div>
			     </div>
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
				                      <#if user_key.optMap??>
										<#if user_key.optMap['export']??>
								            <input id="exportSize" name="exportSize" type="hidden" class="span3"  value="4000" title="excel单页条数" />
								            <button class="btn btn-info" type="button" onclick="javascript:exportPoorStudent()">导 出</button>
										</#if>
									 </#if>	
	
				                    </div>
				                </div>
				            </div>
				        </div>
				        
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
							<thead>
								<tr>
									<th width="5%">序号</th>
									<th width="8%">姓名</th>
									<th width="12%">学号</th>
									<th width="10%">学年</th>
									<th width="10%">学院</th>
									<th width="12%">专业</th>
									<th width="15%">班级</th>
									<th width="18%">困难类别</th>
									<th width="8%">状态</th>
								</tr>
							</thead>
							<tbody>
								<#if page??>	
									<#list page.result as p>
										<tr>
											<td>${p_index+1}</th>
											<td class="autocut tipTag" data="学院：${(p.studentInfo.college.name)!''}<br/>专业：${(p.studentInfo.major.majorName)!''}<br/>班级：${(p.studentInfo.classId.className)!''}<br/>"><a target="_blank" href="${rc.contextPath}/job/approvePoorStudent/opt-view/viewPoorStudent.do?id=${(p.id)!''}" title="查看双困生信息">${(p.studentInfo.name)!""}</td>
											<td class="autocut">${(p.studentInfo.stuNumber)!""}</td>
											<td class="autocut">${(p.schoolYear.name)!""}</td>
											<td class="autocut">${(p.studentInfo.college.name)!""}</td>
											<td class="autocut">${(p.studentInfo.major.majorName)!""}</td>
											<td class="autocut">${(p.studentInfo.classId.className)!""}</td>
											<td class="autocut">${(p.difficultType.name)!""}</td>
											<td class="autocut">${(p.status.name)!""}</td>
										</tr>
									</#list>
								 </#if> 
							</tbody>
						</table>
						 <#assign pageTagformId="selectPoorStudentQuery"/>
						  <input id="pageTotalCount" name="pageTotalCount" type="hidden"  value="${page.totalCount}"/>
						 <#include "/page.ftl">
					</div>
				</div>
			</div> 
		</div> 
	</div>
</div>

<div class="modal hide fade" id="exportdemo">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3 id="title1">导出双困生</h3>
	</div>
	<div class="modal-body" id="export_studentInfo">
		
	</div>
	<div class="modal-footer">
		<a href="#" class="btn" data-dismiss="modal">关闭</a>
	</div>
</div>
<#-- 脚本开始 -->
<script>
	
	
	//查询
	function selectStudentInfo(){
	    $("#selectPoorStudentQuery").attr("action","${rc.contextPath}/job/queryPoorStudent/opt-query/queryPoorStudentInfoList.do");
		$("#selectPoorStudentQuery").submit();
	}
	
	
	function exportPoorStudent(){
		var pageTotalCount= $("#pageTotalCount").val();
		var exportSize= $("#exportSize").val();
		var patrn=/^[0-9]{1,20}$/; 
		if(exportSize==""){
			comp.message("请输入大于0的正整数","error");
		}else if(!patrn.exec(exportSize)){
			comp.message("请输入大于0的正整数","error");
		}else if(exportSize<1){
			comp.message("请输入大于0的正整数","error");
		}else if(exportSize>10000){
			comp.message("请输入小于10000的正整数","error");
		}else{
			comp.showModal("exportdemo","500px","-250px 0 0 -250px");
			$("#export_studentInfo").load("${rc.contextPath}/job/queryPoorStudent/nsm/exportPoorStudentView.do?pageTotalCount="+pageTotalCount+"&exportSize="+exportSize);
		}
	}
	
	function exportPoorStudentDate(exportSize,exportPage){
	    var year = $("#schoolYear").val();
		$("#selectPoorStudentQuery").attr("action","${rc.contextPath}/job/opt-export/exportPoorStudent.do?year="+year);
		var fo=$("#selectPoorStudentQuery");
		if($("#studentPoQuery_exportPage").length==0){
			fo.append($("<input>",{
				id:'studentPoQuery_exportSize',
				type:'hidden',
				name:'studentPoQuery_exportSize',
				val:exportSize
			}));
			fo.append($("<input>",{
				id:'studentPoQuery_exportPage',
				type:'hidden',
				name:'studentPoQuery_exportPage',
				val:exportPage
			}));
		}else{
			$("#studentPoQuery_exportSize").val(exportSize);
			$("#studentPoQuery_exportPage").val(exportPage);
		}
		fo.submit();
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