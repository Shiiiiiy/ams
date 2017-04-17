<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="${rc.contextPath}/lib/jquery-ui/css/Aristo/Aristo.css" />
		<script src="${rc.contextPath}/lib/jquery-ui/jquery-ui-1.8.20.custom.min.js"></script>
		<link rel="stylesheet" href="${rc.contextPath}/css/bdp_comp.css" type="text/css"/>
		<!-- My97DatePicker -->
		<link rel="stylesheet" href="${rc.contextPath}/lib/My97DatePicker/skin/WdatePicker.css" />
		<script type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
		<script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
		<script src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script>
		<script src="${rc.contextPath}/lib/validation/localization/messages_cn.js"></script>
	</head>
	<body>
		<div id="contentwrapper">
			<div class="main_content">
				<div class="row-fluid">
					<#include "selectPoorStudentForm.ftl">
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
										            <input id="exportSize" name="exportSize" type="hidden" class="span3"  value="4000" title="excel单页条数" />
										            <button class="btn btn-info" type="button" onclick="javascript:exportPoorStudent()">导 出</button>
												</#if>
										     </#if>	
											</div>
										</div>
									</div>
								</div>
								<table class="table table-bordered table-striped tablecut" id="smpl_tbl" >
									<thead>
										<th width="5%">序号</th>
										<th width="8%">学年</th>
										<th width="8%">学院</th>
										<th width="20%">专业</th>
										<th width="10%">审核通过人数</th>
										<th width="10%">审核拒绝人数</th>
										<th width="10%">双困生通过率</th>
										<th width="10%">申请总人数</th>
									</thead>
									<tbody>
										<#if poorStudentmajorList??>
										    <#assign index = 1/>
											<#assign approvePassNum = 0/>
											<#assign approveRejectNum = 0/>
											<#assign total = 0/>
											<#list poorStudentmajorList as r>
											    <#assign index = index + 1 />
												<#assign approvePassNum = approvePassNum + r.approvePassNum />
												<#assign approveRejectNum = approveRejectNum + r.approveRejectNum />
												<#assign total = total + r.total />
												<tr>
													<td class="autocut">${r_index+1}</td>
													<td class="autocut">${(r.schoolYear.name)!""}</td>
													<td class="autocut">${(r.major.collage.name)!""}</td>
													<td class="autocut">${(r.major.majorName)!""}</td>
													<td class="autocut">${(r.approvePassNum)!""}</td>
													<td class="autocut">${(r.approveRejectNum)!""}</td>
													<td class="autocut">
													<#if r.approvePassNum==0 || r.total ==0 >
													   0.00% 
												    <#else>
													   ${((r.approvePassNum*100)/(r.total))?string("#.##")}%
												    </#if>
												    </td>
													<td class="autocut">${(r.total)!""}</td>
												</tr>
											</#list>
											<tr>
												<td class="autocut" colspan="4" style="text-align:center">总计</td>
												<td class="autocut">${approvePassNum}</td>
												<td class="autocut">${approveRejectNum}</td>
												<td class="autocut">
													<#if total != 0>
														${(((approvePassNum)?number)/((total)?number)*100)?string('0.00')+"%"}
													<#else>
														0.00%
													</#if>
												</td>
												<td class="autocut">${total}</td>
											</tr>
										</#if>
									</tbody>
								</table>
								<#assign pageTagformId="countPoorStudentForm"/>
								<input id="pageTotalCount" name="pageTotalCount" type="hidden"  value="${poorStudentmajorList?size}"/>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<#--脚本开始-->
	<div class="modal hide fade" id="exportdemo">
		<div class="modal-header">
			<button class="close" data-dismiss="modal">×</button>
			<h3 id="title1">双困生按专业统计导出</h3>
		</div>
		<div class="modal-body" id="export_studentInfo">
			
		</div>
		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal">关闭</a>
		</div>
	</div>
		<script type="text/javascript">
			
					
	function exportPoorStudent(){
		var pageTotalCount= $("#pageTotalCount").val();
		var exportSize= $("#exportSize").val();
		var patrn=/^[0-9]{1,20}$/; 
		if(exportSize==""){
			comp.message("请输入大于0的正整数","error");
		}else if(!patrn.exec(exportSize)){
			comp.message("请输入大于0的正整数","error");
		}else if(exportSize<1){
			comp.message("请输入大于0的正整数","error");
		}else if(exportSize>10000){
			comp.message("请输入小于10000的正整数","error");
		}else{
			comp.showModal("exportdemo","500px","-250px 0 0 -250px");
			$("#export_studentInfo").load("${rc.contextPath}/job/countPoorStudent/nsm/exportCountPoorStudent.do?pageTotalCount="+pageTotalCount+"&exportSize="+exportSize);
		}
	}
	
	function exportPoorStudentDate(exportSize,exportPage){
	    var year = $("#schoolYear").val();
		$("#countPoorStudentForm").attr("action","${rc.contextPath}/job/opt-export/exportCountPoorStudentList.do");
		var fo=$("#countPoorStudentForm");
		if($("#studentPoQuery_exportPage").length==0){
			fo.append($("<input>",{
				id:'studentPoQuery_exportSize',
				type:'hidden',
				name:'studentPoQuery_exportSize',
				val:exportSize
			}));
			fo.append($("<input>",{
				id:'studentPoQuery_exportPage',
				type:'hidden',
				name:'studentPoQuery_exportPage',
				val:exportPage
			}));
		}else{
			$("#studentPoQuery_exportSize").val(exportSize);
			$("#studentPoQuery_exportPage").val(exportPage);
		}
		fo.submit();
		}
		</script>
		<#--脚本结束-->
	</body>
</html>