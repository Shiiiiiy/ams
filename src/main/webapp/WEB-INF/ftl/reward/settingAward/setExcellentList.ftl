<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- ajax form-->
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
		<script>
			//查询
			function query(){
				$("#awardQuery").attr("action","${rc.contextPath}/reward/settingaward/opt-query/queryAwardPage.do?type="+"EXCELLENT");
				$("#awardQuery").submit();
			}
			//新增
			function add(){   
				window.location.href="${rc.contextPath}/reward/settingaward/opt-query/insertAward.do?type=" + "EXCELLENT";
			}
			//修改
			function edit(id){   
				window.location.href="${rc.contextPath}/reward/settingaward/opt-query/updateAward.do?id="+id;
			}
			//发布
			function publish(id){
				comp.confirm("确定要发布数据吗？",function(r){
					if(r){
						window.location.href="${rc.contextPath}/reward/settingaward/opt-query/publishAward.do?id="+id;
					}
				});
			}
			//删除
			function del(id){
				comp.confirm("确定要删除数据吗？",function(r){
					if(r){
						window.location.href="${rc.contextPath}/reward/settingaward/opt-query/delAward.do?id=" + id;
					}
				});
			}
			//查看
			function view(id) { 
				window.open("${rc.contextPath}/reward/settingaward/opt-query/viewAward.do?id="+id);
			}
			//设置
			function set(id) {
				window.location.href="${rc.contextPath}/reward/settingaward/opt-query/setAward.do?id=" + id;
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
		    		<form id="awardQuery" method="post" action="${rc.contextPath}/reward/settingaward/opt-query/queryAwardPage.do?type="+"EXCELLENT">
		    			<div class="span12">
		    				<div class="row-fluid">
		    				    <div class="span4">
		    				    	<span class="term">学年</span>
		    				    	<select size="1" id="schoolYear" name="schoolYear.id" aria-controls="dt_gal" class="span6 selectoption" >
										<option value="" />请选择..</option>
										<#list schoolYearList as d>
											<#if award.schoolYear?? && award.schoolYear.id==d.id>
    					    	            	<option  value="${d.id}" selected="selected">${d.name?html}</option>
    					    	            <#else>
    					    	            	<option  value="${d.id}" >${d.name?html}</option>
    					    	            </#if>
										</#list>
									</select>
		    				    </div>
								
								<div class="span4">
		    				   		<span class="awardType">评优名称</span>
		    				   		<#if award.awardInfoId ??>
		    				   			<input class="span6" id="awardName" name="awardInfoId.awardName" value="${award.awardInfoId.awardName}">
	    				   			<#else>
		    				   			<input class="span6" id="awardName" name="awardInfoId.awardName" value="">
	    				   			</#if>
		    				   </div>
    				    
		    					<div class="span4">
		    				    	<span class="awardType">状态</span>
		    				    	<select size="1" id="awardStatus" name="awardStatus.code" aria-controls="dt_gal" class="span6 selectoption">
										<option value="" />请选择..</option>
										<#list awardStatusList as d>
											<#if award.awardStatus?? && award.awardStatus.code==d.code>
    					    	            	<option  value="${d.code}" selected="selected">${d.name?html}</option>
    					    	            <#else>
    					    	            	<option  value="${d.code}" >${d.name?html}</option>
    					    	            </#if>
										</#list>
									</select>
		    				    </div>
								
		    				</div>
		    			</div>
		    		</form>
		    		<div class="btnCenter">
		              	<button class="btn btn-info" onclick="query()">查 询</button>
		              	<button class="btn btn-info" onclick="comp.clearForm('awardQuery')">清 空</button>
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
											<th width="15%" >评优名称</th>
											<th width="15%" >评优编码</th>
											<th width="15%" >申请开始日期</th>
											<th width="15%" >申请截止日期</th>
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
													<td class="autocut" >${(p.awardInfoId.awardName!"")?html}</td>
													<td class="autocut" >${p.awardTypeCode!""}</td>
													<td class="autocut" >${p.beginDate?string('yyyy-MM-dd')}</td>
													<td class="autocut" >${p.endDate?string('yyyy-MM-dd')}</td>
													<td class="autocut" >${(p.awardStatus.name!"")?html}</td>
													<td class="autocut">
														<#if p.awardStatus.name == '已保存'>
															<#if user_key.optMap['update']??>
																<a href="###" onclick="edit('${p.id}')" title="修改"><i class="icon-edit"></i></i></a>
															</#if>	
															<#if user_key.optMap['del']??>
																<a href="###" onclick="del('${p.id}')" title="删除"><i class="icon-trash"></i></a>
															</#if>
														<#-->	<a href="###" onclick="publish('${p.id}')" title="发布"><i class="icon-eye-open"></i>   <-->
														<#elseif p.awardStatus.name == '已发布'>
																<a href="###" onclick="view('${p.id}')" title="查看"><i class="icon-list-alt"></i></a>
															<#if user_key.optMap['userSetting']??>
																<a href="###" onclick="set('${p.id}')" title="设置"><i class="icon-user"></i></a>
															</#if>
														</#if>
													</td>
												</tr>
											</#list>
										 </#if> 
	           						</tbody>
								</table>
								<#assign pageTagformId="awardQuery"/>
								<#include "/page.ftl">
	           				</div>
	           			</div>
	           		</div>
		    	</div> 
			</div>
		</div>
	           		
	</body>
</html>