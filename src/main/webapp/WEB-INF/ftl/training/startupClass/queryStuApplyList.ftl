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
				$("#classInfoQuery").submit();
			}
			//报名
			function edit(id, auditStatus){
				comp.confirm("确定要报名吗？",function(r){
					if(r){
						if(auditStatus == '审核拒绝'){
							window.location.href="${rc.contextPath}/training/applyclass/opt-edit/editStuApply.do?id=" + id +"&auditStatus=true";
						}else {
							window.location.href="${rc.contextPath}/training/applyclass/opt-edit/editStuApply.do?id=" + id;
						}
					}
				})
			}
			//取消报名
			function cancel(id){
				comp.confirm("确定要取消报名吗？",function(r){
					if(r){
						window.location.href="${rc.contextPath}/training/applyclass/opt-edit/cancelStuApply.do?id=" + id;
					}
				})
			}
			//查看
			function view(id) {
				window.open("${rc.contextPath}/training/startupclass/opt-view/viewStartupClass.do?id=" + id);
			}
		</script>
		<style>
		<#-->	.modal{width:320px;margin-top:-180px;margin-left:-80px}  <-->
		</style>
    </head>
    <body>
		<div id="contentwrapper">
		    <div class="main_content">  
		    	<div class="row-fluid">
		    			<div class="span12">
		    		<form id="classInfoQuery" method="post" action="${rc.contextPath}/training/applyclass/opt-query/querySubClassPage.do">
		    				<div class="row-fluid">
		    					<div class="span4">
		    				    	<span class="growthClassType">类型</span>
		    				    	<select size="1" id="growthClassType" name="growthClassType.id" aria-controls="dt_gal" class="span6 selectoption">
										<option value="" />请选择..</option>
										<#list classTypeList as d>
											<#if classInfo.growthClassType?? && classInfo.growthClassType.id==d.id>
    					    	            	<option  value="${d.id}" selected="selected">${d.name?html}</option>
    					    	            <#else>
    					    	            	<option  value="${d.id}" >${d.name?html}</option>
    					    	            </#if>
										</#list>
									</select>
		    				    </div>
		    				    
		    				    <div class="span4">
		    				    	<span class="applyStatus">报名状态</span>
		    				    	<select size="1" id="applyStatus" name="applyStatus.id" aria-controls="dt_gal" class="span6 selectoption">
										<option value="" />请选择..</option>
										<#list applyStatusList as d>
											<#if applyInfo.applyStatus?? && applyInfo.applyStatus.id==d.id>
    					    	            	<option  value="${d.id}" selected="selected">${d.name?html}</option>
    					    	            <#else>
    					    	            	<option  value="${d.id}" >${d.name?html}</option>
    					    	            </#if>
										</#list>
									</select>
		    				    </div>
		    				    
		    				    <div class="span4">
		    				    	<span class="approveStatus">审核状态</span>
		    				    	<select size="1" id="approveStatus" name="approveStatus.code" aria-controls="dt_gal" class="span6 selectoption">
										<option value="" />请选择..</option>
										<#list approveStatusList as d>
											<#if applyInfo.approveStatus?? && applyInfo.approveStatus.code==d.code>
    					    	            	<option  value="${d.code}" selected="selected">${d.name?html}</option>
    					    	            <#else>
    					    	            	<option  value="${d.code}" >${d.name?html}</option>
    					    	            </#if>
										</#list>
									</select>
		    				    </div>
		    				</div>    
		    				 <div class="row-fluid">   
		    				    <div class="span4">
		    				    	<span class="growthClassName">名称</span>
		    				    	<#if classInfo.growthClassName??>
		    				    		<input name="growthClassName" class="span6" value="${classInfo.growthClassName}">
		    				    	<#else>
		    				    		<input name="growthClassName" class="span6" value="">
		    				    	</#if>	
		    				    </div>
		    				    <div class="span4">
		    				    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    					<button class="btn btn-info" onclick="query()">查 询</button>
		              				<input type="button" class="btn btn-info"  onclick="comp.clearForm('classInfoQuery')" value="清 空"/>
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
											<th width="6%" >序号</th>
											<th width="10%" >学年</th>
											<th width="18%" >名称</th>
											<th width="8%" >类型</th>
											<th width="18%" >主题</th>
											<th width="10%" >班主任</th>
											<th width="7%" >报名状态</th>
											<th width="7%" >审核状态</th>
											<th width="7%" >班级状态</th>
											<th width="7%" >操作</th>
										</tr>
								</thead>
	           						
	           						<tbody>
	           							<#if page??>	
											<#list page.result as p>
												<tr>
													<td class="autocut" >${p_index+1}</td>
													<td class="autocut" >${p[0]!""?html}</td>
													<td class="autocut" >${(p[1]!"")?html}</td>
													<td class="autocut" >${p[2]!""}</td>
													<td class="autocut" >${(p[3]!"")?html}</td>
													<td class="autocut" >${p[4]!""}</td>
													<td class="autocut" >
														<#if p[5]??>
															${p[5]!""}
														<#else>
															未报名	
														</#if>
													</td>
													<td class="autocut" >
														<#if p[8]?? && p[8]=='已审核'>审核通过
														<#else>${p[8]!""}
														</#if>
													</td>
													<td class="autocut">
														${p[9]!""}
													</td>
													<td class="autocut">
														<#if (!p[5]?? || p[8]=='审核拒绝') && flag == true && p[9] == '已提交' && user_key.optMap['apply']??>
															<a href="###" onclick="edit('${p[6]!""}', '${p[8]!""}')" title="报名"><i class="icon-edit"></i></i></a>
														</#if>
														<#if p[5]?? && p[5]=="已报名" && p[8]=="未审核" && flag==true>
															<a href="###" onclick="cancel('${p[7]}')" title="取消报名"><i class="icon-ban-circle"></i></i></a>
														</#if>
														<a href="###" onclick="view('${p[6]}')" title="查看"><i class="icon-list-alt"></i></a>	
													</td>
												</tr>
											</#list>
										 </#if> 
	           						</tbody>
								</table>
								<#assign pageTagformId="classInfoQuery"/>
								<#include "/page.ftl">
	           				</div>
	           			</div>
	           		</div>
		    	</div> 
			</div>
		</div>
	    
	</body>
</html>