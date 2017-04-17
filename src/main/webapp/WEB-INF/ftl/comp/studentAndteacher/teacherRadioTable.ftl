<table class="table table-bordered table-striped tablecut">
	<thead>
		<tr>
			<th width="5%">&nbsp;</th>
			<th  width="15%">姓名</th>
			<th  width="20%">工号</th>
			<th  width="15%">性别</th>
			<th width="40%">单位</th>
		</tr>
	</thead>
	<tbody>
	<#if page??> 
		<#list page.result as teacher>
			<tr>
			    <td><input type="radio" name="row_teacher_radio"  value="${(teacher.teacherInfo)!""}" onclick="_onClickTeachersRadioBox(this)" <#if teacherId ?? && teacherId == teacher.id > checked </#if> /></td>
				<td class="autocut">${(teacher.name)!""}</td>
				<td class="autocut">${(teacher.id)!""}</td>
				<td class="autocut">${(teacher.gender.name)!""}</td>
				<td class="autocut">${(teacher.org.name)!""}</td>
			</tr>
		</#list> 
	</#if>												
	</tbody>
</table>

<div class="row-fluid">
<div class="span12" style="margin-top:-19px;" id="_selectTeacherPage">
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
                            <a class="arrowh1" href="#" title="首页"  onclick="bdpPage('1','pageTeacherRadioFormId')"></a>
                            </li>
                            
                            <#if page.currentPageNo==1>
			           		 <li><a class="arrowh21" title="上一页" href="#" ></a></li>
				           	 <#else>
				       			<li ><a class="arrowh2" href="#" title="上一页" onclick="bdpPage('${page.previousPageNo}','pageTeacherRadioFormId')"></a></li>
				       		</#if>
                            
                             <li class="pageline"></li>
                            
                            <li style="height: 30px; line-height:30px;">
				            	<input id="gotoPageNumber" style="width:20px; padding:1px;height:18px; line-height:18px; margin-bottom: 2px;vertical-align:center; text-align: center; " value="${page.currentPageNo}"/>
				            	<input id="gotoPageFormId" type="hidden" value="pageTeacherRadioFormId"/>
				            	<input id="gotoPageTotalPageCount" type="hidden" value="${page.totalPageCount}"/>
			           		 </li>
                            
                            <li class="disabled">
                            <a>/&nbsp${page.totalPageCount}</a>
                            </li>
                            <li class="pageline"></li>
                            
                            <#if hNext >
				       			<li ><a class="arrowh3" title="下一页"  href="#" onclick="bdpPage('${page.nextPageNo}','pageTeacherRadioFormId')"> </a></li>
				           	<#else>
				           		<li><a class="arrowh31" title="下一页" href="#" > </a></li>
				       		</#if>
                            
                            <li >
                            <a href="#" class="arrowh4" title="尾页" onclick="bdpPage('${page.totalPageCount}','pageTeacherRadioFormId')">
                            </a>
                            </li>
                        </ul>
                    </div>
                </div>
             </div>
      </div>
</div>
<div id="pageFormTeachersRadioDiv" name="pageFormTeachersRadioDiv" style="display:none">
</div>
<script >
$("document").ready(function(){
	var formId="${formId}";
	var fromAction= $("#"+formId).attr("action");
	var pageForm =document.createElement("FORM");
	pageForm.method="post";
	pageForm.action="${rc.contextPath}/comp/studentAndteacher/nsm/queryRadioStudentAndTeacher.do";
	pageForm.id="pageTeacherRadioFormId";
	document.getElementById("pageFormTeachersRadioDiv").appendChild(pageForm);	
	
	$("#pageTeacherRadioFormId").append($("<input name='formId' type='hidden' value='${formId!""}'/>"));
	$("#pageTeacherRadioFormId").append($("<input name='teacherId' type='hidden' value='${teacherId!""}'/>"));
	$("#pageTeacherRadioFormId").append($("<input name='name' type='hidden' value='${teacher.name!""}'/>"));
	$("#pageTeacherRadioFormId").append($("<input name='org.id' type='hidden' value='${teacher.org.id!""}'/>"));
	$("#pageTeacherRadioFormId").append($("<input name='id' type='hidden' value='${teacher.id!""}'/>"));
	$("#pageTeacherRadioFormId").append($("<input name='queryType' type='hidden' value='teacher'/>"));
	
	$("#pageFormTeachersRadioDiv").append($("#pageTeacherRadioFormId"));

	//用户ajaxform提交设置
		var pageFormOptions = {
            type: "POST",
            success: function(data){
            },            
            error: function(){
                comp.message("教职工查询请求失败，请稍后重试。","error");
            },
            beforeSubmit: function(formData, jqForm, options){
            	    	            	
            },
            target: '#_studentsAllRadioTableDiv'
        };
	$("#pageTeacherRadioFormId").ajaxForm(pageFormOptions);		
	
	$("#_selectTeacherPage #gotoPageNumber").keypress(function(event){
	
		var maxPageNo= $("#_selectTeacherPage #gotoPageTotalPageCount").val()*1;
		var toPageNo= $("#_selectTeacherPage #gotoPageNumber").val()*1;
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
        		bdpPage(toPageNo,"pageTeacherRadioFormId");
        	}
        	event.preventDefault(); //解决ie 关闭modal问题
        } 
	});
});	
	
</script>