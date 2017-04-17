<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script>
	<!--显示提示框-->
	$(function(){
		$('.tipTag').poshytip({
			className: 'tip-yellowsimple',
			alignTo: 'target',
			alignX: 'right',
			alignY: 'center',
			offsetX: -10
		});
	});
	</script>
</head>
<body>
<div id="contentwrapper">
    <div class="main_content">   
    	   <div class="row-fluid">	
    		<form id="associationHonorFormView"  action="${rc.contextPath}/association/service/opt-query/viewMemberHonorList.do" method="post">
				 <div class="span12">
				 	<input type="hidden" name="associationId" id="associationId" value="${associationId!""}"/>
				 	<input type="hidden" id="selectedBox" name="selectedBox"/>			
					<div class="row-fluid">
					<div class="span4">
						<span class="formTitle">荣誉名称</span>
						<input name="honorName"  class="span6" <#if honor?? && honor.honorName??>value="${honor.honorName!''}"</#if>/>
					</div> 
					 <div class="span4">
						<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学年</span>
						<select size="1" id="honorYear" name="honorYear.id" aria-controls="dt_gal" class="span6"">
							<option value="" >请选择</option>
							<#if yearList??>
								<#list yearList as c>
									<#if honor?? && honor.honorYear?? && honor.honorYear.id?? &&  c.id==honor.honorYear.id>
										<option value="${c.id}" selected="selected">${c.name?html}</option>
									<#else>
										<option value="${c.id}">${c.name?html}</option>
									</#if>
								</#list>
							</#if>
						</select>
					</div>
					<div class="span4">
						<span class="formTitle">学期</span>
						<select size="1" class="span6" id="term" name="honorTerm.id" aria-controls="dt_gal" >
							<option value="" >请选择</option>
							<#if termList??>
								<#list termList as t>
									<#if honor?? && honor.honorTerm ??&& honor.honorTerm.id??&& honor.honorTerm.id==t.id >
										<option value="${t.id}"  selected="selected">${t.name?html}</option>
									<#else>
										<option value="${t.id}">${t.name?html}</option>
									</#if>
								</#list>
							</#if>
						</select>
					</div>
				  </div>
				  <div class="row-fluid"> 
					 <div class="span4">
						<span class="formTitle">荣誉级别</span>
						<select size="1" id="honorLevel" name="honorLevel.id" aria-controls="dt_gal" class="span6"">
							<option value="" >请选择</option>
							<#if honorTypeList??>
								<#list honorTypeList as c>
									<#if honor?? && honor.honorLevel?? && honor.honorLevel.id?? &&  c.id==honor.honorLevel.id>
										<option value="${c.id}" selected="selected">${c.name?html}</option>
									<#else>
										<option value="${c.id}">${c.name?html}</option>
									</#if>
								</#list>
							</#if>
						</select>
					</div>
					<div class="span4" style="padding-left:50px;">
		              <input type="submit" class="btn btn-info" value="查 询"/>
		              <input type="button" class="btn btn-info"  onclick="comp.clearForm('associationHonorFormView')" value="清 空"/>
		          </div>
				</div>
			</form>
			<div class="row-fluid">
					<div class="span12">
						<h5 class="heading"></h5>
						<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
						<div class="row">
						</div>
						
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
							<thead>
								<tr>
								    <th width="6%">序号</th>
									<th width="15%">荣誉名称</th>
									<th width="8%">姓名</th>
									<th width="10%">学年</th>
									<th width="10%">学期</th>
									<th width="12%">荣誉时间</th>
									<th width="10%">荣誉级别</th>
									<th width="30%">附件信息</th>
								</tr>
							</thead>
							<tbody>
							<#if page??>	
								<#list page.result as p>
								<tr>		
								    <td>${p_index+1}</td>
									<td class="autocut">${(p.honorName!"")?html}</td>											
									<td class="autocut tipTag" <#if p.member.memberPo??>data="学号：${p.member.memberPo.stuNumber}<br/>班级：${p.member.memberPo.classId.className}<br/>专业：${p.member.memberPo.major.majorName}<br/>学院：${p.member.memberPo.college.name}<br/>"</#if> ><#if p.member?? && p.member.memberPo??>${(p.member.memberPo.name!"")?html}</#if></td>
									<td class="autocut">${(p.honorYear.name!"")?html}</td>
									<td class="autocut">${(p.honorTerm.name!"")?html}</td>
									<td class="autocut"><#if p.honorTime??>${((p.honorTime!"")?string("yyyy-MM-dd"))?html}</#if></td>
									<td class="autocut"><#if p.honorLevel??>${(p.honorLevel.name!"")?html}</#if></td>
									<td class="autocut">
										<#if p.uploadFileList??>	
											<#list p.uploadFileList as f>
												<a href="${rc.contextPath}/sys/sysConfig/file.do?id=${f.uploadFile.id}"><strong>${f.uploadFile.name}</strong></a><br/>
											</#list>
										 </#if> 
						            </td>
								</tr>
								</#list>
							 </#if> 
							</tbody>
						</table>
						 <#assign pageTagformId="associationHonorFormView"/>
						 <#include "/page.ftl">
						</div>
					</div>
				</div>
			</div> 
		</div> 
	</div>
</div>
</body>
</html>