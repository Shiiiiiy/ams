<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <script src="${rc.contextPath}/js/jquery.form.js"></script> 
        <script type="text/javascript" src="${rc.contextPath}/js/common/cascadecommon.js"></script>
        
    </head>
    <body>
		<div id="contentwrapper">
   		<div class="main_content">   
    	   <div class="row-fluid">	
    		<form  id="leagueStatisticQuery"  action="${rc.contextPath}/league/leagueStatistic/opt-query/pageQueryLeagueStatistic.do" method="post">
				<div class="span12">			
					<div class="row-fluid"> 
						 <div class="span4">
							<span class="formTitle">学院</span>
							<select size="1" id="college" name="college.id" <#if teacherOrgId??>disabled class="span6 notClear"</#if>aria-controls="dt_gal" class="span6" onChange="cascade.changeCollage('college', 'majorId');">
								<option value="" >请选择</option>
								<#if collegeList??>
									<#list collegeList as c>
										<#if teacherOrgId?? && c.id==teacherOrgId>
											<option value="${c.id}" selected="selected" >${c.name?html}</option>
										<#elseif statistic?? && statistic.college?? && statistic.college.id?? && c.id==statistic.college.id>
											<option value="${c.id}" selected="selected">${c.name?html}</option>
										<#else>
											<option value="${c.id}">${c.name?html}</option>
										</#if>
									</#list>
								</#if>
							</select>
						</div>
						<div class="span4">
							<span class="formTitle">学年</span>
						    <select size="1" id="honorYear" name="honorYearId" aria-controls="dt_gal" class="span7">
							<option value="">请选择..</option>
							<#if honorYearList ??>
								<#list honorYearList as c>
									<#if honorYearId ?? && honorYearId == c.id >
										<option  value="${c.id}" selected="selected">${c.name!""?html}</option>
									<#else>
										<option value="${c.id}" >${c.name!""?html}</option>
									</#if>
								</#list>
							</#if>
						   </select>
						</div>
						<!--<div class="span4">
							<span class="formTitle">学期</span>
						    <select size="1" id="honorTerm" name="honorTermId" aria-controls="dt_gal" class="span7" >
							<option value="">请选择..</option>
							<#if honorTermList ??>
								<#list honorTermList as c>
									<#if honorTermId?? && honorTermId== c.id >
										<option  value="${c.id}" selected="selected">${c.name!""?html}</option>
									<#else>
										<option value="${c.id}" >${c.name!""?html}</option>
									</#if>
								</#list>
							</#if>
						   </select>
						</div>-->
						<div class="span4">
							<input type="button" class="btn btn-info"  onclick="selectStudentInfo();" value="查 询"/>
				            <input type="button" class="btn btn-info"  onclick="comp.clearForm('leagueStatisticQuery')" value="清 空"/>
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
											 	
					              			<!-- <#if user_key.optMap['add']??>
					              						<div class="input-append">
					            							&nbsp;&nbsp;<button class="btn btn-info" type="button" onclick="exportWorkStudyList()">新 增</button>
					              						</div>
				              				<!-- </#if>	-->
										</#if>	
				                    </div>
				                </div>
				            </div>
				        </div>
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl" >
							<thead>
								<tr>
									<th width="5%">序号</th>
									<th width="11%">学院</th>
									<th width="11%">团员数</th>
									<th width="15%">预备党员数</th>
									<th width="12%">党员数</th>
									<th width="17%">获得荣誉的人数</th>
									<th width="17%">团干培训人数</th>
									<th width="12%">推优人数</th>
								</tr>
							</thead>
							<tbody>
								<#if page??>	
									<#list page.result as p>
										<tr>
											<td class="autocut">${p_index+1}</td>
											<td class="autocut">${(p.college.name)!""}</td>
											<td class="autocut">${(p.membernums)!""}</td>
											<td class="autocut">${(p.probationarynums)!""}</td>
											<td class="autocut">${(p.partynums)!""}</td>
											<td class="autocut">${(p.honurnums)!""}</td>
											<td class="autocut">${(p.trainingnums)!""}</td>
											<td class="autocut">${(p.recommendnums)!""}</td>
										
										</tr>
									</#list>
								 </#if> 
							</tbody>
						</table>
						 <#assign pageTagformId="leagueStatisticQuery"/>
						  <!--用于用户导出 -->
						<input id="pageTotalCount" name="pageTotalCount" type="hidden"  value="${page.totalCount}"/>
						 <#include "/page.ftl">
					</div>
				</div>
			</div> 
		</div> 
	</div>
</div>
<div class="modal hide fade" id="exportdemo">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3 id="title1">导出团员花名册</h3>
	</div>
	<div class="modal-body" id="export_leagueMember">
		
	</div>
	<div class="modal-footer">
		<a href="#" class="btn" data-dismiss="modal">关闭</a>
	</div>
</div>
<#-- 学生按照班级选择单选组件的引入-->
<#include "/comp/student/queryStudentByClassRadioModal.ftl"> 
<#-- 脚本开始 -->
<script>
	
	
	//查询
	function selectStudentInfo(){
	    $("#leagueStatisticQuery").attr("action","${rc.contextPath}/league/leagueStatistic/opt-query/pageQueryLeagueStatistic.do");
		$("#leagueStatisticQuery").submit();
	}
	
	//全选复选框
	jQuery("#_totalSelect").click(function(){
	
		if($("#_totalSelect").attr("checked")) {
			$("input[name='infoCheck']").attr("checked",true);
		}else {
	    	$("input[name='infoCheck']").attr("checked",false);
	    }	
	});
	
	jQuery("input[name='infoCheck']").click(function() {
		$("#_totalSelect").attr("checked",false);
	});
	
	
	
	
</script>
</body>
</html>