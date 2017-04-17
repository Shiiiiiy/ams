							<div class="formSep">
								<div class="row-fluid">
								    <div class="span6">
								        <div class="span3">
										    <label>学院</label>
									    </div>
									    <div class="span9">
											<#if activity?? && activity.collegeIds ??>
												<input value="${activity.collegeIds!""?html}" onBlur="inputClick(this)" onMouseOver="this.title=this.value;" readonly/>
											<#else>
												<input value="" readonly/>
											</#if>
									    </div>
									</div>
									<div class="span6">
										<div class="span3">
											<label>专业</label>
										</div>
										<div class="span9">
											<#if activity?? && activity.majorIds ??>
												<input value="${activity.majorIds!""?html}" onBlur="inputClick(this)" onMouseOver="this.title=this.value;" readonly/>
											<#else>
												<input value="" readonly/>
											</#if>
										</div>
									</div>
								</div>
							</div>
							<div class="formSep">
								<div class="row-fluid">
								    <div class="span6">
										<div class="span3">
											<label>班级</label>
										</div>
										<div class="span9">
											<#if activity?? && activity.classIds ??>
												<input value="${activity.classIds!""?html}" onBlur="inputClick(this)" onMouseOver="this.title=this.value;" readonly/>
											<#else>
												<input value="" readonly/>
											</#if>
										</div>
									</div>
								</div>
							</div>
							<div class="formSep">
								<div class="row-fluid">
									<div class="span6">
										<div class="span3">
											<label>带队老师</label>
				                        </div>
										<div class="span9">
										    <input id="_teacherIds" name="teacherIds" type="hidden" class="span6" value="${teacherIds!""?html}"/>
											<textarea name="leadTeacherNames" id="_leadTeacherNames" cols="12" rows="3" class="span9" readonly="true">${(teacherNames!"")?html}</textarea>
				                        </div>
									</div>
								</div>
							</div>
	                        <div class="formSep">
								<div class="row-fluid">
								    <div class="span9">
										<div class="span2">
											<label>交通安排</label>
				                        </div>
										<div class="span10">
				                            <textarea name="trafficPlan" id="trafficPlan" class="span10"  rows="5" readonly>${(activity.trafficPlan)!""}</textarea>
				                        </div>
			                        </div>
								</div>
	                        </div>
	                        