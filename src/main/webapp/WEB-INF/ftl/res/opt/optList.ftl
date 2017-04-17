<!DOCTYPE html>
<html lang="en">
	<title>操作维护</title>
    <head>
    </head>
    <body>
        	<div id="contentwrapper">
                <div class="main_content">
                
                	<div class="row-fluid">
						<div class="span12">
							<div role="grid" class="dataTables_wrapper form-inline" id="dt_gal_wrapper">
								
								<div class="row">
									
									<#if user_key.optMap??>
										<#if user_key.optMap['add']??>
											<button class="btn btn-info" type="button" onclick="add()">新增</button>
										<#else>
										</#if>
									</#if>
									
								</div>
								<table class="table table-bordered table-striped" id="smpl_tbl">
									<thead>
										<tr>
											<th width="8%">序号</th>
											<th>名称</th>
											<th>编码</th>
											<#if user_key.optMap['update']?? || user_key.optMap['del']??>
											<th>操作</th>
											</#if>
										</tr>
									</thead>
									<tbody>
										<#if optList??>
										<#list optList as opt>
										<tr>
											<td>${opt_index + 1}</td>
											<td>${opt.name!}</td>
											<td>${opt.code!}</td>
											<#if user_key.optMap['update']?? || user_key.optMap['del']??>
											<td>
												
													<#if user_key.optMap['update']??>
														<a href="${rc.contextPath}/res/opt/opt-update/editOpt.do?id=${opt.id}" class="sepV_a" title="修改"><i class="icon-pencil"></i></a>
													<#else>
														
													</#if>
													<#if user_key.optMap['del']??>
														<a href="#" onclick="del('${opt.id}')" title="删除"><i class="icon-trash"></i></a>
													<#else>
													</#if>
												
											</td>
											</#if>
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
        <script>
        	function add() {
        		window.location.href = "${rc.contextPath}/res/opt/opt-add/editOpt.do";
        	}
            function del(id) {
            	          
            	comp.confirm("删除操作后关联菜单中的操作将不可用，确认删除此操作吗？", function(result) {
            	if(!result)
            		return;
            		
			  		 $.post("${rc.contextPath}/res/opt/opt-del/delOpt.do", {
                        id: id
                    },
                    function(data) {
                        if (data == 'success') {
                            window.location.href = "${rc.contextPath}/res/opt/opt-query/optList.do";
                        }
                    },
                    "text");
				}); 
                
            }
        </script>
	</body>
</html>