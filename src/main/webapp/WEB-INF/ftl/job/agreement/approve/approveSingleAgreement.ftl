<html>
	<head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="${rc.contextPath}/css/bdp_comp.css" type="text/css" />
    </head>
<body>

<div id="contentwrapper">
	<div class="main_content">
 		<div class="row-fluid">
		  	<div class="span12">
		        <h3 class="heading">
					就业协议补办审核
			    </h3>
			</div>
		</div>
		<form id="approveSingleAgreement" class="form_validation_reg"  method="post">
			<input id="id" type="hidden" name="id"  value="${(agreement.id)!""}">
			
			<div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span4">
							<label>姓名</label>
						</div>
						<div class="span8">
							<input id="stuName" name="stuName"  value="${(agreement.student.name)!""}" readOnly />
						</div>
					</div>
					<div class="span6">
						<div class="span4">
							<label>学号</label>
						</div>
						<div class="span8">
							<input id="stuNumber" name="stuNumber"  value="${(agreement.student.stuNumber)!""}" readOnly />
						</div>
					</div>
				</div>
			</div>
			
			<div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span4">
							<label>学年</label>
						</div>
						<div class="span8">
							<input id="employmentYear" name="employmentYear.id"  value="${(agreement.employmentYear.name)!""}" readOnly />
						</div>
					</div>
					<div class="span6">
						<div class="span4">
							<label>学院</label>
						</div>
						<div class="span8">
							<input id="college" name="college.id" readOnly value="${(agreement.student.college.name)!""}" readOnly />
						</div>
					</div>
				</div>
			</div>
			
			<div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span4">
							<label>专业</label>
						</div>
						<div class="span8">
							<input id="major" name="major.majorName" value="${(agreement.student.major.majorName)!""}" readOnly />
						</div>
					</div>
					<div class="span6">
						<div class="span4">
							<label>班级</label>
						</div>
						<div class="span8">
							<input id="classId" name="classId.className"  value="${(agreement.student.classId.className)!""}" readOnly  />
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
							<input id="humanDepartment" name="humanDepartment" value="${(agreement.humanDepartment)!""}" readOnly />
						</div>
					</div>
					<div class="span6">
						<div class="span4">
							<label>就业单位名称</label>
						</div>
						<div class="span8">
							<input id="employmentDepartment" name="employmentDepartment" value="${(agreement.employmentDepartment)!""}" readOnly />
						</div>
					 </div>
				</div>
			</div>
			
			<div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span4">
							<label>申请补办理由</label>
						</div>
						<div class="span8">
							<textarea style="width:770px;height:134px;" rows="5" cols="12"  id="applyReason" name="applyReason" readOnly >${(agreement.applyReason)!""}</textarea>
						</div>
					</div>
				</div>
			</div>
			
			<div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span4">
							<label>就业协议书编号</label>
						</div>
						<div class="span8">
							<input id="agreementCode" name="agreementCode" value="${(agreement.agreementCode)!""}" readOnly />
						</div>
					</div>
					<div class="span6">
						<div class="span4">
							<label>新就业协议书编号<span class="f_req">*</span></label>
						</div>
						<div class="span8">
							<input id="newAgreementCode" name="newAgreementCode" />
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
				    <button class="btn btn-info" type="button" id="pass-button"> 通 过</button>
				    <button class="btn btn-info" type="button" id="refuse-button"> 拒 绝</button>
		  			<button class="btn" type="button" onclick="javascript:window.history.back(-1);">取消</button>
			  	</div>
			</div>
			</div>
			
	</div>
</div>

	<script>
	
		
		$("document").ready(function(){
			$("#approveSingleAgreement").compValidate({
				rules:{
					newAgreementCode : {required:true, maxlength:20}
				},
				messages:{
					newAgreementCode : {required:'新就业协议书编号不能为空',  maxlength:'输入长度最多是20的字符串'}
				}
			});
		});
		
		$("#pass-button").click(function() {
			var id = $('#id').val();
			if($("#approveSingleAgreement").compValid()){
				comp.confirm("确认要审核通过该学生的就业协议补办申请吗？", function(result) {
					if(!result) return;
					$("#approveSingleAgreement").attr("action", "${rc.contextPath}/job/agreement/opt-save/passSingleAgreement.do?"); 
					$("#approveSingleAgreement").attr("method", "post");
					$("#approveSingleAgreement").submit();
				});		
			}
		});	
			
		$("#refuse-button").click(function() {
			var id = $('#id').val();
			comp.confirm("确认要审核拒绝该学生的就业协议补办申请吗？", function(result) {
				if(!result) return;
				window.location.href = "${rc.contextPath}/job/agreement/opt-save/refuseSingleAgreement.do?id=" +　id;
			});		
		});		
			
	</script>
</body>
</html>
