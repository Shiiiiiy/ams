<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="${rc.contextPath}/lib/chosen/chosen.css" type="text/css">
		<script type="text/javascript" src="${rc.contextPath}/lib/chosen/chosen.jquery.min.js"></script>
		<script>
		
			function del(id,name){
										
					comp.confirm("删除数据字典\""+name+"\"，可能会造成系统其他业务功能无法正常使用，确认要删除？", function(result) {
	            	if(!result)
	            		return;
					   
						$.post("${rc.contextPath}/sys/dic/opt-del/delDic.do",{id:id},function(data) {
						 if(data=='success') {						    
							window.location.href="${rc.contextPath}/sys/dic/opt-query/dicList.do";
						 }
						},"text");
					});					
				}
				
		//上移
		function up(id){
		    			
			window.location.href="${rc.contextPath}/sys/dic/opt-update/up.do?id="
				+id+"&dicCategoryId="
				+$("#tempDicCategoryId").val();       
		}
        //下移
		function down(id){
			
		 	window.location.href="${rc.contextPath}/sys/dic/opt-update/down.do?id="
				+id+"&dicCategoryId="
				+$("#tempDicCategoryId").val();
        }
        
        function add(){
				window.location.href="${rc.contextPath}/sys/dic/opt-add/editDic.do?dicCategoryId=${dic.dicCategoryId!}";
			}
		function startDic(id){
	            $.ajax({
					url:"${rc.contextPath}/sys/dic/opt-update/startDic.do",
					async:false,
					cache: false,
					type: "POST",
					data:{id:id},
					success: function(data){
				    	var appName = data.name;
	    				var appId = data.id;
	    				var flag = data.flag;
	    				if(flag!=null){
							$.sticky(appName+"字典已启用！", {autoclose : 5000, position: "top-right", type: "st-info" });
								$("#"+appId+"_dicStatus").attr("class","icon-green");
								$("#"+appId+"_dicStatus").attr("title","已启用");
								$("#"+appId+"_dicStatus_opt").attr("title","停用");
								$("#"+appId+"_dicStatus_opt").attr("onclick","stopDic('"+appId+"')");
								$("#"+appId+"_dicStatus_opt").html("<i class=\"icon-stop\">");
							}else{
				   				$.sticky("字典已删除，请刷新页面后操作！", {autoclose : 5000, position: "top-right", type: "st-info" });
	    				    }
				   },
				   error: function(){
				   		bootbox.setDefaults({locale: "zh_CN"}); 
				   		bootbox.alert("链接超时，请重新登录！");
				   },
				   dataType:"json"
				});
				
            }
         function stopDic(id){
            	$.ajax({
					url:"${rc.contextPath}/sys/dic/opt-update/stopDic.do",
					async:false,
					cache: false,
					type: "POST",
					data:{id:id},
					success: function(data){
				    	var appName = data.name;
	    				var appId = data.id;
	    				var flag = data.flag;
	    				if(flag!=null){
	    					$.sticky(appName+"字典已停用！", {autoclose : 5000, position: "top-right", type: "st-info" });
							$("#"+appId+"_dicStatus").attr("class","icon-red");
							$("#"+appId+"_dicStatus").attr("title","已停用");
							$("#"+appId+"_dicStatus_opt").attr("title","启用");
							$("#"+appId+"_dicStatus_opt").attr("onclick","startDic('"+appId+"')");
							$("#"+appId+"_dicStatus_opt").html("<i class=\"icon-play\">");
	    				}else{
	    					$.sticky("字典已删除，请刷新页面后操作！", {autoclose : 5000, position: "top-right", type: "st-info" });
	    				}
						
				   },
				   error: function(){
				   		bootbox.setDefaults({locale: "zh_CN"}); 
				   		bootbox.alert("链接超时，请重新登录！");
				   },
				   dataType:"json"
				});
				
            }	
		</script>
    </head>
    <body>
<div id="contentwrapper">
    <div class="main_content">   
    <!--
    <h3 class="heading">数据字典列表</h3>
    -->
    	   <div class="row-fluid">	
    		<form  id="dicQuery"  action="${rc.contextPath}/sys/dic/opt-query/dicList.do" method="post">
				<div class="span12">			
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">字典分类</span>
							<#if dic.dicCategoryId?? >
								<input id="tempDicCategoryId" type="hidden"  value="${dic.dicCategoryId}" />
							<#else>	
								<input id="tempDicCategoryId" type="hidden"  value="" />
							</#if>
							<select size="1" id="dicCategoryId" name="dicCategoryId" aria-controls="dt_gal"  class="chzn_a"  data-placeholder=""  >
								<#if dic.dicCategoryId?? >
									<#list dicCategoryList as d>
										<#if dic.dicCategoryId==d.id >
											<option  value="${d.id}" selected="selected" />${d.name?html}</option>
										<#else>
											<option value="${d.id}" />${d.name?html}</option>
										</#if>
									</#list>
								<#else>
									<#list dicCategoryList as d>
										<option  value="${d.id}"/>${d.name?html}</option>
									</#list>
								</#if>
							</select>
						</div>
						<div class="span4">
							<span class="formTitle">字典状态</span>
							<select size="1" id="status" name="status" aria-controls="dt_gal"  class="span5">
											<option value="">请选择..</option>
											<option value="1" <#if dic.status??&&dic.status=="1">selected="selected"</#if>>启用</option>
											<option value="0" <#if  dic.status??&&dic.status=="0">selected="selected"</#if>>禁用</option>
							</select>
						</div>
						<div class="span4">
							
						</div>
					</div>
					
		            <div class="btnCenter">
		              <button class="btn btn-info">查 询</button>
		            </div>
				</div>
			</form>
    
					<div class="row-fluid">
						<div class="span12">
						<!--
							<h3 class="heading">数据字典列表</h3>
							-->
							<h5 class="heading"></h5>
							<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
					        <div class="row">
					            <div class="span6">
					                <div class="dt_actions">
					                    <div class="btn-group">
					                    
						                    <#if user_key.optMap??>
												<#if user_key.optMap['add']??>
							                       
							                            <button class="btn btn-info" type="button"  onclick="javascript:add()">
							                               		 新 增
							                            </button>
							                        
						                      	<#else>
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
										<th width="25%">字典名称</th>
										<th width="25%">字典编码</th>
										<th width="20%">字典分类</th>
										<th width="10%">字典状态</th>
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
										<td class="autocut">${p.dicCategory.name?html}</td>
										<td>
											<#if p.status?? && p.status=='1'>
                            					<i id="${p.id}_dicStatus" class="icon-green" title="已启用"> </i>
                            					<#if user_key.optMap['update']?? >
                            						<a id="${p.id}_dicStatus_opt" href="###" title="停用" onclick="stopDic('${p.id}')"><i class="icon-stop"> </i></a>
                            					</#if>
                            				<#else>
                            					<i id="${p.id}_dicStatus" class="icon-red" title="已停用"> </i>
                            					<#if user_key.optMap['update']?? >
                            						<a id="${p.id}_dicStatus_opt" href="###" title="启用" onclick="startDic('${p.id}')"><i class="icon-play"> </i></a>
                            					</#if>
                            				</#if>
										</td>
										<#if user_key.optMap['update']?? || user_key.optMap['del']??>
										<td>
										
											<#if user_key.optMap['update']??>
												<#if p.status=="1">
													<a href="#" onclick="up('${p.id}')" title="上移"><i class="icon-circle-arrow-up"></i></a>
													<a href="#" onclick="down('${p.id}')" title="下移"><i class="icon-circle-arrow-down"></i></a>
												</#if>
												<a href="#" class="sepV_a" title="修改" onclick="update('${p.id}','${p.name?html}')"><i class="icon-pencil"></i></a>
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
							 <#assign pageTagformId="dicQuery"/>
							 <#include "/page.ftl">
						</div>
				</div>
			</div> 
		</div> 
	</div>
</div>
<script>

	function update(id,name){
        		$.ajax({
					url:"${rc.contextPath}/sys/dic/opt-query/checkCanUpdate.do",
					async:false,
					cache: false,
					type: "POST",
					data:{id:id},
					success: function(data){
						if(data.result == "success"){
							window.location.href="${rc.contextPath}/sys/dic/opt-update/editDic.do?id="+id;
						}else{
							$.sticky(name+"数据字典已启用，不可修改！", {autoclose : 5000, position: "top-right", type: "st-info" });
						}
				   },
				   error: function(){
				   		bootbox.setDefaults({locale: "zh_CN"}); 
				   		bootbox.alert("链接超时，请重新登录！");
				   },
				   dataType:"json"
				});
        	}

	dicCatagory_chosen = {
		init:function(){
			$(".chzn_a").chosen({
				search_contains:true,
				no_results_text:"没有匹配的结果:"
			});
		}
	};
	dicCatagory_chosen.init();
 </script>
	</body>
</html>