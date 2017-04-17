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
    		<form  id="studentAwardApprove"  action="${rc.contextPath}/sponsor/approveStudentAward/opt-query/approveDifficultStudentAwardList.do" method="post">
				<div class="span12">			
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">姓名</span>
						    <input id="student.name" name="difficultStudentInfo.student.name" class="span6" <#if studentAward?? && studentAward.difficultStudentInfo?? && studentAward.difficultStudentInfo.student??> value="${((studentAward.difficultStudentInfo.student.name)!'')?html}"</#if> maxlength="225"/>
						 </div>
						 
						 <div class="span4">
							<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学号</span>
							<input id="student.stuNumber" name="difficultStudentInfo.student.stuNumber" class="span6" value="${((studentAward.difficultStudentInfo.student.stuNumber)!'')?html}" maxlength="225"/>
						 </div>
						 
						 <div class="span4">
						  <span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;奖助类型</span>
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
					 </div>
					 
					<div class="row-fluid"> 
					 <div class="span4">
						<span class="formTitle">学院</span>
						<select size="1" id="college" name="difficultStudentInfo.student.college.id" aria-controls="dt_gal" class="span6" onChange="cascade.changeCollage('college', 'majorId','classId');">
							<option value="" >请选择</option>
							<#if collegeList??>
								<#list collegeList as c>
									<#if studentAward?? && studentAward.difficultStudentInfo?? && studentAward.difficultStudentInfo.student?? && studentAward.difficultStudentInfo.student.college?? && c.id==studentAward.difficultStudentInfo.student.college.id>
										<option value="${c.id}" selected="selected">${c.name?html}</option>
									<#else>
										<option value="${c.id}">${c.name?html}</option>
									</#if>
								</#list>
							</#if>
						</select>
					</div>
					<div class="span4">
						<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;专业</span>
						<select size="1" id="majorId" name="difficultStudentInfo.student.major.id" aria-controls="dt_gal" class="span6 emptySelect" onChange="cascade.changeMajor('majorId', 'classId');">
							<option value="" >请选择</option>
							<#if majorList ?? >
								<#list majorList as m>
									<#if studentAward?? && studentAward.difficultStudentInfo?? && studentAward.difficultStudentInfo.student?? && studentAward.difficultStudentInfo.student.major?? &&  studentAward.difficultStudentInfo.student.major.id == m.id >
										<option value="${m.id}" selected >${m.majorName}</option>
									<#else>
										<option value="${m.id}">${m.majorName}</option>
									</#if>
								</#list>
							</#if>
						</select>
					</div>
				
					<div class="span4">
						<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;班级</span>
						<select size="1" id="classId" name="difficultStudentInfo.student.classId.id" aria-controls="dt_gal" class="span6 emptySelect" >
							<option value="" >请选择</option>
							<#if classList ?? >
								<#list classList as c>
									<#if studentAward?? && studentAward.difficultStudentInfo?? && studentAward.difficultStudentInfo.student?? && studentAward.difficultStudentInfo.student.classId?? && studentAward.difficultStudentInfo.student.classId.id == c.id >
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
						  <span class="formTitle">学年</span>
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
					<#--	 
					   <div class="span4">
						<span class="formTitle">状态</span>
						 <select size="1" id="status" name="status.id" aria-controls="dt_gal" class="span6" >
							<option value="" >请选择</option>
							<#if statusList ?? >
								<#list statusList as c>
									<#if studentAward?? && studentAward.status?? && studentAward.status.id == c.id >
										<option value="${c.id}" selected >${c.name}</option>
									<#else>
										<option value="${c.id}">${c.name}</option>
									</#if>
								</#list>
							</#if>
						</select>
					</div>
					-->
					<div class="span4">
						<span class="formTitle">家庭经济情况</span>
						<select size="1" id="classId" name="familyFinance.id" aria-controls="dt_gal" class="span6" >
							<option value="" >请选择</option>
							<#if financeList ?? >
								<#list financeList as c>
									<#if studentAward?? && studentAward.familyFinance?? && studentAward.familyFinance.id == c.id >
										<option value="${c.id}" selected >${c.name}</option>
									<#else>
										<option value="${c.id}">${c.name}</option>
									</#if>
								</#list>
							</#if>
						</select>
					</div>
					<div class="span4">
						<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;审核状态</span>
							<select size="1" name="processStatus" aria-controls="dt_gal" class="span6">
								<option value="" >请选择..</option>
									<#list processStatusMap?keys as c>
										<#if studentAward ?? && studentAward.processStatus?? && studentAward.processStatus == c >
											<option value="${c}" selected >${processStatusMap[c]}</option>
										<#else>
											<option value="${c}">${processStatusMap[c]}</option>
										</#if>
									</#list>
							</select>	
					   </div>
				   </div>
					 
		            <div class="btnCenter">
		              <input type="button" class="btn btn-info"  onclick="selectStudentAward();" value="查 询"/>
		              <input type="button" class="btn btn-info"  onclick="comp.clearForm('studentAwardApprove')" value="清 空"/>
		            </div>
		             <#-- 选中的数据项ID -->
		    	    <input type="hidden" id="selectedBox" name="selectedBox" value="">
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
				                       <#--
					                    <button class="btn btn-info" type="button"  onclick="javascript:passStatus('pass')">
							                                        通 过                                
							            </button>
							             &nbsp;&nbsp;           
				                        <button class="btn btn-info" type="button"  onclick="javascript:passStatus('refuses')">
				                                                                      拒 绝
				                        </button>
				                        -->
				                        <#if user_key.optMap['approve']??>
   										   <button class="btn btn-info" type="button" onclick="submitMulProcess('approveProcess','selectedBox')">批量审核</button>
									    </#if>   
				                    </div>
				                </div>
				            </div>
				        </div>
				        
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl" >
							<thead>
								<tr>
									<th width="5%">
									     <input type="checkbox" id="totalCheck"  onclick="selectAllbox('totalCheck','approveProcess')"/>
									</th>
									<th width="8%">姓名</th>
									<th width="8%">学号</th>
									<th width="8%">学年</th>
									<th width="10%">学院</th>
									<th width="12%">专业</th>
									<th width="15%">班级</th>
									<th width="8%">奖助类型</th>
									<th width="10%">家庭经济情况</th>
									<th width="10%">状态</th>
									<th width="8%">操作</th>
								</tr>
							</thead>
							<tbody>
								<#if page??>	
									<#list page.result as p>
										<tr>
											<td>
											  <#if p.nextApprover?? && p.nextApprover.id==currentUserId>
											    <input type="checkbox"  name="approveProcess" value="${p.id!""}"/>
											  </#if>   
											</td>
											<td class="autocut"><a target="_blank" href="${rc.contextPath}/sponsor/studentAward/opt-view/viewStudentAward.do?id=${(p.id)!''}" title="查看困难生奖助信息"> ${(p.difficultStudentInfo.student.name)!""}</a></td>
											<td class="autocut">${(p.difficultStudentInfo.student.stuNumber)!""}</td>
											<td class="autocut">${(p.schoolYear.name)!""}</td>
											<td class="autocut">${(p.difficultStudentInfo.student.college.name)!""}</td>
											<td class="autocut">${(p.difficultStudentInfo.student.major.majorName)!""}</td>
											<td class="autocut">${(p.difficultStudentInfo.student.classId.className)!""}</td>
											<td class="autocut">${(p.awardType.name)!""}</td>
											<td class="autocut">${(p.familyFinance.name)!""}</td>
											<td class="autocut">
											<#if p.processStatus ??>
												<#if currentUserId?? && p.nextApprover?? && p.nextApprover.id==currentUserId>
													待审核
												<#else>
													${processStatusMap[p.processStatus]}
												</#if>
												<#else>待审核
											</#if>
									        </td>
											<td>
											<#if p.nextApprover?? && p.nextApprover.id==currentUserId>
											   <a href="${rc.contextPath}/sponsor/studentAward/opt-edit/editApproveStudentAward.do?id=${p.id}" class="sepV_a" title="困难生奖助审核"><i class="icon-check"></i></a>
											</#if>
											<#if p.status?? && p.status.code?? && p.status.code="PASS">
											   <a target="_blank" href="${rc.contextPath}/sponsor/studentAward/opt-view/viewStudentAward.do?id=${(p.id)!''}" title="查看困难生奖助信息"><i class="icon-list-alt"></i></a>
											</#if>
											</td>
										</tr>
									</#list>
								 </#if> 
							</tbody>
						</table>
						 <#assign pageTagformId="studentAwardApprove"/>
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
	    $("#studentAwardApprove").attr("action","${rc.contextPath}/sponsor/approveStudentAward/opt-query/approveDifficultStudentAwardList.do");
		$("#studentAwardApprove").submit();
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
	
	
    //批量审批
	function selectAllbox(mainbox,boxname){
		comp.selectAllCheckbox(mainbox,boxname);
	}
	
	function editMulProcess(){
		$("#studentAwardApprove").attr("action","${rc.contextPath}/sponsor/studentAwardApproves/opt-query/checkedApproveList.do").submit();
	}
	
	function submitMulProcess(boxname,selectedBox){
		
		if(!comp.checkboxSelectValidator(boxname)){
			comp.message('请选择要审批的信息!');
		}else{
			comp.getCheckboxValue(boxname,selectedBox);
			var param = $("#selectedBox").val().replace(",","_")
			$.ajax({
					url:"${rc.contextPath}/apw/amsapprove/opt-add/checkNextTaskApprover.do",
					async:false,
					cache:false,
					type:'POST',
					data:{boxes:param},
					success: function(data){
						var parsedJson = jQuery.parseJSON(data); 
						var nextApproverArray = parsedJson.nextApproverList;
						if(parsedJson.resultFlag=="deprecated"){
								$.sticky("审批流已弃用", {autoclose:5000, position:"top-right", type:"st-error"});
						 }else if(parsedJson.resultFlag=='mulApprover') {
						 		comp.message("下一节点有多个办理人，请执行单次审核 !");
						 }else if(parsedJson.resultFlag=='oneApprover' || parsedJson.resultFlag=='singleApprove'){
								editMulProcess();
						 }
				  }
			}); 
		}
	}	

	
</script>
</body>
</html>