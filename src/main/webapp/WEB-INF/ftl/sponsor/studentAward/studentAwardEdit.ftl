<html>
 <head>
        <meta charset="utf-8"/>
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
		<!-- multiselect -->
		<script type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
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
				<#if studentAward?? && studentAward.id??>
					困难生奖助修改
				<#else>
					困难生奖助申请
				</#if>
		   </h3>
		  </div>
		 </div> 
		 <input name="errorText" id="errorText" type="hidden" value="${errorText!""}"/>
				<#if studentAward.id?? >
					<form  id="studentAwardForm" class="form_validation_reg" action="${rc.contextPath}/sponsor/studentAward/opt-update/saveDifficultStudentAward.do" method="post">
				<#else>
					<form  id="studentAwardForm" class="form_validation_reg" action="${rc.contextPath}/sponsor/studentAward/opt-save/saveDifficultStudentAward.do" method="post"><@token/>
				</#if><@token/>
		   <input id="id" type="hidden" name="id"  value="${(studentAward.id)!""}">
		   <input id="difficultStudentId" type="hidden" name="difficultStudentInfo.id"  value="${(difficultStudentInfo.id)!''}">
		   <input id="flags" type="hidden" name="flags"  value="${(flags)!""}">
			 <div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>姓名<span class="f_req">*</span></label>
						</div>
						<div class="span9">
							<input id="student.name" name="student.name" readOnly <#if difficultStudentInfo?? && difficultStudentInfo.student??> value="${(difficultStudentInfo.student.name!"")?html}" </#if>/>
						</div>
					</div>
						
					<div class="span6">
						<div class="span3">
							<label>性别<span class="f_req"></span></label>
						</div>
						<div class="span9">
						 <#if genderList??>
							<#list genderList as a>
				    			<#if difficultStudentInfo?? && difficultStudentInfo.student?? && difficultStudentInfo.student.genderDic?? && difficultStudentInfo.student.genderDic.id==a.id >
    				    				<label class="radio inline">
											<input type="radio" id="sexId" name="genderDic.name" disabled checked="checked" value="${a.id}" />${a.name?html}
										</label>
    				    			
				    			<#else>
				    				<label class="radio inline">
										<input type="radio" id="sexId" name="genderDic.name" disabled  value="${a.id}" />${a.name?html}
									</label>
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
							<label>民族<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="national" name="national" readOnly <#if difficultStudentInfo?? && difficultStudentInfo.student??> value="${(difficultStudentInfo.student.national!"")?html}" </#if>/>
						</div>
					</div>
						
					<div class="span6">
						<div class="span3">
							<label>身份证号<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="certificateCode" name="certificateCode" readOnly <#if difficultStudentInfo?? && difficultStudentInfo.student??>  value="${((difficultStudentInfo.student.certificateCode)!"")?html}"</#if>/>
						</div>
					 </div>
				  </div>
			   </div>
			   
			   <div class="formSep"> 
			   <div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>学院<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="college" name="college.name" readOnly <#if difficultStudentInfo?? && difficultStudentInfo.student?? && difficultStudentInfo.student.college??> value="${(difficultStudentInfo.student.college.name!"")?html}" </#if>/>
						</div>
					</div>
						
					<div class="span6">
						<div class="span3">
							<label>班级<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="className" name="classId.className" readOnly <#if difficultStudentInfo?? && difficultStudentInfo.student?? && difficultStudentInfo.student.classId??>  value="${(difficultStudentInfo.student.classId.className!"")?html}"</#if>/>
						</div>
					 </div>
				  </div>
			   </div>
			   
			  <div class="formSep"> 
			   <div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>学号<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="stuNumber" name="stuNumber" readOnly <#if difficultStudentInfo?? && difficultStudentInfo.student??> value="${((difficultStudentInfo.student.stuNumber)!"")?html}" </#if>/>
						</div>
					</div>
						
					<div class="span6">
						<div class="span3">
							<label>政治面貌<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="politicalDic" name="politicalDic.name" readOnly <#if difficultStudentInfo?? && difficultStudentInfo.student?? && difficultStudentInfo.student.politicalDic??>  value="${((difficultStudentInfo.student.politicalDic.name)!"")?html}"</#if>/>
						</div>
					 </div>
				  </div>
			   </div>
			   
			   <div class="formSep"> 
			   <div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>出生年月<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="brithDate" name="brithDate" readOnly <#if difficultStudentInfo?? && difficultStudentInfo.student?? && difficultStudentInfo.student.brithDate??> value="${(difficultStudentInfo.student.brithDate!"")?string("yyyy-MM-dd")}"</#if>/>
						</div>
					</div>
						
					<div class="span6">
						<div class="span3">
							<label>联系方式<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="phone1" name="phone1" readOnly <#if difficultStudentInfo?? && difficultStudentInfo.student?? && difficultStudentInfo.student.phone1??>  value="${((difficultStudentInfo.student.phone1)!"")?html}"</#if>/>
						</div>
					 </div>
				  </div>
			   </div>
			   
			    <div class="formSep">
				 <div class="row-fluid">
				   <div class="span6">
					  <div class="span3">
						  <label>学年<span class="f_req">*</span></label>
						</div>
						<div class="span9">
						   <select disabled="disabled" size="1" id="schoolYear" name="schoolYear.id" aria-controls="dt_gal" >
							  <option value="" />请选择..</option>
								<#if yearList ??>
									<#list yearList as d>
										<#if studentAward?? && studentAward.schoolYear ?? && studentAward.schoolYear.id==d.id >
											     <option  value="${d.id}" selected="selected" />${d.name?html}</option>
										<#elseif nowYearDic?? && d.id==nowYearDic.id>
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
							<label>家庭经济情况<span class="f_req">*</span></label>
						</div>
						<div class="span9">
						    <select size="1" id="familyFinance" name="familyFinance.id" aria-controls="dt_gal">
							  <option value="" />请选择..</option>
								<#if financeList ??>
									<#list financeList as d>
										<#if studentAward?? && studentAward.familyFinance ?? && studentAward.familyFinance.id==d.id >
											<option  value="${d.id}" selected="selected" />${d.name?html}</option>
										<#else>
											<option value="${d.id}" />${d.name?html}</option>
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
						  <label>奖助类型<span class="f_req">*</span></label>
						</div>
						<div class="span9">
						   <select size="1" id="awardType" name="awardType.id" aria-controls="dt_gal" onchange="onChangeType()">
						     <option value="" />请选择..</option>
							   <#if awardList ??>
									<#list awardList as d>
										<#if studentAward?? && studentAward.awardType ?? && studentAward.awardType.id==d.id >
											<option  value="${d.id}" selected="selected" />${d.name?html}</option>
										<#else>
											<option value="${d.id}"/>${d.name?html}</option>
										</#if>
									</#list>
								</#if>
						    </select>
					     </div>
					  </div>
				    </div>
				  </div>
				  
			  	<!--各个奖项填写的内容 -->
			  	<div id="awardTypeContent">
			  	  <#if studentAward?? && studentAward.awardType ?? >
			  	   <#if inspirationDic.id == studentAward.awardType.id>
			  			<#include "inspirationalAward.ftl">
			  	   <#elseif aidGrantDic.id == studentAward.awardType.id>
			  		    <#include "aidGrant.ftl">
			  	   <#elseif jobGrantDic.id == studentAward.awardType.id> 
			  	        <#include "jobGrant.ftl">
			  	   <#elseif schoolLoanDic.id == studentAward.awardType.id> 
			  	        <#include "schoolLoan.ftl">
			  	   <#elseif tuitionDic.id == studentAward.awardType.id>  
			  	        <#include "tuitionWaiver.ftl">
			  	   <#else>   
			  	        <#include "otherAward.ftl">
			  	   </#if>
	  			</#if>
			  </div>	  
				 	 
			   
			  <div class="formSep">
				<div class="row-fluid">
				  <div class="span6">
					<div class="span3">
						<label>家庭成员情况<span class="f_req">*</span></label>
					 </div>
					  <div class="span9">
						<#if studentAward?? && studentAward.familyCondition??>
						    <textarea rows="5" cols="12" id="familyCondition" name="familyCondition" class="span6 tipTag" data="1.家庭成员情况(年龄，学习工作情况，身体状况等)&lt;br/&gt;2.家庭经济来源&lt;br/&gt;3.其他情况" style="width: 785px; height: 134px;">${(studentAward.familyCondition!"")}</textarea>
						<#else>
						    <textarea rows="5" cols="12" id="familyCondition" name="familyCondition" class="span6 tipTag" data="1.家庭成员情况(年龄，学习工作情况，身体状况等)&lt;br/&gt;2.家庭经济来源&lt;br/&gt;3.其他情况" style="width: 785px; height: 134px;"></textarea>
						</#if>	
					</div>
				  </div>
				 </div>
				</div>
				
			  <div class="formSep">
				<div class="row-fluid">
				  <div class="span6">
					<div class="span3">
						<label>申请理由<span class="f_req">*</span></label>
					 </div>
					  <div class="span9">
						<#if studentAward?? && studentAward.applyReason??>
						    <textarea rows="5" cols="12" id="applyReason" name="applyReason" style="width: 775px; height: 134px;">${(studentAward.applyReason!"")}</textarea>
						<#else>
						    <textarea rows="5" cols="12" id="applyReason" name="applyReason" style="width: 775px; height: 134px;"></textarea>
						</#if>	
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
				    <button class="btn btn-info" type="button" id="submit-button" onclick="onSub('1')">提 交</button>
				    <#if studentAward?? && studentAward.processStatus?? && studentAward.processStatus="REJECT">
				    <button class="btn btn-info" type="button" onclick="approve.showHis('${studentAward.id}');">审批历史</button>
				    </#if>
		  			<button class="btn" type="button" onclick="javascript:window.history.back(-1);">取 消</button>
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
	
	
	//选择不一样的奖助类型，填写的内容不一样
	function onChangeType(){
		  var awardId = $('#id').val();
		  var awardType = $('#awardType').val();
		  var awardType=$("#awardType").find("option:selected").val();
	      $("#awardTypeContent").load("${rc.contextPath}/sponsor/studentAward/nsm/studentAwardView.do?awardId="+awardId+"&awardType="+awardType);
	}
   

     //判断数据是否为空
	function isEmpty(s){
	 return ((s==undefined || s==null || s=="") ? true : false);
	}
	
	var attachFlag;
	$("document").ready(function(){
		var data={id:'${(studentAward.id)!""}',difficultStudentId:function(){return $("#difficultStudentId").val();},schoolYear:function(){return $("#schoolYear").val();},awardType:function(){return $("#awardType").val();}};
		comp.validate.addRemote("awardTypeCheck","${rc.contextPath}/sponsor/studentAward/opt-query/awardTypeCheck.do",data,"同一学年只能申请一次相同的奖助类型");		
		//页面校验
		 attachFlag = $(".form_validation_reg").compValidate({
			rules:{     
					'schoolYear.id': {required:true},
					 'awardType.id': {required:true,awardTypeCheck:true},
				 'familyFinance.id': {required:true},
				 'difficultType.id': {required:true},
				      'aidLevel.id': {required:true},
		    'isNationalAidAward.id': {required:true},
		            'isExamFail.id': {required:true},
		             'awardKind.id': {required:true},
		             'nationalInspirationalAward.id': {required:true},
		             'xingZhiAward.id': {required:true},
		             'iSEvaluateMidel.id': {required:true},
		             parentOpinion: {required:true,minlength:1,maxlength:500},
		             teacherOpinion: {required:true,minlength:1,maxlength:500},
				       'returnTime': {required:true},
				       employeeDesc: {required:true,minlength:1,maxlength:500},
				         applyMoney: {required:true,floatCheck:true,minlength:1,maxlength:10},
				   applyReduceMoney: {required:true,floatCheck:true,minlength:1,maxlength:10},
					familyCondition: {required:true,minlength:1,maxlength:500},
					applyReason: {required:true,minlength:1,maxlength:500}
				
				},
				messages:{
					'schoolYear.id':{required:'学年不能为空'},
					 'awardType.id':{required:'奖助类型不能为空'},
				 'difficultType.id':{required:'困难类型不能为空'},
				       'returnTime':{required:'还款日期不能为空'},
				 'familyFinance.id':{required:'经济情况不能为空！'},
				      'aidLevel.id':{required:'助学金等级不能为空！'},
				     'awardKind.id':{required:'获奖类型不能为空！'},
	        'isNationalAidAward.id':{required:'请选择是否获得本学年国家助学金！'},
	                'isExamFail.id':{required:'请选择是否存在上学年补考不及格科目！'},
	                'nationalInspirationalAward.id':{required:'请选择是否获得上学年奖学金！'},
	                'xingZhiAward.id':{required:'请选择是否获得上学年行知奖学金！'},
	                'iSEvaluateMidel.id':{required:'请选择上学年综合素质测评是否处于班级中等或以上水平！'},
				       employeeDesc:{required:'就业去向不能为空！',maxlength:'就业去向长度不能超过500位'},
				       parentOpinion:{required:'家长意见不能为空！',maxlength:'家长意见长度不能超过500位'},
				       teacherOpinion:{required:'班主任意见不能为空！',maxlength:'班主任意见长度不能超过500位'},
				         applyMoney:{required:'申请金额不能为空！',maxlength:'申请金额长度不能超过10位'},
				   applyReduceMoney:{required:'减免金额不能为空！',maxlength:'减免金额长度不能超过10位'},
					familyCondition:{required:'家庭成员情况不能为空！',maxlength:'家庭成员情况长度不能超过500位'},
					    applyReason:{required:'申请理由不能为空！',maxlength:'申请理由长度不能超过500位'}
				}
		 });
	});
	
	
	//验证是否输入的是小数
	jQuery.validator.addMethod("floatCheck",function(value,element){
	   if(value != ""){
	      var patrn = /^(?:[1-9]\d{0,8}(?:\.\d{2})?|0\.\d{2})$/;
	      return patrn.exec(value);
	   }else{
	      return true;
	   }
	  return false;
	},"请输入不小于等于0的有效数字(正整数部分不能超过6位，小数点后保留两位小数).");
	
	
	
	
		//保存方法 
	 	 function onSub(stas){
	 	    if(attachFlag.form()==false){
	 		    return false;
	 		 }
	 		var check_error=$("#check_error").val();
	 		 $("#flags").val(stas);
			  if(check_error == "true"){
		          if(stas=="1"){
					    if(!confirm("提交信息后不能修改，确认要提交吗？"))
			               return;
			               if(!isEmpty($("#id").val())){
	                  	       apw.selectNextApprover($("#id").val(),"INIT","SPONSOR_DIFFICULT_STUDENT_APPROVE",$("#approveReason").val());
	                  	   }else{
				               $.ajax({
								url: "${rc.contextPath}/common/config/nsm/getUuid.do",
								async:false,
								cache:false,
								type:"POST",
							    success: function(id){
									if(!isEmpty(id)){
									  $("#id").val(id);
							           apw.selectNextApprover(id,"INIT","SPONSOR_DIFFICULT_STUDENT_APPROVE",$("#approveReason").val());
								    }else{
								    	$.sticky("困难生奖助信息保存失败", {autoclose:5000, position:"top-right", type:"st-error"});
								    	return;
								    }
								}
							 });
						  }	   
			        }else{
					  	$('#studentAwardForm').submit();
				}
			}
        }
        
        
        
        
        
        /*
		 * 初始化当前发起流程【doInitAction方法名不可修改】
		 */
		function doInitAction(objectId,userId){
		    var url = "${rc.contextPath}/sponsor/studentAward/opt-add/saveCurProcess.do";
			apw.initCurProcess(url,objectId,userId);
		}
		
	
        
        
         /*
         * 执行业务系统的操作
         */
        function doAmsAction(userId,approveKey,approveStatus,processStatusCode,suggest){
            $('#studentAwardForm').submit();
		  // window.location.href="${rc.contextPath}/sponsor/studentAward/opt-query/queryStudentAwardList.do";	
        }

	
	 </script>
</body>
</html>
