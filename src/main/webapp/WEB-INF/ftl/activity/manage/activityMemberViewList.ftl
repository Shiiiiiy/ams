<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	    <script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
	    <!-- animated progressbars -->
	    <script src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script>
	    <script src="${rc.contextPath}/js/jquery.form.js"></script>
    </head>
    <body>
		<div id="contentwrapper">
		    <div class="main_content">  
		    	<div class="row-fluid">
		    		<form id="activityMemberQuery" method="post" action="">
						 <div class="span12">
						 	<div class="row-fluid">
						  		<div class="span4">
									<span class="formTitle">学院</span>
								    <select size="1" id="collegeId" name="member.college.id" aria-controls="dt_gal" class="span7" onchange="cascade.changeCollage('collegeId','majorId','classId');" >
										<option value="">请选择..</option>
										<#if collegeList ??>
											<#list collegeList as c>
												<#if  activityMember ?? && activityMember.member ?? && activityMember.member.college ?? && activityMember.member.college.id == c.id >
													<option  value="${c.id}" selected="selected">${c.name!""?html}</option>
												<#else>
													<option value="${c.id}" >${c.name!""?html}</option>
												</#if>
											</#list>
										</#if>
								    </select>
							    </div>
								<div class="span4">
									<span class="formTitle">专业</span>
									<select size="1" id="majorId" name="member.major.id" aria-controls="dt_gal" class="span7 emptySelect"  onchange="cascade.changeMajor('majorId','classId');">
										<option value="" >请选择..</option>
										<#if majorList ?? >
											<#list majorList as m>
												<#if activityMember ?? && activityMember.member ?? && activityMember.member.major ?? && activityMember.member.major.id == m.id >
													<option value="${m.id}" selected >${m.majorName?html}</option>
												<#else>
													<option value="${m.id}">${m.majorName?html}</option>
												</#if>
											</#list>
										</#if>
									</select>
								 </div>
								 <div class="span4">
									 <span class="formTitle">班级</span>
									 <select size="1" id="classId" name="member.classId.id" aria-controls="dt_gal" class="span7 emptySelect">
										<option value="" >请选择..</option>
										<#if classList ?? >
											<#list classList as c>
												<#if activityMember ?? && activityMember.member ?? && activityMember.member.classId ?? &&  activityMember.member.classId.id == c.id >
													<option value="${c.id}" selected >${c.className?html}</option>
												<#else>
													<option value="${c.id}">${c.className?html}</option>
												</#if>
											</#list>
										</#if>
									 </select>
								 </div>
						 	</div>			
				    		<div class="row-fluid">
						        <div class="span4">
									<span class="formTitle">姓名</span>
									<input id="member" name="member.name" class="span7" maxlength="20" <#if activityMember ?? && activityMember.member ??>value="${activityMember.member.name!""?html}"</#if> />
								</div>
							    <div class="span4">
				                    <button class="btn btn-info" type="submit" onclick="submit()">查 询</button>
				                    <button class="btn btn-info" type="button" onclick="comp.clearForm('activityMemberQuery');">清 空</button>
			                    </div>	 	
						    </div>
				         </div>
		    		</form>
	           			<input type="hidden" id="activityId" name="activityId" value="${activityId!""}" />
	           		<div class="row-fluid">
	           			<div class="span12">
	           				<h5 class="heading"></h5>
	           				<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
					            <table class="table table-bordered table-striped tablecut" id="smpl_tbl">
		           					<thead>
										<tr>
											<th width="7%">序号</th>
											<th width="11%">姓名</th>
											<th width="13%">学号</th>
											<th width="8%">性别</th>
											<th width="15%">学院</th>
											<th width="16%">专业</th>
											<th width="16%">班级</th>
											<th width="14%">联系方式</th>
										</tr>
									</thead>
	           						<tbody>
	           							<#if page??>	
											<#list page.result as p>
											<#if p.member ??>
												<tr>
											        <td class="autocut">${p_index+1}</td>
													<td class="autocut">${(p.member.name!"")?html}</td>
													<td class="autocut">${(p.member.stuNumber!"")?html}</td>
													<td class="autocut"><#if p.member.genderDic ?? >${(p.member.genderDic.name!"")?html}</#if></td>
													<td class="autocut"><#if p.member.college ??>${(p.member.college.name!"")?html}</#if></td>
													<td class="autocut"><#if p.member.major ?? >${(p.member.major.majorName!"")?html}</#if></td>
													<td class="autocut"><#if p.member.classId ??>${(p.member.classId.className!"")?html}</#if></td>
													<td class="autocut">${(p.member.phone1!"")?html}</td>
												</tr>
											</#if>
											</#list>
										 </#if> 
	           						</tbody>
								</table>
								<#assign pageTagformId="activityMemberQuery"/>
								<#include "/page.ftl">
	           				</div>
	           			</div>
	           		</div>
		    	</div> 
			</div>
		</div>
	</body>
</html>