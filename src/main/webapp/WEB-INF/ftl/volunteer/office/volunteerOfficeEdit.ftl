<html>
 <head>
 	<meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
    <link rel="stylesheet" href="${rc.contextPath}/lib/My97DatePicker/skin/WdatePicker.css" />
	<script type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
 </head>
<body>
<div id="contentwrapper">
    <div class="main_content">   
        <div class="row-fluid">
        	 <div class="row-fluid">
		   		<div class="span12">
		      		<h3 class="heading">
						<#if vom?? && vom.id??>
						志愿者基地修改
						<#else>
						志愿者基地增加 
						</#if>
			   		</h3>
			  	</div>
			 </div> 	
    		<form  id="volunteerOfficeForm" class="form_validation_reg" action="${rc.contextPath}/volunteer/office/opt-save/saveOffice.do" method="post">
				<input id="id" type="hidden" name="id" <#if vom??> value="${(vom.id)!""}" </#if> /> 
				
				    <div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<span class="formTitle">学院<span class="f_req"><#if !teacherOrgId??>*</#if></span></span>
								</div>
								<div class="span9">
									<select size="1" id="college" name="college.id" <#if teacherOrgId??> disabled </#if>aria-controls="dt_gal" class="span6">
										<option value="" >请选择</option>
										<#if collegeList??>
											<#list collegeList as c>
												<#if vom?? && vom.college?? && c.id==vom.college.id>
													<option value="${c.id}" selected="selected">${c.name?html}</option>
												<#else>
													<option value="${c.id}">${c.name?html}</option>
												</#if>
											</#list>
										</#if>
									</select>
									<#if teacherOrgId??>
								    	<input name="college.id"  type="hidden" value="${teacherOrgId}"/>
								    </#if>
								</div>
                            </div>
                            <div class="span6">
								<div class="span3">
									<span class="formTitle">成立时间<span class="f_req">*</span></span>
								</div>
								<div class="span9">
									<input type="text" id="foundedTime" name="foundedTime"   <#if vom?? && vom.foundedTime??> value="${(vom.foundedTime)?date}" </#if> style="cursor:pointer;" 
										class="Wdate span6"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',skin:'whyGreen',el:$dp.$('foundedTime')})" style="cursor:pointer"  />
								</div>
							</div>
						</div>
					</div>
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<span class="formTitle">基地负责人 <span class="f_req">*</span></span>
								</div>
								<div class="span9">
									<#--<input   class="span6" readOnly <#if currentUser??> value="${currentUser.name!""?html}"<#elseif vom?? && vom.manager??>  value="${vom.manager.name!""?html}"</#if> />
									<input type="hidden"  name="manager.id" <#if currentUser??> value="${currentUser.id!""?html}"<#elseif vom?? && vom.manager??>  value="${vom.manager.id!""?html}"</#if> />
									-->
									<input   class="span6"  name="manager" <#if vom?? && vom.manager??>  value="${vom.manager!""?html}"</#if> />
								</div>
							</div>
							<div class="span6">
								<div class="span3">
									<span class="formTitle">负责人电话<span class="f_req"></span></span>
								</div>
	                          	<div class="span9">
	                          		<input id="managerPhone"  name="managerPhone" class="span6" <#if vom??>  value="${vom.managerPhone!""?html}"</#if> />
								</div>
							</div>
						</div>
					</div>
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									<span class="formTitle">负责人QQ<span class="f_req"></span></span>
								</div>
								<div class="span9">
									<input id="managerQQ"  name="managerQQ" class="span6" <#if vom??>  value="${vom.managerQQ!""?html}"</#if> />
								</div>
							</div>
						      <div class="span6">
								<div class="span3">
									<span class="formTitle">其他联系方式</span>
								</div>
	                          	<div class="span9">
	                          		<input id="otherWay" name="otherWay" class="span6" <#if vom??>  value="${vom.otherWay!""?html}"</#if> />
								</div>
							</div>
						</div>
					</div>
					<div class="formSep">
						<div class="row-fluid">
						   <div class="span6">
								<div class="span3">
									<span class="formTitle">基地地址<span class="f_req">*</span></span>
								</div>
								<div class="span9">
									<textarea id="officeAddress" name="officeAddress" class="span12" cols="120" rows="5" /><#if vom??>${vom.officeAddress!""?html}</#if></textarea>
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
	             <!--判断是保存还是提交，保存=0   提交=1 -->
	            <div class="span9">
			    	<button class="btn btn-info" type="button" id="save-course" onclick="onSub()">保 存</button>
	  				<button class="btn" type="button" onclick="javascript:window.history.back(-1);">取 消</button>
		   		</div>
		   	</div>
		</div>
        </div>
    </div>
 <script>
 
 //保存方法 
 	 function onSub(){
		if($("#volunteerOfficeForm").valid()){
			     $("#volunteerOfficeForm").submit();	
		}
     }
      
  	$("document").ready(function(){
		//页面校验
		 $(".form_validation_reg").compValidate({
			rules:{   
					'college.id':{required:true},
					'officeAddress':{required:true,maxlength:200},
					'foundedTime':{required:true},
					'manager':{required:true,maxlength:100},
					'managerPhone':{maxlength:50,checkPhone:true},
					'managerQQ':{maxlength:50,regQq:true},
					'otherWay':{maxlength:50}
				},
			messages:{
					'college.id':{required:'学院不能为空'},
					'officeAddress':{required:'基地地址不能为空',maxlength:'基地地址最大长度为200'},
					'foundedTime':{required:'成立时间不能为空'},
					'manager':{required:'基地负责人不能为空',maxlength:'基地负责人最大长度为100'},
					'managerPhone':{maxlength:'负责人电话最大长度为50'},
					'managerQQ':{maxlength:'负责人QQ最大长度为50'},
					'otherWay':{maxlength:'其他联系方式最大长度为50'}
			}		
		 });
		 
     });
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
 </script>
</body>
</html>