<html>
 <head>
 <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
    <link rel="stylesheet" href="${rc.contextPath}/lib/My97DatePicker/skin/WdatePicker.css" />
	<script type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
    <script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
    <!-- animated progressbars -->
    <script src="${rc.contextPath}/js/bdp_fileupload.progressbar.js"></script>
    <script src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script>
    <script src="${rc.contextPath}/js/apw/apw_check.js"></script>
    <script src="${rc.contextPath}/js/jquery.form.js"></script>
    <script src="${rc.contextPath}/js/common/common_approve.js"></script>
    <script>
    $(function(){
		$('.tipTag').poshytip({
			className: 'tip-yellowsimple',
			showOn: 'focus',
			alignTo: 'target',
			alignX: 'right',
			alignY: 'center',
			offsetX: 5
		});
	});
	var attachFlag;
	$("document").ready(function(){
	     //页面校验
		attachFlag = $(".form_validation_reg").compValidate({
			rules:{     
					 'genderDic.id': {required:true},
					 national: {maxlength:10},
					
					 namePy: {maxlength:20,englishCheck:true},
					 oldName: {maxlength:20},
					 englishName: {maxlength:20,englishCheck:true},
					
					 'addressTypeDic.id': {required:true,maxlength:6},
					 nativeAdd: {maxlength:50},
					 homePostCode: {postCodeCheck:true,maxlength:6},
					 homeAddress: {maxlength:50},
					 homeTel: {phoneCheck:true,maxlength:13},
					 phone2: {phoneCheck:true,maxlength:13},
					 email: {email:true,maxlength:30},
					 qq: {required:true,qqCheck:true,maxlength:15},
					 phone1: {required:true,phoneCheck:true,maxlength:13},
					 bank: {required:true,maxlength:30},
					 bankCode: {required:true,maxlength:30},
					 guardianName1: {maxlength:15},
					 guardianPhone1: {phoneCheck:true,maxlength:13},
					 guardianEmail1: {email:true,maxlength:30},
					 guardianPostCode1: {postCodeCheck:true,maxlength:6},
					 guardianWorkUnit1: {maxlength:30},
					 guardianAddress1: {maxlength:50},
					 guardianName2: {maxlength:15},
					 guardianPhone2: {phoneCheck:true,maxlength:13},
					 guardianEmail2: {email:true,maxlength:30},
					 guardianPostCode2: {postCodeCheck:true,maxlength:6},
					 guardianWorkUnit2: {maxlength:30},
					 guardianAddress2: {maxlength:50},
					 guardianName3: {maxlength:15},
					 guardianPhone3: {phoneCheck:true,maxlength:13},
					 guardianEmail3: {email:true,maxlength:30},
					 guardianPostCode3: {postCodeCheck:true,maxlength:6},
					 guardianWorkUnit3: {maxlength:30},
					 guardianAddress3: {maxlength:50}		
					 
				},
				messages:{
					  'genderDic.id': {required:'不能为空！'},
					 national: {maxlength:'长度不超过10'},
					 
					 namePy: {maxlength:'长度不超过20',},
					 oldName: {maxlength:'长度不超过20',},
					 englishName: {maxlength:'长度不超过20',},
 
 					 'addressTypeDic.id': {required:'不能为空！'},
					 nativeAdd: {maxlength:'长度不超过50'},
					 homePostCode: {maxlength:'长度不超过6'},
					 homeAddress: {maxlength:'长度不超过50'},
					 homeTel: {maxlength:'长度不超过13'},
					 phone2: {maxlength:'长度不超过13'},
					 email: {email:'邮箱格式不正确！',maxlength:'邮箱长度不超过30'},
					 qq: {required:'不能为空！',maxlength:'长度不超过15'},
					 phone1: {required:'不能为空！',maxlength:'长度不超过13'},
					 bank: {required:'不能为空！',maxlength:'长度不超过30'},
					 bankCode: {required:'不能为空！',maxlength:'长度不超过30'},
					 guardianName1: {maxlength:'姓名不超过15字'},
					 guardianPhone1: {maxlength:'手机号码不超过13'},
					 guardianEmail1: {email:'邮箱格式不正确！',maxlength:'邮箱长度不超过30'},
					 guardianPostCode1: {maxlength:'长度不超过6'},
					 guardianWorkUnit1: {maxlength:'长度不超过30'},
					 guardianAddress1: {maxlength:'长度不超过50'},
					 guardianName2: {maxlength:'姓名不超过15字'},
					 guardianPhone2: {maxlength:'手机号码不超过13位'},
					 guardianEmail2: {email:'邮箱格式不正确！',maxlength:'邮箱长度不超过30'},
					 guardianPostCode2: {maxlength:'长度不超过6'},
					 guardianWorkUnit2: {maxlength:'长度不超过30'},
					 guardianAddress2: {maxlength:'长度不超过50'},
					 guardianName3: {maxlength:'姓名不超过15字'},
					 guardianPhone3: {maxlength:'手机号长度不超过13位'},
					 guardianEmail3: {email:'邮箱格式不正确！',maxlength:'邮箱长度不超过30'},
					 guardianPostCode3: {maxlength:'长度不超过6'},
					 guardianWorkUnit3: {maxlength:'长度不超过30'},
					 guardianAddress3: {maxlength:'长度不超过50'}
				}
		 });
	 });
	
	  //验证是否输入的是手机号
	jQuery.validator.addMethod("phoneCheck",function(value,element){
	   if(value != ""){
	      var phone =/^((13|15|17|18|14)[0-9]{9}(?!\d))|(0[1-9]\d{1,2}-[1-9]\d{6,7})$/;
	      return phone.exec(value);
	   }else{
	      return true;
	   }
	  return false;
	},"请输入11位的手机号码或者带区号的固定电话号码.");
	 //验证是否输入的是邮政编码
	jQuery.validator.addMethod("postCodeCheck",function(value,element){
	   if(value != ""){
	      var postCode = /^[0-9][0-9]{5}(?!\d)$/;
	      return postCode.exec(value);
	   }else{
	      return true;
	   }
	  return false;
	},"请输入正确的邮编.");
	 //验证是否输入的是英文名或拼音
	jQuery.validator.addMethod("englishCheck",function(value,element){
	   if(value != ""){
	      var postCode = /([a-zA-Z\d]){1,20}(?!\d)/;
	      return postCode.exec(value);
	   }else{
	      return true;
	   }
	  return false;
	},"请输入英文字母.");
	 //验证是否输入的是qq号码
	jQuery.validator.addMethod("qqCheck",function(value,element){
	   if(value != ""){
	      var qq = /^[1-9][0-9]{4,14}$/;
	      return qq.exec(value);
	   }else{
	      return true;
	   }
	  return false;
	},"请输入正确的qq号码.");
	//保存方法 
 	 function onSub(){
 		if(attachFlag.form()==false){
	 		    return false;
	 		}
            comp.confirm("学生信息修改后将立即生效，确定要保存吗？",function(r){
	            if(r){            
	            mask.showShade();
	            $('#studentSumbit').attr("action","${rc.contextPath}/student/info/opt-save/submitStudentInfo.do");
		        $('#studentSumbit').submit();  
		        }
	        });	
       }
    //返回到查询信息页面
    function goToView(){
    	//window.location.href="${rc.contextPath}/student/info/opt-query/listStudent.do";
    	window.history.back();
    }

    </script>
    </head>
<body>
<div id="contentwrapper">
    <div class="main_content">   
        <div class="row-fluid">	
    		<form  id="studentSumbit" class="form_validation_reg" action="" method="post">
				<div class="span12">		
		            <div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<label class="span3">学号</label>
							<input type="hidden" id="id" name="id" value="${studentInfo.id!""?html}" readonly/>
							<input id="stuNumber" name="stuNumber" value="${studentInfo.stuNumber!""?html}" readonly/>
						</div>
						<div class="span6">
							<label class="span3">姓名</label>
							<input id="name" name="name" type="text" value="${studentInfo.name!""?html}" readonly/>
						</div>
					</div>
					</div>
					<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<label class="span3">性别<span class="f_req">*</span></label>
							<input id="genderDic" name="genderDic.id" type="hidden"
							<#if studentInfo ?? && studentInfo.genderDic ??>
							value="${studentInfo.genderDic.id!""?html}" 
							</#if>
							/>
                            <input id="gender"
							<#if studentInfo ?? && studentInfo.genderDic ??>
							value="${studentInfo.genderDic.name!""?html}" 
							</#if>
							readonly/>															
						</div>
						<div class="span6">
							<label class="span3">出生日期</label> 
							<input id="brithDate" name="brithDate" <#if studentInfo.brithDate ??> value="${(studentInfo.brithDate!"")?string("yyyy-MM-dd")}" </#if>/> 
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
							<input id="national" name="national" type="text" value="${(studentInfo.national)!""}" />
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
							<input id="phone1" name="phone1"  value="${(studentInfo.phone1)!""}" onchange="isPhone()" type="text"/>
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
							<input id="qq" name="qq"  value="${(studentInfo.qq)!""}" type="text"/>
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
							<textarea name="nativeAdd" id="nativeAdd" class="span9"  rows="3" maxlength="50">${(studentInfo.nativeAdd)!""}</textarea>
					    </div>
				    </div>
					</div>   
					<div class="formSep">
					<div class="row-fluid">
					    <div class="span9">
							<label class="span2">家庭住址</label>
							<textarea name="homeAddress" id="homeAddress" class="span9"  rows="3" maxlength="50">${(studentInfo.homeAddress)!""}</textarea>
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
					<br/>
	                <div class="row-fluid">
		        	<div class="span6">
						<div class="span3">
						</div>						
		                <button class="btn btn-info" type="button" onclick="onSub()">保  存</button>
		                <button class="btn" type="button" onclick="goToView()">取 消</button>
			        </div>
			        </div>
				</div>
			</form>
			</div>
        </div>
    </div>
</body>
</html>
