<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script type="text/javascript" src="${rc.contextPath}/js/common/cascadecommon.js"></script>
</head>
<body>
<div id="contentwrapper">
    <div class="main_content">   
    	   <div class="row-fluid">	
    		<form  id="volunteerApplyForm"  action="${rc.contextPath}/volunteer/applyApprove/opt-query/getSubmitApplyList.do" method="post">
				<div class="span12">
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">学院</span>
						    <select size="1"  disabled id="collegeId"  aria-controls="dt_gal" class="span6 notClear" onchange="cascade.changeCollage('collegeId','majorId','classId');" >
								<option value="">请选择..</option>
								<#if collegeList ??>
									<#list collegeList as c>
										<#if  vbm ?? && vbm.stuInfo?? && vbm.stuInfo.college ?? &&  vbm.stuInfo.college.id?? &&vbm.stuInfo.college.id == c.id >
											<option  value="${c.id}" selected="selected">${c.name?html}</option>
										<#else>
											<option value="${c.id}" >${c.name?html}</option>
										</#if>
									</#list>
								</#if>
						    </select>
						    <input type="hidden" name="stuInfo.college.id" <#if teacherOrgId??>value="${teacherOrgId}"</#if>/>
						</div>
						 <div class="span4">
								<span class="formTitle">专业</span>
							    <select size="1" id="majorId" name="stuInfo.major.id" aria-controls="dt_gal" class="span6" onChange="cascade.changeMajor('majorId', 'classId');">
									<option value="" >请选择</option>
									<#if majorList ?? >
										<#list majorList as m>
											<#if vbm?? && vbm.stuInfo??  && vbm.stuInfo.major?? &&  vbm.stuInfo.major.id == m.id >
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
							    <select size="1"  id="classId" name="stuInfo.classId.id" class="span6 emptySelect" aria-controls="dt_gal"  >
									<option value="" >请选择</option>
									<#if classList ?? >
										<#list classList as c>
											<#if vbm?? && vbm.stuInfo?? && vbm.stuInfo.classId?? && vbm.stuInfo.classId.id == c.id >
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
							   	<input id="stuInfo.name" name="stuInfo.name" class="span6" <#if vbm?? && vbm.stuInfo?? > value="${((vbm.stuInfo.name)!'')?html}"</#if>/>
						 </div>
						 <div class="span4">
								<span class="formTitle">学号</span>
							   	<input id="stuInfo.stuNumber" name="stuInfo.stuNumber" class="span6" <#if vbm?? && vbm.stuInfo??>value="${((vbm.stuInfo.stuNumber)!'')?html}"</#if>/>
						 </div>
						 <div class="span4">
		              			<span class="formTitle">审核状态</span>
							    <select size="1"  id="approveResult" name="approveResult.id" class="span6" aria-controls="dt_gal"  >
									<option value="" >请选择</option>
									<#if applyApproveList ?? >
										<#list applyApproveList as a>
											<#if vbm?? && vbm.approveResult?? && vbm.approveResult.id??&& vbm.approveResult.id== a.id >
												<option value="${a.id}" selected >${a.name}</option>
											<#else>
												<option value="${a.id}">${a.name}</option>
											</#if>
										</#list>
									</#if>
								</select>
		            	 </div>
					</div>
					<div class="btnCenter">
							<input type="button" class="btn btn-info"  onclick="selectStudentInfo();" value="查 询"/>
		              		<input type="button" class="btn btn-info"  onclick="comp.clearForm('volunteerApplyForm')" value="清 空"/>
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
											<#if user_key.optMap['approve']??>
												<#-- <button class="btn btn-info" type="button"  onclick="javascript:passStatus('PASS')">
									                                        通 过                                
									             </button>
									              &nbsp;&nbsp;           
						                         <button class="btn btn-info" type="button"  onclick="javascript:passStatus('REJECT')">
						                                                                            拒 绝
						                         </button>-->
											</#if>
										</#if>
										
									</div>
								</div>
							</div>
						</div>
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
							<thead>
								<tr>
								    <#--<th width="4%"><input id="_totalSelect" type="checkbox"/></th>-->
								    <th width="4%">序号</th>
								    <th width="8%">姓名</th>
								    <th width="8%">学号</th>
									<th width="10%">学院</th>
									<th width="10%">专业</th>
									<th width="10%">班级</th>
									<th width="10%">志愿者培训</th>
									<th width="10%">志愿者荣誉</th>
									<th width="8%">志愿者审核</th>
									<th width="4%">操作</th>
								</tr>
							</thead>
							<tbody>
							<#if page??>	
								<#list page.result as p>
								<tr>		
								    <#--<td><#if p.approveResult?? && p.approveResult.code=="NOT_APPROVE"><input type="checkbox"  name="infoCheck" value="${p.id!""}"/></#if></td>-->
								    <td>${p_index+1}</td>
								    <td class="autocut"><a href="${rc.contextPath}/volunteer/view/opt-view/volunteerView.do?id=${(p.id)!''}" target="_blank" title="查看志愿者信息"> ${p.stuInfo.name!""}</a></td>											
								    <td class="autocut">${p.stuInfo.stuNumber!""}</td>
									<td class="autocut">${p.stuInfo.college.name!""}</td>
									<td class="autocut">${p.stuInfo.major.majorName!""}</td>
									<td class="autocut">${p.stuInfo.classId.className!""}</td>
									<td class="autocut"><#if p.isTraining??>${p.isTraining.name!""}</#if></td>
									<td class="autocut"><#if p.isHavehonor??>${p.isHavehonor.name!""}</#if></td>
									<td class="autocut"><#if p.approveResult??>${p.approveResult.name!""}</#if></td>
									<td class="autocut">
									 	<#if user_key.optMap['approve']?? &&p.approveResult?? && p.approveResult.code=="NOT_APPROVE">
									   		<a href="${rc.contextPath}/volunteer/applyApprove/opt-update/editApprove.do?id=${p.id}" class="sepV_a" title="审核志愿者申请信息"><i class="icon-check"></i></a>
										</#if>
                                    </td>
								</tr>
								</#list>
							 </#if> 
							</tbody>
						</table>
						 <#assign pageTagformId="volunteerApplyForm"/>
						 <input id="pageTotalCount" name="pageTotalCount" type="hidden"  value="${page.totalCount}"/>
						 <#include "/page.ftl">
					</div>
				</div>
			</div> 
		</div> 
	</div>
</div>
<script>
	
	//全选复选框
	jQuery("#_totalSelect").click(function(){
	
		if($("#_totalSelect").attr("checked")) {
			$("input[name='infoCheck']").attr("checked",true);
		}else {
	    	$("input[name='infoCheck']").attr("checked",false);
	    }	
	});
	
	jQuery("input[name='infoCheck']").click(function() {
		$("#_totalSelect").attr("checked",false);
	});
	 //通过，拒绝操作
		function passStatus(status){
			
			var array = $("input:checkbox[name='infoCheck']:checked'");
			
			if( array == undefined || array.length < 1){
			   if(status=='PASS'){
					comp.message("请选择要通过的信息！","error","2000");
					return;
			   }else{
				    comp.message("请选择要拒绝的信息！","error","2000");
					return;
			   }
			}else{
				var str="";
			  if(status=='PASS'){
			  	str="确定要批量通过吗？";
			  }else{
			  	 str="确定要批量拒绝吗？";
			  }
				comp.confirm(str, function(result) {
		
		        	if(!result)
		        		return;  
		        	var infoIds = new Array();
				   for(var i=0;i<array.length;i++){
						infoIds.push(array[i].value);
				   }
				   if(status=='pass'){
				       doPass(infoIds);
				   }
				   var form = document.createElement("form");
				   form.action="${rc.contextPath}/volunteer/volunteerMutiApprove/opt-approve/volunteerMutiApprove.do?ids="+infoIds+"&status="+status;
				   form.method = "post";  
				   document.body.appendChild(form);  
				   form.submit();
				}); 
				   
	 	   }
    }
    
	 
	 //查询
	function selectStudentInfo(){
		$("#volunteerApplyForm").submit();
	}
  
</script>
</body>
</html>