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
    		<form  id="associationListForm"  action="${rc.contextPath}/association/apply/opt-query/getAssociationApplyList.do" method="post">
				<div class="span12">
					<div class="row-fluid">
						<div class="span4">
						    <span class="formTitle">所属学院</span>
							<div class="span9">
							   <select size="1" id="collegeId" name="college.id" aria-controls="dt_gal" style="cursor:pointer" class="span8">
								<option value="">请选择..</option>
								<#if collegeList ??>
									<#list collegeList as c>
										<#if  aam ?? && aam.college ?? &&  aam.college.id == c.id >
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
							   <select size="1" id="applyTypeId" name="applyTypeDic.id" aria-controls="dt_gal" class="span8">
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
									<select size="1" id="orignAssociationTypeId" name="orignAssociationType.id" aria-controls="dt_gal" style="cursor:pointer" class="span8">
										<option value="">请选择..</option>
										<#if associationTypeDicList ??>
									      <#list associationTypeDicList as g>
											<#if aam.changedAssociationType ?? && aam.changedAssociationType.id == g.id>
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
							    <input id="orignAssociationName" name="orignAssociationName" class="span8" 
							    <#if aam??>value="${(aam.orignAssociationName!"")?html}"</#if> maxlength="200"/>
							</div>
						 </div>
						<div class="span4" style="padding-left:60px;">
				                <button class="btn btn-info"  type="submit">查 询</button>
				                <button class="btn btn-info" type="button" onclick="comp.clearForm('associationListForm')">清 空</button>
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
											<#if user_key.optMap['apply']?? || user_key.optMap['add']?? >
												<button class="btn btn-info" type="button" id="register-button">注 册</button>
											</#if>
											<#if user_key.optMap['apply']??>
												<button class="btn btn-info" type="button" id="modify-button">变 更</button>
												<button class="btn btn-info" type="button" id="cancel-button">注 销</button>
											</#if>
										</#if>
									</div>
								</div>
							</div>
						</div>
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
						<thead>
							<tr>
								<th width="5%">序号</th>
								<th width="10%">所属学院</th>
								<th width="16%">社团名称</th>
								<th width="8%">社团编号</th>
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
									<td><div align="center">${p_index+1}</td>
									<td class="autocut"><#if p.college??>${(p.college.name!"")?html}</#if></td>
									<td class="autocut">
										<#if p.orignAssociationName??>
											<a href="${rc.contextPath}/association/apply/opt-view/viewApply.do?applyId=${p.id}"  target='_blank' class="sepV_a" title="查看">${(p.orignAssociationName!"")?html}</a>
										</#if>
									</td>
									<td class="autocut"><#if p.associationPo??>${(p.associationPo.associationCode!"")?html}</#if></td>
									<td class="autocut">
										<#if p.orignAssociationType??>
											${(p.orignAssociationType.name!"")?html}
										</#if>
									</td>
									<td class="autocut"><#if p.applyTypeDic??>${(p.applyTypeDic.name!"")?html}</#if></td>
									<td class="autocut">${(p.orignManagerName!"")?html}</td>
									<td class="autocut"><#if p.applyTypeDic.id == changeApply.id && p.changedAdvisorName??>${(p.changedAdvisorName!"")?html}<#else>${(p.orignAdvisorName!"")?html}</#if></td>
									<td class="autocut">
										<#if p.processstatus??>${(p.approveresult!"")?html}
										<#else>
											<#if p.operateStatus== managerSave>社长保存</#if>
											<#if isAdvisor == false && p.operateStatus== advisorSave>社长提交</#if>
											<#if isAdvisor == true && p.operateStatus== advisorSave>待指导老师提交</#if>
										</#if>
									</td>
									<td class="autocut">
									<a href="${rc.contextPath}/association/apply/opt-view/viewApply.do?applyId=${p.id}"  target='_blank' class="sepV_a" title="查看"><i class="icon-list-alt"></i></a>
									<#if user_key.optMap??>
										<#if user_key.optMap['update']?? && (p.operateStatus== managerSave|| (p.processstatus ?? && refuseStatus == p.processstatus && isAdvisor == false) )>
											<#if p.applyTypeDic?? && p.applyTypeDic.id = registerApply.id>
												<a href="${rc.contextPath}/association/apply/opt-edit/editAssociationRegister.do?applyId=${(p.id)?html}"  target='_self' class="sepV_a" title="编辑注册申请"><i class="icon-edit"></i></a>
						            		</#if>
						            		<#if p.applyTypeDic?? && p.applyTypeDic.id = changeApply.id>
												<a href="${rc.contextPath}/association/apply/opt-edit/editModifyApply.do?id=${(p.id)?html}"  target='_self' class="sepV_a" title="编辑注册申请"><i class="icon-edit"></i></a>
						            		</#if>
						            		<#if p.applyTypeDic?? && p.applyTypeDic.id = cancelApply.id>
												<a href="${rc.contextPath}/association/apply/opt-edit/editCancelApply.do?applyId=${(p.id)?html}&associationId=<#if p.associationPo??>${(p.associationPo.id!"")?html}</#if>"  target='_self' class="sepV_a" title="编辑注册申请"><i class="icon-edit"></i></a>
						            		</#if>
						            	</#if>
										<#if user_key.optMap['del']?? && p.operateStatus== managerSave>
											<a href="javascript:void(0)"  target='_self' class="sepV_a" title="删除申请" onclick="deleteCurApply('${(p.id)?html}','${(p.applyTypeDic.code!"")?html}')"><i class="icon-trash"></i></a>
						        		</#if>
						        		<#if isAdvisor == true && "SAVE" == p.advisorStatus>
						        			<a href="${rc.contextPath}/association/apply/opt-edit/advisorEditApply.do?id=${(p.id)?html}"  target='_self' class="sepV_a" title="指导老师编辑"><i class="icon-edit"></i></a>
						        		</#if>
						        		
						        	</#if>
						            </td>
								</tr>
							</#list>
							</#if>
						</tbody>
						</table>
						 <#assign pageTagformId="associationListForm"/>
						 <#include "/page.ftl">
					</div>
				</div>
			</div> 
			
		</div> 
	</div>
</div>
<script>
    $(document).ready(function(){
	 	 //注册申请
	 	$("#register-button").click( function () {
	 		window.location.href="${rc.contextPath}/association/apply/opt-add/addAssociationRegister.do";
	 	 });
	 	 
	 	 //变更申请 
	 	$("#modify-button").click( function () {
	 			selectAssociation("MODIFY");
	 	 });
	 	 
	 	 //注销申请 
	 	$("#cancel-button").click( function () {
	 		selectAssociation("CANCEL");
	 	 });
	});
	
	//选择社团
	function selectAssociation(flag){
		try  {
		 		comp.showModal("associationSelectDiv","800px","-250px 0 0 -300px");
		 		$("#memberAssociationList").load("${rc.contextPath}/association/maintain/nsm/getAssociationRadioList.do?applyType="+flag+"&amstimestamp="+Math.random());
	     }catch(exception) {
	     	alert(exception);
	     }
	}
	
	//获取选中的社团信息
	function initSelectedAssociation(){
		var flag=$("#applyType").val();
		var validAssociationArray = $("input[name='selectedAssociation']");
		var selectedAssociation = $("input[name='selectedAssociation']:checked").val();
		if(validAssociationArray.length==0){
			comp.message("权限内暂无有效的社团 !");
		}else if(!comp.isValid(selectedAssociation)){
			comp.message("请选择对应社团 !");
		}else{
			modifyApplyCheck(selectedAssociation,flag);
		}
	}
	
	//校验社团社否完成上次申请
	function modifyApplyCheck(selectedAssociation,flag){
			$.ajax({
				url:"${rc.contextPath}/association/apply/opt-query/isModifyApplyFinish.do",
				async:false,
				cache:false,
				type:"POST",
				data:{associationId:selectedAssociation,applyType:flag},
				success:function(msg){
					var json=jQuery.parseJSON(msg); 
					if('yes'== json.flag){
						if(flag=="MODIFY"){
						
							$("#associationListForm").attr("action","${rc.contextPath}/association/apply/opt-edit/addModifyApply.do?associationId="+selectedAssociation).submit();
						}else if(flag=="CANCEL"){
						
							$("#associationListForm").attr("action","${rc.contextPath}/association/apply/opt-edit/addCancelApply.do?associationId="+selectedAssociation).submit();
						}
					}else if("no"==json.flag){
						comp.message("请先完成本社团上次申请 !","error");
					}else if("error"==json.flag){
						comp.message("系统异常、请联系管理员 !","error");
					}
				}
			});
	}
	
	function deleteCurApply(applyId){
			comp.confirm("确认要删除此申请信息吗？", function(result) {
	            	if(!result)
	            		return; 
			$.ajax({
				url:"${rc.contextPath}/association/apply/opt-delete/deleteApply.do",
				async:false,
				cache:false,
				type:"POST",
				data:{applyId:applyId},
				success:function(data){
					if('success'== data){
						$("#associationListForm").submit();
					}else if("error"== data){
						comp.message("系统异常、请联系管理员 !","error");
					}
				}
			});
		});
	}
</script>
<div class="modal hide fade" id="associationSelectDiv">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3 id="title1">社团选择</h3>
	</div>
	<div class="modal-body" id="memberAssociationList">
		<#include "/association/maintain/queryAssocitionRadio4CurAM.ftl">
	</div>
	<div class="modal-footer">
		<a href="javascript:void(0);" class="btn " data-dismiss="modal">取消</a>
		<a href="javascript:void(0);" class="btn btn-info" onclick="initSelectedAssociation()">确定</a>		
	</div>
</div>
</body>
</html>