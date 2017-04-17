<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <script type="text/javascript" src="${rc.contextPath}/js/common/cascadecommon.js"></script>
        <!-- multiselect -->
	    <link rel="stylesheet" href="${rc.contextPath}/lib/multiselect/css/multi-select.css" />
		<script src="${rc.contextPath}/lib/multiselect/js/jquery.multi-select.min.js"></script>	
    </head>
    <body>
	  <div id="contentwrapper">
   		<div class="main_content">   
    	   <div class="row-fluid">	
    		<form  id="psychologyInfoQuery"  action="${rc.contextPath}/warning/importPSYCHOLOGY/opt-query/wangingList.do" method="post">
			  <div class="span12">			
				 <div class="row-fluid"> 
					 <div class="span4">
					   <span class="formTitle">学院</span>
						<select size="1" id="college" name="student.college.id" aria-controls="dt_gal" class="span6" onChange="cascade.changeCollage('college', 'major','classId');">
							<option value="" >请选择..</option>
							<#if collegeList??>
								<#list collegeList as c>
									<#if psychologyWarning?? && psychologyWarning.student?? &&  psychologyWarning.student.college?? && c.id==psychologyWarning.student.college.id>
										<option value="${c.id}" selected="selected">${((c.name)!"")?html}</option>
									<#elseif college?? && college.id==c.id>
									    <option value="${c.id}" selected="selected">${((c.name)!"")?html}</option>
									<#else>    
										<option value="${c.id}">${((c.name)!"")?html}</option>
									</#if>
								</#list>
							</#if>
						</select>
					</div>
					<div class="span4">
						<span class="formTitle">专业</span>
						<select size="1" id="major" name="student.major.id" aria-controls="dt_gal" class="span6 emptySelect" onChange="cascade.changeMajor('major', 'classId');">
							<option value="" >请选择..</option>
							<#if majorList ?? >
								<#list majorList as m>
									<#if psychologyWarning?? && psychologyWarning.student?? && psychologyWarning.student.major?? &&  psychologyWarning.student.major.id == m.id >
										<option value="${m.id}" selected >${m.majorName}</option>
									<#else>
										<option value="${m.id}">${m.majorName}</option>
									</#if>
								</#list>
							</#if>
						</select>
					</div>
				
					<div class="span4">
						<span class="formTitle">班级</span>
						<select size="1" id="classId" name="student.classId.id" aria-controls="dt_gal" class="span6 emptySelect" >
							<option value="" >请选择..</option>
							<#if classList ?? >
								<#list classList as c>
									<#if psychologyWarning?? && psychologyWarning.student?? && psychologyWarning.student.classId?? && psychologyWarning.student.classId.id == c.id >
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
					<span class="formTitle">姓名</span>
				    <input id="student.name" name="student.name" class="span6" <#if psychologyWarning?? && psychologyWarning.student??> value="${((psychologyWarning.student.name)!'')?html}"</#if> maxlength="225"/>
				  </div>
					 
				 <div class="span4">
					<span class="formTitle">学号</span>
					<input id="student.stuNumber" name="student.stuNumber" class="span6" value="${((psychologyWarning.student.stuNumber)!'')?html}" maxlength="225"/>
				 </div>		
						
		        <div class="span4">
		        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				    <input type="button" class="btn btn-info"  onclick="selectPsychologyInfo();" value="查 询"/>
                    <input type="button" class="btn btn-info"  onclick="comp.clearForm('psychologyInfoQuery')" value="清 空"/>
			   </div>
			 </div>
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
											<#if user_key.optMap['import']??>
					                            <button class="btn btn-info" type="button" onclick="importPsychologyInfo()">导 入</button>
											</#if>
											<#if user_key.optMap['del']??>
												<button class="btn btn-info" type="button"  onclick="deleteStudent();">删 除</button>
											</#if>
										</#if>	
				                    </div>
				                </div>
				            </div>
				        </div>
				      <form  id="studentDelete"  action="${rc.contextPath}/warning/import/opt-del/deletePsychologyInfo.do" method="post">  
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
							<thead>
								<tr>
									<th width="5%"> 
									<#if user_key.optMap??>
										<#if user_key.optMap['del']??>
											<input type="checkbox" id="totalCheck"  onclick="comp.selectAllCheckbox('totalCheck','psychologyWarningId')"/>
										<#else>
											序号
										</#if>
									 </#if> 
									 </th>
									<th width="7%">姓名</th>
									<th width="6%">性别</th>
									<th width="9%">学号</th>
									<th width="8%">独生子女</th>
									<th width="8%">童年寄养经历</th>
									<th width="10%">心理问题类型评估</th>
									<th width="8%">问题程度评估</th>
									<th width="10%">因心理疾病住院或服药</th>
									<th width="8%">危险行为评估</th>
									<th width="8%">学院关注意见</th>
									<th width="8%">心理中心关注意见</th>
									<th width="7%">操作</th>
								</tr>
							</thead>
							<tbody>
								<#if page??>	
									<#list page.result as p>
										<tr>
											<td> 
											<#if user_key.optMap??>
												<#if user_key.optMap['del']??>
													<input type="checkbox" id="psychologyWarningIds"  name="psychologyWarningId" onclick="onClickSingleCheckbox(this);" value="${p.id!""}"/>
												<#else> 
													${p_index+1}
												</#if>
										    </#if>
									        </td>
											<td class="autocut tipTag" data="学院：${(p.student.college.name)!''}<br/>专业：${(p.student.major.majorName)!''}<br/>班级：${(p.student.classId.className)!''}<br/>">${(p.student.name)!""}</td>
											<td class="autocut">${(p.student.genderDic.name)!""}</td>
											<td class="autocut">${(p.student.stuNumber)!""}</td>
											<td class="autocut">${(p.onlyChild.name)!""}</td>
											<td class="autocut">${(p.childFoster.name)!""}</td>
											<td class="autocut">${(p.psychologyAssessment.name)!""}</td>
											<td class="autocut">${(p.problemAssessment.name)!""}</td>
											<td class="autocut">${(p.isHospitalMedication.name)!""}</td>
											<td class="autocut">${(p.dangerAssessment.name)!""}</td>
											<td class="autocut">${(p.collegeOpinion.name)!""}</td>
											<td class="autocut">${(p.psychologyOpinion.name)!""}</td>
											<td>
											</td>
										</tr>
									</#list>
								 </#if> 
							</tbody>
						</table>
					   </from>
						 <#assign pageTagformId="psychologyInfoQuery"/>
						 <#include "/page.ftl">
					</div>
				</div>
			</div> 
		</div> 
	</div>
</div>
<#-- 脚本开始 -->
<script>
	

	//查询
	function selectPsychologyInfo(){
	    $("#psychologyInfoQuery").attr("action","${rc.contextPath}/warning/importPSYCHOLOGY/opt-query/wangingList.do");
		$("#psychologyInfoQuery").submit();
	}
	
	
	
	//点击checkbox按钮 
	function onClickSingleCheckbox(obj)
	{
		var $subBox = $("input[name='psychologyWarningId']");
		$("#totalCheck").attr("checked",$subBox.length == $("input[name='psychologyWarningId']:checked").length ? true : false);
	}
	
	function deleteStudent()
	{
		var $subBox = $("input[name='psychologyWarningId']");
		var len =  $("input[name='psychologyWarningId']:checked").length ;
		if(len >0)
		{
			comp.confirm("删除选中的心理预警信息，系统将不再保存和备份，确认要删除吗？", function(result) {
            	if(!result)
            		return;  
         		
         		$.ajax({
					url: "${rc.contextPath}/warning/import/opt-del/deletePsychologyInfo.do",
					async:false,
					cache:false,
					type:"POST",
					data:$('#studentDelete').serialize(),
				    success: function(data){
						if(data == "success"){
					       $("#psychologyInfoQuery").submit();
					    }else{
					    	$.sticky("心理预警信息删除失败", {autoclose:5000, position:"top-right", type:"st-error"});
					    	return;
					    }
					}
			   });

			}); 
		}
		else
		{
			comp.message("请选择要删除的心理预警信息!","info");
		}
	}
	
	
	
	function importPsychologyInfo(){
		window.location.href="${rc.contextPath}/warning/import/importPsychologyInfo.ftl";
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