<!DOCTYPE html>
<html lang="en">
    
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <script>
            function del(id,name) {
            
            	comp.confirm("删除分类\""+name+"\"会将相关数据字典一起删除，确认要删除？", function(result) {
            	if(!result)
            		return;
            		
			  		$.post("${rc.contextPath}/sys/dicCategory/opt-del/delDicCategory.do", {
			                        id: id
			                    },
			                    function(data) {
			                        if (data == 'success') {
			                        //ajax刷新页面便于扩展
			                            window.location.href = "${rc.contextPath}/sys/dicCategory/opt-query/dicCategoryList.do";
			                        }
			                    },
			                    "text");
				});
			}
            
          	function add(){
				window.location.href="${rc.contextPath}/sys/dicCategory/opt-add/editDicCategory.do";
			}		 
        </script>
    </head>
    
    <body>
     <div id="maincontainer" class="clearfix">
        <div id="contentwrapper">
            <div class="main_content">
            <div class="row-fluid">
            
                    <div class="span12">
                    <!--
                        <h3 class="heading">
                            数据字典分类列表
                        </h3>
                       -->
                        <form id="dicCategoryQuery" action="${rc.contextPath}/sys/dicCategory/opt-query/dicCategoryList.do"
                        method="post">
                             <div class="span12">
                                <div class="row-fluid">
                                    <div class="span4">
                                        <span class="formTitle">
                                            	分类名称
                                        </span>
                                        <#if dicCategory.name??>
                                            <input id="name" name="name" class="span6" value="${dicCategory.name?html}"
                                            />
                                            <#else>
                                                <input id="name" name="name" class="span6" />
                                        </#if>
                                    </div>
                                    <div class="span4">
                                        <span class="formTitle">
                                           	 分类编码
                                        </span>
                                        <#if dicCategory.code??>
                                            <input id="code" name="code" class="span6" value="${dicCategory.code?html}"
                                            />
                                            <#else>
                                                <input id="code" name="code" class="span6" />
                                        </#if>
                                    </div>
                                    <div class="span4">
                                         <span class="formTitle">
                                           	 分类类型
                                        </span>
                                        <#if dicCategory.categoryType??>
                                            <input id="categoryType" name="categoryType" class="span6" value="${dicCategory.categoryType?html}"/>
                                        <#else>
                                            <input id="categoryType" name="categoryType" class="span6" />
                                        </#if>
                                    </div>
                                </div>
                                
                                <div class="btnCenter">
                                    <button class="btn btn-info">
                                        	查 询
                                    </button>
                                </div>
                            </div>
                        </form>
                       </div>
             <div class="row-fluid">
				<div class="span12">
				  <h5 class="heading"></h5>	
					<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
                            <div class="row">
                                <div class="span6">
                                    <div class="dt_actions">
                                        <div class="btn-group">
                                        
		                                        <#if user_key.optMap??>
														<#if user_key.optMap['add']??>
				                                           
				                                                <button class="btn btn-info" type="button" onclick="javascript:add()">
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
                                        <!-- <th class="table_checkbox"><input type="checkbox" name="select_rows" class="select_rows" data-tableid="smpl_tbl"/></th>
                                        -->
                                        <th width="8%">序号</th>
                                        <th width="25%">
                                           	 分类名称
                                        </th>
                                        <th width="25%">
                                            	分类编码
                                        </th>
                                        <th width="25%">
                                            	分类类型
                                        </th>
                                        
	                                     <#if user_key.optMap['update']?? || user_key.optMap['del']??>
	                                        <th width="20%">
	                                          	  操作
	                                        </th>
                                         </#if>
                                    </tr>
                                </thead>
                                <tbody>
                                    <#if page??>
                                        <#list page.result as p>
                                            <tr>
                                                <!-- <td><input type="checkbox" name="row_sel" class="select_row" /></td>
                                                -->
                                                <td>${p_index+1}</td>
                                                <td class="autocut">
                                                    ${p.name?html}
                                                </td>
                                                <td class="autocut">
                                                    ${p.code?html}
                                                </td>
                                                <td class="autocut">
                                                    ${p.categoryType?html}
                                                </td>
                                                
                                             	<#if user_key.optMap['update']?? || user_key.optMap['del']??>
                                                <td>
                                                
                                                <#if user_key.optMap['update']??>
                                                    <a href="${rc.contextPath}/sys/dicCategory/opt-update/editDicCategory.do?id=${p.id}"
                                                    class="sepV_a" title="修改">
                                                        <i class="icon-pencil">
                                                        </i>
                                                    </a>
                                                <#else>
												</#if>
												
												<#if user_key.optMap['del']??>
                                                    <a href="###" onclick="del('${p.id}','${p.name?html}')" title="删除">
                                                        <i class="icon-trash">
                                                        </i>
                                                    </a>
                                                <#else>
												</#if>
                                                    
                                                </td>
                                                </#if>
                                                
                                            </tr>
                                        </#list>
                                    </#if>
                                </tbody>
                            </table>
                            <#assign pageTagformId="dicCategoryQuery"/>
                            <#include "/page.ftl" > 
					</div>
				</div>
			</div> 
		</div> 
	</div>
</div>
</div>
    </body>

</html>