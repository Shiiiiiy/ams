<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="${rc.contextPath}/css/starSelect.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${rc.contextPath}/js/common/cascadecommon.js"></script>
    </head>
    <body>
		<div id="contentwrapper">
   		<div class="main_content">   
    	   <div class="row-fluid">	
    		<form  id="studentAwardQuery"  action="${rc.contextPath}/sponsor/studentAward/opt-query/queryStudentAwardList.do" method="post">
				<div class="span12">			
					<div class="row-fluid">
						 <div class="span4">
						  <span class="formTitle">奖助类型</span>
						    <select size="1" id="awardType.id" class="span6" name="awardType.id" aria-controls="dt_gal" >
					          <option value="" />请选择..</option>
							   <#if awardList??>
								<#list awardList as c>
									<#if studentAward?? && studentAward.awardType?? && c.id==studentAward.awardType.id>
										<option value="${c.id}" selected="selected">${c.name?html}</option>
									<#else>
										<option value="${c.id}">${c.name?html}</option>
									</#if>
								</#list>
							  </#if>
				         	</select>
						 </div>
					    <div class="span4">
						  <span class="formTitle">&nbsp;&nbsp;&nbsp;学年</span>
						    <select size="1" id="schoolYear" class="span6" name="schoolYear.id" aria-controls="dt_gal" >
					          <option value="" />请选择..</option>
								<#if yearList??>
									<#list yearList as d>
										<#if studentAward.schoolYear ?? && studentAward.schoolYear.id==d.id >
											<option  value="${d.id}" selected="selected" />${d.name?html}</option>
										<#else>
											<option value="${d.id}" />${d.name?html}</option>
										</#if>
									</#list>
								 </#if>
				         	</select>
						 </div>
						 <div class="span4">
						    <input type="button" class="btn btn-info"  onclick="selectStudentAward();" value="查 询"/>
		                    <input type="button" class="btn btn-info"  onclick="comp.clearForm('studentAwardQuery')" value="清 空"/>
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
											    <#if isDifficult?? && isDifficult== true && setTimeNum?? && setTimeNum!=0>
						                            <button class="btn btn-info" type="button" id="add-button">
					                               		 申 请
						                            </button>
						                        <#elseif isDifficult?? && isDifficult== false && setTimeNum?? && setTimeNum!=0>
						                             <font color="red"><b>您现在还不是困难生，暂时不能申请奖助</b></font>
					                            <#elseif isDifficult?? && isDifficult== true && setTimeNum?? && setTimeNum==0>
											         <font color="red"><b>当前无奖助可申报，暂时不能申请奖助</b></font>
											    <#else>
											         <font color="red"><b>您现在还不是困难生，暂时不能申请奖助</b></font>
											    </#if>
											 </#if> 
										</#if>	
				                    </div>
				                </div>
				            </div>
				        </div>
				        
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl" >
							<thead>
								<tr>
									<th width="6%">序号</th>
									<th width="8%">姓名</th>
									<th width="8%">学号</th>
									<th width="8%">学年</th>
									<th width="10%">学院</th>
									<th width="12%">专业</th>
									<th width="15%">班级</th>
									<th width="8%">奖助类型</th>
									<th width="10%">家庭经济情况</th>
									<th width="8%">状态</th>
									<#--><th width="10%">审批状态</th>-->
									<th width="8%">操作</th>
								</tr>
							</thead>
							<tbody>
								<#if page??>	
									<#list page.result as p>
										<tr>
											<td>${p_index+1}</td>
											<td class="autocut"><a target="_blank" href="${rc.contextPath}/sponsor/studentAward/opt-view/viewStudentAward.do?id=${(p.id)!''}" title="查看困难生信息"> ${(p.difficultStudentInfo.student.name)!""}</a></td>
											<td class="autocut">${(p.difficultStudentInfo.student.stuNumber)!""}</td>
											<td class="autocut">${(p.schoolYear.name)!""}</td>
											<td class="autocut">${(p.difficultStudentInfo.student.college.name)!""}</td>
											<td class="autocut">${(p.difficultStudentInfo.student.major.majorName)!""}</td>
											<td class="autocut">${(p.difficultStudentInfo.student.classId.className)!""}</td>
											<td class="autocut">${(p.awardType.name)!""}</td>
											<td class="autocut">${(p.familyFinance.name)!""}</td>
											<td class="autocut">${(p.status.name)!""}</td>
											<#-->
											<td class="autocut">
											<#if p.processStatus ??>
												<#if currentUserId?? && p.nextApprover?? && p.nextApprover.id==currentUserId>
													审核中
												<#else>
													${processStatusMap[p.processStatus]}
												</#if>
											<#elseif p.status.code="SUBMIT">审核中
											</#if>
											</td>
											-->
											<td>
											<#if user_key.optMap['update']?? && p.status?? && p.status.code="SAVE" || (p.processStatus?? && p.processStatus ="REJECT")>
											   <a href="${rc.contextPath}/sponsor/studentAward/opt-update/editStudentAwardInfo.do?id=${p.id}" class="sepV_a" title="编辑困难生奖助信息"><i class="icon-edit"></i></a>
											</#if>
											<#if user_key.optMap['del']??>
											   <#if p.status?? && p.status.code="SUBMIT" ||(p.processStatus?? && (p.processStatus="REJECT" || p.processStatus="PASS"))>
											   <#else>
											   <a href="javascript:void(0);" onclick="deleteStudentAward('${(p.difficultStudentInfo.student.name)!""}','${p.id!""}');" class="sepV_a" title="删除困难生奖助信息"><i class="icon-trash"></i></a>
											   </#if>
											</#if>    
											</td>
										</tr>
									</#list>
								 </#if> 
							</tbody>
						</table>
						 <#assign pageTagformId="studentAwardQuery"/>
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
	 		window.location.href="${rc.contextPath}/sponsor/studentAward/opt-add/editStudentAwardInfo.do?";
	 	 });
	 	
	});
	
	
	
	//查询
	function selectStudentAward(){
	    $("#studentAwardQuery").attr("action","${rc.contextPath}/sponsor/studentAward/opt-query/queryStudentAwardList.do");
		$("#studentAwardQuery").submit();
	}
	
	
	//删除操作
	function deleteStudentAward(name,id)
	{  
		comp.confirm("确定要删除【"+name+"】的奖助信息吗？", function(result) {
        	if(!result)
        		return;  
    		$.post("${rc.contextPath}/sponsor/studentAward/opt-del/deleteDifficultStudentAward.do", { id: id }, function(data){
    			if(data === "success")
    			{
    				comp.message(name +"删除成功！","info");
    				window.location.href="${rc.contextPath}/sponsor/studentAward/opt-query/queryStudentAwardList.do";
    			}
			    
			   },"text");
		}); 
	}
		
	
	
</script>
</body>
</html>