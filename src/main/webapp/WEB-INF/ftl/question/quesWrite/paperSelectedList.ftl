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
               <form  id="paperSelectedForm" action="${rc.contextPath}/question/quesWrite/opt-query/paperSelectedQuery.do" method="post">
					<div class="span12">			
							<div class="row-fluid">
								<div class="span4">
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
									<span class="formTitle">问卷类型</span>
									<div class="span8">
									<select size="1" id="typeDic" name="questionInfo.typeDic.id" class="span10" aria-controls="dt_gal">
										<option value="" />请选择..</option>
										<#if qabm?? && qabm.questionInfo?? && qabm.questionInfo.typeDic??>
											<#list typeList as d>
												<#if qabm.questionInfo.typeDic.id==d.id >
													<option  value="${d.id}" selected="selected" />${d.name?html}</option>
												<#else>
													<option value="${d.id}" />${d.name?html}</option>
												</#if>
											</#list>
										<#else>
											<#list typeList as d>
												<option  value="${d.id}"/>${d.name?html}</option>
											</#list>
										</#if>
									</select>
									</div>
								</div>
								<div class="span4">
									<span class="formTitle">提交状态</span>
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
								<#-- 
								<div class="span4">
									<span class="formTitle">启用日期</span>	
									<div class="span7" >
									<#if qabm.questionInfo??>			
									<input type="text" id="beginDate" name="beginDate" value="${(qabm.beginDate!"")?html}" style="cursor:pointer;width: 75px;" 
									class="Wdate"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'stopDate\')}',skin:'whyGreen',el:$dp.$('beginDate')})" style="cursor:pointer"  readOnly/>
									<#else>
									<input type="text" id="beginDate" name="beginDate"  style="cursor:pointer;width: 75px;" 
									class="Wdate"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'stopDate\')}',skin:'whyGreen',el:$dp.$('beginDate')})" style="cursor:pointer"  readOnly/>
									</#if>至
									<#if qabm.questionInfo??>	
									<input type="text" id="stopDate" name="stopDate" value="${(qabm.stopDate!"")?html}" style="cursor:pointer;width: 75px;"
									 class="Wdate"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'beginDate\')}',skin:'whyGreen',el:$dp.$('stopDate')})" style="cursor:pointer" readOnly/> 
									<#else>
									<input type="text" id="stopDate" name="stopDate" style="cursor:pointer;width: 75px;" 
									 class="Wdate"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'beginDate\')}',skin:'whyGreen',el:$dp.$('stopDate')})" style="cursor:pointer" readOnly/> 
									</#if>
									</div>
								</div>-->
						</div></div>
						   <div class="btnCenter">
				             <input type="button" class="btn btn-info" onclick="queryQuestInfo()" value="查 询"/>
				             <input type="button" class="btn btn-info" onclick="cleanForm()" value="清 空"/>
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
							<#include "paperAnswerList.ftl">
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
		//查询
		function queryQuestInfo(){
			$("#paperSelectedForm").submit();
		}	
		
		//清空表单
			function cleanForm(){
				comp.clearForm("paperSelectedForm");
			}	
    	
    	//回答当前问卷
    	function answerCurPaper(id){
    		$("#paperSelectedForm").attr("action","${rc.contextPath}/question/quesWrite/opt-edit/paperEdit.do?paperId="+id).submit();
    	}
    	
    	//查看当前问卷
    	function viewQuestionNaire(id){
    		$("#paperSelectedForm").attr("action","${rc.contextPath}/question/quesWrite/opt-edit/viewCurPaper.do?paperId="+id).submit();
    	}
		
    	//选择问卷
    	function selectQuestionNaire(){
			try  {
			 		comp.showModal("paperSelector","800px","-250px 0 0 -300px");
			 		$("#paperlist").load("${rc.contextPath}/question/quesSelect/nsm/quesSelectQuery.do");
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
	   					$("#contentwrapper").load("${rc.contextPath}/question/quesWrite/nsm/nsmPaperSelectedQuery.do",{},function(){});
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
			$.ajax({
				url:"${rc.contextPath}/question/quesWrite/opt-delete/deleteAnswerPaper.do",
				async:false,
				cache:false,
				type:"POST",
				data:{answerPaperId:objId},
				success:function(msg){
					if('success'== msg){
						comp.message("答卷删除成功 !");
	   					$("#contentwrapper").load("${rc.contextPath}/question/quesWrite/nsm/nsmPaperSelectedQuery.do",{},function(){});
					}else if('error'== msg){
						comp.message("系统报错，请联系管理员 !","error");
					}
				}
			});
		}
    </script>
	<div class="modal hide fade" id="paperSelector">
		<div class="modal-header">
			<button class="close" data-dismiss="modal">×</button>
			<h3 id="title1">问卷选择</h3>
		</div>
		<div class="modal-body" id="paperlist">
			<#include "paperSelectList.ftl">
			<input type="hidden" id="paperSize" value="${paperSize!""}"/>
		</div>
	</div>	
	</body>
</html>