<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
         <!-- jQuery UI theme-->
        <link rel="stylesheet" href="${rc.contextPath}/lib/jquery-ui/css/Aristo/Aristo.css" />
        <script src="${rc.contextPath}/lib/jquery-ui/jquery-ui-1.8.20.custom.min.js"></script>
        <!-- animated progressbars -->
        <script src="${rc.contextPath}/js/bdp_fileupload.progressbar.js"></script>
        <script src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script>
		<!-- bootstrap-fileupload -->	
		<link rel="stylesheet" href="${rc.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.min.css" />
		<!-- multiselect -->
	    <link rel="stylesheet" href="${rc.contextPath}/lib/multiselect/css/multi-select.css" />
		<script src="${rc.contextPath}/lib/multiselect/js/jquery.multi-select.min.js"></script>	
        <!-- ajax form-->
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
		<script src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
		<script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
		
		<script>
			//保存
			function saveAwardSpecial(){
				comp.confirm("保存后无法删除，确定保存吗？",function(r){
					if(r){
						var awardType = $("#awardTypeCode").val();
						if(awardType == 'AWARD') {
							$("#setSpecial").attr("action","${rc.contextPath}/reward/settingaward/opt-query/saveStuSpecial.do?type="+"AWARD")
						}else if(awardType == 'EXCELLENT') {
							$("#setSpecial").attr("action","${rc.contextPath}/reward/settingaward/opt-query/saveStuSpecial.do?type="+"EXCELLENT")
						}
						$("#setSpecial").submit();
					}
				})
			}
			//返回评优类型列表
			function returnList(){   
				window.location.href="${rc.contextPath}/reward/settingaward/opt-query/queryAwardPage.do?type=AWARD";
			}
			
			function deleteStu(obj){
				var selStuIds = $("#selStuIds").val();
				var size = $('input:checkbox[name=add_rows]:checked').size();
				if(size <= 0){
					comp.message("没有已选择的数据无法删除","info");
				}else{
					$('input:checkbox[name=add_rows]:checked').each(function(){
						var id = $(this).val();
						selStuIds = selStuIds.replace(id+",","");
						$("#selStuIds").val(selStuIds);
						$(this).parent().parent().remove();
					})
				}
				$("#allCheckBox").attr("checked",false);
			}
			function selCheckId(obj){
				var check = $(obj).is(":checked");
				if(check){
				}else{
					$("#allCheckBox").attr("checked",false);
				} 
			}
			
			function allChecked(obj){
				var check = $(obj).is(":checked");
				if(check){
					$('input:checkbox').attr("checked","checked");
				}else{
					$('input:checkbox').attr("checked",false);
				}
			}
			
			function selectStudentByClassCheck()
			{
				_queryStudentCheckAll("","1");
			}
			function setMultiEduClassSelectObjValue(data)
			{
				var stuIds = $("#stuIds").val();
				var selStuIds = $("#selStuIds").val();
				$(data).each(function(){
					if(stuIds.indexOf($(this)[0].id) < 0 && selStuIds.indexOf($(this)[0].id) < 0) {
						selStuIds = selStuIds +$(this)[0].id + ",";
						$("#selStuIds").val(selStuIds);
						var html = '<tr>' + '<td class="autocut">'+'<input type="checkbox" name="add_rows" class="select_row" onclick="selCheckId(this)" value="'+$(this)[0].id+'"/>'
										  + '<td class="autocut">'+$(this)[0].name+'</td>'
										  + '<td class="autocut">'+$(this)[0].id+'</td>'
										  + '<td class="autocut">'+$(this)[0].collegeName+'</td>'
										  + '<td class="autocut">'+$(this)[0].majorName+'</td>'
										  + '<td class="autocut">'+$(this)[0].className+'</td>'
										  + '<td class="autocut">'+'未保存'+'</td>'
										  + '</tr>';
						$("#tbodyId").append(html);
					}else{
						comp.message($(this)[0].name+"&nbsp;已有该权限","info");
					}
				})
			}
			window.onload=function(){
   				 $("#selStuIds").val("");
			}			
		</script>
		<style>
		</style>
    </head>
    <body>
		<div id="contentwrapper">
		    <div class="main_content">
		    	<div class="row-fluid">
					<div class="span12">
						<h3 class="heading">评奖评优人员设置</h3>
					</div>
				</div>
		    	<div class="row-fluid">
		    		<form id="setSpecial" method="post" action="${rc.contextPath}/reward/settingaward/opt-query/saveStuSpecial.do">
			    			<div class="formSep">
			    				<div class="row-fluid">
			    					<div class="span6">
			    						<div class="span3">
				    				    	<span class="">学年</span>
			    						</div>
			    				    	<div class="span9">
											<input id="schoolYear" name="schoolYear.code" value="${award.schoolYear.name}" disabled="disabled">
										</div>
			    				    </div>
			    				    <div class="span6">
			    				    	<div class="span3">
				    				    	<span>名称</span>
			    				    	</div>
			    				    	<div class="span9">
											<input id="awardInfo.awardName" name="awardInfo.awardName" value="${award.awardInfoId.awardName}" disabled="disabled">
										</div>
			    				    </div>
			    				</div>
			    			</div>
							<#if award.secondAwardName ??>
							<div class="formSep">
			    				<div class="row-fluid">
			    				    <div class="span6">
			    				    	<div class="span3">
				    				    	<span>二级奖项名称</span>
			    				    	</div>
			    				    	<div class="span9">
											<input id="secondAwardName" name="secondAwardName" value="${award.secondAwardName.name}" disabled="disabled">
										</div>
			    				    </div>
			    				</div>
			    			</div>
							</#if>			    			
			    			
							<div class="formSep">
			    				<div class="row-fluid">
			    					<div class="span6">
				    					<span class="span3">学生操作</span>
				    					<div class="span9">	
				    						<button class="btn btn-info"  type="button" onclick="selectStudentByClassCheck();">选择学生</button>
				    						<button class="btn btn-info"  type="button" onclick="deleteStu();">删除学生</button>
			    						</div>
			    					</div>
			    				</div>
		    				</div>
		    				<#--  选中的学生ID  -->
		    				<input type="hidden" id="stuIds" name="stuIds" value="${stuIds!""}">
		    				<input type="hidden" id="selStuIds" name="selStuIds" value="">
		    				<input type="hidden" id="awardId" name="awardTypeId" value="${award.id}">
		    				<input type="hidden" id="awardTypeCode" name="awardTypeCode" value="${award.awardType.code!""}">
		    				<div class="formSep">
			    				<div class="row-fluid">
			    				<div class="span6">
			    					<div class="span3">
			    						<span>人员列表</span>
			    					</div>
			    					<div class="span9">
			    					<div id="dt_gal_wrapper"  style="width:785px;" role="grid">
			    					<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
		           						<thead>
											<tr>
												<th width="4%" class="table_checkbox"><input type="checkbox" id="allCheckBox" name="select_rows" class="select_row" onclick="allChecked(this)"/></th>
												<th width="10%">姓名</th>
												<th width="20%">学号</th>
												<th width="20%">学院</th>
												<th width="20%">专业</th>
												<th width="15%">班级</th>
												<th width="10%">状态</th>
											</tr>
										</thead>
										<tbody id="tbodyId">
												<#if stuList??>
													<#list stuList as p>
														<tr>
															<td></td>
															<td class="autocut">${p.studentId.name}</td>
															<td class="autocut">${p.studentId.id}</td>
															<td class="autocut">${p.studentId.college.name}</td>
															<td class="autocut">${p.studentId.major.majorName}</td>
															<td class="autocut">${p.studentId.classId.className}</td>
															<td class="autocut">已保存</td>
														<tr>
													</#list>
												</#if>
										</tbody>
									</table>
									</div>
									</div>
									</div>
			    				</div>
		    				</div>
														 
			    		</form>	
			        		</br>
		    		<div class="row-fluid">
						<div class="span6">
							<div class="span3">
			        		</div>
				    		<div class="span9">
				              	<button class="btn btn-info" onclick="saveAwardSpecial()">保 存</button>
				              	<button class="btn" onclick="javascript:window.history.back(-1);">返 回</button>
			           		</div>
			           	</div>
			         </div>
			         
	    </div>
	    </div>
	    </div>       		
<#include "/comp/student/queryStudentAllCheckBoxModal.ftl"> 		
	           		
	</body>
</html>