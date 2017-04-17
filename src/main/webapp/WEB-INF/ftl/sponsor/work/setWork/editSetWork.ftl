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
	<script src="${rc.contextPath}/js/common/common_approve.js"></script>
 </head>
<body>
<div id="contentwrapper">
	<div class="main_content">
		<div class="row-fluid">
    		<div class="row-fluid">
	   			<div class="span12">
			      <h3 class="heading">岗位维护</h3>
			  	</div>
			</div> 
			<input name="errorText" id="errorText" type="hidden" value="${errorText!""}"/>
			<#if workOrg??  >
				<form  id="setWorkForm" class="form_validation_reg" action="${rc.contextPath}/sponsor/setWork/opt-update/saveSetWork.do" method="post">
			<#else>
				<form  id="setWorkForm" class="form_validation_reg" action="${rc.contextPath}/sponsor/setWork/opt-save/saveSetWork.do" method="post"><@token/>
			</#if>
			<input id="workOrgId" type="hidden" name="workOrgId"  value="${(workOrg.workOrgId)!""}">
			<input id="flags" type="hidden" name="flags"  value="${(flags)!""}">
		    <div class="formSep"> 
				<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<lable>学年<span class="f_req">*</span></lable>
						</div>
						<div class="span9">
							<select size="1" <#if isUpdate?? && isUpdate=="true">disabled</#if> id="schoolYear" name="schoolYear.id"  aria-controls="dt_gal" class="{required:true,messages:{required:'学年不能为空'}}"  onchange="changeTerm()">
							  <option value="">请选择</option>
								<#if yearList ??>
									<#list yearList as d>
										<#if workOrg?? && workOrg.schoolYear ?? && workOrg.schoolYear.id==d.id >
										     <option  value="${d.id}" selected="selected">${d.name?html}</option>
										<#else>
											<option value="${d.id}" >${d.name}</option>	
										</#if>
									</#list>
								</#if>
								<#if isUpdate?? && isUpdate=="true">
										<input type="hidden" id="schoolYear.id" name="schoolYear.id" value="${workOrg.schoolYear.id}"/>
									
								</#if>
						    </select>
						</div>
					</div>
					<div class="span6">
						<div class="span3">
							<lable>学期<span class="f_req">*</span></lable>
						</div>
						<div class="span9">
							<select size="1" <#if isUpdate?? && isUpdate=="true">disabled</#if> id="term" name="term.id" aria-controls="dt_gal"  class="{required:true,messages:{required:'学期不能为空'}}" onchange="changeTerm()">
								<option value="">请选择</option>
								<#if termList??>
									<#list termList as t>
										<#if workOrg?? && workOrg.term??&& workOrg.term.id==t.id >
											<option value="${t.id}"  selected="selected">${t.name?html}</option>
										<#else>
										 <option value="${t.id}">${t.name?html}</option>
										</#if>
									</#list>
								</#if>
								<#if isUpdate?? && isUpdate=="true">
										<input type="hidden" id="term.id" name="term.id" value="${workOrg.term.id}"/>
									
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
							<input id="orgId" type="hidden" name="org.id"  value="${(workOrg.org.id)!""}"/>
							<input  id="org.name"  name="org.name" class="{required:true,messages:{required:'用工部门不能为空'}}"  readOnly title="${(workOrg.org.name)!""}" value="${(workOrg.org.name)!""}" />
						</div>
					</div>
					<div class="span6">
						<div class="span3">
							<lable>用工岗位数</lable>
						</div>
						<div class="span9">
						 <input  readOnly id="workJobNumber" name="workJobNumber"  value="${(workOrg.workJobNumber)!""}" 
								class="{required:true,minlength:1,maxlength:32,digits:true,notZero:true,messages:{required:'岗位数不能为空',notZero:'岗位人数为0，请点击新增岗位'}}" />
						</div> 
					 </div>
				  </div>
			   </div>
			  
			 <div class="formSep"> 
			   <div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<lable>工作时间(小时/天)<span class="f_req">*</span></lable>
						</div>
						<div class="span9">
							<input id="workTime" <#if (workOrg?? && workOrg.status?? && workOrg.status.code=="SUBMIT")&&((!workOrg.processStatus??)||( workOrg.processStatus?? && workOrg.processStatus=="PASS"))>readOnly</#if> name="workTime"  value="${(workOrg.workTime)!""}"  
								class="{required:true,minlength:1,maxlength:32,workTimeCheck:true,messages:{required:'工作时间不能为空'}}"/>
						</div>
					</div>
						
					<div class="span6">
						<div class="span3">
							<lable>预算金额(元/月)<span class="f_req">*</span></lable>
						</div>
						<div class="span9">
							<input id="budgetSalary" <#if (workOrg?? && workOrg.status?? && workOrg.status.code=="SUBMIT")&&((!workOrg.processStatus??)||( workOrg.processStatus?? && workOrg.processStatus=="PASS"))>readOnly</#if> name="budgetSalary"  value="${(workOrg.budgetSalary)!""}" 
								class="{required:true,minlength:1,maxlength:32,floatCheck:true,messages:{required:'预算金额不能为空'}}"/>
						</div>
					 </div>
				  </div>
			   </div>
			   <div class="formSep"> 
					<div class="row-fluid">
					  <div class="span6">
						<div class="span3">
							<label>申请理由</label>
						 </div>
						 <div class="span9">
							<textarea rows="5" cols="12"  id="applyReason" name="applyReason"  
								 <#if (workOrg?? && workOrg.status?? && workOrg.status.code=="SUBMIT")&&((!workOrg.processStatus??)||( workOrg.processStatus?? && workOrg.processStatus=="PASS"))>readOnly</#if> 
								 style="width: 775px; height: 134px;"><#if workOrg?? && workOrg.applyReason??>${(workOrg.applyReason!"")}</#if></textarea>
						 </div>
					  </div>
				 	</div>
		 		</div>
			 <div class="formSep"> 
			   <div class="row-fluid">
				  <div class="span6">
						<div class="span3">
					 	</div>
					  	<div class="span9">
						  	<br/>
				            <#if (workOrg?? && workOrg.status?? && workOrg.status.code=="SUBMIT")&&((!workOrg.processStatus??)||( workOrg.processStatus?? && workOrg.processStatus=="PASS"))>
							<#else>	 
								 <button class="btn btn-info" type="button" onclick="addRow()">新增岗位</button>
		      				</#if>	
						</div>
				  </div>
			  </div>
     		  <div class="row-fluid">
				   <div class="span9">
				      <div class="span2">
				   	  </div>
				      <div class="span10">
				      		<table class="table table-bordered table-striped tablecut" id="smpl_tbl" width="788px;">
								<thead>
									<tr>
										<th width="10%">序号</th>
										<th width="30%">岗位名称</th>
										<th width="35%" >岗位说明</th>
										<th width="15%">岗位人数</th>
										<#if (workOrg?? && workOrg.status?? && workOrg.status.code=="SUBMIT")&&((!workOrg.processStatus??)||( workOrg.processStatus?? && workOrg.processStatus=="PASS"))>								
										<#else>	 									
										<th width="8%">操作</th>
										</#if>
									</tr>
								</thead>
								<tbody>
								   <#if allPosition  ??>
									 <#list allPosition as p>
									  <tr>
										<input type='hidden' id="positionId" name="positionList[${p_index}].positionId" value='${p.positionId!""}'/>
									    <input type='hidden' id="currentPositionId" name="currentPositionId" value='${p.positionId!""}'/>
					                    <input type='hidden' id="workOrg.workOrgId" name="workOrg.workOrgId" value='${p.workOrg.workOrgId!""}'/>
										<td class="autocut">${p_index+1}</td>								
										<td class="autocut">
											<div class="span9">
												<input id="workName" <#if (workOrg?? && workOrg.status?? && workOrg.status.code=="SUBMIT")&&((!workOrg.processStatus??)||( workOrg.processStatus?? && workOrg.processStatus=="PASS"))>readOnly</#if> name='positionList[${p_index}].workName'  style="width:175px" type='text' value='${(p.workName)!""}' class='{required:true,minlength:1,maxlength:50}'/>	
											</div>
										</td>
								    	<td class="autocut">
								    		<div class="span9">
												<input id="workDesc" <#if (workOrg?? && workOrg.status?? && workOrg.status.code=="SUBMIT")&&((!workOrg.processStatus??)||( workOrg.processStatus?? && workOrg.processStatus=="PASS"))>readOnly</#if> name='positionList[${p_index}].workDesc' style="width:205px" type='text' value='${(p.workDesc)!""}' class='{required:false,minlength:1,maxlength:100}'/>	
											</div>
										</td>
										<td class="autocut">
											<div class="span9">
												<input id="workNumber" <#if (workOrg?? && workOrg.status?? && workOrg.status.code=="SUBMIT")&&((!workOrg.processStatus??)||( workOrg.processStatus?? && workOrg.processStatus=="PASS"))>readOnly</#if> name='positionList[${p_index}].workNumber' style="width:80px"  type='text' value='${(p.workNumber)!""}' class='{required:true,notZero:true,digits:true,minlength:1,maxlength:8}' />	
											</div>
										</td>
										<#if (workOrg?? && workOrg.status?? && workOrg.status.code=="SUBMIT")&&((!workOrg.processStatus??)||( workOrg.processStatus?? && workOrg.processStatus=="PASS"))>
										<#else>	 						
										<td>
											<a href='#' onclick='deleteRowKpi(this)' title="删除"><i class="icon-trash"></i></a>
										</td>
										</#if>
									 </tr>
								  </#list>	
								</#if>
							</tbody>
						</table>
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
					<#if (workOrg?? && workOrg.status?? && workOrg.status.code=="SUBMIT")&&((!workOrg.processStatus??)||( workOrg.processStatus?? && workOrg.processStatus=="PASS"))>
		            	<button class="btn" type="button" onclick="javascript:window.history.back(-1);">返回</button>
					<#else>
			 			<button class="btn btn-info" type="button" id="save-course" onclick="onSub('0')">保 存</button>
				    	<button class="btn btn-info" type="button" id="submit-button" onclick="onSub('1')">提 交</button>
				    	<#if workOrg??&&workOrg.workOrgId??&& workOrg.processStatus??&&workOrg.processStatus=="REJECT">
				    		<button class="btn btn-info" type="button" onclick="approve.showHis('${(workOrg.workOrgId)!""}');">审批历史</button>
		  				</#if>
		  				<button class="btn" type="button" onclick="javascript:window.history.back(-1);">取 消</button>
			 		</#if>
			    </div>
			</div>
			<input name="check_error" id="check_error" type="hidden" value="true"/>
		</div>
 	 </div>
  </div>
   <#include "/apw/instance/approvers.ftl"/>
 </div>
 <#-- 审核历史查看 -->
   <#include "/apw/instance/approveHistory.ftl">
<script>
	function isRepeatPosition(){
		var ary = []
		$("input[id^='workName']").each(
			function(i){
				ary.push($(this).val());
			}
		);
		var hash = {};
   		for(var i in ary) {
       		if(hash[ary[i]]){return true;}
			hash[ary[i]] = true;
			
    	}
   		return false;
	}
	//添加一行
	function addRow(){
		var $table=$("#smpl_tbl");
		var $num=$table.find("tr").length;
		var $i=$num-1;
		
        var tr="<tr><td class='autocut'>"+$num+"</td><td> <div > <input  style='width:160px' type='text' id='workName"+$num+"'  name='positionList["+$i+"].workName' class='{required:true,minlength:1,maxlength:50,messages:{required:\"名称不能为空\"}}'/> </div> </td>"
        +"<td class='autocut'> <div > <input  style='width:200px' type='text'  id='workDesc'+ name='positionList["+$i+"].workDesc' class='{required:false,minlength:1,maxlength:100}'/></div></td>"
        +"<td class='autocut' name='00'> <div> <input  style='width:100px' type='text'  id='workNumber"+$num+"' name='positionList["+$i+"].workNumber' class='{required:true,notZero:true,digits:true,minlength:1,maxlength:8,messages:{required:\"人数不能为空\"}}'/> </div> </td>"
        +"<td class='autocut'><a href='#' onclick='reTable($(this))' title='删除'><i class='icon-trash'></i></a></td></tr>"
        
		$table.append(tr);
		positionNumberCount();
		
	}
	 
   $("document").ready(function(){
   		positionNumberCount();
		//页面校验
		 $(".form_validation_reg").compValidate({
			rules:{     
					
					'schoolYear.id':{required:true},
					'term.id': {required:true},
					'applyReason':{required:false,minlength:1,maxlength:100}
				},
				messages:{
					
					'schoolYear.id':{required:'学年不能为空！'},
					'term.id':{required:'学期不能为空！'},
					'applyReason':{minlength:'申请理由的长度不能小于1',maxlength:'申请理由的长度不能大于100'}
			 }		
		 });
    });
	//删除行
   function deleteRowKpi(obj){
		 var row = obj.parentNode.parentNode; //A标签所在行
		 var tb = row.parentNode; //当前表格
		 var rowIndex = row.rowIndex-1; //A标签所在行下标
		 tb.deleteRow(rowIndex); //删除当前行
		 positionNumberCount();
	}
	function reTable($row){
		$row.parent().parent().remove();
		positionNumberCount();
	}
	function positionNumberCount(){
		
		var num=$("#smpl_tbl").find("tr").length-1;
		$('#workJobNumber').val(num);
		
	}
	
	  //判断数据是否为空
	function isEmpty(s){
	 return ((s==undefined || s==null || s=="" || s==0) ? true : false);
	}
		
	
	function onSub(stas){
		var check_error=$("#check_error").val();
		if(check_error == "true"){
		    $("#flags").val(stas);
			if($("#setWorkForm").valid()){
				  if(isRepeatPosition()){
					comp.message("岗位名称不能重复，请检查","error");
					return;
				  }
				  if(stas=="1"){
			        	 if(confirm("提交信息后不能修改，确认要提交吗？")) {
		                	var workOrgId=$("#workOrgId").val();
	                		$.ajax({
								url: "${rc.contextPath}/sponsor/setWorkApprove/opt-save/submitSetWork.do",
								async:false,
								cache:false,
								type:"POST",
								data:$('#setWorkForm').serialize(),
					    		success: function(id){
									if(!isEmpty(id)){
										$("#workOrgId").val(id);
										comp.message("岗位设置已经保存成功，选择下一个待办人后就会自动提交","info");
						       		    apw.selectNextApprover(id,"INIT","SPONSOR_SET_WORK_APPROVE",$("#approveReason").val());
						       			
						   	 		}else{
						    			$.sticky("岗位设置保存失败", {autoclose:5000, position:"top-right", type:"st-error"});
						    			return;
						    		}
								}
					 		});
		               }  
				   }else{
				   		mask.showShade();
		            	$("#setWorkForm").submit();
				  }
			 }
		 }else
		 {
		 	comp.message("当前学年学期已经存在部门岗位信息！","info");
		 	return;
		 }
	}
   /*
	 * 初始化当前发起流程【doInitAction方法名不可修改】
	 */
	function doInitAction(objectId,userId){
	    var url = "${rc.contextPath}/sponsor/setWorkApprove/opt-add/saveCurProcess.do";
		apw.initCurProcess(url,objectId,userId);
	}
    


	 /*
	  * 执行业务系统的操作
 	  */
	 function doAmsAction(userId,approveKey,approveStatus,processStatusCode,suggest){
	 	var workOrgId=$("#workOrgId").val()
		mask.showShade();
		window.location.href="${rc.contextPath}/sponsor/setWork/opt-update/addSubmitStatus.do?workOrgId="+workOrgId;
		
	 }
	
	$("document").ready(function(){
		$('.form_validation_reg').validate({
				onkeyup: false,
				errorClass: 'error',
				validClass: 'valid',
				focusCleanup:true,
				focusInvalid:false,
				highlight: function(element) {
					$(element).closest('div').addClass("f_error");
				},
				unhighlight: function(element) {
					$(element).closest('div').removeClass("f_error");
				},
                errorPlacement: function(error, element) {
                    $(element).closest('div').append(error);
                }
        });
       //验证不等于0
        jQuery.validator.addMethod("notZero",function(value,element){
	  		if(value != "" && value=="0"){
	     		 return false;
	   		}else{
	      		return true;
	   		}
	  		return false;
		},"不能等于0");
		
		
         //验证是否输入的是否最多只有一位小数
		jQuery.validator.addMethod("floatCheck",function(value,element){
	  		if(value != ""){
	      		var patrn = /^(?:[1-9]\d{0,8}(?:\.\d{1})?)$/;
	     		 return patrn.exec(value);
	   		}else{
	      		return true;
	   		}
	  		return false;
		},"请输入不小于等于0的有效数字(正整数部分不能超过8位，小数点后最多保留一位小数).");
		
	
		
		 //验证是否输入的是大于0小于等于24，并且只有一位小数
		jQuery.validator.addMethod("workTimeCheck",function(value,element){
	  		if(value != ""){
	      		
	      		var patrn=/^(0\.[1-9]|[0-9](\.\d)?|1\d(\.\d)?|2[0-3](\.\d{1})?|24)$/
	     		 return patrn.exec(value);
	   		}else{
	      		return true;
	   		}
	  		return false;
		},"请输入0至24之间的有效数字，且只有一位小数");
        
        if($('#errorText').val()!=""){
        	$.sticky($('#errorText').val(), {autoclose : 5000, position: "top-right", type: "st-error" });
        }
	});
				
	
	function changeTerm()
	{
	   var termId=$("#term").find("option:selected").val();
	   var yearId=$("#schoolYear").find("option:selected").val();
	   var orgId = $("#orgId").val();
	   if(termId!="" && yearId!="" && orgId!="") // 不为空的时候去后台校验
	   {
	   		 $.ajax({
				url:'${rc.contextPath}/sponsor/setWork/opt-query/isExisWorkOrg.do',
				async:false,
				cache: false,
				type: "POST",
				data:{termId : termId,yearId : yearId,orgId : orgId },
				success: function(data){
			 		if(data){
			 			$("#check_error").val("false");
				 		comp.message("当前学年学期已经存在部门岗位信息！","info");
				 	}else
				 	{
				 		$("#check_error").val("true");
				 	}
			    }
			});
	   }
    }
				
	/** 原方法备份
	function changeTerm()
	{
	   var termId=$("#term").find("option:selected").val();
	   var yearId=$("#schoolYear").find("option:selected").val();
	   var orgId = $("#orgId").val();
	   if(termId!="" && yearId!="" && orgId!="") // 不为空的时候去后台校验
	   {
	   		 $.ajax({
				url:'${rc.contextPath}/sponsor/setWork/opt-query/isExisWorkOrg.do',
				async:false,
				cache: false,
				type: "POST",
				data:{termId : termId,yearId : yearId,orgId : orgId },
				success: function(data){
				 if(data)
				 	window.location.href="${rc.contextPath}/sponsor/setWork/opt-update/editSetWork.do?workOrgId="+data;
			 	else
			 		window.location.href="${rc.contextPath}/sponsor/setWork/opt-add/editSetWork.do?yearId="+yearId+"&termId="+termId;
			    }
			});
	   }
    }
    **/
    
	jQuery.extend(jQuery.validator.messages, {
	  digits:'请输入一个正整数',
	  maxlength: jQuery.validator.format("最大长度为{0}位"),
	  minlength: jQuery.validator.format("最小长度为 {0}位")
	  
	 
	});
</script>
</body>
</html>
