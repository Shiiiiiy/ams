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
			//修改
			function edit(id){
				window.location.href="${rc.contextPath}/training/setadvisor/opt-edit/editAdvisorInfo.do?id=" + id;
			}
			function publish(id) {
				comp.confirm("发布之后就不能编辑和删除了，确认要发布吗？", function(result) {
					if(result) {
						$.post(
							"${rc.contextPath}/training/setadvisor/opt-save/pubAdvisorInfo.do",
							{"advisorId":id,"flag":"publish"},
							function(data) {
								window.location.href="${rc.contextPath}/training/setadvisor/opt-query/queryAdvisorPage.do";
							}
						);
					}
				});
			}
			//新增
			function add(){
				window.location.href="${rc.contextPath}/training/setadvisor/opt-edit/editAdvisorInfo.do";
			}
			//删除
			function del(id){
				comp.confirm("确定要删除数据吗？",function(r){
					if(r){
						window.location.href="${rc.contextPath}/training/setadvisor/opt-del/delAdvisorInfo.do?id=" + id;
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
		    		<form id="advisorInfoQuery" method="post" action="${rc.contextPath}/training/setadvisor/opt-query/queryAdvisorPage.do">
		    				<div class="row-fluid">
		    				    <div class="span4">
		    				    	<span class="term">学年</span>
									<select size="1" id="schoolYear" name="schoolYear.code" aria-controls="dt_gal" class="span6 selectoption" >
										<option value="" />请选择..</option>
										<#list schoolYearList as d>
											<#if advisorInfo.schoolYear?? && advisorInfo.schoolYear.code==d.code>
    					    	            	<option  value="${d.code}" selected="selected">${d.name?html}</option>
    					    	            <#else>
    					    	            	<option  value="${d.code}" >${d.name?html}</option>
    					    	            </#if>
										</#list>
									</select>
		    				    </div>
		    				    <div class="span4">
		    				    	<span class="advisorStatus">状态</span>
		    				    	<select size="1" id="advisorStatus" name="advisorStatus.code" aria-controls="dt_gal" class="span6 selectoption">
										<option value="" />请选择..</option>
										<#list statusList as d>
											<#if advisorInfo.advisorStatus?? && advisorInfo.advisorStatus.code==d.code>
    					    	            	<option  value="${d.code}" selected="selected">${d.name?html}</option>
    					    	            <#else>
    					    	            	<option  value="${d.code}" >${d.name?html}</option>
    					    	            </#if>
										</#list>
									</select>
		    				    </div>
		    				    <div class="span4">
		    				    	<span class="advisorName">导师姓名</span>
		    				    	<#if advisorInfo.outerUserInfo??>
		    				    		<input name="outerUserInfo.userName" class="span6" value="${advisorInfo.outerUserInfo.userName!""}">
		    				    	<#else>
		    				    		<input name="outerUserInfo.userName" class="span6" value="">
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
	           									<#if user_key.optMap['add']??>
					                            	<button class="btn btn-info" type="button"  onclick="add()">新 增</button>
				                            	</#if>
	           								</div>
	           							</div>
	           						</div>
	           					</div>
	           					<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
	           						<thead>
										<tr>
											<th width="6%" >序号</th>
											<th width="10%" >学年</th>
											<th width="10%" >导师姓名</th>
											<th width="15%" >编号</th>
											<th width="15%" >值班日期</th>
											<th width="20%" >值班时间段</th>
											<th width="10%" >状态</th>
											<th width="10%" >操作</th>
										</tr>
								</thead>
	           						
	           						<tbody>
	           							<#if page??>	
											<#list page.result as p>
												<tr>
													<td class="autocut" >${p_index+1}</td>
													<td class="autocut" >${p.schoolYear.name!""?html}</td>
													<td class="autocut" ><a href="#" onclick="viewUserInfo('${p.outerUserInfo.id}')"><#if p.outerUserInfo??>${(p.outerUserInfo.userName!"")?html}</#if></a></td>
													<td class="autocut" >${p.outerUserInfo.userCode!""}</td>
													<td class="autocut" >${(p.advisorDate?string('yyyy-MM-dd')!"")?html}</td>
													<td class="autocut" >${p.advisorTime!""}</td>
													<td class="autocut" >${p.advisorStatus.name!""}</td>
													<td class="autocut">
														<#if p.advisorStatus.code=='SAVED'>
															<a href="###" onclick="publish('${p.id}')" title="发布"><i class="icon-eye-open"></i></a>
														</#if>
														<#if user_key.optMap['update']?? && p.advisorStatus.code=='SAVED'>
															<a href="###" onclick="edit('${p.id}')" title="编辑"><i class="icon-edit"></i></i></a>
														</#if>
														<#if user_key.optMap['del']?? && p.advisorStatus.code=='SAVED'>	
															<a href="###" onclick="del('${p.id}')" title="删除"><i class="icon-trash"></i></a>
														</#if>
														<#if p.advisorStatus.code=='PUBLISHED'>
															<a href="###" onclick="view('${p.id}')" title="查看"><i class="icon-list-alt"></i></a>	
														</#if>
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