					<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<label class="span3">学号</label>
							<input id="stuNumber" name="stuId.stuNumber" 
							<#if studentInfo.status?? && studentInfo.status='SAVE'>
							     value="${studentInfo.stuId.stuNumber!""?html}"
							<#else>
								 value="${studentInfo.stuNumber!""?html}"
							</#if>
							 readonly/>
						</div>
						<div class="span6">
							<label class="span3">姓名</label>
							<input id="name" name="name" value="${studentInfo.name!""?html}" readonly/>
						</div>
					</div>
					</div>
					<div class="formSep">
					<div class="row-fluid">
					    <div class="span6">
							<label class="span3">性别</label>
							<input id="genderDic" name="genderDic.id" type="hidden"
							<#if studentInfo ?? && studentInfo.genderDic ??>
							value="${studentInfo.genderDic.id!""?html}" 
							</#if>
							/>
							<input id="genderDic"
							<#if studentInfo ?? && studentInfo.genderDic ??>
							value="${studentInfo.genderDic.name!""?html}" 
							</#if>
							readonly/>														
						</div>
						<div class="span6">
							<label class="span3">出生日期</label> 
							<input id="brithDate" name="brithDate" readonly <#if studentInfo.brithDate ??> value="${(studentInfo.brithDate!"")?string("yyyy-MM-dd")}" </#if> /> 
						</div>
					</div>
					</div>
					<div class="formSep">					
					<div class="row-fluid">
						<div class="span6">
							<label class="span3">曾用名</label>
							<input id="oldName" name="oldName" type="text" value="${studentInfo.oldName!""?html}" />
						</div>
						<div class="span6">
							<label class="span3">英文名</label>
                            <input id="englishName" name="englishName" type="text" class="tipTag" data="提示信息&lt;br/&gt;请输入英文字母" value="${studentInfo.englishName!""?html}" />													
						</div>
					</div>
					</div>
					<div class="formSep">
					<div class="row-fluid">
					    <div class="span6">
							<label class="span3">民族</label>
							<input id="national" name="national" type="text"value="${(studentInfo.national)!""}" />
						</div>
						<div class="span6">
							<label class="span3">姓名拼音</label>
							<input id="namePy" name="namePy" type="text" class="tipTag" data="提示信息&lt;br/&gt;请输入英文字母" value="${studentInfo.namePy!""?html}"  />
						</div>
					</div>
					</div>
					<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<label class="span3">血型</label>
							<select size="1" id="bloodTypeDic" name="bloodTypeDic.id" aria-controls="dt_gal" >
							<option value="">请选择..</option>
							  <#if bloodTypeDic??>
						         <#list bloodTypeDic as c>
								   <#if studentInfo ?? && studentInfo.bloodTypeDic ?? && studentInfo.bloodTypeDic.id == c.id>
										<option  value="${c.id}" selected="selected">${c.name}</option>	
									<#else>
										<option value="${c.id}" >${c.name}</option>
									</#if>
								</#list>
					         </#if>
					       </select>
						</div>
						<div class="span6">
							<label class="span3">宗教信仰</label>
							<select size="1" id="religionDic" name="religionDic.id" aria-controls="dt_gal" >
							 <option value="">请选择..</option>
							  <#if religionDic??>
						         <#list religionDic as c>
								   <#if studentInfo ?? && studentInfo.religionDic ?? && studentInfo.religionDic.id == c.id>
										<option  value="${c.id}" selected="selected">${c.name}</option>	
									<#else>
										<option value="${c.id}" >${c.name}</option>
									</#if>
								</#list>
					         </#if>
					        </select>
						</div>
					</div>
					</div>
					<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<label class="span3">常用电话<span class="f_req">*</span></label>
							<input id="phone1" name="phone1" type="text" value="${(studentInfo.phone1)!""}" onchange="isPhone()"/>
						</div>
						<div class="span6">
							<label class="span3">备用电话</label>
							<input id="phone2" name="phone2" type="text" value="${(studentInfo.phone2)!""}" />
						</div>
					</div>
					</div>
					<div class="formSep">
					<div class="row-fluid">
					    <div class="span6">
							<label class="span3">QQ号码<span class="f_req">*</span></label>
							<input id="qq" name="qq" type="text" value="${(studentInfo.qq)!""}" />
						</div>
						<div class="span6">
							<label class="span3">电子邮件</label>
							<input id="email" name="email" type="text" value="${(studentInfo.email)!""}" />
						</div>
					</div>
					</div>
					<div class="formSep">
					<div class="row-fluid">
					    <div class="span6">
							<label class="span3">开户行<span class="f_req">*</span></label>
							<input id="bank" name="bank" type="text" value="${(studentInfo.bank)!""}" />
						</div>
						<div class="span6">
							<label class="span3">银行卡号<span class="f_req">*</span></label>
							<input id="bankCode" name="bankCode" type="text" value="${(studentInfo.bankCode)!""}" />
						</div>
					</div>
					</div>
					<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<label class="span3">户口类型<span class="f_req">*</span></label>
								<select size="1" id="addressTypeDic" name="addressTypeDic.id" aria-controls="dt_gal" >
									<option value="">请选择..</option>
									  <#if addressTypeDic??>
								         <#list addressTypeDic as c>
										   <#if studentInfo ?? && studentInfo.addressTypeDic ?? && studentInfo.addressTypeDic.id == c.id>
												<option  value="${c.id}" selected="selected">${c.name}</option>	
											<#else>
												<option value="${c.id}" >${c.name}</option>
											</#if>
										</#list>
							         </#if>
							    </select>
						</div>
						<div class="span6">
							<label class="span3"> 籍贯 </label> 
							<select size="1" id="nativeDic" name="nativeDic.id" aria-controls="dt_gal" >
								<option value="">请选择..</option>
									<#if nativeDic??>
								      <#list nativeDic as c>
										<#if studentInfo ?? && studentInfo.nativeDic ?? && studentInfo.nativeDic.id == c.id>
											<option  value="${c.id}" selected="selected">${c.name}</option>	
										<#else>
											<option value="${c.id}" >${c.name}</option>
										</#if>
									  </#list>
							        </#if>
							</select>	 
					    </div>
					</div>
					</div>
					<div class="formSep">
					<div class="row-fluid">
					    <div class="span6">
							<label class="span3">邮编</label> 
							<input id="homePostCode" name="homePostCode" type="text" value="${(studentInfo.homePostCode)!""}" /> 
						</div>
						<div class="span6">
							<label class="span3">家庭电话</label>
							<input id="homeTel" name="homeTel" type="text" value="${(studentInfo.homeTel)!""}" /> 
						</div>
					</div>
					</div>
					<div class="formSep">
					<div class="row-fluid">
						<div class="span9">
							<label class="span2">户籍所在地 </label> 
							<textarea name="nativeAdd" id="nativeAdd" class="span9" rows="3" maxlength="50">${(studentInfo.nativeAdd)!""}</textarea>
					    </div>
				    </div>
					</div>   
					<div class="formSep">
					<div class="row-fluid">
					    <div class="span9">
							<label class="span2">家庭住址</label>
							<textarea name="homeAddress" id="homeAddress" class="span9" rows="3" maxlength="50">${(studentInfo.homeAddress)!""}</textarea>
						</div>
				    </div>
					</div>
					<div class="formSep">
					<div class="row-fluid">
					    <div class="span6">
							<label class="span3">父亲姓名</label> 
							<input id="guardianName1" name="guardianName1" type="text" <#if studentGuardianUpdate1??>value="${(studentGuardianUpdate1.guardianName)!""}"</#if> /> 
						</div>
						<div class="span6">
							<label class="span3">父亲手机号</label>
							<input id="guardianPhone1" name="guardianPhone1" type="text" <#if studentGuardianUpdate1??>value="${(studentGuardianUpdate1.guardianPhone)!""}"</#if> /> 
						</div>
					</div>
					</div>
					<div class="formSep">
					<div class="row-fluid">
					    <div class="span6">
							<label class="span3">父亲邮箱</label> 
							<input id="guardianEmail1" name="guardianEmail1" type="text" <#if studentGuardianUpdate1??>value="${(studentGuardianUpdate1.guardianEmail)!""}"</#if> /> 
						</div>
						<div class="span6">
							<label class="span3">父亲邮编</label>
							<input id="guardianPostCode1" name="guardianPostCode1" type="text" <#if studentGuardianUpdate1??>value="${(studentGuardianUpdate1.guardianPostCode)!""}"</#if> /> 
						</div>
					</div>
					</div>
					<div class="formSep">
					<div class="row-fluid">
					    <div class="span6">
							<label class="span3">父亲工作单位</label> 
							<textarea id="guardianWorkUnit1" name="guardianWorkUnit1" class="span8" rows="2" maxlength="50" /><#if studentGuardianUpdate1??>${(studentGuardianUpdate1.guardianWorkUnit)!""}</#if>  </textarea>
						</div>
					    <div class="span6">
							<label class="span3">父亲住址</label>
							<textarea name="guardianAddress1" id="guardianAddress1" class="span8" rows="2" maxlength="50"><#if studentGuardianUpdate1??>${(studentGuardianUpdate1.guardianAddress)!""}</#if></textarea>
						</div>
				    </div>
					</div>
					<div class="formSep">
					<div class="row-fluid">
					    <div class="span6">
							<label class="span3">母亲姓名</label>
							<input id="guardianName2" name="guardianName2" type="text" <#if studentGuardianUpdate2??>value="${(studentGuardianUpdate2.guardianName)!""}"</#if> /> 
						</div>
						<div class="span6">
							<label class="span3">母亲手机号</label>
							<input id="guardianPhone2" name="guardianPhone2" type="text" <#if studentGuardianUpdate2??>value="${(studentGuardianUpdate2.guardianPhone)!""}"</#if> /> 
						</div>
					</div>
					</div>
					<div class="formSep">
					<div class="row-fluid">
					    <div class="span6">
							<label class="span3">母亲邮箱</label> 
							<input id="guardianEmail2" name="guardianEmail2" type="text" <#if studentGuardianUpdate2??>value="${(studentGuardianUpdate2.guardianEmail)!""}"</#if> /> 
						</div>
						<div class="span6">
							<label class="span3">母亲邮编</label>
							<input id="guardianPostCode2" name="guardianPostCode2" type="text" <#if studentGuardianUpdate2??>value="${(studentGuardianUpdate2.guardianPostCode)!""}"</#if> /> 
						</div>
					</div>
					</div>
					<div class="formSep">
					<div class="row-fluid">
					    <div class="span6">
							<label class="span3">母亲工作单位</label> 
							<textarea name="guardianWorkUnit2" id="guardianWorkUnit2" class="span8" rows="2" maxlength="50"><#if studentGuardianUpdate2??>${(studentGuardianUpdate2.guardianWorkUnit)!""}</#if></textarea>
						</div>
					    <div class="span6">
							<label class="span3">监护人住址</label>
							<textarea name="guardianAddress2" id="guardianAddress2" class="span8" rows="2" maxlength="50"><#if studentGuardianUpdate2??>${(studentGuardianUpdate2.guardianAddress)!""}</#if></textarea>
						</div>
				    </div>
					</div>
					<div class="formSep">
					<div class="row-fluid">
					    <div class="span6">
							<label class="span3">监护人姓名</label>
							<input id="guardianName3" name="guardianName3" type="text" <#if studentGuardianUpdate3??>value="${(studentGuardianUpdate3.guardianName)!""}"</#if> /> 
						</div>
						<div class="span6">
							<label class="span3">监护人手机号</label>
							<input id="guardianPhone3" name="guardianPhone3" type="text" <#if studentGuardianUpdate3??>value="${(studentGuardianUpdate3.guardianPhone)!""}"</#if> /> 
						</div>
					</div>
					</div>
					<div class="formSep">
					<div class="row-fluid">
					    <div class="span6">
							<label class="span3">监护人邮箱</label> 
							<input id="guardianEmail3" name="guardianEmail3" type="text" <#if studentGuardianUpdate3??>value="${(studentGuardianUpdate3.guardianEmail)!""}"</#if> /> 
						</div>
						<div class="span6">
							<label class="span3">监护人邮编</label>
							<input id="guardianPostCode3" name="guardianPostCode3" type="text" <#if studentGuardianUpdate3??>value="${(studentGuardianUpdate3.guardianPostCode)!""}"</#if> /> 
						</div>
					</div>
					</div>
					<div class="formSep">
					<div class="row-fluid">
					    <div class="span6">
							<label class="span3">监护人工作单位</label> 
							<textarea name="guardianWorkUnit3" id="guardianWorkUnit3" class="span8" rows="2"><#if studentGuardianUpdate3??>${(studentGuardianUpdate3.guardianWorkUnit)!""}</#if></textarea>
						</div>
					    <div class="span6">
							<label class="span3">监护人住址</label>
							<textarea name="guardianAddress3" id="guardianAddress3" class="span8" rows="2" maxlength="50"><#if studentGuardianUpdate3??>${(studentGuardianUpdate3.guardianAddress)!""}</#if></textarea>
						</div>
				    </div>
					</div>