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
					<#include "selectProvinceGoodStudentForm.ftl">
					<div class="row-fluid">
						<div class="span12">
							<h5 class="heading"></h5>
							<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
								<div class="row">
									<div class="span10">
										<div class="dt_actions">
											<div class="row-fluid">
												
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
										<th width="10%">优秀率</th>
										<th width="10%">毕业生人数</th>
									</thead>
									<tbody>
										<#if provinceGoodStudentmajorList??>
										    <#assign index = 1/>
											<#assign approvePassNum = 0/>
											<#assign approveRejectNum = 0/>
											<#assign total = 0/>
											<#list provinceGoodStudentmajorList as r>
											    <#assign index = index + 1 />
												<#assign approvePassNum = approvePassNum + r.approvePassNum />
												<#assign approveRejectNum = approveRejectNum + r.approveRejectNum />
												<#if r?? && r.total??><#assign total = total + r.total /></#if>
												<tr>
													<td class="autocut">${r_index+1}</td>
													<td class="autocut">${(r.schoolYear.name)!""}</td>
													<td class="autocut">${(r.major.collage.name)!""}</td>
													<td class="autocut">${(r.major.majorName)!""}</td>
													<td class="autocut">${(r.approvePassNum)!""}</td>
													<td class="autocut">${(r.approveRejectNum)!""}</td>
													<td class="autocut">
													<#if r?? && r.total?? && (r.approvePassNum==0 || r.total ==0) >
													   0.00% 
												    <#else>
													   <#if r?? && r.total??>${((r.approvePassNum*100)/(r.total))?string("#.##")}% <#else>0.00%</#if>
												    </#if>
												    </td>
													<td class="autocut">
													<#if r?? && r.total?? >
													 ${(r.total)!""}
													<#else>
													  0
													</#if>
													</td>
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
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<#--脚本开始-->
		<script type="text/javascript">
			
			//显示导出页面
			function exportSchoolGooodStudent(){
				var pageTotalCount= $("#pageTotalCount").val();
				var exportSize = 10000;
				comp.showModal("exportSchoolGooodStudent","500px","-250px 0 0 -250px");
				$("#export_SchoolGooodStudent").load("${rc.contextPath}/job/schoolGoodStudent/nsm/exportSchoolGoodStudentPage.do?pageTotalCount="+pageTotalCount+"&exportSize="+exportSize);
			}
			//导出excel
			function exportDate(exportSize,exportPage){
				var fo=$("#schoolGooodStudentForm");
				fo.attr("action","${rc.contextPath}/job/schoolGoodStudent/opt-query/exportSchoolGoodStudentPage.do");
				if($("#userQuery_exportPage").length==0){
					fo.append($("<input>",{
						id:'userQuery_exportSize',
						type:'hidden',
						name:'userQuery_exportSize',
						val:exportSize
					}));
					fo.append($("<input>",{
						id:'userQuery_exportPage',
						type:'hidden',
						name:'userQuery_exportPage',
						val:exportPage
					}));
				}else{
					$("#userQuery_exportSize").val(exportSize);
					$("#userQuery_exportPage").val(exportPage);
				}
				fo.submit();
			}
		</script>
		<#--脚本结束-->
	</body>
</html>