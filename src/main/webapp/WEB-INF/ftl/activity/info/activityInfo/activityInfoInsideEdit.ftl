							<div class="formSep">
								<div class="row-fluid">
								    <div class="span6">
										<label class="span3">联系单位负责人<span class="f_req">*</span></label>
									    <div class="span9">
											<input id="unitManager" name="unitManager.id" type="hidden"<#if activity ?? && activity.unitManager ??>value="${activity.unitManager.id!""?html}"</#if>/>
											<input id="unitManagerName" name="unitManagerName" type="text" readonly="true" <#if activity ?? && activity.unitManager ??>value="${activity.unitManager.name!""?html}"</#if>/>
									        <a id="course-lecture-select"  style="margin-left: -4px;;margin-top:-10px" href="javascript:void(0);" onclick="selectSchoolTeacherRadio('unitManager')" class="btn"><i class="icon-search"></i></a>
									    </div>
									</div>
								</div>	
	                        </div>
	                        <div class="formSep">
								<div class="row-fluid">
								    <div class="span6">
										<label class="span3">办公电话<span class="f_req">*</span></label>
									    <div class="span9">
											<input id="unitPhone" name="unitPhone" type="text" value="${activity.unitPhone!""?html}" />	
									    </div>
									</div>
									<div class="span6">
										<label class="span3">手机</label>
									    <div class="span9">
											<input id="unitCellphone" name="unitCellphone" type="text" value="${activity.unitCellphone!""?html}" />	
									    </div>
									</div>
								</div>	
	                        </div>