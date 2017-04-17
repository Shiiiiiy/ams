<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<script type="text/javascript" src="${rc.contextPath}/js/common/cascadecommon.js"></script>
	<script>
		
		function addRecruit() { 
 			window.location.href="${rc.contextPath}/job/recruit/opt-add/addRecruit.do";
 		}
 		
		function deleteObj(id) {
			if(id) {
				comp.confirm("确定要删除本年度我们学院的招聘会情况吗？" , function(result) {
				if(!result)   return;
					$.ajax({
						url:'${rc.contextPath}/job/recruit/opt-del/deleteRecruit.do',
						async:false,
						cache: false,
						type: "POST",
						data:{id : id },
						success: function(data){
				 			$("#recruitQuery").submit();
				   	 	}
					});
				});		
			}
		}
	</script>
</head>
	<body>
		<div id="contentwrapper">
   		<div class="main_content">   
    	<form  id="recruitQuery"  action="${rc.contextPath}/job/recruit/opt-query/recruitList.do" method="post">
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
			<#if user_key.optMap??>
			<#if user_key.optMap['add']??>
			<div class="row">
				<div class="row-fluid">
					<button class="btn btn-info" type="button" onclick="addRecruit();">新 增</button>
				</div>
			</div>
			</#if>
			</#if>
			<table class="table table-bordered table-striped tablecut" id="smpl_tbl" >
				<thead>
				<tr>
				<th width="7%">上报年度</th>
				<th width="8%">二级学院</th>
				<th width="7%">举办大型招聘会次数</th>
				<th width="7%">大型招聘会单位数量</th>
				<th width="8%">大型招聘会提供岗位数量</th>
				<th width="7%">举办小型招聘会数量</th>
				<th width="7%">小型招聘会单位数量</th>
				<th width="8%">小型招聘会提供岗位数量</th>
				<th width="7%">举办宣讲会次数</th>
				<th width="7%">宣讲会单位数量</th>
				<th width="7%">宣讲会岗位数量</th>
				<th width="5%">操作</th>
				</tr>
				</thead>
				<tbody>
				  <#if page??>	
					<#list page.result as p>
					<tr>
					<td class="autocut">${(p.year.name)!""}</td>
					<td class="autocut">${(p.college.name)!""}</td>
					<td class="autocut">${(p.largeRecruit)!""}</td>
					<td class="autocut">${(p.largeRecruitDepartment)!""}</td>
					<td class="autocut">${(p.largeRecruitPosition)!""}</td>
					<td class="autocut">${(p.smallRecruit)!""}</td>
					<td class="autocut">${(p.smallRecruitDepartment)!""}</td>
					<td class="autocut">${(p.smallRecruitPosition)!""}</td>
					<td class="autocut">${(p.career)!""}</td>
					<td class="autocut">${(p.careerDepartment)!""}</td>
					<td class="autocut">${(p.careerPosition)!""}</td>
					<td class="autocut">
					<#if user_key.optMap??>
						<#if user_key.optMap['update']??>
						 	<a href="${rc.contextPath}/job/recruit/opt-edit/editRecruit.do?id=${p.id}" class="sepV_a" title="编辑招聘会情况"><i class="icon-edit"></i></a>
						</#if>
						<#if user_key.optMap['del']??>
							 <a href="#" onClick="deleteObj('${p.id}')" title="删除本年度的招聘会情况"><i class="icon-trash"></i></a>
						</#if>
					</#if>
					</td>
					</tr>
					</#list>
				   </#if> 
				</tbody>
			  </table>
			  <#assign pageTagformId="recruitQuery"/>
			 <#include "/page.ftl">
		</div>
		</div>
		</div>
		</div>
</body>
</html>