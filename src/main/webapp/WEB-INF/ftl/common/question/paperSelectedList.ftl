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
               <form  id="paperSelectedForm" action="${rc.contextPath}/common/question${questionType!""}/opt-query/questionPage.do" method="post">
					<div class="span12">			
							<div class="row-fluid">
								<div class="span5">
									<span class="formTitle">问卷名称</span>
									<div class="span8">
									<#if qabm?? && qabm.questionInfo??>
										<input id="name" name="questionInfo.name" class="span10" value="${(qabm.questionInfo.name)!""}"/>
									<#else>
										<input id="name" class="span10" name="questionInfo.name"/>
									</#if>
									</div>
								</div>
								<div class="span4">
									<span class="formTitle">答题状态</span>
									<div class="span8">
									<select size="1" id="answerStatus" class="span10" name="answerStatus.id" aria-controls="dt_gal">
										<option value="" />请选择..</option>
										<#if qabm?? && qabm.answerStatus??>
											<#list answerStatusList as d>
												<#if qabm.answerStatus.id==d.id >
													<option  value="${d.id}" selected="selected" />${d.name?html}</option>
												<#else>
													<option value="${d.id}" />${d.name?html}</option>
												</#if>
											</#list>
										<#else>
											<#list answerStatusList as d>
												<option  value="${d.id}"/>${d.name?html}</option>
											</#list>
										</#if>
									</select>
									</div>
								</div>
								<div class="span2">
									<input type="submit" class="btn btn-info" onclick="queryQuestInfo()" value="查 询"/>
				             		<input type="button" class="btn btn-info" onclick="comp.clearForm('paperSelectedForm')" value="清 空"/>
								</div>
							</div>
						</div>
				   </form>
			 
            	<div class="row-fluid">
					<div class="span12">
					<h5 class="heading"></h5>
					<div role="grid" class="dataTables_wrapper form-inline" id="dt_gal_wrapper">
						<div class="row">
						    <div class="span10">
						        <div class="dt_actions">
						            <div class="row-fluid">
						                <#if user_key.optMap??>
											<#if user_key.optMap['add']??>
						                         <button class="btn btn-info"  onclick="selectQuestionNaire()">选择问卷</button>
											</#if>
										</#if>	
						            </div>
						        </div>
							</div>
						</div>
							
					    <div id="paperAnswerList">
							<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
								<thead>
									<tr>
										<th width="6%">序号</th>
										<th  width="40%">问卷名称</th>
										<th  width="15%">启用日期</th>
										<th  width="15%"> 问卷类型</th>
										<th  width="12%">答题状态</th>
										<th  width="12%">操作</th>
									</tr>
								</thead>
								<tbody>
								<#if page??>	
								<#list page.result as p>
								<tr>
									<td>${p_index+1}</td>
									<td class="autocut">
										<#if p.questionInfo?? && p.questionInfo.name??>
											<a  target="_blank" class="sepV_a" title="查看答卷" href="${rc.contextPath}/common/question/view/viewCurPaper.do?paperId=${p.questionInfo.id}">${(p.questionInfo.name)!""}</a>
										</#if>
									</td>
									<td class="autocut"><#if p.questionInfo?? && p.questionInfo.releaseDate??>${(p.questionInfo.releaseDate)!""}</#if></td>
									<td class="autocut"><#if p.questionInfo?? && p.questionInfo.typeDic??>${(p.questionInfo.typeDic.name)!""}</#if></td>
									<td class="autocut"><#if p.answerStatus??>${(p.answerStatus.name)!""}</#if></td>
									<td>
									<a target="_blank" class="sepV_a" title="查看答卷"  href="${rc.contextPath}/common/question/view/viewCurPaper.do?paperId=${p.questionInfo.id}"><i class="icon-list-alt"></i></a>		
									<#if !p.answerStatus?? || (p.answerStatus?? && p.answerStatus.code=='UNCOMMITED')>
										<a href="javascript:void(0)" class="sepV_a" onClick="answerCurPaper('${p.questionInfo.id}')" title="答题"><i class="icon-edit"></i></a>
										<a href="javascript:void(0)" class="sepV_a" onClick="deleteAnswerPaper('${p.id}')" title="删除答卷"><i class="icon-trash"></i></a>
									</#if>
									</td>
								</tr>
								</#list>
								 </#if> 	
								</tbody>
								</table>
						 	<#assign pageTagformId="paperSelectedForm"/>
						 	<#include "/page.ftl">
						</div>		
												
						</div>
					</div>
				</div>	
									
                </div>
            </div>
       </div>  
    <script>
    	
    	//回答当前问卷
    	function answerCurPaper(id){
    		window.location.href="${rc.contextPath}/common/question/opt-edit/paperEdit.do?questionType=${questionType!''}&paperId="+id;
    	}
    	//选择问卷
    	function selectQuestionNaire(){
			try {
			 		comp.showModal("paperSelector","800px","-250px 0 0 -300px");
			 		$("#paperlist").load("${rc.contextPath}/common/question/nsm/quesSelectQuery.do");
		     }catch(exception) {
		     	alert(exception);
		     }
    	}
    	//初始化选中的问卷
		function initSelectedPaper(){
			var paperId = $("input[name='accessPaper']:checked").val();
			$.ajax({
				url:"${rc.contextPath}/question/quesWrite/opt-edit/initSelectedPaper.do",
				async:false,
				cache:false,
				type:"POST",
				data:{paperId:paperId,paperSize:$("#paperSize").val()},
				success:function(msg){
					if('success'== msg){
	   					$("#paperSelectedForm").submit();
					}else if('error'== msg){
						comp.message("系统报错，请联系管理员 !","error");
					}else if('duplicate'==msg){
						comp.message("问卷已选择、请重新选择 !");
					}else if('null'==msg){
						comp.message("请选择要回答的问卷 !","error");
					}
				}
			});
		}
    	
    	//初始化选中的问卷
		function deleteAnswerPaper(objId){
		
		comp.confirm("确认要删除该调查问卷吗？", function(result) {
        	if(!result)
        		return;  
				$.ajax({
					url:"${rc.contextPath}/question/quesWrite/opt-delete/deleteAnswerPaper.do",
					async:false,
					cache:false,
					type:"POST",
					data:{answerPaperId:objId},
					success:function(msg){
						if('success'== msg){
							comp.message("答卷删除成功 !");
		   					$("#paperSelectedForm").submit();
						}else if('error'== msg){
							comp.message("系统报错，请联系管理员 !","error");
						}
					}
				});
			});
		}
    </script>
	<div class="modal hide fade" id="paperSelector">
		<div class="modal-header">
			<button class="close" data-dismiss="modal">×</button>
			<h3 id="title1">问卷选择</h3>
		</div>
		<div class="modal-body" id="paperlist">
			<input type="hidden" id="paperSize" value="${paperSize!""}"/>
		</div>
		<div class="modal-footer">
			<a href="###" class="btn" data-dismiss="modal">关闭</a>	
			<a href="###" class="btn btn-info" data-dismiss="modal" onclick="initSelectedPaper()">确 定</a>		
		</div>
	</div>	
	</body>
</html>