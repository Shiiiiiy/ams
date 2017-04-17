	<div class="formSep">
    <div class="row-fluid">
		<div class="span6">
			<span class="span3">学号</span>
			<input id="stuNumber" name="stuId.stuNumber" value="${studentInfo.stuId.stuNumber!""?html}" readonly/>
		</div>
		<div class="span6">
			<span class="span3">姓名</span>
			<input id="name" name="name" value="${studentInfo.name!""?html}" readonly/>
		</div>
	</div>
	</div>
	<div class="formSep">
    <div class="row-fluid">
    <div class="span6">
			<span class="span3">性别</span>
			<#if studentInfo.genderDic??>
            <input id="genderDic" value=${studentInfo.genderDic.name} readonly>		
            <#else>
            <input disabled="disabled"/>
            </#if>											
	</div>
	<div class="span6">
		<span class="span3">姓名拼音</span>
		<input id="namePy" name="namePy" value="${studentInfo.namePy!""?html}" readonly />
	</div>
    </div>
	</div>
	<div class="formSep">
	<div class="row-fluid">
		<div class="span6">
			<span class="span3">曾用名</span>
			<input id="oldName" name="oldName"  value="${studentInfo.oldName!""?html}" readonly/>
		</div>
		<div class="span6">
			<span class="span3">英文名</span>
            <input id="englishName" name="englishName" value="${studentInfo.englishName!""?html}" readonly/>													
		</div>
	</div>
	</div>
	<div class="formSep">
	<div class="row-fluid">
	    <div class="span6">
			<span class="span3">民族</span>
			<input id="national" name="national" value="${(studentInfo.national)!""}" readonly/>
		</div>
		<div class="span6">
			<span class="span3">宗教信仰</span>
			<#if studentInfo.religionDic??>
			    <input id="religionDic" value="${studentInfo.religionDic.name}" readonly />
			<#else>
				<input disabled="disabled"/>
			</#if>
		</div>
	</div>
	</div>
	<div class="formSep">
	<div class="row-fluid">
	<div class="span6">
			<span class="span3">血型</span>
			<#if studentInfo.bloodTypeDic??>
			<input id="bloodTypeDic" value="${studentInfo.bloodTypeDic.name}" readonly />
			<#else>
				<input disabled="disabled"/>
			</#if>
	</div>
	<div class="span6">
			<span class="span3"> <label >出生日期</label> </span> 
			<input id="brithDate" name="brithDate"  value="${(studentInfo.brithDate)!""}" readonly /> 
		</div>
	</div>
	</div>
	<div class="formSep">
	<div class="row-fluid">
		<div class="span6">
			<span class="span3">常用电话</span>
			<input id="phone1" name="phone1"  value="${(studentInfo.phone1)!""}" readonly />
		</div>
		<div class="span6">
			<span class="span3">备用电话</span>
			<input id="phone2" name="phone2"  value="${(studentInfo.phone2)!""}" readonly />
		</div>
	</div>
	</div>
	<div class="formSep">
	<div class="row-fluid">
		<div class="span6">
			<span class="span3">QQ号码</span>
			<input id="qq" name="qq"  value="${(studentInfo.qq)!""}" readonly />
		</div>
		<div class="span6">
			<span class="span3">电子邮件</span>
			<input id="email" name="email"  value="${(studentInfo.email)!""}" readonly />
		</div>
	</div>	
	</div>
	<div class="formSep">
	<div class="row-fluid">
	    <div class="span6">
			<label class="span3">开户行</label>
			<input id="bank" name="bank"  value="${(studentInfo.bank)!""}" readonly/>
		</div>
		<div class="span6">
			<label class="span3">银行卡号</label>
			<input id="bankCode" name="bankCode"  value="${(studentInfo.bankCode)!""}" readonly/>
		</div>
	</div>
	</div>
	<div class="formSep">
	<div class="row-fluid">
		<div class="span6">
			<span class="span3">户口类型</span>
			<#if studentInfo.addressTypeDic??>
				<input id="addressTypeDic" value="${studentInfo.addressTypeDic.name}" readonly />
			<#else>
				<input disabled="disabled"/>
			</#if>
	    </div>
		<div class="span6">
			<span class="span3"> 籍贯 </span> 
			<#if studentInfo.nativeDic??>
			<input id="addressTypeDic" value="${studentInfo.nativeDic.name}" readonly />
			<#else>
				<input disabled="disabled"/>
			</#if>
	    </div>
	</div>
	</div>
	<div class="formSep">
	<div class="row-fluid">
		<div class="span6">
			<span class="span3">家庭电话</span>
			<input id="homeTel" name="homeTel"  value="${(studentInfo.homeTel)!""}" readonly /> 
		</div>
		<div class="span6">
			<span class="span3">邮编</span> 
			<input id="homePostCode" name="homePostCode"  value="${(studentInfo.homePostCode)!""}" readonly />
		</div>
	</div>
	</div>
	<div class="formSep">
	<div class="row-fluid">
		<div class="span9">
			<span class="span2">户籍所在地 </span> 
			<textarea name="nativeAdd" id="nativeAdd" class="span9"  rows="3" maxlength="50" readonly>${(studentInfo.nativeAdd)!""}</textarea>
		</div>
	</div>
	</div>
	<div class="formSep">
	<div class="row-fluid">
		<div class="span9">
			<span class="span2">家庭住址</span>
			<textarea name="homeAddress" id="homeAddress" class="span9"  rows="3" maxlength="50" readonly>${(studentInfo.homeAddress)!""}</textarea>
		</div>
	</div>
	</div>
	<div class="formSep">
	<div class="row-fluid">
	    <div class="span6">
			<label class="span3">父亲姓名</label> 
			<input id="guardianName1" name="guardianName1" type="text" readonly <#if studentGuardianUpdate1??>value="${(studentGuardianUpdate1.guardianName)!""}"</#if> /> 
		</div>
		<div class="span6">
			<label class="span3">父亲手机号</label>
			<input id="guardianPhone1" name="guardianPhone1" type="text" readonly <#if studentGuardianUpdate1??>value="${(studentGuardianUpdate1.guardianPhone)!""}"</#if> /> 
		</div>
	</div>
	</div>
	<div class="formSep">
	<div class="row-fluid">
	    <div class="span6">
			<label class="span3">父亲邮箱</label> 
			<input id="guardianEmail1" name="guardianEmail1" type="text" readonly <#if studentGuardianUpdate1??>value="${(studentGuardianUpdate1.guardianEmail)!""}"</#if> /> 
		</div>
		<div class="span6">
			<label class="span3">父亲邮编</label>
			<input id="guardianPostCode1" name="guardianPostCode1" type="text" readonly <#if studentGuardianUpdate1??>value="${(studentGuardianUpdate1.guardianPostCode)!""}"</#if> /> 
		</div>
	</div>
	</div>
	<div class="formSep">
	<div class="row-fluid">
	    <div class="span6">
			<label class="span3">父亲工作单位</label> 
			<textarea name="guardianWorkUnit1" id="guardianWorkUnit1" readonly class="span8" rows="2" maxlength="50"><#if studentGuardianUpdate1??>${(studentGuardianUpdate1.guardianWorkUnit)!""}</#if> </textarea>
		</div>
	    <div class="span6">
			<label class="span3">父亲住址</label>
			<textarea name="guardianAddress1" id="guardianAddress1" readonly class="span8" rows="2" maxlength="50"><#if studentGuardianUpdate1??>${(studentGuardianUpdate1.guardianAddress)!""}</#if></textarea>
		</div>
    </div>
	</div>
	<div class="formSep">
	<div class="row-fluid">
	    <div class="span6">
			<label class="span3">母亲姓名</label>
			<input id="guardianName2" name="guardianName2" type="text" readonly <#if studentGuardianUpdate2??>value="${(studentGuardianUpdate2.guardianName)!""}"</#if> /> 
		</div>
		<div class="span6">
			<label class="span3">母亲手机号</label>
			<input id="guardianPhone2" name="guardianPhone2" type="text" readonly <#if studentGuardianUpdate2??>value="${(studentGuardianUpdate2.guardianPhone)!""}"</#if> /> 
		</div>
	</div>
	</div>
	<div class="formSep">
	<div class="row-fluid">
	    <div class="span6">
			<label class="span3">母亲邮箱</label> 
			<input id="guardianEmail2" name="guardianEmail2" type="text" readonly <#if studentGuardianUpdate2??>value="${(studentGuardianUpdate2.guardianEmail)!""}"</#if> /> 
		</div>
		<div class="span6">
			<label class="span3">母亲邮编</label>
			<input id="guardianPostCode2" name="guardianPostCode2" type="text" readonly <#if studentGuardianUpdate2??>value="${(studentGuardianUpdate2.guardianPostCode)!""}"</#if> /> 
		</div>
	</div>
	</div>
	<div class="formSep">
	<div class="row-fluid">
	    <div class="span6">
			<label class="span3">母亲工作单位</label> 
			<textarea name="guardianWorkUnit2" id="guardianWorkUnit2" class="span8" readonly rows="2"><#if studentGuardianUpdate2??>${(studentGuardianUpdate2.guardianWorkUnit)!""}</#if> </textarea> 
		</div>
	    <div class="span6">
			<label class="span3">监护人住址</label>
			<textarea name="guardianAddress2" id="guardianAddress2" class="span8" readonly rows="2"><#if studentGuardianUpdate2??>${(studentGuardianUpdate2.guardianAddress)!""}</#if></textarea>
		</div>
    </div>
	</div>
	<div class="formSep">
	<div class="row-fluid">
	    <div class="span6">
			<label class="span3">监护人姓名</label>
			<input id="guardianName3" name="guardianName3" type="text" readonly <#if studentGuardianUpdate3??>value="${(studentGuardianUpdate3.guardianName)!""}"</#if> /> 
		</div>
		<div class="span6">
			<label class="span3">监护人手机号</label>
			<input id="guardianPhone3" name="guardianPhone3" type="text" readonly <#if studentGuardianUpdate3??>value="${(studentGuardianUpdate3.guardianPhone)!""}"</#if> /> 
		</div>
	</div>
	</div>
	<div class="formSep">
	<div class="row-fluid">
	    <div class="span6">
			<label class="span3">监护人邮箱</label> 
			<input id="guardianEmail3" name="guardianEmail3" type="text" readonly <#if studentGuardianUpdate3??>value="${(studentGuardianUpdate3.guardianEmail)!""}"</#if> /> 
		</div>
		<div class="span6">
			<label class="span3">监护人邮编</label>
			<input id="guardianPostCode3" name="guardianPostCode3" type="text" readonly <#if studentGuardianUpdate3??>value="${(studentGuardianUpdate3.guardianPostCode)!""}"</#if> /> 
		</div>
	</div>
	</div>
	<div class="formSep">
	<div class="row-fluid">
	    <div class="span6">
			<label class="span3">监护人工作单位</label> 
			<textarea name="guardianWorkUnit3" id="guardianWorkUnit3" class="span8" readonly rows="2"><#if studentGuardianUpdate3??>${(studentGuardianUpdate3.guardianWorkUnit)!""}</#if> </textarea> 
		</div>
	    <div class="span6">
			<label class="span3">监护人住址</label>
			<textarea name="guardianAddress3" id="guardianAddress3" class="span8" readonly rows="2"><#if studentGuardianUpdate3??>${(studentGuardianUpdate3.guardianAddress)!""}</#if></textarea>
		</div>
    </div>
	</div>