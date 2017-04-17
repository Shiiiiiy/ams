<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- ajax form-->
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
		<script>
			//查询
			function query(){
				$("#awardQuery").submit();
			}
			//新增
			function add(){   
				window.location.href="${rc.contextPath}/reward/awardinfo/opt-query/insertAwardInfo.do";
			}
			//修改
			function edit(id){   
				window.location.href="${rc.contextPath}/reward/awardinfo/opt-query/updateAwardInfo.do?id="+id;
			}
			//删除
			function del(id){
				comp.confirm("确定要删除数据吗？",function(r){
					if(r){
						window.location.href="${rc.contextPath}/reward/awardinfo/opt-query/delAwardInfo.do?id=" + id;
					}
				});
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
		    		<form id="awardQuery" method="post" action="${rc.contextPath}/reward/awardinfo/opt-query/queryAwardInfoPage.do">
		    			<div class="span12">
		    				<div class="row-fluid">
		    				    <div class="span4">
		    				    	<span class="term">名称</span>
		    				    	<input class="span7" id="awardName" name="awardName" value="${awardInfo.awardName!""}">
		    				    </div>
		    					<div class="span4">
		    				    	<span class="awardType">类型</span>
		    				    	<select size="1" id="awardType" name="awardType.code" aria-controls="dt_gal" class="span7 selectoption">
										<option value="" />请选择..</option>
										<#list awardDicList as d>
											<#if awardInfo.awardType?? && awardInfo.awardType.code==d.code>
    					    	            	<option  value="${d.code}" selected="selected">${d.name?html}</option>
    					    	            <#else>
    					    	            	<option  value="${d.code}" >${d.name?html}</option>
    					    	            </#if>
										</#list>
									</select>
		    				    </div>
		    				    <div class="span4">
		    				    	<span class="awardType">状态</span>
		    				    	<select size="1" id="awardStatus" name="awardStatus.code" aria-controls="dt_gal" class="span7 selectoption">
										<option value="" />请选择..</option>
										<#list statusDicList as d>
											<#if awardInfo.awardStatus?? && awardInfo.awardStatus.code==d.code>
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
											<th width="6%">序号</th>
											<th width="50%">名称</th>
											<th width="12%">类型</th>
											<th width="12%">适用对象</th>
											<th width="10%">状态</th>
											<th width="10%" >操作</th>
										</tr>
									</thead>
	           						<tbody>
	           							<#if page??>	
											<#list page.result as p>
												<tr>
													<td class="autocut">${p_index+1}</td>
													<td class="autocut">${(p.awardName!"")?html}</td>
													<td class="autocut">${p.awardType.name!""?html}</td>
													<td class="autocut">${p.availableObject.name!""?html}</td>
													<td class="autocut">${(p.awardStatus.name!"")?html}</td>
													<td class="autocut">
														<#if user_key.optMap['update']??>
															<a href="###" onclick="edit('${p.id}')" title="修改"><i class="icon-edit"></i></a>
														</#if>	
														<#if user_key.optMap['del']?? && map??&& map['${p.id}'] == 'true' && p.awardStatus.code == "DISABLE">
															<a href="###" onclick="del('${p.id}')" title="删除"><i class="icon-trash"></i></a>	
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