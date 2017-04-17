<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link href="${rc.contextPath}/css/starSelect.css" rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="${rc.contextPath}/js/common/cascadecommon.js"></script>
        <script src="${rc.contextPath}/js/common/setTimeConfig.js"></script>
        <script src="${rc.contextPath}/js/jquery.form.js"></script> 
    </head>
    <body>
	  <div id="contentwrapper">
   		<div class="main_content">   
    	  <div class="row-fluid">
    	    <#--<input id="nextApprover" type="hidden" name="nextApprover"  value="${(nextApprover)!""}"/>
    		 <input type="hidden" id="approveId" name="approveId" value="${(user_key.userId)!''}" />-->
    		<form  id="approveStudentInfoQuery"  action="${rc.contextPath}/sponsor/approveDifficultStudent/opt-query/approveDifficultStudentList.do" method="post">
				 <div class="span12">			
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">姓名</span>
						    <input id="student.name" name="student.name" class="span6" <#if difficultStudentInfo?? && difficultStudentInfo.student??> value="${((difficultStudentInfo.student.name)!'')?html}"</#if> maxlength="225"/>
						 </div>
						 
						 <div class="span4">
							<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学号</span>
							<input id="student.stuNumber" name="student.stuNumber" class="span6" value="${((difficultStudentInfo.student.stuNumber)!'')?html}" maxlength="225"/>
						 </div>
						 
						 <div class="span4">
						  <span class="formTitle">推荐档次</span>
						    <select size="1" id="difficultLevel.id" class="span6" name="difficultLevel.id" aria-controls="dt_gal" >
					          <option value="" />请选择..</option>
								 <#if difficultList??>
										<#list difficultList as d>
											<#if difficultStudentInfo?? && difficultStudentInfo.difficultLevel ?? && difficultStudentInfo.difficultLevel.id==d.id >
												<option  value="${d.id}" selected="selected" />${d.name?html}</option>
											<#else>
												<option value="${d.id}" />${d.name?html}</option>
											</#if>
										</#list>
								   </#if>
								</select>
				         	</select>
						 </div>
					 </div>
					 
					<div class="row-fluid"> 
					 <div class="span4">
					   <span class="formTitle">学院</span>
						<select size="1" id="college" name="student.college.id" aria-controls="dt_gal" class="span6" onChange="cascade.changeCollage('college', 'majorId','classId');">
							<option value="" >请选择</option>
							<#if collegeList??>
								<#list collegeList as c>
									<#if difficultStudentInfo?? && difficultStudentInfo.student?? && difficultStudentInfo.student.college?? && c.id==difficultStudentInfo.student.college.id>
										<option value="${c.id}" selected="selected">${c.name?html}</option>
									<#else>
										<option value="${c.id}">${c.name?html}</option>
									</#if>
								</#list>
							</#if>
						</select>
					</div>
					<div class="span4">
						<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;专业</span>
						<select size="1" id="majorId" name="student.major.id" aria-controls="dt_gal" class="span6 emptySelect" onChange="cascade.changeMajor('majorId', 'classId');">
							<option value="" >请选择</option>
							<#if majorList ?? >
								<#list majorList as m>
									<#if difficultStudentInfo?? && difficultStudentInfo.student?? && difficultStudentInfo.student.major?? &&  difficultStudentInfo.student.major.id == m.id >
										<option value="${m.id}" selected >${m.majorName}</option>
									<#else>
										<option value="${m.id}">${m.majorName}</option>
									</#if>
								</#list>
							</#if>
						</select>
					</div>
				
					<div class="span4">
						<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;班级</span>
						<select size="1" id="classId" name="student.classId.id" aria-controls="dt_gal" class="span6 emptySelect" >
							<option value="" >请选择</option>
							<#if classList ?? >
								<#list classList as c>
									<#if difficultStudentInfo?? && difficultStudentInfo.student?? && difficultStudentInfo.student.classId?? && difficultStudentInfo.student.classId.id == c.id >
										<option value="${c.id}" selected >${c.className}</option>
									<#else>
										<option value="${c.id}">${c.className}</option>
									</#if>
								</#list>
							</#if>
						</select>
					</div>
				</div>
					 
					<div class="row-fluid">
					 <div class="span4">
						  <span class="formTitle">学年</span>
						    <select size="1" id="schoolYear" class="span6" name="schoolYear.id" aria-controls="dt_gal" >
					          <option value="" />请选择..</option>
								<#if yearList??>
									<#list yearList as d>
										<#if difficultStudentInfo?? && difficultStudentInfo.schoolYear ?? && difficultStudentInfo.schoolYear.id==d.id >
											<option  value="${d.id}" selected="selected" />${d.name?html}</option>
										<#else>
											<option value="${d.id}" />${d.name?html}</option>
										</#if>
									</#list>
								 </#if>
				         	</select>
						 </div>
						 <div class="span4">
							<span class="formTitle">审核状态</span>
								<select size="1" name="processStatus" aria-controls="dt_gal" class="span6">
									<option value="" >请选择..</option>
										<#list processStatusMap?keys as c>
											<#if difficultStudentInfo ?? && difficultStudentInfo.processStatus?? && difficultStudentInfo.processStatus == c >
												<option value="${c}" selected >${processStatusMap[c]}</option>
											<#else>
												<option value="${c}">${processStatusMap[c]}</option>
											</#if>
										</#list>
								</select>	
						 </div>
						 <div class="span4">
						     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				             <input type="button" class="btn btn-info"  onclick="selectApproveStudentInfo();" value="查 询"/>
				             <input type="button" class="btn btn-info"  onclick="comp.clearForm('approveStudentInfoQuery')" value="清 空"/>
				       </div>
					 </div>
					 <#-- 选中的数据项ID -->
		    	    <input type="hidden" id="selectedBox" name="selectedBox" value="">
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
				                    <#-->
			                            <button class="btn btn-info" type="button"  onclick="javascript:passStatus('pass')">
							                                        通 过                                
							            </button>
							             &nbsp;&nbsp;           
				                        <button class="btn btn-info" type="button"  onclick="javascript:passStatus('refuses')">
				                                                                      拒 绝
				                       </button>
				                    <-->
				                    <#-->
				                    <#if user_key.optMap['approve']??>
   										<button class="btn btn-info" type="button" onclick="submitMulProcess('approveProcess','selectedBox')">批量审核</button>
									</#if> 
									<--> 
									<#if user_key.optMap??>
										<#if user_key.optMap['setTime']??>
											 <button class="btn btn-info" type="button"  onclick="timeConfig.setTime('SET_TIME_DIFFICULT_STUDENT');">时间设置</button>
										</#if>
									</#if>
									<span id="time">
									<#if timeConfigModel ?? > 
									<font color="red"><b>[${(timeConfigModel.beginDate!"")?string("yyyy-MM-dd")}至  ${(timeConfigModel.endDate!"")?string("yyyy-MM-dd")}]</b></font> 
									</#if> 
				                    </div>
				                </div>
				            </div>
				        </div>
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl" >
							<thead>
								<tr>
									<th width="6%">
									    序号
									</th>
									<th width="7%">姓名</th>
									<th width="9%">学号</th>
									<th width="8%">推荐档次</th>
									<th width="8%">学年</th>
									<th width="8%">是否孤儿</th>
									<th width="8%">是否残疾</th>
									<th width="8%">是否单亲</th>
									<th width="8%">村级证明</th>
									<th width="8%">镇级证明</th>
									<th width="8%">县级证明</th>
									<th width="8%">审核状态</th>
									<th width="7%">操作</th>
								</tr>
							</thead>
							<tbody>
								<#if page??>	
									<#list page.result as p>
										<tr>
											<td>
											    <#--><input type="checkbox"  name="approveProcess" value="${p.id!""}"/>-->
											    ${p_index+1}
											</td>
											<td class="autocut tipTag" data="学院：${(p.student.college.name)!''}<br/>专业：${(p.student.major.majorName)!''}<br/>班级：${(p.student.classId.className)!''}<br/>"><a target="_blank" href="${rc.contextPath}/sponsor/difficultStudent/opt-view/viewDifficultStudentInfo.do?id=${(p.id)!''}" title="查看困难生信息"> ${(p.student.name)!""}</a></td>
											<td class="autocut">${(p.student.stuNumber)!""}</td>
											<td class="autocut">${(p.difficultLevel.name)!""}</td>
											<td class="autocut">${(p.schoolYear.name)!""}</td>
											<td class="autocut">${(p.isOrphan.name)!""}</td>
											<td class="autocut">${(p.disabilityCertificateKind.name)!""}</td>
											<td class="autocut">${(p.isSingle.name)!""}</td>
											<td class="autocut">${(p.villageProve.name)!""}</td>
											<td class="autocut">${(p.townProve.name)!""}</td>
											<td class="autocut">${(p.countyProve.name)!""}</td>
											<td class="autocut">
											<#if p.processStatus ??>
												<#if currentUserId?? && p.nextApprover?? && p.nextApprover.id==currentUserId>
													待审核
												<#else>
													${processStatusMap[p.processStatus]}
												</#if>
												<#else>待审核
											</#if>
									        </td>
											<td>
											<#if currentUserId?? && p.nextApprover?? && p.nextApprover.id==currentUserId>
											   <a href="${rc.contextPath}/sponsor/difficultStudentApprove/opt-edit/editDifficultStudentApprove.do?id=${p.id}" class="sepV_a" title="困难生审核"><i class="icon-check"></i></a>
											</#if>
											<#if p.status?? && p.status.code?? && p.status.code="PASS">
											   <a target="_blank" href="${rc.contextPath}/sponsor/difficultStudent/opt-view/viewDifficultStudentInfo.do?id=${(p.id)!''}" title="查看困难生信息"><i class="icon-list-alt"></i></a>
											</#if>
											</td>
										</tr>
									</#list>
								 </#if> 
							</tbody>
						</table>
						 <#assign pageTagformId="approveStudentInfoQuery"/>
						 <#include "/page.ftl">
					</div>
				</div>
			</div> 
		</div> 
	</div>
	<#include "/apw/instance/approvers.ftl"/>
</div>
<#include "/common/config/configPopEditDiv.ftl">
<#-- 脚本开始 -->
<script>
	
	
	
	//查询
	function selectApproveStudentInfo(){
	    $("#approveStudentInfoQuery").attr("action","${rc.contextPath}/sponsor/approveDifficultStudent/opt-query/approveDifficultStudentList.do");
		$("#approveStudentInfoQuery").submit();
	}
	
	
	//全选复选框
		function selectAll(){
			var checklist = $("input[name='info']");
			if(document.getElementById("checkAll").checked){
				for(var i=0;i<checklist.length;i++){
					checklist[i].checked = 1;
			   } 
			}else{
				for(var j=0;j<checklist.length;j++){
					checklist[j].checked = 0;
			  	}
			}
		}
	 
	
	    //通过，拒绝操作
		function passStatus(status){
			var array = $("input:checkbox[name=info]:checked'");
			if( array == undefined || array.length < 1){
			   if(status=='pass'){
				comp.message("请选择要通过的信息！","error","2000");
				return;
			   }else{
			    comp.message("请选择要拒绝的信息！","error","2000");
				return;
			   }
			}else{
				var infoIds = new Array();
				for(var i=0;i<array.length;i++){
				infoIds.push(array[i].value);
			}
			   if(status=='pass'){
			       doPass(infoIds);
			   }
			   var form = document.createElement("form");
			   form.action="${rc.contextPath}/sponsor/studentAwardApprove/opt-update/approveDifficultStudentInfo.do?ids="+infoIds+"&status="+status;
			   form.method = "post";  
			   document.body.appendChild(form);  
			   form.submit();
	 	}
    }
    
    
           //批量审批
			function selectAllbox(mainbox,boxname){
				comp.selectAllCheckbox(mainbox,boxname);
			}
			
			function editMulProcess(){
				$("#approveStudentInfoQuery").attr("action","${rc.contextPath}/sponsor/difficultStudentApproves/opt-query/checkedApproveList.do").submit();
			}
			
			function submitMulProcess(boxname,selectedBox){
				
	 			if(!comp.checkboxSelectValidator(boxname)){
					comp.message('请选择要审批的信息 !');
	 			}else{
					comp.getCheckboxValue(boxname,selectedBox);
					var param = $("#selectedBox").val().replace(",","_")
					$.ajax({
							url:"${rc.contextPath}/apw/amsapprove/opt-add/checkNextTaskApprover.do",
							async:false,
							cache:false,
							type:'POST',
							data:{boxes:param},
							success: function(data){
								var parsedJson = jQuery.parseJSON(data); 
								var nextApproverArray = parsedJson.nextApproverList;
								if(parsedJson.resultFlag=="deprecated"){
										$.sticky("审批流已弃用", {autoclose:5000, position:"top-right", type:"st-error"});
								 }else if(parsedJson.resultFlag=='mulApprover') {
								 		comp.message("下一节点有多个办理人，请执行单次审核 !");
								 }else if(parsedJson.resultFlag=='oneApprover' || parsedJson.resultFlag=='singleApprove'){
										editMulProcess();
								 }
						  }
					}); 
	 			}
			}
			
		function  setConfigTimeValue(bengDate,endDate,code){

	    //alert("["+bengDate+"至"+endDate+"]"); 
	    //if(bengDate.length()>0 && endDate.length()>0){
	    $("#time").html("<font color='red'><b>["+bengDate+"至"+endDate+"]</b></font>");
	    //}	    
      }
      
      
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
    
    
</script>
</body>
</html>