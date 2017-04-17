<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <script type="text/javascript" src="${rc.contextPath}/js/common/cascadecommon.js"></script>
        <!-- multiselect -->
	    <link rel="stylesheet" href="${rc.contextPath}/lib/multiselect/css/multi-select.css" />
		<script src="${rc.contextPath}/lib/multiselect/js/jquery.multi-select.min.js"></script>	
        <!-- ajax form-->
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
    </head>
    <body>
	  <div id="contentwrapper">
   		<div class="main_content">   
    	   <div class="row-fluid">	
    		<form  id="employmentInfoQuery"  action="${rc.contextPath}/job/employment/opt-query/queryEmploymentInfoList.do" method="post">
				<div class="span12">			
				   <div class="row-fluid">
			         <div class="span4">
						<span class="formTitle">姓名</span>
					    <input id="student.name" name="student.name" class="span6" <#if employmenInfo?? && employmenInfo.student??> value="${((employmenInfo.student.name)!'')?html}"</#if> maxlength="225"/>
					  </div>
						 
					 <div class="span4">
						<span class="formTitle">学号</span>
						<input id="student.stuNumber" name="student.stuNumber" class="span7" value="${((employmenInfo.student.stuNumber)!'')?html}" maxlength="225"/>
					 </div>
					 <div class="span4">
						  <span class="formTitle">困难类别</span>
						    <select size="1" id="difficultType" class="span6" name="difficultType.id" aria-controls="dt_gal" >
					          <option value="" />请选择..</option>
								<#if difficultTypeList??>
									<#list difficultTypeList as d>
										<#if employmenInfo.difficultType ?? && employmenInfo.difficultType.id==d.id >
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
						<select size="1" id="strCollege" name="strCollege.id" <#if collegeStatus?? && collegeStatus=="false">disabled</#if> aria-controls="dt_gal" class="span6" onChange="cascade.changeCollage('strCollege', 'strMajor','strClassId');">
							<option value="" >请选择..</option>
							<#if collegeList??>
								<#list collegeList as c>
									<#if employmenInfo?? && employmenInfo.strCollege?? && c.id==employmenInfo.strCollege.id>
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
						<span class="formTitle">专业</span>
						<select size="1" id="strMajor" name="strMajor.id" aria-controls="dt_gal" class="span7 emptySelect" onChange="cascade.changeMajor('strMajor', 'strClassId');">
							<option value="" >请选择..</option>
							<#if majorList ?? >
								<#list majorList as m>
									<#if employmenInfo?? && employmenInfo.strMajor?? &&  employmenInfo.strMajor.id == m.id >
										<option value="${m.id}" selected >${m.majorName}</option>
									<#else>
										<option value="${m.id}">${m.majorName}</option>
									</#if>
								</#list>
							</#if>
						</select>
					</div>
				
					<div class="span4">
						<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;班级</span>
						<select size="1" id="strClassId" name="strClassId.id" aria-controls="dt_gal" class="span6 emptySelect" >
							<option value="" >请选择..</option>
							<#if classList ?? >
								<#list classList as c>
									<#if employmenInfo?? && employmenInfo.strClassId?? && employmenInfo.strClassId.id == c.id >
										<option value="${c.id}" selected >${c.className}</option>
									<#else>
										<option value="${c.id}">${c.className}</option>
									</#if>
								</#list>
							</#if>
						</select>
					</div>
				</div>
						
		        <div class="btnCenter">
				    <input type="button" class="btn btn-info"  onclick="selectStudentInfo();" value="查 询"/>
                    <input type="button" class="btn btn-info"  onclick="comp.clearForm('employmentInfoQuery')" value="清 空"/>
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
											<#if user_key.optMap['add']?? || user_key.optMap['import']??>
					                            <button class="btn btn-info" type="button" id="add-button">
					                                                                                新 增
					                            </button>
					                            <button class="btn btn-info" type="button" onclick="importInfo()">导 入</button>
											</#if>
										</#if>	
				                    </div>
				                </div>
				            </div>
				        </div>
				        
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
							<thead>
								<tr>
									<th width="5%">序号</th>
									<th width="7%">姓名</th>
									<th width="6%">性别</th>
									<th width="9%">学号</th>
									<th width="15%">困难类别</th>
									<th width="8%">学历</th>
									<th width="10%">师范生类别</th>
									<th width="8%">招生类别</th>
									<th width="8%">培养方式</th>
									<th width="8%">操作</th>
								</tr>
							</thead>
							<tbody>
								<#if page??>	
									<#list page.result as p>
										<tr>
											<td>${p_index+1}</td>
											<td class="autocut tipTag" data="学院：${(p.student.college.name)!''}<br/>专业：${(p.student.major.majorName)!''}<br/>班级：${(p.student.classId.className)!''}<br/>"><a target="_blank" href="${rc.contextPath}/job/employment/opt-view/viewEmploymentInfo.do?id=${(p.id)!''}" title="查看就业生信息">${(p.student.name)!""}</a></td>
											<td class="autocut">${(p.student.genderDic.name)!""}</td>
											<td class="autocut">${(p.student.stuNumber)!""}</td>
											<td class="autocut">${(p.difficultType.name)!""}</td>
											<td class="autocut">${(p.education.name)!""}</td>
											<td class="autocut">${(p.normalType.name)!""}</td>
											<td class="autocut">${(p.recruitStudentType.name)!""}</td>
											<td class="autocut">${(p.cultureType.name)!""}</td>
											<td>
											<#if user_key.optMap['update']??>
											   <a href="${rc.contextPath}/job/employment/opt-update/editEmploymentInfo.do?id=${p.id}" class="sepV_a" title="就业信息编辑"><i class="icon-edit"></i></a>
											</#if>
											<#if user_key.optMap['del']??>
											   <a href="javascript:void(0);" onclick="deleteStudentInfo('${(p.student.name)!""}','${p.id!""}');" class="sepV_a" title="删除就业信息"><i class="icon-trash"></i></a>
											</#if>   
											</td>
										</tr>
									</#list>
								 </#if> 
							</tbody>
						</table>
						 <#assign pageTagformId="employmentInfoQuery"/>
						 <#include "/page.ftl">
					</div>
				</div>
			</div> 
		</div> 
	</div>
</div>
<#-- 脚本开始 -->
<script>
	
	$(document).ready(function(){
	 	
	 	//新增方法 
	 	$("#add-button").click( function () { 
	 		window.location.href="${rc.contextPath}/job/employment/opt-add/editEmploymentInfo.do";
	 	 });
	 	
	});
	
	
     //判断数据是否为空
	function isEmpty(s){
	  return ((s==undefined || s==null || s=="" || s==0) ? true : false);
	}
	
	function setClassStudentSelectCheckValue(classIds,names){
	   if(isEmpty(classIds)){
	      $.sticky("请选择就业学生。", {autoclose:5000, position:"top-right", type:"st-error"});
	      return;
	   }
	   $.ajax({
				url: "${rc.contextPath}/job/employment/opt-save/saveEmploymentInfo.do?ids="+classIds,
				async:false,
				cache:false,
				type:"POST",
				data:$('#employmentInfoQuery').serialize(),
			    success:function(data){
					if(data == "success"){
			            $.sticky("就业学生信息添加成功。", {autoclose:5000, position:"top-right", type:"st-info"});
			            window.location.href="${rc.contextPath}/job/employment/opt-query/queryEmploymentInfoList.do";
				    }else{
				    	$.sticky("就业学生信息添加失败。", {autoclose:5000, position:"top-right", type:"st-error"});
				    	return;
				    }
				}
			 });
	 }
	
	
	//查询
	function selectStudentInfo(){
	    $("#employmentInfoQuery").attr("action","${rc.contextPath}/job/employment/opt-query/queryEmploymentInfoList.do");
		$("#employmentInfoQuery").submit();
	}
	
	
	//删除操作
	function deleteStudentInfo(name,id)
	{
		comp.confirm("确定要删除【"+name+"】的信息吗？", function(result) {
        	if(!result)
        		return;  
    		$.post("${rc.contextPath}/job/employment/opt-del/deleteEmploymentInfo.do", { id: id }, function(data){
    			if(data === "success")
    			{
    				comp.message(name +"删除成功！","info");
    				 window.location.href="${rc.contextPath}/job/employment/opt-query/queryEmploymentInfoList.do";
    			}
			    
			   },"text");
		}); 
	}
	
	
	function importInfo(){
		window.location.href="${rc.contextPath}/job/employment/importInfo.ftl";
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