<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
    <!-- ajax form-->
	<script src="${rc.contextPath}/js/jquery.form.js"></script>
	<script src="${rc.contextPath}/js/apw/apw_check.js"></script>
	<!-- sticky messages -->
   <script src="${rc.contextPath}/lib/sticky/sticky.min.js"></script>
    <script>
		//点击checkbox按钮 
		function onClickSingleCheckbox(obj)
		{
			var $subBox = $("input[name='approvedStudentId']");
			$("#totalCheck").attr("checked",$subBox.length == $("input[name='approvedStudentId']:checked").length ? true : false);
		}
		
		// 判断是否选中
		function checkIsSelected()
		{
			var len =  $("input[name='approvedStudentId']:checked").length ;
			if(len >0)
				return true;
			return false;
		}
		
		//处理批量操作 显示审核意见框
		function processAprove(status)
		{
			$("#batch_approve_status").val(status);
			 $("#suggest").val("");
			comp.showModal("batchApproveModual");
		}
		//批量审核
		function batchApprove(status)
		{
			if(checkIsSelected())
			{
				checkProcess(status);
			}else{
				if(status == "10")
					comp.message("请选择需要审核通过的学生");
				else
					comp.message("请选择需要审核拒绝的学生");
			}
		}
		
		//处理批量操作  确定按钮
		function sureApproveButton()
		{
			var param = "";
			$("input[name='approvedStudentId']").each(function(){
				if($(this).is(':checked')){
					if(param == "")
						param = $(this).val();
					else
						param+=","+$(this).val();
				}
			});
			var status = $("#batch_approve_status").val();
			var suggest =  $("#suggest").val();
			if(status == "20" && suggest == "" ){
				comp.message("拒绝时审核意见不能为空。","error");
				return;
			}else{
				if(status == "10" && confirm("确定要通过吗？")){
					apw.mulApproveCurProcess(param,"PASS",$("#suggest").val());
				}else if(status == "20" && confirm("确定要拒绝吗？")){
					apw.mulApproveCurProcess(param,"NOT_PASS",$("#suggest").val());
				}
			}
		}
		
		//执行审核流程之后
		function doMulAction(resultsArray){
			$.ajax({
				url:"${rc.contextPath}/student/manage/opt-approve/batchApproveStudent.do",
				async:false,
				cache:false,
				type:'POST',
				data: {resultsArray:JSON.stringify(resultsArray)},
				success: function(data){
				 	comp.message("审核操作完成。");
				 	$("#classQuery").submit();
			    }
			}); 	
		}
		
		// 判断流程的
		function checkProcess(status)
		{
			var param = "";
			$("input[name='approvedStudentId']").each(function(){
				if($(this).is(':checked')){
					if(param == "")
						param = $(this).val();
					else
						param+="_"+$(this).val();
				}
			});
			$.ajax({
				url:"${rc.contextPath}/apw/amsapprove/opt-add/checkNextTaskApprover.do",
				async:false,
				cache:false,
				type:'POST',
				data:{boxes:param},
				success: function(data){
					var parsedJson = jQuery.parseJSON(data); 
					var nextApproverArray = parsedJson.nextApproverList;
					if(parsedJson.resultFlag=="deprecated"){
						$.sticky("审批流已弃用", {autoclose:5000, position:"top-right", type:"st-error"});
					 }else if(parsedJson.resultFlag=='mulApprover') {
				 		comp.message("下一节点有多个办理人，请执行单次审核 !");
					 }else if(parsedJson.resultFlag=='oneApprover' || parsedJson.resultFlag=='singleApprove'){
						processAprove(status);
					 }
				  }
			}); 
		}
			
	</script>
</head>
<body>
<div id="contentwrapper">
    <div class="main_content">   
		 <div class="row-fluid">	
    		<form  id="classQuery"  action="${rc.contextPath}/student/manage/opt-query/listApproveStudent.do" method="post">
				<div class="span12">
				    <div class="row-fluid">
						<div class="span4">
							<span class="formTitle">学号</span>
							<input id="stuNumber" name="stuId.stuNumber" class="span7" <#if studentUpdateInfo.stuId ?? >value="${studentUpdateInfo.stuId.stuNumber!""?html}"</#if> />
						 </div>
						<div class="span4">
							<span class="formTitle">姓名</span>
							<input id="name" name="stuId.name" class="span7" <#if studentUpdateInfo.stuId ?? >value="${studentUpdateInfo.stuId.name!""?html}"</#if> />
						 </div>
						 <div class="span4">
							<span class="formTitle">审核状态</span>
								<select size="1" name="processStatus" aria-controls="dt_gal" class="span7">
									<option value="" >请选择..</option>
										<#list processStatusMap?keys as c>
											<#if studentUpdateInfo ?? && studentUpdateInfo.processStatus?? && studentUpdateInfo.processStatus == c >
												<option value="${c}" selected >${processStatusMap[c]}</option>
											<#else>
												<option value="${c}">${processStatusMap[c]}</option>
											</#if>
										</#list>
								</select>	
						 </div>
				   	 </div>
			   	 </div>
			    <div class="row-fluid">
				   	 <#if classList ??>
						 <div class="span4">
							<span class="formTitle">班级</span>
								<select size="1" id="classId" name="stuId.classId.id" aria-controls="dt_gal" class="span7">
									<option value="" >请选择..</option>
									<#list classList as c>
										<#if studentUpdateInfo ?? && studentUpdateInfo.stuId ?? && studentUpdateInfo.stuId.classId ?? &&  studentUpdateInfo.stuId.classId.id == c.id >
											<option value="${c.id}" selected >${c.className?html}</option>
										<#else>
											<option value="${c.id}">${c.className?html}</option>
										</#if>
									</#list>
								</select>														
							</div>
							<div class="span4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button class="btn btn-info"  type="submit">查 询</button>
					            <button class="btn btn-info" type="button" onclick="comp.clearForm('classQuery');">清 空</button>
							</div>
						<#else>
							<div class="btnCenter">
				              <button class="btn btn-info"  type="submit">查 询</button>
				              <button class="btn btn-info" type="button" onclick="comp.clearForm('classQuery');">清 空</button>
			             	</div>
						</#if>
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
				                    <#if isTeacher?? && isTeacher == true>
								        <#if user_key.optMap??>
								            <#if user_key.optMap['approve']??>
					                            <button class="btn btn-info" type="button" id="pass-button" onclick="batchApprove('10');">通  过</button>
					                            <button class="btn btn-info" type="button" id="refuse-button"  onclick="batchApprove('20');">拒  绝</button>
											</#if>
										</#if>
									</#if>
									</div>
								</div>
							</div>
						</div>
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
							<thead>
								<tr>
									<#if isTeacher?? && isTeacher == true>
										<th width="5%"  style="text-align:center">
										<input type="checkbox" id="totalCheck"  onclick="comp.selectAllCheckbox('totalCheck','approvedStudentId')"/>
										</th>
										<#else>
										 <th width="5%">序号</th>
									</#if>
									<th width="10%">姓名</th>
									<th width="11%">学号</th>
									<th width="7%">性别</th>
									<th width="14%">学院</th>
									<th width="18%">专业</th>
									<th width="18%">班级</th>
									<th width="8%">审核状态</th>
									<th width="8%">操作</th>
								</tr>
							</thead>
							<tbody>
							<#if page??>	
								<#list page.result as p>
								<tr>
									<#if isTeacher?? && isTeacher == true>
										<#if p.nextApprover?? && p.nextApprover.id==currentStudentId>
											<td style="text-align:center">
												<input type="checkbox" name="approvedStudentId"  onclick="onClickSingleCheckbox(this);"  value="${p.id}"/>
											</td>
											<#else>
											<td>&nbsp;</td>
										</#if>		
									<#else>
										<td>${p_index+1}</td>
									</#if>
									<td class="autocut"><a href="${rc.contextPath}/student/manage/opt-query/queryApproveStudent.do?id=${p.id}" target='_blank' class="sepV_a" title="查看">${p.name!""?html}</a></td>
									<td class="autocut"><#if p.stuId ?? >${p.stuId.stuNumber!""?html}</#if></td>
									<td class="autocut"><#if p.genderDic ?? >${p.genderDic.name!""?html}</#if></td>
									<td class="autocut"><#if p.stuId ?? && p.stuId.college ??>${p.stuId.college.name!""?html}</#if></td>
									<td class="autocut"><#if p.stuId ?? && p.stuId.major ??>${p.stuId.major.majorName!""?html}</#if></td>
									<td class="autocut"><#if p.stuId ?? && p.stuId.classId ??>${p.stuId.classId.className!""?html}</#if></td>
									<td class="autocut">
										<#if p.processStatus ??>
											<#if p.nextApprover?? && p.nextApprover.id==currentStudentId>
												待审核
											<#else>
												${processStatusMap[p.processStatus]}
											</#if>
											<#else>待审核
										</#if>
									</td>
									<td class="autocut">
									<#if user_key.optMap??>
										<#if user_key.optMap['approve']??>
									       <#if p.nextApprover?? && p.nextApprover.id==currentStudentId><a href="${rc.contextPath}/student/manage/opt-query/editApproveStudent.do?id=${p.id}" class="sepV_a" title="审核"><i class="icon-check"></i></a></#if>
                                        </#if>
                                    </#if>
                                    </td>
								</tr>
								</#list>
							 </#if> 
							</tbody>
						</table>
						 <#assign pageTagformId="classQuery"/>
						 <#include "/page.ftl">
					</div>
				</div>
			</div> 
		</div> 
	</div>
</div>

<#--批量审核意见填写框-->
<div class="modal hide fade" id="batchApproveModual">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3 id="title1">批量审核意见</h3>
	</div>
	<div class="modal-body">
	<input type="hidden" name="batch_approve_status" id="batch_approve_status" value=""/>
	<textarea name="suggest" id="suggest" cols="200" rows="5" class="span5"></textarea>
	<br><font size="1" color="grey"  style="vertical-align:bottom; padding-bottom:10px">(不超过200字)</font>
	</div>
	<div class="modal-footer">
		<a href="#" class="btn" data-dismiss="modal">取  消</a>
		<a href="javascript:sureApproveButton();" class="btn btn-info">确  定</a>
	</div>
</div>
 <#include "/apw/instance/approvers.ftl">
</body>
</html>