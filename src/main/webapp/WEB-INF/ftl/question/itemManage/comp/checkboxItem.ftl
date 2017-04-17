
	<table class="table table-bordered table-striped tablecut" id="selectCourseTable">
		<thead>
			<tr>
				<th class="table_checkbox" width="2%"><input type="checkbox" name="select_rows" class="select_rows" id="course-checkbox-all" onclick="_checkCourseAll(this)"/></th>
				<th width="20%">题目名称</th>
				<th width="20%">题目类型</th>
				<th width="20%">问题类型</th>
				<th width="20%">是否必填</th>
				<th width="20%">创建日期</th>
			</tr>
		</thead>
		<tbody>
		<#if page??>
			<#list page.result as item>
				<tr>
				  <td><input type="checkbox" <#if itemids?? && itemids == item.id>checked</#if> name="row_sel"  value="${(item.info)!''}" onclick="_onClickCheckCoursebox(this)"/></td>
				  <td class="autocut">${(item.itemName)!""}</td>
				  <td class="autocut">${(item.itemType.name)!""}</td>
				  <td class="autocut">${(item.itemCategory.name)!""}</td>
				  <td class="autocut">${(item.required.name)!""}</td>
				  <td class="autocut">${((item.createTime)?string('yyyy-MM-dd'))!""}</td>
				</tr>
			</#list> 
		</#if>															
		</tbody>
	</table>


<div class="row-fluid">
<div class="span12" style="margin-top:-19px;"  id="_checkboxSelectUserPage">
	 <div class="nextP">
        <div class="span4" style="padding-left:5px;white-space: nowrap;">
            <div id="dt_gal_info">
            <#assign hNext=false />
           <#if page.totalCount==0>
       			 共${page.totalCount}条
	       		<#else>
	       			${(page.currentPageNo-1)*page.pageSize+1} 到
			       	<#if ((page.currentPageNo*page.pageSize)>=page.totalCount)>
			       		${page.totalCount}
			       		<#assign hNext=false />
			       	<#else>
			       		${page.currentPageNo*page.pageSize}
			       		<#assign hNext=true />
			       	</#if>
			       	条&nbsp;&nbsp;共${page.totalCount}条
	       		</#if>
                    	</div>
                </div>
                <div class="span8" style="padding-right:5px;">
                    <div class="dataTables_paginate paging_bootstrap pagetion">
                        <ul>
                            
                            <li>
                            <a class="arrowh1" href="#" title="首页"  onclick="bdpPage('1','popPageFormId')"></a>
                            </li>
                            
                            <#if page.currentPageNo==1>
			           		    <li><a class="arrowh21" title="上一页" href="#" ></a></li>
				           	<#else>
				       		    <li ><a class="arrowh2" href="#" title="上一页" onclick="bdpPage('${page.previousPageNo}','popPageFormId')"></a></li>
				       		</#if>
                            
                             <li class="pageline"></li>
                            
                            <li style="height: 30px; line-height:30px;">
	                           	第
				            	<input id="gotoCoursePageNumber" style="width:20px; padding:1px;height:18px; line-height:18px; margin-bottom: 2px;vertical-align:center; text-align: center; " value="${page.currentPageNo}"/>
				            	<input id="gotopopPageFormId" type="hidden" value="popPageFormId"/>
				            	<input id="gotoCoursePageTotalPageCount" type="hidden" value="${page.totalPageCount}"/>
	        					页
						    </li>
                            
                            <li class="disabled">
                            <a>共${page.totalPageCount}页</a>
                            </li>
                            <li class="pageline"></li>
                            
                            <#if hNext >
								<li ><a class="arrowh3" title="下一页"  href="#" onclick="bdpPage('${page.nextPageNo}','popPageFormId')"> </a></li>
							<#else>
							    <li><a class="arrowh31" title="下一页" href="#" > </a></li>
						    </#if>
                            
                            <li >
                            <a href="#" class="arrowh4" title="尾页" onclick="bdpPage('${page.totalPageCount}','popPageFormId')">
                            </a>
                            </li>
                        </ul>
                    </div>
                </div>
             </div>
    
      </div>
</div>
<div id="pageCourseFormDiv" name="pageFormDiv" style="display:none">
</div>

<script >
$("document").ready(function(){
	var formId="${formId}";
	var fromAction= $("#"+formId).attr("action");

	var pageForm =document.createElement("FORM");
	pageForm.method="post";
	pageForm.action="${rc.contextPath}/question/itemManage/comp/queryItemList.do";
	pageForm.id="popPageFormId";
	document.getElementById("pageCourseFormDiv").appendChild(pageForm);	

	
	$("#popPageFormId").append($("<input name='itemids' type='hidden' value='${(itemids)!""}'/>"));
	$("#popPageFormId").append($("<input name='paperType' type='hidden' value='${(paperType)!""}'/>"));
	$("#popPageFormId").append($("<input name='itemName' type='hidden' value='${(itemName)!""}'/>"));
	$("#popPageFormId").append($("<input name='itemTypeId' type='hidden' value='${(itemTypeId)!""}'/>"));
	$("#popPageFormId").append($("<input name='itemCategoryId' type='hidden' value='${itemCategoryId!""}'/>"));
	$("#pageCourseFormDiv").append($("#popPageFormId"));

	//用户ajaxform提交设置
		var pageFormOptions = {
            type: "POST",
            success: function(data){
            
          
            $('input[name="row_sel"]').each(function(){

	          var value=$(this).attr("value");
	          var obj=eval("["+value+"]");
	          var checkbox=$(this);
			         
				var courseTree = $.fn.zTree.getZTreeObj("selectedItem");
				var courses =courseTree.getNodes();
				$(courses).each(function(){
					if($(this)[0].Id==obj[0].Id)							
					    checkbox.attr("checked",true);
				 });
		    });	
				    $("#checkCourseAll").attr("checked",
				    	$("input[name='row_sel']").length == $("input[name='row_sel']:checked").length
				    	&& $("input[name='row_sel']").length>0? true : false);
				    
				    	
				    $('#coursesTableDiv a[rel=popover]').each(function(){
				   	 	$(this).popover({trigger:'hover',html:true});
				    });
				    
				   // .popover({selector:'a[rel=popover]',trigger:'hover',html:true});
	            },            
	            error: function(){
	                comp.message("用户查询请求失败，请稍后重试。","error");
	            },
	            beforeSubmit: function(formData, jqForm, options){
	            	    	            	
	            },
	            target: '#coursesTableDiv'
        };
        
				$("#popPageFormId").ajaxForm(pageFormOptions);	
				
				$("#_checkboxSelectUserPage #gotoCoursePageNumber").keypress(function(event){
				
					var maxPageNo= $("#_checkboxSelectUserPage #gotoCoursePageTotalPageCount").val()*1;
					var toPageNo= $("#_checkboxSelectUserPage #gotoCoursePageNumber").val()*1;
					var curKey = event.which; 
			        if(curKey == 13){
			        	var patrn=/^[0-9]{1,20}$/; 
			        	if (!patrn.exec(toPageNo)){
			        		comp.message("请输入大于0的整数","error");
			        	}else{
			        		if(toPageNo<1){
			        			comp.message("请输入大于0的整数","error");
			        			return false;
			        		}else if(toPageNo>maxPageNo){
			        			comp.message("请输入小于最大页数的整数","error");
			        			return false;
			        		}
			        		bdpPage(toPageNo,"popPageFormId");
			        	}
			        	event.preventDefault(); //解决ie 关闭modal问题
			        } 
				});
	});
</script>