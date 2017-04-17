<div class="row-fluid">
        <div class="span12" style="margin-top:-8px;">
            <div class="nextP">
                <div class="span4" style="padding-left:10px;">
                    <div id="dt_gal_info">
                    <#assign hNext=false />
                   	<#if stuPage?? && stuPage.totalCount==0>
	       			 	共${stuPage.totalCount}条
		       		<#elseif stuPage??>
		       			${(stuPage.currentPageNo-1)*stuPage.pageSize+1} 到
				       	<#if ((stuPage.currentPageNo*stuPage.pageSize)>=stuPage.totalCount)>
				       		${stuPage.totalCount}
				       		<#assign hNext=false />
				       	<#else>
				       		${stuPage.currentPageNo*stuPage.pageSize}
				       		<#assign hNext=true />
				       	</#if>
				      	条&nbsp;&nbsp;共${stuPage.totalCount}条
	       			</#if>
                	</div>
                </div>
                <div class="span8" style="padding-right:10px; height:30px; line-height:30px;">
                    <div class="dataTables_paginate paging_bootstrap pagetion">
                        <ul>
                            
                            <li>
                            <a class="arrowh1" href="###" title="首页"  onclick="bdpPage('1','${pageTagformId}pageTagFormId','${isAjaxForm!''}')"></a>
                            </li>
                            
                            <#if stuPage?? && stuPage.currentPageNo==1>
			           		 <li><a class="arrowh21" title="上一页" href="###" ></a></li>
				           	 <#elseif stuPage??>
				       			<li ><a class="arrowh2" href="###" title="上一页" onclick="bdpPage('${stuPage.previousPageNo}','${pageTagformId}pageTagFormId','${isAjaxForm!''}')"></a></li>
				       		</#if>
                            
                             <li class="pageline"></li>
                            
                            <li style="height: 30px; line-height:30px;">
                           		 第
				            	<input id="${pageTagformId}gotoPageNumber" style="width:21px; padding:1px;height:18px; line-height:18px; margin-bottom: 3px;vertical-align:center; text-align: center; " value="${stuPage.currentPageNo}"/>
            					<input id="${pageTagformId}gotoPageTotalPageCount" type="hidden" value="${stuPage.totalPageCount}"/>
            					页
			           		 </li>
                            
                            <li class="disabled" style="height:30px; line-height:30px;">
                            <a>共${stuPage.totalPageCount}页</a>
                            </li>
                            <li class="pageline"></li>
                            
                            <#if hNext >
				       			<li ><a class="arrowh3" title="下一页"  href="###" onclick="bdpPage('${stuPage.nextPageNo}','${pageTagformId}pageTagFormId','${isAjaxForm!''}')"> </a></li>
				           	<#else>
				           		<li><a class="arrowh31" title="下一页" href="###" > </a></li>
				       		</#if>
                            
                            <li >
                            <a href="###" class="arrowh4" title="尾页" onclick="bdpPage('${stuPage.totalPageCount}','${pageTagformId}pageTagFormId','${isAjaxForm!''}')">
                            </a>
                            </li>
                        </ul>
                    </div>
                </div>
             </div>
        </div>
</div>
<div id="stuPageTagFormDiv" name="stuPageTagFormDiv" style="display:none"></div>
<script >
	var formId="${pageTagformId}";
	var fromAction= $("#"+formId).attr("action");
	var fromHtml= $("#"+formId).html();
	var isAjaxForm = "${isAjaxForm!''}";
	var pageForm =document.createElement("FORM");
	pageForm.method="post";
	pageForm.action=fromAction;
	pageForm.id="${pageTagformId}pageTagFormId";
	pageForm.innerHTML=fromHtml;
	
	document.getElementById("stuPageTagFormDiv").appendChild(pageForm);
	$(function (){
		$("#" + formId + "gotoPageNumber").keypress(function(event){
			var maxPageNo= $("#" + formId + "gotoPageTotalPageCount").val()*1;
			var toPageNo= $("#" + formId + "gotoPageNumber").val()*1;
			var curKey = event.which; 
			if(curKey == 13){ 
				var patrn=/^[0-9]{1,20}$/; 
				if (!patrn.exec(toPageNo)){
				comp.message("请输入大于0的整数","error");
			} else {
				if(toPageNo < 1){
					comp.message("请输入大于0的整数","error");
					return false;
				}else if(toPageNo > maxPageNo){
					comp.message("请输入小于最大页数的整数","error");
					return false;
				}
				bdpPage(toPageNo,formId+"pageTagFormId",'${isAjaxForm!''}');
				}
			} 
		})
	}); 
</script>

