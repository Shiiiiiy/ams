<html>
 <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- jQuery UI theme-->
        <link rel="stylesheet" href="${rc.contextPath}/lib/jquery-ui/css/Aristo/Aristo.css" />
        <script src="${rc.contextPath}/lib/jquery-ui/jquery-ui-1.8.20.custom.min.js"></script>
    </head>
<body>
<div id="contentwrapper">
 <div class="main_content">
  <div class="row-fluid">
    <div class="row-fluid">
	   <div class="span12">
	      <h3 class="heading">
				省优秀毕业生查看
		   </h3>
		  </div>
		 </div> 
			 <div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>姓名<span class="f_req">*</span></label>
						</div>
						<div class="span9 input-append">
						<#if schoolGoodStudent?? && schoolGoodStudent.studentId??>
							<input id="studentName" name="schoolGoodStudent.studentId.name" readOnly="true" value="${(schoolGoodStudent.studentId.name!"")?html}"/>
							
							<#--><a style="cursor:pointer;margin-left:-4px;" onclick="selectStudentRadio()" title="选择" class="btn"><i class="icon-search"></i></a>-->
					    <#else>
					        <input id="studentName" name="schoolGoodStudent.studentId.name"  readOnly="true" />
					        <#--> <a style="cursor:pointer;margin-left:-4px;" onclick="selectStudentRadio()" title="选择" class="btn"><i class="icon-search"></i></a>-->
					    </#if>   
					        <input name="schoolGoodStudent.studentId.id" id="studentId" type="hidden" value="${(schoolGoodStudent.studentId.id)!''}"/> 
						</div>
					</div>
					
					<div class="span6">
						<div class="span3">
							<label>性别<span class="f_req"></span></label>
						</div>
						<div class="span9">
						 <#if genderList??>
							<#list genderList as a>
				    			<#if schoolGoodStudent?? && schoolGoodStudent.studentId?? && schoolGoodStudent.studentId.genderDic.id==a.id >
    				    				<label class="radio inline">
											<input type="radio" id="sexId" name="genderDic.name" disabled checked="checked" value="${a.id}" />${a.name?html}
										</label>
    				    			
				    			<#else>
				    				<label class="radio inline">
										<input type="radio" id="sexId" name="genderDic.name" disabled  value="${a.id}" />${a.name?html}
									</label>
				    		   </#if>
		    			  </#list>
		    			 </#if>
					</div>
				  </div>
			   </div>
			 </div>
			 
			 <div class="formSep"> 
			   <div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>名族<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="national" name="national" readOnly <#if schoolGoodStudent?? && schoolGoodStudent.studentId??> value="${((schoolGoodStudent.studentId.national)!"")?html}" </#if>/>
						</div>
					 </div>
						
					<div class="span6">
						<div class="span3">
							<label>出生年月<span class="f_req"></span></label>
						</div>
						<div class="span9">
						    <input id="birthday" name="birthday" readOnly <#if schoolGoodStudent?? && schoolGoodStudent.studentId??>  value="${(schoolGoodStudent.studentId.brithDate!"")?string("yyyy-MM-dd")}"</#if>/>
							
						</div>
					 </div>
				  </div>
			   </div>
			   
			  <div class="formSep"> 
			   <div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>政治面貌<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="politicalDic" name="politicalDic" readOnly <#if schoolGoodStudent?? && schoolGoodStudent.studentId?? && schoolGoodStudent.studentId.politicalDic??> value="${((schoolGoodStudent.studentId.politicalDic.name)!"")?html}" </#if>/>
						</div>
					 </div>
						
					<div class="span6">
						<div class="span3">
							<label>职务<span class="f_req"></span></label>
						</div>
						<div class="span9">
						    <input id="post" name="post" readOnly <#if schoolGoodStudent??>  value="${((schoolGoodStudent.post)!"")?html}"</#if>/>
							
						</div>
					 </div>
				  </div>
			   </div>
			   
			  <div class="formSep"> 
			   <div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>生源地<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="sourceLand" name="sourceLand" readOnly value="${((native.name)!"")?html}"/>
						</div>
					 </div>
						
					<div class="span6">
						<div class="span3">
							<label>家庭地址<span class="f_req"></span></label>
						</div>
						<div class="span9">
						    <input id="homeAddress" name="homeAddress" readOnly <#if schoolGoodStudent?? && schoolGoodStudent.studentId??>  value="${((schoolGoodStudent.studentId.homeAddress)!"")?html}"</#if>/>
							
						</div>
					 </div>
				  </div>
			   </div>
			 
			  <div class="formSep"> 
			   <div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>学院<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="college" name="college.name" readOnly <#if schoolGoodStudent?? && schoolGoodStudent.studentId?? && schoolGoodStudent.studentId.college??> value="${(schoolGoodStudent.studentId.college.name!"")?html}" </#if>/>
						</div>
					</div>
						
					<div class="span6">
						<div class="span3">
							<label>专业<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="majorName" name="major.majorName" readOnly <#if schoolGoodStudent?? && schoolGoodStudent.studentId?? && schoolGoodStudent.studentId.major??>  value="${(schoolGoodStudent.studentId.major.majorName!"")?html}"</#if>/>
						</div>
					 </div>
				  </div>
			   </div>
			   
			  <div class="formSep"> 
			   <div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>班级<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="className" name="classId.className" readOnly <#if schoolGoodStudent?? && schoolGoodStudent.studentId?? && schoolGoodStudent.studentId.classId??>  value="${(schoolGoodStudent.studentId.classId.className!"")?html}"</#if>/>
						</div>
					 </div>
						
					<div class="span6">
						<div class="span3">
							<label>联系电话<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="phone1" name="phone1" readOnly <#if schoolGoodStudent?? && schoolGoodStudent.studentId?? && schoolGoodStudent.studentId.phone1??> value="${((schoolGoodStudent.studentId.phone1)!"")?html}" </#if>/>
						</div>
					 </div>
				  </div>
			   </div>
			   
			   <div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>班级排名<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input name="classSort" readOnly value='${(schoolGoodStudent.classSort)!""}'/>
						</div>
					</div>
					<div class="span6">
						<div class="span3">
							<label>班级人数<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input name="classNumber" readOnly value='${(schoolGoodStudent.classNumber)!""}'/>
						</div>
					</div>
				</div>
			</div>
			<div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>计算机等级<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input name="computerLevel" readOnly value='${(schoolGoodStudent.computerLevel)!""}'/>
						</div>
					</div>
					<div class="span6">
						<div class="span3">
							<label>外语等级<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input name="englishLevel" readOnly value='${(schoolGoodStudent.englishLevel)!""}'/>
						</div>
					</div>
				</div>
			</div>
			<div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>入学以来学习总成绩平均分<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input name="avgScore" readOnly value=
								<#if schoolGoodStudent?? && schoolGoodStudent.avgScore??>
										${(schoolGoodStudent.avgScore)?string(".00")}
								<#else>
									0.00
								</#if>
							 >
						</div>
					</div>
				</div>
			</div>
			<div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>本人在校期间表现</label>
						</div>
						<div class="span9">
							<textarea id="performance" rows="5" cols="12" readlony="readlony" name="performance" readonly="readonly" style="width:770px; height:308px;">${(schoolGoodStudent.performance)!""}</textarea>
						</div>
					</div>
				</div>
			</div>
			<div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>曾获荣誉</label>
						</div>
						<div class="span9">
							<textarea id="honor" rows="5" cols="12" name="honor" style="width:770px; height: 200px;" readonly="readonly">${(schoolGoodStudent.honor)!""}</textarea>
						</div>
					</div>
				</div>
			</div>
			   
			   <div class="formSep">
				 <div class="row-fluid">
					 <div class="span6">
						<div class="span3">
							<label>审核意见<span class="f_req"></span></label>
						 </div>
					     <div class="span9">
							<#if provinceGoodStudent?? && provinceGoodStudent.approveReason??>
							    <textarea rows="5" cols="12" id="approveReason" name="approveReason" readOnly style="width: 775px; height: 134px;">${(provinceGoodStudent.approveReason!"")}</textarea>
							<#else>
							    <textarea rows="5" cols="12" id="approveReason" name="approveReason" readOnly style="width: 775px; height: 134px;"></textarea>
						</#if>	
					</div>
				 </div>
			  </div>
		    </div> 
         <br/> 
	    <div class="row-fluid">
		 <div class="span6">
		  <div class="span3">
		   </div>
		      <div class="span9">
		  			<button class="btn" type="button" onclick="javascript:window.close();">关 闭</button>
			  </div>
			</div>
			<input name="check_error" id="check_error" type="hidden" value="true"/>
		</div>
    </div>
  </div>
 </div>
<script>
	
</script>
</body>
</html>
