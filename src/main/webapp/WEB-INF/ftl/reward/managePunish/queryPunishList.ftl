<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- ajax form-->
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
		<script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
		<script>
		   <!--显示提示框-->
			$(function(){
				$('.tipTag').poshytip({
					className: 'tip-yellowsimple',
					alignTo: 'target',
					alignX: 'right',
					alignY: 'center',
					offsetX: 5
				});
			});
			
			function query(){//查询
				$("#punishQuery").attr("action","${rc.contextPath}/reward/managepunish/opt-query/queryPunishPage.do");
				$("#punishQuery").submit();
			}
			
			
			function add(){   //新增
				window.location.href="${rc.contextPath}/reward/managepunish/opt-query/addPunish.do";
			}
			
			function edit(id){   //修改
				window.location.href="${rc.contextPath}/reward/managepunish/opt-query/editPunish.do?id="+id;
			}
			
			function del(id){//删除
				comp.confirm("确定要删除数据吗？",function(r){
					if(r){
						window.location.href="${rc.contextPath}/reward/managepunish/opt-query/deletePunish.do?id=" + id;
					}
				});
			}
			
			//全选
			function allChecked(obj){
				var check = $(obj).is(":checked");
				var checkedIds = $("#checkedIds").val();
				if(check){
					$('input:checkbox').attr("checked","checked");
					$('input:checkbox').each(function(){
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
					checkedIds = checkedIds.replace($(obj).val()+",","");
					$("#checkedIds").val(checkedIds);
				}
			}
			
			function delPunish(){
				var checkedIds = $("#checkedIds").val();
				if(checkedIds == '' || checkedIds == null || checkedIds=='null'){
					comp.message("您未选中任何条目，不能批量删除","info");
				}else{
					comp.confirm("确定要删除这几条数据吗？",function(r){
						if(r){
							window.location.href="${rc.contextPath}/reward/managepunish/opt-query/delMorePunish.do?id=" + checkedIds;
						}
					});
				}
			}
			
			
			function view(id) {  //查看
				window.open("${rc.contextPath}/reward/managepunish/opt-query/viewPunish.do?id="+id);
			}
			
			function viewInfo(id) {  //查看
				//window.location.href="${rc.contextPath}/reward/querypunish/opt-query/viewPunishInfo.do?id="+id;
				window.open("${rc.contextPath}/reward/querypunish/opt-query/viewPunishInfo.do?id="+id);
			}
			
			function importPunish() {
				window.location.href="${rc.contextPath}/reward/managepunish/importPunish.ftl";
			}
			
			function exportPunish(){
				var pageTotalCount= $("#pageTotalCount").val();
				var exportSize= $("#exportSize").val();
				var patrn=/^[0-9]{1,20}$/; 
				if(exportSize==""){
					comp.message("请输入大于0的正整数","error");
				}else if(!patrn.exec(exportSize)){
					comp.message("请输入大于0的正整数","error");
				}else if(exportSize<1){
					comp.message("请输入大于0的正整数","error");
				}else if(exportSize>10000){
					comp.message("请输入小于10000的正整数","error");
				}else{
					comp.showModal("exportPunish","500px","-250px 0 0 -250px");
					$("#export_Punish").load("${rc.contextPath}/reward/managepunish/opt-query/nsm/exportPunishList.do?pageTotalCount="+pageTotalCount+"&exportSize="+exportSize);
				}
			}
			
			function exportPunishData(exportSize,exportPage){
				$("#punishQuery").attr("action","${rc.contextPath}/reward/managepunish/opt-query/exportPunish.do");
				var fo=$("#punishQuery");
				if($("#punishQuery_exportPage").length==0){
					fo.append($("<input>",{
						id:'punishQuery_exportSize',
						type:'hidden',
						name:'punishQuery_exportSize',
						val:exportSize
					}));
					fo.append($("<input>",{
						id:'punishQuery_exportPage',
						type:'hidden',
						name:'punishQuery_exportPage',
						val:exportPage
					}));
				}else{
					$("#punishQuery_exportSize").val(exportSize);
					$("#punishQuery_exportPage").val(exportPage);
				}
				fo.submit();
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
			    		<form id="punishQuery" method="post" action="${rc.contextPath}/reward/managepunish/opt-query/queryPunishPage.do">
		    			<div class="span12">
		    				<div class="row-fluid">
		    					<div class="span4">
		    				    	<span class="schoolYear">学年</span>
									<select size="1" id="punishYear" name="punishYear.code" aria-controls="dt_gal" class="span6 selectoption" >
										<option value="" />请选择..</option>
										<#list schoolYearList as d>
											<#if punishInfo.punishYear?? && punishInfo.punishYear.code==d.code>
    					    	            	<option  value="${d.code}" selected="selected">${d.name?html}</option>
    					    	            <#else>
    					    	            	<option  value="${d.code}" >${d.name?html}</option>
    					    	            </#if>
										</#list>
									</select>
		    				    </div>
		    				    <div class="span4">
		    				    	<span class="term">学期</span>
									<select size="1" id="punishTerm" name="punishTerm.code" aria-controls="dt_gal" class="span6 selectoption">
										<option value="" />请选择..</option>
										<#list schoolTermList as d>
											<#if punishInfo.punishTerm?? && punishInfo.punishTerm.code==d.code>
    					    	            	<option  value="${d.code}" selected="selected">${d.name?html}</option>
    					    	            <#else>
    					    	            	<option  value="${d.code}" >${d.name?html}</option>
    					    	            </#if>
										</#list>
									</select>
		    				    </div>
		    				    <div class="span4">
		    					    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="name">学院</span>
		    					    <select size="1" id="collegeId" name="stuId.college.id" aria-controls="dt_gal" class="span6 selectoption" onchange="cascade.changeCollage('collegeId','majorId','classId');">
										<option value="" />请选择..</option>
										<#list academyList as d>
											<#if punishInfo.stuId?? && punishInfo.stuId.college??&& punishInfo.stuId.college.id==d.id>
    					    	            	<option  value="${d.id}" selected="selected">${d.name?html}</option>
    					    	            <#else>
    					    	            	<option  value="${d.id}" >${d.name?html}</option>
    					    	            </#if>
										</#list>
									</select>
		    				    </div>
		    				</div>
		    				
		    				
		    				<div class="row-fluid">
		    					<div class="span4">
		    				    	<span class="majorName">专业</span>
									<select size="1" id="majorId" name="stuId.major.id" aria-controls="dt_gal" class="span6 selectoption emptySelect" onchange="cascade.changeMajor('majorId','classId');">
										<option value="" />请选择..</option>
										<#if majorList??>
											<#list majorList as d>
												<#if punishInfo.stuId?? && punishInfo.stuId.major??&& punishInfo.stuId.major.id==d.id>
	    					    	            	<option  value="${d.id}" selected="selected">${d.majorName?html}</option>
	    					    	            <#else>
	    					    	            	<option  value="${d.id}" >${d.majorName?html}</option>
	    					    	            </#if>
											</#list>
										</#if>
									</select>
		    				    </div>
		    				    <div class="span4">
		    				    	<span class="className">班级</span>
									<select size="1" id="classId" name="stuId.classId.id" aria-controls="dt_gal" class="span6 selectoption emptySelect" >
										<option value="" />请选择..</option>
										<#if classList??>
											<#list classList as d>
												<#if punishInfo.stuId?? && punishInfo.stuId.classId??&& punishInfo.stuId.classId.id==d.id>
	    					    	            	<option  value="${d.id}" selected="selected">${d.className?html}</option>
	    					    	            <#else>
	    					    	            	<option  value="${d.id}" >${d.className?html}</option>
	    					    	            </#if>
											</#list>
										</#if>
									</select>
		    				    </div>
		    				    <div class="span4">
		    				    	<span class="major">处分名称</span>
		    				    	<select size="1" id="punish" name="punish.code" aria-controls="dt_gal" class="span6 selectoption" >
										<option value="" />请选择..</option>
										<#list punishCodeList as d>
											<#if punishInfo.punish?? && punishInfo.punish.code==d.code>
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
		    				    	<span class="major">姓名</span>
		    				    	<#if punishInfo.stuId ??>
										<input id="stuId.name" class="span6" value="${punishInfo.stuId.name!""}" name="stuId.name">
									<#else>
										<input id="stuId.name" class="span6" value="" name="stuId.name">
									</#if>										
		    				    </div>
		    				    <div class="span4">
		    				    	<span class="major">学号</span>
		    				    	<#if punishInfo.stuId ??>
										<input id="stuId.stuNumber" class="span6" value="${punishInfo.stuId.stuNumber!""}" name="stuId.stuNumber">
									<#else>
										<input id="stuId.stuNumber" class="span6" value="" name="stuId.stuNumber">
									</#if>										
		    				    </div>
		    				    <div class="span4">
		    				    	<span class="punishNum">处分文号</span>
		    				    	<#if punishInfo.punishNum ??>
										<input id="punishNum" class="span6" value="${punishInfo.punishNum!""}" name="punishNum">
									<#else>
										<input id="punishNum" class="span6" value="" name="punishNum">
									</#if>										
		    				    </div>
		    				</div>
		    			</div>
		    		</form>
		    		<div class="btnCenter">
		              	<button class="btn btn-info" onclick="query()">查 询</button>
		              	<button class="btn btn-info" onclick="comp.clearForm('punishQuery')">清 空</button>
	           		</div>
	           		
	           		<div class="row-fluid">
	           			<div class="span12">
	           				<h5 class="heading"></h5>
	           				<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
	           					<div class="row">
	           						<div class="span10">
	           							<div class="dt_actions">
	           								<div class="row-fluid">
	           								<#if queryInfo??>
	           								<#else>
	           									<#if user_key.optMap['add']??>
					                            	<button class="btn btn-info" type="button"  onclick="add()">新 增</button>
					                            </#if>	
		           								<#if user_key.optMap['import']??>
						                            <button class="btn btn-info" type="button" onclick="importPunish()">导 入</button>
						                        </#if>
						                        <#if user_key.optMap['export']??>    
						                            <div class="input-append">
														<input id="exportSize" type="hidden" name="exportSize" class="span3" value="1000" title="excel单页条数" />
														<button class="btn btn-info" type="button" onclick="exportPunish()">导 出</button>
													</div>
												</#if>
												<#if user_key.optMap['del']??>	
													<button class="btn btn-info" type="button" onclick="delPunish()">批量删除</button>
												</#if>	
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
											<th width="12%" >学号</th>
											<th width="12%" >学年</th>
											<th width="12%" >学期</th>
											<#--
											<th width="10%" >学院</th>
											<th width="10%" >专业</th>
											<th width="10%" >班级</th>-->
											<th width="20%" >处分名称</th>
											<th width="20%" >处分文号</th>
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
													<input type="checkbox" name="select_rows" class="select_row" value="${p.id}" onclick="selCheckId(this)"/>
													</td>
													<td class="autocut tipTag" data="学院：${(p.stuId.college.name!'')?html}<br/>专业：${(p.stuId.major.majorName!'')?html}<br/>班级：${p.stuId.classId.className!''?html}<br/>">${p.stuId.name!""?html}</td>
													<td class="autocut" >${(p.stuId.stuNumber!"")?html}</td>
													<td class="autocut" >${(p.punishYear.name!"")?html}</td>
													<td class="autocut" >${(p.punishTerm.name!"")?html}</td>
													<#--
													<td class="autocut" >${(p.stuId.college.name!"")?html}</td>
													<td class="autocut" >${(p.stuId.major.majorName!"")?html}</td>
													<td class="autocut" >${p.stuId.classId.className!""?html}</td>-->
													<td class="autocut" >${p.punish.name!""?html}</td>
													<td class="autocut" >${p.punishNum!""?html}</td>
													<td class="autocut">
														<#if queryInfo??>
															<a href="###" onclick="viewInfo('${p.id}')" title="查看"><i class="icon-list-alt"></i></a>
														<#else>
															<#if user_key.optMap['update']??>
																<a href="###" onclick="edit('${p.id}')" title="修改"><i class="icon-edit"></i></a>
															</#if>
															<#if user_key.optMap['del']??>
																<a href="###" onclick="del('${p.id}')" title="删除"><i class="icon-trash"></i></a>
															</#if>
															<a href="###" onclick="view('${p.id}')" title="查看"><i class="icon-list-alt"></i></a>
														</#if>
													</td>
												</tr>
											</#list>
										 </#if> 
	           						</tbody>
								</table>
								<#assign pageTagformId="punishQuery"/>
								<#include "/page.ftl">
								<!--用于用户导出 -->
								<input id="pageTotalCount" name="pageTotalCount" type="hidden"  value="${page.totalCount}"/>
	           				</div>
	           			</div>
	           		</div>
		    	</div> 
			</div>
		</div>
		<#--弹出框-->
   		<div class="modal hide fade" id="myModal1">
			<div class="modal-header">
				<button class="close" data-dismiss="modal">×</button>
				<h3 id="title">提示</h3>
			</div>
			<div class="modal-body">
				<p id="message"></p>
			</div>
			<div class="modal-footer" style="text-align:center">
				<a href="#" class="btn"  data-dismiss="modal">确定</a>
			</div>
		</div>
		
		<div class="modal hide fade" id="exportPunish">
			<div class="modal-header">
				<button class="close" data-dismiss="modal">×</button>
				<h3 id="title1">导出处分信息</h3>
			</div>
			<div class="modal-body" id="export_Punish">
				
			</div>
			<div class="modal-footer">
				<a href="#" class="btn" data-dismiss="modal">关闭</a>
			</div>
		</div>
		</div>
		
		
	           		
	           		
	</body>
</html>