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
					<#include "./schoolGoodStudentForm.ftl">
					<div class="row-fluid">
						<div class="span12">
							<h5 class="heading"></h5>
							<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
								<#--<div class="row">
									<div class="span10">
										<div class="dt_actions">
											<div class="row-fluid">
												<#if user_key.optMap??>
													<#if user_key.optMap['export']??>
														<button class="btn btn-info" type="button" onclick="exportSchoolGooodStudent();">导出</button>
													</#if>
												</#if>
											</div>
										</div>
									</div>
								</div>-->
								<table class="table table-bordered table-striped tablecut" id="smpl_tbl" >
									<thead>
										<th width="5%">序号</th>
										<th width="25%">学院</th>
										<th width="20%">学年</th>
										<th width="20%">优秀人数</th>
										<th width="20%">毕业生人数</th>
										<th width="20%">优秀率</th>
									</thead>
									<tbody>
										<#if (page)??>
											<#assign index = 1/>
											<#assign approvePassNum = 0/>
											<#assign total = 0/>
											<#list page as r>
												<#assign index = index + 1 />
												<#assign approvePassNum = approvePassNum + r.approvePassNum />
												<#assign total = total + r.total />
												<tr>
													<td class="autocut">${r_index+1}</td>
													<td class="autocut">${(r.college.name)!""}</td>
													<td class="autocut">${(r.schoolYear.name)!""}</td>
													<td class="autocut">${(r.approvePassNum)!""}</td>
													<td class="autocut">${(r.total)!""}</td>
													<td class="autocut">
														<#if r.total != 0>
															${(((r.approvePassNum)?number)/((r.total)?number)*100)?string('0.00')+"%"}
														<#else>
															0.00%
														</#if>
													</td>
												</tr>
											</#list>
											<tr>
												<td class="autocut">${index}</td>
												<td class="autocut" colspan="2" style="text-align:center">总计</td>
												<td class="autocut">${approvePassNum}</td>
												<td class="autocut">${total}</td>
												<td class="autocut">
													<#if total != 0>
														${(((approvePassNum)?number)/((total)?number)*100)?string('0.00')+"%"}
													<#else>
														0.00%
													</#if>
												</td>
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
		<div class="modal hide fade" id="exportSchoolGooodStudent">
			<div class="modal-header">
				<button class="close" data-dismiss="modal">×</button>
				<h3 id="title1">导出优秀毕业生统计表</h3>
			</div>
			<div class="modal-body" id="export_SchoolGooodStudent">
				
			</div>
			<div class="modal-footer">
				<a href="#" class="btn" data-dismiss="modal">关闭</a>
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
				fo.attr("action","${rc.contextPath}/job/schoolGoodStudent/opt-query/exportSchoolGoodStudentPageByStat.do");
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