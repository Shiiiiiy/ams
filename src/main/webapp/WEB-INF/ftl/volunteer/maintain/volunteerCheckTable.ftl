<table class="table table-bordered table-striped tablecut" id="selectUserTable">
	<thead>
		<tr>
			<th class="table_checkbox" width="3%"><input type="checkbox" name="select_rows" class="select_rows" id="checkEduClassAll" onclick="checkEduClassAll(this);"/></th>
			<th  width="15%">姓名</th>
			<th  width="15%">学号</th>
			<th  width="10%">性别</th>
			<th width="20%">班级</th>
			<th width="20%">专业</th>
			<th width="15%">学院</th>
		</tr>
	</thead>
	<tbody>
	<#if page??>
		<#list page.result as v>
			<tr>
			    <td><input type="checkbox" name="row_sel_multi"  value="${(v.volunteerInfo)!""}" <#if selectedId?? && selectedId == v.id>checked="true"</#if> onclick="_onClickEduClassCheckbox(this)"/></td>
				<td class="autocut">${(v.stuInfo.name)!""}</td>
				<td class="autocut">${(v.stuInfo.stuNumber)!""}</td>
				<td class="autocut">${(v.stuInfo.genderDic.name)!""}</td>
				<td class="autocut">${(v.stuInfo.classId.className)!""}</td>
				<td class="autocut">${(v.stuInfo.major.majorName)!""}</td>
				<td class="autocut">${(v.stuInfo.college.name)!""}</td>
			</tr>
		</#list> 
	</#if>															
	</tbody>
</table>

<div class="row-fluid">
<div class="span12" style="margin-top:-19px;" id="_radioSelectUserPage">
	<div class="nextP">
                <div class="span5" style="padding-left:10px;">
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
                <div class="span7" style="padding-right:10px;height:30px; line-height:30px;"">
                    <div class="dataTables_paginate paging_bootstrap pagetion">
                        <ul>
                            
                            <li>
                            <a class="arrowh1" href="#" title="首页"  onclick="bdpPage('1','pageFormId')"></a>
                            </li>
                            
                            <#if page.currentPageNo==1>
			           		 <li><a class="arrowh21" title="上一页" href="#" ></a></li>
				           	 <#else>
				       			<li ><a class="arrowh2" href="#" title="上一页" onclick="bdpPage('${page.previousPageNo}','pageFormId')"></a></li>
				       		</#if>
                            
                             <li class="pageline"></li>
                            
                            <li style="height: 30px; line-height:30px;">
				            	<input id="gotoPageNumber" style="width:20px; padding:1px;height:18px; line-height:18px; margin-bottom: 2px;vertical-align:center; text-align: center; " value="${page.currentPageNo}"/>
				            	<input id="gotoPageFormId" type="hidden" value="pageFormId"/>
				            	<input id="gotoPageTotalPageCount" type="hidden" value="${page.totalPageCount}"/>
			           		 </li>
                            
                            <li class="disabled">
                            <a>/&nbsp${page.totalPageCount}</a>
                            </li>
                            <li class="pageline"></li>
                            
                            <#if hNext >
				       			<li ><a class="arrowh3" title="下一页"  href="#" onclick="bdpPage('${page.nextPageNo}','pageFormId')"> </a></li>
				           	<#else>
				           		<li><a class="arrowh31" title="下一页" href="#" > </a></li>
				       		</#if>
                            
                            <li >
                            <a href="#" class="arrowh4" title="尾页" onclick="bdpPage('${page.totalPageCount}','pageFormId')">
                            </a>
                            </li>
                        </ul>
                    </div>
                </div>
             </div>
      </div>
</div>
<div id="pageFormCheckDiv" name="pageFormCheckDiv" style="display:none">
</div>
<script >
$("document").ready(function(){
	var formId="${formId}";
	var fromAction= $("#"+formId).attr("action");
	var pageForm =document.createElement("FORM");
	pageForm.method="post";
	pageForm.action="${rc.contextPath}/volunteer/volunteerRadio/nsm/queryRadioVolunteer.do";
	pageForm.id="pageFormId";
	document.getElementById("pageFormCheckDiv").appendChild(pageForm);	
	
	$("#pageFormId").append($("<input name='formId' type='hidden' value='${formId!""}'/>"));
	$("#pageFormId").append($("<input name='selectedStudentId' type='hidden' value='${selectedId!""}'/>"));
	$("#pageFormId").append($("<input name='name' type='hidden' <#if volunteer??&& volunteer.stuInfo??> value='${volunteer.stuInfo.name!""}'</#if>/>"));
	$("#pageFormId").append($("<input name='college.id' type='hidden' <#if volunteer??&& volunteer.stuInfo?? >value='${volunteer.stuInfo.college.id!""}'</#if>/>"));
	$("#pageFormId").append($("<input name='major.id' type='hidden' <#if volunteer??&& volunteer.stuInfo?? >value='${volunteer.stuInfo.major.id!""}'</#if>/>"));
	$("#pageFormId").append($("<input name='classId.id' type='hidden' <#if volunteer??&& volunteer.stuInfo?? >value='${volunteer.stuInfo.classId.id}'</#if>/>"));
	$("#pageFormId").append($("<input name='stuNumber' type='hidden' <#if volunteer??&& volunteer.stuInfo?? >value='${volunteer.stuInfo.stuNumber!""}'</#if>/>"));
	$("#pageFormId").append($("<input name='queryFlag' type='hidden' value='${queryFlag!""}'/>"));
	
	$("#pageFormCheckDiv").append($("#pageFormId"));

	//用户ajaxform提交设置
		var pageFormOptions = {
            type: "POST",
            success: function(data){
             	$('input[name="row_sel_multi"]').each(function(){
			          var value=$(this).attr("value");
			          var obj=eval("["+value+"]");
			          var checkbox=$(this);
			         
					var userTree = $.fn.zTree.getZTreeObj("_selectedAllVolunteerStudent");
					var users =userTree.getNodes();
					$(users).each(function(){
						if($(this)[0].id==obj[0].id)							
						    checkbox.attr("checked",true);
					 });
			    });	
			    
			    $("#checkEduClassAll").attr("checked",
			    	$("input[name='row_sel_multi']").length == $("input[name='row_sel_multi']:checked").length
			    	&& $("input[name='row_sel_multi']").length>0? true : false);
            },            
            error: function(){
                comp.message("用户查询请求失败，请稍后重试。","error");
            },
            beforeSubmit: function(formData, jqForm, options){
            	    	            	
            },
            target: '#_studentsAllCheckTableDiv'
        };
	$("#pageFormId").ajaxForm(pageFormOptions);		
	
	$("#_radioSelectUserPage #gotoPageNumber").keypress(function(event){
	
		var maxPageNo= $("#_radioSelectUserPage #gotoPageTotalPageCount").val()*1;
		var toPageNo= $("#_radioSelectUserPage #gotoPageNumber").val()*1;
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
        		bdpPage(toPageNo,"pageFormId");
        	}
        	event.preventDefault(); //解决ie 关闭modal问题
        } 
	});
});	
	
</script>