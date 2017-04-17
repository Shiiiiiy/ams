<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<script type="text/javascript" src="${rc.contextPath}/js/common/cascadecommon.js"></script>
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
		
		function importOriginLoan() {
			window.location.href="${rc.contextPath}/sponsor/originLoan/importOriginLoan.ftl";
		}
			
		function deleteObj(name, id) {
			if(id) {
				comp.confirm("确定要删除【" + name + "】的生源地助学贷款信息吗？" , function(result) {
				if(!result)   return;
					$.ajax({
						url:'${rc.contextPath}/sponsor/originLoan/opt-delete/deleteOriginLoan.do',
						async:false,
						cache: false,
						type: "POST",
						data:{id : id },
						success: function(data){
				 			$("#originLoanQuery").submit();
				   	 	}
					});
				});		
			}
		}
	</script>
</head>
	<body>
		<div id="contentwrapper">
   		<div class="main_content">   
    	<form  id="originLoanQuery"  action="${rc.contextPath}/sponsor/originLoan/opt-query/originLoanList.do" method="post">
			<div class="row-fluid">	
				<div class="span4">
					<span class="formTitle">姓名</span>
				    <input id="name" name="studentInfo.name" class="span6"  value="${((originLoan.studentInfo.name)!'')?html}" />
				 </div>
				<div class="span4">
					<span class="formTitle">学号</span>
					<input id="stuNumber" name="studentInfo.stuNumber" class="span6" value="${((originLoan.studentInfo.stuNumber)!'')?html}"/>
				</div>
				<div class="span4">
					<span class="formTitle">贷款学年</span>
					<select size="1" id="loanYear" class="span6" name="loanYear.id" aria-controls="dt_gal" >
			          <option value="" >请选择</option>
						<#if yearList??>
							<#list yearList as y>
								<#if originLoan?? && originLoan.loanYear?? && originLoan.loanYear.id == y.id>
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
				    <select size="1" id="collegeId" name="studentInfo.college.id" aria-controls="dt_gal" class="span6" onchange="cascade.changeCollage('collegeId','majorId');" <#if collegeId??> disabled="disabled" </#if> >
						<option value="">请选择..</option>
						<#if collegeList??>
						<#list collegeList as c>
							<#if collegeId?? && collegeId == c.id>
								<option value="${c.id}" data-code="${c.code?html}" selected="selected" >${c.name?html}</option>
							<#elseif originLoan?? && originLoan.studentInfo?? && originLoan.studentInfo.college?? && originLoan.studentInfo.college.id == c.id >
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
							<#if originLoan?? && originLoan.studentInfo?? && originLoan.studentInfo.major?? &&  originLoan.studentInfo.major.id == m.id >
								<option value="${m.id}" selected >${m.majorName}</option>
							<#else>
								<option value="${m.id}">${m.majorName}</option>
							</#if>
						</#list>
					</#if>
				    </select>
				</div>
				<div class="span4">
					<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;班级</span>
				    <select size="1" id="classId" name="studentInfo.classId.id" aria-controls="dt_gal" class="span6 emptySelect" >
				    	<option value="" >请选择</option>
				    	<#if classList?? >
				    		<#list classList as c>
				    			<#if originLoan ?? && originLoan.studentInfo?? && originLoan.studentInfo.classId?? && originLoan.studentInfo.classId.id == c.id>
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
				</div>
        		<div class="span4">
        			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              		<input type="submit" class="btn btn-info" value="查 询"/>
              		<input type="button" class="btn btn-info" onclick="comp.clearForm('originLoanQuery');" value="清 空"/>
           		 </div>
            </div>
		</form>
		
		<div class="row-fluid">
		<h5 class="heading"></h5>
		<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
			<div class="row">
				<div class="row-fluid">
                    <button class="btn btn-info" type="button" onclick="importOriginLoan()">生源地助学贷款导入</button>
				</div>
			</div>
			<table class="table table-bordered table-striped tablecut" id="smpl_tbl" >
				<thead>
				<tr>
				<th width="7%">序号</th>
				<th width="8%">姓名</th>
				<th width="9%">学号</th>
				<th width="10%">贷款学年</th>
				<th width="10%">贷款银行</th>
				<th width="10%">贷款次数</th>
				<th width="10%">合同金额</th>
				<th width="10%">欠缴费用总额</th>
				<th width="10%">入学年份</th>
				<th width="11%">毕业日期</th>
				<th width="8%">操作</th>
				</tr>
				</thead>
				<tbody>
				  <#if page??>	
					<#list page.result as p>
					<tr>
					<td class="autocut">${p_index+1}</td>
					<td class="autocut tipTag" data="学院：${(p.studentInfo.college.name)!''}<br/>专业：${(p.studentInfo.major.majorName)!''}<br/>班级：${(p.studentInfo.classId.className)!''}<br/>">
						<a href="${rc.contextPath}/sponsor/originLoan/opt-view/viewOriginLoan.do?id=${(p.id)!''}" title="查看生源地助学贷款学生信息" target="_blank"> ${(p.studentInfo.name)!""}</a></td>	
					<td class="autocut">${(p.studentInfo.stuNumber)!""}</td>
					<td class="autocut">${(p.loanYear.name)!""}</td>
					<td class="autocut">${(p.loanBank)!""}</td>
					<td class="autocut">${(p.countLoan)!""}</td>
					<td class="autocut">${(p.contractAmount!"")?string('0.00')}</td>
					<td class="autocut">${(p.paymentAmount!"")?string('0.00')}</td>
					<td class="autocut">${(p.studentInfo.classId.grade)!""}</td>
					<td class="autocut"> <#if p.graduationDate?? > ${(p.graduationDate!"")?string('yyyy-MM-dd')}  </#if></td>
					<td class="autocut">
					<#if user_key.optMap??>
						<#if user_key.optMap['update']??>
						 	<a href="${rc.contextPath}/sponsor/originLoan/opt-update/editOriginLoan.do?id=${p.id}" class="sepV_a" title="编辑生源地助学贷款信息"><i class="icon-edit"></i></a>
						</#if>
						<#if user_key.optMap['del']??>
							 <a href="#" onClick="deleteObj('${(p.studentInfo.name)}', '${p.id}')" title="删除生源地助学贷款"><i class="icon-trash"></i></a>
						</#if>
					</#if>
					</td>
					</tr>
					</#list>
				   </#if> 
				</tbody>
			  </table>
			  <#assign pageTagformId="originLoanQuery"/>
			 <#include "/page.ftl">
		</div>
		</div>
		</div>
		</div>
</body>
</html>