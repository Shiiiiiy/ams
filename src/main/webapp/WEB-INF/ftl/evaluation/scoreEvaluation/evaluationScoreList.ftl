<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="${rc.contextPath}/css/starSelect.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${rc.contextPath}/js/common/cascadecommon.js"></script>
    </head>
    <body>
		<div id="contentwrapper">
   		<div class="main_content">   
    	   <div class="row-fluid">	
    		<form  id="evaluationQuery"  action="${rc.contextPath}/evaluation/score/opt-query/queryEvaluationList.do" method="post">
				<div class="span12">			
					<div class="row-fluid">
						<div class="span4">
    				    	<span class="term">学年</span>
							<select size="1" id="year" name="yearId" aria-controls="dt_gal" class="span8 selectoption">
								<option value="" />请选择..</option>
								<#list schoolYearList as d>
									<#if evaluation?? && evaluation.yearId ?? && evaluation.yearId==d.id>
				    	            	<option  value="${d.id}" selected="selected">${d.name?html}</option>
				    	            <#else>
				    	            	<option  value="${d.id}" >${d.name?html}</option>
				    	            </#if>
								</#list>
							</select>
    				    </div>
    				    
    				    <!--div class="span4">
    				    	<span class="term">学期</span>
							<select size="1" id="term" name="termId" aria-controls="dt_gal" class="span8 selectoption">
								<option value="" />请选择..</option>
								<#list termList as d>
									<#if evaluation?? && evaluation.termId ?? && evaluation.termId==d.id>
				    	            	<option  value="${d.id}" selected="selected">${d.name?html}</option>
				    	            <#else>
				    	            	<option  value="${d.id}" >${d.name?html}</option>
				    	            </#if>
								</#list>
							</select>
    				    </div-->
		    				    
						<div class="span4">
							<span class="formTitle">&nbsp;&nbsp;&nbsp;学院</span>
							<select size="1" id="collageId" name="collageId" aria-controls="dt_gal" class="span8" onchange="cascade.changeCollage('collageId','majorId','eClassId');" >
								<option value="">请选择..</option>
									<#list collageList as d>
										<#if evaluation?? && evaluation.collageId ?? && evaluation.collageId == d.id >
											<option  value="${d.id}" selected="selected">${d.name?html}</option>
										<#else>
											<option value="${d.id}" >${d.name?html}</option>
										</#if>
									</#list>
							</select>
						 </div>
						 
						 <div class="span4">
							<span class="formTitle">专业</span>
							<select size="1" id="majorId" name="majorId" aria-controls="dt_gal" class="span8 emptySelect"  onchange="cascade.changeMajor('majorId','eClassId');">
								<option value="" >请选择..</option>
								<#if majorList ?? >
									<#list majorList as m>
										<#if evaluation?? && evaluation.majorId ?? && evaluation.majorId== m.id >
											<option value="${m.id}" selected >${m.majorName}</option>
										<#else>
											<option value="${m.id}">${m.majorName}</option>
										</#if>
									</#list>
								</#if>
							</select>
						</div>
					</div>
					
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">班级</span>
							<select size="1" id="eClassId" name="eClassId" aria-controls="dt_gal" class="span8 emptySelect">
								<option value="" >请选择..</option>
								<#if classList ?? >
									<#list classList as c>
										<#if evaluation?? && evaluation.eClassId ?? && evaluation.eClassId == c.id >
											<option value="${c.id}" selected >${c.className}</option>
										<#else>
											<option value="${c.id}">${c.className}</option>
										</#if>
									</#list>
								</#if>
							</select>
						</div>
						
						<div class="span4">
							<span class="formTitle">&nbsp;&nbsp;&nbsp;状态</span>
							<select size="1" id="status.id" name="status.id" aria-controls="dt_gal" class="span8">
								<option value="" >请选择..</option>
								<#if statusList ?? >
									<#list statusList as c>
										<#if evaluation?? && evaluation.status ?? && evaluation.status.id == c.id >
											<option value="${c.id}" selected >${c.name}</option>
										<#else>
											<option value="${c.id}">${c.name}</option>
										</#if>
									</#list>
								</#if>
							</select>
						</div>
						
						<div class="span4">
							<span class="formTitle">姓名</span>
							<input id="student.name" name="student.name" class="span8"  value="<#if evaluation.student??>${evaluation.student.name!""}</#if>" />
						</div>
						
					</div>
					
					<div class="row-fluid">
						<div class="span12">
							<span class="">月份</span>
							<#if monthList ?? >
								<#list monthList as c>
									<#if evaluation?? && evaluation.monthId ?? && evaluation.monthId?index_of(c.id)!=-1 >
										<input name="monthId" type="checkbox" value="${c.id}" checked/>${c.name}&nbsp;
									<#else>
										<input name="monthId" type="checkbox" value="${c.id}" />${c.name}&nbsp;
									</#if>
								</#list>
							</#if>
						</div>
					</div>
					 
		            <div class="btnCenter">
		              <input type="button" class="btn btn-info"  onclick="query();" value="查 询"/>
		              <input type="button" class="btn btn-info"  onclick="comp.clearForm('evaluationQuery')" value="清 空"/>
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
				              				<#if user_key.optMap['export']??>
				            					<input id="exportSize" name="exportSize" class="span2" type="hidden"  value="1000" title="单页导出条数" />
				            					<button class="btn btn-info" type="button" onclick="exportEvaluation()">测评项导出</button>
				              				</#if>
				              				<#if user_key.optMap['import']??>
				            					<button class="btn btn-info" type="button" onclick="importEvaluation()">测评分导入</button>
				            					<!--button class="btn btn-info" type="button" onclick="importHistoryData()">Excel导入历史数据</button-->
				              				</#if>
				              				<#if user_key.optMap['add']??>
												<button class="btn btn-info"  onclick="addEvaluation()">新 增</button>
											</#if>
										</#if>
			              			</div>
			                   </div>
			           		</div>
				        </div>
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl" >
							<thead>
								<tr>
									<th width="6%">序号</th>
									<th width="8%">姓名</th>
									<th width="10%">学号</th>
									<th width="10%">学年</th>
									<th width="10%">学期</th>
									<th width="10%">测评月份</th>
									<#--
									<th width="8%">学院</th>
									<th width="8%">专业</th>
									<th width="8%">班级</th>-->
									<th width="8%">测评员</th>
									<th width="20%">测评确认起止时间</th>
									<th width="10%">状态</th>
									<th width="8%">操作</th>
								</tr>
							</thead>
							<tbody>
								<#if page??>	
									<#list page.result as p>
										<tr>
											<td>${p_index+1}</td>
											<td class="autocut tipTag" data="学院：${(p.student.college.name)!""}<br/>专业：${(p.student.major.majorName)!""}<br/>班级：${(p.student.classId.className)!""}">${(p.student.name)!""}</td>
											<td class="autocut">${(p.student.stuNumber)!""}</td>
											<td class="autocut">${(p.year.name)!""}</td>
											<td class="autocut">${(p.term.name)!""}</td>
											<td class="autocut">${(p.month.name)!""}</td>
											<#--
											<td class="autocut">${(p.student.college.name)!""}</td>
											<td class="autocut">${(p.student.major.majorName)!""}</td>
											<td class="autocut">${(p.student.classId.className)!""}</td>-->
											<td class="autocut">${(p.assist.name)!""}</td>
											<td class="autocut">${(p.evaluationTime.updateStartTime?string('yyyy-MM-dd'))!""}至${(p.evaluationTime.updateEndTime?string('yyyy-MM-dd'))!""}</td>
											<td class="autocut">${(p.status.name)!""}</td>
											<td>
												<#if p.status.code=='TO_CONFIRMED' || p.status.code=='CONFIRMED'>
													<a href="###" class="sepV_a" title="查看" onclick="viewEvaluationDetailList('${(p.id)!""}')"><i class="icon-list-alt"></i></a>
												</#if>
												<#if p.status.code=='SUBMIT' || p.status.code=='TO_CONFIRMED'>
													<#if user_key.optMap['update']?? >
												   		<a href="${rc.contextPath}/evaluation/score/opt-update/editEvaluationInfo.do?id=${p.id}" class="sepV_a" title="测评成绩维护"><i class="icon-edit"></i></a>
													</#if>
												</#if>
											</td>
										</tr>
									</#list>
								 </#if> 
							</tbody>
						</table>
						 <#assign pageTagformId="evaluationQuery"/>
						 <#include "/page.ftl">
						 <input id="pageTotalCount" name="pageTotalCount" type="hidden"  value="${page.totalCount}"/>
					</div>
				</div>
			</div> 
		</div> 
	</div>
</div>
<div class="modal hide fade" id="exportEvaluation">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3 id="title1">测评统计导出</h3>
	</div>
	<div class="modal-body" id="export_evaluation">
		
	</div>
	<div class="modal-footer">
		<a href="#" class="btn" data-dismiss="modal">关闭</a>
	</div>
</div>
<div class="modal hide fade" id="selectMonth">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3 id="title1">选择测评月份</h3>
	</div>
	<div class="modal-body" id="stmp_user">
		<div class="row-fluid">
			<div class="span3">
		    	<span class="term">班级</span>
				<select size="1" id="classId" name="classId" aria-controls="dt_gal" class="span10 selectoption">
					<#list evaluationClassList as d>
    	            	<option  value="${d.id}" >${d.className?html}</option>
					</#list>
				</select>
		    </div>
		
			<div class="span3">
		    	<span class="term">学年</span>
				<select size="1" id="yearId" name="yearId" aria-controls="dt_gal" class="span8 selectoption">
					<#list schoolYearList as d>
						<#if yearDic?? && yearDic.id==d.id>
	    	            	<option  value="${d.id}" selected="selected">${d.name?html}</option>
	    	            <#else>
	    	            	<option  value="${d.id}" >${d.name?html}</option>
	    	            </#if>
					</#list>
				</select>
		    </div>
		    
		    <div class="span3">
		    	<span class="term">学期</span>
		    	<input id="termId" name="termId"  type="hidden" value="">
		    	<input id="termName" name="termName"  type="text" value="" readOnly class="span8">
				<#--select size="1" id="termId" name="termId" aria-controls="dt_gal" class="span8 selectoption">
					<#list termList as d>
						<#if termDic?? && termDic.id==d.id>
	    	            	<option  value="${d.id}" selected="selected">${d.name?html}</option>
	    	            <#else>
	    	            	<option  value="${d.id}" >${d.name?html}</option>
	    	            </#if>
					</#list>
				</select-->
		    </div>
			
			<div class="span3">
				<span class="formTitle">月份</span>
				<select size="1" id="monthId" name="monthId" aria-controls="dt_gal" class="span8" onchange="getTerm(this.value)">
					<#if monthList ?? >
						<#list monthList as m>
							<#list evaluationTimeList as d>
							<#if m.id==d.month.id>
								<option value="${m.id}">${m.name?html}</option>
							</#if>
							</#list>
						</#list>
					</#if>
				</select>
			</div>	    
		</div>
		<#if (evaluationTimeList?size>0) >
			<div class="row-fluid">
				<div class="row-fluid">
					<span class="formTitle">提示：</span>
				</div>
				<div class="row-fluid">
				<#list evaluationTimeList as m>
					<span class="formTitle"></span>
					<div class="span2">${m.month.name?html}起止时间</div><div class="span5">${(m.addStartTime?string('yyyy-MM-dd'))!""} 至 ${(m.addEndTime?string('yyyy-MM-dd'))!""}</div></br>
				</#list>
				</div>
			</div>
		<#else>
			<div  class="row-fluid">现阶段没有可填报的测评月份.</div>
		</#if>	
	</div>
	<div class="modal-footer">
		<a href="#" class="btn" data-dismiss="modal">关闭</a>
		<#if (evaluationTimeList?size>0)>
			<a href="###" class="btn btn-info" onclick="addClassEvaluation()">确定</a>
		</#if>	
	</div>
</div>
<#-- 脚本开始 -->
<script>

	 
    <!--显示提示框-->
	$(function(){
		$('.tipTag').poshytip({
			className: 'tip-yellowsimple',
			alignTo: 'target',
			alignX: 'right',
			alignY: 'center',
			offsetX: -10
		});
	});
	
	 $(function(){
		getTerm($("#monthId").val());
	 });
	
	function query(){//查询
		$("#evaluationQuery").attr("action","${rc.contextPath}/evaluation/score/opt-query/queryEvaluationList.do");
		$("#evaluationQuery").submit();
	}
	
	function viewEvaluationDetailList(id){//查看明细
		window.open("${rc.contextPath}/evaluation/score/opt-query/queryEvaluationDetail.do?id="+id);
		//window.location.href="${rc.contextPath}/evaluation/score/opt-query/queryEvaluationDetail.do?id="+id;
	}
	
	//弹出导出页
	function exportEvaluation(){
		var pageTotalCount= $("#pageTotalCount").val();
		var exportSize= $("#exportSize").val();
		var patrn=/^[0-9]{1,20}$/; 
		if(exportSize==""){
			comp.message("请输入大于0的正整数","error");
		}else if(!patrn.exec(exportSize)){
			comp.message("请输入大于0的正整数","error");
		}else if(exportSize<1){
			comp.message("请输入大于0的正整数","error");
		}else if(exportSize>10000){
			comp.message("请输入小于等于10000的正整数","error");
		}else{
			comp.showModal("exportEvaluation","500px","-250px 0 0 -250px");
			$("#export_evaluation").load("${rc.contextPath}/evaluation/score/opt-query/nsm/exportEvaluationDetailList.do?pageTotalCount="+pageTotalCount+"&exportSize="+exportSize);
		}
	}
	
	//导出
	function exportDate(exportSize,exportPage){
		$("#evaluationQuery").attr("action","${rc.contextPath}/evaluation/score/opt-query/exportEvaluationDetail.do");
		var fo=$("#evaluationQuery");
		if($("#evaluationQuery_exportPage").length==0){
			fo.append($("<input>",{
				id:'evaluationQuery_exportSize',
				type:'hidden',
				name:'evaluationQuery_exportSize',
				val:exportSize
			}));
			fo.append($("<input>",{
				id:'evaluationQuery_exportPage',
				type:'hidden',
				name:'evaluationQuery_exportPage',
				val:exportPage
			}));
		}else{
			$("#evaluationQuery_exportSize").val(exportSize);
			$("#evaluationQuery_exportPage").val(exportPage);
		}
		fo.submit();
	}
	
	function importEvaluation(){
		window.location.href="${rc.contextPath}/evaluation/scoreEvaluation/importEvaluation.ftl";
	}
	
	function importHistoryData(){//历史数据导入
		window.location.href="${rc.contextPath}/evaluation/scoreEvaluation/importHistoryData.ftl";
	}
	
	function addEvaluation(){//新增
		comp.showModal("selectMonth","800px","-150px 0 0 -300px");
	}
	
	function addClassEvaluation(){
		var classId=$('#classId').val();
		var yearId=$('#yearId').val();
		var termId=$('#termId').val();
		var monthId=$('#monthId').val();
		
		if(termId != '' ){
			if(monthId != ''){
				if(classId != ''){
					$.post("${rc.contextPath}/evaluation/evaluation/add/addClassEvaluation.do", {yearId:yearId, termId:termId, monthId:monthId, classId:classId},
		    			function(data){
		    				if(data=="fail"){
								comp.message("添加失败！");
							}else if(data=="success"){
								comp.message("添加成功！");
								//window.location.href="${rc.contextPath}/evaluation/score/opt-query/queryEvaluationList.do";
							}
	    				}, "text");
				}else{
					comp.message("没有选择班级");
				}
			}else{
				comp.message("没有选择测评月份");
			}
		}else{
			comp.message("测评月份没有设置学期，请联系管理员","error");
		}
	}
	
	function getTerm(str){
		$.ajax({
			async : false,
			cache:false,
			type: 'POST',
			dataType : "json",
			url: comp.contextPath()+"/evaluation/baseSet/query/queryEvaluationTermByMonthId.do",
			data:"monthId="+str,
			error: function () {
				/*扩展错误提示 */
				comp.message("\u8BF7\u6C42\u5931\u8D25\uFF0C\u8BF7\u7A0D\u540E\u518D\u8BD5!","error");
			},
			success:function(data){ 
			  $("#termId").val("");
			  $("#termName").val("");
			  $.each(data, function(i,item){
			  		$("#termId").val(item.id);	
			  		$("#termName").val(item.name);	
			  });
			}
		});
	 }
</script>
</body>
</html>