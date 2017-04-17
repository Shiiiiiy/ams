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
			//修改
			function edit(id){
				window.location.href="${rc.contextPath}/training/startupclass/opt-edit/editStartupClass.do?id=" + id;
			}
			//课件修改
			function editCourse(id){
				window.location.href="${rc.contextPath}/training/startupclass/opt-edit/editClassCourse.do?id=" + id;
			}
			
			//新增
			function add(){
				window.location.href="${rc.contextPath}/training/startupclass/opt-edit/editStartupClass.do";
			}
			//删除
			function del(id){
				comp.confirm("确定要删除数据吗？",function(r){
					if(r){
						window.location.href="${rc.contextPath}/training/startupclass/opt-del/delStartupClass.do?id=" + id;
					}
				})
			}
			//查看
			function view(id) {
				window.open("${rc.contextPath}/training/startupclass/opt-view/viewStartupClass.do?id=" + id);
			}
			//学生设置
			function setStu(id) {
				window.location.href="${rc.contextPath}/training/startupclass/opt-query/queryApproveStuPage.do?id=" + id;
			}
			//开班
			function startClass(id) {
				$.post("${rc.contextPath}/training/startupclass/opt-update/checkStartupClass.do?id="+id,function(data){
					if(data == '0' || data == '3'){
						comp.message("该班级没有审核通过的学生，不能开班","info");
					}else if(data == '1') {
						comp.message("该班级还有学生没有审核，不能开班","info");
					}else {
						comp.confirm("确定要开班吗？",function(r){
							if(r){
								window.location.href="${rc.contextPath}/training/startupclass/opt-update/startupClass.do?id=" + id;
							}
						})
					}
				})
			}
			//结班
			function endClass(id) {
				comp.confirm("确定要结班吗？",function(r){
					if(r){
						window.location.href="${rc.contextPath}/training/startupclass/opt-update/endupClass.do?id=" + id;
					}
				})
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
		    		<form id="classInfoQuery" method="post" action="${rc.contextPath}/training/startupclass${teacherType!""}/opt-query/queryStartupClassPage.do">
		    				<div class="row-fluid">
		    				    <div class="span4">
		    				    	<span class="term">学年</span>
									<select size="1" id="schoolYear" name="schoolYear.code" aria-controls="dt_gal" class="span6 selectoption" >
										<option value="" />请选择..</option>
										<#list schoolYearList as d>
											<#if classInfo.schoolYear?? && classInfo.schoolYear.code==d.code>
    					    	            	<option  value="${d.code}" selected="selected">${d.name?html}</option>
    					    	            <#else>
    					    	            	<option  value="${d.code}" >${d.name?html}</option>
    					    	            </#if>
										</#list>
									</select>
		    				    </div>
		    					<div class="span4">
		    				    	<span class="growthClassType">类型</span>
		    				    	<select size="1" id="growthClassType" name="growthClassType.code" aria-controls="dt_gal" class="span6 selectoption">
										<option value="" />请选择..</option>
										<#list classTypeList as d>
											<#if classInfo.growthClassType?? && classInfo.growthClassType.code==d.code>
    					    	            	<option  value="${d.code}" selected="selected">${d.name?html}</option>
    					    	            <#else>
    					    	            	<option  value="${d.code}" >${d.name?html}</option>
    					    	            </#if>
										</#list>
									</select>
		    				    </div>
		    				    <div class="span4">
		    				    	<span class="growthClassStatus">状态</span>
		    				    	<select size="1" id="growthClassStatus" name="growthClassStatus.code" aria-controls="dt_gal" class="span6 selectoption">
										<option value="" />请选择..</option>
										<#list classStatusList as d>
											<#if classInfo.growthClassStatus?? && classInfo.growthClassStatus.code==d.code>
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
			    					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
											<th width="15%" >学年</th>
											<th width="20%" >名称</th>
											<th width="8%" >类型</th>
											<th width="24%" >主题</th>
											<th width="8%" >班主任</th>
											<th width="8%" >状态</th>
											<th width="8%" >操作</th>
										</tr>
								</thead>
	           						
	           						<tbody>
	           							<#if page??>	
											<#list page.result as p>
												<tr>
													<td class="autocut" >${p_index+1}</td>
													<td class="autocut" >${p.schoolYear.name!""?html}</td>
													<td class="autocut" >${(p.growthClassName!"")?html}</td>
													<td class="autocut" >${p.growthClassType.name!""}</td>
													<td class="autocut" >${(p.growthClassTheme!"")?html}</td>
													<td class="autocut" >${p.growthClassLeader.name!""}</td>
													<td class="autocut" >${p.growthClassStatus.name!""}</td>
													<td class="autocut">
														<#if user_key.optMap['update']?? && p.growthClassStatus.code=='SAVED'>
															<a href="###" onclick="edit('${p.id}')" title="修改"><i class="icon-edit"></i></a>
														</#if>
														<#if user_key.optMap['del']?? && p.growthClassStatus.code=='SAVED'>	
															<a href="###" onclick="del('${p.id}')" title="删除"><i class="icon-trash"></i></a>
														</#if>
														<#if user_key.optMap['uploadFile']?? && startupClassInfo.growthClassLeader?? && p.growthClassStatus.code != 'CLOSED'>
															<a href="###" onclick="editCourse('${p.id}')" title="课件修改"><i class="icon-edit"></i></a>
														</#if>
														<#if teacherType=='AO' && p.growthClassStatus.code != 'SAVED' && startupClassInfo.growthClassLeader??>
															<a href="###" onclick="setStu('${p.id}')" title="学生设置"><i class="splashy-group_blue"></i></a>
														</#if>
														<#if teacherType=='HM' && startupClassInfo.growthClassLeader?? && p.growthClassStatus.name=="已提交">
															<a href="###" onclick="startClass('${p.id}')" title="开班"><i class="icon-check"></i></a>
														</#if>
														<#if teacherType=='HM' && startupClassInfo.growthClassLeader?? && p.growthClassStatus.name=="已开班">
															<a href="###" onclick="endClass('${p.id}')" title="结班"><i class="icon-ban-circle"></i></a>
														</#if>
															
														<a href="###" onclick="view('${p.id}')" title="查看"><i class="icon-list-alt"></i></a>
														
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
	    
	    <div class="modal hide fade" id="view_ClassInfo">
			<div class="modal-header">
				<button class="close" data-dismiss="modal">×</button>
				<h3 id="title1">创业班信息</h3>
			</div>
			<div class="modal-body" id="viewClassInfo">
				
			</div>
			<div class="modal-footer">
				<a href="#" class="btn" data-dismiss="modal">关闭</a>
			</div>
		</div>
	    
	           		
	</body>
</html>