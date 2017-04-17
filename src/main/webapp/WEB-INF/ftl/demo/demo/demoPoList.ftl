<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- ajax form-->
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
		<script>
		
			function del(id,name){
										
					comp.confirm("删除演示demoPo数据\""+name+"\"，可能会造成系统其他业务功能无法正常使用，确认要删除？", function(result) {
	            	if(!result)
	            		return;
					   
						$.post("${rc.contextPath}/demo/demo/opt-del/delDemoPo.do",{id:id},function(data) {
						 if(data=='success') {						    
							window.location.href="${rc.contextPath}/demo/demo/opt-query/demoPoList.do";
						 }
						},"text");
					});					
				}
        
        function add(){
				window.location.href="${rc.contextPath}/demo/demo/opt-add/editDemoPo.do";
			}
			
		function selectUser(){
			_initValues("ENABLE");
			_queryUserSubmit();		
			comp.showModal("_selectUserModal");
		}
		function cleanUser(){
			$("#_userName").val("");
			$("#_userId").val("");
		}
		
		function importDemo(){
			window.location.href="${rc.contextPath}/demo/demo/importDemo.ftl";
		}
		
		function exportDemo(){
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
				comp.showModal("exportdemo","500px","-250px 0 0 -250px");
				$("#export_demo").load("${rc.contextPath}/demo/demo/opt-query/nsm/exportDemoList.do?pageTotalCount="+pageTotalCount+"&exportSize="+exportSize);
			}
		}
		
		function exportDate(exportSize,exportPage){
			$("#demoPoQuery").attr("action","${rc.contextPath}/demo/demo/opt-query/exportDemo.do");
			var fo=$("#demoPoQuery");
			if($("#demoPoQuery_exportPage").length==0){
				fo.append($("<input>",{
					id:'demoPoQuery_exportSize',
					type:'hidden',
					name:'demoPoQuery_exportSize',
					val:exportSize
				}));
				fo.append($("<input>",{
					id:'demoPoQuery_exportPage',
					type:'hidden',
					name:'demoPoQuery_exportPage',
					val:exportPage
				}));
			}else{
				$("#demoPoQuery_exportSize").val(exportSize);
				$("#demoPoQuery_exportPage").val(exportPage);
			}
			fo.submit();
		}
		
	function demoQuery(){
		$("#demoPoQuery").attr("action","${rc.contextPath}/demo/demo/opt-query/demoPoList.do");
		$("#demoPoQuery").submit();
	}
	function viewIcon() {
		location.href="${rc.contextPath}/demo/demo/opt-query/viewIcon.do";
	}
		</script>
    </head>
    <body>
<div id="contentwrapper">
    <div class="main_content">   
    <!--
    <h3 class="heading">演示DemoPo列表</h3>
    -->
    	   <div class="row-fluid">	
    		<form  id="demoPoQuery"  action="${rc.contextPath}/demo/demo/opt-query/demoPoList.do" method="post">
				<div class="span12">			
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名称	</span>
							<#if demoPo.name??>
							    <input id="name" name="name" class="span6" value="${demoPo.name?html}"
							    />
							    <#else>
								<input id="name" name="name" class="span6" />
							</#if>
						 </div>
						 <div class="span4">
							<span class="formTitle">
								 编码
							</span>
							<#if demoPo.code??>
							    <input id="code" name="code" class="span6" value="${demoPo.code?html}"
							    />
							    <#else>
								<input id="code" name="code" class="span6" />
							</#if>
						  </div>
						<div class="span4">
							<span class="formTitle">性别</span>
							<#if demoPo.genderId?? >
								<input id="tempGenderId" type="hidden"  value="${demoPo.genderId}" />
							<#else>	
								<input id="tempGenderId" type="hidden"  value="" />
							</#if>
							<select size="1" id="genderId" name="genderId" aria-controls="dt_gal" class="span5" >
								<option value="" />请选择..</option>
								<#if demoPo.genderId?? >
									<#list genderDicList as d>
										<#if demoPo.genderId==d.id >
											<option  value="${d.id}" selected="selected" />${d.name?html}</option>
										<#else>
											<option value="${d.id}" />${d.name?html}</option>
										</#if>
									</#list>
								<#else>
									<#list genderDicList as d>
										<option  value="${d.id}"/>${d.name?html}</option>
									</#list>
								</#if>
							</select>
						</div>
						<div class="row-fluid">
							<div class="span4">
								<span class="formTitle">用户名称</span>								
								<input id="_userName" name="userName" class="span6" value="${(userName!"")?html}" readonly/>
								<input id="_userId" name="userId" type="hidden" value="${(userId!"")?html}"/> 
								 
								<a style="cursor:pointer" onclick="selectUser()">选择</a>&nbsp;							
								<a style="cursor:pointer" onclick="cleanUser()">清除</a>
							 </div>
						 </div>
					</div>
					
		            <div class="btnCenter">
		              <button class="btn btn-info"  onclick="demoQuery()">查 询</button>
		            </div>
		
				</div>
			</form>
    
					<div class="row-fluid">
						<div class="span12">
						
							<h5 class="heading"></h5>
							<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
					        <div class="row">
					            <div class="span10">
					                <div class="dt_actions">
					                    <div class="row-fluid">
					                    
						                    <#if user_key.optMap??>
												<#if user_key.optMap['add']??>
							                       
							                            <button class="btn btn-info" type="button"  onclick="javascript:add()">
							                               		 新 增
							                            </button>
												</#if>
												<button class="btn btn-info" type="button" onclick="viewIcon()">查看图标</button>
												<#if user_key.optMap['import']??>
				            					&nbsp;&nbsp;<button class="btn btn-info" type="button" onclick="importDemo()">Excel导入</button>
				              					</#if>
				              					<#if user_key.optMap['export']??>
					              					<div class="input-append">
					            					&nbsp;&nbsp;<input id="exportSize" name="exportSize" class="span3"  value="1000" title="excel单页条数" />
					            					&nbsp;&nbsp;<button class="btn btn-info" type="button" onclick="exportDemo()">Excel导出</button>
					              					</div>
				              					</#if>												
											</#if>	
															                       
					                    </div>
					                </div>
					            </div>
					        </div>
					        
							<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
								<thead>
									<tr>
									<!--
										<th class="table_checkbox"><input type="checkbox" name="select_rows" class="select_rows" data-tableid="smpl_tbl"/></th>
										-->
										<th width="8%">序号</th>
										<th width="25%">名称</th>
										<th width="25%">编码</th>
										<th width="20%">性别</th>
										
										<#if user_key.optMap['update']?? || user_key.optMap['del']??>
										<th width="15%">操作</th>
										</#if>
									</tr>
								</thead>
								<tbody>
								<#if page??>	
									<#list page.result as p>
									<tr>
									<!--
										<td><input type="checkbox" name="row_sel" class="select_row" /></td>
										-->
										<td>${p_index+1}</td>
										<td class="autocut">${p.name?html}</td>
										<td class="autocut">${p.code?html}</td>
										<td class="autocut">${p.gender.name?html}</td>
										
										<#if user_key.optMap['update']?? || user_key.optMap['del']??>
										<td>
										
											<#if user_key.optMap['update']??>												
												<a href="${rc.contextPath}/demo/demo/opt-update/editDemoPo.do?id=${p.id}" class="sepV_a" title="修改"><i class="icon-pencil"></i></a>
											<#else>
											</#if>											
											<#if user_key.optMap['del']??>
												<a href="###" onclick="del('${p.id}','${p.name?html}')" title="删除"><i class="icon-trash"></i></a>
											<#else>
											</#if>
											
										</td>
										</#if>
									</tr>
									</#list>
								 </#if> 
								</tbody>
							</table>
							 <#assign pageTagformId="demoPoQuery"/>
							 <!--用于用户导出 -->
						<input id="pageTotalCount" name="pageTotalCount" type="hidden"  value="${page.totalCount}"/>
							 <#include "/page.ftl">
						</div>
				</div>
			</div> 
		</div> 
	</div>
</div>

<div class="modal hide fade" id="exportdemo">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3 id="title1">导出demo</h3>
	</div>
	<div class="modal-body" id="export_demo">
		
	</div>
	<div class="modal-footer">
		<a href="#" class="btn" data-dismiss="modal">关闭</a>
	</div>
</div>

 <#include "/user/comp/queryUserRadioModal.ftl">
	</body>
</html>