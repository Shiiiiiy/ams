<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- ajax form-->
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
		<script type="text/javascript" src="${rc.contextPath}/js/common/cascadecommon.js"></script>
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
				$.post("${rc.contextPath}/reward/studentapply/opt-query/checkStuPermission.do",{awardTypeId:id},function(data){
					if(data == 'true') {
						var applyId = $("#"+id).val();
						if(applyId != null && applyId != "" && applyId != "undefined") {
							window.location.href="${rc.contextPath}/reward/studentapply/opt-query/editStuApply.do?stuApplyId=" + applyId;
						}else{
							window.location.href="${rc.contextPath}/reward/studentapply/opt-query/editStuApply.do?awardType=" + id;
						}
					}else{
						comp.message("对不起，你不符合该奖项的申请条件","error");
					}
				});   
			}
			//查看
			function view(id) {
				window.open("${rc.contextPath}/reward/studentquery/opt-query/viewStudent.do?id=" + id); 
			}
			$("document").ready(function(){
				$('#processStatus option[value="CURRENT_APPROVE"]').remove();
			})
		</script>
		<style>
			.modal{width:320px;margin-top:-180px;margin-left:-80px}
		</style>
    </head>
    <body>
		<div id="contentwrapper">
		    <div class="main_content">  
		    	<div class="row-fluid">
		    		<form id="stuApplyQuery" method="post" action="${rc.contextPath}/reward/studentquery/opt-query/queryStudentPage.do">
		    		<#if flag?? && flag==false>
		    			<div class="span12">
		    				<div class="row-fluid">
		    				    <div class="span4">
		    				    	<span class="term">学年</span>
									<select size="1" id="schoolYear" name="awardTypeId.schoolYear.code" aria-controls="dt_gal" class="span6 selectoption">
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
		    					    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="name">学院</span>
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
		    				    	<span class="majorName">专业</span>
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
		    				    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="className">姓名</span>
		    				    	<#if stuInfo.studentId ??>
										<input id="stuInfo.name" class="span6" value="${stuInfo.studentId.name!""}" name="studentId.name">
									<#else>
										<input id="stuInfo.name" class="span6" value="" name="studentId.name">
									</#if>	
		    				    </div>
		    				    <div class="span4">
		    				    	<span class="className">学号</span>
		    				    	<#if stuInfo.studentId ??>
										<input id="stuInfo.studentId.stuNumber" class="span6" value="${stuInfo.studentId.id!""}" name="studentId.id">
									<#else>
										<input id="stuInfo.studentId.stuNumber" class="span6" value="" name="studentId.id">
									</#if>
		    				    </div>
		    				</div>
		    				<div class="row-fluid">
		    					<div class="span4">
		    				    	<span class="awardType">类型</span>
		    				    	<select size="1" id="awardType" name="awardTypeId.awardType.code" aria-controls="dt_gal" class="span6 selectoption">
										<option value="" />请选择..</option>
										<#list awardTypeList as d>
											<#if stuInfo.awardTypeId?? && stuInfo.awardTypeId.awardType?? && stuInfo.awardTypeId.awardType.code==d.code>
    					    	            	<option  value="${d.code}" selected="selected">${d.name?html}</option>
    					    	            <#else>
    					    	            	<option  value="${d.code}" >${d.name?html}</option>
    					    	            </#if>
										</#list>
									</select>
		    				    </div>
		    				    <div class="span4">
									<span class="formTitle">审核状态</span>
									<select size="1" id="processStatus" name="processStatus" aria-controls="dt_gal" class="span6 selectoption">
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
		    				    <div class="span4">
		    				    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    				    	<button class="btn btn-info" onclick="query()">查 询</button>
		              				<input type="button" class="btn btn-info"  onclick="comp.clearForm('stuApplyQuery')" value="清 空"/>
		    				    </div>
		    				</div>
		    			</div>
		    		<#else>
		    			<div class="span12">
		    				<div class="row-fluid">
		    				    <div class="span4">
		    				    	<span class="term">学年</span>
									<select size="1" id="schoolYear" name="awardTypeId.schoolYear.code" aria-controls="dt_gal" class="span6 selectoption">
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
		    				    <div class="span4">
		    				    	<span class="awardType">类型</span>
		    				    	<select size="1" id="awardType" name="awardTypeId.awardType.code" aria-controls="dt_gal" class="span6 selectoption">
										<option value="" />请选择..</option>
										<#list awardTypeList as d>
											<#if stuInfo.awardTypeId?? && stuInfo.awardTypeId.awardType?? && stuInfo.awardTypeId.awardType.code==d.code>
    					    	            	<option  value="${d.code}" selected="selected">${d.name?html}</option>
    					    	            <#else>
    					    	            	<option  value="${d.code}" >${d.name?html}</option>
    					    	            </#if>
										</#list>
									</select>
		    				    </div>
		    				</div>
		    			</div>
		    			<div class="span12">
							<div class="row-fluid">		    			
		    					<div class="btnCenter">
		    				    	<button class="btn btn-info" onclick="query()">查 询</button>
		              				<input type="button" class="btn btn-info"  onclick="comp.clearForm('stuApplyQuery')" value="清 空"/>
		    				    </div>
		    				</div>    
		    			</div>
		    		</#if>	
		    			
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
	           								</div>
	           							</div>
	           						</div>
	           					</div>
	           					<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
	           						<thead>
										<tr>
											<th width="6%" >序号</th>
											<th width="10%" >姓名</th>
											<th width="10%" >学号</th>
											<th width="10%" >学年</th>
											<#-- 
											<th width="10%" >学院</th>
											<th width="10%" >专业</th>
											<th width="10%" >班级</th>-->
											<th width="10%" >奖项名称</th>
											<th width="10%" >二级奖项名称</th>
											<th width="10%" >类型</th>
											<th width="10%" >审核状态</th>
											<th width="8%" >操作</th>
										</tr>
								</thead>
	           						
	           						<tbody>
	           							<#if page??>	
											<#list page.result as p>
												<tr>
													<td class="autocut" >${p_index+1}</td>
													<td class="autocut  tipTag" data="学院：${(p.studentId.college.name)!''}<br/>专业：${(p.studentId.major.majorName)!''}<br/>班级：${(p.studentId.classId.className)!''}<br/>">${p.studentId.name}</td>
													<td class="autocut" >${p.studentId.id}</td>
													<td class="autocut" ><#if p.awardTypeId??>${p.awardTypeId.schoolYear.name!""?html}</#if></td>
													<#--
													<td class="autocut" >${p.studentId.college.name!""?html}</td>
													<td class="autocut" >${p.studentId.major.majorName!""?html}</td>
													<td class="autocut" >${p.studentId.classId.className!""?html}</td>-->
													<td class="autocut" ><#if p.awardTypeId??>${(p.awardTypeId.awardInfoId.awardName!"")?html}</#if></td>
													<td class="autocut" ><#if p.awardTypeId?? &&p.awardTypeId.secondAwardName??>${(p.awardTypeId.secondAwardName.name!"")?html}</#if></td>
													<td class="autocut" >${(p.awardTypeId.awardType.name!"")?html}</td>
													<td class="autocut" >
														<#if p.processStatus??>
															${processStatusMap[p.processStatus]!""}
														<#else>
															审核中
														</#if>
													</td>
													<td class="autocut">
														<a href="###" onclick="view('${p.id}')" title="查看"><i class="icon-list-alt"></i></a>
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