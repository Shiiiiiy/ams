<!DOCTYPE html>
<html lang="en">
    
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0"
        />
        <title>
            ROD Panel
        </title>
        <script src="${rc.contextPath}/lib/bootbox4/bootbox.js"></script>
        <script>
        
        	function updateApp(id,name){
        		$.ajax({
					url:"${rc.contextPath}/res/appProxy/checkCanUpdate.do",
					async:false,
					cache: false,
					type: "POST",
					data:{id:id},
					success: function(data){
						if(data.result == "success"){
							window.location.href="${rc.contextPath}/res/appProxy/opt-update/editAppProxy.do?id="+id;
						}else{
							$.sticky(name+"统一身份认证或者数据交换已启用，不可修改！", {autoclose : 5000, position: "top-right", type: "st-info" });
						}
				   },
				   error: function(){
				   		bootbox.setDefaults({locale: "zh_CN"}); 
				   		bootbox.alert("链接超时，请重新登录！");
				   },
				   dataType:"json"
				});
        	}
        
            function del(id,name) {
            	$.ajax({
						url:"${rc.contextPath}/res/appProxy/checkCanUpdate.do",
						async:false,
						cache: false,
						type: "POST",
						data:{id:id},
						success: function(data){
							if(data.result == "success"){
								bootbox.setDefaults({locale: "zh_CN"}); 
				           	 	bootbox.confirm("确认要删除\""+name+"\"应用?", function(result) {
				            	if(!result)
				            		return;
				            		window.location.href="${rc.contextPath}/res/appProxy/opt-del/delAppProxy.do?id="+id;
								}); 
							}else{
								$.sticky(name+"统一身份认证或者数据交换已启用，不可删除！", {autoclose : 5000, position: "top-right", type: "st-info" });
							}
					   },
					   error: function(){
					   		bootbox.setDefaults({locale: "zh_CN"}); 
					   		bootbox.alert("链接超时，请重新登录！");
				  		},
					   dataType:"json"
					});
           	 	
           	 	
            }
            
            function startAuth(id){
	            $.ajax({
					url:"${rc.contextPath}/res/appProxy/opt-update/startAuth.do",
					async:false,
					cache: false,
					type: "POST",
					data:{id:id},
					success: function(data){
				    	var appName = data.name;
	    				var appId = data.id;
						$.sticky(appName+"统一身份认证已启用！", {autoclose : 5000, position: "top-right", type: "st-info" });
						$("#"+appId+"_authStatus").attr("class","icon-green");
						$("#"+appId+"_authStatus").attr("title","已启用");
						$("#"+appId+"_authStatus_opt").attr("title","停用");
						$("#"+appId+"_authStatus_opt").attr("onclick","stopAuth('"+appId+"')");
						$("#"+appId+"_authStatus_opt").html("<i class=\"icon-stop\">");
				   },
				   error: function(){
				   		bootbox.setDefaults({locale: "zh_CN"}); 
				   		bootbox.alert("链接超时，请重新登录！");
				   },
				   dataType:"json"
				});
				
            	//window.location.href="${rc.contextPath}/res/appProxy/opt-update/startAuth.do?id="+id;
            }
            function stopAuth(id){
            	$.ajax({
					url:"${rc.contextPath}/res/appProxy/opt-update/stopAuth.do",
					async:false,
					cache: false,
					type: "POST",
					data:{id:id},
					success: function(data){
				    	var appName = data.name;
	    				var appId = data.id;
						$.sticky(appName+"统一身份认证已停用！", {autoclose : 5000, position: "top-right", type: "st-info" });
						$("#"+appId+"_authStatus").attr("class","icon-red");
						$("#"+appId+"_authStatus").attr("title","已停用");
						$("#"+appId+"_authStatus_opt").attr("title","启用");
						$("#"+appId+"_authStatus_opt").attr("onclick","startAuth('"+appId+"')");
						$("#"+appId+"_authStatus_opt").html("<i class=\"icon-play\">");
				   },
				   error: function(){
				   		bootbox.setDefaults({locale: "zh_CN"}); 
				   		bootbox.alert("链接超时，请重新登录！");
				   },
				   dataType:"json"
				});
				
            	//window.location.href="${rc.contextPath}/res/appProxy/opt-update/stopAuth.do?id="+id;
            }
            function startExchange(id){
            	$.ajax({
					url:"${rc.contextPath}/res/appProxy/opt-update/startExchange.do",
					async:false,
					cache: false,
					type: "POST",
					data:{id:id},
					success: function(data){
				    	var appName = data.name;
	    				var appId = data.id;
						$.sticky(appName+"数据交换已启用！", {autoclose : 5000, position: "top-right", type: "st-info" });
						$("#"+appId+"_exchangeStatus").attr("class","icon-green");
						$("#"+appId+"_exchangeStatus").attr("title","已启用");
						$("#"+appId+"_exchangeStatus_opt").attr("title","停用");
						$("#"+appId+"_exchangeStatus_opt").attr("onclick","stopExchange('"+appId+"')");
						$("#"+appId+"_exchangeStatus_opt").html("<i class=\"icon-stop\">");
				   },
				   error: function(){
				   		bootbox.setDefaults({locale: "zh_CN"}); 
				   		bootbox.alert("链接超时，请重新登录！");
				   },
				   dataType:"json"
				});
				
            	//window.location.href="${rc.contextPath}/res/appProxy/opt-update/startExchange.do?id="+id;
            }
            function stopExchange(id){
            	$.ajax({
					url:"${rc.contextPath}/res/appProxy/opt-update/stopExchange.do",
					async:false,
					cache: false,
					type: "POST",
					data:{id:id},
					success: function(data){
				    	var appName = data.name;
	    				var appId = data.id;
						$.sticky(appName+"数据交换已停用！", {autoclose : 5000, position: "top-right", type: "st-info" });
						$("#"+appId+"_exchangeStatus").attr("class","icon-red");
						$("#"+appId+"_exchangeStatus").attr("title","已停用");
						$("#"+appId+"_exchangeStatus_opt").attr("title","启用");
						$("#"+appId+"_exchangeStatus_opt").attr("onclick","startExchange('"+appId+"')");
						$("#"+appId+"_exchangeStatus_opt").html("<i class=\"icon-play\">");
				   },
				   error: function(){
				   		bootbox.setDefaults({locale: "zh_CN"}); 
				   		bootbox.alert("链接超时，请重新登录！");
				   },
				   dataType:"json"
				});
            	//window.location.href="${rc.contextPath}/res/appProxy/opt-update/stopExchange.do?id="+id;
            }
            
            function appproxyadd(){
            	window.location.href="${rc.contextPath}/res/appProxy/opt-add/editAppProxy.do";
            }
            
        </script>
    </head>
    
    <body>
    <div id="maincontainer" class="clearfix">
        <div id="contentwrapper">
            <div class="main_content">
                <div class="row-fluid">
                    <div class="row-fluid">
                        <div class="span12">
                            <div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
                                <div class="row">
                                    <div class="span6">
                                        <div class="dt_actions">
                                            <div class="btn-group">
                                                <button class="btn btn-info" type="button" onclick="appproxyadd()">
                                                  	  新 增
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <table class="table table-bordered table-striped tablecut" id="smpl_tbl">
                                    <thead>
                                        <tr>
                                            <th width="8%">
                                                	序号
                                            </th>
                                            <th >
                                               	 应用名称
                                            </th>
                                            <th>
                                             	   应用编码
                                            </th>
                                            <th  width="20%">
                                               	 url地址
                                            </th>
                                            <th>
                                               	 用户组
                                            </th>
                                            <th>
                                            	    统一身份认证
                                            </th>
                                            <th>
                                            	    数据交换
                                            </th>
                                            <th>
                                           	     操作
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <#if resourceList??>
                                            <#list resourceList as p>
                                                <tr>
                                                    <td>
                                                        ${p_index+1}
                                                    </td>
                                                    <td class="autocut">
														${p.name?html}
                                                    </td>
                                                    <td class="autocut">
														${p.code?html}
                                                    </td>
                                                    <td class="autocut">
														<a href="${p.link?html}" target="_blank">${p.link?html}</a>
                                                    </td>
                                                    <td class="autocut">
														${ugNameList[p_index]!""}
                                                    </td>
                                                    <td>
                                                        <#if p.authStatus?? && p.authStatus.code=='ENABLE'>
                                                        	<i id="${p.id}_authStatus" class="icon-green" title="已启用"> </i>
                                                        	<a id="${p.id}_authStatus_opt" href="###" title="停用" onclick="stopAuth('${p.id}')"><i class="icon-stop"> </i></a>
                                                        <#else>
                                                        	<i id="${p.id}_authStatus" class="icon-red" title="已停用"> </i>
                                                        	<a id="${p.id}_authStatus_opt" href="###" title="启用" onclick="startAuth('${p.id}')"><i class="icon-play"> </i></a>
                                                        </#if>
                                                    </td>
                                                    <td>
                                                        <#if p.exchangeStatus?? && p.exchangeStatus.code=='ENABLE'>
                                                        	<i id="${p.id}_exchangeStatus" class="icon-green" title="已启用"> </i>
                                                        	<a id="${p.id}_exchangeStatus_opt" href="###" title="停用" onclick="stopExchange('${p.id}')"><i class="icon-stop"> </i></a>
                                                        <#else>
                                                        	<i id="${p.id}_exchangeStatus" class="icon-red" title="已停用"> </i>
                                                        	<a id="${p.id}_exchangeStatus_opt" href="###" title="启用" onclick="startExchange('${p.id}')"><i class="icon-play"> </i></a>
                                                        </#if>
                                                    </td>
                                                    <td>
                                                       <a href="###" class="sepV_a" title="修改" onclick="updateApp('${p.id}','${p.name}')"><i class="icon-pencil"></i></a>
                                                        <a href="#" onclick="del('${p.id}','${p.name}')" title="删除"><i class="icon-trash"></i></a>
                                                    </td>
                                                </tr>
                                            </#list>
                                        </#if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                   </div>
                </div>
          </div>
    </body>

</html>