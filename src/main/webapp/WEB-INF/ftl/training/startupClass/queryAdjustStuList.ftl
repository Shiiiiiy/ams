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
				$("#approveInfoQuery").submit();
			}
			//修改
			function edit(id){
				window.location.href="${rc.contextPath}/training/approveclass/opt-edit/editStuApprove.do?id=" + id + "&type=set";
			}
		</script>
		<style>
		<#-->	.modal{width:320px;margin-top:-180px;margin-left:-80px}  <-->
		</style>
    </head>
    <body>
		<div id="contentwrapper">
		    <div class="main_content">  
		    	<div class="row-fluid">
	    			<div class="span12">
		    			
		    		<form id="approveInfoQuery" method="post" action="${rc.contextPath}/training/startupclass/opt-query/queryApproveStuPage.do">
					<h3 class="heading">
						${classInfo.growthClassType.name}&nbsp;${classInfo.growthClassName}&nbsp; 学员管理
					</h3>
		    				<input type="hidden" name="growthId.id" value="${applyInfo.growthId.id!""}">
		    				<div class="row-fluid">
		    					<div class="span4">
		    					    <span class="name">学院</span>
		    					    <select size="1" id="collegeId" name="studentId.college.id" aria-controls="dt_gal" class="span6 selectoption" onchange="cascade.changeCollage('collegeId','majorId','classId');">
										<option value="" />请选择..</option>
										<#list academyList as d>
											<#if applyInfo.studentId?? && applyInfo.studentId.college.id==d.id>
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
												<#if applyInfo.studentId?? && applyInfo.studentId.major.id==d.id>
	    					    	            	<option  value="${d.id}" selected="selected">${d.majorName?html}</option>
	    					    	            <#else>
	    					    	            	<option  value="${d.id}" >${d.majorName?html}</option>
	    					    	            </#if>
											</#list>
										</#if>	
									</select>
	    				    	</div>
	    				    	<div class="span4">
	    				    		<span class="className">班级</span>
									<select size="1" id="classId" name="studentId.classId.id" aria-controls="dt_gal" class="span6 selectoption emptySelect" >
										<option value="" />请选择..</option>
										<#if classList??>
											<#list classList as d>
												<#if applyInfo.studentId?? && applyInfo.studentId.classId.id==d.id>
							    	            	<option  value="${d.id}" selected="selected">${d.className?html}</option>
							    	            <#else>
							    	            	<option  value="${d.id}" >${d.className?html}</option>
							    	            </#if>
											</#list>
										</#if>
									</select>
		    				    </div>
		    				</div>
		    		
	    				    <div class="row-fluid">
		    				    <div class="span4">
		    				    	<span class="growthClassName">姓名</span>
		    				    	<#if applyInfo.studentId?? && applyInfo.studentId.name??>
		    				    		<input name="studentId.name" class="span6" value="${applyInfo.studentId.name!""}">
		    				    	<#else>
		    				    		<input name="studentId.name" class="span6" value="">
		    				    	</#if>	
		    				    </div>
		    					<div class="span4">
		    				    	<span class="stuNumber">学号</span>
		    				    	<#if applyInfo.studentId?? && applyInfo.studentId.stuNumber??>
		    				    		<input name="studentId.stuNumber" class="span6" value="${applyInfo.studentId.stuNumber!""}">
		    				    	<#else>
		    				    		<input name="studentId.stuNumber" class="span6" value="">
		    				    	</#if>	
		    				    </div>
			    				<div class="span4">
			    					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			    					<button class="btn btn-info" onclick="query()">查 询</button>
		              				<input type="button" class="btn btn-info"  onclick="comp.clearForm('approveInfoQuery')" value="清 空"/>
			    				</div>
		    				</div>	
		    				
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
	           								</div>
	           							</div>
	           						</div>
	           					</div>
	           				<form id="multyAdjust" method="post" action="${rc.contextPath}/training/approveclass/opt-edit/editMultyAdjust.do">
	           					<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
	           						<thead>
										<tr>
											<th width="5%" >序号</th>
											<th width="10%" >姓名</th>
											<th width="10%" >学号</th>
											<th width="10%">手机</th>
											<th width="16%">邮箱</th>
											<th width="7%">QQ</th>
											<th width="13%" >创业班名称</th>
											<th width="10%" >创业班类型</th>
											<th width="10%" >创业班主题</th>
											<th width="10%" >操作</th>
										</tr>
									</thead>
	           						<tbody>
	           							<#if page??>	
											<#list page.result as p>
												<tr>
													<td class="autocut" >${p_index+1}</td>
													<td class="autocut tipTag" data="学院：${(p.studentId.college.name)!''}<br/>专业：${(p.studentId.major.majorName)!''}<br/>班级：${(p.studentId.classId.className)!''}<br/>">${p.studentId.name!""}</td>
													<td class="autocut" >${p.studentId.stuNumber!""}</td>
													<td class="autocut">${p.studentId.phone1!""}</td>
													<td class="autocut">${p.studentId.email!""}</td>
													<td class="autocut">${p.studentId.qq!""}</td>
													<td class="autocut" >${p.growthId.growthClassName!""}</td>
													<td class="autocut" >${p.growthId.growthClassType.name!""}</td>
													<td class="autocut" >${p.growthId.growthClassTheme!""}</td>
													<td class="autocut" >
														<#if p.growthId.growthClassStatus.code != "SAVED">
															<a href="###" onclick="edit('${p.id}')" title="调整"><i class="icon-edit"></i></i></a>
														</#if>
													</td>
												</tr>
											</#list>
										 </#if> 
	           						</tbody>
								</table>
							</form>	
								<#assign pageTagformId="approveInfoQuery"/>
								<#include "/page.ftl">
	           				</div>
	           			</div>
	           		</div>
		    	</div> 
			</div>
		</div>
	    
	</body>
</html>