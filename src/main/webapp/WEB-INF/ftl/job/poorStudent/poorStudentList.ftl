<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <script type="text/javascript" src="${rc.contextPath}/js/common/cascadecommon.js"></script>
        <!-- multiselect -->
	    <link rel="stylesheet" href="${rc.contextPath}/lib/multiselect/css/multi-select.css" />
		<script src="${rc.contextPath}/lib/multiselect/js/jquery.multi-select.min.js"></script>
		<script src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script>	
        <!-- ajax form-->
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
    </head>
    <body>
	  <div id="contentwrapper">
   		<div class="main_content">   
    	   <div class="row-fluid">	
    		<form  id="poorStudentQuery"  action="${rc.contextPath}/job/poorStudent/opt-query/queryPoorStudentInfoList.do" method="post">
				<div class="span12">			
				   <div class="row-fluid">
			         <div class="span4">
						<span class="formTitle">姓名</span>
					    <input id="student.name" name="difficultStudentInfo.student.name" class="span6" <#if poorStudent.difficultStudentInfo?? && poorStudent.difficultStudentInfo.student??> value="${((poorStudent.difficultStudentInfo.student.name)!'')?html}"</#if> maxlength="225"/>
					  </div>
						 
					 <div class="span4">
						<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学号</span>
						<input id="student.stuNumber" name="difficultStudentInfo.student.stuNumber" class="span6" value="${((poorStudent.difficultStudentInfo.student.stuNumber)!'')?html}" maxlength="225"/>
					 </div>
					 <div class="span4">
						  <span class="formTitle">学年</span>
						    <select size="1" id="schoolYear" class="span6" name="difficultStudentInfo.schoolYear.id" aria-controls="dt_gal" >
					          <option value="" />请选择..</option>
								<#if yearList??>
									<#list yearList as d>
										<#if poorStudent.difficultStudentInfo?? && poorStudent.difficultStudentInfo.student?? && poorStudent.difficultStudentInfo.student.schoolYear ?? && poorStudent.difficultStudentInfo.student.schoolYear.id==d.id >
											<option  value="${d.id}" selected="selected" />${d.name?html}</option>
										<#elseif yearDic?? && yearDic.id==d.id>
										    <option  value="${d.id}" selected="selected" />${d.name?html}</option>
										<#else>    
											<option value="${d.id}" />${d.name?html}</option>
										</#if>
									</#list>
								 </#if>
				         	</select>
						 </div>
						</div>
						
				   <div class="row-fluid"> 
					 <div class="span4">
					   <span class="formTitle">学院</span>
						<select size="1" <#if collegeStatus?? && collegeStatus=="false">disabled</#if> id="college" name="strCollege.id" aria-controls="dt_gal" class="span6" onChange="cascade.changeCollage('college','majorId');">
							<option value="" >请选择..</option>
							<#if collegeList??>
								<#list collegeList as c>
									<#if poorStudent?? && poorStudent.strCollege?? && c.id==poorStudent.strCollege.id>
										<option value="${c.id}" selected="selected">${c.name?html}</option>
									<#elseif college?? && college.id==c.id>
									    <option value="${c.id}" selected="selected">${c.name?html}</option>
									 <#else>   
										<option value="${c.id}">${c.name?html}</option>
									</#if>
								</#list>
							</#if>
						</select>
					</div>
					<div class="span4">
						<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;专业</span>
						<select size="1" id="majorId" name="strMajor.id" aria-controls="dt_gal" class="span6 emptySelect" onChange="cascade.changeMajor('majorId','classId');">
							<option value="" >请选择..</option>
							<#if majorList ?? >
								<#list majorList as m>
									<#if poorStudent?? && poorStudent.strMajor?? &&  poorStudent.strMajor.id == m.id >
										<option value="${m.id}" selected >${m.majorName}</option>
									<#else>
										<option value="${m.id}">${m.majorName}</option>
									</#if>
								</#list>
							</#if>
						</select>
					</div>
				
					<div class="span4">
						<span class="formTitle">班级</span>
						<select size="1" id="classId" name="strClassId.id" aria-controls="dt_gal" class="span6 emptySelect" >
							<option value="" >请选择..</option>
							<#if classList ?? >
								<#list classList as c>
									<#if poorStudent?? && poorStudent.strClassId?? && poorStudent.strClassId.id == c.id >
										<option value="${c.id}" selected >${c.className}</option>
									<#else>
										<option value="${c.id}">${c.className}</option>
									</#if>
								</#list>
							</#if>
						</select>
					</div>
				</div>
				
				<div class="row-fluid">
				  <div class="span4">
					  <span class="formTitle">状态</span>
					    <select size="1" id="status" class="span6" name="status.id" aria-controls="dt_gal" >
				          <option value="" />请选择..</option>
							<#if statusList??>
								<#list statusList as d>
									<#if poorStudent.status?? && poorStudent.status.id ?? && poorStudent.status.id==d.id >
										<option  value="${d.id}" selected="selected" />${d.name?html}</option>
									<#else>
										<option value="${d.id}" />${d.name?html}</option>
									</#if>
								</#list>
							 </#if>
			         	 </select>
					   </div>
					   
				   <div class="span4">
					<span class="formTitle">困难类别</span>
					 <select size="1" class="span6" name="difficultType.id" aria-controls="dt_gal" >
	    			  <option value="" />请选择..</option>
						<#if difficultTypeList??>
							<#list difficultTypeList as d>
								<#if poorStudent?? && poorStudent.difficultType?? && poorStudent.difficultType.id==d.id >
									<option  value="${d.id}" selected="selected" />${d.name?html}</option>
								<#else>
									<option value="${d.id}" />${d.name?html}</option>
								</#if>
							</#list>
						 </#if>
					   </select>
					</div>
					<div class="span4">	
					  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				      <input type="button" class="btn btn-info"  onclick="selectStudentInfo();" value="查 询"/>
                      <input type="button" class="btn btn-info"  onclick="comp.clearForm('poorStudentQuery')" value="清 空"/>
			      </div>
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
					                            <button class="btn btn-info" type="button" id="add-button">
					                                                                                新 增
					                            </button>
											</#if>
										</#if>
										<button class="btn btn-info" type="button" id="postMessage-button">
				                   		                  批量申请
				                        </button>
				                        
				                    </div>
				                </div>
				            </div>
				        </div>
				        
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
							<thead>
								<tr>
									<th width="3%"><input id="_totalSelect" type="checkbox"/></th>
									<th width="8%">姓名</th>
									<th width="10%">学号</th>
									<th width="10%">学院</th>
									<th width="14%">专业</th>
									<th width="15%">班级</th>
									<th width="10%">学年</th>
									<th width="15%">困难类别</th>
									<th width="8%">状态</th>
									<th width="8%">操作</th>
								</tr>
							</thead>
							<tbody>
								<#if page??>	
									<#list page.result as p>
									  <#if p.studentInfo??>
									    <#assign student = p.studentInfo/>
									  <#else>  
									    <#assign student = p.difficultStudentInfo.student/>
									  </#if> 
										<tr>
											<#if p.status??>
											<td></td>
											<#else>
											<td><input id="${p_index+1}" name="messageCheck" value="${p.difficultId}" type="checkbox" class="tt"/></td>
											</#if>
											</td>
											<#if p.status??>
											     <td class="autocut tipTag" data="学院：${(student.college.name)!''}<br/>专业：${(student.major.majorName)!''}<br/>班级：${(student.classId.className)!''}<br/>"><a target="_blank" href="${rc.contextPath}/job/approvePoorStudent/opt-view/viewPoorStudent.do?id=${(p.pId)!''}" title="查看双困生信息">${(student.name)!""}</td>
											<#else>
											     <td class="autocut tipTag" data="学院：${(student.college.name)!''}<br/>专业：${(student.major.majorName)!''}<br/>班级：${(student.classId.className)!''}<br/>">${(student.name)!""}</td>
											</#if>
											<td class="autocut">${(student.stuNumber)!""}</td>
											<td class="autocut">${(student.college.name)!""}</td>
											<td class="autocut">${(student.major.majorName)!""}</td>
											<td class="autocut">${(student.classId.className)!""}</td>
											<td class="autocut">${(p.schoolYear.name)!""}</td>
											<td class="autocut">${(p.difficultType.name)!""}</td>
											<td class="autocut">${(p.status.name)!""}</td>
											<td>
											<#if user_key.optMap['update']??>
											   <#if p.status?? && (p.status.code="SUBMIT" || p.status.code="PASS" || p.status.code="UNPASS")>
											   <#else>
											   <a href="${rc.contextPath}/job/poorStudent/opt-add/editPoorStudentInfo.do?id=${(p.pId)!''}&&difficultId=${(p.difficultStudentInfo.id)!''}" class="sepV_a" title="双困生申请"><i class="icon-edit"></i></a>
											   </#if>
											</#if>
											<#if user_key.optMap['del']??>
											   <#if p.status?? && p.status.code="SAVE">
											   <a href="javascript:void(0);" onclick="deleteStudentInfo('${(student.name)!""}','${p.pId!""}');" class="sepV_a" title="删除双困生申请信息"><i class="icon-trash"></i></a>
											   </#if>
											</#if>   
											</td>
										</tr>
									</#list>
								 </#if> 
							</tbody>
						</table>
						 <#assign pageTagformId="poorStudentQuery"/>
						 <#include "/page.ftl">
					</div>
				</div>
			</div> 
		</div> 
	</div>
</div>

<div class="modal hide fade" id="_showModel">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3 id="title1">申请双困生</h3>
	</div>
	<div class="modal-body" style="max-height:520px">
		<#include "applyPoorStudent.ftl">
	</div>
	<div class="modal-footer">
		<a href="#" class="btn" data-dismiss="modal">取 消</a>
		<a href="#" class="btn btn-info" id="sure" onclick="postMessage()">确 定</a>
	</div>
</div>



<#-- 脚本开始 -->
<script>
	var _messageId = "";
	$(document).ready(function(){
	 	//新增方法 
	 	$("#add-button").click( function () { 
	 		window.location.href="${rc.contextPath}/job/poorStudent/opt-add/addPoorStudent.do";
	 	 });
	 	
	});
	
	//查询
	function selectStudentInfo(){
	    $("#poorStudentQuery").attr("action","${rc.contextPath}/job/poorStudent/opt-query/queryPoorStudentInfoList.do");
		$("#poorStudentQuery").submit();
	}
	
	
	//删除操作
	function deleteStudentInfo(name,id)
	{
		comp.confirm("确定要删除【"+name+"】的双困生申请信息吗？", function(result) {
        	if(!result)
        		return;  
    		$.post("${rc.contextPath}/job/poorStudent/opt-del/deletePoorStudent.do", {id:id}, function(data){
    			if(data === "success")
    			{
    				comp.message(name +"删除成功！","info");
    				 window.location.href="${rc.contextPath}/job/poorStudent/opt-query/queryPoorStudentInfoList.do";
    			}
			    
			   },"text");
		}); 
	}
	
	
	
	
	
	
			//全选复选框
			jQuery("#_totalSelect").click(function(){
				if($("#_totalSelect").attr("checked")) {
					$("input[name='messageCheck']").attr("checked",true);
				}else {
					$("input[name='messageCheck']").attr("checked",false);
				}	
			});
			
			jQuery("input[name='messageCheck']").click(function() {
				$("#_totalSelect").attr("checked",false);
			});
			
			//批量发布按钮
			jQuery("#postMessage-button").click(function() {
				var ids="";
				$(".tt").each(function() {
					if($(this).attr("checked"))
						ids =  $(this).val()+","+ids
				});
				_messageId = ids;
				if(ids=="" || ids==",") {
					comp.message("请选择要批量申请的学生！","error");
					return;
				}
				comp.showModal("_showModel");
			});
	
	
	var attachFlag;
	$("document").ready(function(){
	   	$("#hideReason").hide();
		//页面校验
		attachFlag = $(".form_validation_reg").compValidate({
			rules:{     
					'isJobDifficult.id': {required:true},
					'otherDifficult.id': {required:true},
					'difficultType.id': {required:true},
					             reason: {required:true,minlength:1,maxlength:500}
				
				},
				messages:{
					'isJobDifficult.id':{required:'就业困难不能为空！'},
					'otherDifficult.id':{required:'其他困难不能为空！'},
					'difficultType.id':{required:'困难类别不能为空！'},
					             reason:{required:'困难原因不能为空！',maxlength:'困难原因不能查过500字！'}
				}
		 });
	});
	
	//弹窗确定按钮
	function postMessage() {
	if(attachFlag.form()){
		$.ajax({
				url: "${rc.contextPath}/job/poorStudent/nsm/savePoorStudents.do",
				async:false,
				cache:false,
				type:"POST",
				data:{ids:_messageId,difficultType:$("#difficultType").val(),reason:$("#reason").val()},
			    success: function(msg){
			       if(msg == "success"){
					    comp.hideModal("_showModel","800px","-300px 0 0 -300px");
                        window.location.href="${rc.contextPath}/job/poorStudent/opt-query/queryPoorStudentInfoList.do";
				  } else {
				    	if(msg.indexOf("<html>")!= -1){
				    		window.location.reload();
				    		return;
				    	}
				    	$.sticky("双困生信息申请失败", {autoclose:5000, position:"top-right", type:"st-error"});
				    	return;
				    }
				}
		});	
	}	
  }	
  
	
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
  
  
</script>
</body>
</html>