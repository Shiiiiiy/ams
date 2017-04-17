<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
</head>
<body>
<div id="contentwrapper">
    <div class="main_content">   
    	   <div class="row-fluid">	
    		<form  id="classQuery"  action="${rc.contextPath}/base/class/opt-query/listBaseClass.do" method="post">
				<div class="span12">			
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">单位学院</span>
							<select size="1" id="collageId" name="major.collage.id" aria-controls="dt_gal" class="span8" onchange="cascade.changeCollage('collageId','majorId');" >
								<option value="">请选择..</option>
								<#if baseClass.major?? && baseClass.major.collage ?? >
									<#list collageList as d>
										<#if baseClass.major.collage.id ==d.id >
											<option  value="${d.id}" selected="selected">${d.name?html}</option>
										<#else>
											<option value="${d.id}" >${d.name?html}</option>
										</#if>
									</#list>
								<#else>
									<#list collageList as d>
										<option  value="${d.id}">${d.name?html}</option>
									</#list>
								</#if>
							</select>
						 </div>
						 <div class="span4">
							<span class="formTitle">专业</span>
							<select size="1" id="majorId" name="major.id" aria-controls="dt_gal" class="span8"  onchange="cascade.changeMajor('majorId','classId');">
								<option value="" >请选择..</option>
								<#if majorList ?? >
									<#list majorList as m>
										<#if baseClass ?? && baseClass.major ?? &&  baseClass.major.id == m.id >
											<option value="${m.id}" selected >${m.majorName}</option>
										<#else>
											<option value="${m.id}">${m.majorName}</option>
										</#if>
									</#list>
								</#if>
							</select>
						  </div>
						<div class="span4">
							<span class="formTitle">班级名称</span>
							<input id="className" name="className" class="span8" value="${baseClass.className!""?html}" />
						</div>
					</div>
		            <div class="btnCenter">
		              <button class="btn btn-info"  type="submit">查 询</button>
		              <button class="btn btn-info" type="button" onclick="comp.clearForm('classQuery');">清 空</button>
		            </div>
				</div>
			</form>
    
				<div class="row-fluid">
					<div class="span12">
						<h5 class="heading"></h5>
						<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
				        
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
							<thead>
								<tr>
									<th width="6%">序号</th>
									<th width="10%">班号</th>
									<th width="20%">班级名称</th>
									<th width="10%">班长</th>
									<th width="10%">班主任</th>
									<th width="8%">年级</th>
									<th width="15%">专业</th>
									<th width="15%">学院单位</th>
								</tr>
							</thead>
							<tbody>
							<#if page??>	
								<#list page.result as p>
								<tr>
									<td>${p_index+1}</td>
									<td class="autocut">${p.code!""?html}</td>
									<td class="autocut">${p.className!""?html}</td>
									<td class="autocut"><#if p.monitor ?? >${p.monitor.name!""?html}</#if></td>
									<td class="autocut"><#if p.headermaster ?? >${p.headermaster.name!""?html}</#if></td>
									<td class="autocut">${p.grade!""?html}</td>
									<td class="autocut"><#if p.major ?? >${p.major.majorName!""?html}</#if></td>
									<td class="autocut"><#if p.major ?? && p.major.collage ??  >${p.major.collage.name!""?html}</#if></td>
								</tr>
								</#list>
							 </#if> 
							</tbody>
						</table>
						 <#assign pageTagformId="classQuery"/>
						 <#include "/page.ftl">
					</div>
				</div>
			</div> 
		</div> 
	</div>
</div>

</body>
</html>