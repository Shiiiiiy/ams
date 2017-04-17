<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<script type="text/javascript" src="${rc.contextPath}/js/common/cascadecommon.js"></script>
    </head>
        
	<body>
		<div id="contentwrapper">
		<div class="main_content">  
   		 
    	<form  id="registerQuery"  action="${rc.contextPath}/job/register/opt-query/registerList.do" method="post">
			<div class="row-fluid">	
				<div class="span4">
					<span class="formTitle">姓名</span>
				    <input id="stuName" name="stuName" class="span6" value="${((register.stuName)!'')?html}" />
				 </div>
							
				 <div class="span4">
					<span class="formTitle">学号</span>
					<input id="stuNumber" name="stuNumber" class="span6" value="${((register.stuNumber)!'')?html}"/>
				 </div>
						 
				<div class="span4">
				<span class="formTitle">学年</span>
					<select size="1" id="employmentYear" name="employmentYear.id" aria-controls="dt_gal" class="span6" >
						<option value="" >请选择</option>
						<#if yearList??>
						<#list yearList as y>
							<#if register?? && register.employmentYear?? && register.employmentYear.id == y.id >
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
						<select size="1" id="collegeId" name="college.id" aria-controls="dt_gal" class="span6 <#if collegeId?? > notClear </#if>" onchange="cascade.changeCollage('collegeId','majorId');" <#if collegeId??> disabled="disabled" </#if> >
							<option value="">请选择..</option>
							<#if collegeList??>
								<#list collegeList as c>
									<#if collegeId?? && collegeId == c.id>
										<option value="${c.id}" data-code="${c.code?html}" selected="selected" >${c.name?html}</option>
									<#elseif register?? && register.college?? && register.college.id == c.id >
										<option value="${c.id}" data-code="${c.code?html}" selected="selected" >${c.name?html}</option>	
									<#else>
										<option value="${c.id}" data-code="${c.code?html}" >${c.name?html}</option>	
									</#if>
								</#list>
							</#if>
						</select>
				</div>
					
				<div  class="span4">
					<span class="formTitle">专业</span>
				    <select size="1" id="majorId" name="major.id" aria-controls="dt_gal" class="span6 emptySelect" onchange="cascade.changeMajor('majorId','classId');" >
				    	<option value="" >请选择</option>
				    	<#if majorList ?? >
						<#list majorList as m>
							<#if register?? && register.major?? &&  register.major.id == m.id >
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
				    			<#if register ?? && register.classId?? && register.classId.id == c.id>
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
				</div>
				<div class="span4">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		            <input type="submit" class="btn btn-info" value="查询" />
		            <input type="button" class="btn btn-info" onclick="comp.clearForm('registerQuery');" value="清 空"/>
		        </div>
            </div>
		</form>
			
		<div class="row-fluid">
			<div class="span12">
			<h5 class="heading"></h5>
			<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
				<#if user_key.optMap??>
					<#if user_key.optMap['import']??>
					<div class="row">
						<div class="row-fluid">
		                    <button class="btn btn-info" type="button" onclick="importRegisterCode()">报到证编号导入</button>
						</div>
					</div>
					</#if>
				</#if>
				<table class="table table-bordered table-striped tablecut" id="smpl_tbl" >
					<thead>
						<th width="6%">序号</th>
						<th width="8%">姓名</th>
						<th width="8%">学号</th>
						<th width="8%">学年</th>
						<th width="11%">报到证编号</th>
						<th width="12%">新报到证编号</th>
						<th width="6%">操作</th>
					</thead>
					<tbody>
					<#if page??>	
						<#list page.result as p>
						<tr><td class="autocut">${p_index+1}</td>
							<td class="autocut tipTag" data="学院：${(p.student.college.name)!''}<br/>专业：${(p.student.major.majorName)!''}<br/>班级：${(p.student.classId.className)!''}<br/>">
								<a target="_blank" href="${rc.contextPath}/job/register/opt-view/viewRegister.do?id=${(p.id)!''}" title="查看学生报到证信息">${(p.student.name)!""}</td>
							<td class="autocut">${(p.student.stuNumber)!""}</td>
							<td class="autocut">${(p.employmentYear.name)!""}</td>
							<td class="autocut">${(p.registerCode)!""}</td>
							<td class="autocut">${(p.newRegisterCode)!""}</td>
							<td class="autocut">
							
							<a target="_blank" href="${rc.contextPath}/job/register/opt-view/viewRegister.do?id=${(p.id)!''}" title="查看学生报到证信息"><i class="icon-list-alt"></i></a>
							&nbsp;
							<#if user_key.optMap??>
								<#if user_key.optMap['update']??>
								 	<a href="${rc.contextPath}/job/register/opt-edit/editRegister.do?id=${p.id}" class="sepV_a" title="编辑学生报到证信息"><i class="icon-edit"></i></a>
								</#if>
								<#if user_key.optMap['del']??>
									<a href="#" onclick="deleteObj('${(p.student.name)}', '${p.id}')" title="删除报到证信息"><i class="icon-trash"></i></a>
								</#if>
							</#if></td>
						</tr>
						</#list>
					</#if> 
					</tbody>
				</table>
			</div>
		</div>		
				
		<#assign pageTagformId="registerQuery"/>
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
		
		
		function importRegisterCode(){
			window.location.href = "${rc.contextPath}/job/register/importRegisterCode.ftl";
		}
		
		<#-- 删除导入的某一个人的数据 -->
		function deleteObj(name, id) {
			if(id){
				comp.confirm("确定要删除【" + name + "】报到证信息吗？" , function(result) {
    				if(!result) return;
					$.ajax({
						url:'${rc.contextPath}/job/register/opt-del/deleteRegister.do',
						async:false,
						cache: false,
						type: "POST",
						data:{id : id },
						success: function(data){
				 			$("#registerQuery").submit();
				   	 	}
					});
				});		
			}
		}
		
	</script>
	
</body>
</html>