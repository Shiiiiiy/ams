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
				$("#stuApplyQuery").submit();
			}
			
			function clearSelect(){
				$("#awardType").val("11");
			}
			//修改
			function edit(id){
				$.post("${rc.contextPath}/reward/studentapply/opt-query/checkStuPermission.do",{awardTypeId:id},function(data){
					if(data == 'true') {
						var applyId = $("#"+id).val();
						if(applyId != null && applyId != "" && applyId != "undefined") {
							window.location.href="${rc.contextPath}/reward/studentapply/opt-query/editStuApply.do?stuApplyId=" + applyId;
						}else{
							window.location.href="${rc.contextPath}/reward/studentapply/opt-query/editStuApply.do?awardType=" + id;
						}
					}else if(data == 'APPLYED'){
						comp.message("对不起，行知奖学金一二三等奖只能申请其中一个","info");
					}else if(data == 'SANHAOSTULEADER'){
						comp.message("对不起，三好学生和优秀班干部只能申请其中一个","info");
					}else{
						comp.message("对不起，你不符合该奖项申请条件","error");
					}
				});   
			}
			//查看
			function view(id) {
				var applyId = $("#"+id).val();
				if(applyId != null && applyId != "" && applyId != "undefined"){
					window.open("${rc.contextPath}/reward/studentapply/opt-query/viewStudentApplyInfo.do?id=" + applyId); 
				}
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
		    	   <form id="stuApplyQuery" method="post" action="${rc.contextPath}/reward/studentapply/opt-query/queryStuApplyPage.do">
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
		    				    	<span class="awardType">类型</span>
		    				    	<select size="1" id="awardType" name="awardType.code" aria-controls="dt_gal" class="span6 selectoption">
										<option value="" />请选择..</option>
										<#list awardTypeList as d>
											<#if award.awardType?? && award.awardType.code==d.code>
    					    	            	<option  value="${d.code}" selected="selected">${d.name?html}</option>
    					    	            <#else>
    					    	            	<option  value="${d.code}" >${d.name?html}</option>
    					    	            </#if>
										</#list>
									</select>
		    				    </div>
			    				
			    				<div class="span4">
			    					<button class="btn btn-info" onclick="query()">查 询</button>
		              				<input type="button" class="btn btn-info"  onclick="comp.clearForm('stuApplyQuery')" value="清 空"/>
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
											<th width="12%" >学年</th>
											<th width="12%" >奖项名称</th>
											<th width="14%" >二级奖项名称</th>
											<th width="12%" >类型</th>
											<th width="18%" >申请起止日期</th>
											<th width="10%" >申请状态</th>
											<th width="10%" >审核状态</th>
											<th width="8%" >操作</th>
										</tr>
								</thead>
	           						
	           						<tbody>
	           							<#if page??>	
											<#list page.result as p>
												<tr>
													<td class="autocut" >${p_index+1}</td>
													<td class="autocut" >${p.schoolYear.name!""?html}</td>
													<td class="autocut" >${(p.awardInfoId.awardName!"")?html}</td>
													<td class="autocut" ><#if p.secondAwardName??>${(p.secondAwardName.name!"")?html}<#else></#if></td>
													<td class="autocut" >${(p.awardType.name!"")?html}</td>
													<td class="autocut" >${(p.beginDate?string('yyyy-MM-dd'))?html}至${(p.endDate?string('yyyy-MM-dd')!"")?html}</td>
													<td class="autocut" ><#if map?? && map['${p.id}'] ??>${( map['${p.id}'].applyStatus.name!"")}<#else>未申请</#if></td>
													<td class="autocut" >
														<#if map?? && map['${p.id}'] ??>
															<#if map['${p.id}'].applyStatus.name == '已提交' && map['${p.id}'].approveStatus?? && map['${p.id}'].processStatus != 'PASS' && map['${p.id}'].processStatus != 'REJECT'>
																审核中
															<#elseif map['${p.id}'].applyStatus.name == '已提交' && map['${p.id}'].processStatus?? && map['${p.id}'].processStatus == 'PASS'>
																审核通过			
															<#elseif map['${p.id}'].applyStatus.name == '已提交'>
																未审核
															<#elseif map['${p.id}'].applyStatus.name == '已保存' &&map['${p.id}'].processStatus?? && map['${p.id}'].processStatus == 'REJECT'>
																审核拒绝
															<#else>
																		
															</#if>
														<#else>
																
														</#if>
													</td>
													<td class="autocut">
														<#if dateMap?? && dateMap['${p.id}'] ?? && dateMap['${p.id}'] == 'true'>
															<#if map?? && map['${p.id}'] ??>
																<input type="hidden" id="${p.id}" value="${map['${p.id}'].id}">
															</#if>
															<#if map?? && map['${p.id}'] ?? && map['${p.id}'].applyStatus.name == '已保存' && user_key.optMap['apply']?? >
																<a href="###" onclick="edit('${p.id}')" title="申请"><i class="icon-edit"></i></i></a>
															<#elseif map?? && map['${p.id}'] ?? && map['${p.id}'].applyStatus.name == '已提交'>
																<a href="###" onclick="view('${p.id}')" title="查看"><i class="icon-list-alt"></i></a>
															<#else>
																<a href="###" onclick="edit('${p.id}')" title="申请"><i class="icon-edit"></i></i></a>
															</#if>
														<#else>
														</#if>
													</td>
												</tr>
											</#list>
										 </#if> 
	           						</tbody>
								</table>
								<#assign pageTagformId="stuApplyQuery"/>
								<#include "/page.ftl">
	           				</div>
	           			</div>
	           		</div>
		    	</div> 
			</div>
		</div>
	           		
	</body>
</html>