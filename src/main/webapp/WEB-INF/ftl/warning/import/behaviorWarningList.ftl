<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- ajax form-->
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
		<script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
		<script>
			
			$(function(){
				$('.tipTag').poshytip({
					className: 'tip-yellowsimple',
					alignTo: 'target',
					alignX: 'right',
					alignY: 'center',
					offsetX: 5
				});
			});
			
			function query(){//查询
				$("#awardQuery").submit();
			}
			
			//点击checkbox按钮 
			function onClickSingleCheckbox(obj)
			{
				var $subBox = $("input[name='behaviorWarningId']");
				$("#totalCheck").attr("checked",$subBox.length == $("input[name='behaviorWarningId']:checked").length ? true : false);
			}
	
			function deleteBehavior()
			{
				var $subBox = $("input[name='behaviorWarningId']");
				var len =  $("input[name='behaviorWarningId']:checked").length ;
				if(len >0)
				{
					comp.confirm("删除选中的行为预警信息，系统将不再保存和备份，确认要删除吗？", function(result) {
		            	if(!result)
		            		return;  
		         		$.ajax({
							url: "${rc.contextPath}/warning/import/opt-del/deleteWarningBehavior.do",
							async:false,
							cache:false,
							type:"POST",
							data:$('#behaviorDelete').serialize(),
						    success: function(data){
								if(data == "success"){
							       $("#behaviorQuery").submit();
							    }else{
							    	$.sticky("行为预警信息删除失败", {autoclose:5000, position:"top-right", type:"st-error"});
							    	return;
							    }
							}
					   });
		
					}); 
				}
				else
				{
					comp.message("请选择要删除的行为预警信息!","info");
				}
			}
			
			function importBehavior() {
				window.location.href="${rc.contextPath}/warning/import/importWarningBehavior.ftl";
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
		    		<form id="behaviorQuery" method="post" action="${rc.contextPath}/warning/importBEHAVIOR/opt-query/queryBehaviorPage.do">
		    			<div class="span12">
		    				<div class="row-fluid">
		    					 <div class="span4">
		    					    <span class="name">学院</span>
		    					    <select size="1" id="collegeId" name="student.college.id" aria-controls="dt_gal" class="span6 selectoption" onchange="cascade.changeCollage('collegeId','majorId','classId');">
										<option value="" />请选择..</option>
										<#list academyList as d>
											<#if behavior.student?? && behavior.student.college ??&& behavior.student.college.id==d.id>
    					    	            	<option  value="${d.id}" selected="selected">${d.name?html}</option>
    					    	            <#else>
    					    	            	<option  value="${d.id}" >${d.name?html}</option>
    					    	            </#if>
										</#list>
									</select>
		    				    </div>
		    				    
		    				    <div class="span4">
		    				    	<span class="majorName">专业</span>
									<select size="1" id="majorId" name="student.major.id" aria-controls="dt_gal" class="span6 selectoption emptySelect" onchange="cascade.changeMajor('majorId','classId');">
										<option value="" />请选择..</option>
										<#if majorList??>
											<#list majorList as d>
												<#if behavior.student?? && behavior.student.major?? && behavior.student.major.id==d.id>
	    					    	            	<option  value="${d.id}" selected="selected">${d.majorName?html}</option>
	    					    	            <#else>
	    					    	            	<option  value="${d.id}" >${d.majorName?html}</option>
	    					    	            </#if>
											</#list>
										</#if>
									</select>
		    				    </div>
		    				    
		    				    <div class="span4">
		    				    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="className">班级</span>
									<select size="1" id="classId" name="student.classId.id" aria-controls="dt_gal" class="span6 selectoption emptySelect" >
										<option value="" />请选择..</option>
										<#if classList??>
											<#list classList as d>
												<#if behavior.student?? && behavior.student.classId ??&& behavior.student.classId.id==d.id>
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
		    				    	<span class="major">姓名</span>
		    				    	<#if behavior.student ?? && behavior.student.name??>
										<input id="student.name" class="span6" value="${behavior.student.name!""}" name="student.name">
									<#else>
										<input id="student.name" class="span6" value="" name="student.name">
									</#if>										
		    				    </div>
		    				    <div class="span4">
		    				    	<span class="major">学号</span>
		    				    	<#if behavior.student ?? && behavior.student.stuNumber??>
										<input id="student.stuNumber" class="span6" value="${behavior.student.stuNumber!""}" name="student.stuNumber">
									<#else>
										<input id="student.stuNumber" class="span6" value="" name="student.stuNumber">
									</#if>										
	    				    	</div>
	    				    	<div class="span4">
	    				    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					              	<button class="btn btn-info" onclick="query()">查 询</button>
					              	<button class="btn btn-info" onclick="comp.clearForm('behaviorQuery')">清 空</button>
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
	           									<#if user_key.optMap['import']??>
					                            	<button class="btn btn-info" type="button" onclick="importBehavior()">导 入</button>
					                            </#if>
					                            <#if user_key.optMap['del']??>
												<button class="btn btn-info" type="button"  onclick="deleteBehavior();">删 除</button>
												</#if>
	           								</div>
	           							</div>
	           						</div>
	           					</div>
	           					<form  id="behaviorDelete"  action="" method="post">
	           					<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
	           						<thead>
										<tr>
											<th width="5%">
												<#if user_key.optMap??>
													<#if user_key.optMap['del']??>
														<input type="checkbox" id="totalCheck"  onclick="comp.selectAllCheckbox('totalCheck','behaviorWarningId')"/>
													<#else>
														序号
													</#if>
												 </#if> 
											</th>
											<th width="10%">姓名</th>
											<th width="10%">学号</th>
											<th width="10%">日期</th>
											<th width="10%">时间</th>
											<th width="15%">位置</th>
											<th width="20%">事件描述</th>
											<th width="20%">备注</th>
										</tr>
								</thead>
	           						<tbody>
	           							<#if page??>	
											<#list page.result as p>
												<tr>
													<td class="autocut">
														<#if user_key.optMap??>
															<#if user_key.optMap['del']??>
																<input type="checkbox"  name="behaviorWarningId" onclick="onClickSingleCheckbox(this);" value="${p.id!""}"/>
															<#else> 
																${p_index+1}
															</#if>
														 </#if>
													</td>
													<td class="autocut tipTag" data="学院：${(p.student.college.name!'')?html}<br/>专业：${(p.student.major.majorName!'')?html}<br/>班级：${p.student.classId.className!''?html}<br/>">${p.student.name!""?html}</td>
													<td class="autocut" >${(p.student.stuNumber!"")?html}</td>
													<td class="autocut" >${(p.warningDate?string('yyyy-MM-dd')!"")?html}</td>
													<td class="autocut" >${(p.warningTime!"")?html}</td>
													<td class="autocut" >${(p.warningLocation!"")?html}</td>
													<td class="autocut" >${(p.warningInfo!"")?html}</td>
													<td class="autocut" >${p.comments!""?html}</td>
												</tr>
											</#list>
										 </#if> 
	           						</tbody>
								</table>
								</form>
								<#assign pageTagformId="behaviorQuery"/>
								<#include "/page.ftl">
	           				</div>
	           			</div>
	           		</div>
		    	</div> 
			</div>
		</div>
		</div>
		
		
	           		
	           		
	</body>
</html>