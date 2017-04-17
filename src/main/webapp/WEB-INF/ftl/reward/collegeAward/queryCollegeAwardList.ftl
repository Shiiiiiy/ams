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
			
			function del(id){//删除
				comp.confirm("确定要删除数据吗？",function(r){
					if(r){
						window.location.href="${rc.contextPath}/reward/collegeaward/opt-del/delCollegeAward.do?id=" + id;
					}
				});
			}
			
			function add(){
				window.location.href="${rc.contextPath}/reward/collegeaward/opt-add/addCollegeAward.do";
			}
			
			function view(id) {  //查看
				window.open("${rc.contextPath}/reward/collegeaward/opt-view/viewCollegeAward.do?id="+id);
			}
			
			function update(id) {
				window.location.href="${rc.contextPath}/reward/collegeaward/opt-update/updateCollegeAward.do?id="+id;
			}
			function importAward() {
				window.location.href="${rc.contextPath}/reward/collegeaward/importCollegeAward.ftl";
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
		    		<form id="awardQuery" method="post" action="${rc.contextPath}/reward/collegeaward/opt-query/queryCollegeAwardPage.do">
		    			<div class="span12">
		    				<div class="row-fluid">
		    					<div class="span4">
		    				    	<span class="schoolYear">学年</span>
									<select size="1" id="schoolYear" name="schoolYear.code" aria-controls="dt_gal" class="span6 selectoption" >
										<option value="" />请选择..</option>
										<#list schoolYearList as d>
											<#if collegeAward.schoolYear?? && collegeAward.schoolYear.code==d.code>
    					    	            	<option  value="${d.code}" selected="selected">${d.name?html}</option>
    					    	            <#else>
    					    	            	<option  value="${d.code}" >${d.name?html}</option>
    					    	            </#if>
										</#list>
									</select>
		    				    </div>
		    				    <div class="span4">
		    				    	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="schoolYear">学期</span>
									<select size="1" id="schoolTerm" name="schoolTerm.code" aria-controls="dt_gal" class="span6 selectoption" >
										<option value="" />请选择..</option>
										<#list schoolTermList as d>
											<#if collegeAward.schoolTerm?? && collegeAward.schoolTerm.code==d.code>
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
											<#if collegeAward.studentId?? && collegeAward.studentId.college ??&& collegeAward.studentId.college.id==d.id>
    					    	            	<option  value="${d.id}" selected="selected">${d.name?html}</option>
    					    	            <#else>
    					    	            	<option  value="${d.id}" >${d.name?html}</option>
    					    	            </#if>
										</#list>
									</select>
		    				    </div>
		    				</div>
		    				
		    				<div class="row-fluid">
		    				    <div class="span4">
		    				    	<span class="majorName">专业</span>
									<select size="1" id="majorId" name="studentId.major.id" aria-controls="dt_gal" class="span6 selectoption emptySelect" onchange="cascade.changeMajor('majorId','classId');">
										<option value="" />请选择..</option>
										<#if majorList??>
											<#list majorList as d>
												<#if collegeAward.studentId?? && collegeAward.studentId.major?? && collegeAward.studentId.major.id==d.id>
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
									<select size="1" id="classId" name="studentId.classId.id" aria-controls="dt_gal" class="span6 selectoption emptySelect" >
										<option value="" />请选择..</option>
										<#if classList??>
											<#list classList as d>
												<#if collegeAward.studentId?? && collegeAward.studentId.classId ??&& collegeAward.studentId.classId.id==d.id>
	    					    	            	<option  value="${d.id}" selected="selected">${d.className?html}</option>
	    					    	            <#else>
	    					    	            	<option  value="${d.id}" >${d.className?html}</option>
	    					    	            </#if>
											</#list>
										</#if>
									</select>
		    				    </div>
		    				    <div class="span4">
		    				    	<span class="major">姓名</span>
		    				    	<#if collegeAward.studentId ?? && collegeAward.studentId.name??>
										<input id="studentId.name" class="span6" value="${collegeAward.studentId.name!""}" name="studentId.name">
									<#else>
										<input id="studentId.name" class="span6" value="" name="studentId.name">
									</#if>										
		    				    </div>
		    				</div>
		    				<div class="row-fluid">
		    					<div class="span4">
		    				    	<span class="major">学号</span>
		    				    	<#if collegeAward.studentId ?? && collegeAward.studentId.stuNumber??>
										<input id="studentId.stuNumber" class="span6" value="${collegeAward.studentId.stuNumber!""}" name="studentId.stuNumber">
									<#else>
										<input id="studentId.stuNumber" class="span6" value="" name="studentId.stuNumber">
									</#if>										
	    				    	</div>
	    				    	<div class="span4">
		    				    	<span class="major">奖励名称</span>
		    				    	<#if collegeAward.awardName ??>
										<input id="awardName" class="span6" value="${collegeAward.awardName!""}" name="awardName">
									<#else>
										<input id="awardName" class="span6" value="" name="awardName">
									</#if>										
	    				    	</div>
	    				    	<div class="span4">
	    				    		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					              	<button class="btn btn-info" onclick="query()">查 询</button>
					              	<button class="btn btn-info" onclick="comp.clearForm('awardQuery')">清 空</button>
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
	           									<#if user_key.optMap['add']??>
					                            	<button class="btn btn-info" type="button" onclick="add()">新增</button>
					                            </#if>
	           									<#if user_key.optMap['import']??>
					                            	<button class="btn btn-info" type="button" onclick="importAward()">导 入</button>
					                            </#if>
	           								</div>
	           							</div>
	           						</div>
	           					</div>
	           					<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
	           						<thead>
										<tr>
											<th width="5%">序号</th>
											<th width="10%">姓名</th>
											<th width="15%">学号</th>
											<th width="20%">奖励名称</th>
											<th width="10%">学年</th>
											<th width="10%">学期</th>
											<th width="10%">创建人</th>
											<th width="10%">创建日期</th>
											<th width="10%">操作</th>
										</tr>
								</thead>
	           						<tbody>
	           							<#if page??>	
											<#list page.result as p>
												<tr>
													<td class="autocut">${p_index+1}</td>
													<td class="autocut tipTag" data="学院：${(p.studentId.college.name!'')?html}<br/>专业：${(p.studentId.major.majorName!'')?html}<br/>班级：${p.studentId.classId.className!''?html}<br/>">${p.studentId.name!""?html}</td>
													<td class="autocut" >${(p.studentId.stuNumber!"")?html}</td>
													<td class="autocut" >${(p.awardName!"")?html}</td>
													<td class="autocut" >${(p.schoolYear.name!"")?html}</td>
													<td class="autocut" >${(p.schoolTerm.name!"")?html}</td>
													<td class="autocut" >${(p.creator.name!"")?html}</td>
													<td class="autocut" >${p.createTime?string('yyyy-MM-dd')!""?html}</td>
													<td class="autocut">
													<#if user_key.optMap['update']??>
														<a href="###" onclick="update('${p.id}')" title="修改"><i class="icon-edit"></i></a>
													</#if>															
													<#if user_key.optMap['del']??>
														<a href="###" onclick="del('${p.id}')" title="删除"><i class="icon-trash"></i></a>
													</#if>
														<a href="###" onclick="view('${p.id}')" title="查看"><i class="icon-list-alt"></i></a>
													</td>
												</tr>
											</#list>
										 </#if> 
	           						</tbody>
								</table>
								<#assign pageTagformId="awardQuery"/>
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