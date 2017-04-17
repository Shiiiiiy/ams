<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="${rc.contextPath}/css/starSelect.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${rc.contextPath}/js/common/cascadecommon.js"></script>
    </head>
    <body>
		<div id="contentwrapper">
   		<div class="main_content">   
    	   <div class="row-fluid">	
    		<form  id="countStudentInfoQuery"  action="${rc.contextPath}/sponsor/countDifficultStudent/opt-count/countDifficultStudentInfo.do" method="post">
			  <div class="span12">
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">姓名</span>
						    <input id="student.name" name="student.name" class="span6" value="${((difficultStudentInfo.student.name)!'')?html}" maxlength="225"/>
						 </div>
						 
						 <div class="span4">
							<span class="formTitle">学号</span>
							<input id="stuNumber" name="student.stuNumber" class="span6" value="${((difficultStudentInfo.student.stuNumber)!'')?html}" maxlength="225"/>
						 </div>
						 
						 <div class="span4">
						  <span class="formTitle">推荐档次</span>
						    <select size="1" id="difficultLevel.id" class="span6" name="difficultLevel.id" aria-controls="dt_gal" >
					          <option value="" />请选择..</option>
								 <#if difficultList??>
										<#list difficultList as d>
											<#if difficultStudentInfo.difficultLevel ?? && difficultStudentInfo.difficultLevel.id==d.id >
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
						<select <#if collegeStatus?? && collegeStatus=="false">disabled</#if> size="1" id="college" name="college.id" aria-controls="dt_gal" class="span6" onChange="cascade.changeCollage('college', 'majorId');">
							<option value="" >请选择..</option>
							<#if collegeList??>
								<#list collegeList as c>
									<#if difficultStudentInfo?? && difficultStudentInfo.college?? && c.id==difficultStudentInfo.college.id>
										<option value="${c.id}" selected="selected">${c.name?html}</option>
									<#elseif collegeId?? && collegeId==c.id>
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
						<select size="1" id="majorId" name="major.id" aria-controls="dt_gal" class="span6 emptySelect" onChange="cascade.changeMajor('majorId', 'classId');">
							<option value="" >请选择..</option>
							<#if majorList ?? >
								<#list majorList as m>
									<#if difficultStudentInfo?? && difficultStudentInfo.major?? &&  difficultStudentInfo.major.id == m.id >
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
						<select size="1" id="classId" name="classId.id" aria-controls="dt_gal" class="span6 emptySelect" >
							<option value="" >请选择..</option>
							<#if classList ?? >
								<#list classList as c>
									<#if difficultStudentInfo?? && difficultStudentInfo.classId?? && difficultStudentInfo.classId.id == c.id >
										<option value="${c.id}" selected >${c.className}</option>
									<#elseif baseClassModel?? && baseClassModel.id==c.id>
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
						  <span class="formTitle">学年</span>
						    <select size="1" id="schoolYear" class="span6" name="schoolYear.id" aria-controls="dt_gal">
							 <option value="" >请选择..</option>
								<#if yearList??>
									<#list yearList as d>
										<#if difficultStudentInfo.schoolYear ?? && difficultStudentInfo.schoolYear.id==d.id >
											<option  value="${d.id}" selected="selected" />${d.name?html}</option>
										<#elseif yearDic?? && d.id==yearDic.id>
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
		                  <input type="button" class="btn btn-info"  onclick="comp.clearForm('countStudentInfoQuery')" value="清 空"/>
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
					                            <button class="btn btn-info" type="button" onclick="javascript:exportDifficultStudent()">导 出</button>
											</#if>
										</#if>	
				                    </div>
				                </div>
				            </div>
				        </div>
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl" >
							<thead>
								<tr>
									<th width="5%">序号</th>
									<th width="7%">姓名</th>
									<th width="9%">学号</th>
									<th width="9%">推荐档次</th>
									<th width="9%">学年</th>
									<th width="9%">低保证</th>
									<th width="9%">是否孤儿</th>
									<th width="9%">是否残疾</th>
									<th width="9%">是否单亲</th>
									<th width="8%">村级证明</th>
									<th width="8%">镇级证明</th>
									<th width="8%">县级证明</th>
								</tr>
							</thead>
							<tbody>
								<#if page??>	
									<#list page.result as p>
										<tr>
											<td>${p_index+1}</td>
											<td class="autocut tipTag" data="学院：${(p.student.college.name)!''}<br/>专业：${(p.student.major.majorName)!''}<br/>班级：${(p.student.classId.className)!''}<br/>"><a target="_blank" href="${rc.contextPath}/sponsor/difficultStudent/opt-view/viewDifficultStudentInfo.do?id=${(p.id)!''}" title="查看困难生信息"> ${(p.student.name)!""}</a></td>
											<td class="autocut">${(p.student.stuNumber)!""}</td>
											<td class="autocut">${(p.difficultLevel.name)!""}</td>
											<td class="autocut">${(p.schoolYear.name)!""}</td>
											<td class="autocut">${(p.lowAssuranceLevel.name)!""}</td>
											<td class="autocut">${(p.isOrphan.name)!""}</td>
											<td class="autocut">${(p.disabilityCertificateKind.name)!""}</td>
											<td class="autocut">${(p.isSingle.name)!""}</td>
											<td class="autocut">${(p.villageProve.name)!""}</td>
											<td class="autocut">${(p.townProve.name)!""}</td>
											<td class="autocut">${(p.countyProve.name)!""}</td>
										</tr>
									</#list>
								 </#if> 
							</tbody>
						</table>
						 <#assign pageTagformId="countStudentInfoQuery"/>
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
		<h3 id="title1">导出困难生信息</h3>
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
	    $("#countStudentInfoQuery").attr("action","${rc.contextPath}/sponsor/countDifficultStudent/opt-count/countDifficultStudentInfo.do");
		$("#countStudentInfoQuery").submit();
	}
	
	
	function exportDifficultStudent(){
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
			$("#export_studentInfo").load("${rc.contextPath}/sponsor/difficultStudent/nsm/exportDifficultStudentView.do?pageTotalCount="+pageTotalCount+"&exportSize="+exportSize);
		}
	}
	
	function exportDifficultStudentDate(exportSize,exportPage){
	    var year = $("#schoolYear").val();
		$("#countStudentInfoQuery").attr("action","${rc.contextPath}/sponsor/opt-export/exportDifficultStudentInfo.do?year="+year);
		var fo=$("#countStudentInfoQuery");
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