<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<script type="text/javascript" src="${rc.contextPath}/js/common/cascadecommon.js"></script>
    </head>
        
	<body>
		<div id="contentwrapper">
   		<div class="main_content">  
			<form  id="studentNationalLoan"  action="${rc.contextPath}/sponsor/nationalLoan/opt-query/studentNationalLoanList.do" method="post">
				<div class="row-fluid">
					<div class="span4">
						<span class="formTitle">学年</span>
						<select size="1" id="loanYear" name="loanYear.id" aria-controls="dt_gal" class="span6" >
							<option value="" >请选择</option>
							<#if yearList??>
							<#list yearList as y>
								<#if nationalLoan?? && nationalLoan.loanYear?? && nationalLoan.loanYear.id == y.id >
									<option value="${y.id}" data-code="${y.code?html}" selected="selected">${y.name?html}</option>
								<#elseif !nationalLoan?? && currentYear?? && currentYear.id == y.id>
									<option value="${y.id}" data-code="${y.code?html}" selected="selected">${y.name?html}</option>
								<#else>
									<option value="${y.id}" data-code="${y.code?html}" >${y.name?html}</option>
								</#if>
							</#list>
							</#if>
						</select>
					</div>
					
					<div class="span4">
						<span class="formTitle">状态</span>
						<select size="1" id="status" name="status.id" aria-controls="dt_gal" class="span6"   >
							<option value="">请选择..</option>
							<#if statusList??>
								<#list statusList as s>
									<#if nationalLoan?? && nationalLoan.status?? && nationalLoan.status.id == s.id >
										<option value="${s.id}" data-code="${s.code?html}" selected="selected" >${s.name?html}</option>	
									<#else>
										<option value="${s.id}" data-code="${s.code?html}" >${s.name?html}</option>	
									</#if>
								</#list>
							</#if>
						</select>
					</div>
					
				    <div class="span4">
			        	<input type="submit" class="btn btn-info"   value="查 询"/>
			            <input type="button" class="btn btn-info"  onclick="comp.clearForm('studentNationalLoan');" value="清 空"/> 
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
				                    	<button class="btn btn-info" type="button" onclick="addNationalLoan();">申请</button>
           							</div>
           						</div>
           					</div>
           				</div>
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl" >
							<thead>
								<tr>
									<th width="8%">序号</th>
									<th width="8%">姓名</th>
									<th width="9%">学号</th>
									<th width="9%">贷款学年</th>
									<th width="9%">借款金额</th>
									<th width="11%">银行卡类型</th>
									<th width="14%">银行账号</th>
									<th width="9%">申请日期</th>
									<th width="8%">状态</th>
									<th width="8%">操作</th>
								</tr>
							</thead>
							<tbody>
							  <#if page??>	
								<#list page.result as p>
									<tr>
										<td class="autocut">${p_index+1}</td>
										<td class="autocut"><a href="${rc.contextPath}/sponsor/nationalLoan/opt-view/viewNationalLoan.do?id=${(p.id)!''}" title="查看国家助学贷款学生信息" target="_blank"> ${(p.studentInfo.name)!""}</a></td>
										<td class="autocut">${(p.studentInfo.stuNumber)!""}</td>
										<td class="autocut">${(p.loanYear.name)!""}</td>
										<td class="autocut">${(p.loanAmount!"")?string('0.00')}</td>
										<td class="autocut">${(p.cardType.name)!""}</td>
										<td class="autocut">${(p.cardNum)!""}</td>
										<td class="autocut">${(p.applyDate!"")?string('yyyy-MM-dd')}</td>
										<td class="autocut">${(p.status.name)!""}</td>
										<td class="autocut">
										<#if (saveStatus?? && p.status.id == saveStatus.id) || (rejectStatus?? && p.status.id == rejectStatus.id) >
											<#if user_key.optMap??>
												<#if user_key.optMap['update']??>
												 	<a href="${rc.contextPath}/sponsor/nationalLoan/opt-update/editNationalLoan.do?id=${p.id}" class="sepV_a" title="编辑国家助学贷款信息"> <i class="icon-edit"></i></a>
												</#if>
												<#if user_key.optMap['del']??>
													 <a href="javascript:void(0);" onclick="deleteNationalLoan('${(p.studentInfo.name)}','${p.id}');" class="sepV_a" title="删除国家助学贷款学生信息"><i class="icon-trash"></i></a>
												</#if>
											</#if>
										</#if>
										</td>
									</tr>
								</#list>
							   </#if> 
							</tbody>
						  </table>
						 <#assign pageTagformId="studentNationalLoan"/>
						 <#include "/page.ftl">
					</div>
				</div>
			</div> 
		</div> 
	</div>
</div>
</div>

<#-- 脚本开始 -->
	<script>
	
		function addNationalLoan() { 
 			window.location.href="${rc.contextPath}/sponsor/nationalLoan/opt-add/addNationalLoan.do?";
 		}
 	
	//删除操作
	function deleteNationalLoan(name,id) {
		comp.confirm("确定要删除【"+name+"】的信息吗？", function(result) {
        	if(!result)
        		return;  
    		$.post("${rc.contextPath}/sponsor/nationalLoan/opt-del/deleteNationalLoan.do", { id: id }, function(data){
    			if(data === "success"){
    				comp.message(name +"删除成功！","info");
    				window.location.href="${rc.contextPath}/sponsor/nationalLoan/opt-query/studentNationalLoanList.do";
    			}
			    
			   },"text");
		}); 
	}	
	
	
</script>
</body>
</html>