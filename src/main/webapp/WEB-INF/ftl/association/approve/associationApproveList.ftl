<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<script src="${rc.contextPath}/js/jquery.form.js"></script>
</head>
<body>
<div id="contentwrapper">
    <div class="main_content">   
    	   <div class="row-fluid">	
    		<form  id="associationApproveForm"  action="${rc.contextPath}/association/approve/opt-query/getAssociationApproveList.do" method="post">
				<div class="span12">
				
					<div class="row-fluid">
						<div class="span4">
						    <span class="formTitle">所属学院</span>
							<div class="span9">
							   <select size="1" id="collegeId" name="associationPo.college.id" aria-controls="dt_gal" style="cursor:pointer" class="span8">
								<option value="">请选择..</option>
								<#if collegeList ??>
									<#list collegeList as c>
										<#if  aam ?? && aam.associationPo??&& aam.associationPo.college ?? &&  aam.associationPo.college.id == c.id >
											<option  value="${c.id}" selected="selected">${c.name?html}</option>
										<#else>
											<option value="${c.id}" >${c.name?html}</option>
										</#if>
									</#list>
								</#if>
							   </select>
							</div>
						 </div>
						 
						<div class="span4">
						    <span class="formTitle">申请类型</span>
							<div class="span9">
							   <select size="1" id="applyId" name="applyTypeDic.id" aria-controls="dt_gal" style="cursor:pointer" class="span8">
								<option value="">请选择..</option>
								<#if applyTypeList ??>
									<#list applyTypeList as c>
										<#if  aam ?? && aam.applyTypeDic ?? &&  aam.applyTypeDic.id == c.id >
											<option  value="${c.id}" selected="selected">${c.name?html}</option>
										<#else>
											<option value="${c.id}" >${c.name?html}</option>
										</#if>
									</#list>
								</#if>
							   </select>
							</div>
						 </div>
						 
						<div class="span4">
						    <span class="formTitle">社团类型</span>
							<div class="span9">
									<select size="1" name="associationPo.associationType.id" aria-controls="dt_gal" style="cursor:pointer" class="span8">
										<option value="">请选择..</option>
										<#if associationTypeDicList ??>
									      <#list associationTypeDicList as g>
											<#if aam.associationPo?? && aam.associationPo.associationType ?? && aam.associationPo.associationType.id == g.id>
													<option  value="${(g.id)?html}" selected="selected">${(g.name)?html}</option>	
												<#else>
													<option value="${(g.id)?html}" >${(g.name)?html}</option>
												</#if>
											</#list>
										</#if>
									</select>
							</div>
						 </div>
					</div>
					
					<div class="row-fluid">
						<div class="span4">
						    <span class="formTitle">社团名称</span>
							<div class="span9">
							    <input id="memberName" name="associationPo.associationName" class="span8" 
							    <#if aam?? && aam.associationPo??>value="${(aam.associationPo.associationName!"")?html}"</#if> maxlength="200"/>
							</div>
						 </div>
						<div class="span4">
						    <span class="formTitle">社团编号</span>
							<div class="span9">
							    <input id="associationCode" name="associationPo.associationCode" class="span8" 
							    <#if aam?? && aam.associationPo??>value="${(aam.associationPo.associationCode!"")?html}"</#if> maxlength="200"/>
							</div>
						 </div>
						<div class="span4" style="padding-left:62px;">
				                <button class="btn btn-info"  type="submit">查 询</button>
				                <button class="btn btn-info" type="button" onclick="comp.clearForm('associationApproveForm')">清 空</button>
						 </div>
					</div>
					
					<div class="row-fluid">
						<div class="span4">
							<input type="hidden" id="selectedBox" name="selectedBox"/>
						</div>
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
							                    <#if user_key.optMap['approve']??>
							                            <button class="btn btn-info" type="button" onclick="submitMulProcess('approveProcess','selectedBox')">批量审批</button>
												</#if>
											</#if>
										</div>
									</div>
								</div>
						</div>
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
							<thead>
								<tr>
									<th width="4%">
										<div align="center" valign="center">
											<input type="checkbox" id="totalCheck"  onclick="selectAllbox('totalCheck','approveProcess')"/>
										</div>
									</th>
									<th width="12%">所属学院</th>
									<th width="8%">社团编号</th>
									<th width="10%">社团名称</th>
									<th width="8%">社团类型</th>
									<th width="8%">申请类型</th>
									<th width="8%">负责人</th>
									<th width="10%">指导老师</th>
									<th width="10%">状态</th>
									<th width="8%">操作</th>
								</tr>
							</thead>
							<tbody>
							<#if page??>	
								<#list page.result as p>
								<tr>
									<td>
										<div align="center">
											<input type="checkbox"  name="approveProcess" value="${p.id!""}"/>
										</div>
									</td>
									<td class="autocut"><#if p.college??>${(p.college.name!"")?html}</#if></td>
									<td class="autocut"><#if p.associationPo??>${(p.associationPo.associationCode!"")?html}</#if></td>
									<td class="autocut">
										<#if p.orignAssociationName??>
											${(p.orignAssociationName!"")?html}
										</#if>
									</td>
									<td class="autocut">
										<#if p.orignAssociationType??>
											${(p.orignAssociationType.name!"")?html}
										</#if>
									</td>
									<td class="autocut"><#if p.applyTypeDic??>${(p.applyTypeDic.name!"")?html}</#if></td>
									<td class="autocut">${(p.orignManagerName!"")?html}</td>
									<td class="autocut"><#if changeApply?? && p.applyTypeDic.id == changeApply.id>${(p.changedAdvisorName!"")?html}<#else>${(p.orignAdvisorName!"")?html}</#if></td>
									<td class="autocut"><#if p.processstatus??>${(p.approveresult!"")?html}</#if></td>
									<td class="autocut">
									<#if user_key.optMap??>
										<#if user_key.optMap['approve']??>
										<a href="${rc.contextPath}/association/approve/opt-edit/editAssociationApprove.do?id=${(p.id)?html}&applyType=<#if p.applyTypeDic??>${(p.applyTypeDic.code!"")?html}</#if>"  target='_self' class="sepV_a" title="修改"><i class="icon-edit"></i></a>
                                    	</#if>
                                	</#if>
                                    </td>
								</tr>
							</#list>
							</#if>
							</tbody>
						</table>
						 <#assign pageTagformId="associationApproveForm"/>
						 <input id="pageTotalCount" name="pageTotalCount" type="hidden"  value="${page.totalCount}"/>
						 <#include "/page.ftl">
					</div>
				</div>
			</div> 
		</div> 
	</div>
</div>
<script>
    $(document).ready(function(){

	});
	
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
					url:"${rc.contextPath}/apw/amsapprove/opt-add/checkNextTaskApprover.do",
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
	
	function editMulProcess(){
		$("#associationApproveForm").attr("action","${rc.contextPath}/association/approve/opt-apporve/getMulAAPage.do").submit();
	}
</script>
</body>
</html>