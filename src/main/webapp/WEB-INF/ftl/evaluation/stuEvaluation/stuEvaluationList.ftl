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
    		<form  id="evaluationQuery"  action="${rc.contextPath}/evaluation/evaluation/opt-query/queryEvaluationList.do" method="post">
				<div class="span12">			
					<div class="row-fluid">
						<div class="span3">
    				    	<span class="formTitle">学年&nbsp;&nbsp;</span>
    				    	<div class="span8">
								<select size="1" id="year" name="yearId" aria-controls="dt_gal" class="span10 selectoption">
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
    				    </div>
    				    <div class="span9">
    				     	<span class="formTitle">月份&nbsp;&nbsp;</span>
							<span class="formTitle"><#if monthList ?? >
								<#list monthList as c>
										<#if evaluation?? && evaluation.monthId ?? && evaluation.monthId?index_of(c.id)!=-1 >
											<input name="monthId" type="checkbox" value="${c.id}" checked/>${c.name}&nbsp;
										<#else>
											<input name="monthId" type="checkbox" value="${c.id}" />${c.name}&nbsp;
										</#if>
									</#list>
								</#if>
							</span>
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
									<th width="5%">序号</th>
									<th width="8%">姓名</th>
									<th width="10%">学年</th>
									<th width="10%">学期</th>
									<th width="8%">测评月份</th>
									<#--
									<th width="8%">学院</th>
									<th width="8%">专业</th>
									<th width="8%">班级</th>
									-->
									<th width="10%">测评员</th>
									<th width="30%">测评申请起止时间</th>
									<th width="6%">状态</th>
									<th width="8%">操作</th>
								</tr>
							</thead>
							<tbody>
								<#if page??>	
									<#list page.result as p>
										<tr>
											<td>${p_index+1}</td>
											<td class="autocut">${(p.student.name)!""}</td>
											<td class="autocut">${(p.year.name)!""}</td>
											<td class="autocut">${(p.term.name)!""}</td>
											<td class="autocut">${(p.month.name)!""}</td>
											<#--
											<td class="autocut">${(p.student.college.name)!""}</td>
											<td class="autocut">${(p.student.major.majorName)!""}</td>
											<td class="autocut">${(p.student.classId.className)!""}</td>
											-->
											<td class="autocut">${(p.assist.name)!""}</td>
											<td class="autocut">${(p.evaluationTime.addStartTime?string('yyyy-MM-dd'))!""}至${(p.evaluationTime.addEndTime?string('yyyy-MM-dd'))!""}
											</td>
											<!--td class="autocut">${(p.evaluationTime.updateStartTime?string('yyyy-MM-dd'))!""}至${(p.evaluationTime.updateEndTime?string('yyyy-MM-dd'))!""}</td-->
											<td class="autocut">${(p.status.name)!""}</td>
											<td>
											<a href="###" class="sepV_a" title="查看" onclick="viewEvaluationDetailList('${(p.id)!""}')"><i class="icon-list-alt"></i></a>
											<#if p.status.code=='SAVE'>
												<#if user_key.optMap['update']?? >
													<a href="javascript:void(0);" onclick="editEvaluationDetail('${p.id}');"  class="sepV_a" title="修改"><i class="icon-edit"></i></a>
												</#if>
												<#if user_key.optMap['del']??> 
												   <a href="javascript:void(0);" onclick="deleteEvaluation('${p.id}');" class="sepV_a" title="删除"><i class="icon-trash"></i></a>
												</#if>
											</#if>
											<#if p.status.code=='TO_CONFIRMED'>
												<#if (p.evaluationTime.updateStartTime?string('yyyy-MM-dd'))?date("yyyy-MM-dd") lte (currentDate?string('yyyy-MM-dd'))?date("yyyy-MM-dd") &&
													 (p.evaluationTime.updateEndTime?string('yyyy-MM-dd'))?date("yyyy-MM-dd") gte (currentDate?string('yyyy-MM-dd'))?date("yyyy-MM-dd")>
													<a href="javascript:void(0);" onclick="confirmEvaluation('${p.id}');"  class="sepV_a" title="确认"><i class="icon-pencil"></i></a>
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
					</div>
				</div>
			</div> 
		</div> 
	</div>
</div>
<div class="modal hide fade" id="selectMonth">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3 id="title1">选择测评月份</h3>
	</div>
	<div class="modal-body" id="stmp_user">
		<div class="row-fluid">
			<div class="span4">
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
		    
		    <div class="span4">
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
			
			<div class="span4">
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
		<br/>
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
			<a href="###" class="btn btn-info" onclick="addEvaluationDetail()">确定</a>
		</#if>	
	</div>
</div>

<#-- 脚本开始 -->
<script>
	 $(function(){
		getTerm($("#monthId").val());
	});
		
	function query(){//查询
		$("#evaluationQuery").submit();
	}
	
	function addEvaluation(){//新增
		$.post("${rc.contextPath}/evaluation/evaluation/opt-query/checkStudent.do", {}, function(data){
			if(data === "success"){
				comp.showModal("selectMonth","600px","-150px 0 0 -300px");
			}else{
				comp.message("不是学生不能新增综合测评！");
			}
	   },"text");
	}
	
	function addEvaluationDetail(){
		var termId=$('#termId').val();
		if(termId != '' ){
			if($('#monthId').val() != ''){
				var yearId=$('#yearId').val();
				var monthId=$('#monthId').val();
				
				$.post("${rc.contextPath}/evaluation/evaluation/opt-query/checkStuEvaluation.do", {yearId:yearId, termId:termId, monthId:monthId},
	    			function(data){
	    				if(data=="fail"){
							window.location.href="${rc.contextPath}/evaluation/evaluation/opt-add/getEvaluationDetail.do?yearId="+yearId
									+"&termId="+termId+"&monthId="+monthId;
						}else if(data=="success"){
							comp.message("该测评月份已有记录不能再添加！");
						}
	    			}, "text");
			}else{
				comp.message("没有选择测评月份");
			}
		}else{
			comp.message("测评月份没有设置学期，请联系管理员","error");
		}
	}
	
	function viewEvaluationDetailList(id){
		window.open("${rc.contextPath}/evaluation/evaluation/opt-query/queryEvaluationDetail.do?id="+id+"&command=VIEW");
		//window.location.href="${rc.contextPath}/evaluation/evaluation/opt-query/queryEvaluationDetail.do?id="+id+"&command=VIEW";
	}
	
	function editEvaluationDetail(id){
		window.location.href="${rc.contextPath}/evaluation/evaluation/opt-update/editEvaluationInfo.do?id="+id;
	}
	
	function confirmEvaluation(id){
		window.location.href="${rc.contextPath}/evaluation/evaluation/opt-query/queryEvaluationDetail.do?id="+id+"&command=CONFIRM";
	}
	
	function deleteEvaluation(id){
		comp.confirm("确定要删除吗？", function(result) {
        	if(!result)
        		return;  
    		$.post("${rc.contextPath}/evaluation/evaluation/opt-del/deleteEvaluation.do", { id: id }, function(data){
    			if(data === "success"){
    				comp.message("删除成功！","info");
    				$("#evaluationQuery").submit();
    			}
			   },"text");
		}); 
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