<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    </head>
    <body>
<div id="contentwrapper">
    <div class="main_content">   
    	   <div class="row-fluid">	
    		<form  id="warningQuery"  action="${rc.contextPath}/warning/query/opt-query/warningForwardPage.do" method="post">
				<div class="span12">			
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学院</span>
							 <select size="1" id="collegeId" name="college.id" aria-controls="dt_gal" class="span7" <#if flag ?? && flag ==true>disabled</#if> >
								<option value="">请选择..</option>
								<#if collegeList ??>
									<#list collegeList as c>
										<#if  warningForward ?? && warningForward.college ?? &&  warningForward.college.id == c.id >
											<option  value="${c.id}" selected="selected">${c.name?html}</option>
										<#else>
											<option value="${c.id}" >${c.name?html}</option>
										</#if>
									</#list>
								</#if>
							   </select>
						 </div>
						 <div class="span4">
							<span class="formTitle">学年</span>
							 <select size="1" id="yearId" name="yearDic.id" aria-controls="dt_gal" class="span7">
								<option value="">请选择..</option>
								<#if yearList ??>
									<#list yearList as c>
										<#if  warningForward ?? && warningForward.yearDic ?? &&  warningForward.yearDic.id == c.id >
											<option  value="${c.id}" selected="selected">${c.name?html}</option>
										<#else>
											<option value="${c.id}" >${c.name?html}</option>
										</#if>
									</#list>
								</#if>
							   </select>
						  </div>
						<div class="span4">
							<span class="formTitle">学期</span>
							<select size="1" id="termId" name="termDic.id" aria-controls="dt_gal" class="span7">
								<option value="">请选择..</option>
								<#if termList ??>
									<#list termList as c>
										<#if  warningForward ?? && warningForward.termDic ?? &&  warningForward.termDic.id == c.id >
											<option  value="${c.id}" selected="selected">${c.name?html}</option>
										<#else>
											<option value="${c.id}" >${c.name?html}</option>
										</#if>
									</#list>
								</#if>
							   </select>
						</div>
					</div>
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">预警类型</span>
							<select size="1" id="warningType" name="warningType.id" aria-controls="dt_gal" class="span7">
								<option value="">请选择..</option>
								<#if warningTypeList ??>
									<#list warningTypeList as c>
										<#if  warningForward ?? && warningForward.warningType ?? &&  warningForward.warningType.id == c.id >
											<option  value="${c.id}" selected="selected">${c.name?html}</option>
										<#else>
											<option value="${c.id}" >${c.name?html}</option>
										</#if>
									</#list>
								</#if>
							   </select>
						 </div>
						 <div class="span4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<button class="btn btn-info" type="submit">查 询</button>
							<button class="btn btn-info" type="button" onclick="comp.clearForm('warningQuery')">清 空</button>
						  </div>
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
									<th width="15%">学院</th>
									<th width="10%">学年</th>
									<th width="10%">学期</th>
									<th width="12%">预警类型</th>
									<th width="12%">上报时间</th>
									<th width="10%">修改人</th>
									<th width="10%">附件数量</th>
									<th width="8%">操作</th>
								</tr>
							</thead>
							<tbody>
							<#if page??>	
								<#list page.result as p>
								<tr>
									<td>${p_index+1}</td>
									<td class="autocut">${p.college.name?html}</td>
									<td class="autocut">${p.yearDic.name?html}</td>
									<td class="autocut">${p.termDic.name?html}</td>
									<td class="autocut">${p.warningType.name?html}</td>
									<td class="autocut"><#if p.warningDate??>${(p.warningDate!"")?string('yyyy-MM-dd')}</#if></td>
									<td class="autocut">${(p.updateUser.name!"")?html}</td>
									<td class="autocut"><#if p.fileNumber??>${p.fileNumber?html}<#else>0</#if></td>
									<td>
										<a href="${rc.contextPath}/warning/query/view/viewWarningForward.do?id=${p.id}"  target="_blank" class="sepV_a" title="查看"><i class="icon-list-alt"></i></a>
									</td>
								</tr>
								</#list>
							 </#if>
							</tbody>
						</table>	
						 <#assign pageTagformId="warningQuery"/>
						 <#include "/page.ftl">
					</div>
				</div>
			</div> 
		</div> 
	</div>
</div>
<script>
</script>
</body>
</html>