                        <h3 class="heading">个人信息</h3>
                         <div class="formSep">
							<div class="row-fluid">
								<div class="span6">
									<div class="span3" >
										<label class="span8">姓名</label>
									</div>
									<div class="span2">
										<input id="name" name="name"  value="${(studentUpdateInfo.name)!""}"   disabled="disabled"/>
									</div>
								</div>
								<div class="span6">
									<div class="span3">
										<label class="control-label">学号 </label>
									</div>
									<div class="span2">
									<#if studentUpdateInfo?? && studentUpdateInfo.stuId??>
										<input id="stuNumber" name="stuId.stuNumber"  value="${(studentUpdateInfo.stuId.stuNumber)!""}" disabled="disabled"/>
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
										<label class="control-label">性别</label>
									</div>
									<div class="span2">									
									    <#if studentUpdateInfo.genderDic??>
											<input value="${(studentUpdateInfo.genderDic.name)!""}"   disabled="disabled"/>
										<#else>	
											<input disabled="disabled"/>
										</#if>								
									</div>
								</div>
						        <div class="span6">
									<div class="span3">
										<label>民族</label>
									</div>
									<div class="span2">
										<input id="national" name="national"  value="${(studentUpdateInfo.national)!""}" disabled="disabled"/>
                                    </div>
								</div>
						    </div>
						</div>
						<div class="formSep">
							<div class="row-fluid">
								<div class="span6">
									<div class="span3" >
										<label class="span8">血型</label>
									</div>
									<div class="span2">
										<#if studentUpdateInfo.bloodTypeDic??>
										    <input id="bloodTypeDic" value="${studentUpdateInfo.bloodTypeDic.name}" disabled="disabled" />
										<#else>
											<input disabled="disabled"/>
										</#if>
									</div>
								</div>
								<div class="span6">
									<div class="span3">
										<label class="control-label">姓名拼音</label>
									</div>
									<div class="span2">
										<input id="namePy" name="namePy" value="${studentUpdateInfo.namePy!""?html}" disabled="disabled" /> 
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
										<input id="name" name="name"  value="${(studentUpdateInfo.oldName)!""}"   disabled="disabled"/>
									</div>
								</div>
								<div class="span6">
									<div class="span3">
										<label class="control-label">英文名</label>
									</div>
									<div class="span2">
                                        <input id="englishName" name="englishName" value="${studentUpdateInfo.englishName!""?html}" disabled="disabled"/> 
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
									    <#if studentUpdateInfo.religionDic??>
											<input value="${(studentUpdateInfo.religionDic.name)!""}"   disabled="disabled"/>
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
										<#if studentInfo.politicalDic ??>
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
							            <input id="brithDate" name="brithDate"  value="${(studentUpdateInfo.brithDate)!""}" disabled="disabled" /> 
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
										<input id="phone1" name="phone1"  value="${(studentUpdateInfo.phone1)!""}" disabled="disabled"/>
									</div>
								</div>
								<div class="span6">
									<div class="span3">
										<label >备用电话</label>
									</div>
									<div class="span2">
										<input id="phone1" name="phone1"  value="${(studentUpdateInfo.phone2)!""}" disabled="disabled"/>
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
						            	<input id="qq" name="qq"  value="${(studentUpdateInfo.qq)!""}" disabled="disabled" />
									</div>
								</div>
								<div class="span6">
									<div class="span3">
										<label >电子邮件</label>
									</div>
									<div class="span2">
										<input id="email" name="email"  value="${(studentUpdateInfo.email)!""}" disabled="disabled"/>
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
										<input id="bank" name="bank"  value="${(studentUpdateInfo.bank)!""}" disabled="disabled"/>
									</div>
								</div>
								<div class="span6">
									<div class="span3">
										<label >银行卡号</label>
									</div>
									<div class="span2">
										<input id="bankCode" name="bankCode"  value="${(studentUpdateInfo.bankCode)!""}" disabled="disabled"/>
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
										<#if studentUpdateInfo.addressTypeDic??>
											<input value="${(studentUpdateInfo.addressTypeDic.name)!""}"   disabled="disabled"/>
										<#else>	
											<input disabled="disabled"/>
										</#if>
									</div>
								</div>
								<div class="span6">
									<div class="span3">
										<label >籍贯</label>
									</div>
									<div class="span2">
                                        <#if studentUpdateInfo.nativeDic??>
											<input value="${studentUpdateInfo.nativeDic.name!""}" disabled="disabled" />
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
										<input id="homePostCode" name="homePostCode"  value="${(studentUpdateInfo.homePostCode)!""}" disabled="disabled" />
									</div>
								</div>
								<div class="span6">
									<div class="span3">
										<label >家庭电话</label>
									</div>
									<div class="span2">
							            <input id="homeTel" name="homeTel"  value="${(studentUpdateInfo.homeTel)!""}" disabled="disabled" /> 
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
										<textarea name="nativeAdd" id="nativeAdd" class="span9" disabled="disabled" rows="3" maxlength="50">${(studentUpdateInfo.nativeAdd)!""}</textarea>
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
										<textarea name="homeAddress" id="homeAddress" class="span9" disabled="disabled" rows="3" maxlength="50">${(studentUpdateInfo.homeAddress)!""}</textarea>
									</div>
								</div>
							</div>
						</div>	
						<br/>
							<div class="row-fluid">
					        	<div class="span6">
									<div class="span3">
									</div>
									<div class="span8">
									<#if bol ?? && bol == true>
									    <#if studentUpdateInfo?? && studentUpdateInfo.status=='SUBMIT' >
											<button class="btn btn-info" type="button" onclick="edit()">查 看</button> 
										<#else>
											<button class="btn btn-info" type="button" onclick="edit()">修 改</button> 
											<#if studentUpdateInfo?? && studentUpdateInfo.processStatus ?? && studentUpdateInfo.processStatus=='REJECT' >
											 <b> (修改信息审核未通过，可再次编辑修改) </b>
											 </#if>
										</#if>
									    <#else>
											<b>当前时间不在学生可修改信息时间设置范围内 </b>
									</#if>
									</div>
								</div>
							</div>
							