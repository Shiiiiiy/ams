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
				<h3 class="heading">校优秀毕业生批量审核</h3>
				<div class="row-fluid">
					<form id="schoolGooodStudentForm" method="post" action="${rc.contextPath}/job/approveSchoolGoodStudent/opt-save/saveBatchSchoolGoodStudent.do">
						<div class="formSep">
							<div class="row-fluid">
								<div class="span12">
									<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
										<table class="table table-bordered table-striped tablecut" id="smpl_tbl" >
											<thead>
												<th width="5%">序号</th>
												<th width="10%">姓名</th>
												<th width="10%">学号</th>
												<th width="10%">学年</th>
												<th width="10%">班级排名</th>
												<th width="10%">职务</th>
												<th width="10%">计算机等级</th>
												<th width="10%">外语等级</th>
												<th width="10%">状态</th>
												<th width="10%">操作</th>
											</thead>
											<tbody>
												<#if (schoolGoodStudentList)??>
													<#list schoolGoodStudentList as r>
														<tr>
															<td class="autocut">${r_index+1}</td>
															<td class="autocut tipTag" data="学院：${(r.studentId.college.name)!""}&lt;br/&gt专业：${(r.studentId.major.majorName)!""}&lt;br/&gt班级：${(r.studentId.classId.className)!""}&lt;br/&gt">
																<input name="ids" type="hidden" value="${r.id}"/>
																<a target="_blank" href="${rc.contextPath}/job/schoolGoodStudent/view/viewSchoolGoodStudent.do?id=${r.id}">${(r.studentId.name)!""}</a>
															</td>
															<td class="autocut">${(r.studentId.stuNumber)!""}</td>
															<td class="autocut">${(r.studentId.classId.graduatedYearDic.name)!""}</td>
															<td class="autocut">${(r.classSort)!""}</td>
															<td class="autocut">${(r.post)!""}</td>
															<td class="autocut">${(r.computerLevel)!""}</td>
															<td class="autocut">${(r.englishLevel)!""}</td>
															<td class="autocut">
																<#if (r.approveStatus)??>
																	<#if r.approveStatus == "APPROVEING">
																		待审核
																	<#else>
																		${approveMap[r.approveStatus]}
																	</#if>
																</#if>
															</td>
															<td class="autocut"><a target="_blank" href="${rc.contextPath}/job/schoolGoodStudent/view/viewSchoolGoodStudent.do?id=${r.id}" class="sepV_a" title="查看"><i class="icon-list-alt"></i></a></td>
														</tr>
													</#list>
												</#if>
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<div class="formSep">
							<div class="row-fluid">
								<div class="span6">
									<div class="span3">
										<label>审核意见</label>
									</div>
									<div class="span9">
										<input id="approveStatus" name="approveStatus" type="hidden"/>
										<textarea id="approveReason" name="approveReason" rows="5" cols="12" style="width:809px; height: 100px;"></textarea>
									</div>
								</div>
							</div>
						</div>
						<br/>
						<div class="row-fluid">
							<div class="span6">
								<div class="span3"></div>
								<div class="span6">
									<input class="btn btn-info" type="button" value="通 过" onclick="approveSchoolGoodStudent('PASS');"/>
									<input class="btn btn-info" type="button" value="拒 绝" onclick="approveSchoolGoodStudent('REJECT');"/>
									<input class="btn" type="button" value="返 回" onclick="back();"/>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
		<#--脚本开始-->
		<script type="text/javascript">
			$(function(){
				$('.tipTag').poshytip({
					className: 'tip-yellowsimple',
					alignTo: 'target',
					alignX: 'right',
					alignY: 'center',
					offsetX: 5
				});
			});
			$("#schoolGooodStudentForm").compValidate({
				rules: {
					approveReason: {maxlength : 500}
				},
				messages:{
					approveReason: {maxlength : "审核意见最大长度为500位"}
				}
			});
			//审批
			function approveSchoolGoodStudent(status){
				var schoolGooodStudentForm = $('#schoolGooodStudentForm');
				if(!schoolGooodStudentForm.compValid()){
					return;
				}
				if(status == "PASS"){//通过
				    fillDefaltMessage("通过");
					comp.confirm("确定要通过？",function(result){
						if(result){
							$("#approveStatus").val("PASS");
							schoolGooodStudentForm.submit();
						}
					});
					/*if(confirm("确定要通过？")){
						$("#approveStatus").val("PASS");
						schoolGooodStudentForm.submit();
					}*/
				}
				if(status == "REJECT"){//拒绝
				    fillDefaltMessage("拒绝");
					comp.confirm("确定要拒绝？",function(result){
						if(result){
							$("#approveStatus").val("REJECT");
							schoolGooodStudentForm.submit();
						}
					});
					/*if(confirm("确定要驳回？")){
						$("#approveStatus").val("REJECT");
						schoolGooodStudentForm.submit();
					}*/
				}
			}
			
		    /**
			  * 为审批意见默认赋值
			  */
			function fillDefaltMessage(defultMsg){
			    var curMsg = $.trim($("#approveReason").val());
				if(comp.isNull(curMsg)){
					$("#approveReason").val(defultMsg);
				}
			}	
			
			//返回
			function back(){
				window.location.href="${rc.contextPath}/job/approveSchoolGoodStudent/opt-query/approveSchoolGoodStudentPage.do";
			}
		</script>
		<#--脚本结束-->
	</body>
</html>