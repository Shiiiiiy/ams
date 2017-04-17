

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="${rc.contextPath}/css/bdp_comp.css" type="text/css" />
		<script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
    </head>
        
	<body>
		<div id="contentwrapper">
		<div class="main_content">  
   		 
    	<form  id="agreementQuery"  action="${rc.contextPath}/job/apply/opt-query/agreementApplyList.do" method="post">
			<div class="row-fluid">	
				<div class="span4">
					<span class="formTitle">姓名</span>
				    <input id="name" name="stuName" class="span6"  value="${((agreement.stuName)!'')?html}" />
				 </div>
							
				 <div class="span4">
					<span class="formTitle">学号</span>
					<input id="stuNumber" name="stuNumber" class="span6" value="${((agreement.stuNumber)!'')?html}"/>
				 </div>
						 
				<div class="span4">
				<span class="formTitle">学年</span>
					<select size="1" id="employmentYear" name="employmentYear.id" aria-controls="dt_gal" class="span6" >
						<option value="" >请选择</option>
						<#if yearList??>
						<#list yearList as y>
							<#if agreement?? && agreement.employmentYear?? && agreement.employmentYear.id == y.id >
								<option value="${y.id}" data-code="${y.code?html}" selected="selected">${y.name?html}</option>
							<#else>
								<option value="${y.id}" data-code="${y.code?html}" >${y.name?html}</option>
							</#if>
						</#list>
						</#if>
					</select>
				</div>
			</div>
					 
			<div class="row-fluid">	 
				<div class="span4">
				<span class="formTitle">学院</span>
					<select size="1" id="collegeId" name="college.id" aria-controls="dt_gal" class="span6" onchange="cascade.changeCollage('collegeId','majorId');" <#if collegeId??> disabled="disabled" </#if> >
						<option value="">请选择..</option>
						<#if collegeList??>
							<#list collegeList as c>
								<#if agreement?? && agreement.college?? && agreement.college.id == c.id >
									<option value="${c.id}" data-code="${c.code?html}" selected="selected" >${c.name?html}</option>	
								<#else>
									<option value="${c.id}" data-code="${c.code?html}" >${c.name?html}</option>	
								</#if>
							</#list>
						</#if>
					</select>
				</div>
					
				<div class="span4">
					<span class="formTitle">专业</span>
				    <select size="1" id="majorId" name="major.id" aria-controls="dt_gal" class="span6 emptySelect" onchange="cascade.changeMajor('majorId','classId');" >
				    	<option value="" >请选择</option>
				    	<#if majorList ?? >
						<#list majorList as m>
							<#if agreement?? && agreement.major?? && agreement.major.id == m.id >
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
			    <select size="1" id="classId" name="classId.id" aria-controls="dt_gal" class="span6 emptySelect" >
			    	<option value="" >请选择</option>
			    	<#if classList?? >
			    		<#list classList as c>
			    			<#if agreement ?? && agreement.classId?? && agreement.classId.id == c.id>
			    				<option value="${c.id}" selected = "selected">${c.className}</option>	
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
				<select size="1" id="status" name="status.id" aria-controls="dt_gal" class="span6"   >
					<option value="">请选择..</option>
					<#if statusList??>
						<#list statusList as s>
							<#if agreement?? && agreement.status?? && agreement.status.id == s.id >
								<option value="${s.id}" data-code="${s.code?html}" selected="selected" >${s.name?html}</option>	
							<#else>
								<option value="${s.id}" data-code="${s.code?html}" >${s.name?html}</option>	
							</#if>
						</#list>
					</#if>
				</select>
				</div>
					
				<div class="span4">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              		<input type="submit" class="btn btn-info"  value="查 询"/>
          			<input type="button" class="btn btn-info"  onclick="comp.clearForm('agreementQuery');" value="清 空"/>
       			</div>
           	</div>
		</form>
			
		<div class="row-fluid">
			<div class="span12">
			<h5 class="heading"></h5>
			<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
				<table class="table table-bordered table-striped tablecut" id="smpl_tbl" >
					<thead>
					<tr>
						<th width="7%">序号</th>
						<th width="9%">姓名</th>
						<th width="11%">学号</th>
						<th width="10%">学年</th>
						<th width="10%">人事主管部门名称</th>
						<th width="10%">就业单位名称</th>
						<th width="10%">申请补办理由</th>
						<th width="8%">状态</th>
						<th width="8%">操作</th>
					</tr>
					</thead>
					<#-- 选中的数据项ID -->
			        <input type="hidden" id="checkedIds" name="checkedIds" value="">
					<tbody>
					<#if page??>	
						<#list page.result as p>
						<tr>
							<td class="autocut">${p_index+1}</td>
							<td class="autocut tipTag" data="学院：${(p.student.college.name)!''}<br/>专业：${(p.student.major.majorName)!''}<br/>班级：${(p.student.classId.className)!''}<br/>">${(p.student.name)!""}</td>
							<td class="autocut">${(p.student.stuNumber)!""}</td>
							<td class="autocut">${(p.employmentYear.name)!""}</td>
							<td class="autocut">${(p.humanDepartment)!""}</th>
							<td class="autocut">${(p.employmentDepartment)!""}</th>
							<td class="autocut">${(p.applyReason)!""}</th>
							<td class="autocut" ><#if p.status??>${p.status.name!""}</#if></td>
							<td class="autocut">
								<#if p.status?? && ( p.status.id == submitStatus.id )>
								<#else>
									<#if user_key.optMap??>
										<#if user_key.optMap['apply']??>
									 		<a href="${rc.contextPath}/job/agreement/opt-apply/applyAgreement.do?id=${p.id}" class="sepV_a" title="申请学生就业协议信息"><i class="icon-share"></i></a>
										</#if>
									</#if>
								</#if>
							</td>
						</tr>
						</#list>
					</#if> 
					</tbody>
				</table>
			</div>
		</div>		
				
		<#assign pageTagformId="agreementQuery"/>
		<#include "/page.ftl">
		</div>
		</div>
	
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
	</script>
	
</body>
</html>