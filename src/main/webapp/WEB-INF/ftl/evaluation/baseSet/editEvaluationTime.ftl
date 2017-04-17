<html>
 <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <!-- ajax form-->
	<script src="${rc.contextPath}/js/jquery.form.js"></script>
	<!--date-->
	<script language="javascript" type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
</head>
<body>
<div id="contentwrapper">
    <div class="main_content">
	    <div class="row-fluid">
	    	<div class="row-fluid">
		   		 <div class="span12">
			    	<h3 class="heading">
						<#if evaluationTime?? && evaluationTime.id?? >
							修改综合测评时间
						<#else>
							新增综合测评时间
						</#if>
					</h3>
		    	</div>
	    	</div>
			
			<input name="errorText" id="errorText" type="hidden" value="${errorText!""}"/>
			<form  id="evaluationTimeForm" class="form_validation_reg" 
			<#if evaluationTime?? && evaluationTime.id?? >
				action="${rc.contextPath}/evaluation/timeSet/opt-update/saveEvaluationTime.do" 
			<#else>
				action="${rc.contextPath}/evaluation/timeSet/opt-add/saveEvaluationTime.do"
			</#if>
			method="post">
			<#if evaluationTime?? && evaluationTime.id?? >
			<#else>
				<@token/>
			</#if>
				<input id="id" type="hidden" name="id"  value="${(evaluationTime.id)!""}">
				<div class="formSep">
					<div class="row-fluid">
						<div class="span5">
							<div class="span4">
								<label>测评学院 <span class="f_req">*</span></label>
							</div>
							<select size="1" id="collegeId" name="collegeId" aria-controls="dt_gal" class="span6" onChange="getInstructor(this);"<#if evaluationTime?? && evaluationTime.id?? >disabled="disabled"</#if> >
								<option value="" >请选择</option>
								<#if collegeList??>
									<#list collegeList as c>
										<#if evaluationTime?? && evaluationTime.college?? && c.id==evaluationTime.college.id>
											<option value="${c.id}" selected="selected">${c.name?html}</option>
										<#else>
											<option value="${c.id}">${c.name?html}</option>
										</#if>
									</#list>
								</#if>
							</select>
						</div>
						
						<div class="span5">
							<div class="span4">
								<label>测评辅导员 <span class="f_req">*</span></label>
							</div>
							<#if evaluationTime?? && evaluationTime.college??>
								 <input type="hidden"  id="instructorId" name="instructorId"  value="${(evaluationTime.college.id)}" />
    	                		 <input id="instructorName" name="instructorName"  type="text" class="span6" value="${map[evaluationTime.college.id]}" readOnly />
							<#else>
								 <input type="hidden"  id="instructorId" name="instructorId"  value="" />
    	                		 <input id="instructorName" type="text" name="instructorName"  class="span6" value="" readOnly/>
    	                	</#if>
						</div>
					</div>
				</div>
				
				<div class="formSep">
					<div class="row-fluid">
						<div class="span5">
							<div class="span4">
								<label>测评月份 <span class="f_req">*</span></label>
							</div>
							<select size="1" id="monthId" name="monthId" aria-controls="dt_gal" onChange="comfirmEvaluationTime(this);" class="span6"<#if evaluationTime?? && evaluationTime.id?? >disabled="disabled"</#if>> 
								<option value="" >请选择</option>
								<#if monthList ?? >
									<#list monthList as m>
										<#if evaluationTime?? && evaluationTime.month?? && m.id== evaluationTime.month.id >
											<option value="${m.id}" selected >${m.name?html}</option>
										<#else>
											<option value="${m.id}">${m.name?html}</option>
										</#if>
									</#list>
								</#if>
							</select>
						</div>
					</div>
				</div>
				
				<div class="formSep">
					<div class="row-fluid">
						<div class="span5">
							<div class="span4">
								<label>申请开始时间 <span class="f_req">*</span></label>
							</div>
							<div style="margin-left: 0px;">
								<input type="text" id="addStartDate" name="addStartDate" value="${(evaluationTime.addStartTime?string('yyyy-MM-dd'))!""}" style="cursor:pointer;"   
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd',maxDate:'#F{$dp.$D(\'addEndDate\')}',skin:'whyGreen',el:$dp.$('addStartDate')})" class="Wdate span6" />
							</div>
						</div>
						
						<div class="span5">
							<div class="span4">
								<label>申请结束时间 <span class="f_req">*</span></label>
							</div>
							<div style="margin-left: 0px;">
								<input type="text" id="addEndDate" name="addEndDate" value="${(evaluationTime.addEndTime?string('yyyy-MM-dd'))!""}" style="cursor:pointer;" class="Wdate span6"  
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'addStartDate\')}',skin:'whyGreen',el:$dp.$('addEndDate')})" />
							</div>
						</div>
					</div>
				</div>
				
				<div class="formSep">
					<div class="row-fluid">
						<div class="span5">
							<div class="span4">
								<label>确认开始时间 <span class="f_req">*</span></label>
							</div>
							<div style="margin-left: 0px;">
								<input type="text" id="updateStartDate" name="updateStartDate" value="${(evaluationTime.updateStartTime?string('yyyy-MM-dd'))!""}" style="cursor:pointer;" class="Wdate span6"  
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd', maxDate:'#F{$dp.$D(\'updateEndDate\')}',skin:'whyGreen',el:$dp.$('updateStartDate')})" />
							</div>
						</div>
						
						<div class="span5">
							<div class="span4">
								<label>确认结束时间 <span class="f_req">*</span></label>
							</div>
							<div style="margin-left: 0px;">
								<input type="text" id="updateEndDate" name="updateEndDate" value="${(evaluationTime.updateEndTime?string('yyyy-MM-dd'))!""}" style="cursor:pointer;" class="Wdate span6"  
								onclick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'updateStartDate\')}',skin:'whyGreen',el:$dp.$('updateEndDate')})" />
							</div>
						</div>
					</div>
				</div>
			</form>
			<br/>
			<div class="row-fluid">					
			<div class="span5">
				<div class="span4">
				</div>
				<div class="span8" style="margin-left: 0px;">
					<button class="btn btn-info" type="button" onclick="onSub()">确 定</button>
			  		<button class="btn" type="button" onclick="cancel()">取 消</button>
			  	</div>
			</div>
		</div>
				
			<input name="check_error" id="check_error" type="hidden" value="true"/>
		</div>
	</div>
</div>
<script>
	function cancel(){//取消
		window.location.href="${rc.contextPath}/evaluation/timeSet/opt-query/queryEvaluationTime.do";
	}
	
	function onSub(){//保存
		var check_error=$("#check_error").val();
		var addEndDate=$("#addEndDate").val();
		var updateStartDate=$("#updateStartDate").val();
		
		if(addEndDate > updateStartDate){
			comp.message("测评申请结束时间不能大于测评确认开始时间!");
			return false;
		}
		
		$.post("${rc.contextPath}/evaluation/timeSet/opt-query/comfirmEvaluationTime.do", 
			{collegeId: $('#collegeId').val(), monthId: $('#monthId').val(), id:$('#id').val()}, function(data){
    			if(data === "error"){
    				comp.message("该学院在该测评月份已有记录，不能再添加！","error");
    				return;
    			}else{
    				if(check_error == "true"){
						if($('#id').val()==""){
							if($("#evaluationTimeForm").compValidator().form()){
								mask.showShade();
								$('#evaluationTimeForm').submit();
							}
						}else{
							if($("#evaluationTimeForm").compValidator().form()){
								comp.confirm("确认要修改？", function(result) {
					            	if(!result){
					            		return; 
									}
									mask.showShade();
								  	$('#evaluationTimeForm').submit();
								}); 
							}
						}
					}
    			}
		},"text");
	}
	
	function comfirmEvaluationTime(obj){
		var collegeId=$('#collegeId').val();
		var monthId=$('#monthId').val();
		if(monthId != "" && collegeId!= ""){
			$.post("${rc.contextPath}/evaluation/timeSet/opt-query/comfirmEvaluationTime.do", 
			{collegeId: collegeId, monthId: monthId, id:$('#id').val()}, function(data){
    			if(data === "error"){
    				comp.message("该学院在该测评月份已有记录，不能再添加！","error");
    				setTimeout(function () { $(obj).focus(); }, 0);
    			}
			},"text");
		}
	}
	
	function getInstructor(obj){//获取辅导员
		var collegeId=$('#collegeId').val();
		var monthId=$('#monthId').val();
		$.ajax({
			url:'${rc.contextPath}/evaluation/timeSet/opt-query/getInstructor.do',
			async:false,
			cache: false,
			type: "POST",
			dataType:"json", 
			data:{collegeId:collegeId },
		    contentType:"application/x-www-form-urlencoded;charset=utf-8", 
			success: function(data){
				$('#instructorId').val(data.id);
	            $('#instructorName').val(data.name);
		    }
	     });
	     
	     if(monthId != "" && collegeId!= ""){
			$.post("${rc.contextPath}/evaluation/timeSet/opt-query/comfirmEvaluationTime.do", 
			{collegeId: collegeId, monthId: monthId, id:$('#id').val()}, function(data){
    			if(data === "error"){
    				comp.message("该学院在该测评月份已有记录，不能再添加！","error");
    				setTimeout(function () { $(obj).focus(); }, 0);
    			}
			},"text");
		} 
	}
	
	//页面校验
		$("#evaluationTimeForm").compValidate({
			rules:{
				collegeId:{required:true},
				instructorName:{required:true},
				monthId:{required:true},
				addStartDate:{required:true},
				addEndDate:{required:true},
				updateStartDate:{required:true},
				updateEndDate:{required:true}
			},
			messages:{
				collegeId:{required:'请选择学院'},
				instructorName:{required: '该学院未设置测评辅导员，请设置'},
				monthId:{required: '请选择月份'},
				addStartDate:{required: '请设置测评申请开始时间'},
				addEndDate:{required: '请设置测评申请结束时间'},
				updateStartDate:{required: '请设置测评确认开始时间'},
				updateEndDate:{required: '请设置测评确认结束时间'}
			}
		});
</script>
</body>
</html>
