<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="${rc.contextPath}/js/common/setTimeConfig.js"></script>
  </head>
<body>
<div id="contentwrapper">
    <div class="main_content">   
    	   <div class="row-fluid">	
    		<form  id="configQuery"  action="${rc.contextPath}/common/config/opt-query/listTimeConfig.do" method="post">
    		<input type="hidden" name="id" value="${configModel.id!""?html}"/>
				<div class="span12">			
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">单位学院</span>
							<select size="1" id="collegeId" name="college.id" aria-controls="dt_gal" class="span8">
								<option value="">学生处</option>
								<#list collageList as d>
									<#if configModel.college ?? && configModel.college.id ==d.id >
										<option  value="${d.id}" selected="selected">${d.name?html}</option>
									<#else>
										<option value="${d.id}" >${d.name?html}</option>
									</#if>
								</#list>
							</select>
						 </div>
						 <div class="span4">
							<span class="formTitle">名称</span>
							<input type="text" id="name" name="name" class="span8" value="${configModel.name!""}"/>
						  </div>
						<div class="span4">
							<span class="formTitle">编码</span>
							<input id="code" name="code" class="span8" value="${configModel.code!""?html}" />
						</div>
					</div>
		            <div class="btnCenter">
		              <button class="btn btn-info"  type="submit">查 询</button>
		              <button class="btn btn-info" type="button" onclick="comp.clearForm('configQuery');">清 空</button>
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
											<#if user_key.optMap['add']??>
						                         <button class="btn btn-info" type="button"  onclick="javascript:add()">新 增</button>
												 <button class="btn btn-info" type="button"  onclick="timeConfig.setTime('TEST_001');">设 置</button>
											</#if>
										</#if>
				                    </div>
				                </div>
				            </div>
				        </div>
				        	
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
							<thead>
								<tr>
									<th width="6%">序号</th>
									<th width="15%">名称</th>
									<th width="10%">编码</th>
									<th width="10%">开始日期</th>
									<th width="10%">截止日期</th>
									<th width="15%">学院单位</th>
									<th width="10%">操作</th>
								</tr>
							</thead>
							<tbody>
							<#if page??>	
								<#list page.result as p>
								<tr>
									<td>${p_index+1}</td>
									<td class="autocut">${p.name!""?html}</td>
									<td class="autocut">${p.code!""?html}</td>
									<td class="autocut">${(p.beginDate!"")?string("yyyy-MM-dd")}</td>
									<td class="autocut">${(p.endDate!"")?string("yyyy-MM-dd")}</td>
									<td class="autocut"><#if p.college ?? && p.college.id ??  >${p.college.name!""?html}<#else>学生处</#if></td>
									<td>
										 <a href="${rc.contextPath}/common/config/opt-edit/editTimeConfig.do?id=${p.id}" title="编辑"><i class="icon-edit"></i></a>
											
										  <#if user_key.optMap??>
											<#if user_key.optMap['del']??>
				                         		<a href="#" onClick="deleteObj('${p.id}')" title="删除"><i class="icon-trash"></i></a>
											</#if>
										</#if>
									</td>
								</tr>
								</#list>
							 </#if> 
							</tbody>
						</table>
						 <#assign pageTagformId="configQuery"/>
						 <#include "/page.ftl">
					</div>
				</div>
			</div> 
		</div> 
	</div>
</div>

<!--设置页面引入-->
<#include "/common/config/configPopEditDiv.ftl">
<script>
function add()
{
	window.location.href="${rc.contextPath}/common/config/opt-edit/editTimeConfig.do";
}

function deleteObj(id)
{
	if(id)
	{
		comp.confirm("删除时间设置可能会引起系统的业务不可用，确认要删除吗？" , function(result) {
    	if(!result)
    		return;
    		 $.ajax({
				url:'${rc.contextPath}/common/config/opt-delete/deleteTimeConfig.do',
				async:false,
				cache: false,
				type: "POST",
				data:{id : id },
				success: function(data){
			 		$("#configQuery").submit();
			    }
			});
		});		
	}
}

function  setConfigTimeValue(bengDate,endDate,code)
{
	alert(bengDate + " : " + endDate + " : " +code);
}

</script>
</body>
</html>