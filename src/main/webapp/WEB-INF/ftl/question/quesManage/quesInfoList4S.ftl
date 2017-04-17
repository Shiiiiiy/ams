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
               <form  id="quesInfoQuery" action="${rc.contextPath}/question/ques4S/opt-query/quesInfoQuery4S.do" method="post">
					<div class="span12">			
							<div class="row-fluid">
								<div class="span4">
									<span class="formTitle">问卷名称</span>
									 <div class="span8">
										<input id="name" name="name" class="span10" value="${(questionInfo.name)!""}"/>
									</div>
								</div>
								<div class="span4">
									<span class="formTitle">问卷类型</span>
									<div class="span8" >
									<select size="1" id="typeDic" name="typeDic.id"  class="span10" aria-controls="dt_gal">
										<option value="" />请选择..</option>
										<#if questionInfo.typeDic??>
											<#list typeList as d>
												<#if questionInfo.typeDic.id==d.id >
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
									<input type="button" class="btn btn-info" onclick="queryQuestInfo()" value="查 询"/>
		              				<input type="button" class="btn btn-info" onclick="cleanForm()" value="清 空"/>
								</div>
								<#-- 
								<div class="span4">
									<span class="formTitle">问卷状态</span>
									<div class="span8" >
										<select size="1" id="statusDic"   class="span10" name="statusDic.id" aria-controls="dt_gal">
											<option value="" />请选择..</option>
											<#if questionInfo.statusDic??>
												<#list paperList as d>
													<#if questionInfo.statusDic.id==d.id >
														<option  value="${d.id}" selected="selected" />${d.name?html}</option>
													<#else>
														<option value="${d.id}" />${d.name?html}</option>
													</#if>
												</#list>
											<#else>
												<#list paperList as d>
													<option  value="${d.id}"/>${d.name?html}</option>
												</#list>
											</#if>
										</select>
									</div>
								</div>
								
								<div class="span4">
									<span class="formTitle">启用日期</span>		
									<div class="span7" >		
									<input type="text" id="beginDate" name="beginDate" value="${(questionInfo.beginDate!"")?html}" style="cursor:pointer;width: 75px;" 
									class="Wdate"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'stopDate\')}',skin:'whyGreen',el:$dp.$('beginDate')})" style="cursor:pointer"  readOnly/>
									至
									<input type="text" id="stopDate" name="stopDate" value="${(questionInfo.stopDate!"")?html}" style="cursor:pointer;width: 75px;"
									 class="Wdate"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'beginDate\')}',skin:'whyGreen',el:$dp.$('stopDate')})" style="cursor:pointer" readOnly/> 
									</div>
								</div>
								-->
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
								                            <button class="btn btn-info"  onclick="questInfoAdd()">新 增</button>
													</#if>
												</#if>	
								            </div>
								        </div>
								    </div>
							    </div>
							    <div id="questionNaireList">
								 <#include "questionNaireList4s.ftl">
								 <#assign pageTagformId="quesInfoQuery"/>
								 <#include "/page.ftl">
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
				$("#quesInfoQuery").attr("action","${rc.contextPath}/question/ques4S/opt-query/quesInfoQuery4S.do").submit();
			}	
			
		//清空表单
			function cleanForm(){
				comp.clearForm("quesInfoQuery");
			}	
			
		//新增
			function questInfoAdd(){
				$("#quesInfoQuery").attr("action","${rc.contextPath}/question/quesManage/opt-add/quesInfoAdd.do");
				$("#quesInfoQuery").submit();				
			}
			
		//删除
			function delQuesInfo(paperId){
				comp.confirm("确定要删除？",function(r){
					if(r){
						$.ajax({
							url:"${rc.contextPath}/question/quesManage/opt-delete/quesInfoDelete.do",
							async:false,
							cache:false,
							type:"POST",
							data:{paperId:paperId},
							success:function(msg){
								if('success'==msg){
				   					$("#questionNaireList").load("${rc.contextPath}/question/quesManage/nsm/getPaperList.do",{pageNumber:$("#curpageNo").val()},function(){});
								}
							}
						});
					}
				});
			}
			
		//修改问卷信息
			function updateQuesInfo(id){
				$('#quesInfoQuery').attr("action","${rc.contextPath}/question/quesManage/opt-modify/quesInfoModify.do?id="+id);
				$('#quesInfoQuery').submit();
			}
			
		//启用问卷
			function openPapaer(id){
				$.ajax({
					url:"${rc.contextPath}/question/quesManage/opt-modify/openPapaer.do",
					async:false,
					cache:false,
					type:"POST",
					data:{id:id},
					success:function(msg){
						if('success'== msg){
							comp.message("问卷启用成功");
		   					$("#questionNaireList").load("${rc.contextPath}/question/quesManage/nsm/getPaperList.do",{pageNumber:$("#curpageNo").val()},function(){});
						}
					}
				});
			}
			
			//禁用问卷
			function shutdownPaper(id){
				$.ajax({
					url:"${rc.contextPath}/question/quesManage/opt-modify/shutdownPaper.do",
					async:false,
					cache:false,
					type:"POST",
					data:{id:id},
					success:function(msg){
						if('success'== msg){
							comp.message("问卷禁用成功");
	   						$("#questionNaireList").load("${rc.contextPath}/question/quesManage/nsm/getPaperList.do",{pageNumber:$("#curpageNo").val()},function(){});
						}
					}
				});
			}
			
		//查看
			function viewUsers(id){
				$('#quesInfoQuery').attr('action','${rc.contextPath}/question/quesUser/opt-query/queryUserByQuestion.do?queid='+id);
				$('#quesInfoQuery').submit();
			}
</script>
</body>
</html>