<div class="row-fluid">	
	<div class="span12">
	
		<div class="formSep">
			<div class="row-fluid">
				<div class="span6">
					<label class="span3">姓名</label>
					<input id="name" name="name" <#if caucus ?? && caucus.student ??>value="${caucus.student.name!""?html}"</#if> readonly/>
				</div>
				<div class="span6">
					<label class="span3">学号</label>
					<input id="stuNumber" name="stuNumber" <#if caucus ?? && caucus.student ??>value="${caucus.student.stuNumber!""?html}"</#if> readonly/>
				</div>
			</div>
		</div>
		<div class="formSep">
			<div class="row-fluid">
				<div class="span6">
					<label class="span3">性别</label>
					<input id="name" name="name" <#if caucus ?? && caucus.student ??&& caucus.student.genderDic ??>value="${caucus.student.genderDic.name!""?html}"</#if> readonly/>
				</div>
				<div class="span6">
					<label class="span3">身份证号</label>
					<input id="stuNumber" name="stuNumber" <#if caucus ?? && caucus.student ??>value="${caucus.student.certificateCode!""?html}"</#if> readonly/>
				</div>
			</div>
		</div>
		<div class="formSep">
			<div class="row-fluid">
				<div class="span6">
					<label class="span3">班级</label>
					<input id="name" name="name" <#if caucus ?? && caucus.student ?? && caucus.student.classId ??>value="${caucus.student.classId.className!""?html}"</#if> readonly/>
				</div>
				<div class="span6">
					<label class="span3">专业</label>
					<input id="stuNumber" name="stuNumber" <#if caucus ?? && caucus.student ?? && caucus.student.major ??>value="${caucus.student.major.majorName!""?html}"</#if> readonly/>
				</div>
			</div>
		</div>
		<div class="formSep">
			<div class="row-fluid">
				<div class="span6">
					<label class="span3">学年</label>
					<input id="name" name="name" <#if caucus ?? && caucus.yearDic ??>value="${caucus.yearDic.name!""?html}"</#if> readonly/>
				</div>
				<div class="span6">
					<label class="span3">关系类型</label>
					<input id="stuNumber" name="stuNumber" <#if caucus ??>value="${caucus.caucusType!""?html}"</#if> readonly/>
				</div>
			</div>
		</div>
		<div class="formSep">
			<div class="row-fluid">
				<div class="span6">
					<label class="span3">办理情况</label>
					<input id="name" name="name" <#if caucus ?? && caucus.handleStatus ??>value="${caucus.handleStatus.name!""?html}"</#if> readonly/>
				</div>
				<div class="span6">
					<label class="span3">党费交至日期</label>
					<input id="stuNumber" name="stuNumber" <#if caucus ??>value="${caucus.partyFeeDateStr!""?html}"</#if> readonly/>
				</div>
			</div>
		</div>
		<div class="formSep">
			<div class="row-fluid">
				<div class="span6">
					<label class="span3">所属支部</label>
					<input id="name" name="name" <#if caucus ?? >value="${caucus.branchName!""?html}"</#if> readonly/>
				</div>
				<div class="span6">
					<label class="span3">转出时间</label>
					<input id="stuNumber" name="stuNumber" <#if caucus ??>value="${caucus.transferDateStr!""?html}"</#if> readonly/>
				</div>
			</div>
		</div>
		<div class="formSep">
			<div class="row-fluid">
				<div class="span6">
					<label class="span3">联系电话</label>
					<input id="name" name="name" <#if caucus ?? >value="${caucus.contactPhone!""?html}"</#if> readonly/>
				</div>
				<div class="span6">
					<label class="span3">接收党组织</label>
					<input id="stuNumber" name="stuNumber" <#if caucus??>value="${caucus.acceptedBranchName!""?html}"</#if> readonly/>
				</div>
			</div>
		</div>
		<div class="formSep">
			<div class="row-fluid">
				<div class="span9">
					<label class="span2">备注</label>
					<textarea col="120" rows="4" class="span10" readonly>${caucus.comments!""?html}</textarea>
				</div>
			</div>
		</div>
	</div>
</div>
