                   <div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
								    <label>活动名称</label>
                                </div>
								<div class="span9">
									<input id="activityName" name="activityName" <#if activity??>value="${activity.activityName!""?html}"</#if> readonly />
                                </div>
							</div>
							<div class="span6">
								<div class="span3">
									<label>活动类别</label>
                                </div>
								<div class="span9">
									<#if activity?? && activity.activityCategory ??>
										<input id="activityCategory" type="hidden" name="activityCategory.id" value="${activity.activityCategory.id!""?html}"/>
									    <input value="${activity.activityCategory.name!""?html}" readonly/>
									<#else>
										<input id="activityCategory" name="activityCategory" value="" readonly/>
									</#if>
                                </div>
                            </div>
						</div>
					</div>
					<div class="formSep">
						<div class="row-fluid">
						    <div class="span6">
								<div class="span3">
									<label>活动类型</label>
                                </div>
								<div class="span9">
									<#if activity ?? && activity.activityType ??>
									   <input id="activityType" type="hidden" name="activityType.id" value="${activity.activityType.id!""?html}"/>
									   <input value="${activity.activityType.name!""?html}" readonly/>
									<#else>
									   <input id="activityType" name="activityType" value="" readonly/>
									</#if>
                                </div>
							</div>
							<div class="span6">
								<div class="span3">
									<label>活动报名方式</label>
                                </div>
								<div class="span9">
									<#if activity ?? && activity.registraForm ??>
									   <input id="registraForm" type="hidden" name="registraForm.id" value="${activity.registraForm.id!""?html}"/>
									   <input value="${activity.registraForm.name!""?html}" readonly/>
									<#else>
									   <input id="registraForm" name="registraForm" value="" readonly/>
									</#if>
                                </div>
							</div>
						</div>
					</div>
					<div class="formSep">
						<div class="row-fluid">
						    <div class="span6">
						        <div class="span3">
									<label>活动级别</label>
								</div>
						        <div class="span9">
									<#if activity?? && activity.activityLevel ??>
										<input value="${activity.activityLevel.name!""?html}" readonly/>
									<#else>
										<input value="" readonly/>
									</#if>
								</div>												
							</div>
							<div class="span6" id="association">
						        <div class="span3">
									<label>社团名称</label>
								</div>
						        <div class="span9">
									<#if activity?? && activity.association ??>
										<input value="${activity.association.associationRegisterName!""?html}" readonly/>
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
									<label>活动时间</label>
                                </div>
								<div class="span9">
	                            	<input id="activityTime" name="activityTime" class="Wdate" <#if activity ?? && activity.activityTime ??> value="${(activity.activityTime!"")?string("yyyy-MM-dd")}" </#if> readonly/>												
                                </div>
							</div>
							<div class="span6">
								<div class="span3">
								<label>活动地点</label>
                                </div>
                                <div class="span9 address"  style="display:none">
									<input id="activityAddress" name="activityAddress" type="text" <#if activity ??>value="${activity.activityAddress!""?html}"</#if> readonly />
							    </div>
							    <div class="span9 vaddress" style="display:none">
									<input id="volunteerAddress" name="volunteerAddress.id" type="text" <#if activity ?? && activity.volunteerAddress ??>value="${activity.volunteerAddress.officeAddress!""?html}"</#if> readonly />
								</div>
							</div>
						</div>
					</div>
					<div class="formSep">
						<div class="row-fluid">
						    <div class="span6">
								<div class="span3">
								<label>活动组织部门联系人</label>
                                </div>
								<div class="span9">
							    <input id="_manager" name="manager.id" type="hidden" class="span6" <#if activity ?? && activity.contacts ??>value="${activity.contacts.name!""?html}"</#if>/>
								<input id="_managerName" name="_managerName" type="text" readonly="true" <#if activity ?? && activity.contactTeachers ??>value="${activity.contactTeachers.name!""?html}" <#elseif activity ?? && activity.contactStudents ??>value="${activity.contactStudents.name!""?html}" </#if>/>
                                </div>
							</div>
							<div class="span6">
								<div class="span3">
								<label>联系电话</label>
                                </div>
								<div class="span9">
								<input id="managerPhone" name="managerPhone" <#if activity ??>value="${activity.managerPhone!""?html}"</#if> readonly/>	
                                </div>
							</div>
						</div>	
                    </div>
                    <div class="formSep">
						<div class="row-fluid">
						    <div class="span6">
								<div class="span3">
								<label>参与人员数目</label>
                                </div>
								<div class="span9">
								<input id="members" name="members" <#if activity ??>value="${activity.members!""?html}"</#if> readonly/>
                                </div>
							</div>
							<div class="span6">
								<div class="span3">
								<label>工作人员数目</label>
                                </div>
								<div class="span9">
								<input id="workerNum" name="workerNum" <#if activity ??>value="${activity.workerNum!""?html}"</#if> readonly/>
                                </div>
							</div>
						</div>
					</div>
	                <div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
								<label>工作人员</label>
                                </div>
								<div class="span9">
								<input id="_workerIds" name="workerIds" type="hidden" value="${(workerIds!"")?html}" class="span6" />
								<textarea name="workerNames" id="_workerNames" cols="12" rows="3" class="span9" readonly="true">${((activity.workers)!"")?html}</textarea>
                                </div>
							</div>
						</div>
					</div>
					<div class="activityCategoryIn" style="display:none">
	                	<#include "/activity/info/activityInfo/activityInfoInsideReadonlyEdit.ftl">
	                </div>
	                <div class="activityCategoryOut" style="display:none">
	                	<#include "/activity/info/activityInfo/activityInfoOutsideReadonlyEdit.ftl">
	                </div>
	                <div class="formSep" >
						<div class="row-fluid" >
						    <div class="span9">
								<label class="span2">组织部门<span class="f_req"></span></label>
								<div class="span10">
	                            	<textarea name="organizer" readonly id="organizer" class="span10" rows="5">${(activity.organizer)!""}</textarea>
							    </div>
							</div>
						</div>	
	                </div>
	                <div class="formSep">
						<div class="row-fluid">
						    <div class="span9">
						        <div class="span2">
								<label>活动简介</label>
                                </div>
								<div class="span10">
	                            <textarea name="activityIntro" id="activityIntro" class="span10"  rows="5" readonly><#if activity ??>${(activity.activityIntro)!""}</#if></textarea>
                                </div>
							</div>
						</div>	
	                </div>
	                <div class="formSep">
						<div class="row-fluid">
						    <div class="span9">
						        <div class="span2">
								<label>活动安全安排</label>
                                </div>
								<div class="span10">
	                            <textarea name="security" id="security" class="span10"  rows="5" readonly><#if activity ??>${(activity.security)!""}</#if></textarea>
                                </div>
	                        </div>
						</div>
                    </div>	