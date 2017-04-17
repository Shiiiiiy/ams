                     <h3 class="heading">班级信息</h3>
						<div class="formSep">
							<div class="row-fluid">
								<div class="span6">
									<div class="span3">
										<label >学院</label>
									</div>
									<div class="span2">
										<#if studentInfo.college??>
										    <input value="${(studentInfo.college.name)!""}"   disabled="disabled"/>
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
										<#if studentInfo.major??>
										    <input value="${(studentInfo.major.majorName)!""}"   disabled="disabled"/>
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
									    <#if studentInfo.classId??>
									        <input value="${(studentInfo.classId.className)!""}" disabled="disabled"/>
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
										<#if studentInfo.classId?? && studentInfo.classId.headermaster?? >
											<input value="${(studentInfo.classId.headermaster.name)!""}" disabled="disabled"/>
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
									    <#if teacher??>
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
									     <#if studentInfo.classId?? && studentInfo.classId.monitor??>
											<input value="${(studentInfo.classId.monitor.name)!""}" disabled="disabled"/>
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
									     <#if studentInfo.classId?? && studentInfo.classId.monitor??>
											<input value="${(studentInfo.classId.monitor.phone1)!""}" disabled="disabled"/>
										 <#else>	
										    <input disabled="disabled"/>
										 </#if> 
									</div>
								</div>
							</div>
						</div>		