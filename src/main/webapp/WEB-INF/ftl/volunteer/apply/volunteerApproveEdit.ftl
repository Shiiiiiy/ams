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
						志愿者审核
			   		</h3>
			  	</div>
			</div> 	
		    <div class="formSep">
				<div class="row-fluid">
					
					<div class="span6">
						<div class="span3">
							<span class="formTitle">姓名<span class="f_req"></span></span>
						</div>
						<div class="span9">
							<input id="name" readOnly <#if vbm?? && vbm.stuInfo??> value="${vbm.stuInfo.name!""?html}" </#if> />
                    	</div>
                    </div>
                    <div class="span6">
						<div class="span3">
							<span class="formTitle">学号<span class="f_req"></span></span>
						</div>
						<div class="span9">
							<input id="stuNumber" readOnly <#if vbm?? && vbm.stuInfo??> value="${vbm.stuInfo.stuNumber!""?html}"</#if> />
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
                      		<input id="genderName" readOnly <#if vbm?? && vbm.stuInfo??>  value="${vbm.stuInfo.college.name!""?html}"</#if> />
						</div>
					</div>
					<div class="span6">
						<div class="span3">
							<span class="formTitle">专业<span class="f_req"></span></span>
						</div>
                      	<div class="span9">	
                      		<input id="genderName" readOnly <#if vbm?? && vbm.stuInfo??>  value="${vbm.stuInfo.major.majorName!""?html}"</#if> />
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
                      		<input id="genderName" readOnly <#if vbm?? && vbm.stuInfo??>  value="${vbm.stuInfo.classId.className!""?html}"</#if> />
						</div>
					</div>
					<div class="span6">
						<div class="span3">
							<span class="formTitle">性别<span class="f_req"></span></span>
						</div>
                      	<div class="span9">	
                      		<input id="genderName" readOnly <#if vbm?? && vbm.stuInfo??>  value="${vbm.stuInfo.genderDic.name!""?html}"</#if> />
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
							<input id="politicalName"  readOnly <#if vbm?? && vbm.stuInfo??&&vbm.stuInfo.politicalDic??>  value="${vbm.stuInfo.politicalDic.name!""?html}"</#if> />
						</div>
					</div>
					<div class="span6">
						<div class="span3">
							<span class="formTitle">联系电话<span class="f_req"></span></span>
						</div>
                      	<div class="span9">	
                      		<input id="phoneNumber" name="phoneNumber"  readOnly <#if vbm?? && vbm.stuInfo??>  value="${vbm.stuInfo.phone1!""}" </#if> />
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
                      		<input id="qqNumber"  name="qqNumber" readOnly<#if vbm?? && vbm.stuInfo??>  value="${vbm.stuInfo.qq!""}"</#if> />
						</div>
					</div>
					<div class="span6">
						<div class="span3">
							<span class="formTitle">其他职位<span class="f_req"></span></span>
						</div>
                      	<div class="span9">	
                      		<input id="otherPosition" name="otherPosition" readOnly <#if vbm??&& vbm.otherPosition??>value="${vbm.otherPosition!""?html}" </#if>/>
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
												<label class="radio inline"><input type="radio" onclick="onChangeType()" <#if vbm??&& vbm.status?? && vbm.status.code=="SUBMIT" && vbm.approveResult?? && vbm.approveResult.code!='REJECT' >disabled</#if> id="isTraining" name="isTraining.id" value="${a.id}" checked />${a.name?html}</label>
											<#else>
												<label class="radio inline"><input type="radio" onclick="onChangeType()" <#if vbm??&& vbm.status?? && vbm.status.code=="SUBMIT" && vbm.approveResult?? && vbm.approveResult.code!='REJECT'>disabled</#if> id="isTraining" name="isTraining.id" value="${a.id}"  />${a.name?html}</label>
											</#if>
										<!--	<input type="hidden" 
												<#if vbm??&& vbm.status?? && vbm.status.code=="SUBMIT"&&vbm ?? && vbm.isTraining??>
												name="isTraining.id" value="${vbm.isTraining.id!''}"
												</#if>
											/>-->
											
										</#list>
									</#if>
								</div>
						   </div>
						   <#-->
						   <div class="span6">
								<div class="span3">在校时间<span class="f_req">*</span></div>
								<div class="span9">
									<input type="text" id="beginTime" name="beginTime"   <#if vbm?? && vbm.beginTime??> value="${(vbm.beginTime)?date}" </#if> style="cursor:pointer;width:90px;" 
										<#if vbm??&& vbm.status?? && vbm.status.code=="SUBMIT" && vbm.approveResult?? && vbm.approveResult.code!='REJECT'>readOnly	<#else>	onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'endTime\')}',skin:'whyGreen',el:$dp.$('beginTime')})" </#if>class="Wdate span6" />
					 		                          	至
		                          	<input type="text" id="endTime" name="endTime"   <#if vbm?? && vbm.endTime??> value="${(vbm.endTime)?date}" </#if> style="cursor:pointer;width:90px;" 
										<#if vbm??&& vbm.status?? && vbm.status.code=="SUBMIT" && vbm.approveResult?? && vbm.approveResult.code!='REJECT'>readOnly <#else> onclick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'beginTime\')}',skin:'whyGreen',el:$dp.$('endTime')})"</#if>  class="Wdate" />
				 				</div>							
							</div>
							-->
						</div>
					</div>
				<#if vbm.isTraining?? && vbm.isTraining.code=="Y">
					<div class="formSep" id="hideSketch">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<span class="formTitle">简述<span class="f_req"></span></span>
								</div>
								<div class="span9">
									<#if vbm?? && vbm.sketch??>
									    <textarea rows="5" cols="12" readOnly id="sketch" style="width: 730px; height: 134px;">${((vbm.sketch)!"")?html}</textarea>
									<#else>
									    <textarea rows="5" cols="12" readOnly id="sketch" style="width: 730px; height: 134px;"></textarea>
									</#if>	
								</div>
						   </div>
						</div>
					</div>  
				  </#if>	
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
			
	        <form  id="volunteerApproveForm" class="form_validation_reg" action="${rc.contextPath}/volunteer/applyApprove/opt-save/saveApprove.do" method="post">
				<input id="id" type="hidden" name="id" <#if vbm??> value="${vbm.id}" </#if> /> 	
		        <input id="approveKey" type="hidden" name="approveKey"  value="${(approveKey)!""}">
		        <div class="row-fluid">
					<div class="span12">
						<label>&nbsp;</label>
						<h3 class="heading">审批信息</h3>
					</div>
				</div>
				
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<label>审核结果<span class="f_req">*</span></label>
							</div>
							<div class="span9">
								<input type="radio" id="_pass" name="approveResult" value="PASS" onclick="changeApprove()"/>
								<span>通过</span>
								<input type="radio" id="_not_pass" name="approveResult" value="REJECT" onclick="changeApprove()"/>
								<span>拒绝</span>
							</div>
						</div>
						<div class="span6" id="hideRegisterNum">
							<div class="span3">
								<label>注册号<span class="f_req">*</span></label>
							</div>
							<div class="span9">
								<input id="registerNum" name="registerNum"   value="" />
							</div>
						</div>
					</div>
				</div>
		        
		        <div class="formSep"> 	
					 <div class="row-fluid">
					  	<div class="span6">
							<div class="span3">
				    			<span>审批意见<span class="f_req">*</span></span>
							</div>
				    	  	<div class="span9">
				    	  		 <textarea rows="5" cols="12" id="suggest" name="suggest"  style="width: 730px; height: 134px;"></textarea>
							</div>
					  	</div>
					 </div>
    		  	</div>	
			</form>
			<br/> 
		    <div class="row-fluid">
			 	<div class="span6">
			  		<div class="span3">
			   		</div>
			   		<div class="span9">
			         
						<button class="btn btn-info" type="button" onclick="doApprove()">提 交</button>
						<button class="btn btn-info" type="button" onclick="approve.showApproveComments('${vbm.id!""}');">审核历史</button>
			  			<button class="btn" type="button" onclick="javascript:window.history.back(-1);">取 消</button>
			   		</div>
			   	</div>
			</div>
        </div>
    </div>
  </div>
   <#-- 审核历史弹出框  end-->
	<#include "/common/approve/approveComment.ftl">
 <script>
	
 	var myValidator;
   $(document).ready(function(){
   		var status = $(":radio[name='approveResult']:checked").val(); 
		if(status == 'PASS') {
			$("#hideRegisterNum").show();
		}else{
			$("#hideRegisterNum").hide();
		}
		myValidator=$("#volunteerApproveForm").compValidate({
				rules:{
					'approveResult':{required:true},
					'registerNum':{required:true,maxlength:32,digits:true,isRepeatRegisterNum:true},
					'suggest':{required:true,maxlength:200}
				},
				messages:{
					'approveResult':{required:'审核结果不能为空'},
					'registerNum':{required:'注册号不能为空',maxlength:'注册号最大长度为32',digits:'注册号只能为数字'},
					'suggest':{required:'审批意见不能为空',maxlength:'审批意见太长【默认不超过200字符】'}
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
	
 	function changeApprove() {
			//status判断是通过还是拒绝("PASS"通过,"REJECT"拒绝)
			var status = $(":radio[name='approveResult']:checked").val(); 
			$("#approveKey").val(status);
			if(status == 'PASS') {
				$("#hideRegisterNum").show();
			}else if(status == "REJECT") {
				$("#registerNum").val("");
				$("#hideRegisterNum").hide();
			}
	}
 //保存方法 
 	 function doApprove(){
 	 	var approveKey=$("#approveKey").val();
 	 	if(myValidator.form()){
 	 		
			comp.confirm("确定要提交吗？", function(result) {
							
				if(!result){
					return; 
				}
				$("#volunteerApproveForm").submit();	
			});
 	 	}
			
     }
    
  
 </script>
</body>
</html>