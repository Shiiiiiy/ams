			                <div class="formSep">
								<div class="row-fluid">
								    <div class="span6">
									    <div class="span3">
											<label>联系单位负责人</label>
	                                    </div>
									    <div class="span9">										
									        <input id="unitManager" name="unitManager.id" type="hidden" class="span6" <#if activity ?? && activity.unitManager ??>value="${activity.unitManager.name!""?html}"</#if>/>
											<input id="unitManagerName" name="unitManagerName" type="text" readonly="true" <#if activity ?? && activity.unitManager ??>value="${activity.unitManager.name!""?html}"</#if>/>
	                                    </div>
									</div>
								</div>	
	                        </div>
	                        <div class="formSep">
								<div class="row-fluid">
								    <div class="span6">
								        <div class="span3">
										    <label>办公电话</label>
                                        </div>
									    <div class="span9">										
									        <input id="unitPhone" name="unitPhone" value="${activity.unitPhone!""?html}" readonly/>	
									    </div>
									</div>
									<div class="span6">
								        <div class="span3">
										    <label class="span3">手机</label>
										</div>
									    <div class="span9">
										    <input id="unitCellphone" name="unitCellphone" value="${activity.unitCellphone!""?html}" readonly/>	
										</div>
									</div>
								</div>	
	                        </div>