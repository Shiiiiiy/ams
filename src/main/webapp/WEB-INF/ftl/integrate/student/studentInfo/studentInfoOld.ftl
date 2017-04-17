                        <h3 class="heading">个人信息</h3>
                         <div class="formSep">
							<div class="row-fluid">
								<div class="span6">
									<div class="span3" >
										<label class="span8">姓名</label>
									</div>
									<div class="span2">
										<input id="name" name="name"  value="${(studentInfo.name)!""}"   disabled="disabled"/>
									</div>
								</div>
								<div class="span6">
									<div class="span3">
										<label class="control-label">学号 </label>
									</div>
									<div class="span2">
										<input id="stuNumber" name="stuNumber"  value="${(studentInfo.stuNumber)!""}" disabled="disabled"/>
									</div>
								</div>
							</div>
						</div>
						<div class="formSep">
							<div class="row-fluid">
							    <div class="span6">
									<div class="span3">
										<label class="control-label">性别</label>
									</div>
									<div class="span2">									
									<#if studentInfo.genderDic??>
											<input value="${(studentInfo.genderDic.name)!""}"   disabled="disabled"/>
										<#else>	
											<input    disabled="disabled"/>
										</#if>								
									</div>
								 </div>
								<div class="span6">
									<div class="span3">
										<label>民族</label>
									</div>
									<div class="span2">
										<input id="national" name="national"  value="${(studentInfo.national)!""}" disabled="disabled"/>
									</div>
								</div>
							</div>
						</div>
						<div class="formSep">
							<div class="row-fluid">
							    <div class="span6">
									<div class="span3">
										<label class="control-label">血型</label>
									</div>
									<div class="span2">									
										<#if studentInfo.bloodTypeDic??>
										<input id="bloodTypeDic" value="${studentInfo.bloodTypeDic.name}" disabled="disabled" />
										<#else>
											<input disabled="disabled"/>
										</#if>							
									</div>
								 </div>
								<div class="span6">
									<div class="span3">
										<label>姓名拼音</label>
									</div>
									<div class="span2">
										<input id="namePy" name="namePy" value="${studentInfo.namePy!""?html}" disabled="disabled" />
									</div>
								</div>
							</div>
						</div>
						<div class="formSep">
						    <div class="row-fluid">
								<div class="span6">
									<div class="span3" >
										<label class="span8">曾用名</label>
									</div>
									<div class="span2">
							            <input id="oldName" name="oldName"  value="${studentInfo.oldName!""?html}" disabled="disabled"/>
									</div>
								</div>
								<div class="span6">
									<div class="span3">
										<label class="control-label">英文名 </label>
									</div>
									<div class="span2">
                                        <input id="englishName" name="englishName" value="${studentInfo.englishName!""?html}" disabled="disabled"/>													
									</div>
								</div>
							</div>
						</div>
						<div class="formSep">
							<div class="row-fluid">
							    <div class="span6">
									<div class="span3">
										<label class="control-label">宗教信仰</label>
									</div>
									<div class="span2">									
										<#if studentInfo.religionDic??>
										    <input id="religionDic" value="${studentInfo.religionDic.name}" disabled="disabled" />
										<#else>
											<input disabled="disabled"/>
										</#if>								
									</div>
								 </div>
								<div class="span6">
									<div class="span3">
										<label>政治面貌</label>
									</div>
									<div class="span2">
										<#if studentInfo.politicalDic??>
											<input value="${(studentInfo.politicalDic.name)!""}"   disabled="disabled"/>
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
										<label >身份证号</label>
									</div>
									<div class="span2">
										<input id="certificateCode" name="certificateCode"  value="${(studentInfo.certificateCode)!""}" disabled="disabled" />
									</div>
								</div>
								<div class="span6">
									<div class="span3">
										<label >出生日期</label>
									</div>
									<div class="span2">
							            <input id="brithDate" name="brithDate"  value="${(studentInfo.brithDate)!""}" disabled="disabled" /> 
									</div>
								</div>
							</div>
						</div>
						<div class="formSep">
							<div class="row-fluid">
							<div class="span6">
									<div class="span3">
										<label >常用电话</label>
									</div>
									<div class="span2">
										<input id="phone1" name="phone1"  value="${(studentInfo.phone1)!""}" disabled="disabled"/>
									</div>
								</div>
								<div class="span6">
									<div class="span3">
										<label >备用电话</label>
									</div>
									<div class="span2">
							            <input id="phone2" name="phone2"  value="${(studentInfo.phone2)!""}" disabled="disabled" />
									</div>
								</div>
							</div>
						</div>
						<div class="formSep">
							<div class="row-fluid">
							<div class="span6">
									<div class="span3">
										<label >QQ号码</label>
									</div>
									<div class="span2">
						            	<input id="qq" name="qq"  value="${(studentInfo.qq)!""}" disabled="disabled" />
									</div>
								</div>
								<div class="span6">
									<div class="span3">
										<label >电子邮件</label>
									</div>
									<div class="span2">
										<input id="email" name="email"  value="${(studentInfo.email)!""}" disabled="disabled"/>
									</div>
								</div>
							</div>
						</div>
						<div class="formSep">
							<div class="row-fluid">
							    <div class="span6">
									<div class="span3">
							    		<label>开户行</label>
							    	</div>
									<div class="span2">
										<input id="bank" name="bank"  value="${(studentInfo.bank)!""}" disabled="disabled"/>
									</div>
								</div>
								<div class="span6">
									<div class="span3">
										<label >银行卡号</label>
									</div>
									<div class="span2">
										<input id="bankCode" name="bankCode"  value="${(studentInfo.bankCode)!""}" disabled="disabled"/>
									</div>
								</div>
							</div>
						</div>
						<div class="formSep">
							<div class="row-fluid">
								<div class="span6">
									<div class="span3">
										<label >户口类型</label>
									</div>
									<div class="span2">
										<#if studentInfo.addressTypeDic??>
											<input value="${(studentInfo.addressTypeDic.name)!""}"   disabled="disabled"/>
										<#else>	
											<input    disabled="disabled"/>
										</#if>
									</div>
								</div>
								<div class="span6">
									<div class="span3">
										<label >籍贯</label>
									</div>
									<div class="span2">
						                <#if studentInfo.nativeDic??>
											<input id="addressTypeDic" value="${studentInfo.nativeDic.name}" disabled="disabled" />
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
										<label >邮编</label>
									</div>
									<div class="span2">
										<input id="homePostCode" name="homePostCode"  value="${(studentInfo.homePostCode)!""}" disabled="disabled" />
									</div>
								</div>
								<div class="span6">
									<div class="span3">
										<label >家庭电话</label>
									</div>
									<div class="span2">
							            <input id="homeTel" name="homeTel"  value="${(studentInfo.homeTel)!""}" disabled="disabled" /> 
									</div>
								</div>
							</div>
						</div>
						<div class="formSep">
							<div class="row-fluid">
							    <div class="span9">
									<div class="span2">
										<label >户籍所在地</label>
									</div>
									<div class="span8">
							            <textarea name="nativeAdd" id="nativeAdd" class="span9" disabled="disabled" rows="3" maxlength="50">${(studentInfo.nativeAdd)!""}</textarea>
									</div>
								</div>
						    </div>
						</div>
						<div class="formSep">
							<div class="row-fluid">
							    <div class="span9">
									<div class="span2">
										<label >家庭地址</label>
									</div>
									<div class="span8">
							            <textarea name="homeAddress" id="homeAddress" class="span9"  rows="3" maxlength="50" disabled="disabled">${(studentInfo.homeAddress)!""}</textarea>
									</div>
								</div>
						    </div>
						</div>
						<#if student?? >
							<#if bol ?? && bol == true><br/>
								<div class="row-fluid">
						        	<div class="span6">
										<div class="span3">
										</div>
										<div class="span8">
										    <button class="btn btn-info" type="button" onclick="edit()">
										    <#if studentUpdateInfo?? && studentUpdateInfo.status=='SUBMIT' >
											查 看   
											<#else>
											修 改
											</#if>
										    </button> 
										</div>
									</div>
								</div>
								<#else>
									<b> 当前不在学生基本信息修改时间范围内 </b>
							</#if>
						</#if>