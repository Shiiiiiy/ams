<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- ajax form-->
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
		<script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
		<script>
			function query(){//查询
				$("#burseQuery").submit();
			}
			
			function del(id){//删除
				comp.confirm("确定要删除数据吗？",function(r){
					if(r){
						window.location.href="${rc.contextPath}/reward/inspireaward/opt-query/deleteInspireBurse.do?id=" + id;
					}
				});
			}
			
			function view(id) {  //查看
				window.open("${rc.contextPath}/reward/inspireaward/opt-query/viewInspireBurse.do?id="+id);
			}
			function importBurse() {
				window.location.href="${rc.contextPath}/reward/countryBurse/importInspireBurse.ftl";
			}
			
			//全选
			function allChecked(obj){
				var check = $(obj).is(":checked");
				var checkedIds = $("#checkedIds").val();
				if(check){
					$('input:checkbox[name="messageCheck"]').attr("checked", true);
					$('input:checkbox[name="messageCheck"]').each(function(){
						checkedIds = checkedIds + $(this).val() + ",";
					});
					$("#checkedIds").val(checkedIds);
					
				}else{
					$('input:checkbox').attr("checked",false);
					$("#checkedIds").val("");
				}
			}
			function selCheckId(obj){
				var check = $(obj).is(":checked");
				var checkedIds = $("#checkedIds").val();
				if(check){
					checkedIds = checkedIds + $(obj).val() + ",";
					$("#checkedIds").val(checkedIds);
				}else{
				    $('input:checkbox[name="select_rows"]').attr("checked", false);
					checkedIds = checkedIds.replace($(obj).val()+",","");
					$("#checkedIds").val(checkedIds);
				}
			}
			
			function delBurses(){
				var checkedIds = $("#checkedIds").val();
				if(checkedIds == '' || checkedIds == null || checkedIds=='null'){
					comp.message("您未选中任何条目，不能批量删除","info");
				}else{
					comp.confirm("确定要删除这几条数据吗？",function(r){
						if(r){
							window.location.href="${rc.contextPath}/reward/inspireaward/opt-query/deleteInspireBurse.do?id=" + checkedIds;
						}
					});
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
		    		<form id="burseQuery" method="post" action="${rc.contextPath}/reward/inspireaward/opt-query/queryInspireBursePage.do">
		    			<div class="span12">
		    				<div class="row-fluid">
		    					<div class="span4">
		    				    	<span class="schoolYear">学年</span>
									<select size="1" id="schoolYear" name="schoolYear.code" aria-controls="dt_gal" class="span6 selectoption" >
										<option value="" />请选择..</option>
										<#list schoolYearList as d>
											<#if burse.schoolYear?? && burse.schoolYear.code==d.code>
    					    	            	<option  value="${d.code}" selected="selected">${d.name?html}</option>
    					    	            <#else>
    					    	            	<option  value="${d.code}" >${d.name?html}</option>
    					    	            </#if>
										</#list>
									</select>
		    				    </div>
		    				    <div class="span4">
		    					    <span class="name">学院</span>
		    					    <select size="1" id="collegeId" name="stuId.college.id" aria-controls="dt_gal" class="span6 selectoption" onchange="cascade.changeCollage('collegeId','majorId','classId');">
										<option value="" />请选择..</option>
										<#list academyList as d>
											<#if burse.stuId?? && burse.stuId.college.id==d.id>
    					    	            	<option  value="${d.id}" selected="selected">${d.name?html}</option>
    					    	            <#else>
    					    	            	<option  value="${d.id}" >${d.name?html}</option>
    					    	            </#if>
										</#list>
									</select>
		    				    </div>
		    				    <div class="span4">
		    				    	<span class="majorName">专业</span>
									<select size="1" id="majorId" name="stuId.major.id" aria-controls="dt_gal" class="span6 selectoption emptySelect" onchange="cascade.changeMajor('majorId','classId');">
										<option value="" />请选择..</option>
										<#if majorList??>
											<#list majorList as d>
												<#if burse.stuId?? && burse.stuId.major.id==d.id>
	    					    	            	<option  value="${d.id}" selected="selected">${d.majorName?html}</option>
	    					    	            <#else>
	    					    	            	<option  value="${d.id}" >${d.majorName?html}</option>
	    					    	            </#if>
											</#list>
										</#if>
									</select>
		    				    </div>
		    				</div>
		    				
		    				
		    				<div class="row-fluid">
		    				    <div class="span4">
		    				    	<span class="className">班级</span>
									<select size="1" id="classId" name="stuId.classId.id" aria-controls="dt_gal" class="span6 selectoption emptySelect" >
										<option value="" />请选择..</option>
										<#if classList??>
											<#list classList as d>
												<#if burse.stuId?? && burse.stuId.classId.id==d.id>
	    					    	            	<option  value="${d.id}" selected="selected">${d.className?html}</option>
	    					    	            <#else>
	    					    	            	<option  value="${d.id}" >${d.className?html}</option>
	    					    	            </#if>
											</#list>
										</#if>
									</select>
		    				    </div>
		    				    <div class="span4">
		    				    	<span class="major">姓名</span>
		    				    	<#if burse.stuId ??>
										<input id="stuId.name" class="span6" value="${burse.stuId.name!""}" name="stuId.name">
									<#else>
										<input id="stuId.name" class="span6" value="" name="stuId.name">
									</#if>										
		    				    </div>
		    				    <div class="span4">
		    				    	<span class="major">学号</span>
		    				    	<#if burse.stuId ??>
										<input id="stuId.stuNumber" class="span6" value="${burse.stuId.stuNumber!""}" name="stuId.stuNumber">
									<#else>
										<input id="stuId.stuNumber" class="span6" value="" name="stuId.stuNumber">
									</#if>										
		    				    </div>
		    				</div>
		    			</div>
		    		</form>
		    		<div class="btnCenter">
		              	<button class="btn btn-info" onclick="query()">查 询</button>
		              	<button class="btn btn-info" onclick="comp.clearForm('burseQuery')">清 空</button>
	           		</div>
	           		
	           		<div class="row-fluid">
	           			<div class="span12">
	           				<h5 class="heading"></h5>
	           				<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
	           					<div class="row">
	           						<div class="span10">
	           							<div class="dt_actions">
	           								<div class="row-fluid">
	           									<#if user_key.optMap['import']??>
					                            	<button class="btn btn-info" type="button" onclick="importBurse()">导 入</button>
					                            </#if>
					                            <#if user_key.optMap['del']??>	
													<button class="btn btn-info" type="button" onclick="delBurses()">批量删除</button>
												</#if>	
	           								</div>
	           							</div>
	           						</div>
	           					</div>
	           					<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
	           						<thead>
										<tr>
											<th width="4%" class="table_checkbox"><input type="checkbox" name="select_rows" class="select_row" onclick="allChecked(this)"/></th>
											<th width="10%" >姓名</th>
											<th width="10%" >学号</th>
											<th width="10%" >学年</th>
											<th width="15%" >学院</th>
											<th width="15%" >专业</th>
											<th width="10%" >班级</th>
											<th width="20%" >身份证号</th>
											<th width="10%" >操作</th>
										</tr>
								</thead>
	           							<#-- 选中的数据项ID -->
	           						        <input type="hidden" id="checkedIds" name="checkedIds" value="">
	           						
	           						<tbody>
	           							<#if page??>	
											<#list page.result as p>
												<tr>
													<td>
													<input type="checkbox" name="messageCheck" class="select_row" value="${p.id}" onclick="selCheckId(this)"/>
													</td>
													<td class="autocut" >${p.stuId.name!""?html}</td>
													<td class="autocut" >${(p.stuId.stuNumber!"")?html}</td>
													<td class="autocut" >${(p.schoolYear.name!"")?html}</td>
													<td class="autocut" >${(p.stuId.college.name!"")?html}</td>
													<td class="autocut" >${(p.stuId.major.majorName!"")?html}</td>
													<td class="autocut" >${p.stuId.classId.className!""?html}</td>
													<td class="autocut" >${p.stuId.certificateCode!""?html}</td>
													<td class="autocut">
													<#if user_key.optMap['del']??>
														<a href="###" onclick="del('${p.id}')" title="删除"><i class="icon-trash"></i></a>
														<a href="###" onclick="view('${p.id}')" title="查看"><i class="icon-list-alt"></i></a>
													<#else>
														<a href="###" onclick="view('${p.id}')" title="查看"><i class="icon-list-alt"></i></a>
													</#if>
													</td>
												</tr>
											</#list>
										 </#if> 
	           						</tbody>
								</table>
								<#assign pageTagformId="burseQuery"/>
								<#include "/page.ftl">
	           				</div>
	           			</div>
	           		</div>
		    	</div> 
			</div>
		</div>
		<#--弹出框-->
		</div>
		
		
	           		
	           		
	</body>
</html>