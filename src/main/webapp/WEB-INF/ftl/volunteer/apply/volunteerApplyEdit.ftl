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
						志愿者注册 
			   		</h3>
			  	</div>
			 </div> 	
    		<form  id="volunteerApplyForm" class="form_validation_reg" action="${rc.contextPath}/volunteer/applyRequest/opt-save/saveVounteer.do" method="post">
					<input id="id" type="hidden" name="id" <#if vbm??> value="${(vbm.id)!""}" </#if> /> 
					<input id="stuInfoId" type="hidden" name="stuInfo.id" <#if currentStu??> value="${(currentStu.id)!""}"<#elseif vbm??&& vbm.stuInfo??> value="${vbm.stuInfo.id!""}"	</#if> /> 
				    <div class="formSep">
						<div class="row-fluid">
							
							<div class="span6">
								<div class="span3">
									<span class="formTitle">姓名<span class="f_req"></span></span>
								</div>
								<div class="span9">
									<input id="name" readOnly <#if currentStu??> value="${currentStu.name!""?html}"<#elseif vbm??&& vbm.stuInfo??> value="${vbm.stuInfo.name!""}" </#if> />
                            	</div>
                            </div>
							<div class="span6">
								<div class="span3">
									<span class="formTitle">学号<span class="f_req"></span></span>
								</div>
								<div class="span9">
									<input id="stuNumber" readOnly <#if currentStu??> value="${currentStu.stuNumber!""?html}"<#elseif vbm??&& vbm.stuInfo??> value="${vbm.stuInfo.stuNumber!""}"</#if> />
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
	                          		<input id="genderName" readOnly <#if currentStu?? &&currentStu.college??>  value="${currentStu.college.name!""?html}" <#elseif vbm??&& vbm.stuInfo?? &&vbm.stuInfo.college??> value="${vbm.stuInfo.college.name!""}"</#if> />
								</div>
							</div>
							<div class="span6">
								<div class="span3">
									<span class="formTitle">专业<span class="f_req"></span></span>
								</div>
								<div class="span9">
	                          		<input id="majorName" readOnly <#if currentStu?? &&currentStu.major??>  value="${currentStu.major.majorName!""?html}" <#elseif vbm??&& vbm.stuInfo?? &&vbm.stuInfo.major??> value="${vbm.stuInfo.major.majorName!""}"</#if> />
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
	                          		<input id="className" readOnly <#if currentStu?? &&currentStu.classId??>  value="${currentStu.classId.className!""?html}" <#elseif vbm??&& vbm.stuInfo?? &&vbm.stuInfo.classId??> value="${vbm.stuInfo.classId.className!""}"</#if> />
								</div>
							</div>
							<div class="span6">
								<div class="span3">
									<span class="formTitle">性别<span class="f_req"></span></span>
								</div>
								<div class="span9">
	                          		<input id="genderName" readOnly <#if currentStu??>  value="${currentStu.genderDic.name!""?html}" <#elseif vbm??&& vbm.stuInfo?? &&vbm.stuInfo.genderDic??> value="${vbm.stuInfo.genderDic.name!""}"</#if> />
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
									<input id="politicalName"  readOnly <#if currentStu??&&currentStu.politicalDic??>  value="${currentStu.politicalDic.name!""?html}" <#elseif vbm??&& vbm.stuInfo?? &&vbm.stuInfo.politicalDic??> value="${vbm.stuInfo.politicalDic.name!""}" </#if> />
								</div>
							</div>
							<div class="span6">
								<div class="span3">
									<span class="formTitle">联系电话<span class="f_req"></span></span>
								</div>
								<div class="span9">
	                          		<input id="phone1" readOnly <#if currentStu?? >  value="${currentStu.phone1!""?html}" <#elseif vbm?? && vbm.stuInfo??> value="${vbm.stuInfo.phone1!""}"</#if> />
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
	                          		<input id="qq" readOnly <#if currentStu?? >  value="${currentStu.qq!""?html}" <#elseif vbm??&& vbm.stuInfo??> value="${vbm.stuInfo.qq!""}"</#if> />
								</div>
							</div>
							<div class="span6">
								<div class="span3">
									<span class="formTitle">其他职位<span class="f_req"></span></span>
								</div>
								<div class="span9">
	                          		<input id="otherPosition" name="otherPosition" <#if vbm??&& vbm.status?? && vbm.status.code=="SUBMIT" && vbm.approveResult?? && vbm.approveResult.code!='REJECT' >readOnly</#if>  <#if vbm??&& vbm.otherPosition??>value="${vbm.otherPosition!""?html}" </#if>  />
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
					
				 	
					<div class="formSep" id="hideSketch">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<span class="formTitle">简述<span class="f_req">*</span></span>
								</div>
								<div class="span9">
									<#if vbm?? && vbm.sketch??>
									    <textarea rows="5" cols="12" id="sketch"<#if vbm??&& vbm.status?? && vbm.status.code=="SUBMIT" && vbm.approveResult?? && vbm.approveResult.code!='REJECT'>readOnly</#if> name="sketch" class="span6 tipTag" data="1.培训时间，地点和培训机构;" style="width: 730px; height: 134px;">${((vbm.sketch)!"")?html}</textarea>
									<#else>
									    <textarea rows="5" cols="12" id="sketch" <#if vbm??&& vbm.status?? && vbm.status.code=="SUBMIT" &&vbm.approveResult?? && vbm.approveResult.code!='REJECT'>readOnly</#if> name="sketch" class="span6 tipTag" data="1.培训时间，地点和培训机构;" style="width: 730px; height: 134px;"></textarea>
									</#if>	
								</div>
						   </div>
						</div>
					</div>  
				 
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<span class="formTitle">特长爱好<span class="f_req">*</span></span>
								</div>
								<div class="span9">
									<#if vbm?? && vbm.hobby??>
									    <textarea rows="5" cols="12" id="hobby"<#if vbm??&& vbm.status?? && vbm.status.code=="SUBMIT" && vbm.approveResult?? && vbm.approveResult.code!='REJECT'>readOnly</#if> name="hobby"  style="width: 730px; height: 134px;">${((vbm.hobby)!"")?html}</textarea>
									<#else>
									    <textarea rows="5" cols="12" id="hobby" <#if vbm??&& vbm.status?? && vbm.status.code=="SUBMIT" &&vbm.approveResult?? && vbm.approveResult.code!='REJECT'>readOnly</#if> name="hobby"  style="width: 730px; height: 134px;"></textarea>
									</#if>	
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
		        		 <#if !vbm??||(vbm??&& vbm.status?? && vbm.status.code=="SAVE" )|| (vbm??&&!vbm.approveResult??||(vbm??&& vbm.approveResult?? && vbm.approveResult.code=='REJECT'))>
		            	 	<button class="btn btn-info" type="button" id="save-course" onclick="onSub('0')">保 存</button>
				    	 </#if>
				    	 <#if !vbm??||(vbm??&&( !vbm.approveResult??||(vbm.approveResult?? && vbm.approveResult.code=='REJECT')))>
				    	 	<button class="btn btn-info" type="button" id="submit-button" onclick="onSub('1')">提 交</button>
		  				 </#if>
		  				 <#if vbm?? && vbm.approveResult??>
							<button class="btn btn-info" type="button" onclick="approve.showApproveComments('${vbm.id!""}');">审核历史</button>
						 </#if>
		  				
		           
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
 //保存方法 
 	 function onSub(stas){
 	        $("#flags").val(stas);
	 	 	if($("#volunteerApplyForm").valid()){
				 if(stas=="1"){
			        if(confirm("提交信息后不能修改，确认要提交吗？")) {
	               		$("#volunteerApplyForm").submit();	
	              	}
	             }else{
	            	$("#volunteerApplyForm").submit();	
				 }
			}
         }
      function onSave(){
			if($("#volunteerApplyForm").valid()){
				$("#volunteerApplyForm").submit();	
			}
      }
  	$("document").ready(function(){
  	    var isTraining = $("input[name='isTraining.id']:checked").val();
 		   if(isTraining=="4028900f40cd477c0140cd4afd8d0001"){
	     	   $("#hideSketch").show();
	        }else{
	     	   $("#hideSketch").hide();
	        }
		//页面校验
		 $(".form_validation_reg").compValidate({
			rules:{   
					'otherPosition':{maxlength:30},
					'hobby':{required:true,maxlength:200},
					'sketch':{required:true,maxlength:200},
					'registerNum':{required:true,maxlength:32,digits:true,isRepeatRegisterNum:true},
					'isTraining.id':{required:true}
				},
			messages:{
					'otherPosition':{maxlength:'其他职务最大长度为30'},
					'hobby':{required:'特长爱好不能为空',maxlength:'特长爱好最大长度为200'},
					'sketch':{required:'简述不能为空',maxlength:'简述最大长度为500'},
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
	
	 //隐藏困难原因
	function onChangeType(){
		var selVal = $("input[name='isTraining.id']:checked").val(); 
	     if(selVal=="4028900f40cd477c0140cd4afd8d0001"){
	     	$("#hideSketch").show();
	     }else{
	     	$("#hideSketch").hide();
	     }
	}
	
	   <!--显示提示框-->
	$(function(){
		$('.tipTag').poshytip({
			className: 'tip-yellowsimple',
			alignTo: 'target',
			alignX: 'right',
			alignY: 'center',
			offsetX: 5
		});
	});
	
 </script>
</body>
</html>