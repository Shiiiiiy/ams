<html>
 <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="${rc.contextPath}/lib/My97DatePicker/skin/WdatePicker.css" />
	<script type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script> 
    <script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
	<script src="${rc.contextPath}/js/jquery.form.js"></script> 
    <script src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script> 
    <script>
    var attachFlag;
	$("document").ready(function(){
	        attachFlag=$(".form_validation_reg").compValidate({
			rules:{   
			  		 name: {required:true},
					 stuCategory: {maxlength:15},
					 degrees: {maxlength:15},
					 entranceDate: {maxlength:10},
					 graduationDate: {maxlength:10},
					 armyDate: {required:true,maxlength:10},
					 tuitionFeesString: {floatCheck:true,max:100000},
					 paidFeesString: {floatCheck:true,max:100000},
					 loanAmountString: {floatCheck:true,max:100000},
					 compensationAmountString: {floatCheck:true,max:100000},
					 loanCountString: {floatCheck:true,max:100000},
					 loanPrincipalString: {floatCheck:true,max:100000},
					 supportFeesString: {floatCheck:true,max:100000},
					 remark: {maxlength:150}
				},
				messages:{
				     name: {required:'不能为空！'},
					 stuCategory: {maxlength:'长度不超过15'},
					 degrees: {maxlength:'长度不超过15'},
					 tuitionFeesString: {max:'最大值为100000'},
					 paidFeesString: {max:'最大值为100000'},
					 loanAmountString: {max:'最大值为100000'},
					 compensationAmountString: {max:'最大值为100000'},
					 loanCountString: {max:'最大值为100000'},
					 loanPrincipalString: {max:'最大值为100000'},
					 supportFeesString: {max:'最大值为100000'},
					 entranceDate: {maxlength:'长度不超过100000'},
					 graduationDate: {maxlength:'长度不超过100000'},
					 armyDate: {required:'不能为空！',maxlength:'长度不超过100000'},
					 remark: {maxlength:'长度不超过150'}
				}
		 });
    });
   
    //验证是否输入的是小数
	jQuery.validator.addMethod("floatCheck",function(value,element){
	   if(value != ""){
	      var patrn = /^(?:[1-9]\d{0,8}(?:\.\d{0,2})?|(0\.0[1-9])|(0\.[1-9][0-9]))$/;
	      return patrn.exec(value);
	   }else{
	      return true;
	   }
	  return false;
	},"请输入大于等于0的有效金额数字(小数点后可保留两位小数).");
	
    //返回列表
    function goToList(){
		window.location.href="${rc.contextPath}/student/army/opt-query/listStudentArmy.do";
	}
	// 单选学生选择 
	function selectStudentRadio(){
		_queryStudentRadioAll("","");
	}
	function setStudentRadioSelectValue(student){
		var certificateCode = student.certificateCode;
	    $.ajax({
				url: "${rc.contextPath}/student/army/opt-query/queryStudentArmyInfoById.do",
				async:false,
				cache:false,
				type:"POST",
				dataType:'text',
				data:{certificateCode:certificateCode},
			    success: function(data){
			       if(data=="success") {
			           $("#stuNumber").attr("value",student.stuNumber);
			           $("#studentId").attr("value",student.id);
			           $("#name").attr("value",student.name);
			           $("#genderDic").attr("value",student.genderName);
			           $("#college").attr("value",student.collegeName);
			           $("#major").attr("value",student.majorName);
			           $("#class").attr("value",student.className);
			           $("#certificateCode").attr("value",student.certificateCode);
			           $("#schoolYear").attr("value",student.schoolYear);
                   }else{
	                   comp.message(data,"error");
                   }
				}
		});
	}
    function onSub(){
		 var certificateCode = $("#certificateCode").val();
		 var id = $("#id").val();
		 if(!id){
	         $.ajax({
					url: "${rc.contextPath}/student/army/opt-query/queryStudentArmyInfoById.do",
					async:false,
					cache:false,
					type:"POST",
					dataType:'text',
					data:{certificateCode:certificateCode},
				    success: function(data){
				       if(data=="success") {
				             if(!attachFlag.form()){
		 		                   return false;
		 						}
							 comp.confirm("您确定要提交吗？",function(result){ 
							     if(result){
			                		$("#studentArmySumbit").submit();
							     }else{
							    	return;
							     }
							 });
	                   }else{
		                   comp.message(data,"error");
		                   $("#stuNumber").attr("value","");
				           $("#studentId").attr("value","");
				           $("#name").attr("value","");
				           $("#genderDic").attr("value","");
				           $("#college").attr("value","");
				           $("#major").attr("value","");
				           $("#class").attr("value","");
				           $("#certificateCode").attr("value","");
				           $("#schoolYear").attr("value","");
	                   }
					}
				 });
			}else{
			      if(!attachFlag.form()){
	                   return false;
					}
				  comp.confirm("确定要保存修改的学生参军信息吗？",function(result){ 
				      if(result){
                		 $("#studentArmySumbit").submit();
				      }else{
				    	 return;
				      }
				  });
			}
    }
 </script>
 </head>
<body>
<div id="contentwrapper">
    <div class="main_content">   
        <div class="row-fluid">
    		<form id="studentArmySumbit" class="form_validation_reg" action="${rc.contextPath}/student/army/opt-add/addStudentArmy.do" method="post">
				<div class="span12">
					<div class="formSep">
					<div class="row-fluid">
						<div class="span5">
							<label class="span4">姓名<span class="f_req">*</span></label>
							<div class="span8">
								<#if studentArmyInfo ?? && studentArmyInfo.student ??>
									<input id="name" value="${studentArmyInfo.student.name!""?html}" readonly/>
								<#else>
									<input id="name" name="name" type="text" readonly="true" <#if studentArmyInfo ?? && studentArmyInfo.student ??>value="${studentArmyInfo.student.name!""?html}"</#if>/>
									<a id="course-lecture-select"  style="margin-left: -4px;;margin-top:-10px" href="javascript:void(0);" onclick="selectStudentRadio()" class="btn"><i class="icon-search"></i></a>
						        </#if>
						    </div>
						</div>
						<div class="span5">
							<label class="span4">学号</label>
							<div class="span8">
								<input id="id" name="id" type="hidden" <#if studentArmyInfo ??>value="${studentArmyInfo.id!""?html}"</#if>/>
								<input id="studentId" name="student.id" type="hidden" <#if studentArmyInfo ?? && studentArmyInfo.student ??>value="${studentArmyInfo.student.stuNumber!""?html}"</#if> readonly/>
								<input id="stuNumber" name="student.stuNumber" <#if studentArmyInfo ?? && studentArmyInfo.student ??>value="${studentArmyInfo.student.stuNumber!""?html}"</#if> readonly/>
						    </div>
						</div>
					</div>
					</div>
					<div class="formSep">
					<div class="row-fluid">
					    <div class="span5">
							<label class="span4">性别</label>
							<div class="span8">
                            	<input id="genderDic" <#if studentArmyInfo ?? && studentArmyInfo.student ?? && studentArmyInfo.student.genderDic ??>value="${studentArmyInfo.student.genderDic.name}"</#if> readonly>													
						    </div>
						</div>
						<div class="span5">
							<label class="span4">学院</label>
							<div class="span8">
								<input id="college" <#if studentArmyInfo ?? && studentArmyInfo.student ?? && studentArmyInfo.student.college ??>value="${(studentArmyInfo.student.college.name)!""}"</#if> readonly/>
						    </div>
						</div>
					</div>
					</div>
					<div class="formSep">
					<div class="row-fluid">
						<div class="span5">
							<label class="span4">专业</label>
							<div class="span8">
								<input id="major" <#if studentArmyInfo ?? && studentArmyInfo.student ?? && studentArmyInfo.student.major ??>value="${studentArmyInfo.student.major.majorName}"</#if> readonly />
						    </div>
						</div>
						<div class="span5">
							<label class="span4">班级</label>
							<div class="span8">
								<input id="class" <#if studentArmyInfo ?? && studentArmyInfo.student ?? && studentArmyInfo.student.classId ??>value="${studentArmyInfo.student.classId.className}"</#if> readonly />
						    </div>
						</div>
					</div>
					</div>
					<div class="formSep">
					<div class="row-fluid">
					    <div class="span5">
							<label class="span4">身份证号</label> 
							<div class="span8">
								<input id="certificateCode" <#if studentArmyInfo ?? && studentArmyInfo.student ??>value="${(studentArmyInfo.student.certificateCode)!""}"</#if> readonly /> 
						    </div>
						</div>
						<div class="span5">
							<label class="span4">学制</label>
							<div class="span8">
								<input id="schoolYear" <#if studentArmyInfo ?? && studentArmyInfo.student ?? && studentArmyInfo.student.major ??>value="${studentArmyInfo.student.major.schoolYear}"</#if> readonly />
						    </div>
						</div>
					</div>	
					</div>
					<div class="formSep">
					<div class="row-fluid">
					    <div class="span5">
							<label class="span4">最后学历</label> 
							<div class="span8">
								<input id="degrees" name="degrees" <#if studentArmyInfo??>value="${(studentArmyInfo.degrees)!""}"</#if> /> 
						    </div>
						</div>
					    <div class="span5">
							<label class="span4">入学时间</label>
							<div class="span8">
								<input id="entranceDate" name="entranceDate" <#if studentArmyInfo??>value="${(studentArmyInfo.entranceDate)!""}"</#if> />
						    </div>
						</div>
					</div>	
					</div>
					<div class="formSep">
					<div class="row-fluid">
						<div class="span5">
							<label class="span4">毕业时间</label>
							<div class="span8">
								<input id="graduationDate" name="graduationDate" <#if studentArmyInfo?? >value="${(studentArmyInfo.graduationDate!"")}"</#if> />
						    </div>
						</div>
						<div class="span5">
							<label class="span4">参军时间<span class="f_req">*</span></label> 
							<div class="span8">
								<input id="armyDate" name="armyDate" <#if studentArmyInfo??>value="${(studentArmyInfo.armyDate!"")}"</#if> /> 
						    </div>
						</div>
					</div>
					</div>
					<div class="formSep">
					<div class="row-fluid">
						<div class="span5">
							<label class="span4">应缴学费</label>
							<div class="span8">
								<input id="tuitionFees" name="tuitionFeesString"  <#if studentArmyInfo?? && studentArmyInfo.tuitionFees!=0>value="${(studentArmyInfo.tuitionFees!"")?string("#.##")}"</#if> />
					        </div>
					    </div>
						<div class="span5">
							<label class="span4">实缴学费</label> 
							<div class="span8">
								<input id="paidFees" name="paidFeesString"  <#if studentArmyInfo?? && studentArmyInfo.tuitionFees!=0>value="${(studentArmyInfo.paidFees!"")?string("#.##")}"</#if> />
					        </div>
					    </div>
					</div>
					</div>
					<div class="formSep">
					<div class="row-fluid">
					    <div class="span5">
							<label class="span4">获贷金额</label> 
							<div class="span8">
								<input id="loanAmount" name="loanAmountString" <#if studentArmyInfo?? && studentArmyInfo.tuitionFees!=0>value="${(studentArmyInfo.loanAmount!"")?string("#.##")}"</#if> /> 
						    </div>
						</div>
						<div class="span5">
							<label class="span4">学费补偿金额</label> 
							<div class="span8">
								<input id="compensationAmount" name="compensationAmountString" <#if studentArmyInfo?? && studentArmyInfo.tuitionFees!=0>value="${(studentArmyInfo.compensationAmount!"")?string("#.##")}"</#if> /> 
						    </div>
						</div>
					</div>
					</div>
					<div class="formSep">
					<div class="row-fluid">
						<div class="span5">
							<label class="span4">贷款代偿金额小计</label>
							<div class="span8">
								<input id="loanCount" name="loanCountString" <#if studentArmyInfo?? && studentArmyInfo.tuitionFees!=0>value="${(studentArmyInfo.loanCount!"")?string("#.##")}"</#if> />
						    </div>
						</div>
						<div class="span5">
							<label class="span4">贷款代偿金额本金</label>
							<div class="span8">
								<input id="loanPrincipal" name="loanPrincipalString" <#if studentArmyInfo?? && studentArmyInfo.tuitionFees!=0>value="${(studentArmyInfo.loanPrincipal!"")?string("#.##")}"</#if> /> 
						    </div>
						</div>
					</div>
					</div>
					<div class="formSep">
					<div class="row-fluid">
					    <div class="span5">
							<label class="span4">退役复学资助金额</label>
							<div class="span8">
								<input id="supportFees" name="supportFeesStringString" <#if studentArmyInfo?? && studentArmyInfo.tuitionFees!=0>value="${(studentArmyInfo.supportFees!"")?string("#.##")}"</#if> /> 
						    </div>
						</div>
					    <div class="span5">
							<label class="span4">学生类别</label> 
							<div class="span8">
								<input id="stuCategory" name="stuCategory" <#if studentArmyInfo??>value="${(studentArmyInfo.stuCategory)!""}"</#if> /> 
						    </div>
						</div>
					</div>	
					</div>
					<div class="formSep">
					<div class="row-fluid">
					     <div class="span10">
							<label class="span2">参军信息备注</label>
							<div class="span10">
								<textarea name="remark" id="remark" class="span11" cols="180" rows="3" maxlength="200"><#if studentArmyInfo??>${(studentArmyInfo.remark)!""}</#if></textarea>
						    </div>
						 </div>
					 </div>	
					</div>
					<br/>
					<div class="row-fluid">
					     <div class="span10">
							<div class="span2"></div>
							<div class="span8">
					            <button class="btn btn-info"  type="button" onclick="onSub()">保  存</button>
					            <button class="btn" type="button" onclick="goToList()">返 回</button>
			                </div>
		                 </div>
		            </div>	
				</div>
    		</form>
		</div>
    </div>
</div>
<#-- 学生选择单选组件的引入 -->
<#include "/comp/student/queryStudentAllRadioModal.ftl">
</body>
</html>
