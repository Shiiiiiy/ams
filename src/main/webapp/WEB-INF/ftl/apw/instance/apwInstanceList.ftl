<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- ajax form-->
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
		<script language="javascript" type="text/javascript" src="/productoa/lib/My97DatePicker/WdatePicker.js"></script>
		<!-- sticky messages -->
	    <script src="${rc.contextPath}/lib/sticky/sticky.min.js"></script>

    </head>
    <body>
<div id="contentwrapper">
    <div class="main_content">   
    	   <div class="row-fluid">	
			    		<form  id="apwInstanceQuery"  action="${rc.contextPath}/apw/instance/opt-query/getInstanceList.do" method="post">
							<div class="span12">
								<div class="row-fluid">
									<div class="span8" align="left">
											<button class="btn btn-info" type="button"  onclick="javascript:submitMulProcess('approveProcess','selectedBox')">批量审批</button>
									</div>
									<div class="span4"><input type="hidden" id="selectedBox" name="selectedBox"/></div>
								</div>
							</div>
						</form>
						
						<div class="row-fluid">
						<div class="span12">
						
							<h5 class="heading"></h5>
							<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
							<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
								<thead>
									<tr>
											<th width="4%"><div align="center" valign="center">
												<input type="checkbox" id="totalCheck"  onclick="selectAllbox('totalCheck','approveProcess')"/>
											</div></th>
											<th width="15%" ><div align="center">流程定义</div></th>
											<th width="15%" ><div align="center">发起人</div></th>
											<th width="15%" ><div align="center">发起时间</div></th>
											<th width="15%" ><div align="center">审批人</div></th>
											<th width="15%" ><div align="center">审批状态</div></th>
											<th width="15%" ><div align="center">审批时间</div></th>
											<th width="6%" ><div align="center">操作</div></th>
									</tr>
								</thead>
								<tbody>
								<#if page??>	
									<#list page.result as p>
										<tr>
												<td><div align="center">
													<input type="checkbox"  name="approveProcess" value="${p.objectId!""}"/>
												</div></td>
												<td class="autocut"><div align="center"><#if p.flowDefinePo??>${p.flowDefinePo.processName!""}</#if></div></td>
												<td class="autocut"><div align="center"><#if p.initiator??>${p.initiator.name!""}</#if></div></td>
												<td class="autocut"><div align="center">${((p.submitTime)?string('yyyy-MM-dd'))!""}</div></td>
												<td class="autocut"><div align="center"><#if p.approver??>${p.approver.name!""}</#if></div></td>
												<td class="autocut"><div align="center"><#if p.approveResultDic??>${p.approveResultDic.name!""}</#if></div></td>
												<td class="autocut"><div align="center">${((p.approveTime)?string('yyyy-MM-dd'))!""}</div></td>
												<td class="autocut">
													<i class="icon-pencil" title="单次流程审核" onclick="editProcess('${p.objectId!""}')" style="cursor:pointer" ></i>
												</td>
										</tr>
									</#list>
								 </#if> 
								</tbody>
							</table>
						
						</div>
						 <#assign pageTagformId="apwInstanceQuery"/>
						 <!--用于用户导出 -->
						<input id="pageTotalCount" name="pageTotalCount" type="hidden"  value="${page.totalCount}"/>
						 <#include "/page.ftl">
					</div>
				</div>
				
		</div> 
	</div>
</div>
<script>

		function selectAllbox(mainbox,boxname){
			comp.selectAllCheckbox(mainbox,boxname);
		}
		
		function submitMulProcess(boxname,selectedBox){
			
 			if(!comp.checkboxSelectValidator(boxname)){
 			
				comp.message('请选择要操作的审批流 !');
 			}else{
				comp.getCheckboxValue(boxname,selectedBox);
				var param = $("#selectedBox").val().replace(",","_")
				$.ajax({
						url:"${rc.contextPath}/apw/instance/opt-add/checkNextTaskApprover.do",
						async:false,
						cache:false,
						type:'POST',
						data:{boxes:param},
						success: function(data){
							var parsedJson = jQuery.parseJSON(data); 
							if(parsedJson.resultFlag=="deprecated"){
									$.sticky("审批流已弃用", {autoclose:5000, position:"top-right", type:"st-error"});
							 }else if(parsedJson.resultFlag=='mulApprover') {
							 		comp.message("下一节点有多个办理人，请执行单次审核 !");
							 }else if(parsedJson.resultFlag=='oneApprover' || parsedJson.resultFlag=='singleApprove'){
									editMulProcess();
							 }
					  }
				}); 
 			}
		}
		
		function initProcess(){
			$.ajax({
					url:"${rc.contextPath}/apw/instance/opt-add/initProcess.do",
					async:false,
					cache:false,
					type:'POST',
					data:{},
					success: function(data){
						var parsedJson = jQuery.parseJSON(data); 
						 if(parsedJson.resultFlag=="success") {
							$("#contentwrapper").load("${rc.contextPath}/apw/instance/nsm/getInstanceNsmList.do",{},function(){});
							var approverArray= parsedJson.nextApproverList;
						 	if(approverArray.length>1){
						 		comp.message("下一节点办理人【"+approverArray.length+"】个");
						 	}else if(approverArray.length == 0){
						 		comp.message("下一节点办理人不存在");
						 	}
						 }else if(parsedJson.resultFlag=="error"){
						 		comp.error("系统错误，请联系管理员 !");
						 }
				  }
			}); 
		}

		function editProcess(param){
			$("#apwInstanceQuery").attr("action","${rc.contextPath}/apw/instance/opt-add/editProcess.do?objectId="+param).submit();
		}

		function editMulProcess(){
			$("#apwInstanceQuery").attr("action","${rc.contextPath}/apw/instance/opt-add/editMulProcess.do").submit();
		}
		
		function cleanForm(){
			comp.clearForm("apwInstanceQuery");
		}	
		
		function maodian(){
			$("#apwInstanceQuery").attr("action","${rc.contextPath}/apw/instance/opt-add/maodian.do").submit();
		}
		
</script>
</body>
</html>