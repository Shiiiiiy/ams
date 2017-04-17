<!DOCTYPE html>
<html>
<title>新生注册</title>
<head>
	<!-- ajax form-->
	<script src="${rc.contextPath}/js/jquery.form.js"></script>
	
	<!--date-->
	<script language="javascript" type="text/javascript"
		src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
	
	<!-- multiselect -->
	<link rel="stylesheet"
		href="${rc.contextPath}/lib/multiselect/css/multi-select.css" />
	<script
		src="${rc.contextPath}/lib/multiselect/js/jquery.multi-select.min.js"></script>
	<!--javascript start-->
	
	<!--validata-->
	<script src="${rc.contextPath}/js/jquery.metadata.js"></script>
	<script src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script>
	<script src="${rc.contextPath}/js/myjs_message_cn.js"></script>
	<script src="${rc.contextPath}/js/educommon/educommon.js"></script>
	<script src="${rc.contextPath}/js/educommon/educommon_validate.js"></script>
	
	<!-- chosen -->
	<script src="${rc.contextPath}/lib/chosen/chosen.jquery.js"></script>
	<link rel="stylesheet"
		href="${rc.contextPath}/lib/chosen/chosen.css" />
	
	<!-- sticky messages -->
	<script src="${rc.contextPath}/lib/sticky/sticky.min.js"></script>
	
	<!-- animated progressbars -->
	<script src="${rc.contextPath}/js/bdp_fileupload.progressbar.js"></script>
	
	<!-- bootstrap-fileupload -->
	<link rel="stylesheet"
		href="${rc.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.min.css" />
		
	<!--  新生信息采集-->
	<link href="${rc.contextPath}/css/style_new_student.css" rel="stylesheet" type="text/css" />
	
	<!--遮罩层-->
		<link rel="stylesheet" href="${rc.contextPath}/css/waiting.css" />
		<script src="${rc.contextPath}/js/common/mask.js"></script>
		
	<style>
		.img-polaroid{padding:4px;background-color:#fff;border:1px solid #ccc;border:1px solid rgba(0,0,0,0.2);-webkit-box-shadow:0 1px 3px rgba(0,0,0,0.1);-moz-box-shadow:0 1px 3px rgba(0,0,0,0.1);box-shadow:0 1px 3px rgba(0,0,0,0.1)}
	</style>
	
	<script>
		//初始化
		$("document").ready(function() {
			$("#editStudentReportForm").compValidate();
			//判断如果采集状态是提交状态，则改为可读
			if('${(report.status)!''}'=='1' ){
				//$("#editStudentReportForm input").attr("disabled",true);
				//$("#editStudentReportForm select").attr("disabled",true);
			}
			
			//判断当前时间是否在学校设定的范围内
			if('${(isScope)!''}'!='1' ){
				comp.message('${(isScope)!''}',"error");
				
				$("#editStudentReportForm input").attr("disabled",true);
				$("#editStudentReportForm select").attr("disabled",true);
				
			}else{
				if('${(report.status)!''}'=='1' ){
				
					comp.message("您的信息已经提交了,在开放时间内还可以进行修改,修改后点击'上一页'、'保存'或'下一页'按钮都可以！","info");
				}
			
			}
			
			//判断是否报到
			if('${(report.isReport)!''}'=='0' ){
				//不报到则原因是必填出现红星
				$('#reasonRed').text("*");
			}
			
			//判断是否自驾
			if('${(report.rideWayDic.name)!''}'!='自驾' ){
			
				//站点是必填出现红星
				$('#siteDicRed').text("*");
				
				//预计车次是必填出现红星
				$('#trainNumberRed').text("*");
			}
			
		});
		
		//保存提交处理
		function submitSave(type){
		
			//处理的方式(上一页、下一页、保存)
			$('#type').val(type);
			
			//预报到时间
			var timeVal=""; 
			
			//不用保存直接跳转到上一页upGo
			if(type =="upGo"){
				window.location.href="${rc.contextPath}/newstudent/register/editNewStudentInfo.do";
				
				return;
			}
			
			//不用保存直接跳转到下一页upGo
			if(type =="nextGo"){
				window.location.href="${rc.contextPath}/newstudent/register/answerQuestion.do";
				return;
			}
			
			
			if((type =="save" || type =="up") && '${(report.status)!''}'!='1' ){
			
				//不报到原因验证取消
				//$('#reason').attr("class","inp1 cancel");
				
				//预计报到时间验证取消
				$('#reportDate').attr("class","inp1 cancel");
				
				//预计到达站点验证取消
				//$('#siteDic').attr("class","select1 cancel");
				
				//随行人数验证取消
				$('#together').attr("class","inp1 cancel");
				
				//预计乘车方式验证取消
				$('#rideWayDic').attr("class","select1 cancel");
				
				//到达车次验证取消
				//$('#trainNumber').attr("class","inp1 cancel");
				
			}else{
			
				//是否报到
				var isReportVal = $('input[name="isReport"]:checked ').val();
				
				//不报到的原因
				var reasonVal = $.trim($('#reason').val());
				
				//返回的提示信息
				var messageVal='';
					
				//if(isReportVal =="1"){
				if(isReportVal=="1"){
				
				
				
				 	timeVal = $.trim($('#reportDate').val());
				
					if(timeVal==""){
						messageVal ="true";
						comp.message("因为选择了报到，预报到时间不能为空！！","error");
					}
				
					
				
					if(reasonVal=="" && reasonVal!=""){
						messageVal ="true";
						comp.message("因为选择了报到，则不报到的原因应该是空！","error");
					}
				
					if(isReportVal=="1" && reasonVal!=""){
						messageVal ="true";
						comp.message("因为选择了报到，则不报到的原因应该是空！","error");
					}
				
					if(isReportVal=="0" && reasonVal==""){
						messageVal = "true";
						comp.message("因为选择了不报到，则不报到的原因不能为空！","error");
					}
				
					//预计乘车方式
					//var rideWayDic = $('#rideWayDic').html();
					var rideWayDicVal = $('#rideWayDic').find("option:selected").text();
				
					//
					if(rideWayDicVal =='请选择...'){
						messageVal = "true";
						comp.message("预计乘车方式不能为空！！","error");
				
					}else{
						if(rideWayDicVal !='自驾'){
				
							//预计到达的站点
							var siteVal = $.trim($('#siteDic').val());
					
							if(siteVal ==""){
								messageVal = "true";
								comp.message("因为选择了不是自驾，则预计到达的站点不能为空！","error");
							}
					
							//到达车次
							var trainNumberVal = $.trim($('#trainNumber').val());
							//alert(trainNumberVal);
							if(trainNumberVal ==""){
								messageVal = "true";
								comp.message("因为选择了不是自驾，则到达车次不能为空！","error");
							}
				
						}
					}
				
				}else{
				
					//随行人数验证取消
					$('#together').attr("class","inp1 cancel");
						
							if(isReportVal=="0" && reasonVal==""){
								messageVal = "true";
								comp.message("因为选择了不报到，则不报到的原因不能为空！","error");
							}
				
				
				}
				
				
				if(messageVal !=""){
				
					return;
				}
				
				
			}
			
			
			//寝具包的判断
		  	//$('#bed-No').attr('checked','checked');
		  
		  	//迁户口
		  	//$('#move-no').attr('checked','checked');
		  
		  	//遮罩
			mask.showShade();
			
			//from 提交
			$('#editStudentReportForm').submit();
			
			//避免重提交使按钮不可用
			//保存
			$('#save').attr("disabled",true);
			//上一页
			$('#last').attr("disabled",true);
			//下一页
			$('#next').attr("disabled",true);
			
			//window.location.href="${rc.contextPath}/newstudent/register/editGuardian.do";
		}
		
		//是否报到改变状态处理
		function isReportRadio(state){
			//选择是
			if(state =='1'){
				//不报到原因验证取消
				$('#reasonRed').text("");
				
				$("#reason").val("");
				
				$("#isReportDiv").attr("class","info");
				
				$("#isReportSpan").attr("style","display:none;");
				$("#reason").attr("style","margin-top:8px;margin-bottom:5px;display:none;");
				
				$("#editStudentReportForm select").attr("disabled",false);
				
				//预计车次是必填出现红星
				$('#trainNumberRed').text("*");
				
				//预计车次是必填出现红星
				$('#siteDicRed').text("*");
				
				
				//乘车方式是必填出现红星
				$('#rideWayDicRed').text("*");
				
				//乘车方式是必填出现红星
				$('#reportDateRed').text("*");
				
				
				//清空隐藏掉、
				$("#editStudentReportForm select").attr("disabled",false);
				
				$("#reportDate").attr("disabled",false);
				$("#siteDic").attr("disabled",false);
				
				$("#together").val("");
				$("#siteDicRed").val("");
				$("#siteDic").attr("disabled",false);
				
				$("#together").attr("disabled",false);
				
				//随行人员取得星号
				$('#togetherRed').text("*");
				
			}else{
				//不报到原因验证取消
				$('#reasonRed').text("*");
				$("#isReportDiv").attr("class","");
				$("#isReportSpan").attr("style","");
				$("#reason").attr("style","margin-top:8px;margin-bottom:5px;");
				
				
				//
				$("#rideWayDic").val("");
				
				$("#reportDate").val("");
				
				$("#rideWayDic").val("");
				
				$("#rideWayDic").val("");
				
				$('#siteDicRed').text("*");
				
				$("#trainNumber").val("");
				
				//随行人员取得星号
				$('#togetherRed').text("");
				
				
				$("#siteDic").val("");
				
				//清空隐藏掉、
				$("#editStudentReportForm select").attr("disabled",true);
				
				$("#reportDate").attr("disabled",true);
				$("#siteDic").attr("disabled",true);
				
				$("#together").val("");
				$("#siteDicRed").val("");
				$("#siteDic").attr("disabled",true);
				
				$("#together01").attr("disabled",true);
				
				//预计车次是必填出现红星
				$('#trainNumberRed').text("");
				
				//预计车次是必填出现红星
				$('#siteDicRed').text("");
				
				
				//乘车方式是必填出现红星
				$('#rideWayDicRed').text("");
				
				//乘车方式是必填出现红星
				$('#reportDateRed').text("");
				
				
				//迁户口
				isMove("0");
				//寝具包
				isBed("0")
				
				
				
			}
		}
		
		//改变乘车方式的处理
		function rideWayChange(){
			//取得乘车方式
			var rideWayDicVal = $('#rideWayDic').find("option:selected").text();
				
			if(rideWayDicVal !='自驾'){
				//站点是必填出现红星
				$('#siteDicRed').text("*");
				
				//预计车次是必填出现红星
				$('#trainNumberRed').text("*");
			}else{
				//站点是必填出现红星
				$('#siteDicRed').text("");
				
				//预计车次是必填出现红星
				$('#trainNumberRed').text("");
			
			}
		}
		 
		  //是否报到改变状态处理
		function isMove(state){
			//选择是
			if(state =='1'){
				//不报到原因验证取消
				//$('#reasonRed').text("");
				$("#move").attr("style","");
			}else{
				//不报到原因验证取消
				//$('#reasonRed').text("*");
				$("#move").attr("style","display:none;");
			}
		}
		
		 //是否需要空调改变状态处理
		function isAirCond(state){
			//选择是
			if(state =='1'){
				
				$("#airCondCommDiv").attr("style","height:80px;");
			}else{
				
				$("#airCondCommDiv").attr("style","height:80px;display:none;");
			}
		}
		
		//是否需要寝具包改变状态处理
		function isBed(state){
			//选择是
			if(state =='1'){
				
				$("#bedCommDiv").attr("style","height:80px;");
			}else{
				
				$("#bedCommDiv").attr("style","height:80px;display:none;");
			}
		}
		 
		 //是否迁户口改变状态处理
		function isMove(state){
			//选择是
			if(state =='1'){
				//不报到原因验证取消
				//$('#reasonRed').text("");
				$("#move").attr("style","");
			}else{
				//不报到原因验证取消
				//$('#reasonRed').text("*");
				$("#move").attr("style","display:none;");
			}
		}
	</script>
</head>
<body>
<#include "/decorators/mask.ftl">
	<div id="contentwrapper">
		<div class="main_content">
			<div class="wrapper">
    <h2 class="tit_ins">新生信息采集-报到信息</h2>
    
    <div class="text_ins wid">
    <input name="errorText" id="errorText" type="hidden" value="${errorText!" "}"/>
    <form id="editStudentReportForm" class="form_validation_reg" action="${rc.contextPath}/newstudent/register/saveNewReport.do" method="post">
				
				<input id="type" type="hidden" name="type"/>
				<#if report ?? && report.id?? >
					<input id="id" type="hidden" name="id" value="${(report.id)!""}"/>
				<#else>
					<input id="id" type="hidden" name="id" value=""/>
				</#if>
				
    	<div class="infoL">
        	<div class="info">
        	<span class="q1">是否报到  </span>
        	<#if report?? && report.isReport?? && report.isReport=='1'  >
				<input type="radio" value="1" name="isReport" checked="checked" class="" onclick='isReportRadio(1)' />&nbsp;是&nbsp;&nbsp;&nbsp;&nbsp; 
				<input type="radio" value="0" name="isReport"	class="" onclick='isReportRadio(0)' />&nbsp;否 
			<#else>					
				<input type="radio" value="1" name="isReport"  class="" onclick='isReportRadio(1)'/>&nbsp;是&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="radio" value="0" name="isReport" checked="checked"	class="" onclick='isReportRadio(0)'/>&nbsp;否 
			</#if>
        	</div>
        	
            <div class="">
            	<span class="q1">预计报到时间 <span class="f_req" id='reportDateRed'>*</span></span>
            		<#--<input onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',skin:'whyGreen',isShowWeek:true,maxDate:'%y-%M-%d HH:mm'});"-->
            		<input onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',skin:'whyGreen',isShowWeek:true,minDate:'%y-%M-%d HH:mm:ss'});"
									type="text" id="reportDate" style='margin-top:8px;margin-bottom:5px;' 
									<#--value="${(report.reportDate?date)!""}" -->
									<#if report?? && report.reportDate??>
										value='${(report.reportDate!"")?string("yyyy-MM-dd HH:mm:ss")}'
									<#else>
										value=''		
									</#if>	
									name="reportDateStr" readOnly='readOnly'
									<#--class="inp1 Wdate {required : true,messages : {required : '预计报到时间不能为空'}}" />-->
									class="inp1 Wdate " />
            </div>
            <div class="">
            
            	<span class="q1">预计到达站点 <span id='siteDicRed' class="f_req"></span></span>
            		<select id='siteDic' name="siteDic.id" style='margin-top:8px;margin-bottom:5px;'  class="select1 " >
									<option value="">请选择...</option>
									<#if siteList??> 
										<#list siteList as site>
											<#if report?? && report.siteDic?? && report.siteDic.id?? && report.siteDic.id==site.id>
												<option selected="selected" value="${site.id}">${site.name}</option>
											<#else>
												<option value="${site.id}">${site.name}</option>
											</#if>
										</#list> 
									</#if>
								</select>
            </div>
            <div class=""><span class="q1">随行人数 <span id='togetherRed' class="f_req" >*</span></span>
            
            	<input type="text"  id="together" maxlength="2" style='margin-top:8px;margin-bottom:5px;'  class="inp1 {required : true,digits:true, messages : {required : '随行人数不能为空',digits:'随行人数应该是正整数的数字'}}" name="together" value="${(report.together)!""}"/>
            </div>
            
            <#--div class="info"><span class="q1">需要空调</span>
            	<span class="xb">
            		<#if report?? && report.airCond?? && report.airCond=='1'  >
						<input type="radio" value="1" name="airCond" checked="checked" class=""  onclick='isAirCond(1)' />&nbsp;是&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio" value="0" name="airCond"	class="" onclick='isAirCond(0)' />&nbsp;否 
					<#else>					
						<input type="radio" value="1" name="airCond"  class="" onclick='isAirCond(1)' />&nbsp;是&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" value="0" name="airCond" checked="checked"	class=""  onclick='isAirCond(0)' />&nbsp;否 
					</#if>
            		
            	</span>
            </div>
             <#if report?? && (report.airCond =='1' || !(report.airCond??)) >
            	<div class="info" id='airCondCommDiv' style="height:80px;" >
            <#else>
           	 	<div class="info" id='airCondCommDiv' style='height:80px;display:none;' >
            </#if>
            <span class="q1">空调说明</span>
           	 	<#if welcomeSet?? >
            			<textarea  id="airCondComm" cols="12" rows="5" readonly="readonly" class="textarea1" style='height:80px;width:213px;'>${(welcomeSet.airCondComm)!""}</textarea>
            		<#else>
            			<textarea  id="airCondComm" cols="12" rows="5" readonly="readonly" class="textarea1" style='height:80px;width:213px;'></textarea>
            		</#if>
            	
            </div>-->
            
            
            <div class="info"><span class="q1">是否迁户口</span>
            	<span class="xb">	
            		<#if report?? && report.move?? && report.move=='1'  >
						<input type="radio" value="1" name="move" id='move-year'  checked="checked" class="" onclick="isMove('1')"/>&nbsp;是&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio" value="0" name="move" id='move-no'	class=""  onclick="isMove('0')"/>&nbsp;否 
					<#else>					
						<input type="radio" value="1" name="move" id='move-year'  class="" onclick="isMove('1')" />&nbsp;是&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" value="0" name="move" id='move-no' checked="checked"	class=""  onclick="isMove('0')" />&nbsp;否 
					</#if>
            	</span>
            </div>
        </div>
        <div class="infoR">
        	
          
        	 <#if report?? && report.isReport =='1' >
        	 		<div class="info" id='isReportDiv' >
        			<span class="q1" id='isReportSpan' style="display:none;"  >不报到原因 <span id='reasonRed' class="f_req"></span></span>
        			<input id="reason" name="reason" value="${(report.reason)!""}"  maxlength="40" style='margin-top:8px;margin-bottom:5px;display:none;' class="inp1" />
				<#else>
					<div class="" id='isReportDiv' >
           	 		<span class="q1" id='isReportSpan'   >不报到原因 <span id='reasonRed' class="f_req"></span></span>
        			<input id="reason" name="reason" value="${(report.reason)!""}"  maxlength="40" style='margin-top:8px;margin-bottom:5px;' class="inp1" />
            </#if>				
        		
        		 </div >
            <div class="">
            	<span class="q1">预计乘车方式  <span id="rideWayDicRed" class="f_req">*</span></span>
            	<select id='rideWayDic' name="rideWayDic.id" class="select1 " style='margin-top:8px;margin-bottom:5px;' onChange='rideWayChange();'>
									<option value="">请选择...</option>
									<#if rideWayList??> 
										<#list rideWayList as rideWay>
											<#if report?? && report.rideWayDic?? && report.rideWayDic.id?? && report.rideWayDic.id==rideWay.id>
												<option selected="selected" value="${rideWay.id}">${rideWay.name}</option>
											<#else>
												<option value="${rideWay.id}">${rideWay.name}</option>
											</#if>
										</#list> 
									</#if>
								</select>
            </div>
			<div class=""><span class="q1">到达车次 <span id='trainNumberRed' class="f_req"></span></span>
				<input type="text"  id="trainNumber" maxlength="20" style='margin-top:8px;margin-bottom:5px;' class="inp1"  name="trainNumber"  value="${(report.trainNumber)!""}"/>
				
			</div>
           <#-- <div class="info"><span class="q1">自备车</span>
            	<span class="xb">
            		<#if report?? && report.isCar?? && report.isCar=='1'  >
						<input type="radio" value="1" name="isCar" checked="checked" class="{required:true}" />&nbsp;是&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio" value="0" name="isCar"	class="{required:true}" />&nbsp;否 
					<#else>					
						<input type="radio" value="1" name="isCar"  class="{required:true}" />&nbsp;是&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" value="0" name="isCar" checked="checked"	class="{required:true}" />&nbsp;否 
					</#if>
            		</span>
            	
            	</div>-->
            	
            <div class="info"><span class="q1">需要寝具包</span>
            	<span class="xb">	
            		<#if report?? && report.bed?? && report.bed=='1'  >
						<input type="radio" value="1" name="bed" id = "bed-yeas"  checked="checked" class="" onclick='isBed(1)'/>&nbsp;是&nbsp;&nbsp;&nbsp;&nbsp; 
						<input type="radio" value="0" name="bed" id = "bed-No" class="" onclick='isBed(0)' />&nbsp;否 
					<#else>					
						<input type="radio" value="1" name="bed"  id = "bed-yeas"class=""  onclick='isBed(1)' />&nbsp;是&nbsp;&nbsp;&nbsp;&nbsp;
						<input type="radio" value="0" name="bed" id = "bed-No" checked="checked"	class="" onclick='isBed(0)' />&nbsp;否 
					</#if>
            	</span>
            	</div>
            	
            	<#if report?? && ( report.bed =='1' || !(report.bed??)) >
            		<div class="info" id='bedCommDiv' style="height:80px;" >
            	<#else>
           	 		<div class="info" id='bedCommDiv' style='height:80px;display:none;' >
            	</#if>
            	 <span class="q1">寝具包说明</span>
            	 	<#if welcomeSet?? >
            			<textarea  id="bedComm" cols="12" rows="5" readonly="readonly" class="textarea1" style='height:80px;width:213px;'>${(welcomeSet.bedComm)!""}</textarea>
            		<#else>
            			<textarea  id="bedComm" cols="12" rows="5" readonly="readonly" class="textarea1" style='height:80px;width:213px;'></textarea>
            		</#if>
            		
            	</div>
            
            <#if report?? && report.move =='1' >
            	<div class="info" id='move'  >
            <#else>
           	 	<div class="info" id='move' style="display:none;">
            </#if>
            
            	<span class="q1">迁入地址</span>
            	<#if welcomeSet?? >
            		<input type="text" name="yy" id="moveAdderss" class="inp1" readonly="readonly" value="${(welcomeSet.moveAdderss)!""}"/>
            	<#else>
            		<input type="text" name="yy" id="moveAdderss" class="inp1" readonly="readonly" value=""/>
            	</#if>
            </div>
            
        </div>
               
    </div>
    </form>
    <div class="ps2">
    
    	<#-- 当信息采集已经提交了，就没有保存的按钮了，上一页和下一页也不必保存了页面直接跳转  -->
    	<#--<#if report?? && report.status?? &&  report.status=='1'>-->
    	<#if isScope!='1' >
    		<input type="button" value="上一页" name="last" id="last"  class="btn f_l" onclick="submitSave('upGo');" />
    	
    	
    		<input type="submit" value="下一页" name="next" id="next"  class="btn f_r" onclick="submitSave('nextGo');" />
    	<#else>
			
			<input type="button" value="上一页" name="last" id="last"  class="btn f_l" onclick="submitSave('up');" />
    	
    		<input type="button" value="保  存" name="save" id="save"  class="btn f_l" style="margin-left:10px;margin-right:10px;" onclick="submitSave('save');" />
    	
    		<input type="submit" value="下一页" name="next" id="next"  class="btn f_r" onclick="submitSave('next');" />								
		</#if>
    </div>
</div>
			
			
		</div>
	</div>
	
	
	
</body>
</html>

