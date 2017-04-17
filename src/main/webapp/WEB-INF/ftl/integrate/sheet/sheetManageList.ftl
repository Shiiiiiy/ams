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
		 <form  id="sheetQuery" action="${rc.contextPath}/integrate/sheet/opt-query/sheetList.do" method="post">
			<div class="span12">			
			  <div class="row-fluid">
			         <div class="span5">
						<span class="formTitle">标题</span>
					    <input id="title" name="title" class="span7" value="${((sheet.title)!'')?html}" maxlength="225"/>
					  </div>
					<div class="span4">
						<span class="formTitle">学年</span>
						<select size="1" id="yearId" name="year.id" aria-controls="dt_gal" class="span7">
							<option value="">请选择..</option>
							<#if yearList ??>
								<#list yearList as c>
									<#if  sheet ?? && sheet.year ?? &&  sheet.year.id == c.id >
										<option  value="${c.id}" selected="selected">${c.name?html}</option>
									<#else>
										<option value="${c.id}" >${c.name?html}</option>
									</#if>
								</#list>
							</#if>
						</select>
					  </div>
					  <div class="span3">
						<button class="btn btn-info" type="submit">查 询</button>
						<button class="btn btn-info" type="button" onclick="comp.clearForm('sheetQuery')">清 空</button>
					  </div>
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
					                           <button class="btn btn-info" type="button"  id="add_button">上  报</button>
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
									<th width="45%">标题</th>
									<th width="10%">学年</th>
									<th width="12%">上报时间</th>
									<th width="10%">上报人</th>
									<th width="10%">操作</th>
								</tr>
							</thead>
							<tbody>
							<#if page??>	
								<#list page.result as p>
								<tr>
									<td>${p_index+1}</td>
									<td class="autocut">${(p.title)!''}</td>
									<td class="autocut">${(p.year.name)!''}</td>
									<td class="autocut"><#if p.uploadDate??>${(p.uploadDate!"")?string('yyyy-MM-dd')}</#if></td>
									<td class="autocut">${(p.creator.name)!''}</td>
									<td>
									<#if user_key.optMap['update']??>
									   <a href="${rc.contextPath}/integrate/sheet/opt-add/addSheet.do?id=${(p.id)!''}" class="sepV_a" title="报表信息修改"><i class="icon-edit"></i></a>
									</#if>
									<#if user_key.optMap['del']??>
									   <a href="javascript:void(0);" onclick="deleteSheet('${(p.title)!""}','${p.id!""}');" class="sepV_a" title="报表信息删除"><i class="icon-trash"></i></a>
									</#if>
									<#if user_key.optMap['formView']??>
									   <a href="${rc.contextPath}/integrate/sheet/view/viewSheet.do?id=${(p.id)!''}" class="sepV_a" title="报表信息查看"><i class="icon-list-alt"></i></a>
								    </#if>
									</td>
								</tr>
								</#list>
							 </#if>
							</tbody>
						</table>	
						 <#assign pageTagformId="sheetQuery"/>
						 <#include "/page.ftl">
					</div>
				</div>
				</div></div>
			</div> 
		</div> 
	</div>
<script>
	//上报
	$("#add_button").click(function(){
		window.location.href="${rc.contextPath}/integrate/sheet/opt-add/addSheet.do";
	});
	
	//查询
	function selectSheetInfo(){
	    $("#sheetQuery").attr("action","${rc.contextPath}/integrate/sheet/opt-query/sheetList.do");
		$("#sheetQuery").submit();
	}
	
	//删除操作
	function deleteSheet(title,id)
	{
		comp.confirm("确定要删除【"+title+"】的报表信息吗？", function(result) {
        	if(!result)
        		return;  
    		$.post("${rc.contextPath}/integrate/sheet/opt-del/delSheet.do", {id:id}, function(data){
    			if(data === "success")
    			{
    				comp.message(title +"删除成功！","info");
    				 window.location.href="${rc.contextPath}/integrate/sheet/opt-query/sheetList.do";
    			}
			    
			   },"text");
		}); 
	}
</script>

</body>
</html>