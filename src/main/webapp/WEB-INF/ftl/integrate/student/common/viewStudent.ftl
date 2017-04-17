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
