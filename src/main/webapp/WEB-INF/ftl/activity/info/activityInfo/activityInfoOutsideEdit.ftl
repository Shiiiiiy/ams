							<div class="formSep">
								<div class="row-fluid">
									<div class="span9">
										<label class="span2">带队老师<span class="f_req">*</span></label>
									    <div class="span10">
										    <input id="_teacherIds" name="teacherIds" type="hidden" class="span6" value="${teacherIds!""?html}"/>
											<textarea name="teacherNames" id="_teacherNames" cols="12" rows="5" class="span8" readonly="true">${teacherNames!""?html}</textarea>
											<button class="btn btn-info" type="button" onclick="selectTeacherCheck('_teacher')">选 择</button>
			                            </div>
									</div>
								</div>
							</div>
							<div class="college">
								<div class="formSep">
									<div class="row-fluid">
									    <div class="span6">
											<label class="span3">学院</label>
										    <!--<#if (activity ?? && activity.college ??)||(student ?? && (!(activity ??) || (activity ?? && !(activity.college ??))) && student ?? && student.college ??)>
												<input id="" name="" value="${student.college.name!""?html}"/>
											</#if>-->
										    <div class="span9">
										    	<#if activity ?? >
										    		<#if activity.collegeIds ??>
														<input id="hiddenCollegeIds" type="hidden"  value="${activity.collegeIds!""?html}"/>
													</#if>
													<#if activity.majorIds ??>
														<input id="hiddenMajorIds" type="hidden"  value="${activity.majorIds!""?html}"/>
													</#if>
													<#if activity.classIds ??>
														<input id="hiddenClassIds" type="hidden"  value="${activity.classIds!""?html}"/>
													</#if>
												</#if>
										    	 <#if collegeList ??>
													    <#list collegeList as g>
											    			<lable><input id="${g.id!''}" name="collegeIds" type="checkbox" value="${g.id!''}" onclick="selectAllMajor(${g.id!''})"/>${g.name}</lable><br/>
											    		</#list>
												</#if>
				                            <!--<select size="1" id="collegeId" name="college.id" aria-controls="dt_gal"  onchange="cascade.changeCollage('collegeId','majorId','classId');">
												<option value="">请选择..</option>
												<#if collegeList ??>
												    <#list collegeList as g>
														<#if activity ?? && activity.college ?? && activity.college.id == g.id>
															<option  value="${g.id}" selected="selected">${g.name}</option>	
														<#else>
															<option value="${g.id}" >${g.name}</option>
														</#if>
													</#list>
												</#if>
											</select>	-->
				                            </div>
										 </div>
										 <div class="span6">
											 <label class="span3">专业</label>
										     <div class="span9" id="appendMajor">
					                             <!--<select size="1" id="majorId" name="major.id" aria-controls="dt_gal" onchange="cascade.changeMajor('majorId','classId');">
													  <option value="">请选择..</option>
													  <#if majorList ??>
												          <#list majorList as g>
															    <#if activity ?? && activity.major ?? && activity.major.id == g.id>
																    <option  value="${g.id}" selected="selected">${g.majorName}</option>
														        <#else>
																    <option value="${g.id}" >${g.majorName}</option>
															    </#if>
													      </#list>
													  </#if>
												  </select>	-->
										     </div>
										 </div>
										 <#--->
										  <div class="span4">
											<label class="span3">班级</label>
										    <div class="span9" id="appendClassId">
				                          
				                            </div>
										  </div>
										  <-->
								    </div>
								</div>
							</div>
	                        <div class="formSep">
								<div class="row-fluid">
								    <div class="span9">
										<label class="span2">交通安排<span class="f_req">*</span></label>
									    <div class="span10">
			                            	<textarea name="trafficPlan" id="trafficPlan" class="span9"  rows="5">${activity.trafficPlan!""?html}</textarea>
			                            </div>
			                        </div>
								</div>
	                        </div>
                     