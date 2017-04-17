</script> 
			<input name="errorText" id="errorText" type="hidden" value="${errorText!" "}"/>
			<form id="editNewStudentInfoForm" class="form_validation_reg"  method="post">
			
			<#if newStudent?? >
					<input id="newStudentId" type="hidden" name="id" value="${(newStudent.id)!""}">
				
				<input id="type" type="hidden" name="type"/>
				
				<div class="formSep">
					<div class="row-fluid">
						<div class="span4">
							<div class="span3">
								<label>姓名</label>
							</div>
							<div class="span8">
								<div class="span8">
								<input name=""   readOnly="readOnly" value="${(newStudent.name)!""}"/>
							</div>
								
							</div>
						</div>
						<div class="span4">
							<div class="span3">
								<label>学号</label>
							</div>
							<div class="span8">
								<input name=""  readOnly="readOnly"  value="${(newStudent.stuNumber)!""}"/>
							</div>
						</div>
						<div class="span4">
							<div class="span3">
								<label>性别</label>
							</div>
							<div class="span8">
							 <#if newStudent.genderDic ??  >
									<input name=""  readOnly="readOnly"  value="${(newStudent.genderDic.name)!""}"/>
								<#else>
									<input name="" readOnly="readOnly"  value=""/>
							</#if>
							</div>
						</div>
					</div>
				</div>
				
				<div class="formSep">
					<div class="row-fluid">
						<div class="span4">
							<div class="span3">
								<label>证件号码</label>
							</div>
							<div class="span8">
								<div class="span8">
								<input name="certificate" readOnly="readOnly"  value="${(newStudent.certificateCode)!""}"/>
							</div>
								
							</div>
						</div>
						<div class="span4">
							<div class="span3">
								<label>毕业学校</label>
							</div>
							<div class="span8">
								<input name=""  readOnly="readOnly" value="${(newStudent.graduation)!""}"/>
							</div>
						</div>
						<div class="span4">
							<div class="span3">
								<label>录取总分</label>
							</div>
							<div class="span8">
								<input name=""  readOnly="readOnly"  value="${(newStudent.enterScore)!""}"/>
							</div>
						</div>
					</div>
				</div>
				
				<div class="formSep">
					<div class="row-fluid">
						<div class="span4">
							<div class="span3">
								<label>学院</label>
							</div>
							<div class="span8">
								<div class="span8">
									<#if newStudent.college ??  >
										<input name=""  readOnly="readOnly"  value="${(newStudent.college.name)!""}"/>
									<#else>
										<input name="" readOnly="readOnly"  value=""/>
									</#if>
							</div>
								
							</div>
						</div>
						<div class="span4">
							<div class="span3">
								<label>专业</label>
							</div>
							<div class="span8">
								<#if newStudent.major ??  >
									<input name=""  readOnly="readOnly"  value="${(newStudent.major.majorName)!""}"/>
								<#else>
									<input name=""  readOnly="readOnly"  value=""/>
								</#if>
							</div>
						</div>
						<div class="span4">
							<div class="span3">
								<label>班级</label>
							</div>
							<div class="span8">
								<#if newStudent.classId ??  >
									<input name="" readOnly="readOnly"  value="${(newStudent.classId.className)!""}"/>
								<#else>
									<input name="" readOnly="readOnly"  value=""/>
								</#if>
							</div>
						</div>
					</div>
				</div>
				
				<div class="formSep">
					<div class="row-fluid">
						<div class="span4">
							<div class="span3">
								<label>宿舍</label>
							</div>
							<div class="span8">
								<div class="span8">
								<#if newStudent.dorm ??  >
									<input name="" readOnly="readOnly"  value="${(newStudent.dorm)!""}"/>
								<#else>
									<input name="" readOnly="readOnly"  value=""/>
								</#if>
							</div>
								
							</div>
						</div>
						
						
						<div class="span4">
							<div class="span3">
								<label>出生日期</label>
							</div>
							<div class="span8">
								<#if newStudent.brithDate ??  >
									<input name=""  readOnly="readOnly"  value='${(newStudent.brithDate!"")?string("yyyy-MM-dd")}'/>
								<#else>
									<input name="" readOnly="readOnly"  value=""/>
								</#if>
							</div>
							
						</div>
						
						
						<div class="span4">
							<div class="span3">
								<label>政治面貌</label>
							</div>
							<div class="span8">
								
								<#if newStudent.politicalDic ??  >
									<input name=""  readOnly="readOnly" value="${(newStudent.politicalDic.name)!""}"/>
								<#else>
									<input name=""  readOnly="readOnly"  value=""/>
								</#if>
							</div>
								
						</div>
						
					</div>
				</div>
				
				<div class="formSep">
					<div class="row-fluid">
					
					
					<div class="span4">
							<div class="span3">
								<label>民族</label>
							</div>
							<div class="span8">
								<#if newStudent.national ??  >
									<input name="" readOnly="readOnly"  value="${(newStudent.national)!""}"/>
								<#else>
									<input name="" readOnly="readOnly"  value=""/>
								</#if>
							</div>
							
						</div>
						
						<div class="span4">
							<div class="span3">
								<label>籍贯</label>
							</div>
							<div class="span8">
								<#if newStudent.nativeDic ??  >
									<input name="" readOnly="readOnly"  value="${(newStudent.nativeDic.name)!""}"/>
								<#else>
									<input name=""  readOnly="readOnly"  value=""/>
								</#if>
							</div>
								
						</div>
						
						<div class="span4">
							<div class="span3">
								<label>健康状况</label>
							</div>
							<div class="span8">
								<div class="span8">
								<#if newStudent.marriageDic ??  >
									<input name="" readOnly="readOnly"  value="${(newStudent.healthStateDic.name)!""}"/>
								<#else>
									<input name="" readOnly="readOnly"  value=""/>
								</#if>
							</div>
								
							</div>
						</div>
						
						
						
					</div>
				</div>	
				
				
				
				<div class="formSep">
					<div class="row-fluid">
						
						
						<div class="span4">
							<div class="span3">
								<label>收费状态</label>
							</div>
							<div class="span8">
								<#if newStudent.costState ?? && newStudent.costState=='1' >
									<input name=""  readOnly="readOnly" value='已缴'/>
									<#--<label>已缴</label>-->
									
								<#else>
									<#--<input name=""  readOnly="readOnly" value="未缴"/>-->
									
									<label><span class="f_req" >未缴</span></label>
								</#if>
							</div>
							
						</div>
						
						<div class="span4">
							<div class="span3">
								<label>绿色通道</label>
							</div>
							<div class="span8">
								<div class="span8">
								<#if newStudent.greenWay ?? && newStudent.greenWay=='1' >
									<input name="" readOnly="readOnly"  value="是"/>
									
								<#else>
									<#--<input name="" readOnly="readOnly"  value="否"/>-->
									<label><span class="f_req" >否</span></label>
								</#if>
							</div>
								
							</div>
						</div>
						
						<div class="span4">
							<div class="span3">
								<label>贷款类型</label>
							</div>
							<div class="span8">
								<#if newStudent.greenReason ??  >
									<input name=""  readOnly="readOnly" value="${(newStudent.greenReason.name)!""}"/>
								<#else>
									<input name=""  readOnly="readOnly" value=""/>
								</#if>
							</div>
								
						</div>
						
						
					</div>
				</div>
					
					
					<div class="formSep">
					<div class="row-fluid">
						
						
						<div class="span4">
							<div class="span3">
								<label>报到状态</label>
							</div>
							<div class="span8">
								<#if newStudent.status ?? >
								
									<#if newStudent.status=='1' >
										<input id='statusId' name=""  readOnly="readOnly" value='已报到'/>
									<#else>
										<#if newStudent.status=='2' >
											<input id='statusId' name=""  readOnly="readOnly" value='已撤销'/>
										<#else>
											<input id='statusId' name=""  readOnly="readOnly" value="未报到"/>
										</#if>
									</#if>
								<#else>
									<input id='statusId' name=""  readOnly="readOnly" value="未报到"/>
								</#if>
							</div>
							
						</div>
						
						<div class="span4">
							<div class="span3">
								<label>报到时间</label>
							</div>
							<div class="span8">
								<div class="span8">
								<#if newStudent.reportDate ??  >
									<input id='reportDateId' name="" readOnly="readOnly"  value="${(newStudent.reportDate!"")?string("yyyy-MM-dd HH:mm:ss")}"/>
								<#else>
									<input id='reportDateId' name="" readOnly="readOnly"  value=""/>
								</#if>
							</div>
								
							</div>
						</div>
						
						
						<div class="span4">
							<div class="span3">
								<label>撤销原因</label>
							</div>
							<div class="span8">
								<#if newStudent.cancelReason?? >
									<input name=""  readOnly="readOnly" value='${(newStudent.cancelReason)!""}'/>
								<#else>
									<input name=""  readOnly="readOnly" value=""/>
								</#if>
							</div>
							
						</div>
						
						
					</div>
				</div>
				
				<div class="btnCenter"  >
				
								<#if newStudent.status ?? >
								
									<#if newStudent.status=='1' >
											<button id="reportId" class="btn btn-info" type="button"  style='display:none;' onclick="cerSceneReport('${(newStudent.id)!""}')">报到</button>
										 <button id="unReportId" class="btn btn-info"  type="button"  style='' onclick="unCerSceneReport('${(newStudent.id)!""}')" >取消报到</button>
										 <button id="printId"  class="btn btn-info" type="button"  style='' onclick="printReport('${rc.contextPath}/scene/report/opt-print/nsm/printReport.do?id=${newStudent.id}')"  >打印报到流程单</button>
									<#else>
										<#if newStudent.status=='2' >
											
										<#else>
											<button id="reportId" class="btn btn-info" type="button" style=''  onclick="cerSceneReport('${(newStudent.id)!""}')">报到</button>
											<button id="unReportId" class="btn btn-info"  type="button" style='display:none;' onclick="unCerSceneReport('${(newStudent.id)!""}')" >取消报到</button>
											<button id="printId"  class="btn btn-info" type="button" style='display:none;' onclick="printReport('${rc.contextPath}/scene/report/opt-print/nsm/printReport.do?id=${newStudent.id}')"  >打印报到流程单</button>
											
										</#if>
									</#if>
								<#else>
									<button id="reportId" class="btn btn-info"   type="button" style='' onclick="cerSceneReport('${(newStudent.id)!""}')" >报到</button>
									<button id="unReportId" class="btn btn-info"  type="button" style='display:none;' onclick="unCerSceneReport('${(newStudent.id)!""}')" >取消报到</button>
									<button id="printId"  class="btn btn-info" type="button" style='display:none;' onclick="printReport('${rc.contextPath}/scene/report/opt-print/nsm/printReport.do?id=${newStudent.id}')"  >打印报到流程单</button>
								</#if>
				
		              	
		            </div>
				
				<#else>
					<span class="f_req">此身份证没有对应的新生信息！</span>
					
				</#if>
			</form>
			<br>
					
			