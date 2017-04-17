<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- ajax form-->
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
		<script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
		<script>
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
			//查询
			function query(){
				$("#stuApplyQuery").submit();
			}
			//修改
			function edit(id){
				window.location.href="${rc.contextPath}/reward/studentapprove/opt-query/approveStuApply.do?id=" + id;
			}
			//查看
			function view(id) { 
				window.open("${rc.contextPath}/reward/studentapprove/opt-query/viewApproveStudentInfo.do?id=" + id);
			}
			
			//批量审批
			function selectAllbox(mainbox,boxname){
				comp.selectAllCheckbox(mainbox,boxname);
			}
			
			function editMulProcess(){
				$("#stuApplyQuery").attr("action","${rc.contextPath}/reward/studentapprove/opt-query/checkedApproveList.do").submit();
			}
			
			function submitMulProcess(boxname,selectedBox){
				
	 			if(!comp.checkboxSelectValidator(boxname)){
					comp.message('请选择需要审批的信息!');
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
			
			
			
			function importApprove() {
				window.location.href="${rc.contextPath}/reward/studentApply/studentApprove/importApprove.ftl";
			}
			
			
		</script>
		<style>
			.modal{width:320px;margin-top:-180px;margin-left:-80px}
		</style>
    </head>
    <body>
		<div id="contentwrapper">
		    <div class="main_content">  
		    	<div class="row-fluid">
		    		<form id="stuApplyQuery" method="post" action="${rc.contextPath}/reward/studentapprove/opt-query/queryStudentApprovePage.do">
		    			<div class="span12">
		    				<div class="row-fluid">
		    					<div class="span4">
		    				    	<span class="schoolYear">学年</span>
									<select size="1" id="schoolYear" name="awardTypeId.schoolYear.code" aria-controls="dt_gal" class="span6 selectoption" >
										<option value="" />请选择..</option>
										<#list schoolYearList as d>
											<#if stuInfo.awardTypeId?? && stuInfo.awardTypeId.schoolYear?? && stuInfo.awardTypeId.schoolYear.code==d.code>
    					    	            	<option  value="${d.code}" selected="selected">${d.name?html}</option>
    					    	            <#else>
    					    	            	<option  value="${d.code}" >${d.name?html}</option>
    					    	            </#if>
										</#list>
									</select>
		    				    </div>
		    				    <div class="span4">
		    					    <span class="name">学院</span>
		    					    <select size="1" id="collegeId" name="studentId.college.id" aria-controls="dt_gal" class="span6 selectoption" onchange="cascade.changeCollage('collegeId','majorId','classId');">
										<option value="" />请选择..</option>
										<#list academyList as d>
											<#if stuInfo.studentId?? && stuInfo.studentId.college.id==d.id>
    					    	            	<option  value="${d.id}" selected="selected">${d.name?html}</option>
    					    	            <#else>
    					    	            	<option  value="${d.id}" >${d.name?html}</option>
    					    	            </#if>
										</#list>
									</select>
		    				    </div>
		    				    <div class="span4">
		    				    	&nbsp;&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<span class="majorName">专业</span>
									<select size="1" id="majorId" name="studentId.major.id" aria-controls="dt_gal" class="span6 selectoption emptySelect" onchange="cascade.changeMajor('majorId','classId');">
										<option value="" />请选择..</option>
										<#if majorList??>
											<#list majorList as d>
												<#if stuInfo.studentId?? && stuInfo.studentId.major.id==d.id>
	    					    	            	<option  value="${d.id}" selected="selected">${d.majorName?html}</option>
	    					    	            <#else>
	    					    	            	<option  value="${d.id}" >${d.majorName?html}</option>
	    					    	            </#if>
											</#list>
										</#if>	
									</select>
		    				    </div>
		    				</div>
		    				
		    				<div class="row-fluid">
		    				    <div class="span4">
		    				    	<span class="className">班级</span>
									<select size="1" id="classId" name="studentId.classId.id" aria-controls="dt_gal" class="span6 selectoption emptySelect" >
										<option value="" />请选择..</option>
										<#if classList??>
											<#list classList as d>
												<#if stuInfo.studentId?? && stuInfo.studentId.classId.id==d.id>
							    	            	<option  value="${d.id}" selected="selected">${d.className?html}</option>
							    	            <#else>
							    	            	<option  value="${d.id}" >${d.className?html}</option>
							    	            </#if>
											</#list>
										</#if>
									</select>
		    				    </div>
		    				    <div class="span4">
		    				    	<span class="className">类型</span>
									<select size="1" id="awardTypeId" name="awardTypeId.awardType.code" aria-controls="dt_gal" class="span6 selectoption" >
										<option value="" />请选择..</option>
										<#list awardTypeList as d>
											<#if stuInfo?? && stuInfo.awardTypeId?? && stuInfo.awardTypeId.awardType.code==d.code>
    					    	            	<option  value="${d.code}" selected="selected">${d.name?html}</option>
    					    	            <#else>
    					    	            	<option  value="${d.code}" >${d.name?html}</option>
    					    	            </#if>
										</#list>
									</select>
		    				    </div>
		    				    <div class="span4">
									<span class="formTitle">审核状态</span>
									<select size="1" name="processStatus" aria-controls="dt_gal" class="span6 selectoption">
										<option value="" >请选择..</option>
										<#list processStatusMap?keys as c>
											<#if stuInfo ?? && stuInfo.processStatus?? && stuInfo.processStatus == c >
												<option value="${c}" selected >${processStatusMap[c]}</option>
											<#else>
												<option value="${c}">${processStatusMap[c]}</option>
											</#if>
										</#list>
									</select>	
								 </div>
	    				    	
		    				</div>
		    				
		    				<div class="row-fluid">
		    					<div class="span4">
		    				    	<span class="major">姓名</span>
		    				    	<#if stuInfo.studentId ??>
										<input id="stuInfo.name" class="span6" value="${stuInfo.studentId.name!""}" name="studentId.name">
									<#else>
										<input id="stuInfo.name" class="span6" value="" name="studentId.name">
									</#if>										
		    				    </div>
		    				    <div class="span4">
		    				    	<span class="major">学号</span>
		    				    	<#if stuInfo.studentId ??>
										<input id="stuInfo.studentId.stuNumber" class="span6" value="${stuInfo.studentId.id!""}" name="studentId.id">
									<#else>
										<input id="stuInfo.studentId.stuNumber" class="span6" value="" name="studentId.id">
									</#if>										
		    				    </div>
		    				    
		    				    <div class="span4">
		    				    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    				    	<button class="btn btn-info" onclick="query()">查 询</button>
		              				<button class="btn btn-info"  onclick="comp.clearForm('stuApplyQuery')">清 空</button>
		    				    </div>
		    				</div>
		    				<#-- 选中的数据项ID -->
		    				<input type="hidden" id="selectedBox" name="selectedBox" value="">
		    			</div>
		    		</form>
		    		<div class="btnCenter">
		              	
	           		</div>
	           		
	           		<div class="row-fluid">
	           			<div class="span12">
	           				<h5 class="heading"></h5>
	           				<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
	           					<div class="row">
	           						<div class="span10">
	           							<div class="dt_actions">
		           								<div class="row-fluid">
		           									<#if user_key.optMap['approve']??>
		           										<button class="btn btn-info" type="button" onclick="submitMulProcess('approveProcess','selectedBox')">批量审核</button> 
	           										</#if>   
		           									<#if user_key.optMap['import']??>
		           										<button class="btn btn-info" type="button" onclick="importApprove()">导 入</button>
	           										</#if>
		           								</div>
	           							</div>
	           						</div>
	           					</div>
	           					<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
	           						<thead>
										<tr>
											<th class="table_checkbox" width="5%" >
												<input type="checkbox" id="totalCheck"  onclick="selectAllbox('totalCheck','approveProcess')"/>
											</th>
											<th width="15%" >学年</th>
											<th width="15%" >奖项名称</th>
											<th width="15%" >二级奖项名称</th>
											<th width="15%" >类型</th>
											<#-- 
											<th width="10%" >学院</th>
											<th width="10%" >专业</th>
											<th width="10%" >班级</th>-->
											<th width="12%" >姓名</th>
											<th width="12%" >学号</th>
											<th width="10%" >审核状态</th>
											<th width="10%" >操作</th>
										</tr>
								</thead>
	           								
	           						<tbody>
	           							<#if page??>	
											<#list page.result as p>
												<tr>
													<td>
														<#if p.processStatus ??>
															<#if p.nextApprover?? && p.nextApprover.id==userId>
																<input type="checkbox"  name="approveProcess" value="${p.id!""}"/>
															<#else>	
															</#if>	
														<#else>
															<input type="checkbox"  name="approveProcess" value="${p.id!""}"/>
														</#if>	
													</td>
													<td class="autocut" >${p.awardTypeId.schoolYear.name!""?html}</td>
													<td class="autocut" >${(p.awardTypeId.awardInfoId.awardName!"")?html}</td>
													<td class="autocut" ><#if p.awardTypeId.secondAwardName??>${(p.awardTypeId.secondAwardName.name!"")?html}</#if></td>
													<td class="autocut" >${p.awardTypeId.awardType.name!""}</td>
													<#-- 
													<td class="autocut" >${(p.studentId.college.name)!""}</td>
													<td class="autocut" >${(p.studentId.major.majorName!"")?html}</td>
													<td class="autocut" >${(p.studentId.classId.className!"")?html}</td>-->
													<td class="autocut tipTag" data="学院：${(p.studentId.college.name)!''}<br/>专业：${(p.studentId.major.majorName)!''}<br/>班级：${(p.studentId.classId.className)!''}<br/>">${(p.studentId.name!"")?html} </td>
													<td class="autocut" >${(p.studentId.stuNumber!"")?html}</td>
													<td class="autocut" >
														<#if p.processStatus ??>
															<#if p.nextApprover?? && p.nextApprover.id==userId>
																待审核
															<#else>
																${processStatusMap[p.processStatus]}
															</#if>
														<#else>
															待审核
														</#if>
													</td>
													<td class="autocut">
														<#if p.nextApprover?? && p.nextApprover.id == userId && user_key.optMap['approve']??>
															<a href="###" onclick="edit('${p.id}')" title="审批"><i class="icon-edit"></i></i></a>
														<#else>
															<a href="###" onclick="view('${p.id}')" title="查看"><i class="icon-list-alt"></i></a>  
														</#if>
													</td>
												</tr>
											</#list>
										 </#if> 
	           						</tbody>
								</table>
								<#assign pageTagformId="stuApplyQuery"/>
								<#include "/page.ftl">
	           				</div>
	           			</div>
	           		</div>
		    	</div> 
			</div>
		</div>
		
	           		
	</body>
</html>