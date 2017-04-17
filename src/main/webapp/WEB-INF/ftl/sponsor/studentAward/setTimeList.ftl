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
	     <div class="span12">
	      <h3 class="heading">
			       困难生奖助时间设置
		    </h3>
		     </div>
				<div class="row-fluid">
					<div class="span12">
						<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl" style="width:95%">
							<thead>
								<tr>
									<th width="6%">序号</th>
									<th width="30%">名称</th>
									<th width="10%">开始日期</th>
									<th width="10%">截止日期</th>
									<th width="6%">操作</th>
								</tr>
							</thead>
							<tbody>
							<#if timeConfigList??>	
								<#list timeConfigList as p>
								<tr>
									<td>${p_index+1}</td>
									<td class="autocut">${p.name!""?html}</td>
									<td class="autocut" id="${p.code}_begin">${(p.beginDate!"")?string("yyyy-MM-dd")}</td>
									<td class="autocut" id="${p.code}_end">${(p.endDate!"")?string("yyyy-MM-dd")}</td>
									<td>
									<a href="###"  onclick="timeConfig.setTime('${(p.code!"")?html}')" title="编辑"><i class="icon-time "></i></a>
									</td>
								</tr>
								</#list>
							 </#if> 
							</tbody>
						</table>
						 <#assign pageTagformId="configQuery"/>
					</div>
				</div>
			</div> 
		</div> 
	</div>
</div>

<!--设置页面引入-->
<#include "/common/config/configPopEditDiv.ftl">
<script>

function  setConfigTimeValue(bengDate,endDate,code)
{
	$("#"+code+"_begin").html(bengDate);
	$("#"+code+"_end").html(endDate);
}

</script>
</body>
</html>