<html>
 <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- jQuery UI theme-->
        <link rel="stylesheet" href="${rc.contextPath}/lib/jquery-ui/css/Aristo/Aristo.css" />
        <script src="${rc.contextPath}/lib/jquery-ui/jquery-ui-1.8.20.custom.min.js"></script>
        <!-- animated progressbars -->
        <script src="${rc.contextPath}/js/bdp_fileupload.progressbar.js"></script>
        <!-- ajax form-->
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
		<!-- bootstrap-fileupload -->	
		<link rel="stylesheet" href="${rc.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.min.css" />
		<style type="text/css">
			.table td,.table th{ border:1px solid #ddd; } 
			.table tbody tr:hover td, .table tbody tr:hover th {background-color:#fff;} 
		</style>
    </head>
<body>
<div id="contentwrapper">
    <div class="main_content">
    <div class="row-fluid">
    	<div class="row-fluid">
	   		 <div class="span12">
		    	<h3 class="heading">
					个人素质测评信息查看
				</h3>
	    	</div>
    	</div>
    	
		<input name="errorText" id="errorText" type="hidden" value="${errorText!""}"/>
		<input id="id" name="id"  type="hidden" value="${evaluation.id!""?html}">
		<table class="table table-bordered tablecut" id="smpl_tbl" >
			<thead>
				<th style="text-align:center;" colspan=${(baseTypeList?size-1)*2+4}>
					${(yearDic.name!"")?html}学年  ${(termDic.name!"")?html} ${student.college.name!""?html}  ${student.major.majorName!""?html}专业  ${student.classId.className!""?html}班  综合素质测评${(monthDic.name!"")?html}记录表
				</th>
			</thead>
			<tbody>
				<tr>
					<td  rowspan=2>姓名</td>
					<td  rowspan=2>学号</td>
					<#list baseTypeList as c>
						<#if c.code=='INTELLECT'>
							<td rowspan=2>${c.name?html}</td>
						<#else>
							<td colspan=2>${c.name?html}</td>
						</#if>
					</#list>
					<!--td rowspan=2>测评总分</td-->
					<td  rowspan=2>状态</td>
				</tr>
				<tr>
					<#list baseTypeList as c>
						<#if c.code=='INTELLECT'>
						<#else>
							<td >加减分事由</td>
							<td >分数</td>
						</#if>
					</#list>
				</tr>
				<tr>
					<td class='sss' rowspan=<#if detailList?size==0>2<#else>${detailList?size/baseTypeList?size+1}</#if>><input id="studentId" name="studentId"  type="hidden" value="${student.id}"/>${student.name!""?html}</td>
					<td class='sss' rowspan=<#if detailList?size==0>2<#else>${detailList?size/baseTypeList?size+1}</#if>>${student.stuNumber!""?html}</td>
					<#if (detailList?size>0)>
						<#assign x=0,y=0>
						<#list detailList as d>
						<#assign x=x+1>
							<#if d.type.code=='INTELLECT'>
							<td>
								<#if (x<=baseTypeList?size)>
									${evaluation.intellectScoreSum!""?html}
								</#if>
									${(d.reason!"")?html}
							</td>
							<#else>
								<td>
									${(d.reason!"")?html}
								</td>
								<td>
									${(d.score!"")?html}
								</td>
							</#if>
							<#if (x%baseTypeList?size)==0>
							<#if y==0>
								<!--td class='sss' rowspan=<#if detailList?size==0>2<#else>${detailList?size/baseTypeList?size+1}</#if>>${evaluation.scoreSum!""?html}</td-->
								<td class='sss' rowspan=<#if detailList?size==0>2<#else>${detailList?size/baseTypeList?size+1}</#if>>${evaluation.status.name!""?html}</td>
							</#if>
								<#if (x+1<detailList?size)>
									</tr>
									<tr>
								</#if>
								<#assign y=y+1>
							</#if>
						</#list>
					<#else>
						<#list baseTypeList as c>
							<#if c.code=='INTELLECT'>
								<td>${evaluation.intellectScoreSum!""?html}</td>
							<#else>
								<td>
								</td>
								<td>
								</td>
							</#if>
						</#list>
						<!--td class='sss' rowspan=<#if detailList?size==0>2<#else>${detailList?size/baseTypeList?size+1}</#if>>${evaluation.scoreSum!""?html}</td-->
						<td class='sss' rowspan=<#if detailList?size==0>2<#else>${detailList?size/baseTypeList?size+1}</#if>>${evaluation.status.name!""?html}</td>
					</#if>
				</tr>
				<tr>
					<#list baseTypeList as c>
						<#if c.code=='INTELLECT'>
							<td ></td>
						<#else>
							<#if c.code=='MORAL'>
								<td >奖惩分</td>
								<td >${evaluation.moralScoreSum!""?html}</td>
							</#if>
							<#if c.code=='CAPACITY'>
								<td >奖惩分</td>
								<td >${evaluation.capacityScoreSum!""?html}</td>
							</#if>
							<#if c.code=='CULTURE'>
								<td >奖惩分</td>
								<td >${evaluation.cultrueScoreSum!""?html}</td>
							</#if>
						</#if>
					</#list>
				</tr>
			</tbody>
		</table>
							
		<div class="span6">
        	<p class="btnMargin">
        		<button class="btn" type="button" onclick="javascript:window.close();">关 闭</button>
			</p>
		</div>
		<input name="check_error" id="check_error" type="hidden" value="true"/>
	</div>
	</div>
</div>
<script>
	function cancel(){
		window.location.href="${rc.contextPath}/evaluation/student/opt-query/queryStudentEvaluationList.do";
	}
 </script>
</body>
</html>
