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
			.table td,.table th{ border:1px solid #ddd; word-break: break-all;} 
			.table tbody tr:hover td, .table tbody tr:hover th {background-color:#fff;}
		</style>
    </head>
<body>
<div id="contentwrapper">
    <div class="main_content">
    <div class="row-fluid">
    	<div class="row-fluid">
	   		 <div class="span12">
	   		 <#if command=='VIEW'>
	   		 	<h3 class="heading">
					个人素质测评信息查看
				</h3>
	   		 <#else>
	   		 	<h3 class="heading">
					个人素质测评信息确认
				</h3>
	   		 </#if>
		    	
	    	</div>
    	</div>
    	
		<input name="errorText" id="errorText" type="hidden" value="${errorText!""}"/>
		<input id="id" name="id"  type="hidden" value="${evaluation.id!""?html}">
		<table class="table table-bordered" id="smpl_tbl" >
			<thead>
				<#if evaluation.status.code=='TO_CONFIRMED'||evaluation.status.code=='CONFIRMED'>
					<th style="text-align:center;" colspan=${(baseTypeList?size-1)*2+4}>
				<#else>
					<th style="text-align:center;" colspan=${baseTypeList?size+2}>
				</#if>
					${(yearDic.name!"")?html}学年  ${(termDic.name!"")?html} ${student.college.name!""?html}  ${student.major.majorName!""?html}专业  ${student.classId.className!""?html}班  综合素质测评${(monthDic.name!"")?html}记录表
				</th>
			</thead>
			<tbody>
				<tr>
					<td width="7%" rowspan=2>姓名</td>
					<td width="8%" rowspan=2>学号</td>
					<#list baseTypeList as c>
						<#if c.code=='INTELLECT'>
							<td width="8%" rowspan=2>${c.name?html}</td>
						<#else>
							<#if evaluation.status.code=='TO_CONFIRMED'||evaluation.status.code=='CONFIRMED'>
								<td width="23%" colspan=2>${c.name?html}</td>
							<#else>
								<td>${c.name?html}</td>
							</#if>
						</#if>
					</#list>
					<#if evaluation.status.code=='TO_CONFIRMED' ||evaluation.status.code=='CONFIRMED'>
						<!--td width="8%" rowspan=2>测评总分</td-->
						<td width="8%" rowspan=2>状态</td>
					</#if>
				</tr>
				<tr>
					<#list baseTypeList as c>
						<#if c.code=='INTELLECT'>
						<#else>
							<td >加减分事由</td>
							<#if evaluation.status.code=='TO_CONFIRMED'||evaluation.status.code=='CONFIRMED'>
								<td width="6%">分数</td>
							</#if>
						</#if>
					</#list>
				</tr>
				<tr>
					<#if evaluation.status.code=='TO_CONFIRMED'||evaluation.status.code=='CONFIRMED'>
						<td class='sss' rowspan=<#if detailList?size==0>2<#else>${detailList?size/baseTypeList?size+1}</#if>><input id="studentId" name="studentId"  type="hidden" value="${student.id}"/>${student.name!""?html}</td>
						<td class='sss' rowspan=<#if detailList?size==0>2<#else>${detailList?size/baseTypeList?size+1}</#if>>${student.stuNumber!""?html}</td>
					<#else>
						<td class='sss' rowspan=<#if detailList?size==0>1<#else>${detailList?size/baseTypeList?size}</#if>><input id="studentId" name="studentId"  type="hidden" value="${student.id}"/>${student.name!""?html}</td>
						<td class='sss' rowspan=<#if detailList?size==0>1<#else>${detailList?size/baseTypeList?size}</#if>>${student.stuNumber!""?html}</td>
					</#if>
					<#if (detailList?size>0)>
						<!--#list baseTypeList as c-->
						<#assign x=0,y=0>
						<#list detailList as d>
						<#assign x=x+1>
							<#if d.type.code=='INTELLECT'>
								<td>
									<#if (x<=baseTypeList?size)>
										
									</#if>
										${(d.reason!"")?html}
								</td>
							<#else>
								<td>
									<span class="span12">${(d.reason!"")?html}</span>
								</td>
								<#if evaluation.status.code=='TO_CONFIRMED'||evaluation.status.code=='CONFIRMED'>
									<td>
										<span class="span12">${(d.score!"")?html}</span>
									</td>
								</#if>
							</#if>
							<#if (x%baseTypeList?size)==0>
								<#if y==0 && (evaluation.status.code=='TO_CONFIRMED'||evaluation.status.code=='CONFIRMED')>
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
						<!--/#list-->
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
						<#if evaluation.status.code=='TO_CONFIRMED'||evaluation.status.code=='CONFIRMED'>
							<!--td class='sss' rowspan=<#if detailList?size==0>2<#else>${detailList?size/baseTypeList?size+1}</#if>>${evaluation.scoreSum!""?html}</td-->
							<td class='sss' rowspan=<#if detailList?size==0>2<#else>${detailList?size/baseTypeList?size+1}</#if>>${evaluation.status.name!""?html}</td>
						</#if>
					</#if>
				</tr>
				<#if evaluation.status.code=='TO_CONFIRMED'||evaluation.status.code=='CONFIRMED'>
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
				</#if>
			</tbody>
		</table>
							
		<div class="span6">
        	<p class="btnMargin">
        		<#if command=='VIEW'>
        			<button class="btn" type="button" onclick="javascript:window.close();">关 闭</button>
		   		 <#else>
		   		 	<button class="btn btn-info" type="button" onclick="confirmEvaluation('${evaluation.id}');">确 认</button>
		   		 	<button class="btn" type="button" onclick="cancel();">取 消</button>
		   		 </#if>
		    	
        		
			</p>
		</div>
		<input name="check_error" id="check_error" type="hidden" value="true"/>
	</div>
	</div>
</div>
<script>
	function cancel(){
		window.location.href="${rc.contextPath}/evaluation/evaluation/opt-query/queryEvaluationList.do";
	}
	
	function confirmEvaluation(id){
		comp.confirm("提交确认?", function(result) {
        	if(!result)
        		return; 
        	mask.showShade(); 
    		window.location.href="${rc.contextPath}/evaluation/evaluation/opt-update/confirmEvaluation.do?id="+id;
		}); 
	}
 </script>
</body>
</html>
