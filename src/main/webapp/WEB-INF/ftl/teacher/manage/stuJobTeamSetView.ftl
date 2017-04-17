<style>
	.img-sty{background:#fff; width:190px; height:275px; border:1px solid #bce8f1;}
	.img-this{width:190px; height:275px; margin-left:-30px;}
</style>
<div class="formSep">
	<div class="row-fluid">
		<div class="span6">
			<div class="span3">
				<label>教师姓名</label>
			</div>
			<div class="span9">
				<input id="teacherName" name="teacher.name" value="<#if tim.teacher ??>${(tim.teacher.name)!""}</#if>" readonly/>
			</div>
		</div>
		<div class="span6">
			<div class="span3">
				<label>学院&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
			</div>
			<div class="span9">
				<input id="college" name="college.name" value="<#if college??>${college.name!""}</#if>" readonly/>
			</div>
		</div>
	</div>
</div>	

<div class="formSep">
	<div class="row-fluid">
		<div class="span6">
			<div class="span3">
				<label>教师工号</label>
			</div>
			<div class="span9">
				<input id="teacher.id" name="teacher.id" value="<#if tim.teacher??>${(tim.teacher.id)!""}</#if>" readonly/>
			</div>
		</div>
		<div class="span6">
			<div class="span3">
				<label>出生日期</label>
			</div>
			<div class="span9">
				<input id="birthday" name="teacher.birthday" value="<#if tim.teacher?? && tim.teacher.birthday??>${(tim.teacher.birthday)?string("yyyy-MM-dd")}</#if>" readonly/>
			</div>
		</div>
	</div>
</div>

<div class="formSep">
	<div class="row-fluid">
		<div class="span6">
			<div class="span3">
				<label>性别&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
			</div>
			<div class="span9">
				<input id="gender" name="teacher.gender.name" value="<#if tim.teacher??&& tim.teacher.gender??>${(tim.teacher.gender.name)!""}</#if>" readonly/>
			</div>
		</div>
					
		<div class="span6">
			<div class="span3">
				<label>年龄&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
			</div>
			<div class="span9">
				<input id="age" name="age" value="<#if age??>${age!""}</#if>" readonly>
			</div>
		</div>
	</div>
</div>

<div class="formSep">
	<div class="row-fluid">
		<div class="span6">
			<div class="span3">
				<label>身份证号</label>
			</div>
			<div class="span9">
				<input id="idNumber" name="teacher.idNumber" value="<#if tim.teacher??>${(tim.teacher.idNumber)!""}</#if>" readonly/>
			</div>
		</div>
		<div class="span6">
			<div class="span3">
				<label>邮箱&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
			</div>
			<div class="span9">
				<input id="email" name="email" class="not_edit" value="${tim.email!""}" readonly/>
			</div>
		</div>
	</div>
</div>

<div class="formSep">
	<div class="row-fluid">
		<div class="span6">
			<div class="span3">
				<label>家庭地址</label>
			</div>
			<div class="span9">
				<input id="address" name="address" value="<#if tim.address ??>${tim.address!""}</#if>" readonly/>
			</div>
		</div>
		<div class="span6">
			<div class="span3">
				<label>联系电话</label>
			</div>
			<div class="span9">
				<input id="cellphone" name="cellphone" value="<#if tim.cellphone ??>${tim.cellphone!""}</#if>" readonly/>
			</div>
		</div>
	</div>
</div>
	
<div class="formSep">
	<div class="row-fluid">
		<div class="span6">
			<div class="span3">
				<label>工作电话</label>
			</div>
			<div class="span9">
				<input id="phoneNumber" name="phoneNumber" value="<#if tim.phoneNumber ??>${tim.phoneNumber!""}</#if>" readonly/>
			</div>
		</div>
		<div class="span6">
			<div class="span3">
				<label>邮编&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
			</div>
			<div class="span9">
				<input id="postCode" name="postCode" value="<#if tim.postCode ??>${tim.postCode!""}</#if>" readonly/>
			</div>
		</div>
	</div>
</div>

<div class="formSep">
	<div class="row-fluid">
		<div class="span6">
			<div class="span3">
				<lable>所获荣誉</lable>
			</div>
			<div class="span9">
				<textarea class="span12" name="honour" rows="12" style="width:580px;" readonly>${tim.honour!""}</textarea>
			</div>
		</div>
	</div>
</div>

<div class="formSep">
	<div class="row-fluid">
		<div class="span6">
			<div class="span3">
				<lable>授课风格</lable>
			</div>
			<div class="span9">
				<textarea class="span12" name="teachingStyle" rows="12" style="width:580px;" readonly >${tim.teachingStyle!""}</textarea>
			</div>
		</div>
	</div>
</div>
<#if listFile?? && listFile?size gt 0>
<div class="formSep">
	<div class="row-fluid">
		<div class="span6">
			<div class="span3">
				<lable>头像</lable>
			</div>
			<div class="span9" id="_upload_div">
				 <#list listFile as lf>
					<div class="alert alert-info img-sty">
						<img src="${rc.contextPath}/sys/sysConfig/file.do?id=${lf.uploadFile.id}" class="img-this" />
						<input type="hidden" name="fileId" value="${lf.uploadFile.id}"/>	
					</div>	
				 </#list>			
			</div>
		</div>
	</div>
</div>
</#if> 
