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
			<div class="row-fluid">
					<div class="span12">
						<h5 class="heading"></h5>
						<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
						<div class="row">
				            <div class="span10">
				                <div class="dt_actions">
				                    <div class="row-fluid">
				                         <#if user_key.optMap??>
											<#if user_key.optMap['add']?? >
												<#if page?? && page.result?? &&(page.result?size<1)>
					                           		 <button class="btn btn-info" type="button" id="add-button">注 册</button>
												</#if>
											</#if>
										</#if>
									</div>
								</div>
							</div>
						</div>
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
							<thead>
								<tr>
								    <th width="4%">序号</th>
									<th width="8%">姓名</th>
									<th width="8%">学号</th>
									<th width="8%">学院</th>
									<th width="10%">专业</th>
									<th width="8%">班级</th>
									<th width="10%">志愿者培训</th>
									<th width="8%">志愿者荣誉</th>
									<th width="8%">志愿者审核</th>
									<th width="10%">操作</th>
								</tr>
							</thead>
							<tbody>
							<#if page??>	
								<#list page.result as p>
								<tr>		
								    <td>${p_index+1}</td>
								    <td class="autocut"><a href="${rc.contextPath}/volunteer/view/opt-view/volunteerView.do?id=${(p.id)!''}" target="_blank" title="查看志愿者信息"> ${p.stuInfo.name!""}</a></td>											
								    <td class="autocut">${p.stuInfo.stuNumber!""}</td>
									<td class="autocut">${p.stuInfo.college.name!""}</td>
									<td class="autocut">${p.stuInfo.major.majorName!""}</td>
									<td class="autocut">${p.stuInfo.classId.className!""}</td>
									<td class="autocut"><#if p.isTraining??>${p.isTraining.name!""}</#if></td>
									<td class="autocut"><#if p.isHavehonor??>${p.isHavehonor.name!""}</#if></td>
									<td class="autocut"><#if p.approveResult??>${p.approveResult.name!""}</#if></td>
									<td class="autocut">
										<#if user_key.optMap??>
										 	<#if user_key.optMap['update']?? && ((p.status??&&p.status.code=="SAVE")||(p.approveResult??&&p.approveResult.code=="REJECT"))>
										   		<a href="${rc.contextPath}/volunteer/applyRequest/opt-apply/addVounteer.do?id=${p.id}" class="sepV_a" title="编辑志愿者申请信息"><i class="icon-edit"></i></a>
											</#if>
											<#if user_key.optMap['del']??&& p.status??&&p.status.code=="SAVE" && (!p.approveResult??)>
										   		<a href="javascript:void(0);" onclick="deleteVolunteerApply('${(p.stuInfo.name)!""}','${p.id!""}');" class="sepV_a" title="删除志愿者申请信息"><i class="icon-trash"></i></a>
											</#if> 
										</#if>
                                    </td>
								</tr>
								</#list>
							 </#if> 
							</tbody>
						</table>
						 <#assign pageTagformId="volunteerApplyForm"/>
						 <input id="pageTotalCount" name="pageTotalCount" type="hidden"  value="${page.totalCount}"/>
						 <#include "/page.ftl">
					</div>
				</div>
			</div> 
		</div> 
	</div>
</div>
<script>
	//删除操作
	function deleteVolunteerApply(name,id)
	{
		comp.confirm("确定要删除【"+name+"】的信息吗？", function(result) {
		
        	if(!result)
        		return;  
    		$.post("${rc.contextPath}/volunteer/applyRequest/opt-del/delVounteer.do", { id: id }, function(data){
    			
    			if(data === "success")
    			{
    				comp.message(name +"删除成功！","info");
    				window.location.href="${rc.contextPath}/volunteer/applyRequest/opt-query/getVolunteerApplyList.do";
    			}
			    
			   },"text");
		}); 
	}
    $(document).ready(function(){
	 	 //新增方法 
	 	$("#add-button").click( function () { 
	 		window.location.href="${rc.contextPath}/volunteer/applyRequest/opt-apply/addVounteer.do";
	 	 });
	 	
	});
</script>
</body>
</html>