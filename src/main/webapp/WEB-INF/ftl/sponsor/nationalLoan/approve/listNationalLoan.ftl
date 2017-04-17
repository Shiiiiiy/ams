<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- ajax form-->
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
		<script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
		
    </head>
    <body>

	<div id="contentwrapper">
		<div class="main_content">  
	    	<form id="nationalLoanQuery" action="${rc.contextPath}/sponsor/approve/opt-query/nationalLoanList.do" method="post">
    			<div class="row-fluid">
    				<div class="span4">
						<span class="formTitle">姓名</span>
				   		<input id="name" name="studentInfo.name" class="span6"  value="${((nationalLoan.studentInfo.name)!'')?html}" />
				 	</div>
    				<div class="span4">
						<span class="formTitle">学号</span>
						<input id="stuNumber" name="studentInfo.stuNumber" class="span6" value="${((nationalLoan.studentInfo.stuNumber)!'')?html}" />
				 	</div>
    				<div class="span4">
						<span class="formTitle">学年</span>
							<select size="1" id="loanYear" name="loanYear.id" aria-controls="dt_gal" class="span6" >
								<option value="" >请选择</option>
								<#if yearList??>
								<#list yearList as y>
									<#if nationalLoan?? && nationalLoan.loanYear?? && nationalLoan.loanYear.id == y.id >
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
				    	<select size="1" id="collegeId" name="studentInfo.college.id" aria-controls="dt_gal" class="span6" onchange="cascade.changeCollage('collegeId','majorId');" >
							<option value="">请选择..</option>
							<#if collegeList??>
								<#list collegeList as c>
									<#if nationalLoan?? && nationalLoan.studentInfo?? && nationalLoan.studentInfo.college?? && nationalLoan.studentInfo.college.id == c.id >
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
				    	<select size="1" id="majorId" name="studentInfo.major.id" aria-controls="dt_gal" class="span6 emptySelect" onchange="cascade.changeMajor('majorId','classId');" >
				    		<option value="" >请选择</option>
				    		<#if majorList ?? >
								<#list majorList as m>
									<#if nationalLoan?? && nationalLoan.studentInfo?? && nationalLoan.studentInfo.major?? &&  nationalLoan.studentInfo.major.id == m.id >
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
					    <select size="1" id="classId" name="studentInfo.classId.id" aria-controls="dt_gal" class="span6 emptySelect" >
						<option value="" >请选择</option>
						<#if classList ?? >
							<#list classList as c>
								<#if nationalLoan?? && nationalLoan.studentInfo?? && nationalLoan.studentInfo.classId?? && nationalLoan.studentInfo.classId.id == c.id >
									<option value="${c.id}" selected >${c.className}</option>
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
									<#if saveStatus?? && saveStatus.id == s.id>
									
									<#elseif nationalLoan?? && nationalLoan.status?? && nationalLoan.status.id == s.id >
										<option value="${s.id}" data-code="${s.code?html}" selected="selected" >${s.name?html}</option>	
									<#else>
										<option value="${s.id}" data-code="${s.code?html}" >${s.name?html}</option>	
									</#if>
								</#list>
							</#if>
						</select>
					</div>
				
					<div class="span4">
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	              		<input type="submit" class="btn btn-info"  value="查 询"/>
              			<input type="button" class="btn btn-info"  onclick="comp.clearForm('nationalLoanQuery');" value="清 空"/>
           			</div>
           		</div>
			</form>
           		
         	<div class="row-fluid">
           		<h5 class="heading"></h5>
           			<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
           				<div class="row">
           					<div class="span10">
           						<div class="dt_actions">
           							<div class="row-fluid">
				                    	<button class="btn btn-info" type="button" onclick="confirmNationalLoan();">确认</button>
										<button class="btn btn-info" type="button" onclick="rejectNationalLoan();">打回</button>
           							</div>
           						</div>
           					</div>
           				</div>
           				
           				<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
							<thead>
								<tr>
									<th width="4%"><input type="checkbox" name="select_rows" class="select_row" onclick="allChecked(this);"/></th>
									<th width="10%" >姓名</th>
									<th width="12%" >学号</th>
									<th width="12%">学年</th>
									<th width="12%">银行卡类型</th>
									<th width="12%">贷款年限</th>
									<th width="12%">申请日期</th>
									<th width="10%">状态</th>
									<th width="10%">操作</th>
								</tr>
							</thead>
								 <#-- 选中的数据项ID -->
           						 <input type="hidden" id="checkedIds" name="checkedIds" value="">
							<tbody>
						  	<#if page??>	
								<#list page.result as p>
								<tr><td class="autocut"><input name="messageCheck" value="${p.id}" type="checkbox" onclick="selCheckId(this);" /></td>
								<td class="autocut tipTag" data="学院：${(p.studentInfo.college.name)!''}<br/>专业：${(p.studentInfo.major.majorName)!''}<br/>班级：${(p.studentInfo.classId.className)!''}<br/>">
									<a href="${rc.contextPath}/sponsor/nationalLoan/opt-view/viewNationalLoan.do?id=${(p.id)}" title="学生处查看国家助学贷款学生信息" target="_blank">${(p.studentInfo.name)!""}</a></td>	
								<td class="autocut">${(p.studentInfo.stuNumber)!""}</td>
								<td class="autocut">${(p.loanYear.name)!""}</td>
								<td class="autocut">${(p.cardType.name)!""}</td>
								<td class="autocut">${(p.loanNumYear)!""}</td>
								<td class="autocut">${(p.applyDate!"")?string('yyyy-MM-dd')}</td>
								<td class="autocut"><#if p.status??>${p.status.name!""}</#if></td>
								<td class="autocut">
									<a href="${rc.contextPath}/sponsor/nationalLoan/opt-show/nationalLoanApprovePage.do?id=${p.id}" class="sepV_a" title="国家助学贷款审核"><i class="icon-check"></i></a>
								</td>
								</tr>
								</#list>
						   	</#if> 
							</tbody>
						</table>
						<#assign pageTagformId="nationalLoanQuery"/>
						<#include "/page.ftl">
       				</div>
			</div>
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
			
			function confirmNationalLoan(){

				var checkedIds = $("#checkedIds").val();
				
				if(checkedIds=="" || checkedIds==",") {
					comp.message("未选中要通过的学生","error");
					return;
				}
				
				comp.confirm("是否要确认选中的学生国家助学贷款信息吗？",function(result){
					if(!result) 
						return;
					
					$.post("${rc.contextPath}/sponsor/approve/opt-update/confirmNationalLoan.do", {checkedIds: checkedIds, isConfirm: 'confirm'}, 
						function(data){
    						if(data == "success"){
    							window.location.href="${rc.contextPath}/sponsor/approve/opt-query/nationalLoanList.do";
    						}
    					},
    				"text");
					
				});
			}
			
			
			function rejectNationalLoan(){

				var checkedIds = $("#checkedIds").val();
				
				if(checkedIds=="" || checkedIds==",") {
					comp.message("未选中要打回的学生","error");
					return;
				}
				comp.confirm("是否要打回选中的学生国家助学贷款信息吗？",function(result){
					if(!result) 
						return;
					
					$.post("${rc.contextPath}/sponsor/approve/opt-update/rejectNationalLoan.do", {checkedIds: checkedIds, isConfirm: 'reject'}, 
						function(data){
    						if(data == "success"){
    							window.location.href="${rc.contextPath}/sponsor/approve/opt-query/nationalLoanList.do";
    						}
    					},
    				"text");
					
				});
			}
			
		</script>
	</body>
	
</html>