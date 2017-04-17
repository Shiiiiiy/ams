
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<script type="text/javascript" src="${rc.contextPath}/js/common/cascadecommon.js"></script>
        <link rel="stylesheet" href="${rc.contextPath}/css/bdp_comp.css" type="text/css" />
        
        
    </head>
        
	<body>
		<div id="contentwrapper">
		<div class="main_content">  
   		 
    	<form id="agreementQuery" action="${rc.contextPath}/job/approve/opt-query/agreementApproveList.do" method="post">
			<div class="row-fluid">	
			<div class="span4">
				<span class="formTitle">姓名</span>
			    <input id="stuName" name="stuName" class="span6"  value="${((agreement.stuName)!'')?html}" />
			 </div>
							
			 <div class="span4">
				<span class="formTitle">学号</span>
				<input id="stuNumber" name="stuNumber" class="span6" value="${((agreement.stuNumber)!'')?html}"/>
			 </div>
						 
			<div class="span4">
			<span class="formTitle">学年</span>
				<select size="1" id="employmentYear" name="employmentYear.id" aria-controls="dt_gal" class="span6" >
					<option value="" >请选择</option>
					<#if yearList??>
					<#list yearList as y>
						<#if agreement?? && agreement.employmentYear?? && agreement.employmentYear.id == y.id >
							<option value="${y.id}" data-code="${y.code?html}" selected="selected">${y.name?html}</option>
						<#else>
							<option value="${y.id}" data-code="${y.code?html}" >${y.name?html}</option>
						</#if>
					</#list>
					</#if>
				</select>
			</div>
			</div>
					 
			<div class="row-fluid">	 
			<div class="span4">
				<span class="formTitle">学院</span>
				<select size="1" id="collegeId" name="college.id" aria-controls="dt_gal" class="span6" onchange="cascade.changeCollage('collegeId','majorId');" <#if collegeId??> disabled="disabled" </#if> >
					<option value="">请选择..</option>
					<#if collegeList??>
						<#list collegeList as c>
							<#if collegeId?? && collegeId == c.id>
								<option value="${c.id}" data-code="${c.code?html}" selected="selected" >${c.name?html}</option>
							<#elseif agreement?? && agreement.college?? && agreement.college.id == c.id >
								<option value="${c.id}" data-code="${c.code?html}" selected="selected" >${c.name?html}</option>	
							<#else>
								<option value="${c.id}" data-code="${c.code?html}" >${c.name?html}</option>	
							</#if>
						</#list>
					</#if>
				</select>
			</div>
					
			<div class="span4">
			<span class="formTitle">专业</span>
		    <select size="1" id="majorId" name="major.id" aria-controls="dt_gal" class="span6 emptySelect" onchange="cascade.changeMajor('majorId','classId');" >
		    	<option value="" >请选择</option>
		    	<#if majorList ?? >
				<#list majorList as m>
					<#if agreement?? && agreement.major?? &&  agreement.major.id == m.id >
						<option value="${m.id}" selected >${m.majorName}</option>
					<#else>
						<option value="${m.id}">${m.majorName}</option>
					</#if>
				</#list>
			</#if>
		    </select>
			</div>
						
			<div class="span4">
			<span class="formTitle">班级</span>
		    <select size="1" id="classId" name="classId.id" aria-controls="dt_gal" class="span6 emptySelect" >
		    	<option value="" >请选择</option>
		    	<#if classList?? >
		    		<#list classList as c>
		    			<#if agreement ?? && agreement.classId?? && agreement.classId.id == c.id>
		    				<option value="${c.id}" selected = "selected">${c.className}</option>	
		    			<#else>
		    				<option value="${c.id}">${c.className}</option>	
		    			</#if>
		    		</#list>
		    	</#if>
		    </select>
			</div>
			</div>
						
			<div class="row-fluid">	 
			<div class="span4">
			<span class="formTitle">状态</span>
			<select size="1" id="status" name="status.id" aria-controls="dt_gal" class="span6"   >
				<option value="">请选择..</option>
				<#if statusList??>
					<#list statusList as s>
						<#if agreement?? && agreement.status?? && agreement.status.id == s.id >
							<option value="${s.id}" data-code="${s.code?html}" selected="selected" >
								<#if s.id = submitStatus.id>
									待审核
								<#else>
									${s.name?html}
								</#if>
							</option>	
						<#else>
							<option value="${s.id}" data-code="${s.code?html}" >
								<#if s.id = submitStatus.id>
									待审核
								<#else>
									${s.name?html}
								</#if>
							</option>	
						</#if>
					</#list>
				</#if>
			</select>
			</div>
					
			<div class="span4">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          		<input type="submit" class="btn btn-info"  value="查  询"/>
      			<input type="button" class="btn btn-info"  onclick="comp.clearForm('agreementQuery');" value="清 空"/>
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
	                    	<button class="btn btn-info" type="button"  onclick="confirmAgreement();" >
	                    		通 过</button>
							<button class="btn btn-info" type="button" onclick="rejectAgreement();">拒 绝</button>
						</div>
					</div>
				</div>
			</div>
			
			<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
			<thead>
				<th width="5%"><input type="checkbox" name="select_rows" onclick="allChecked(this)"/></th>
				<th width="7%" >姓名</th>
				<th width="11%" >学号</th>
				<th width="10%">学年</th>
				<th width="11%">旧编号</th>
				<th width="11%">新编号</th>
				<th width="7%">状态</th>
				<th width="7%">操作</th>
			</thead>
			<#-- 选中的数据项ID -->
			<input type="hidden" id="checkedIds" name="checkedIds" value="">
			<tbody>
			  	<#if page??>	
				<#list page.result as p>
				<tr>
				<td class="autocut">
					<#if p.status?? && p.status.id == submitStatus.id>
					<input name="messageCheck" value="${p.id}" type="checkbox" onclick="selCheckId(this)" />
					</#if>
				</td>
				<td class="autocut tipTag" data="学院：${(p.student.college.name)!''}<br/>专业：${(p.student.major.majorName)!''}<br/>班级：${(p.student.classId.className)!''}<br/>">
					<a target="_blank" href="${rc.contextPath}/job/agreement/opt-view/viewAgreementApprove.do?id=${(p.id)!''}" title="查看就业协议审核信息">${(p.student.name)!""}</td>
				<td class="autocut">${(p.student.stuNumber)!""}</td>
				<td class="autocut">${(p.employmentYear.name)!""}</td>
				<td class="autocut">${(p.agreementCode)!""}</td>
				<td class="autocut">${(p.newAgreementCode)!""}</td>
				<td class="autocut">
					<#if p.status??>
						<#if p.status.id = submitStatus.id>
							待审核
						<#else>
							${p.status.name!""}
						</#if>
					</#if>
				</td>
				<td class="autocut">
					<#if p.status?? && p.status.id = submitStatus.id>
						<a href="${rc.contextPath}/job/agreement/opt-approve/approveSingleAgreement.do?id=${p.id}" class="sepV_a" title="就业协议审核"><i class="icon-check"></i></a>
					</#if>
					<#if user_key.optMap?? && user_key.optMap['cancel']?? && p.status.code == "PASS">
						<a href="#" onclick="cancelAgreement('${(p.id)!""}','${(p.student.name)!""}')" title="撤销"><i class="icon-ban-circle"></i></a>
					</#if>
				</td>
				</tr>
				</#list>
			   	</#if> 
			</tbody>
			</table>
			<#assign pageTagformId="agreementQuery"/>
			<#include "/page.ftl">
		</div>
		</div>
		</div>
	</div>
	</div>
	
		<#-- 发布按钮弹窗 -->
		
		<div class="modal hide fade" id="agreement_view">
			<div class="modal-header">
				<button class="close" data-dismiss="modal">×</button>
				<h3 id="title1">就业协议书补办审核</h3>
			</div>
			<div class="modal-body" id="agreement_view_body">
			</div>
			<div class="modal-footer">
				<a href="###" class="btn " data-dismiss="modal">关闭</a>
				<a href="###" class="btn btn-info" onclick="approveAgreement()" >确定</a>	
			</div>
		</div>
		
		
		<script>
			
			<!--显示提示框-->
			$(function(){
				$('.tipTag').poshytip({
					className: 'tip-yellowsimple',
					alignTo: 'target',
					alignX: 'right',
					alignY: 'center',
					offsetX: 5
				});
			});
			
			
			function approveAgreement(){
				if($("#approveAgreement").valid()){
					$("#approveAgreement").submit();
				}
			}
		
			function viewAgreement(id){
				comp.showModal("agreement_view","800px","-250px 0 0 -350px");
				$("#agreement_view_body").load("${rc.contextPath}/job/agreement/nsm/viewAgreementInfo.do?id="+id);
			}
			
			//全选
			function allChecked(obj){
				var check = $(obj).is(":checked");
				var checkedIds = "";
				if(check){
					$('input:checkbox[name="messageCheck"]').attr("checked", true);
					$('input:checkbox[name="messageCheck"]').each(function(){
						checkedIds += $(this).val() + ",";
					});
					
					$("#checkedIds").val(checkedIds);
				}else{
					$('input:checkbox[name="messageCheck"]').attr("checked", false);
					$("#checkedIds").val("");
				}
			}
			
			
			//撤销
			function cancelAgreement(id,name){
				comp.confirm("你确定要撤销申请【"+name+"】就业协议编号吗？",function(result){
					if(result){
						$.post(
							"${rc.contextPath}/job/approve/opt-cancel/cancelAgreement.do",
							{"id":id},
							function(data){
								if(data == "success"){
									window.location.href = "${rc.contextPath}/job/approve/opt-query/agreementApproveList.do";
								}
							},
							"text"
						);
					}
				});
			}
			
			
			function selCheckId(obj){
				var check = $(obj).is(":checked");
				var checkedIds = $("#checkedIds").val();
				if(check){
					checkedIds = checkedIds + $(obj).val() + ",";
					$("#checkedIds").val(checkedIds);
				}else{
					$('input:checkbox[name="select_rows"]').attr("checked", false);
					checkedIds = checkedIds.replace($(obj).val()+"," , "");
					$("#checkedIds").val(checkedIds);
				}
			}
			
			function confirmAgreement(){
				var checkedIds = $("#checkedIds").val();
				if(checkedIds=="" || checkedIds==",") {
					comp.message("未选中要通过的学生","error");
					return;
				}
				comp.showModal("agreement_view","800px","-250px 0 0 -350px");
				$("#agreement_view_body").load("${rc.contextPath}/job/agreement/nsm/approveAgreementInfo.do?checkdIds="+checkedIds);	
			}
			
			function rejectAgreement(){

				var checkedIds = $("#checkedIds").val();
				if(checkedIds=="" || checkedIds==",") {
					comp.message("未选中要拒绝的学生","error");
					return;
				}
			
				comp.confirm("确认要拒绝选中学生的就业协议书补办申请？",function(result){
					if(!result) 
						return;
					$.post("${rc.contextPath}/job/agreement/opt-update/rejectAgreement.do", {checkedIds: checkedIds}, 
						function(data){
							if(data == "success"){
								window.location.href="${rc.contextPath}/job/approve/opt-query/agreementApproveList.do";
							}
						},
					"text");
				});
			}
		
		</script>
	</body>
	
</html>