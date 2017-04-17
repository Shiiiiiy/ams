

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
   		 
    	<form id="registerQuery"  action="${rc.contextPath}/job/confirm/opt-query/registerApproveList.do" method="post">
			<div class="row-fluid">	
			<div class="span4">
				<span class="formTitle">姓名</span>
			    <input id="stuName" name="stuName" class="span6"  value="${((register.stuName)!'')?html}" />
			 </div>
							
			 <div class="span4">
				<span class="formTitle">学号</span>
				<input id="stuNumber" name="stuNumber" class="span6" value="${((register.stuNumber)!'')?html}"/>
			 </div>
						 
			<div class="span4">
			<span class="formTitle">学年</span>
				<select size="1" id="employmentYear" name="employmentYear.id" aria-controls="dt_gal" class="span6" >
					<option value="" >请选择</option>
					<#if yearList??>
					<#list yearList as y>
						<#if register?? && register.employmentYear?? && register.employmentYear.id == y.id >
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
							<#elseif register?? && register.college?? && register.college.id == c.id >
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
					<#if register?? && register.major?? &&  register.major.id == m.id >
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
		    			<#if register ?? && register.classId?? && register.classId.id == c.id>
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
						<#if register?? && register.status?? && register.status.id == s.id >
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
      			<input type="button" class="btn btn-info"  onclick="comp.clearForm('registerQuery');" value="清 空"/>
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
	                    	<button class="btn btn-info" type="button" onclick="confirmRegister();">通 过</button>
							<button class="btn btn-info" type="button" onclick="rejectRegister();">拒 绝</button>
						</div>
					</div>
				</div>
			</div>
			
			<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
			<thead>
				<th width="5%"><input type="checkbox" name="select_rows" onclick="allChecked(this);"/></th>
				<th width="8%" >姓名</th>
				<th width="11%" >学号</th>
				<th width="10%">学年</th>
				<th width="11%">原编号</th>
				<th width="11%">新编号</th>
				<th width="10%">状态</th>
				<th width="7%">操作</th>
			</thead>
			<#-- 选中的数据项ID -->
			<input type="hidden" id="checkedIds" name="checkedIds" value="">
			<tbody>
			  	<#if page??>	
				<#list page.result as p>
				<tr><td class="autocut">
					<#if p.status?? && p.status.id == submitStatus.id>
					<input name="messageCheck" value="${p.id}" type="checkbox" onclick="selCheckId(this)" />
					</#if>
				</td>
				
				<td class="autocut tipTag" data="学院：${(p.student.college.name)!''}<br/>专业：${(p.student.major.majorName)!''}<br/>班级：${(p.student.classId.className)!''}<br/>">
					<a target="_blank" href="${rc.contextPath}/job/register/opt-view/viewRegisterApprove.do?id=${(p.id)!''}" title="报到证审核信息">${(p.student.name)!""}</td>
				<td class="autocut">${(p.student.stuNumber)!""}</td>
				<td class="autocut">${(p.employmentYear.name)!""}</td>
				<td class="autocut">${(p.registerCode)!""}</td>
				<td class="autocut">${(p.newRegisterCode)!""}</td>
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
						<a href="${rc.contextPath}/job/register/opt-approve/approveSingleRegister.do?id=${p.id}" class="sepV_a" title="报到证审核"><i class="icon-check"></i></a>
					</#if>
					<#if user_key.optMap?? && user_key.optMap['cancel']?? && p.status.code == "PASS">
						<a href="#" onclick="cancelRegister('${(p.id)!""}','${(p.student.name)!""}')" title="撤销"><i class="icon-ban-circle"></i></a>
					</#if>
				</td></tr>
				</#list>
			   	</#if> 
			</tbody>
			</table>
			<#assign pageTagformId="registerQuery"/>
			<#include "/page.ftl">
			</div>
			</div>
	   		</div>
		</div>
		</div>
	
	
		<#-- 发布按钮弹窗 -->
		
		<div class="modal hide fade" id="register_view">
			<div class="modal-header">
				<button class="close" data-dismiss="modal">×</button>
				<h3 id="title1">报到证改派审核</h3>
			</div>
			<div class="modal-body" id="register_view_body">
				
			</div>
			<div class="modal-footer">
				<a href="###" class="btn " data-dismiss="modal">关闭</a>
				<a href="###" class="btn btn-info" onclick="approveRegister()" >确定</a>		
			</div>
		</div>
		
		<#-- 脚本开始 -->
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
			
			function viewAgreement(id){
				comp.showModal("register_view","800px","-250px 0 0 -350px");
				$("#register_view_body").load("${rc.contextPath}/job/register/nsm/viewAgreement.do?id="+id);
			}
			
			function approveRegister(){
				if($("#approveRegister").valid()){
					$("#approveRegister").submit();
				}
			}
			
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
			
		function confirmRegister(){
			var checkedIds = $("#checkedIds").val();
			if(checkedIds=="" || checkedIds==",") {
				comp.message("未选中要通过的学生","error");
				return;
			}
			comp.showModal("register_view","800px","-250px 0 0 -350px");
			$("#register_view_body").load("${rc.contextPath}/job/register/nsm/approveRegister.do?checkdIds="+checkedIds);	
				
		}
		
		
		//撤销
		function cancelRegister(id,name){
			comp.confirm("你确定要撤销申请【"+name+"】报到证编号吗？",function(result){
				if(result){
					$.post(
						"${rc.contextPath}/job/register/opt-cancel/cancelRegister.do",
						{"id":id},
						function(data){
							if(data == "success"){
								window.location.href = "${rc.contextPath}/job/confirm/opt-query/registerApproveList.do";
							}
						},
						"text"
					);
				}
			});
		}
		
			
		function rejectRegister(){
			var checkedIds = $("#checkedIds").val();
			if(checkedIds=="" || checkedIds==",") {
				comp.message("未选中要拒绝的学生","error");
				return;
			}
			comp.confirm("确认要拒绝选中学生的报到证补办申请？",function(result){
				if(!result) 
					return;	
				$.post("${rc.contextPath}/job/register/opt-update/rejectRegister.do", {checkedIds: checkedIds, isConfirm: 'reject'}, 
					function(data){
						if(data == "success"){
							window.location.href="${rc.contextPath}/job/confirm/opt-query/registerApproveList.do";
						}
					},
				"text");
			});
		}
			
		</script>
	</body>
	
</html>