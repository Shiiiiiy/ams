</script> 
			<input name="errorText" id="errorText" type="hidden" value="${errorText!" "}"/>
			<form id="editNewStudentInfoForm" class="form_validation_reg"  method="post">
					<input id="newStudentId" type="hidden" name="id" value="${(newStudent.id)!""}">
				
				<input id="type" type="hidden" name="type"/>
				
				<div class="formSep">
					<div class="row-fluid">
						<div class="span4">
							<div class="span3">
								<label>姓名</label>
							</div>
							<div class="span8">
								<div class="span8">
								<input name=""   readOnly="readOnly" value="${(newStudent.name)!""}"/>
							</div>
								
							</div>
						</div>
						<div class="span4">
							<div class="span3">
								<label>学号</label>
							</div>
							<div class="span8">
								<input name=""  readOnly="readOnly"  value="${(newStudent.stuNumber)!""}"/>
							</div>
						</div>
						<div class="span4">
							<div class="span3">
								<label>性别</label>
							</div>
							<div class="span8">
							 <#if newStudent.genderDic ??  >
									<input name=""  readOnly="readOnly"  value="${(newStudent.genderDic.name)!""}"/>
								<#else>
									<input name="" readOnly="readOnly"  value=""/>
							</#if>
							</div>
						</div>
					</div>
				</div>
				
				<div class="formSep">
					<div class="row-fluid">
						<div class="span4">
							<div class="span3">
								<label>证件号码</label>
							</div>
							<div class="span8">
								<div class="span8">
								<input name="certificate" readOnly="readOnly"  value="${(newStudent.certificateCode)!""}"/>
							</div>
								
							</div>
						</div>
						<div class="span4">
							<div class="span3">
								<label>毕业学校</label>
							</div>
							<div class="span8">
								<input name=""  readOnly="readOnly" value="${(newStudent.graduation)!""}"/>
							</div>
						</div>
						<div class="span4">
							<div class="span3">
								<label>录取总分</label>
							</div>
							<div class="span8">
								<input name=""  readOnly="readOnly"  value="${(newStudent.enterScore)!""}"/>
							</div>
						</div>
					</div>
				</div>
				
				<div class="formSep">
					<div class="row-fluid">
						<div class="span4">
							<div class="span3">
								<label>学院</label>
							</div>
							<div class="span8">
								<div class="span8">
									<#if newStudent.college ??  >
										<input name=""  readOnly="readOnly"  value="${(newStudent.college.name)!""}"/>
									<#else>
										<input name="" readOnly="readOnly"  value=""/>
									</#if>
							</div>
								
							</div>
						</div>
						<div class="span4">
							<div class="span3">
								<label>专业</label>
							</div>
							<div class="span8">
								<#if newStudent.major ??  >
									<input name=""  readOnly="readOnly"  value="${(newStudent.major.majorName)!""}"/>
								<#else>
									<input name=""  readOnly="readOnly"  value=""/>
								</#if>
							</div>
						</div>
						<div class="span4">
							<div class="span3">
								<label>班级</label>
							</div>
							<div class="span8">
								<#if newStudent.classId ??  >
									<input name="" readOnly="readOnly"  value="${(newStudent.classId.className)!""}"/>
								<#else>
									<input name="" readOnly="readOnly"  value=""/>
								</#if>
							</div>
						</div>
					</div>
				</div>
				
				<div class="formSep">
					<div class="row-fluid">
						<div class="span4">
							<div class="span3">
								<label>宿舍</label>
							</div>
							<div class="span8">
								<div class="span8">
								<#if newStudent.dorm ??  >
									<input name="" readOnly="readOnly"  value="${(newStudent.dorm)!""}"/>
								<#else>
									<input name="" readOnly="readOnly"  value=""/>
								</#if>
							</div>
								
							</div>
						</div>
						<div class="span4">
							<div class="span3">
								<label>姓名拼音</label>
							</div>
							<div class="span8">
								
								<input name=""  readOnly="readOnly"  value="${(newStudent.namePy)!""}"/>
								
							</div>
						</div>
						<div class="span4">
							<div class="span3">
								<label>英文名</label>
							</div>
							<div class="span8">
								<#if newStudent.englishName ??  >
									<input name="" readOnly="readOnly"  value="${(newStudent.englishName)!""}"/>
								<#else>
									<input name="" readOnly="readOnly"  value=""/>
								</#if>
							</div>
						</div>
					</div>
				</div>
				
				<div class="formSep">
					<div class="row-fluid">
						<div class="span4">
							<div class="span3">
								<label>曾用名</label>
							</div>
							<div class="span8">
								<div class="span8">
								
									<input name="" readOnly="readOnly"  value="${(newStudent.oldName)!""}"/>
								
							</div>
								
							</div>
						</div>
						<div class="span4">
							<div class="span3">
								<label>政治面貌</label>
							</div>
							<div class="span8">
								
								<#if newStudent.politicalDic ??  >
									<input name=""  readOnly="readOnly" value="${(newStudent.politicalDic.name)!""}"/>
								<#else>
									<input name=""  readOnly="readOnly"  value=""/>
								</#if>
							</div>
								
						</div>
						<div class="span4">
							<div class="span3">
								<label>民族</label>
							</div>
							<div class="span8">
								<#if newStudent.national ??  >
									<input name="" readOnly="readOnly"  value="${(newStudent.national)!""}"/>
								<#else>
									<input name="" readOnly="readOnly"  value=""/>
								</#if>
							</div>
							
						</div>
					</div>
				</div>
				
				<div class="formSep">
					<div class="row-fluid">
						<div class="span4">
							<div class="span3">
								<label>宗教信仰</label>
							</div>
							<div class="span8">
								<div class="span8">
								<#if newStudent.religionDic ??  >
									<input name=""  readOnly="readOnly"  value="${(newStudent.religionDic.name)!""}"/>
								<#else>
									<input name="" readOnly="readOnly"  value=""/>
								</#if>
							</div>
								
							</div>
						</div>
						<div class="span4">
							<div class="span3">
								<label>籍贯</label>
							</div>
							<div class="span8">
								<#if newStudent.nativeDic ??  >
									<input name="" readOnly="readOnly"  value="${(newStudent.nativeDic.name)!""}"/>
								<#else>
									<input name=""  readOnly="readOnly"  value=""/>
								</#if>
							</div>
								
						</div>
						<div class="span4">
							<div class="span3">
								<label>出生日期</label>
							</div>
							<div class="span8">
								<#if newStudent.brithDate ??  >
									<input name=""  readOnly="readOnly"  value='${(newStudent.brithDate!"")?string("yyyy-MM-dd")}'/>
								<#else>
									<input name="" readOnly="readOnly"  value=""/>
								</#if>
							</div>
							
						</div>
					</div>
				</div>
				
				
				<div class="formSep">
					<div class="row-fluid">
						<div class="span4">
							<div class="span3">
								<label>户口类别</label>
							</div>
							<div class="span8">
								<div class="span8">
								<#if newStudent.addressTypeDic ??  >
									<input name=""  readOnly="readOnly"  value="${(newStudent.addressTypeDic.name)!""}"/>
								<#else>
									<input name="" readOnly="readOnly"  value=""/>
								</#if>
							</div>
								
							</div>
						</div>
						<div class="span4">
							<div class="span3">
								<label>户口地址</label>
							</div>
							<div class="span8">
								<#if newStudent.nativeDic ??  >
									<input name="" readOnly="readOnly"  value="${(newStudent.nativeAdd)!""}"/>
								<#else>
									<input name=""  readOnly="readOnly" value=""/>
								</#if>
							</div>
								
						</div>
						<div class="span4">
							<div class="span3">
								<label>家庭地址</label>
							</div>
							<div class="span8">
								<#if newStudent.homeAddress ??  >
									<input name=""  readOnly="readOnly"  value='${(newStudent.homeAddress)!""}'/>
								<#else>
									<input name=""  readOnly="readOnly" value=""/>
								</#if>
							</div>
							
						</div>
					</div>
				</div>
				
				
				<div class="formSep">
					<div class="row-fluid">
						<div class="span4">
							<div class="span3">
								<label>家庭邮编</label>
							</div>
							<div class="span8">
								<div class="span8">
								<#if newStudent.homePostCode ??  >
									<input name="" readOnly="readOnly"  value="${(newStudent.homePostCode)!""}"/>
								<#else>
									<input name="" readOnly="readOnly"  value=""/>
								</#if>
							</div>
								
							</div>
						</div>
						<div class="span4">
							<div class="span3">
								<label>家庭电话</label>
							</div>
							<div class="span8">
								<#if newStudent.homeTel ??  >
									<input name=""  readOnly="readOnly" value="${(newStudent.homeTel)!""}"/>
								<#else>
									<input name=""  readOnly="readOnly" value=""/>
								</#if>
							</div>
								
						</div>
						<div class="span4">
							<div class="span3">
								<label>电子邮箱</label>
							</div>
							<div class="span8">
								<#if newStudent.email ??  >
									<input name=""  readOnly="readOnly" value='${(newStudent.email)!""}'/>
								<#else>
									<input name=""  readOnly="readOnly" value=""/>
								</#if>
							</div>
							
						</div>
					</div>
				</div>
				
				
				<div class="formSep">
					<div class="row-fluid">
						<div class="span4">
							<div class="span3">
								<label>手机号码1</label>
							</div>
							<div class="span8">
								<div class="span8">
								<#if newStudent.phone1 ??  >
									<input name="" readOnly="readOnly"  value="${(newStudent.phone1)!""}"/>
								<#else>
									<input name="" readOnly="readOnly"  value=""/>
								</#if>
							</div>
								
							</div>
						</div>
						<div class="span4">
							<div class="span3">
								<label>手机号码2</label>
							</div>
							<div class="span8">
								<#if newStudent.phone2 ??  >
									<input name=""  readOnly="readOnly" value="${(newStudent.phone2)!""}"/>
								<#else>
									<input name=""  readOnly="readOnly" value=""/>
								</#if>
							</div>
								
						</div>
						<div class="span4">
							<div class="span3">
								<label>QQ号码</label>
							</div>
							<div class="span8">
								<#if newStudent.qq ??  >
									<input name=""  readOnly="readOnly" value='${(newStudent.qq)!""}'/>
								<#else>
									<input name=""  readOnly="readOnly" value=""/>
								</#if>
							</div>
							
						</div>
					</div>
				</div>
				
				<div class="formSep">
					<div class="row-fluid">
						
						<div class="span4">
							<div class="span3">
								<label>血型</label>
							</div>
							<div class="span8">
								<#if newStudent.bloodTypeDic ??  >
									<input name=""  readOnly="readOnly" value="${(newStudent.bloodTypeDic.name)!""}"/>
								<#else>
									<input name=""  readOnly="readOnly" value=""/>
								</#if>
							</div>
								
						</div>
						<div class="span4">
							<div class="span3">
								<label>婚姻状况</label>
							</div>
							<div class="span8">
								<#if newStudent.marriageDic ??  >
									<input name=""  readOnly="readOnly" value='${(newStudent.marriageDic.name)!""}'/>
								<#else>
									<input name=""  readOnly="readOnly" value=""/>
								</#if>
							</div>
							
						</div>
						
						<div class="span4">
							<div class="span3">
								<label>港澳台侨</label>
							</div>
							<div class="span8">
								<#if newStudent.overChineseDic ??  >
									<input name=""  readOnly="readOnly" value='${(newStudent.overChineseDic.name)!""}'/>
								<#else>
									<input name=""  readOnly="readOnly" value=""/>
								</#if>
							</div>
							
						</div>
					</div>
				</div>
				
				
				
				<div class="formSep">
					<div class="row-fluid">
						<div class="span4">
							<div class="span3">
								<label>健康状况</label>
							</div>
							<div class="span8">
								<div class="span8">
								<#if newStudent.marriageDic ??  >
									<input name="" readOnly="readOnly"  value="${(newStudent.healthStateDic.name)!""}"/>
								<#else>
									<input name="" readOnly="readOnly"  value=""/>
								</#if>
							</div>
								
							</div>
						</div>
						
						<div class="span4">
							<div class="span3">
								<label>收费状态</label>
							</div>
							<div class="span8">
								<#if newStudent.costState ?? && newStudent.costState=='1' >
									<input name=""  readOnly="readOnly" value='已缴'/>
								<#else>
									<input name=""  readOnly="readOnly" value="未缴"/>
								</#if>
							</div>
							
						</div>
						
						<div class="span4">
							<div class="span3">
								<label>绿色通道</label>
							</div>
							<div class="span8">
								<div class="span8">
								<#if newStudent.greenWay ?? && newStudent.greenWay=='1' >
									<input name="" readOnly="readOnly"  value="是"/>
								<#else>
									<input name="" readOnly="readOnly"  value="否"/>
								</#if>
							</div>
								
							</div>
						</div>
					</div>
				</div>
					
					
					<div class="formSep">
					<div class="row-fluid">
						
						<div class="span4">
							<div class="span3">
								<label>绿色通道原因</label>
							</div>
							<div class="span8">
								<#if newStudent.greenReason ??  >
									<input name=""  readOnly="readOnly" value="${(newStudent.greenReason.name)!""}"/>
								<#else>
									<input name=""  readOnly="readOnly" value=""/>
								</#if>
							</div>
								
						</div>
						<div class="span4">
							<div class="span3">
								<label>报到状态</label>
							</div>
							<div class="span8">
								<#if newStudent.status ?? >
								
									<#if newStudent.status=='1' >
										<input name=""  readOnly="readOnly" value='已报到'/>
									<#else>
										<#if newStudent.status=='2' >
											<input name=""  readOnly="readOnly" value='已撤销'/>
										<#else>
											<input name=""  readOnly="readOnly" value="未报到"/>
										</#if>
									</#if>
								<#else>
									<input name=""  readOnly="readOnly" value="未报到"/>
								</#if>
							</div>
							
						</div>
						
						<div class="span4">
							<div class="span3">
								<label>报到时间</label>
							</div>
							<div class="span8">
								<div class="span8">
								<#if newStudent.reportDate ??  >
									<input name="" readOnly="readOnly"  value="${(newStudent.reportDate!"")?string("yyyy-MM-dd HH:mm:ss")}"/>
								<#else>
									<input name="" readOnly="readOnly"  value=""/>
								</#if>
							</div>
								
							</div>
						</div>
						
					</div>
				</div>
				
				
				<div class="formSep">
					<div class="row-fluid">
						
						
						<div class="span4">
							<div class="span3">
								<label>撤销原因</label>
							</div>
							<div class="span8">
								<#if newStudent.cancelReason?? >
									<input name=""  readOnly="readOnly" value='${(newStudent.cancelReason)!""}'/>
								<#else>
									<input name=""  readOnly="readOnly" value=""/>
								</#if>
							</div>
							
						</div>
					</div>
				</div>
				
				
				<div class="formSep">
					<div class="row-fluid">
						<div class="span4">
							<div class="span3">
								<label>父亲姓名</label>
							</div>
							<div class="span8">
								<div class="span8">
								<#if guardian.fatherName ??  >
									<input name="" readOnly="readOnly"  value="${(guardian.fatherName)!""}"/>
								<#else>
									<input name="" readOnly="readOnly"  value=""/>
								</#if>
							</div>
								
							</div>
						</div>
						<div class="span4">
							<div class="span3">
								<label>父亲手机</label>
							</div>
							<div class="span8">
								<#if guardian.fatherPhone ??  >
									<input name=""  readOnly="readOnly" value="${(guardian.fatherPhone)!""}"/>
								<#else>
									<input name=""  readOnly="readOnly" value=""/>
								</#if>
							</div>
								
						</div>
						<div class="span4">
							<div class="span3">
								<label>父亲邮箱</label>
							</div>
							<div class="span8">
								<#if guardian.fatherEmail ?? >
									<input name=""  readOnly="readOnly" value='${(guardian.fatherEmail)!""}'/>
								<#else>
									<input name=""  readOnly="readOnly" value=""/>
								</#if>
							</div>
							
						</div>
					</div>
				</div>
				
				<div class="formSep">
					<div class="row-fluid">
						<div class="span4">
							<div class="span3">
								<label>父亲住址</label>
							</div>
							<div class="span8">
								<div class="span8">
								<#if guardian.fatherAddress??  >
									<input name="" readOnly="readOnly"  value="${(guardian.fatherAddress)!""}"/>
								<#else>
									<input name="" readOnly="readOnly"  value=""/>
								</#if>
							</div>
								
							</div>
						</div>
						<div class="span4">
							<div class="span3">
								<label>父亲邮编</label>
							</div>
							<div class="span8">
								<#if guardian.fatherPostCode ??  >
									<input name=""  readOnly="readOnly" value="${(guardian.fatherPostCode)!""}"/>
								<#else>
									<input name=""  readOnly="readOnly" value=""/>
								</#if>
							</div>
								
						</div>
						<div class="span4">
							<div class="span3">
								<label>父工作单位</label>
							</div>
							<div class="span8">
								<#if guardian.fatherWorkUnit ?? >
									<input name=""  readOnly="readOnly" value='${(guardian.fatherWorkUnit)!""}'/>
								<#else>
									<input name=""  readOnly="readOnly" value=""/>
								</#if>
							</div>
							
						</div>
					</div>
				</div>
				
				
				<div class="formSep">
					<div class="row-fluid">
						<div class="span4">
							<div class="span3">
								<label>母亲姓名</label>
							</div>
							<div class="span8">
								<div class="span8">
								<#if guardian.motherName ??  >
									<input name="" readOnly="readOnly"  value="${(guardian.motherName)!""}"/>
								<#else>
									<input name="" readOnly="readOnly"  value=""/>
								</#if>
							</div>
								
							</div>
						</div>
						<div class="span4">
							<div class="span3">
								<label>母亲手机</label>
							</div>
							<div class="span8">
								<#if guardian.motherPhone ??  >
									<input name=""  readOnly="readOnly" value="${(guardian.motherPhone)!""}"/>
								<#else>
									<input name=""  readOnly="readOnly" value=""/>
								</#if>
							</div>
								
						</div>
						<div class="span4">
							<div class="span3">
								<label>母亲邮箱</label>
							</div>
							<div class="span8">
								<#if guardian.motherEmail ?? >
									<input name=""  readOnly="readOnly" value='${(guardian.motherEmail)!""}'/>
								<#else>
									<input name=""  readOnly="readOnly" value=""/>
								</#if>
							</div>
							
						</div>
					</div>
				</div>
				
				<div class="formSep">
					<div class="row-fluid">
						<div class="span4">
							<div class="span3">
								<label>母亲住址</label>
							</div>
							<div class="span8">
								<div class="span8">
								<#if guardian.motherAddress??  >
									<input name="" readOnly="readOnly"  value="${(guardian.motherAddress)!""}"/>
								<#else>
									<input name="" readOnly="readOnly"  value=""/>
								</#if>
							</div>
								
							</div>
						</div>
						<div class="span4">
							<div class="span3">
								<label>母亲邮编</label>
							</div>
							<div class="span8">
								<#if guardian.motherPostCode ??  >
									<input name=""  readOnly="readOnly" value="${(guardian.motherPostCode)!""}"/>
								<#else>
									<input name=""  readOnly="readOnly" value=""/>
								</#if>
							</div>
								
						</div>
						<div class="span4">
							<div class="span3">
								<label>母工作单位</label>
							</div>
							<div class="span8">
								<#if guardian.motherWorkUnit ?? >
									<input name=""  readOnly="readOnly" value='${(guardian.motherWorkUnit)!""}'/>
								<#else>
									<input name=""  readOnly="readOnly" value=""/>
								</#if>
							</div>
							
						</div>
					</div>
				</div>
				
				
				<div class="formSep">
					<div class="row-fluid">
						<div class="span4">
							<div class="span3">
								<label>监护人姓名</label>
							</div>
							<div class="span8">
								<div class="span8">
								<#if guardian.guardianName ??  >
									<input name="" readOnly="readOnly"  value="${(guardian.guardianName)!""}"/>
								<#else>
									<input name="" readOnly="readOnly"  value=""/>
								</#if>
							</div>
								
							</div>
						</div>
						<div class="span4">
							<div class="span3">
								<label>监护人手机</label>
							</div>
							<div class="span8">
								<#if guardian.guardianPhone ??  >
									<input name=""  readOnly="readOnly" value="${(guardian.guardianPhone)!""}"/>
								<#else>
									<input name=""  readOnly="readOnly" value=""/>
								</#if>
							</div>
								
						</div>
						<div class="span4">
							<div class="span3">
								<label>监护人邮箱</label>
							</div>
							<div class="span8">
								<#if guardian.guardianEmail ?? >
									<input name=""  readOnly="readOnly" value='${(guardian.guardianEmail)!""}'/>
								<#else>
									<input name=""  readOnly="readOnly" value=""/>
								</#if>
							</div>
							
						</div>
					</div>
				</div>
				
				<div class="formSep">
					<div class="row-fluid">
						<div class="span4">
							<div class="span3">
								<label>监护人住址</label>
							</div>
							<div class="span8">
								<div class="span8">
								<#if guardian.guardianAddress??  >
									<input name="" readOnly="readOnly"  value="${(guardian.guardianAddress)!""}"/>
								<#else>
									<input name="" readOnly="readOnly"  value=""/>
								</#if>
							</div>
								
							</div>
						</div>
						<div class="span4">
							<div class="span3">
								<label>监护人邮编</label>
							</div>
							<div class="span8">
								<#if guardian.guardianPostCode ??  >
									<input name=""  readOnly="readOnly" value="${(guardian.guardianPostCode)!""}"/>
								<#else>
									<input name=""  readOnly="readOnly" value=""/>
								</#if>
							</div>
								
						</div>
						<div class="span4">
							<div class="span3">
								<label>监护人工作单位</label>
							</div>
							<div class="span8">
								<#if guardian.guardianWorkUnit ?? >
									<input name=""  readOnly="readOnly" value='${(guardian.guardianWorkUnit)!""}'/>
								<#else>
									<input name=""  readOnly="readOnly" value=""/>
								</#if>
							</div>
							
						</div>
					</div>
				</div>
				
			</form>
			<br>
					
			