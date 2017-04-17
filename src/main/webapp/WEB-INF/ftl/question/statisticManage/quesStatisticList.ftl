<!DOCTYPE html>
<html lang="en">
	<title></title>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- ajax form-->
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
		<!--date-->
		<script language="javascript" type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
    </head>
    <body>
        <div id="contentwrapper">
           <div class="main_content">
             <div class="row-fluid">
               <form  id="quesStatisticQuery"  action="${rc.contextPath}/question/statisticManage/opt-query/quesStatisticQuery.do" method="post">
				<div class="span12">			
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">问卷名称</span>
							<div class="span8" >
								<input id="name" name="name" value="${(question.name)!''}"  class="span10"/>
							</div>
						</div>
						<div class="span4">
							<span class="formTitle">问卷类型</span>
							<div class="span8" >
								<select size="1" id="typeDic"  class="span10" name="typeDic.id" aria-controls="dt_gal" >
									<option value="" />请选择..</option>
									<#if question.typeDic??>
										<#list categoryList as d>
											<#if question.typeDic.id==d.id >
												<option  value="${d.id}" selected="selected" />${d.name?html}</option>
											<#else>
												<option value="${d.id}" />${d.name?html}</option>
											</#if>
										</#list>
									<#else>
										<#list categoryList as d>
											<option  value="${d.id}"/>${d.name?html}</option>
										</#list>
									</#if>
								</select>
							</div>
						</div>
						
						<div class="span4"> 
						  <input type="submit" class="btn btn-info"  onclick="queryquestion()" value="查 询"/>
		              <input type="button" class="btn btn-info"  onclick="cleanForm()" value="清 空"/>
		              <#--  
								<span class="formTitle">创建日期</span>
								<div class="span7" >		
								<input type="text" id="beginDate" name="beginDate" value="${(question.beginDate!"")?html}" style="cursor:pointer;width: 75px;" 
								class="Wdate"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'stopDate\')}',skin:'whyGreen',el:$dp.$('beginDate')})" style="cursor:pointer"  readOnly/>
								至
								<input type="text" id="stopDate" name="stopDate" value="${(question.stopDate!"")?html}" style="cursor:pointer;width: 75px;"
								 class="Wdate"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'beginDate\')}',skin:'whyGreen',el:$dp.$('stopDate')})" style="cursor:pointer" readOnly/> 
								</div>	-->		
						</div>					
					</div>
				</div>
			</form>
                	<div class="row-fluid">
						<div class="span12">
						<h5 class="heading"></h5>
							<div role="grid" class="dataTables_wrapper form-inline" id="dt_gal_wrapper">
								<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
									<thead>
										<tr>
											<th width="8%">序号</th>
											<th>问卷名称</th>
											<th>问卷类型</th>
											<th>创建日期</th>
											<th>回答人数</th>
											<th>操作</th>
										</tr>
									</thead>
									<tbody>
									<#if page??>	
									<#list page.result as p>
									<tr>
										<td>${p_index+1}</td>
										<td class="autocut"><a href="###" class="sepV_a" onclick="viewQues('${(p.question.id)!""}')" title="查看" >${(p.question.name)!""}</a></td>
										<td class="autocut">${(p.question.typeDic.name)!""}</td>
										<td class="autocut">${((p.question.createTime)?string('yyyy-MM-dd'))!""}</td>
										<td class="autocut">${(p.answerNum)!""}</td>
										<td>
											<#if user_key.optMap['update']?? || user_key.optMap['del']??>
													<a href="###"  onclick="viewQues('${(p.question.id)!""}')" class="sepV_a" title="查看"><i class="icon-list-alt"></i></a>
													<a href="###"  onclick="statisticQues('${(p.question.id)!""}')" class="sepV_a" title="统计分析"><i class="icon-signal"></i> </a>
											</#if>
										</td>
									</tr>
									</#list>
								 </#if> 	
									</tbody>
								</table>
							 <#assign pageTagformId="quesStatisticQuery"/>
							 <#include "/page.ftl">
							</div>
						</div>
					</div>
					
                </div>
            </div>
           </div>  

		<script>
		
	//清空查询条件	
		function cleanForm(){
		   comp.clearForm('quesStatisticQuery');
		}
	//查询
		function queryquestion(){
			$("#quesStatisticQuery").attr("action","${rc.contextPath}/question/statisticManage/opt-query/quesStatisticQuery.do");
			$("#quesStatisticQuery").submit();
		}
	//查看
		function viewQues(optionId){
			window.location.href="${rc.contextPath}/question/statisticManage/opt-query/quesInfoView.do?id="+optionId;
		}		
	//统计分析
		function statisticQues(questionId){
			$("#quesStatisticQuery").attr("action","${rc.contextPath}/question/statisticManage/opt-query/itemStatisticQuery.do?questionId="+questionId);
			$("#quesStatisticQuery").submit();
		}
	//删除
		function delItem(id,name,ustatusCode){
		 	comp.confirm("删除数据可能会造成系统其他业务功能无法正常使用，确认要删除？", function(result) {
	        	if(!result)
	        		return;  
	    		$.post("${rc.contextPath}/question/itemManage/opt-del/deletequestion.do", { id:id,ustatusCode:ustatusCode}, function(data){
	    			if(data === "success")
	    			{
	    				comp.message(" 删除成功！","info");
	    				$("#quesStatisticQuery").attr("action","${rc.contextPath}/question/itemManage/opt-query/quesStatisticQuery.do");
	 					$("#quesStatisticQuery").submit();		
	    			}
				   },"text");
			});
		}
        </script>
	</body>
</html>