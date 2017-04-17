<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="${rc.contextPath}/css/bdp_comp.css" type="text/css">
    <!-- My97DatePicker -->
    	<link rel="stylesheet" href="${rc.contextPath}/lib/My97DatePicker/skin/WdatePicker.css" />
		<script type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
		
		<script type="text/javascript" src="${rc.contextPath}/js/common/cascadecommon.js"></script>
		<style type="text/css">
			._little{width:175px;}
		</style>
		<script>
			function clearCascadeForm(formId) {
				$(':input','#'+formId).not(':button, :submit, :reset, :hidden, .notClear').val('').removeAttr('checked').removeAttr('selected');
				$("#classId option").remove();
				$("#classId").append("<option value=''>请选择</option>");
				if(!$("#college").hasClass("notClear")) {
					$("#majorId option").remove();
					$("#majorId").append("<option value=''>请选择</option>");
				}
			}
		</script>
    </head>
    <body> 
		<div id="contentwrapper">
   		<div class="main_content">   
    	   <div class="row-fluid">	
    		<form  id="studentReportModelQuery" action="${rc.contextPath}/orientation/regulatoryAnalysis/opt-query/queryExReport.do" method="post">
				<input id="pageTotalCount" name="pageTotalCount" type="hidden"  value="${pageTotalCount!""}"/>
				<div class="span12">			
					<div class="row-fluid">
						 <div class="span3">
							<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学年</span>
							<div class="span9">
							<select  class="span12 notClear" size="1" id="yearDic" name="yearDic.id" aria-controls="dt_gal" >
								<#if yearList??>
								<#list yearList as y>
									<#if studentReportModel.yearDic ?? && studentReportModel.yearDic.id == y.id>
										<option value="${y.id}" data-code="${y.code?html}" selected="selected" >${y.name?html}</option>	
									<#else>
										<option value="${y.id}" data-code="${y.code?html}" >${y.name?html}</option>	
									</#if>
								</#list>
								</#if>
							</select>
							</div>
						</div>
						
						<div id="" class="span3">
							<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学院</span>
							<div class="span9">
						    <select  class="span12 <#if flag?? && flag>notClear</#if>" <#if flag?? && flag>disabled</#if> onChange="cascade.changeCollage('college', 'majorId', 'classId');" size="1" id="college" name="studentInfo.college.id" aria-controls="dt_gal" >
						    <option value="" >请选择</option>
						    <#if collegeList??>
								<#list collegeList as c>
									<#if studentReportModel.studentInfo?? && studentReportModel.studentInfo.college?? && studentReportModel.studentInfo.college.id?? && studentReportModel.studentInfo.college.id == c.id>
										<option value="${c.id}" selected="selected">${c.name?html}</option>
									<#else>
										<option value="${c.id}">${c.name?html}</option>
									</#if>
								</#list>
							</#if>
						    </select>
						    </div>
						 </div>
						 
						 <div id="" class="span3">
							<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;专业</span>
							<div class="span9">
						    <select  class="span12" size="1" id="majorId" name="studentInfo.major.id" aria-controls="dt_gal" onChange="cascade.changeMajor('majorId','classId');">
						    <option value="" >请选择</option>
						    <#if majorList ?? >
								<#list majorList as m>
									<#if studentReportModel.studentInfo ?? && studentReportModel.studentInfo.major?? &&  studentReportModel.studentInfo.major.id == m.id >
										<option value="${m.id}" selected >${m.majorName}</option>
									<#else>
										<option value="${m.id}">${m.majorName}</option>
									</#if>
								</#list>
							</#if>
						    </select>
						 	</div>
						</div>
						
						<div class="span3">
							<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;班级</span>
							<div class="span9">
							<select class="span12" size="1" id="classId" name="studentInfo.classId.id" aria-controls="dt_gal" >
								<option value="" >请选择</option>
								<#if classList ?? >
									<#list classList as c>
										<#if studentReportModel.studentInfo ?? && studentReportModel.studentInfo.classId?? &&  studentReportModel.studentInfo.classId.id == c.id >
											<option value="${c.id}" selected >${c.className}</option>
										<#else>
											<option value="${c.id}">${c.className}</option>
										</#if>
									</#list>
								</#if>
							</select>
							</div>
						</div>
					</div>
					
					<div class="row-fluid">
						 <div id="" class="span3">
							<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;姓名</span>
							<div class="span9">
							<input class="_little" id="" name="studentInfo.name" maxlength="5" value="<#if studentReportModel.studentInfo??>${studentReportModel.studentInfo.name!""}</#if>" />
						 	</div>
						 </div>
						 <div id="" class="span3">
							<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;报到</span>
							<div class="span9">
						    <select class="span12" size="1" id="isReport" name="isReport" aria-controls="dt_gal" >
						    <option value="" >请选择</option>
						    <#if yOrNList??>
								<#list yOrNList as yn>
									<#if studentReportModel?? && studentReportModel.isReport?? && studentReportModel.isReport == yn>
										<option value="${yn}" selected="selected"><#if yn=="1">是<#else>否</#if></option>
									<#else>
										<option value="${yn}"><#if yn=="1">是<#else>否</#if></option>
									</#if>
								</#list>
							</#if>
						    </select>
						    </div>
						 </div>
						 <div id="siteDicController" class="span3 <#if studentReportModel?? && studentReportModel.isReport?? && studentReportModel.isReport == "0">hidden<#else></#if>">
							<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;到站</span>
							<div class="span9">
						    <select class="span12" size="1" id="siteDic" name="siteDic.id" aria-controls="dt_gal" >
						    <option value="" >请选择</option>
						    <#if siteList??>
								<#list siteList as s>
									<#if studentReportModel?? && studentReportModel.siteDic?? && studentReportModel.siteDic.id == s.id>
										<option value="${s.id}" selected="selected">${s.name?html}</option>
									<#else>
										<option value="${s.id}">${s.name?html}</option>
									</#if>
								</#list>
							</#if>
						    </select>
						    </div>
						 </div>
						 
						 <div id="rideWayDicController" class="span3 <#if studentReportModel?? && studentReportModel.isReport?? && studentReportModel.isReport == "0">hidden<#else></#if>">
							<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;乘车</span>
							<div class="span9">
							<select class="span12" size="1" id="rideWayDic" name="rideWayDic.id" aria-controls="dt_gal" >
								<option value="" >请选择</option>
								<#if rideWayList??>
								<#list rideWayList as rw>
									<#if studentReportModel ?? && studentReportModel.rideWayDic ?? && studentReportModel.rideWayDic.id == rw.id>
										<option value="${rw.id}" data-code="${rw.code?html}" selected="selected">${rw.name?html}</option>	
									<#else>
										<option value="${rw.id}" data-code="${rw.code?html}" >${rw.name?html}</option>	
									</#if>
								</#list>
								</#if>
							</select>
							</div>
						</div>
					</div>
					
					<div id="rowController" class="row-fluid">
						<div id="reportStartDateController" class="span3 <#if studentReportModel?? && studentReportModel.isReport?? && studentReportModel.isReport == "0">hidden<#else></#if>">
							<span class="formTitle">报到时间</span>
							<div class="span9">
							<input id="reportStartDate" name="reportStartDate" class="Wdate _little"
								 style="cursor:pointer" onclick="WdatePicker({skin:'whyGreen', dateFmt:'yyyy-MM-dd HH:mm', maxDate:'#F{$dp.$D(\'reportEndDate\')}'});"  value="<#if studentReportModel.reportStartDate??>${(studentReportModel.reportStartDate)?string('yyyy-MM-dd HH:mm')}</#if>" />
						 	</div>
						 </div>
						 
						 <div id="reportEndDateController" class="span3 <#if studentReportModel?? && studentReportModel.isReport?? && studentReportModel.isReport == "0">hidden<#else></#if>">
							<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;至</span>
							<div class="span9">
							<input id="reportEndDate" name="reportEndDate" class="Wdate _little"
								 style="cursor:pointer" onclick="WdatePicker({skin:'whyGreen', dateFmt:'yyyy-MM-dd HH:mm',  minDate:'#F{$dp.$D(\'reportStartDate\')}'});"  value="<#if studentReportModel.reportEndDate??>${(studentReportModel.reportEndDate)?string('yyyy-MM-dd HH:mm')}</#if>" />
						 	</div>
						 </div>
						<div id="bedController" class="span3 <#if studentReportModel?? && studentReportModel.isReport?? && studentReportModel.isReport == "0">hidden<#else></#if>">
							<span class="formTitle">&nbsp;&nbsp;寝具包</span>
							<div class="span9">
						    <select class="span12" size="1" id="bed" name="bed" aria-controls="dt_gal" >
						    <option value="" >请选择</option>
						    <#if yOrNList??>
								<#list yOrNList as yn>
									<#if studentReportModel?? && studentReportModel.bed?? && studentReportModel.bed == yn>
										<option value="${yn}" selected="selected"><#if yn=="1">需要<#else>不需要</#if></option>
									<#else>
										<option value="${yn}"><#if yn=="1">需要<#else>不需要</#if></option>
									</#if>
								</#list>
							</#if>
						    </select>
						    </div>
						 </div>
						 
						 <div id="moveController" class="span3 <#if studentReportModel?? && studentReportModel.isReport?? && studentReportModel.isReport == "0">hidden<#else></#if>">
							<span class="formTitle">&nbsp;&nbsp;迁户口</span>
							<div class="span9">
						    <select class="span12" size="1" id="move" name="move" aria-controls="dt_gal" >
						    <option value="" >请选择</option>
						    <#if yOrNList??>
								<#list yOrNList as yn>
									<#if studentReportModel?? && studentReportModel.move?? && studentReportModel.move == yn>
										<option value="${yn}" selected="selected"><#if yn=="1">需要<#else>不需要</#if></option>
									<#else>
										<option value="${yn}"><#if yn=="1">需要<#else>不需要</#if></option>
									</#if>
								</#list>
							</#if>
						    </select>
						    </div>
						 </div>
					</div>
					
		            <div class="btnCenter">
		              <input type="button" onclick="sub()" class="btn btn-info" value="查 询"/>
		              <input type="button" class="btn btn-info"  onclick="clearCascadeForm('studentReportModelQuery');" value="清 空"/>
		            </div>
				</div>
			</form>
			
				<div class="row-fluid">
					<div class="span12">
						<h5 class="heading"></h5>
						<div class="dt_actions">
					    <div class="row-fluid">
					        <button class="btn btn-info" type="button" id="export-button" style="margin-bottom:10px">
					       		 导 出
					        </button>
					        <input id="exportSize" name="exportSize" type="hidden" class="span3" value="1000" title="excel单页条数">
					    </div>
					</div>
						<div id="" class="dataTables_wrapper form-inline" role="grid">
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
							<thead>
								<tr>
									<th width="6%">序号</th>
									<th width="10%">学院</th>
									<th width="10%">专业</th>
									<th width="9%">班级</th>
									<th width="10%">学号</th>
									<th width="7%">姓名</th>
									<th width="7%">性别</th>
									<th width="14%">身份证号</th>
									<th width="18%">预期报到时间</th>
									<th width="9%">到达站点</th>
								</tr>
							</thead>
							<tbody>
								<#if page??>	
									<#list page.result as p>
										<tr>
											<td class="autocut">${p_index+1}</td>
											<td class="autocut"><#if p.studentInfo?? && p.studentInfo.college??>${p.studentInfo.college.name!""}</#if></td>
											<td class="autocut"><#if p.studentInfo?? && p.studentInfo.major??>${p.studentInfo.major.majorName}</#if></td>
											<td class="autocut"><#if p.studentInfo?? && p.studentInfo.classId??>${p.studentInfo.classId.className!""}</#if></td>
											<td class="autocut"><#if p.studentInfo?? >${(p.studentInfo.stuNumber!"")}</#if></td>
											<td class="autocut"><#if p.studentInfo??>${(p.studentInfo.name!"")}</#if></td>
											<td class="autocut"><#if p.studentInfo?? && p.studentInfo.genderDic??>${(p.studentInfo.genderDic.name!"")}</#if></td>
											<td class="autocut"><#if p.studentInfo?? >${(p.studentInfo.certificateCode!"")}</#if></td>
											<td class="autocut"><#if p.reportDate?? >${(p.reportDate)?string("yyyy-MM-dd HH:mm")}</#if></td>
											<td class="autocut"><#if p.siteDic?? >${(p.siteDic.name!"")}</#if></td>
										</tr>
									</#list>
								</#if>
							</tbody>
						</table>
						
					 	<#assign pageTagformId="studentReportModelQuery"/>
						<#include "/page.ftl" />
					</div>
				</div>
			</div> 
		</div> 
	</div>
</div>
<div class="modal hide fade" id="exportdemo">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3 id="title1">导出预期报到查询列表</h3>
	</div>
	<div class="modal-body" id="export_reportProgress">
		
	</div>
	<div class="modal-footer">
		<a href="#" class="btn" data-dismiss="modal">关闭</a>
	</div>
</div>
<#-- 脚本开始 -->
<script>
	//验证是否输入的是身份证号
	/**
	jQuery.validator.addMethod("idCardCheck",function(value,element){
	   if(value != ""){
          idCard=/^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}([0-9]|X)$/;
	      return idCard.exec(value);
	   }else{
	      return true;
	   }
	  return false;
	},"请输入正确的18位的身份证号.");
	*/

	$("#studentReportModelQuery").compValidate({
		rules:{
			"studentInfo.name":{maxlength:5},
			"studentInfo.stuNumber":{maxlength:20},
			"studentInfo.certificateCode":{maxlength:18}
		},
		messages:{
			"studentInfo.name":{maxlength:'姓名不得超过5个字'},
			"studentInfo.stuNumber":{maxlength:'学号不得超过20字'},
			"studentInfo.certificateCode":{maxlength:'身份证号不得查过18位'}
		}
	});
	
	
	jQuery("#isReport").change(function() {
		if($("#isReport option:selected").val()=="0") {
			//到站
			$("#siteDic").val("");
			$("#siteDicController").removeClass().addClass("span3 hidden");
			
			//乘车
			$("#rideWayDic").val("");
			$("#rideWayDicController").removeClass().addClass("span3 hidden");
			
			//报到时间
			$("#reportStartDate").val("");
			$("#reportEndDate").val("");
			$("#reportStartDateController").removeClass().addClass("span3 hidden");
			$("#reportEndDateController").removeClass().addClass("span3 hidden");
			
			//寝具包
			$("#bed").val("");
			$("#bedController").removeClass().addClass("span3 hidden");
			
			//迁户口
			$("#move").val("");
			$("#moveController").removeClass().addClass("span3 hidden");
		}else {
			//到站
			$("#siteDicController").removeClass("hidden");
			//乘车
			$("#rideWayDicController").removeClass("hidden");
			//报到时间
			$("#reportStartDateController").removeClass("hidden");
			$("#reportEndDateController").removeClass("hidden");
			//寝具包
			$("#bedController").removeClass("hidden");
			//迁户口
			$("#moveController").removeClass("hidden");
		}
		
	});

    //点击导出按钮触发的方法
	$("#export-button").click(function() {
		var pageTotalCount= $("#pageTotalCount").val();
		var exportSize= $("#exportSize").val();
		var patrn=/^[0-9]{1,20}$/;
		if(exportSize==""){
			comp.message("请输入大于0的正整数","error");
		}else if(!patrn.exec(exportSize)){
			comp.message("请输入大于0的正整数","error");
		}else if(exportSize<1){
			comp.message("请输入大于0的正整数","error");
		}else if(exportSize>1000){
			comp.message("请输入小于1000的正整数","error");
		}else{
			comp.showModal("exportdemo","500px","-250px 0 0 -250px");
			$("#export_reportProgress").load("${rc.contextPath}/orientation/regulatoryAnalysis/nsm/exportReportListView.do?pageTotalCount="+pageTotalCount+"&exportSize="+exportSize);
		}
	});

function sub(){
$("#studentReportModelQuery").attr("action", "${rc.contextPath}/orientation/regulatoryAnalysis/opt-query/queryExReport.do");
$("#studentReportModelQuery").submit();

}

//点击导出按钮弹出的对话框中的链接，进行导出操作
	function exportCourseDate(exportSize,exportPage){
		$("#studentReportModelQuery").attr("action", "${rc.contextPath}/orientation/regulatoryAnalysis/opt-export/exportCountReportList.do");
		var fo=$("#studentReportModelQuery");
		//debugger;
		if($("#countReportList_exportPage").length==0){
			fo.append($("<input>",{
				id:'countReportList_exportSize',
				type:'hidden',
				name:'countReportList_exportSize',
				val:exportSize
			}));
			fo.append($("<input>",{
				id:'countReportList_exportPage',
				type:'hidden',
				name:'countReportList_exportPage',
				val:exportPage
			}));
		}else{
			$("#countReportList_exportSize").val(exportSize);
			$("#countReportList_exportPage").val(exportPage);
		}
		fo.submit();
	}

</script>
</body>
</html>