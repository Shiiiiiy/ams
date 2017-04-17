<html>
 <head>
 	<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
    <link rel="stylesheet" href="${rc.contextPath}/lib/My97DatePicker/skin/WdatePicker.css" />
	<script type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
    <script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
    <!-- animated progressbars -->
    <script src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script>
    <script src="${rc.contextPath}/js/apw/apw_check.js"></script>
    <script src="${rc.contextPath}/js/jquery.form.js"></script>
    <script src="${rc.contextPath}/js/common/common_approve.js"></script>
 </head>
<body>
<div id="contentwrapper">
    <div class="main_content">   
        <div class="row-fluid">
        	 <div class="row-fluid">
		   		<div class="span12">
		      		<h3 class="heading">
						<#if vbm?? && vbm.id??>
								志愿者维护修改
						</#if>
						
			   		</h3>
			  	</div>
			 </div> 	
    		<form  id="volunteerManageForm" class="form_validation_reg" action="${rc.contextPath}/volunteer/maintain/opt-save/saveVounteerMaintain.do" method="post">
					<input id="id" type="hidden" name="id" <#if vbm??> value="${(vbm.id)!""}" </#if> /> 
					<input id="stuInfoId" type="hidden" name="stuInfo.id" <#if vbm??&& vbm.stuInfo??> value="${vbm.stuInfo.id!""}"	</#if> /> 
				    <div class="formSep">
						<div class="row-fluid">
							
							<div class="span6">
								<div class="span3">
									<span class="formTitle">姓名<span class="f_req"></span></span>
								</div>
								<div class="span9">
									<input id="name" readOnly <#if vbm??&& vbm.stuInfo??> value="${vbm.stuInfo.name!""}" </#if> />
                            	</div>
                            </div>
							<div class="span6">
								<div class="span3">
									<span class="formTitle">学号<span class="f_req"></span></span>
								</div>
								<div class="span9">
									<input id="stuNumber" readOnly <#if vbm??&& vbm.stuInfo??> value="${vbm.stuInfo.stuNumber!""}"</#if> />
								</div>
							</div>
						</div>
					</div>
			 	 	 <div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<span class="formTitle">学院<span class="f_req"></span></span>
								</div>
								<div class="span9">
	                          		<input id="genderName" readOnly  <#if vbm??&& vbm.stuInfo?? &&vbm.stuInfo.college??> value="${vbm.stuInfo.college.name!""}"</#if> />
								</div>
							</div>
							<div class="span6">
								<div class="span3">
									<span class="formTitle">专业<span class="f_req"></span></span>
								</div>
								<div class="span9">
	                          		<input id="majorName" readOnly  <#if vbm??&& vbm.stuInfo?? &&vbm.stuInfo.major??> value="${vbm.stuInfo.major.majorName!""}"</#if> />
								</div>
							</div>
						</div>	
                    </div>
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<span class="formTitle">班级<span class="f_req"></span></span>
								</div>
								<div class="span9">
	                          		<input id="className" readOnly    <#if vbm??&& vbm.stuInfo?? &&vbm.stuInfo.classId??> value="${vbm.stuInfo.classId.className!""}"</#if> />
								</div>
							</div>
							<div class="span6">
								<div class="span3">
									<span class="formTitle">性别<span class="f_req"></span></span>
								</div>
								<div class="span9">
	                          		<input id="genderName" readOnly  <#if vbm??&& vbm.stuInfo?? &&vbm.stuInfo.genderDic??> value="${vbm.stuInfo.genderDic.name!""}"</#if> />
	                          	</div>													
							</div>
							
						</div>
					</div>
					
					
                   
	                <div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<span class="formTitle">政治面貌<span class="f_req"></span></span>
								</div>
								<div class="span9">
									<input id="politicalName"  readOnly    <#if vbm??&& vbm.stuInfo?? &&vbm.stuInfo.politicalDic??> value="${vbm.stuInfo.politicalDic.name!""}" </#if> />
								</div>
							</div>
							<div class="span6">
								<div class="span3">
									<span class="formTitle">联系电话<span class="f_req"></span></span>
								</div>
								<div class="span9">
	                          		<input id="phone1" readOnly   <#if vbm?? && vbm.stuInfo??> value="${vbm.stuInfo.phone1!""}"</#if> />
								</div>
							</div>
							
							
						</div>
					</div>
					<div class="formSep">
						<div class="row-fluid">
							
							<div class="span6">
								<div class="span3">
									<span class="formTitle">QQ<span class="f_req"></span></span>
								</div>
								<div class="span9">
	                          		<input id="qq" readOnly <#if vbm??&& vbm.stuInfo??> value="${vbm.stuInfo.qq!""}"</#if> />
								</div>
							</div>
							<div class="span6">
								<div class="span3">
									<span class="formTitle">其他职位<span class="f_req"></span></span>
								</div>
								<div class="span9">
	                          		<input id="otherPosition" name="otherPosition" <#if vbm??&& vbm.otherPosition??>value="${vbm.otherPosition!""?html}" </#if>/>
								</div>
							</div>
							
						</div>
					</div>
					  <div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<span class="formTitle">是否培训<span class="f_req">*</span></span>
								</div>
								<div class="span9">
									<#if isNoList??>
										<#list isNoList as a>
											<#if vbm ?? && vbm.isTraining??  && vbm.isTraining.id==a.id >
												<label class="radio inline"><input type="radio" name="isTraining.id" value="${a.id}" checked />${a.name?html}</label>
											<#else>
												<label class="radio inline"><input type="radio" name="isTraining.id" value="${a.id}"  />${a.name?html}</label>
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
									<span class="formTitle">特长爱好<span class="f_req"></span></span>
								</div>
								<div class="span9">
									<#if vbm?? && vbm.hobby??>
									    <textarea rows="5" cols="12" readOnly id="hobby" name="hobby"  style="width: 730px; height: 134px;">${((vbm.hobby)!"")?html}</textarea>
									<#else>
									    <textarea rows="5" cols="12" readOnly id="hobby" name="hobby"  style="width: 730px; height: 134px;"></textarea>
									</#if>	
								</div>
						   </div>
						</div>
					</div> 
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<span class="formTitle">注册号<span class="f_req">*</span></span>
								</div>
								<div class="span9">
									<input id="registerNum" name="registerNum"  <#if vbm?? && vbm.registerNum??> value="${vbm.registerNum!''}" </#if>/>
								</div>
						   </div>
						</div>
					</div>
	        		<input id="flags" type="hidden" name="flags"  value="${(flags)!""}">
		        			
			</form>
			<br/> 
	    <div class="row-fluid">
		 	<div class="span6">
		  		<div class="span3">
		   		</div>
		   		<div class="span9">
		             <!--判断是保存还是提交，保存=0   提交=1 -->
		           
		            	 <button class="btn btn-info" type="button" id="submit-button" onclick="onSave()">保 存</button>
		            	 <button class="btn" type="button" onclick="javascript:window.history.back(-1);">取 消</button>
		          
		   		</div>
		   	</div>
		</div>
        </div>
    </div>
    <#-- 审核历史弹出框  end-->
	<#include "/common/approve/approveComment.ftl">
 <script>
 
 //校验电话号码
	jQuery.validator.addMethod("checkPhone",function(value,element){
	  		if(value != ""){
	      		var patrn = /^(0[0-9]{2,3}\-)?([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$|(^(13[0-9]|15[0|3|6|7|8|9]|18[8|9])\d{8}$)/;
	     		 return patrn.exec(value);
	   		}else{
	      		return true;
	   		}
  			return false;
	},"请输入正确的电话号码,并且只能是数字与-的组合");
 
     function onSave(){
		 if($("#volunteerManageForm").valid()){
			$("#volunteerManageForm").submit();	
		 }
      }
  	$("document").ready(function(){
		//页面校验
		 $(".form_validation_reg").compValidate({
			rules:{   
					'otherPosition':{maxlength:30},
					'registerNum':{required:true,maxlength:32,digits:true,isRepeatRegisterNum:true},
					'isTraining.id':{required:true}
				},
			messages:{
					'otherPosition':{maxlength:'其他职务最大长度为30'},
					'registerNum':{required:'注册号不能为空',maxlength:'注册号最大长度为32',digits:'注册号只能为数字'},
					'isTraining.id':{required:'是否培训不能为空'},
					
			}		
		 });
		 
     });
     /*
	 *校验注册号重复
	 */
	jQuery.validator.addMethod("isRepeatRegisterNum", function(value,element) {
		
		var registerNum=$("#registerNum").val();
		var id=$("#id").val();
		var optionalval = this.optional(element);
		var returnval;
		 $.ajax({
         	url:"${rc.contextPath}/volunteer/applyApprove/opt-approve/isRepeatRegisterNum.do",
         	async:false,
			cache:false,
			type:"POST",
			data:{registerNum:registerNum,id:id},
         	success:function(msg){
         		returnval = optionalval||(msg=='success');
         	}
         });
			return returnval;
	}, "该注册号已经被其他志愿者使用，请检查");
 </script>
</body>
</html>