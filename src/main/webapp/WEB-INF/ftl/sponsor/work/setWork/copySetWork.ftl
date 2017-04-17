<html>
 <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- jQuery UI theme-->
        <link rel="stylesheet" href="${rc.contextPath}/lib/jquery-ui/css/Aristo/Aristo.css" />
        <script src="${rc.contextPath}/lib/jquery-ui/jquery-ui-1.8.20.custom.min.js"></script>
        <!-- animated progressbars -->
        <script src="${rc.contextPath}/js/bdp_fileupload.progressbar.js"></script>
        <script src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script>
        <!-- ajax form-->
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
		<script src="${rc.contextPath}/js/apw/apw_check.js"></script>
		<!-- bootstrap-fileupload -->	
		<link rel="stylesheet" href="${rc.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.min.css" />
		<!-- multiselect -->
	    <link rel="stylesheet" href="${rc.contextPath}/lib/multiselect/css/multi-select.css" />
		<script src="${rc.contextPath}/lib/multiselect/js/jquery.multi-select.min.js"></script>	
    </head>
<body>
<div id="contentwrapper">
 <div class="main_content">
  	<div class="row-fluid">
		<div class="row-fluid">
		   <div class="span12">
		      <h3 class="heading">
					复制岗位
			  </h3>
			</div>
		</div> 
				
			<form  id="copyPositionForm" class="form_validation_reg" action="${rc.contextPath}/sponsor/setWork/opt-save/saveCopySetWork.do" method="post" ><@token/>
			   	<input name="check_error" id="check_error" type="hidden" value="true"/>
			    <div class="formSep"> 
				   <div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<lable>源学年<span class="f_req">*</span></lable>
							</div>
							<div class="span9">
								<select  id="sourceSchoolYearId" size="1"  aria-controls="dt_gal" name="sourceSchoolYearId" class="{required:true,messages:{required:'学年不能为空'}}">
								  <option value="">请选择..</option>
									<#if yearList ??>
										<#list yearList as d>
											
											<option value="${d.id}" >${d.name?html}</option>	
										</#list>
									</#if>
							    </select>
							</div>
						</div>
							
						<div class="span6">
							<div class="span3">
								<lable>源学期<span class="f_req">*</span></lable>
							</div>
							<div class="span9">
								<select  id="sourceTermId" size="1" id="term" name="sourceTermId" aria-controls="dt_gal"  class="{required:true,messages:{required:'学期不能为空'}}" >
										<option value="" >请选择</option>
										<#if termList??>
											<#list termList as t>
												<option value="${t.id}">${t.name?html}</option>
											</#list>
										</#if>
									</select>
	
							</div>
						 </div>
					  </div>
				   </div>
				   
			   <div class="formSep"> 
				   <div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<lable>目标学年<span class="f_req">*</span></lable>
							</div>
							<div class="span9">
								<select id="aimSchoolYearId" size="1"  aria-controls="dt_gal" name="aimSchoolYearId" class="{required:true,messages:{required:'学年不能为空'}}">
								  <option value="">请选择..</option> 
									<#if yearList ??>
										<#list yearList as d>
											<#if nowYearDic??&& nowYearDic.id==d.id >
												<option value="${d.id}" selected="selected">${d.name}</option>		
		
											<#else>
											<option value="${d.id}" >${d.name}</option>		
											</#if>
										</#list>
									</#if>
							    </select>
									
							</div>
						</div>
							
						<div class="span6">
							<div class="span3">
								<lable>目标学期<span class="f_req">*</span></lable>
							</div>
							<div class="span9">
								<select  id="aimTermId" size="1" id="term" name="aimTermId" aria-controls="dt_gal"  class="{required:true,messages:{required:'学期不能为空'}}" >
										<option value="" >请选择</option>
										<#if termList??>
											<#list termList as t>
												<#if nowTermDic??&& nowTermDic.id==t.id >
												<option value="${t.id}" selected="selected">${t.name}</option>		
		
												<#else>
												<option value="${t.id}">${t.name?html}</option>
												</#if>
											</#list>
										</#if>
									</select>
	
							</div>
						 </div>
					  </div>
				   </div>
				   
				 <div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<lable>用工部门</lable>
							</div>
							<div class="span9">
								<input id="orgId" type="hidden" name="orgId"  value="${(teacherOrg.id)!""}"/>
								<input id="org.name"  readOnly value="${(teacherOrg.name)!""}" />
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
				            <!--判断是保存还是提交，保存=0   提交=1 -->
						    <button class="btn btn-info" type="button" id="save-course" onclick="onSub('0')">保 存</button>
				  			<button class="btn" type="button" onclick="javascript:window.history.back(-1);">取消</button>
					  	</div>
					</div>
			  </div>
    	  </div>
  	 </div>
 </div>
<script>
	var attachFlag;
	$("document").ready(function(){
  		
		//页面校验
		attachFlag = $(".form_validation_reg").compValidate({
			rules:{     
					'sourceSchoolYearId':{required:true},
					'sourceTermId': {required:true},
					'aimSchoolYearId':{required:true},
					'aimTermId': {required:true}
				},
			messages:{
				'sourceSchoolYearId':{required:'学年不能为空！'},
				'sourceTermId':{required:'学期不能为空！'},
				'aimSchoolYearId':{required:'复制到学年不能为空！'},
				'aimTermId':{required:'复制到学期不能为空！'}
		 	}		
		 });
     });
   
		//保存方法 
	 	 function onSub(stas){
	 		
	 		var check_error=$("#check_error").val();
	 		if(attachFlag.form()==false){
	 		    return false;
	 		}
	 		var sourceSchoolYearId=$("#sourceSchoolYearId").val();
	 		var sourceTermId=$("#sourceTermId").val();
	 		var aimSchoolYearId=$("#aimSchoolYearId").val();
	 		var aimTermId=$("#aimTermId").val();
	 		var orgId=$("#orgId").val();
	 		if(sourceSchoolYearId==aimSchoolYearId && sourceTermId==aimTermId){
	 		 	 comp.message("源学年学期与目标学年学期不能相同","error");
	             return;
	 		}
	               
			if(check_error == "true"){
			    if(stas=="0"){
			       
	                 $.ajax({
	                 	url:"${rc.contextPath}/sponsor/setWork/opt-save/saveCopySetWork.do",
	                 	async:false,
						cache:false,
						type:"POST",
						data:{sourceSchoolYearId:sourceSchoolYearId,sourceTermId:sourceTermId,aimSchoolYearId:aimSchoolYearId,aimTermId:aimTermId,orgId:orgId},
	                 	success:function(msg){
	                 		if("success"==msg){
	                 			
	                 			comp.message("复制成功","info");
	                 			comp.message("3秒后会自动跳转到列表页面","info");
	                 			timer=window.setInterval(function(){
	                 					window.clearInterval(timer);
	                 					window.location.href="${rc.contextPath}/sponsor/setWork/opt-query/queryWorkOrgList.do";
	                 				  },3000);
	                 		}else if("isnull"==msg){
	                 			comp.message("源学年学期审核通过的岗位信息不存在，请检查","error");
	                 		}else{
	                 			comp.message("目标学年学期岗位信息已经存在","error");
	                 		}
	                 	
	                 	}
	                 	
	                 	
	                 });
		
			    }
			}
	 	  }
		

	
</script>
</body>
</html>
					   