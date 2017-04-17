<html>
<head>
    <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- jQuery UI theme-->
        <link rel="stylesheet" href="${rc.contextPath}/lib/jquery-ui/css/Aristo/Aristo.css" />
        <script src="${rc.contextPath}/lib/jquery-ui/jquery-ui-1.8.20.custom.min.js"></script>
        <!-- animated progressbars -->
        <script src="${rc.contextPath}/js/bdp_fileupload.progressbar.js"></script>
        <!-- ajax form-->
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
		
		<!--date-->
		<script language="javascript" type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
		<!-- jquery.validate -->
		<script src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script>
		
		<!-- 级联查询 -->
    	<script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
    	<style type="text/css">
    		.table th{text-align:center;}
    	</style>
    <script>
    
    	//初始化
		$("document").ready(function() {
			//根据学院查询出对应的专业
			if('${(studentInfo.major.id)!''}'==''){
				cascade.changeCollage('collegeId','majorId');
			}
		});
		
    	//撤销状态处理
		function cancelReport(id,reportStatus){
			var url = "${rc.contextPath}/cancel/report/opt-update/cancelReportStatus.do?id="+id;
			//要评价的报名学生。
			var str=""; 
			id=$.trim(id);
			//撤销的原因
			var cancelReasonVal="";
			cancelReasonVal=$("#"+id).val();
			//判断撤销原因是否是空
			

				var messageT = '';
			
				if(reportStatus =='2'){
					//判断是否选择了报到点
					//if(reportSiteVal==""){
						//comp.message("请选择报到点！","error");
						//return;
					//}
					//判断撤销原因是否是空
				if(cancelReasonVal==''){
					comp.message("撤销原因不能为空，请输入撤销原因！","error");
					return;
				}
					messageT = '撤销该新生的报到，是否撤销？';
				}else{
					messageT = '取消对该新生报到的撤销，是否取消？';
				}
   				
   				comp.confirm(messageT, function(result) {
        			if(result)	{
        				var pageNo = $("#cancelReportQuerygotoPageNumber").val();
						$("#cancelReportQuery").attr("action",url+"&pageNo="+pageNo+"&cancelReasonVal="+cancelReasonVal+"&statusReport="+reportStatus);
						$("#cancelReportQuery").submit();
        		
					}
				});
				
			
			
		}
		
		
		//导出学生信息
		function reportStudentInfo(){
			//暂存action
			var actionTemp = $("#cancelReportQuery").attr("action");
			
			$("#cancelReportQuery").attr("action","${rc.contextPath}/cancel/report/opt-query/exportStudentExcel.do");
			
			$("#cancelReportQuery").submit();
			//恢复action
			//$("#cancelReportQuery").attr('target', '');
			$("#cancelReportQuery").attr("action",actionTemp);
			
		}
		
		//查看学生信息
		function view(id) {
	    	comp.showModal("editStudentBox", "1000px", "-280px 0 0 -480px");
	   	 	$("#viewStudentDiv").load("${rc.contextPath}/student/view/nsm/viewStudent.do", {
	        "id": id
	    	});
		}
	</script>
</head>
<body>
<div id="contentwrapper">
    <div class="main_content">   
    	   <div class="row-fluid">	
    		<form  id="cancelReportQuery"  action="${rc.contextPath}/cancel/report/opt-query/cancelReportList.do" method="post">
				<div class="span12">			
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">学院</span>
							
							<#if collegeId !='' >
								<#--<select size="1" id="collegeId" name="college.id" aria-controls="dt_gal" class="span8" readOnly='readOnly' >-->
								<input type="hidden"  id="collegeId" name="college.id" class="span8" readOnly='readOnly' value="${(collegeId)!""}" />
								<input  class="span8" readOnly='readOnly' value="${(studentInfo.college.name)!""}" />
							<#else>
								<select size="1" id="collegeId" name="college.id" aria-controls="dt_gal" class="span8" onchange="cascade.changeCollage('collegeId','majorId');" >
							
								<option value="">请选择..</option>
								<#if collegeList?? >
									<#list collegeList as d>
										<#if studentInfo?? && studentInfo.college?? && studentInfo.college.id ==d.id >
											<option  value="${d.id}" selected="selected">${d.name?html}</option>
										<#else>
											<option value="${d.id}" >${d.name?html}</option>
										</#if>
									</#list>
								<#else>
									
										<#list collegeList as d>
											<option  value="${d.id}">${d.name?html}</option>
										</#list>
									
								</#if>
							</select>
							
							</#if>
						 </div>
						 <div class="span4">
							<span class="formTitle">专业   </span>
							<select size="1" id="majorId" name="major.id" aria-controls="dt_gal" class="span8"  onchange="cascade.changeMajor('majorId','classId');">
								<option value="" >请选择..</option>
								<#if studentInfo.major?? >
								<#if majorList ?? >
									<#list majorList as m>
										<#if studentInfo ?? && studentInfo.major ?? &&  studentInfo.major.id == m.id >
											<option value="${m.id}" selected >${m.majorName}</option>
										<#else>
											<option value="${m.id}">${m.majorName?html}</option>
										</#if>
									</#list>
								</#if>
							<#else>
								<#if majorList ?? >
									<#list majorList as m>
										<option  value="${m.id}">${m.majorName?html}</option>
									</#list>
								</#if>
							</#if>
							</select>
						  </div>
						<div class="span4">
							<span class="formTitle">&nbsp;&nbsp;&nbsp;班级</span>
							<select size="1" id="classId" name="classId.id" aria-controls="dt_gal" class="span8"  >
								<option value="" >请选择..</option>
								<#if classList ?? >
									<#list classList as c>
										<#if studentInfo ?? && studentInfo.classId ?? &&  studentInfo.classId.id == c.id >
											<option value="${c.id}" selected >${c.className}</option>
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
							<span class="formTitle">姓名</span>
							<#if studentInfo?? && studentInfo.name??  >
									<input id="name" name="name" maxlength="10" class="span8" value="${(studentInfo.name)!""}" />
								<#else>
									<input id="name" name="name" maxlength="10" class="span8" value="" />
								</#if>
						 </div>
						 <div class="span4">
							<span class="formTitle">学号</span>
							<#if studentInfo?? && studentInfo.stuNumber??  >
									<input id="stuNumber" name="stuNumber" maxlength="20" class="span8" value="${(studentInfo.stuNumber)!""}" />
								<#else>
									<input id="stuNumber" name="stuNumber" maxlength="20" class="span8" value="" />
								</#if>
						  </div>
						<div class="span4">
							<span class="formTitle">证件号</span>
								<#if studentInfo?? && studentInfo.name??  >
									<input id="certificateCode" name="certificateCode" maxlength="20" class="span8" value="${(studentInfo.certificateCode)!""}" />
								<#else>
									<input id="certificateCode" name="certificateCode" maxlength="20" class="span8" value="" />
								</#if>
							
						</div>
					</div>
					
					<div class="row-fluid">
					<div class="span4">
								<span class="formTitle">状态
								</span> 
								<select name="status" class="span8">
								<option value="">请选择..</option>
									<#if cancelReportList??> 
										<#list cancelReportList as state>												
											<#if studentInfo.status?? && state[0]==studentInfo.status>
												<option value="${state[0]}" selected="selected">${state[1]}</option>
											<#else>
												<#--<#if state[0]!='0'>										 												 	
										 			<option value="${state[0]}">${state[1]}</option> 
										 		</#if>-->	
										 		<option value="${state[0]}">${state[1]}</option> 
										 												
											</#if> 											
										</#list> 
									</#if>
								</select>
							</div>
								
		            <div class="span4">
		              <button class="btn btn-info"  type="submit">查 询</button>
		              <button class="btn btn-info" type="button" onclick="comp.clearForm('reportQuery');">清 空</button>
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
					                    
						                    <#if user_key.optMap??>
												<#if user_key.optMap['add']??>
						                            
						                            
						                            <#--<button class="btn btn-info" type="button"  onclick="reportExamPlan('curr','excel')" >
						                              		导出考试安排	 
						                            </button>-->
						                            
						                            
												</#if>
											</#if>
											
											 <button class="btn btn-info" type="button"  onclick="reportStudentInfo()" >
						                              		导出学生信息 
						                            </button>	
															                       
					                    </div>
					                </div>
					            </div>
					        </div>
				        
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
							<thead>
								<tr>
									<th width="4%">序号</th>
									<th width="5%">学院</th>
									<th width="5%">专业</th>
									<th width="5%">班级</th>
									<th width="5%">姓名</th>
									<th width="5%">学号</th>
									
									<th width="7%">证件号</th>
									<th width="4%">缴费</th>
									<th width="4%">绿色<br/>通道</th>
									<th width="4%">采集</th>
									<th width="4%">状态</th>
									<th width="8%">原因</th>
									
									<th width="7%">操作</th>
								</tr>
							</thead>
							<tbody>
							<#if page??>	
								<#list page.result as p>
								<tr>
									<td style="text-align:center">${p_index+1}</td>	
									<td class="autocut"><#if p.major ?? && p.major.collage ??  >${p.major.collage.name!""?html}</#if></td>
									<td class="autocut"><#if p.major ?? >${p.major.majorName!""?html}</#if></td>
									<td class="autocut"><#if p.classId ?? >${p.classId.className!""?html}</#if></td>
									<td class="autocut">${p.name!""?html} <input id="name${p.id}" type="hidden" name="" value="${(p.name)!""}"/></td>
									<td class="autocut"  style="text-align:center">${p.stuNumber!""?html}</td>
									
									<td class="autocut">${p.certificateCode!""?html}</td>
									<td class="autocut"  style="text-align:center">
									<#if p.costState ??  >
										<#if p.costState == '1'  >
											已缴
										<#else>
											<span class="f_req">未缴</span>
										</#if>
									
									<#else>
											<span class="f_req">未缴</span>
									</#if>
									</td>
									
									<td class="autocut"  style="text-align:center">
									<#if p.greenWay ??  >
										<#if p.greenWay == '1'  >
											是
										<#else>
											<span class="f_req">否</span>
										</#if>
									<#else>
											<span class="f_req">否</span>
									</#if>
									</td>
									
									<td class="autocut"  style="text-align:center">
									<#if p.collectState ??  >
										<#if p.collectState == '1'  >
											已采集
										<#else>
											<span class="f_req">未采集</span>
										</#if>
									<#else>
											<span class="f_req">未采集</span>
									</#if>
									</td>
									
									<td class="autocut"  style="text-align:center">
									<#if p.status ??  >
										<#if p.status == '0'  >
											<span class="f_req">未报到</span>
										<#else>
											<#if p.status == '1'  >
												已报到
											<#else>
												<#if p.status == '2'  >
													<span class="f_req">已撤销</span>
												<#else>
												
												
												</#if>	
													
											</#if>
											
										</#if>
									<#else>
											<span class="f_req">未报到</span>
									</#if>
									
									</td>
									<td class="autocut">
										<#if p.status ?? && p.status == '2' && p.cancelReason?? >
												${p.cancelReason!""?html}
											<#else>
												<input id="${p.id}" name="" style="width:110px;"  value="" />
										</#if>
								</select>
									
									</td>
									<td class="autocut">
									<#if p.status ?? && p.status == '2'  >
												<button class="btn btn-info" type="button" onclick="cancelReport('${(p.id)!""}','3');" >取消</button>
												<#--<a href="###" class="sepV_a" title="取消" onclick="cancelReport('${(p.id)!""}','3');"><i class="icon-ban-circle"></i></a>-->
										<#else>
									 		<button class="btn btn-info" type="button" onclick="cancelReport('${(p.id)!""}','2');" >撤销</button>
									 		<#--<a href="###" class="sepV_a" title="撤销" onclick="cancelReport('${(p.id)!""}','2');"><i class="icon-repeat"></i></a>-->
									 </#if>
									 	<button class="btn btn-info" type="button" onclick="view('${(p.id)!""}')">查看</button>
										<#--<a href="###" class="sepV_a" title="查看" onclick="view('${(p.id)!""}')"><i class="icon-list-alt"></i></a>-->
									
									</td>
									
									
								</tr>
								</#list>
							 </#if> 
							</tbody>
						</table>
						 <#assign pageTagformId="cancelReportQuery"/>
						 <#include "/page.ftl">
					</div>
				</div>
			</div> 
		</div> 
	</div>
</div>

	<#-- 学生信息弹出框 begin-->
	<div class="modal hide fade" id="editStudentBox">
		<div class="modal-header">
			<button class="close" data-dismiss="modal">×</button>
			<h3 id="title1">学生信息</h3>
		</div>
		<div class="modal-body" id="viewStudentDiv"></div>
		<div class="modal-footer">
			<a href="#" class="btn btn-info" data-dismiss="modal">关闭</a>
		</div>
	</div>
	<#-- 学生信息弹出框 end-->
</body>
</html>