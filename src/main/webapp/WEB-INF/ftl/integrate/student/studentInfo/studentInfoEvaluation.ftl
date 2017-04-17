	<form  id="evaluationListForm"  method="post" action="${rc.contextPath}/student/info/nsm/loadStuEvalList.do">
		<input type="hidden" id="studentId" name="studentId" value="${studentInfo.id!""}"/>
    </form>
    <div id="evaluationList" style="overflow-y:hidden">
      <#if page?? && page.result?? && page.result?size&gt;0>	
        <div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
		  <table class="table table-bordered table-striped tablecut" id="smpl_tbl">
			<thead>
				<tr>
				    <th width="7%">序号</th>
					<th width="12%">学年</th>
					<th width="12%">学期</th>
					<th width="11%">测评月份</th>
					<th width="11%">测评人</th>
					<th width="9%">德育总分</th>
					<th width="9%">智育总分</th>
					<th width="9%">文体总分</th>
					<th width="9%">能力总分</th>
					<#-->th width="8%">总分</th-->
					<th width="11%">测评时间</th>
				</tr>
			</thead>
			<tbody>
				<#list page.result as p>
				<tr>		
				    <td>${p_index+1}</td>
					<td class="autocut"><#if p.year ?? >${p.year.name!""?html}</#if></td>
					<td class="autocut"><#if p.term ?? >${p.term.name!""?html}</#if></td>									
					<td class="autocut"><#if p.month ?? >${p.month.name!""?html}</#if></td>
					<td class="autocut"><#if p.assist ?? >${p.assist.name!""?html}</#if></td>
					<td class="autocut">${p.moralScoreSum!""?html}</td>
					<td class="autocut">${p.intellectScoreSum!""?html}</td>
				    <td class="autocut">${p.cultrueScoreSum!""?html}</td>
					<td class="autocut">${p.capacityScoreSum!""?html}</td>									
					<#--td class="autocut">${p.scoreSum!""?html}</td-->
					<td class="autocut"><#if p.evaluationTime?? && p.evaluationTime.addEndTime ?? >${(p.evaluationTime.addEndTime!"")?string("yyyy-MM-dd")}</#if></td>
				</tr>
				</#list>
			</tbody>
		</table>	
		  <#assign pageTagformId="evaluationListForm"  isAjaxForm="true"/>
		  <#include "/page.ftl">
		</div>
		<#else>
		<div class="row-fluid">
			<div class="span12">
		        <span class="f_req">该学生暂无测评信息</span>
		    </div> 
		</div>
		<br/>
		</#if>
		</div>
		
