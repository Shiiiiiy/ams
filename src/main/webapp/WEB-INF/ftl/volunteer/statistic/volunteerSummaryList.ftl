<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<script src="${rc.contextPath}/js/jquery.form.js"></script>
</head>
<body>
<div id="contentwrapper">
    <div class="main_content">   
    	<div class="row-fluid">
    	    <form id="volunteerQuery"  action="${rc.contextPath}/volunteer/statistic/opt-query/summaryVolunteerInfo.do" method="post">
				<div class="span12">
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">学院</span>
						    <select size="1" id="collegeId" name="college.id" aria-controls="dt_gal" class="span7" onchange="cascade.changeCollage('collegeId','majorId','classId');" >
							<option value="">请选择..</option>
							<#if collegeList ??>
								<#list collegeList as c>
									<#if  volunteerSummaryInfoModel ?? && volunteerSummaryInfoModel.college ?? &&  volunteerSummaryInfoModel.college.id == c.id >
										<option  value="${c.id}" selected="selected">${c.name!""?html}</option>
									<#else>
										<option value="${c.id}" >${c.name!""?html}</option>
									</#if>
								</#list>
							</#if>
						   </select>
						</div>
						<div class="span4">
							<span class="formTitle">学年</span>
						    <select size="1" id="year" name="yearId" aria-controls="dt_gal" class="span7">
							<option value="">请选择..</option>
							<#if yearList ??>
								<#list yearList as c>
									<#if yearId ?? && yearId == c.id >
										<option  value="${c.id}" selected="selected">${c.name!""?html}</option>
									<#else>
										<option value="${c.id}" >${c.name!""?html}</option>
									</#if>
								</#list>
							</#if>
						   </select>
						</div>
						<div class="span4">
			              <button class="btn btn-info"  type="submit">查 询</button>
			              <button class="btn btn-info" type="button" onclick="comp.clearForm('volunteerQuery');">清 空</button>
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
									<th width="15%">志愿者总人数</th>
									<th width="17%">参加培训总人数</th>
									<th width="20%">获得志愿者荣誉人数</th>
									<th width="17%">参加服务总人数</th>
									<th width="17%">服务总时数</th>
								</tr>
						  </thead>
						  <tbody>
                                <#if page??>	
								    <#list page.result as p>								
									    <tr>		
										    <td>${p_index+1}</td>
											<td class="autocut">${p.college.name!""?html}</td>
											<td class="autocut">${p.volunteerNums!""?html}</td>
											<td class="autocut">${p.trainingNums!""?html}</td>
											<td class="autocut">${p.honorNums!""?html}</td>
											<td class="autocut">${p.serviceNums!""?html}</td>
											<td class="autocut">${p.serviceHourNums!""?html}</td>
										</tr>
								    </#list>
								</#if>
						  </tbody>
					</table>
					 <#assign pageTagformId="volunteerQuery"/>
					 <input id="pageTotalCount" name="pageTotalCount" type="hidden"  value="${page.totalCount}"/>
					 <#include "/page.ftl">
					</div>
				</div>
		    </div> 
		</div> 
	</div>
</div>
</body>
</html>