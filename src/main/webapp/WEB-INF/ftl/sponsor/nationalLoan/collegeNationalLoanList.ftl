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
   		 
    	<form  id="nationalLoanQuery"  action="${rc.contextPath}/sponsor/college/opt-query/collegeNationalLoanList.do" method="post">
			<div class="row-fluid">	
				<div class="span4">
					<span class="formTitle">姓名</span>
				    <input id="name" name="studentInfo.name" class="span6"  value="${((nationalLoan.studentInfo.name)!'')?html}" />
				 </div>
							
				 <div class="span4">
					<span class="formTitle">学号</span>
					<input id="stuNumber" name="studentInfo.stuNumber" class="span6" value="${((nationalLoan.studentInfo.stuNumber)!'')?html}"/>
				 </div>
						 
				<div class="span4">
					<span class="formTitle">学年</span>
						<select size="1" id="loanYear" class="span6" name="loanYear.id" aria-controls="dt_gal" >
					    	<option value="" >请选择</option>
								<#if yearList??>
									<#list yearList as y>
										<#if nationalLoan?? && nationalLoan.loanYear?? && nationalLoan.loanYear.id == y.id>
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
								<#elseif nationalLoan?? && nationalLoan.studentInfo?? && nationalLoan.studentInfo.college?? && nationalLoan.studentInfo.college.id == c.id >
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
						<#if classList?? >
							<#list classList as c>
						    	<#if nationalLoan ?? && nationalLoan.studentInfo?? && nationalLoan.studentInfo.classId?? && nationalLoan.studentInfo.classId.id == c.id>
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
              		<input type="submit" class="btn btn-info" onclick="nationalLoanQuery()" value="查询"/>
              		<input type="button" class="btn btn-info" onclick="comp.clearForm('nationalLoanQuery');" value="清 空"/>
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
				              				<#if user_key.optMap['export']??>
				              					<div class="input-append">
				            						<button class="btn btn-info" type="button" onclick="exportNationalLoan()">Excel导出</button>
				              					</div>
				              				</#if>
										</#if>
			              			</div>
			                   </div>
			           		</div>
				        </div>
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl" >
							<thead>
								<tr>
								<th width="7%">序号</th>
								<th width="10%">姓名</th>
								<th width="13%">学号</th>
								<th width="11%">贷款学年</th>
								<th width="12%">银行卡类型</th>
								<th width="12%">贷款年限</th>
								<th width="12%">申请日期</th>
								</tr>
							</thead>
							<tbody>
							  <#if page??>	
								<#list page.result as p>
								<tr>
								<td class="autocut">${p_index+1}</td>
								<td class="autocut tipTag" data="学院：${(p.studentInfo.college.name)!''}<br/>专业：${(p.studentInfo.major.majorName)!''}<br/>班级：${(p.studentInfo.classId.className)!''}<br/>">
									<a href="${rc.contextPath}/sponsor/nationalLoan/opt-view/viewNationalLoan.do?id=${(p.id)!''}" title="查看国家助学贷款学生信息" target="_blank"> ${(p.studentInfo.name)!""}</a></td>	
								<td class="autocut">${(p.studentInfo.stuNumber)!""}</td>
								<td class="autocut">${(p.loanYear.name)!""}</td>
								<td class="autocut">${(p.cardType.name)!""}</td>
								<td class="autocut">${(p.loanNumYear)!""}</td>
								<td class="autocut">${(p.applyDate!"")?string('yyyy-MM-dd')}</td>
								</tr>
								</#list>
							   </#if> 
							</tbody>
						  </table>
						  <#assign pageTagformId="nationalLoanQuery"/>
						  	<#include "/page.ftl">
						  <!--用于用户导出 -->
						  <input id="pageTotalCount" name="pageTotalCount" type="hidden"  value="${page.totalCount}"/>
						  
					</div>
				</div>
			</div> 
		</div> 
	</div>
</div>
</div>

	<div class="modal hide fade" id="exportNationalLoan">
		<div class="modal-header">
			<button class="close" data-dismiss="modal">×</button>
			<h3 id="title1">导出国家助学贷款</h3>
		</div>
		<div class="modal-body" id="export_nationalLoan">
			
		</div>
		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal">关闭</a>
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
	
		//弹出导出页
		function exportNationalLoan(){
			var pageTotalCount= $("#pageTotalCount").val();
			var exportSize = "1000" ;
			comp.showModal("exportNationalLoan","500px","-250px 0 0 -250px");
			$("#export_nationalLoan").load("${rc.contextPath}/sponsor/nationalLoan/nsm/exportNationalLoanList.do?pageTotalCount=" + pageTotalCount + "&exportSize=" + exportSize);
		}
	
	//导出
	function exportDate(exportSize,exportPage){
		$("#nationalLoanQuery").attr("action","${rc.contextPath}/sponsor/nationalLoan/opt-export/exportNationalLoan.do");
		var fo=$("#nationalLoanQuery");
		if($("#nationalLoanQuery_exportPage").length==0){
			fo.append($("<input>",{
				id:'nationalLoanQuery_exportSize',
				type:'hidden',
				name:'nationalLoanQuery_exportSize',
				val:exportSize
			}));
			fo.append($("<input>",{
				id:'nationalLoanQuery_exportPage',
				type:'hidden',
				name:'nationalLoanQuery_exportPage',
				val:exportPage
			}));
		}else{
			$("#userQuery_exportSize").val(exportSize);
			$("#userQuery_exportPage").val(exportPage);
		}
		fo.submit();
	}
	
	
	function nationalLoanQuery(){
		$("#nationalLoanQuery").attr("action","${rc.contextPath}/sponsor/college/opt-query/collegeNationalLoanList.do");
		$("#nationalLoanQuery").submit();
	}
	
	</script>


</body>
</html>