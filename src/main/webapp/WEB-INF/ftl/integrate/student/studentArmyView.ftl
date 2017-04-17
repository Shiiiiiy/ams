<html>
 <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
    <script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
    <!-- animated progressbars -->
    <script src="${rc.contextPath}/js/bdp_fileupload.progressbar.js"></script>
    <script src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script> 
 </head>
<body>
<div id="contentwrapper">
    <div class="main_content">   
        <div class="row-fluid">	
				<div class="span12">
					<div class="formSep">
					<div class="row-fluid">
						<div class="span5">
							<label class="span4">姓名</label>
							<input id="name" name="name" <#if studentArmyInfo ?? && studentArmyInfo.student ??>value="${studentArmyInfo.student.name!""?html}"</#if> readonly/>
						</div>
						<div class="span5">
							<label class="span4">学号</label>
							<input id="stuNumber" name="stuNumber" <#if studentArmyInfo ?? && studentArmyInfo.student ??>value="${studentArmyInfo.student.stuNumber!""?html}"</#if> readonly/>
						</div>
					</div>
					</div>
					<div class="formSep">
					<div class="row-fluid">
					    <div class="span5">
							<label class="span4">性别</label>
                            <input id="genderDic" <#if studentArmyInfo ?? && studentArmyInfo.student ?? && studentArmyInfo.student.genderDic??>value=${studentArmyInfo.student.genderDic.name!""?html}</#if> readonly>													
						</div>
						<div class="span5">
							<label class="span4">学院</label>
							<input id="college" name="national" <#if studentArmyInfo ?? && studentArmyInfo.student ?? && studentArmyInfo.student.college ??>value="${(studentArmyInfo.student.college.name)!""}"</#if> readonly/>
						</div>
					</div>
					</div>
					<div class="formSep">
					<div class="row-fluid">
						<div class="span5">
							<label class="span4">专业</label>
							<input id="major" <#if studentArmyInfo ?? && studentArmyInfo.student ?? && studentArmyInfo.student.major ??>value="${(studentArmyInfo.student.major.majorName)!""}"</#if> readonly />
						</div>
						<div class="span5">
							<label class="span4">班级</label>
							<input id="class" <#if studentArmyInfo ?? && studentArmyInfo.student ?? && studentArmyInfo.student.classId ??>value="${(studentArmyInfo.student.classId.className)!""}"</#if> readonly />
						</div>
					</div>
					</div>
					<div class="formSep">
					<div class="row-fluid">
					    <div class="span5">
							<label class="span4">身份证号</label> 
							<input id="certificateCode" <#if studentArmyInfo ?? && studentArmyInfo.student ??>value="${(studentArmyInfo.student.certificateCode)!""}"</#if> readonly /> 
						</div>
						<div class="span5">
							<label class="span4">学制</label>
							<input id="major" <#if studentArmyInfo ?? && studentArmyInfo.student ?? && studentArmyInfo.student.major ??>value="${(studentArmyInfo.student.major.schoolYear)!""}"</#if> readonly />
						</div>
					</div>	
					</div>
					<div class="formSep">
					<div class="row-fluid">
					    <div class="span5">
							<label class="span4">最后学历</label> 
							<input id="degrees" value="${(studentArmyInfo.degrees)!""}" readonly /> 
						</div>
					    <div class="span5">
							<label class="span4">入学时间</label>
							<input id="entranceDate" value="<#if studentArmyInfo ?? >${(studentArmyInfo.entranceDate!"")}</#if>" readonly />
						</div>
					</div>	
					</div>
					<div class="formSep">
					<div class="row-fluid">
						<div class="span5">
							<label class="span4">毕业时间</label>
							<input id="graduationDate" value="<#if studentArmyInfo ??>${(studentArmyInfo.graduationDate!"")}</#if>" readonly />
						</div>
						<div class="span5">
							<label class="span4">参军时间</label> 
							<input id="armyDate" value="<#if studentArmyInfo ??>${(studentArmyInfo.armyDate!"")}</#if>" readonly /> 
						</div>
					</div>
					</div>
					<div class="formSep">
					<div class="row-fluid">
						<div class="span5">
							<label class="span4">应缴学费</label>
								<input id="tuitionFees" <#if studentArmyInfo ?? && studentArmyInfo.tuitionFees!=0>value="${studentArmyInfo.tuitionFees}"</#if> readonly />
					    </div>
						<div class="span5">
							<label class="span4">实缴学费</label> 
							<input id="paidFees" <#if studentArmyInfo ?? && studentArmyInfo.paidFees!=0>value="${studentArmyInfo.paidFees}"</#if> readonly />
					    </div>
					</div>
					</div>
					<div class="formSep">
					<div class="row-fluid">
					    <div class="span5">
							<label class="span4">获贷金额</label> 
							<input id="loanAmount" <#if studentArmyInfo ?? && studentArmyInfo.loanAmount!=0>value="${(studentArmyInfo.loanAmount)!""}"</#if> readonly /> 
						</div>
						<div class="span5">
							<label class="span4">学费补偿金额</label> 
							<input id="compensationAmount" <#if studentArmyInfo ?? && studentArmyInfo.compensationAmount!=0>value="${(studentArmyInfo.compensationAmount)!""}"</#if> readonly /> 
						</div>
					</div>
					</div>
					<div class="formSep">
					<div class="row-fluid">
						<div class="span5">
							<label class="span4">贷款代偿金额小计</label>
							<input id="loanCount" <#if studentArmyInfo ?? && studentArmyInfo.loanCount!=0>value="${(studentArmyInfo.loanCount)!""}"</#if> readonly />
						</div>
						<div class="span5">
							<label class="span4">贷款代偿金额本金</label>
							<input id="loanPrincipal" <#if studentArmyInfo ?? && studentArmyInfo.loanPrincipal!=0>value="${(studentArmyInfo.loanPrincipal)!""}"</#if> readonly /> 
						</div>
					</div>
					</div>
					<div class="formSep">
					<div class="row-fluid">
					    <div class="span5">
							<label class="span4">退役复学资助金额</label>
							<input id="supportFees" <#if studentArmyInfo ?? && studentArmyInfo.supportFees!=0>value="${(studentArmyInfo.supportFees)!""}"</#if> readonly /> 
						</div>
					    <div class="span5">
							<label class="span4">学生类别</label> 
							<input id="stuCategory" <#if studentArmyInfo ??>value="${(studentArmyInfo.stuCategory)!""}"</#if> readonly /> 
						</div>
					</div>	
					</div>
					<div class="formSep">
					<div class="row-fluid">
					     <div class="span10">
							<label class="span2">参军信息备注</label>
							&nbsp;<textarea name="remark" id="remark" class="span9" cols="180" rows="3" readonly><#if studentArmyInfo??>${(studentArmyInfo.remark)!""}</#if></textarea>
						 </div>
					 </div>	
					</div>
					<br/>
					<div class="row-fluid">
					     <div class="span5">
							<div class="span4"></div>
		                    <button class="btn" type="button" onclick="window.close();">关  闭</button>
		                 </div>
		            </div>	
				</div> 
			</div>
        </div>
    </div>
</body>
</html>
