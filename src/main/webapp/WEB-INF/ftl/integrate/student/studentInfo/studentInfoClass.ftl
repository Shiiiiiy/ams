						<h3 class="heading">班级信息</h3>
						<div class="formSep">
							<div class="row-fluid">
								<div class="span6">
									<div class="span3">
										<label >学院</label>
									</div>
									<div class="span2">
										<#if studentUpdateInfo.stuId ?? && studentUpdateInfo.stuId.college ??>
										    <input value="${(studentUpdateInfo.stuId.college.name)!""}"   disabled="disabled"/>
										<#else>	
											<input disabled="disabled"/>
										</#if>
									</div>
								</div>
								<div class="span6">
									<div class="span3">
										<label >专业</label>
									</div>
									<div class="span2">
										<#if studentUpdateInfo.stuId?? && studentUpdateInfo.stuId.major??>
										    <input value="${(studentUpdateInfo.stuId.major.majorName)!""}"   disabled="disabled"/>
										<#else>	
											<input disabled="disabled"/>
										</#if>
									</div>
								</div>
							</div>
						</div>		
						<div class="formSep">
							<div class="row-fluid">
							    <div class="span6">
									<div class="span3">
										<label >班级</label>
									</div>
									<div class="span2">
										<#if studentUpdateInfo.stuId?? && studentUpdateInfo.stuId.classId??>
									        <input value="${(studentUpdateInfo.stuId.classId.className)!""}" disabled="disabled"/>
									    <#else>	
											<input disabled="disabled"/>
										</#if>   
									</div>
								</div>
							</div>
						</div>	
						<div class="formSep">
							<div class="row-fluid">
								<div class="span6">
									<div class="span3">
										<label >班主任</label>
									</div>
									<div class="span2">
										<#if studentUpdateInfo.stuId?? && studentUpdateInfo.stuId.classId?? && studentUpdateInfo.stuId.classId.headermaster??>
											<input value="${(studentUpdateInfo.stuId.classId.headermaster.name)!""}" disabled="disabled"/>
										 <#else>	
											<input disabled="disabled"/>
										 </#if> 	
									</div>
								</div>
								<div class="span6">
									<div class="span3">
										<label >联系方式</label>
									</div>
									<div class="span2">
										<#if teacher ??>
									        <input value="${(teacher.cellphone)!""}" disabled="disabled"/>
									    <#else>	
											<input disabled="disabled"/>
										</#if>   
									</div>
								</div>
							</div>
						</div>	
						<div class="formSep">
							<div class="row-fluid">
								<div class="span6">
									<div class="span3">
										<label >班长</label>
									</div>
									<div class="span2"> 
										<#if studentUpdateInfo.stuId?? && studentUpdateInfo.stuId.classId?? && studentUpdateInfo.stuId.classId.monitor ??>
											<input value="${(studentUpdateInfo.stuId.classId.monitor.name)!""}" disabled="disabled"/>
										 <#else>	
										    <input disabled="disabled"/>
										 </#if> 
									</div>
								</div>
								<div class="span6">
									<div class="span3">
										<label >联系方式</label>
									</div>
									<div class="span2"> 
										<#if studentUpdateInfo.stuId?? && studentUpdateInfo.stuId.classId?? && studentUpdateInfo.stuId.classId.monitor ??>
											<input value="${(studentUpdateInfo.stuId.classId.monitor.phone1)!""}" disabled="disabled"/>
										 <#else>	
										    <input disabled="disabled"/>
										 </#if> 
									</div>
								</div>
							</div>
						</div>			