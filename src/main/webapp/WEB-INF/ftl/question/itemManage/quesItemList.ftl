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
               <form  id="quesItemQuery"  action="${rc.contextPath}/question/itemManage/opt-query/quesItemQuery.do" method="post">
				<div class="span12">			
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">题目名称</span>
							<div class="span8">
								<input id="itemName" class="span10" name="itemName" value="${(quesItem.itemName)!''}"/>
							</div>
						</div>
						<div class="span4">
							<span class="formTitle">题目题型</span>
							<div class="span8" >
								<select size="1" id="itemType" name="itemType.id"  class="span10" aria-controls="dt_gal" >
									<option value="" />请选择..</option>
									<#if quesItem.itemType??>
										<#list itemTypeList as d>
											<#if quesItem.itemType.id==d.id >
												<option  value="${d.id}" selected="selected" />${d.name?html}</option>
											<#else>
												<option value="${d.id}" />${d.name?html}</option>
											</#if>
										</#list>
									<#else>
										<#list itemTypeList as d>
											<option  value="${d.id}"/>${d.name?html}</option>
										</#list>
									</#if>
								</select>
							</div>
						</div>
						<div class="span4">
							<span class="formTitle">题目状态</span>
							<div class="span8" >
								<select size="1" id="useStatus" class="span10" name="useStatus.id" aria-controls="dt_gal" >
									<option value="" />请选择..</option>
									<#if quesItem.useStatus??>
										<#list useStatusList as d>
											<#if quesItem.useStatus.id==d.id >
												<option  value="${d.id}" selected="selected" />${d.name?html}</option>
											<#else>
												<option value="${d.id}" />${d.name?html}</option>
											</#if>
										</#list>
									<#else>
										<#list useStatusList as d>
											<option  value="${d.id}"/>${d.name?html}</option>
										</#list>
									</#if>
								</select>
							</div>
						</div>			
						<#-- 
						<div class="span5">
								<span class="formTitle">创建日期</span>
								<div class="span6" style="display:in-line" >		
								<input type="text" id="beginTime" name="beginTime" value="${(quesItem.beginTime!"")?html}" style="cursor:pointer;width: 75px;" 
								class="Wdate"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'endTime\')}',skin:'whyGreen',el:$dp.$('beginTime')})" style="cursor:pointer"  readOnly/>
								至
								<input type="text" id="endTime" name="endTime" value="${(quesItem.endTime!"")?html}" style="cursor:pointer;width: 75px;"
								 class="Wdate"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'beginTime\')}',skin:'whyGreen',el:$dp.$('endTime')})" style="cursor:pointer" readOnly/> 
								</div>									
						</div>	-->					
					</div>
					
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">题目类别</span>
							<div class="span8" >
								<select size="1" id="itemCategory" class="span10" name="itemCategory.id" aria-controls="dt_gal" >
									<option value="" />请选择..</option>
									<#if quesItem.itemCategory??>
										<#list categoryList as d>
											<#if quesItem.itemCategory.id==d.id >
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
						<div class="span4" style="padding-left:60px;">
							<input type="submit" class="btn btn-info"  onclick="queryQuesItem()" value="查 询"/>
		              		<input type="button" class="btn btn-info"  onclick="cleanForm()" value="清 空"/>
						</div>	
						
					</div>
		            <div class="btnCenter">
		            
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
								                            <button class="btn btn-info" type="button"  onclick="javascript:add()">
								                               		 新 增
								                            </button>
													</#if>
												</#if>	
						                    </div>
						                </div>
						            </div>
						        </div>
								<div id="nsmItem">
									<#include "nsmItemList.ftl">
								</div>
							 <#assign pageTagformId="quesItemQuery"/>
							 <#include "/page.ftl">
							 <input type="hidden" id="curpageNo" value="${curpageNo!""}"/>
							</div>
						</div>
					</div>
					
                </div>
            </div>
           </div>  

		<script>
		
			//改变启用、禁用状态
				function changeStatus(itemId,ustatus){
				    $.post("${rc.contextPath}/question/itemManage/opt-edit/changeStatus.do",{id:itemId,ustatus:ustatus},function(data){
						if(data == "success")
						{
							comp.message(" 状态修改成功！","info");
							$("#nsmItem").load("${rc.contextPath}/question/itemManage/nsm/quesItemQuery.do",{pageNumber:$("#curpageNo").val()},function(){});	
						}
						if(data == "notEnough"){
							comp.message("  请新增选项后再启用该题目！","error");
							return;
						}
					  },"text");
				}
			//查询
				function queryQuesItem(){
					$("#quesItemQuery").attr("action","${rc.contextPath}/question/itemManage/opt-query/quesItemQuery.do");
					$("#quesItemQuery").submit();
				}
			//新增
		        function add(){
					window.location.href="${rc.contextPath}/question/itemManage/opt-add/addQuesItem.do";
				}
			//编辑
				function editItem(id){
					window.location.href="${rc.contextPath}/question/itemManage/opt-edit/editQuesItem.do?id="+id;
				}
			//删除
				function delItem(id,name,ustatusCode){
				
				 	comp.confirm("删除数据可能会造成系统其他业务功能无法正常使用，确认要删除？", function(result) {
			        	if(!result)
			        		return;  
			    		$.post("${rc.contextPath}/question/itemManage/opt-del/deleteQuesItem.do", { id:id,ustatusCode:ustatusCode}, function(data){
			    			if(data === "success")
			    			{
			    				comp.message(" 删除成功！","info");
								$("#nsmItem").load("${rc.contextPath}/question/itemManage/nsm/quesItemQuery.do",{pageNumber:$("#curpageNo").val()},function(){});
			    			}
						   },"text");
					});
				}
			//清空查询条件	
				function cleanForm(){
				   comp.clearForm('quesItemQuery');
				}
        </script>
	</body>
</html>