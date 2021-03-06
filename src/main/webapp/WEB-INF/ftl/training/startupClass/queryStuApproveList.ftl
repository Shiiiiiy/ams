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
				window.location.href="${rc.contextPath}/training/approveclass/opt-edit/editStuApprove.do?id=" + id;
			}
			//查看
			function view(id) {
				window.open("${rc.contextPath}/training/approveclass/opt-view/viewStuApprove.do?id=" + id);
			}
			//点击checkbox按钮 
			function onClickSingleCheckbox(obj)
			{
				var $subBox = $("input[name='stuApplyIds']");
				$("#totalCheck").attr("checked",$subBox.length == $("input[name='stuApplyIds']:checked").length ? true : false);
			}
			//批量调整
			function multyAdjust(){
				var num = $("input[name='stuApplyIds']:checked");
				var stuId = "";
				var flag = true;
				if(num.length > 0){
					num.each(function(i){    //验证所选记录中是否有重复学生，有的时候无法批量调整
						var id = $(this).attr("id");
						if(stuId.indexOf(id) > -1){
							comp.message("所选数据中有重复学生，无法批量调整，请重新选择","info");
							flag = false;
							return;
						}else{
							stuId = stuId + id + ",";
						}
					});
					if(flag){
						$("#multyAdjust").submit();
					}
				}else{
					comp.message("请至少选择一条记录","info");
				}
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
		    		<form id="approveInfoQuery" method="post" action="${rc.contextPath}/training/approveclass/opt-query/queryStuApprovePage.do">
		    				<div class="row-fluid">
		    					<div class="span4">
		    				    	<span class="term">学年</span>
									<select size="1" id="schoolYear" name="growthId.schoolYear.code" aria-controls="dt_gal" class="span6 selectoption">
										<option value="" />请选择..</option>
										<#list schoolYearList as d>
											<#if applyInfo.growthId?? && applyInfo.growthId.schoolYear?? && applyInfo.growthId.schoolYear.code==d.code>
    					    	            	<option  value="${d.code}" selected="selected">${d.name?html}</option>
    					    	            <#else>
    					    	            	<option  value="${d.code}" >${d.name?html}</option>
    					    	            </#if>
										</#list>
									</select>
		    				    </div>
		    				<#-------
		    					<div class="span4">
		    					    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="name">学院</span>
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
		    				    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="majorName">专业</span>
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
		    				</div>
		    		
		    				<div class="row-fluid">
		    					<div class="span4">
	    				    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="className">班级</span>
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
		    				    ---------->
		    				    <div class="span4">
		    				    	<span class="growthClassName">名称</span>
		    				    	<#if applyInfo.growthId?? && applyInfo.growthId.growthClassName??>
		    				    		<input name="growthId.growthClassName" class="span6" value="${applyInfo.growthId.growthClassName}">
		    				    	<#else>
		    				    		<input name="growthId.growthClassName" class="span6" value="">
		    				    	</#if>	
		    				    </div>
		    					<div class="span4">
		    				    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="growthClassType">类型</span>
		    				    	<select size="1" id="growthClassType" name="growthId.growthClassType.code" aria-controls="dt_gal" class="span6 selectoption">
										<option value="" />请选择..</option>
										<#list classTypeList as d>
											<#if applyInfo.growthId?? && applyInfo.growthId.growthClassType?? && applyInfo.growthId.growthClassType.code==d.code>
    					    	            	<option  value="${d.code}" selected="selected">${d.name?html}</option>
    					    	            <#else>
    					    	            	<option  value="${d.code}" >${d.name?html}</option>
    					    	            </#if>
										</#list>
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
		    				    	<span class="growthClassName">学号</span>
		    				    	<#if applyInfo.studentId?? && applyInfo.studentId.stuNumber??>
		    				    		<input name="studentId.stuNumber" class="span6" value="${applyInfo.studentId.stuNumber!""}">
		    				    	<#else>
		    				    		<input name="studentId.stuNumber" class="span6" value="">
		    				    	</#if>	
		    				    </div>
		    					<div class="span4">
		    				    	<span class="approveStatus">审核状态</span>
		    				    	<select size="1" id="approveStatus" name="approveStatus.code" aria-controls="dt_gal" class="span6 selectoption">
										<option value="" />请选择..</option>
										<#list approveStatusList as d>
											<#if applyInfo.approveStatus?? && applyInfo.approveStatus.code==d.code>
    					    	            	<option  value="${d.code}" selected="selected">${d.name?html}</option>
    					    	            <#else>
    					    	            	<option  value="${d.code}" >${d.name?html}</option>
    					    	            </#if>
										</#list>
									</select>
		    				    </div>
		    				</div>
		    				<div class="row-fluid">
			    				<div class="btnCenter">
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
	           									<#if userId??>
	           										<button class="btn btn-info" onclick="multyAdjust()">批量调整</button>
	           									</#if>
	           								</div>
	           							</div>
	           						</div>
	           					</div>
	           				<form id="multyAdjust" method="post" action="${rc.contextPath}/training/approveclass/opt-edit/editMultyAdjust.do">
	           					<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
	           						<thead>
										<tr>
											<th class="table_checkbox" width="5%" >
												<input type="checkbox" id="totalCheck"  onclick="comp.selectAllCheckbox('totalCheck','stuApplyIds')"/>
											</th>
											<th width="7%" >姓名</th>
											<th width="10%" >学号</th>
											<th width="10%">手机</th>
											<th width="8%">邮箱</th>
											<th width="8%">QQ</th>
											<th width="10%" >学年</th>
											<th width="10%" >名称</th>
											<th width="8%" >类型</th>
											<th width="10%" >主题</th>
											<th width="8%" >审核状态</th>
											<th width="8%" >操作</th>
										</tr>
									</thead>
	           						<tbody>
	           							<#if page??>	
											<#list page.result as p>
												<tr>
													<td class="autocut" >
													<#if p.approveStatus.code=='UNAPPROVE' && userId??>
														<input type="checkbox" id="${p.studentId.stuNumber!""}"  name="stuApplyIds" onclick="onClickSingleCheckbox(this);" value="${p.id!""}"/>
													<#else>
													</#if>	
													</td>
													<td class="autocut tipTag" data="学院：${(p.studentId.college.name)!''}<br/>专业：${(p.studentId.major.majorName)!''}<br/>班级：${(p.studentId.classId.className)!''}<br/>">${p.studentId.name!""}</td>
													<td class="autocut" >${p.studentId.stuNumber!""}</td>
													<td class="autocut">${p.studentId.phone1!""}</td>
													<td class="autocut">${p.studentId.email!""}</td>
													<td class="autocut">${p.studentId.qq!""}</td>
													<td class="autocut" >${p.growthId.schoolYear.name!""}</td>
													<td class="autocut" >${p.growthId.growthClassName!""}</td>
													<td class="autocut" >${p.growthId.growthClassType.name!""}</td>
													<td class="autocut" >${p.growthId.growthClassTheme!""}</td>
													<td class="autocut" ><#if p.approveStatus??>${p.approveStatus.name!""}</#if></td>
													<td class="autocut" >
														<#if p.approveStatus.code=='UNAPPROVE' && userId?? && user_key.optMap['approve']??>
															<a href="###" onclick="edit('${p.id}')" title="审核"><i class="icon-edit"></i></i></a>
														</#if>
														<a href="###" onclick="view('${p.id}')" title="查看"><i class="icon-list-alt"></i></a>		
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