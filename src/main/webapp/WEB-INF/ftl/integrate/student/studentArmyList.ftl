<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
    <!-- My97DatePicker -->
	<link rel="stylesheet" href="${rc.contextPath}/lib/My97DatePicker/skin/WdatePicker.css" />
	<script type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
    <script>
    
    <!--显示提示框-->
	$(function(){
		$('.tipTag').poshytip({
			className: 'tip-yellowsimple',
			alignTo: 'target',
			alignX: 'right',
			alignY: 'center',
			offsetX: -10
		});
	});
    
    $(document).ready(function(){
	 	 //新增方法 
	 	$("#add-button").click( function () { 
	 		window.location.href="${rc.contextPath}/student/army/opt-edit/editStudentArmy.do";
	 	 });
	});
	function importStudentArmy(){
		window.location.href="${rc.contextPath}/integrate/student/studentArmyImport.ftl";
	}
	function clearCascadeForm(formId) {
			$(':input','#'+formId).not(':button, :submit, :reset, :hidden, .notClear').val('').removeAttr('checked').removeAttr('selected');
			if($("#classId option").length>1) {
				var option = $("#classId").get(0).options;
				option.length = 0;
				var nullOption = new Option("请选择", "", false, false);
				option.add(nullOption);
			}
			if(!$("#collegeId").hasClass("notClear") && $("#majorId option").length>1) {
				var option = $("#majorId").get(0).options;
				option.length = 0;
				var nullOption = new Option("请选择", "", false, false);
				option.add(nullOption);
			}
		}
	//点击checkbox按钮 
	function onClickSingleCheckbox(obj)
	{
		var $subBox = $("input[name='armyStudentId']");
		$("#totalCheck").attr("checked",$subBox.length == $("input[name='armyStudentId']:checked").length ? true : false);
	}
	
	function deleteStudent()
	{
		var $subBox = $("input[name='armyStudentId']");
		var len =  $("input[name='armyStudentId']:checked").length ;
		if(len >0)
		{
			comp.confirm("删除选中的学生参军信息将不可恢复，确认要删除吗？", function(result) {
            	if(!result)
            		return;  
         		
         		$.ajax({
					url: "${rc.contextPath}/student/army/opt-del/deleteStudentArmy.do",
					async:false,
					cache:false,
					type:"POST",
					data:$('#studentDelete').serialize(),
				    success: function(data){
						if(data == "success"){
					       $("#classQuery").submit();
					    }else{
					    	$.sticky("学生参军信息删除失败", {autoclose:5000, position:"top-right", type:"st-error"});
					    	return;
					    }
					}
			   });

			}); 
		}
		else
		{
			comp.message("请选择要删除的学生参军信息!","info");
		}
	}
	
	
	</script>
</head>
<body>
<div id="contentwrapper">
    <div class="main_content">   
    	   <div class="row-fluid">	
    		<form  id="classQuery"  action="${rc.contextPath}/student/army/opt-query/listStudentArmy.do" method="post">
				<div class="span12">			
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">学院</span>
							<select size="1" id="collegeId" name="student.college.id" aria-controls="dt_gal" class="span7" onchange="cascade.changeCollage('collegeId','majorId','classId');" >
								<option value="">请选择..</option>
								<#if collegeList ??>
									<#list collegeList as c>
										<#if  studentArmyInfo ?? && studentArmyInfo.student ??&& studentArmyInfo.student.college ?? &&  studentArmyInfo.student.college.id == c.id >
											<option  value="${c.id}" selected="selected">${c.name?html}</option>
										<#else>
											<option value="${c.id}" >${c.name?html}</option>
										</#if>
									</#list>
								</#if>
							</select>
						 </div>
						 <div class="span4">
							<span class="formTitle">专业</span>
							<select size="1" id="majorId" name="student.major.id" aria-controls="dt_gal" class="span7 emptySelect"  onchange="cascade.changeMajor('majorId','classId');">
								<option value="" >请选择..</option>
								<#if majorList ?? >
									<#list majorList as m>
										<#if studentArmyInfo ?? && studentArmyInfo.student ??&& studentArmyInfo.student.major ?? &&  studentArmyInfo.student.major.id == m.id >
											<option value="${m.id}" selected >${m.majorName?html}</option>
										<#else>
											<option value="${m.id}">${m.majorName?html}</option>
										</#if>
									</#list>
								</#if>
							</select>
						  </div>
						<div class="span4">
							<span class="formTitle">班级</span>
							<select size="1" id="classId" name="student.classId.id" aria-controls="dt_gal" class="span8 emptySelect">
								<option value="" >请选择..</option>
								<#if classList ?? >
									<#list classList as c>
										<#if studentArmyInfo ?? && studentArmyInfo.student ??&& studentArmyInfo.student.classId ?? &&  studentArmyInfo.student.classId.id == c.id >
											<option value="${c.id}" selected >${c.className?html}</option>
										<#else>
											<option value="${c.id}">${c.className?html}</option>
										</#if>
									</#list>
								</#if>
							</select>
						</div>
						</div>		
					    <div class="row-fluid">
						<div class="span4">
							<span class="formTitle">姓名</span>
							<input id="name" name="student.name" class="span7" value="<#if studentArmyInfo ?? && studentArmyInfo.student ??>${studentArmyInfo.student.name!""?html}</#if>" />
						 </div>
						 <div class="span4">
							<span class="formTitle">学号</span>
							<input id="stuNumber" name="student.stuNumber" class="span7" value="<#if studentArmyInfo ?? && studentArmyInfo.student ??>${studentArmyInfo.student.stuNumber!""?html}</#if>" />
						 </div>
						 <div class="span4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						  	<button class="btn btn-info" type="submit">查 询</button>
		              		<button class="btn btn-info" type="button" onclick="comp.clearForm('classQuery');">清 空</button>
						 </div>
						<!--<div class="span4" style="display:inline" />
							<span class="formTitle">参军时间</span>
							<input id="beginDate" name="beginDate" class="Wdate span4" style="cursor:pointer;display:inline" onclick="WdatePicker({skin:'whyGreen', maxDate:'#F{$dp.$D(\'endDate\')||\'new Date()\'}'});"  value="<#if studentArmyInfo ?? && studentArmyInfo.beginDate?? >${(studentArmyInfo.beginDate!'')?string("yyyy-MM-dd")} </#if>"  />
							至
							<input id="endDate" name="endDate" class="Wdate span4" style="cursor:pointer;display:inline" onclick="WdatePicker({skin:'whyGreen', minDate:'#F{$dp.$D(\'beginDate\')}'});"  value="<#if studentArmyInfo ?? && studentArmyInfo.endDate?? >${(studentArmyInfo.endDate!'')?string("yyyy-MM-dd")}</#if>" />
						 </div>-->
					</div>
					<#-- 
		            <div class="btnCenter">
		              <button class="btn btn-info" type="submit">查 询</button>
		              <button class="btn btn-info" type="button" onclick="comp.clearForm('classQuery');">清 空</button>
		            </div>
		            -->
		       </div>
			</form>
			
				<div class="row-fluid">
					<div class="span12">
						<h5 class="heading"></h5>
						<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
						<div class="row">
				            <div class="span10">
				                <div class="dt_actions">
				                    <div class="row-fluid">
								        <#if user_key.optMap??>
								            <#if user_key.optMap['add']??>
					                            <button class="btn btn-info" type="button" id="add-button">新 增</button>
											</#if>
											<#if user_key.optMap['import']??>
												 <button class="btn btn-info" type="button"  onclick="importStudentArmy();">导 入</button>
											</#if>
											<#if user_key.optMap['del']??>
												<button class="btn btn-info" type="button"  onclick="deleteStudent();">删 除</button>
											</#if>
										</#if>
									</div>
								</div>
							</div>
						</div>
						<form  id="studentDelete"  action="${rc.contextPath}/student/army/opt-del/deleteStudentArmy.do" method="post">
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
							<thead>
								<tr>
								    <th width="6%">
								  	 <#if user_key.optMap??>
										<#if user_key.optMap['del']??>
											<input type="checkbox" id="totalCheck"  onclick="comp.selectAllCheckbox('totalCheck','armyStudentId')"/>
										<#else>
											序号
										</#if>
									 </#if> 
								    </th>
									<th width="8%">姓名</th>
									<th width="12%">学号</th>
									<th width="6%">性别</th>
									<#--
									<th width="15%">学院</th>
									<th width="15%">专业</th>
									<th width="15%">班级</th>
									-->
									<th width="12%">参军时间</th>
									<th width="10%">应缴学费</th>
									<th width="9%">实缴学费</th>
									<th width="9%">获贷金额</th>
									<th width="10%">贷款代偿<br/>金额本金</th>
									<th width="10%">贷款代偿<br/>金额小计</th>
									<th width="8%">操作</th>
								</tr>
							</thead>
							<tbody>
							<#if page??>	
								<#list page.result as p>
								<#if p.student ?? >
								<tr>		
								    <td>
								    <#if user_key.optMap??>
										<#if user_key.optMap['del']??>
											<input type="checkbox"  name="armyStudentId" onclick="onClickSingleCheckbox(this);" value="${p.id!""}"/>
										<#else> 
											${p_index+1}
										</#if>
									 </#if>
								   </td>
									<td class="autocut tipTag" data="学院：${p.student.college.name!""?html} </br>专业：${p.student.major.majorName!""?html}</br>班级：${p.student.classId.className!""?html}"><a href="${rc.contextPath}/student/army/opt-query/queryStudentArmy.do?id=${p.id}" target='_blank' class="sepV_a" title="查看">${p.student.name!""?html}</a></td>
									<td class="autocut">${p.student.stuNumber!""?html}</td>
									<td class="autocut"><#if p.student.genderDic ?? >${p.student.genderDic.name!""?html}</#if></td>
									<#-- 
									<td class="autocut"><#if p.student.college ?? >${p.student.college.name!""?html}</#if></td>
									<td class="autocut"><#if p.student.major ?? >${p.student.major.majorName!""?html}</#if></td>
									<td class="autocut"><#if p.student.classId ?? >${p.student.classId.className!""?html}</#if></td>
									-->
                                   	<td class="autocut">${(p.armyDate!"")}</td>
                               		<td class="autocut">${(p.tuitionFees!"")?string("#.##")}</td>
                           			<td class="autocut">${(p.paidFees!"")?string("#.##")}</td>
                       				<td class="autocut">${(p.loanAmount!"")?string("#.##")}</td>
                       				<td class="autocut">${(p.loanPrincipal!"")?string("#.##")}</td>
                       				<td class="autocut">${(p.loanCount!"")?string("#.##")}</td>
                                   	<td class="autocut">
                                   	<a href="${rc.contextPath}/student/army/opt-query/queryStudentArmy.do?id=${p.id}" target='_blank' class="sepV_a" title="查看"><i class="icon-list-alt"></i></a>
                                    <#if user_key.optMap?? && user_key.optMap['update']??>
										<a href="${rc.contextPath}/student/army/opt-edit/editStudentArmy.do?id=${p.id}" class="sepV_a" title="修改"><i class="icon-edit"></i></a>
									</#if>
                                    </td>
								</tr>
								</#if>
								</#list>
							 </#if> 
							</tbody>
						</table>
						</from>
						 <#assign pageTagformId="classQuery"/>
						 <#include "/page.ftl">
					</div>
				</div>
			</div> 
		</div> 
	</div>
</div>

</body>
</html>