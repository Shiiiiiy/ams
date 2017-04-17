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
				$("#advisorInfoQuery").submit();
			}
			//预约
			function edit(id){
				comp.confirm("确定要预约吗？",function(r){
					if(r){
						window.location.href="${rc.contextPath}/training/orderadvisor/opt-save/saveAdvisorApply.do?id=" + id;
					}
				})
			}
			//取消预约
			function cancel(id){
				comp.confirm("确定要取消预约吗？",function(r){
					if(r){
						window.location.href="${rc.contextPath}/training/orderadvisor/opt-save/saveAdvisorApplyCancel.do?id=" + id;
					}
				})
			}
			//查看
			function view(id) {
				window.open("${rc.contextPath}/training/setadvisor/opt-view/viewAdvisorInfo.do?id=" + id);
			}
			//教师信息查看
			function viewUserInfo(id) {
				comp.showModal("viewUserInfo","750px","-300px 0 0 -380px"); 
				$("#userInfoView").load("${rc.contextPath}/training/setadvisor/nsm/opt-view/viewUserInfo.do?id=" + id);
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
		    		<form id="advisorInfoQuery" method="post" action="${rc.contextPath}/training/orderadvisor/opt-query/queryOrderAdvisorPage.do">
		    				<div class="row-fluid">
		    				    <div class="span4">
		    				    	<span class="term">学年</span>
									<select size="1" id="schoolYear" name="advisorInfoId.schoolYear.id" aria-controls="dt_gal" class="span6 selectoption" >
										<option value="" />请选择..</option>
										<#list schoolYearList as d>
											<#if advisorApply.advisorInfoId?? && advisorApply.advisorInfoId.schoolYear?? && advisorApply.advisorInfoId.schoolYear.id==d.id>
    					    	            	<option  value="${d.id}" selected="selected">${d.name?html}</option>
    					    	            <#else>
    					    	            	<option  value="${d.id}" >${d.name?html}</option>
    					    	            </#if>
										</#list>
									</select>
		    				    </div>
		    				    <div class="span4">
		    				    	<span class="advisorStatus">预约状态</span>
		    				    	<select size="1" id="applyStatus" name="applyStatus.id" aria-controls="dt_gal" class="span6 selectoption">
										<option value="" />请选择..</option>
										<#list applyStatusList as d>
											<#if advisorApply.applyStatus?? && advisorApply.applyStatus.id==d.id>
    					    	            	<option  value="${d.id}" selected="selected">${d.name?html}</option>
    					    	            <#else>
    					    	            	<option  value="${d.id}" >${d.name?html}</option>
    					    	            </#if>
										</#list>
									</select>
		    				    </div>
		    				    <div class="span4">
		    				    	<span class="advisorName">导师姓名</span>
		    				    	<#if advisorApply.advisorInfoId?? && advisorApply.advisorInfoId.outerUserInfo?? && advisorApply.advisorInfoId.outerUserInfo.userName??>
		    				    		<input name="advisorInfoId.outerUserInfo.userName" class="span6" value="${advisorApply.advisorInfoId.outerUserInfo.userName!""}">
		    				    	<#else>
		    				    		<input name="advisorInfoId.outerUserInfo.userName" class="span6" value="">
		    				    	</#if>	
		    				    </div>
		    				    
		    				</div>
		    			</div>
		    		</form>
		    		<div class="btnCenter">
    					<button class="btn btn-info" onclick="query()">查 询</button>
          				<input type="button" class="btn btn-info"  onclick="comp.clearForm('advisorInfoQuery')" value="清 空"/>
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
											<th width="10%">导师姓名</th>
											<th width="15%">编号</th>
											<th width="15%">值班日期</th>
											<th width="20%">值班时间段</th>
											<th width="10%">预约状态</th>
											<th width="10%">操作</th>
										</tr>
								</thead>
	           						
	           						<tbody>
	           							<#if page??>	
											<#list page.result as p>
												<tr>
													<td class="autocut" >${p_index+1}</td>
													<td class="autocut" >${p[0]!""?html}</td>
													<td class="autocut" ><a href="#" onclick="viewUserInfo('${p[2]}')">${(p[1]!"")?html}</a></td>
													<td class="autocut" >${p[3]!""}</td>
													<td class="autocut" >${(p[4]!"")?html}</td>
													<td class="autocut" >${p[5]!""}</td>
													<td class="autocut" >${p[6]!"未预约"}</td>
													<td class="autocut">
														<#if user_key.optMap['apply']?? && !p[6]?? && flag == true>
															<a href="###" onclick="edit('${p[7]}')" title="预约"><i class="icon-edit"></i></i></a>
														</#if>
														<#if p[6]?? && p[6]=='已预约'>
															<a href="###" onclick="cancel('${p[8]}')" title="取消预约"><i class="icon-ban-circle"></i></i></a>
														</#if>
														<a href="###" onclick="view('${p[7]}')" title="查看"><i class="icon-list-alt"></i></a>	
													</td>
												</tr>
											</#list>
										 </#if> 
	           						</tbody>
								</table>
								<#assign pageTagformId="advisorInfoQuery"/>
								<#include "/page.ftl">
	           				</div>
	           			</div>
	           		</div>
		    	</div> 
			</div>
		</div>
	    
	    <div class="modal hide fade" id="viewUserInfo">
			<div class="modal-header">
				<button class="close" data-dismiss="modal">×</button>
				<h3 id="title1">导师信息</h3>
			</div>
			<div class="modal-body" id="userInfoView">
				
			</div>
			<div class="modal-footer">
				<a href="#" class="btn" data-dismiss="modal">关闭</a>
			</div>
		</div>
	    
	           		
	</body>
</html>