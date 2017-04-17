<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="${rc.contextPath}/js/jquery.form.js"></script>
    <script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
    <script>
     function eisdResponse() {
		var fromId = "evaluationListForm";
		var pageNo = $("#"+fromId+"pageTagFormIdpageNo").val();
		var id = $("#id").val();
		var param = {pageNo:pageNo,studentId:id};
		$("#studentInfo_evaluation").load("${rc.contextPath}/student/info/nsm/loadStuEvalList.do",param,function(){});
	}
	function edit(){
		window.location.href="${rc.contextPath}/student/selfinfo/opt-edit/editStudentInfo.do";
	}
	</script>
</head>
<body>
<div id="contentwrapper">
    <div class="main_content"> 
      <#if studentInfo??>
		<div class="tabbable ">
			<ul class="nav nav-tabs">
				<li class="active"><a href="#studentInfo" id="studentInfo_tab" data-toggle="tab">基本信息</a></li>
				<li><a href="#studentInfo_guardian" id="studentInfo_guardian_tab" data-toggle="tab">监护人信息</a></li>
				<li><a href="#studentInfo_class" id="studentInfo_class_tab" data-toggle="tab">班级信息</a></li>
				<li><a href="#studentInfo_stay" id="studentInfo_stay_tab" data-toggle="tab" >住宿信息</a></li>
				<li><a href="#studentInfo_rewards"  id="studentInfo_rewards_tab" data-toggle="tab">奖惩信息</a></li>
				<#--<li><a href="#studentInfo_payment"  id="studentInfo_payment_tab" data-toggle="tab">缴费信息</a></li>-->
				<li><a href="#studentInfo_evaluation"  id="studentInfo_evaluation_tab" data-toggle="tab">综合素质测评</a></li>
				<#--<li><a href="#studentInfo_consumption"  id="studentInfo_consumption_tab" data-toggle="tab">一卡通信息</a></li>-->
				<li><a href="#studentInfo_association"   id="studentInfo_association_tab" data-toggle="tab">社团信息</a></li>
				<li><a href="#studentInfo_difficultStudent"   id="studentInfo_difficultStudent_tab" data-toggle="tab">困难生信息</a></li>
				
				<a target="_blank" href="${(webUrl.value)!''}" style="padding-left:80px;font-weight:bold">杭科院心理健康教育中心</a>
			</ul>
			<div class="tab-content">
			<input name="errorText" id="errorText" type="hidden" value="${errorText!""}"/>
			<input id="id" type="hidden" name="id"  value="${(studentInfo.id)!""}">     
			<!-- 学生基本信息-->
			<div class="tab-pane active" id="studentInfo">
				<#if studentUpdateInfo?? >
				     <#include "/integrate/student/studentInfo/studentInfo.ftl">
				<#else>
				     <#include "/integrate/student/studentInfo/studentInfoOld.ftl">
				</#if>
			</div>
			<!-- 学生监护人信息-->
			<div class="tab-pane" id="studentInfo_guardian">
                <#include "/integrate/student/studentInfo/studentguardian.ftl">
			</div>
			<!-- 学生所在班级信息-->
			<div class="tab-pane" id="studentInfo_class">
				<#if studentUpdateInfo?? >
                    <#include "/integrate/student/studentInfo/studentInfoClass.ftl">
                <#else>
				     <#include "/integrate/student/studentInfo/studentInfoClassOld.ftl">
				</#if>
			</div>	
			<!-- 住宿信息-->
			<div class="tab-pane" id="studentInfo_stay">
					 <#include "/integrate/student/studentInfo/studentInfoStay.ftl"> 			
			</div>
			<!-- 奖惩信息-->
			<div class="tab-pane" id="studentInfo_rewards">
                    <#include "/integrate/student/studentInfo/studentInfoRaword.ftl"> 		
			</div>
			<#--缴费信息信息
			<div class="tab-pane" id="studentInfo_payment">
                    <#include "/integrate/student/studentInfo/studentInfoPayment.ftl"> 			
			</div>
			-->
			<!--综合测评信息-->
			<div class="tab-pane" id="studentInfo_evaluation">
                    <#include "/integrate/student/studentInfo/studentInfoEvaluation.ftl"> 			
			</div>
			<#-- 一卡通信息
			<div class="tab-pane" id="studentInfo_consumption">
                    <#include "/integrate/student/studentInfo/studentInfoConsumption.ftl"> 			
			</div>
			-->
			<#--社团信息  -->		
			<div class="tab-pane" id="studentInfo_association">
		        <#include "/integrate/student/studentInfo/studentInfoAssociation.ftl">
			</div>
			<#--贫困生信息  -->		
			<div class="tab-pane" id="studentInfo_difficultStudent">
		        <#include "/integrate/student/studentInfo/studentInfoDifficultStudent.ftl">
			</div>
		</div>
	   </div>
		<#else>
		     <#include "/common/common/commonMessage.ftl">
		</#if>
		</div>
		</div>
</body>
</html>