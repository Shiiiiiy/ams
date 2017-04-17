<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
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
					<form id="queryCompanyInfo" method="post" action="${rc.contextPath}/job/companyInfo/opt-query/queryCompanyInfoList.do">
						<div class="span12">
							<div class="row-fluid">
								<div class="span4">
									<span class="formTitle">所属学院</span>
									<select name="college.id" aria-controls="dt_gal" class="span6">
										<option value="">请选择</option>
										<option value="05" <#if (companyInfoVO.college.id)?? && companyInfoVO.college.id == '05'>selected="selected"</#if>>${companyManagerName!""}</option>
										<#if colleges??>
											<#list colleges as college>
												<#if (companyInfoVO.college.id)?? && companyInfoVO.college.id == college.id>
													<option value="${college.id}" selected="selected">${college.name}</option>
												<#else>
													<option value="${college.id}">${college.name}</option>
												</#if>
											</#list>
										</#if>
									</select>
								</div>
								<div class="span4">
									<span class="formTitle">企业性质</span>
									<select name="companyProerty.id" aria-controls="dt_gal" class="span6">
										<option value="">请选择</option>
										<#if companyProertys??>
											<#list companyProertys as cp>
												<#if (companyInfoVO.companyProerty.id)?? && companyInfoVO.companyProerty.id == cp.id>
													<option value="${cp.id}" selected="selected">${cp.name}</option>
												<#else>
													<option value="${cp.id}">${cp.name}</option>
												</#if>
											</#list>
										</#if>
									</select>
								</div>
								<div class="span4">
									<span class="formTitle">企业名称</span>
									<input id="graduateYear" name="companyName" class="span6" type="text" value="${(companyInfoVO.companyName)!""}" />
								</div>
							</div>
							<div class="row-fluid">
								<div class="span4">
								</div>
								<div class="span4">
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<#--查询时首先更改 form的action的值-->
									<input type="submit" class="btn btn-info" value="查 询" onclick="queryCompanyInfoVO();">
									<input type="button" class="btn btn-info" onclick="comp.clearForm('queryCompanyInfo');" value="清 空">
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
												<#if (user_key.optMap)??>
													<#if user_key.optMap["add"]??>
														<button class="btn btn-info" type="button" onclick="goAddCompanyInfo();">新 增</button>
													</#if>
													<#if user_key.optMap['import']??>
														<button class="btn btn-info" type="button" onclick="goImportCompanyInfo()">导 入</button>
													</#if>
													<#if user_key.optMap['export']??>
														<button class="btn btn-info" type="button" onclick="exportCompanyInfo()">导 出</button>
													</#if>
												</#if>
											</div>
										</div>
									</div>
								</div>
								<table class="table table-bordered table-striped tablecut">
									<thead>
										<th width="5%">序号</th>
										<th width="10%">所属学院</th>
										<th width="27%">企业名称</th>
										<th width="10%">企业性质</th>
										<th width="10%">联系人</th>
										<th width="10%">联系电话</th>
										<th width="12%">手机号码</th>
										<th width="8%">更新时间</th>
										<th width="8%">操作</th>
									</thead>
									<tbody>
										<#if (page.result)??>
											<#list page.result as r>
												<tr>
													<td class="autocut">${r_index+1}</td>
													<td class="autocut"><#if (r.college.id)?? && r.college.id='05'>${companyManagerName!""}<#else>${(r.college.name)!""}</#if></td>
													<td class="autocut"><a target="_blank" href="${rc.contextPath}/job/companyInfo/opt-query/viewCompanyInfo.do?id=${r.id}">${(r.companyName)!""}</a></td>
													<td class="autocut">${(r.companyProerty.name)!""}</td>
													<td class="autocut">${(r.contactPerson)!""}</td>
													<td class="autocut">${(r.contactPhone)!""}</td>
													<td class="autocut">${(r.phoneNum)!""}</td>
													<td class="autocut"><#if (r.updateDate)??>${(r.updateDate)?string("yyyy-MM-dd")}</#if></td>
													<td>
														<a target="_blank" href="${rc.contextPath}/job/companyInfo/opt-query/viewCompanyInfo.do?id=${r.id}" class="sepV_a" title="查看"><i class="icon-list-alt"></i></a>
														<#if (user_key.optMap)??>
															<#if isJobOffice == true || collegeId == r.college.id>
																<#if user_key.optMap['update']??>
																	<a href="#" onclick="goEditCompanyInfo('${r.id}')" title="修改" class="sepV_a"><i class="icon-edit"></i></a>
																</#if>
																<#if user_key.optMap['del']??>
																	<a href="#" onclick="delCompanyInfo('${(r.id)!""}','${(r.companyName)!""}')" title="删除" class="sepV_a"><i class="icon-trash"></i></a>
																</#if>
															</#if>
														</#if>
													</td>
												</tr>
											</#list>
										</#if>
									</tbody>
								</table>
								<#assign pageTagformId="queryCompanyInfo"/>
								<#include "/page.ftl">
								<!--用于导出 -->
								<input id="pageTotalCount" name="pageTotalCount" type="hidden"  value="${page.totalCount}"/>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="modal hide fade" id="exportCompanyInfo">
			<div class="modal-header">
				<button class="close" data-dismiss="modal">×</button>
				<h3 id="title1">导出企业信息</h3>
			</div>
			<div class="modal-body" id="export_companyInfo">
				
			</div>
			<div class="modal-footer">
				<a href="#" class="btn" data-dismiss="modal">关闭</a>
			</div>
		</div>
		<#--脚本开始-->
		<script type="text/javascript">
			//查询验证
			$('#queryCompanyInfo').compValidate({
				rules: {
					companyName: {maxlength:100},
				},messages:{
					companyName:{maxlength:"企业名称最大长度为100位"},
				}
			});
			//查询    修改查询表单的action
			function queryCompanyInfoVO(){
				var queryCompanyInfo = $("#queryCompanyInfo");
				if(!queryCompanyInfo.compValid()){
					return;
				}
				queryCompanyInfo.attr("action","${rc.contextPath}/job/companyInfo/opt-query/queryCompanyInfoList.do");
				queryCompanyInfo.submit();
			}
			//添加跳转页面
			function goAddCompanyInfo(){
				window.location.href = "${rc.contextPath}/job/companyInfo/opt-add/editCompanyInfo.do";
			}
			//导入跳转页面
			function goImportCompanyInfo(){
				window.location.href="${rc.contextPath}/job/companyInfo/opt-query/importCompanyInfoInit.do";
			}
			//修改跳转页面  
			function goEditCompanyInfo(id){
				window.location.href = "${rc.contextPath}/job/companyInfo/opt-add/editCompanyInfo.do?id="+id;
			}
			//删除
			function delCompanyInfo(id,companyName){
				comp.confirm("你确定需要删除【"+companyName+"】吗？",function(result){
					if(result){
						$.post(
							"${rc.contextPath}/job/companyInfo/opt-del/delCompanyInfo.do",
							{id:id},
							function(data){
								if(data == "true"){
									comp.message("删除【"+companyName+"】成功","info");
									window.location.href="${rc.contextPath}/job/companyInfo/opt-query/queryCompanyInfoList.do";
								}else{
									comp.message("删除【"+companyName+"】失败","error");
								}
							},
							"text"
						);
					}
				});
			}
			//显示导出页面
			function exportCompanyInfo(){
				var pageTotalCount= $("#pageTotalCount").val();
				var exportSize = 1000;
				comp.showModal("exportCompanyInfo","500px","-250px 0 0 -250px");
				$("#export_companyInfo").load("${rc.contextPath}/job/companyInfo/nsm/exportCompanyInfoPage.do?pageTotalCount="+pageTotalCount+"&exportSize="+exportSize);
			}
			//导出excel
			function exportDate(exportSize,exportPage){
				var fo=$("#queryCompanyInfo");
				fo.attr("action","${rc.contextPath}/job/companyInfo/nsm/exportCompanyInfo.do");
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