<!DOCTYPE html>
<html lang="en">
	<title></title>
    <head>
        <script src="${rc.contextPath}/js/jquery.form.js"></script>
        <script language="javascript" type="text/javascript" src="/ams/lib/My97DatePicker/WdatePicker.js"></script>
    </head>
    <body>
        <div id="contentwrapper">
           <div class="main_content">
       			<div class="row-fluid">
       				<form  id="quesInfoQuery" action="${rc.contextPath}/question/quesUser/opt-query/queryUserByQuestion.do" method="post">
       					<input type="hidden" id="queid" name="questionNaireId" value="${queid}">
						<div class="span12">			
							<div class="row-fluid">
								<div class="span4" >
									<span class="formTitle" style="margin-left:-25px;">姓名</span>
									 <div class="span8">
										<input id="name" name="name" class="span10" value="${(stu.name)!""}"/>
									</div>
								</div>
								<div class="span4">
									<span class="formTitle">学号</span>
									 <div class="span8">
										<input id="stuNumber" name="stuNumber" class="span10" value="${(stu.stuNumber)!""}"/>
									</div>
								</div>
								<div class="span4">
									<input type="button" class="btn btn-info" onclick="queryQuestInfo()" value="查 询"/>
		              				<input type="button" class="btn btn-info" onclick="cleanForm()" value="清 空"/>
								</div>
							</div>
						</div>
					</form>
				
                	<div class="row-fluid">
						<div class="span12">
							<h5 class="heading"></h5>
							<div role="grid" class="dataTables_wrapper form-inline" id="dt_gal_wrapper">
							    <div id="questionNaireList">
									<div role="grid" class="dataTables_wrapper form-inline" id="dt_gal_wrapper">
										<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
											<thead>
												<tr>
													<th width="6%">序号</th>
													<th width="10%">姓名</th>
													<th width="8%">性别</th>
													<th width="16%">学号</th>
													<th width="18%">班级</th>
													<th width="16%">专业</th>
													<th width="16%">学院</th>
													<th width="10%">操作</th>
												</tr>
											</thead>
											<tbody>
											<#if page?? && page.result?? && page.result?size&gt;0>	
										<#list page.result as p>
											<tr>
												<td>${p_index+1}</td>
												<td class="autocut">${p[0]!""?html}</td>
												<td class="autocut">${p[1]!""?html}</td>
												<td class="autocut">${p[2]!""?html}</td>
												<td class="autocut">${p[3]!""?html}</td>
												<td class="autocut">${p[4]!""?html}</td>
												<td class="autocut">${p[5]!""?html}</td>
												<td class="autocut">
													<a href="javascript:void(0)" onclick="viewQues('${p[6]}')" class="sepV_a" title="查看"><i class="icon-list-alt"></i></a>
												</td>
											</tr>
											</#list>
											</#if> 
											</tbody>
										</table>
									 	 <#assign pageTagformId="quesInfoQuery"/>
								 		 <#include "/page.ftl">
									</div>
								 	
								 <input type="hidden" id="curpageNo" value="${curpageNo!""}"/>
								</div>
							</div>
						</div>		
					</div>
				</div>
        </div>
   </div>  
<script>
		//查询
		function queryQuestInfo(){
			$("#quesInfoQuery").attr("action","${rc.contextPath}/question/quesUser/opt-query/queryUserByQuestion.do?queid="+$("#queid").val()).submit();
		}	
			
		//清空表单
		function cleanForm(){
			comp.clearForm("quesInfoQuery");
		}	
			
		
		function viewQues(id){
			$('#quesInfoQuery').attr('action','${rc.contextPath}/question/ques/opt-query/toQuestionAnswerShow.do?userId='+id+"&paperId="+$("#queid").val());
			$('#quesInfoQuery').submit();
		}	
</script>
</body>
</html>