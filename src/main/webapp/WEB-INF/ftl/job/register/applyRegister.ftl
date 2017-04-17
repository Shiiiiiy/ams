<html>
	<head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    </head>
<body>

<div id="contentwrapper">
	<div class="main_content">
 		<div class="row-fluid">
		  	<div class="span12">
		        <h3 class="heading">
					报到证补办申请
			    </h3>
			</div>
		</div>
		<form id="applyRegister" class="form_validation_reg" action="${rc.contextPath}/job/register/opt-save/saveRegisterApply.do" method="post">
			<input id="id" type="hidden" name="id"  value="${(register.id)!""}">
			
			<div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span4">
							<label>姓名</label>
						</div>
						<div class="span8">
							<input id="stuName" name="stuName"  value="${(register.student.name)!""}" readOnly />
						</div>
					</div>
					<div class="span6">
						<div class="span4">
							<label>性别</label>
						</div>
						<div class="span8">
							<input id="genderDic" name="genderDic.name"  value="${(register.student.genderDic.name)!""}" readOnly />
						</div>
					</div>
				</div>
			</div>
			
			<div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span4">
							<label>学号</label>
						</div>
						<div class="span8">
							<input id="stuNumber" name="stuNumber"  value="${(register.student.stuNumber)!""}" readOnly />
						</div>
					</div>
					<div class="span6">
						<div class="span4">
							<label>学年</label>
						</div>
						<div class="span8">
							<input id="employmentYear" name="employmentYear.id"  value="${(register.employmentYear.name)!""}" readOnly />
						</div>
					</div>
				</div>
			</div>
			
			<div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span4">
							<label>学院</label>
						</div>
						<div class="span8">
							<input id="college" name="college.id" readOnly value="${(register.student.college.name)!""}" readOnly />
						</div>
					</div>
					<div class="span6">
						<div class="span4">
							<label>专业</label>
						</div>
						<div class="span8">
							<input id="major" name="major.majorName" value="${(register.student.major.majorName)!""}" readOnly />
						</div>
					</div>
				</div>
			</div>
			
			<div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span4">
							<label>班级</label>
						</div>
						<div class="span8">
							<input id="classId" name="classId.className"  value="${(register.student.classId.className)!""}" readOnly  />
						</div>
					</div>
					<div class="span6">
						<div class="span4">
							<label>报到证编号</label>
						</div>
						<div class="span8">
							<input id="registerCode" name="registerCode"  value="${(register.registerCode)!""}" readOnly/>
						</div>
					</div>
				</div>
			</div>
			
			<div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span4">
							<label>人事主管部门名称</label>
						</div>
						<div class="span8">
							<input id="humanDepartment" name="humanDepartment" />
						</div>
					</div>
					<div class="span6">
						<div class="span4">
							<label>就业单位名称</label>
						</div>
						<div class="span8">
							<input id="employmentDepartment" name="employmentDepartment" />
						</div>
					 </div>
				</div>
			</div>
			
			<div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span4">
							<label>申请补办理由<span class="f_req">*</span></label>
						</div>
						<div class="span8">
							<textarea style="width:770px;height:134px;" rows="5" cols="12"  id="applyReason" name="applyReason" ></textarea>
						</div>
					</div>
				</div>
			</div>
			
	</from>
		    <br/>
			<div class="row-fluid">
				<div class="span6">
					<div class="span4">
				  	</div>
					<div class="span8">
				        <button class="btn btn-info" type="button" id="submit-button" >提 交</button>
				  		<button class="btn" type="button" onclick="javascript:window.history.back(-1);">取 消</button>
					  </div>
				</div>
			</div>
			
	</div>
</div>

	<script>
		//页面校验 第一个表单校验
		$("document").ready(function(){
			$("#applyRegister").compValidate({
				rules:{
					employmentDepartment : {maxlength:50},
					humanDepartment : { maxlength:50},
					applyReason : {required:true, maxlength:100}
					
				},
				messages:{
					employmentDepartment : { maxlength:'输入长度最多是50的字符串'},
					humanDepartment : { maxlength:'输入长度最多是50的字符串'},
					applyReason : {required:'申请补办理由不能为空',  maxlength:'输入长度最多是100的字符串'}
				}
			});
		});
		
		//保存方法
		$("#submit-button").click(function() {
			if($("#applyRegister").compValid()){
				comp.confirm("提交后信息不能修改，确认要提交吗？", function(result) {
					if(!result) return;
					$("#applyRegister").submit();
				});		
			}
		});	
			
	</script>
</body>
</html>
