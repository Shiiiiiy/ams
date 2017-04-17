<html>
 <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
       <!-- jquery.validate -->
		<script src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script>
	  <!-- ajax form-->
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
    </head>
<body>
<div id="contentwrapper">
	<div class="main_content">
	 	<h3 class="heading">
			<#if recruit?? && recruit.id??>
				招聘会情况修改
			<#else>
				上报招聘会情况
			</#if>
			
	    </h3>
		<form id="recruitForm" class="form_validation_reg" action="${rc.contextPath}/job/recruit/opt-update/updateRecruit.do" method="post">
			<input id="id" type="hidden" name="id"  value="${(recruit.id)!""}">
		   
			<div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span4">
							<label>学年<span class="f_req">*</span></label>
						</div>
						<div class="span4">
							<select size="1" id="year" name="year.id" aria-controls="dt_gal" <#if recruit?? && recruit.id??>disabled</#if> onchange="queryByConditions();" >
							<option value="">请选择..</option>
						    	<#if yearList ??>
									<#list yearList as y>
						    			<#if recruit?? && recruit.year?? && recruit.year.id == y.id>
						    				<option  value="${y.id}" selected="selected" />${y.name?html}</option>
										<#else>
											<option value="${y.id}" >${y.name}</option>	
						    			</#if>
						    		</#list>
						    	</#if>
							</select>
						</div>
					</div>
					<div class="span6">
						<div class="span4">
							<label>学院<span class="f_req">*</span></label>
						</div>
						<div class="span4">
							<select size="1" id="college" name="college.id" aria-controls="dt_gal" <#if  recruit?? && recruit.id??>disabled</#if> onchange="queryByConditions();" >
							<#if !flag?? || flag != true><option value="">请选择..</option></#if>
							<#if collegeList??>
								<#list collegeList as c>
									<#if recruit?? && recruit.college?? && recruit.college.id == c.id >
										<option value="${c.id}" data-code="${c.code?html}" selected="selected" >${c.name?html}</option>	
									<#else>
										<option value="${c.id}" data-code="${c.code?html}" >${c.name?html}</option>	
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
						<div class="span4">
							<label>举办大型招聘会次数<span class="f_req">*</span></label>
						</div>
						<div class="span4">
							<input id="largeRecruit" name="largeRecruit"  value="${(recruit.largeRecruit)!""}"/>
						</div>
					</div>
					<div class="span6">
						<div class="span4">
							<label>大型招聘会单位数量<span class="f_req">*</span></label>
						</div>
						<div class="span4">
							<input id="largeRecruitDepartment" name="largeRecruitDepartment" value="${(recruit.largeRecruitDepartment)!""}"/>
						</div>
					 </div>
				  </div>
			   </div>
			   
			<div class="formSep"> 
			   <div class="row-fluid">
					<div class="span6">
						<div class="span4">
							<label>大型招聘会提供岗位数量<span class="f_req">*</span></label>
						</div>
						<div class="span5">
							<input id="largeRecruitPosition" name="largeRecruitPosition"  value="${(recruit.largeRecruitPosition)!""}"/>
						</div>
					</div>
					<div class="span6">
						<div class="span4">
							<label>举办小型招聘会数量<span class="f_req">*</span></label>
						</div>
						<div class="span4">
							<input id="smallRecruit" name="smallRecruit" value="${(recruit.smallRecruit)!""}"/>
						</div>
					</div>
				</div>
			</div>   
			   
			<div class="formSep"> 
				<div class="row-fluid">
					<div class="span6">
						<div class="span4">
							<label>小型招聘会单位数量<span class="f_req">*</span></label>
						</div>
						<div class="span4">
							<input id="smallRecruitDepartment" name="smallRecruitDepartment" value="${(recruit.smallRecruitDepartment)!""}"/>
						</div>
					</div>
					<div class="span6">
						<div class="span4">
							<label>小型招聘会提供岗位数量<span class="f_req">*</span></label>
						</div>
						<div class="span4">
							<input id="smallRecruitPosition" name="smallRecruitPosition" value="${(recruit.smallRecruitPosition)!""}"/>
						</div>
					</div>
				</div>
			</div> 	
				
			<div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span4">
							<label>举办宣讲会次数<span class="f_req">*</span></label>
						</div>
						<div class="span4">
							<input id="career" name="career"  value="${(recruit.career)!""}" />
						 </div>
					</div>	
					<div class="span6">
						<div class="span4">
							<label>宣讲会单位数量<span class="f_req">*</span></label>
						</div>
						<div class="span4">
							<input id="careerDepartment" name="careerDepartment" value="${(recruit.careerPosition)!''}"/>
						</div>
					 </div>
				</div>
			</div>		
					
			<div class="formSep">
				<div class="row-fluid">
					<div class="span6">
					  	<div class="span4">
						  	<label>宣讲会岗位数量<span class="f_req">*</span></label>
						</div>
						<div class="span4">
							<input id="careerPosition" name="careerPosition" value="${(recruit.careerPosition)!''}"/>
						 </div>
					  </div>
				 </div>	
			  </div>	
					
		</form>
			<br/> 		
			<div class="row-fluid">
				<div class="span6">
			  		<div class="span4">
			  		</div>
					<div class="span4">
			            <button class="btn btn-info" type="button" onclick="onSave()">保 存</button>
			  			<button class="btn" type="button" onclick="javascript:window.history.back(-1);">取 消</button>
				  	</div>
				</div>
			</div>
				
	</div>
</div>
	 <input name="checkValue" id="checkValue" type="hidden" value="true"/>
<script>

	function onSave(){
		if(!$("#recruitForm").compValid()) return;
			var id = $("#id").val();
			var checkValue = $("#checkValue").val();
			if(id){
				   $("#recruitForm").submit();
			}
			else{
				if(checkValue == "false"){
				   $("#recruitForm").submit();
				}else{
					comp.message("当前学年该学院的招聘会上报信息已经存在，请通过编辑进行修改","error");
				}
			}
	}
	 
	 function queryByConditions()
	 {
		var college = $("#college").val();
		var year = $("#year").val();
		if(college != "" && year != "" )
		{
		  	var param = {collegeId:college,year:year};
			$.post("${rc.contextPath}/job/recruit/opt-query/checkExistis.do",param,function(data) {
			if(data == "true")
			{
				comp.message("当前学年该学院的招聘会上报信息已经存在，请通过编辑进行修改","error");
				$("#checkValue").val("ture");
			}else{
				$("#checkValue").val("false");
			}
			},"text");				    
		 }
	 }
	 
	 
	$("document").ready(function(){
		$("#recruitForm").compValidate({
			rules:{
				'year.id' : {required:true},
				'college.id' : {required:true},
				largeRecruit:{required:true, digits:true, maxlength:6},
				largeRecruitDepartment:{required:true, digits:true, maxlength:6},
				largeRecruitPosition:{required:true, digits:true, maxlength:6},
				smallRecruit:{required:true, digits:true, maxlength:6},
				smallRecruitDepartment:{required:true, digits:true, maxlength:6},
				smallRecruitPosition:{required:true, digits:true, maxlength:6},
				career:{required:true, digits:true, maxlength:6},
				careerDepartment:{required:true, digits:true, maxlength:6},
				careerPosition:{required:true, digits:true, maxlength:6}
			},
			messages:{
				'year.id' : {required : '学年不能为空'},
				'college.id' : {required : '学院不能为空'},
				largeRecruit : {required:'举办大型招聘会次数不能为空', digits: "请输入整数", maxlength:'输入长度最多为6位数字'},
				largeRecruitDepartment : {required:'大型招聘会单位数量不能为空', digits: "请输入整数", maxlength:'输入长度最多为6位数字'},
				largeRecruitPosition : {required:'大型招聘会提供岗位数量不能为空', digits: "请输入整数", maxlength:'输入长度最多为6位数字'},
				smallRecruit : {required:'举办小型招聘会数量不能为空', digits: "请输入整数", maxlength:'输入长度最多为6位数字'},
				smallRecruitDepartment : {required:'小型招聘会单位数量不能为空', digits: "请输入整数", maxlength:'输入长度最多为6位数字'},
				smallRecruitPosition : {required:'小型招聘会提供岗位数量不能为空', digits: "请输入整数", maxlength:'输入长度最多为6位数字'},
				career : {required:'举办宣讲会次数不能为空', digits: "请输入整数", maxlength:'输入长度最多为6位数字'},
				careerDepartment : {required:'宣讲会单位数量不能为空', digits: "请输入整数", maxlength:'输入长度最多为6位数字'},
				careerPosition : {required:'宣讲会岗位数量不能为空', digits: "请输入整数", maxlength:'输入长度最多为6位数字'}
			}
		});
		
	});		
	 </script>
</body>
</html>
