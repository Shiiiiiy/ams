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
    	<form  id="recruitQuery"  action="${rc.contextPath}/job/recruitment/opt-query/recruitList.do" method="post">
			<div class="row-fluid">	
				<div class="span4">
					<span class="formTitle">学年</span>
					<select size="1" id="year" class="span6" name="year.id" aria-controls="dt_gal" >
			          <option value="" >请选择</option>
						<#if yearList??>
							<#list yearList as y>
								<#if recruit?? && recruit.year?? && recruit.year.id == y.id>
									<option value="${y.id}" data-code="${y.code?html}" selected="selected">${y.name?html}</option>
								<#else>
									<option value="${y.id}" data-code="${y.code?html}" >${y.name?html}</option>
								</#if>
							</#list>
						</#if>
		         	</select>
				</div>
				 
	        	<div class="span4">
	              <input type="submit" class="btn btn-info"   value="查 询"/>
	              <input type="button" class="btn btn-info"  onclick="comp.clearForm('recruitQuery');" value="清 空"/>
	            </div>
            </div>	
		</form>
		
		<div class="row-fluid">
		<h5 class="heading"></h5>
		<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
			<table class="table table-bordered table-striped tablecut" id="smpl_tbl" >
			<thead><th width="8%">上报年度</th>
					<th width="9%">二级学院</th>
					<th width="9%">举办大型招聘会次数</th>
					<th width="9%">大型招聘会单位数量</th>
					<th width="10%">大型招聘会提供岗位数量</th>
					<th width="9%">举办小型招聘会数量</th>
					<th width="9%">小型招聘会单位数量</th>
					<th width="10%">小型招聘会提供岗位数量</th>
					<th width="9%">举办宣讲会次数</th>
					<th width="9%">宣讲会单位数量</th>
					<th width="9%">宣讲会岗位数量</th></thead>
			<tbody>
			<#assign first = 0/><#assign second = 0/><#assign three = 0/>
			<#assign four = 0/><#assign five = 0/><#assign six = 0/>
			<#assign seven = 0/><#assign eight = 0/><#assign nine = 0/>
			<#if page??>	
				<#list page.result as r>
					<#assign first = first + r.largeRecruit /><#assign second = second + r.largeRecruitDepartment /><#assign three = three + r.largeRecruitPosition />
					<#assign four = four + r.smallRecruit /><#assign five = five + r.smallRecruitDepartment /><#assign six = six + r.smallRecruitPosition />
					<#assign seven = seven + r.career /><#assign eight = eight + r.careerDepartment /><#assign nine = nine + r.careerPosition />
					<tr><td class="autocut">${(r.year.name)!""}</td>
					<td class="autocut">${(r.college.name)!""}</td>
					<td class="autocut">${(r.largeRecruit)!""}</td>
					<td class="autocut">${(r.largeRecruitDepartment)!""}</td>
					<td class="autocut">${(r.largeRecruitPosition)!""}</td>
					<td class="autocut">${(r.smallRecruit)!""}</td>
					<td class="autocut">${(r.smallRecruitDepartment)!""}</td>
					<td class="autocut">${(r.smallRecruitPosition)!""}</td>
					<td class="autocut">${(r.career)!""}</td>
					<td class="autocut">${(r.careerDepartment)!""}</td>
					<td class="autocut">${(r.careerPosition)!""}</td>
				</#list>
			</#if>	
					<tr><td class="autocut" colspan="2" style="text-align:center">总计</td>
						<td class="autocut">${first}</td>
						<td class="autocut">${second}</td>
						<td class="autocut">${three}</td>
						<td class="autocut">${four}</td>
						<td class="autocut">${five}</td>
						<td class="autocut">${six}</td>
						<td class="autocut">${seven}</td>
						<td class="autocut">${eight}</td>
						<td class="autocut">${nine}</td></tr>
			</tbody>
			</table>
			<#assign pageTagformId="recruitQuery"/>
		</div>
		</div>
		</div>
		</div>
</body>
</html>