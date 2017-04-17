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
    		<form  id="provinceGoodStudentQuery"  action="${rc.contextPath}/job/provinceGoodStudent/opt-query/queryProvinceGoodStudentList.do" method="post">
				<div class="span12">			
				   <div class="row-fluid">
			         <div class="span4">
						<span class="formTitle">姓名</span>
					    <input id="student.name" name="schoolGoodStudent.studentId.name" class="span6" <#if provinceGoodStudent.schoolGoodStudent?? && provinceGoodStudent.schoolGoodStudent.studentId??> value="${((provinceGoodStudent.schoolGoodStudent.studentId.name)!'')?html}"</#if> maxlength="225"/>
					  </div>
						 
					 <div class="span4">
						<span class="formTitle">学号</span>
						<input id="student.stuNumber" name="schoolGoodStudent.studentId.stuNumber" class="span6" value="${((provinceGoodStudent.schoolGoodStudent.studentId.stuNumber)!'')?html}" maxlength="225"/>
					 </div>
					 <div class="span4">
						  <span class="formTitle">学年</span>
						    <select size="1" id="schoolYear" class="span6" name="schoolGoodStudent.schoolYear.id" aria-controls="dt_gal" >
							  <option value="" >请选择..</option>
								<#if yearList??>
									<#list yearList as d>
										<#if provinceGoodStudent.schoolGoodStudent?? && provinceGoodStudent.schoolGoodStudent.schoolYear ?? && provinceGoodStudent.schoolGoodStudent.schoolYear.id==d.id >
											<option  value="${d.id}" selected="selected" />${d.name?html}</option>
										<#elseif yearDic?? && yearDic.id == d.id>
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
						<select size="1" <#if collegeStatus?? && collegeStatus=="false">disabled</#if> id="college" name="college.id"  aria-controls="dt_gal" class="span6" onChange="cascade.changeCollage('college', 'majorId','classId');">
							<option value="" >请选择..</option>
							<#if collegeList??>
								<#list collegeList as c>
									<#if provinceGoodStudent?? && provinceGoodStudent.college?? && c.id==provinceGoodStudent.college.id>
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
						<select size="1" id="majorId" name="major.id" aria-controls="dt_gal" class="span6 emptySelect" onChange="cascade.changeMajor('majorId', 'classId');">
							<option value="" >请选择..</option>
							<#if majorList ?? >
								<#list majorList as m>
									<#if provinceGoodStudent?? && provinceGoodStudent.major?? &&  provinceGoodStudent.major.id == m.id >
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
						<select size="1" id="classId" name="classId.id" aria-controls="dt_gal" class="span6 emptySelect" >
							<option value="" >请选择..</option>
							<#if classList ?? >
								<#list classList as c>
									<#if provinceGoodStudent?? && provinceGoodStudent.classId?? && provinceGoodStudent.classId.id == c.id >
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
									<#if provinceGoodStudent.status?? && provinceGoodStudent.status.id ?? && provinceGoodStudent.status.id==d.id >
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
	                    <input type="button" class="btn btn-info"  onclick="comp.clearForm('provinceGoodStudentQuery')" value="清 空"/>
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
				                    <#-->
					                    <#if user_key.optMap??>
											<#if user_key.optMap['add']??>
					                            <button class="btn btn-info" type="button" id="add-button">
				                               		 新 增
					                            </button>
											</#if>
										</#if>
									-->
									<#if user_key.optMap['apply']??>
									  <button class="btn btn-info" type="button" id="applyMessage-button">
						                                                        批量申请
						              </button>
						            </#if>  
						              <#-->
						              <button class="btn btn-info" type="button" id="unApplyMessage-button">
						                                                        取消申请
						              </button>
						              -->
				                    </div>
				                </div>
				            </div>
				        </div>
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
							<thead>
								<tr>
									<th width="5%"><input id="_totalSelect" type="checkbox"/></th>
									<th width="8%">姓名</th>
									<th width="10%">学号</th>
									<th width="10%">学年</th>
									<th width="12%">班级</th>
									<th width="8%">班级排名</th>
									<th width="7%">职务</th>
									<th width="10%">计算机等级</th>
									<th width="8%">外语等级</th>
									<th width="8%">状态</th>
									<th width="8%">操作</th>
								</tr>
							</thead>
							<tbody>
								<#if page??>	
									<#list page.result as p>
										<tr>
											<td>
											<#if p[0]?? && p[0].status?? && (p[0].status.code="APPLY_PASS" || p[0].status.code="APPLY_UNPASS" ||  p[0].status.code="APPLY" || p[0].status.code="UN_DO")>
											<#else>
											<input name="messageCheck" value="${(p[1].id)!''}" type="checkbox"/>
											</#if>
											</td>
											<td class="autocut tipTag" data="学院：${(p[1].studentId.college.name)!''}<br/>专业：${(p[1].studentId.major.majorName)!''}<br/>班级：${(p[1].studentId.classId.className)!''}<br/>"><a target="_blank" href="${rc.contextPath}/job/provinceGoodStudent/opt-view/provinceGoodStudentView.do?id=${(p[0].id)!''}&&sId=${(p[1].id!'')}" title="查看省优秀毕业生信息">${(p[1].studentId.name)!""}</a></td>
											<td class="autocut">${(p[1].studentId.stuNumber)!""}</td>
											<td class="autocut">${(p[1].schoolYear.name)!""}</td>
											<td class="autocut">${(p[1].studentId.classId.className)!""}</td>
											<td class="autocut">${(p[1].classSort)!""}</td>
											<td class="autocut">${(p[1].post)!""}</td>
											<td class="autocut">${(p[1].computerLevel)!""}</td>
											<td class="autocut">${(p[1].englishLevel)!""}</td>
											 <#if p[0]?? && p[0].status??>
											 <td class="autocut">${(p[0].status.name)!""}</td>
											 <#else>
											 <td class="autocut">未申请</td>
											 </#if>
											<td>
											<#if user_key.optMap['apply']??>
												<#if p[0]?? && p[0].status?? && (p[0].status.code="APPLY_PASS" || p[0].status.code="APPLY_UNPASS" || p[0].status.code="UN_DO")>
												<#elseif p[0]?? && p[0].status?? && p[0].status.code="APPLY">
												<#else>
												   <a href="${rc.contextPath}/job/provinceGoodStudent/opt-add/editProvinceGoodStudent.do?id=${(p[0].id)!''}&&schoolId=${(p[1].id)!''}" class="sepV_a" title="省优秀毕业生申请"><i class="icon-eye-open"></i></a>
												</#if>
											</#if>
											<#if user_key.optMap['update']??>
												<#if p[0]?? && p[0].status?? && p[0].status.code="APPLY_PASS">
												   <a href="${rc.contextPath}/job/queryProvinceGoodStudent/opt-save/writeProvinceGoodStudent.do?id=${p[0].id}" class="sepV_a" title="学生信息完善"><i class="icon-edit"></i></a>
												</#if>
										    </#if>
											</td>
										</tr>
									</#list>
								 </#if> 
							</tbody>
						</table>
						 <#assign pageTagformId="provinceGoodStudentQuery"/>
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
	 		window.location.href="${rc.contextPath}/job/provinceGoodStudent/opt-add/editProvinceGoodStudent.do";
	 	 });
	 	
	});
	
	
     //判断数据是否为空
	function isEmpty(s){
	  return ((s==undefined || s==null || s=="" || s==0) ? true : false);
	}
	
	
	
	//查询
	function selectStudentInfo(){
	    $("#provinceGoodStudentQuery").attr("action","${rc.contextPath}/job/provinceGoodStudent/opt-query/queryProvinceGoodStudentList.do");
		$("#provinceGoodStudentQuery").submit();
	}
	
	
	//删除操作
	function deleteStudentInfo(name,id)
	{
		comp.confirm("确定要撤销【"+name+"】的省优秀资格吗？", function(result) {
        	if(!result)
        		return;  
    		$.post("${rc.contextPath}/job/provinceGoodStudent/opt-del/deleteProvinceGoodStudent.do", { id: id }, function(data){
    			if(data === "success")
    			{
    				comp.message(name +"取消成功！","info");
    				 window.location.href="${rc.contextPath}/job/provinceGoodStudent/opt-query/queryProvinceGoodStudentList.do";
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
	
	//批量申请按钮
	jQuery("#applyMessage-button").click(function() {
		var ids = "";
		$("input[name='messageCheck']").each(function() {
			if($(this).attr("checked"))
				ids =  $(this).val()+","+ids
		});
		$("#poor_ids").val(ids);
		if(ids=="" || ids==",") {
			comp.message("请选择要申请的信息！","error");
			return;
		}
      comp.confirm("确认要申请省优秀毕业生吗？", function(result) {
	      if(!result)
	      return;
			$.ajax({
				url: "${rc.contextPath}/job/provinceGoodStudent/opt-save/saveProvinceGoodStudents.do",
				async:false,
				cache:false,
				type:"POST",
				data:{sids:ids},
			    success:function(msg){
					if(msg=="success"){
			            window.location.href="${rc.contextPath}/job/provinceGoodStudent/opt-query/queryProvinceGoodStudentList.do";
				    }else{
				    	$.sticky("省优秀毕业生申请失败", {autoclose:5000, position:"top-right", type:"st-error"});
				    	return;
				    }
				}
			 });
	  }); 
	});
	
	
	//批量取消申请按钮
	jQuery("#unApplyMessage-button").click(function() {
		var ids = "";
		$("input[name='messageCheck']").each(function() {
			if($(this).attr("checked"))
				ids =  $(this).val()+","+ids
		});
		$("#poor_ids").val(ids);
		if(ids=="" || ids==",") {
			comp.message("请选择要取消申请的信息！","error");
			return;
		}
		$.ajax({
			url: "${rc.contextPath}/job/provinceGoodStudent/opt-del/deleteProvinceGoodStudents.do",
			async:false,
			cache:false,
			type:"POST",
			data:{sids:ids},
		    success:function(msg){
				if(msg=="success"){
		            window.location.href="${rc.contextPath}/job/provinceGoodStudent/opt-query/queryProvinceGoodStudentList.do";
			    }else{
			    	$.sticky("省优秀毕业生申请失败", {autoclose:5000, position:"top-right", type:"st-error"});
			    	return;
			    }
			}
		 });
	});
	
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