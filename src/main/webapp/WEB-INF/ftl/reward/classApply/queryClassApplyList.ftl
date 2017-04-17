<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- ajax form-->
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
		<script type="text/javascript" src="${rc.contextPath}/js/common/cascadecommon.js"></script>
		<script>
			//查询
			function query(){
				$("#classApplyQuery").submit();
			}
			//清空
			function clearSelect(){
				//$("#awardType").find("option[text='请选择..']").attr("selected",true);
				$("#awardType option:first").attr("selected",true);
			}
			
			
			//修改
			function edit(applyId,awardId){
				$.post("${rc.contextPath}/reward/classapply/opt-query/checkClassPermission.do",{awardTypeId:awardId},function(data){
					if(data == 'true') {
						if(applyId != null && applyId != "" && applyId != "undefined") {
							window.location.href="${rc.contextPath}/reward/classapply/opt-query/editClassApply.do?classApplyId=" + applyId;
						}else{
							window.location.href="${rc.contextPath}/reward/classapply/opt-query/editClassApply.do?awardType=" + awardId;
						}
					}else{
						comp.message("对不起，该奖项申请已截止","error");
					}
				});   
			}
			//查看
			function view(id) {
				window.open("${rc.contextPath}/reward/classapply/opt-query/viewClassApplyInfo.do?id=" + id); 
			}
		</script>
		<style>
			.modal{width:320px;margin-top:-180px;margin-left:-80px}
		</style>
    </head>
    <body>
		<div id="contentwrapper">
		    <div class="main_content">  
		    	<div class="row-fluid">
		    		<form id="classApplyQuery" method="post" action="${rc.contextPath}/reward/classapply/opt-query/queryClassApplyPage.do">
		    			<div class="span12">
		    				<div class="row-fluid">
		    				    <div class="span4">
		    				    	<span class="term">学年</span>
									<select size="1" id="schoolYear" name="awardTypeId.schoolYear.id" aria-controls="dt_gal" class="span6 selectoption">
										<option value="" />请选择..</option>
										<#list schoolYearList as d>
											<#if classInfo.awardTypeId?? && classInfo.awardTypeId.schoolYear?? && classInfo.awardTypeId.schoolYear.id==d.id>
    					    	            	<option  value="${d.id}" selected="selected">${d.name?html}</option>
    					    	            <#else>
    					    	            	<option  value="${d.id}" >${d.name?html}</option>
    					    	            </#if>
										</#list>
									</select>
		    				    </div>
		    					<div class="span4">
		    				    	<span class="awardType">类型</span>
		    				    	<select size="1" id="awardType" name="awardType.code" aria-controls="dt_gal" class="span6 selectoption">
										<option value="" />请选择..</option>
										<#list awardTypeList as d>
											<#if classInfo.awardTypeId.awardType?? && classInfo.awardTypeId.awardType.code==d.code>
    					    	            	<option  value="${d.code}" selected="selected">${d.name?html}</option>
    					    	            <#else>
    					    	            	<option  value="${d.code}" >${d.name?html}</option>
    					    	            </#if>
										</#list>
									</select>
		    				    </div>
		    				    
		    				    <div class="span4">
			    					<button class="btn btn-info" onclick="query()">查 询</button>
		              				<input type="button" class="btn btn-info"  onclick="comp.clearForm('classApplyQuery')" value="清 空"/>
			    				</div>
			    			
		    				</div>
		    			</div>
		    		</form>
		    		<div class="btnCenter">
	           		</div>
	           		
	           		<div class="row-fluid">
	           			<div class="span12">
	           				<h5 class="heading"></h5>
	           				<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
	           					<div class="row">
	           						<div class="span10">
	           							<div class="dt_actions">
	           								<div class="row-fluid">
	           								</div>
	           							</div>
	           						</div>
	           					</div>
	           					<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
	           						<thead>
										<tr>
											<th width="6%">序号</th>
											<th width="10%">学年</th>
											<th width="15%">奖项名称</th>
											<th width="8%">类型</th>
											<th width="10%">班级</th>
											<th width="20%">申请起止日期</th>
											<th width="10%">申请状态</th>
											<th width="10%">审核状态</th>
											<th width="10%">操作</th>
										</tr>
								</thead>
	           						
	           						<tbody>
	           							<#if page??>	
											<#list page.result as p>
												<tr>
													<td class="autocut">${p_index+1}</td>
													<td class="autocut">${p.awardTypeId.schoolYear.name!""?html}</td>
													<td class="autocut">${(p.awardTypeId.awardInfoId.awardName!"")?html}</td>
													<td class="autocut">${(p.awardTypeId.awardType.name!"")?html}</td>
													<td class="autocut">${p.classId.className!""}</td>
													<td class="autocut">${(p.awardTypeId.beginDate?string('yyyy-MM-dd'))?html}至${(p.awardTypeId.endDate?string('yyyy-MM-dd')!"")?html}</td>
													<td class="autocut" >
														<#if p.applyStatus ??>
															${( p.applyStatus.name!"")}
														<#else>
															未申请
														</#if>
													</td>
													<td class="autocut">
														<input type="hidden" id="${p.awardTypeId.id}" value="${p.id}">
														<#if p.applyStatus ??>
															<#if p.applyStatus.name == '已提交' && p.approveStatus?? && p.processStatus != 'PASS' && p.processStatus != 'REJECT'>
																审核中		
															<#elseif p.applyStatus.name == '已提交' && p.processStatus?? && p.processStatus == 'PASS'>
																审核通过
															<#elseif p.applyStatus.name == '已提交'>	
																未审核
															<#elseif p.applyStatus.name == '已保存' &&p.processStatus?? && p.processStatus == 'REJECT'>
																审核拒绝
															<#else>
																		
															</#if>
														<#else>
																
														</#if>
													</td>
													<td class="autocut">
														<#if dateMap?? && dateMap['${p.awardTypeId.id}'] ?? && dateMap['${p.awardTypeId.id}'] == 'true'>
															<#if p.applyStatus.name == '已保存' && user_key.optMap['apply']??>
																<a href="###" onclick="edit('${p.id}','${p.awardTypeId.id}')" title="申请"><i class="icon-edit"></i></i></a>
															<#elseif p.applyStatus.name == '已提交' >
																<a href="###" onclick="view('${p.id}')" title="查看"><i class="icon-list-alt"></i></a>
															<#else>
																<a href="###" onclick="edit('${p.id}','${p.awardTypeId.id}')" title="申请"><i class="icon-edit"></i></i></a>
															</#if>
														<#else>
														
														</#if>
													</td>
												</tr>
											</#list>
										 </#if> 
	           						</tbody>
								</table>
								<#assign pageTagformId="classApplyQuery"/>
								<#include "/page.ftl">
	           				</div>
	           			</div>
	           		</div>
		    	</div> 
			</div>
		</div>
	           		
	</body>
</html>