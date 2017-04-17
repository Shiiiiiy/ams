<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
	    <script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
	    <!-- animated progressbars -->
	    <script src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script>
	    <script src="${rc.contextPath}/js/jquery.form.js"></script>
		<script>
		    var attachFlag;
			// 多选学生
			function selectStudentCheck(){
				_queryStudentCheckAll($("#members").val());
			}
			//审核通过
	        function pass(memberIds){
	        	if(confirm("确定要审核通过吗？")){
				   var activityId=$("#activityId").val();
	        	   $.ajax({
							url:'${rc.contextPath}/activity/manage/opt-add/approveActivityMember.do',
							async:false,
							cache: false,
							type: "POST",
							data:{activityId : activityId, memberIds : memberIds, approveStatus : '2c9d5081506a167301506a3ac0ad0002', suggest : ''},
							success: function(data){
								if(data){
							 	     comp.message(data,"error");
							 	   }else{
							 	     $("#"+memberIds+"_td").html("通过");
							 	     if($("#"+memberIds+"_reject").attr("title")){
								 	     $("#"+memberIds+"_pass").hide();
								 	     $("#"+memberIds+"_reject").show();
							 	     }else{
							 	         $("#"+memberIds+"_pass").attr("onclick","reject("+memberIds+")");
							 	         $("#"+memberIds+"_pass").attr("title","拒绝");
							 	         $("#"+memberIds+"_pass").attr("id",memberIds+"_reject");
							 	     }
							 	     comp.message("参与人员维护成功!","info");
							 	     submit();
							 	   }
						    }
						});
	        	}
	        }
			//审核拒绝
			function reject(memberIds){
			    if(memberIds!=null && memberIds!=undefined){
			    $("#memberIds").val(memberIds);
					comp.showModal("approveMember","600px","-200px 0 0 -300px");
				}
	        }
	        function clear(){
        		$("#memberIds").val("");
				$("#suggest").val("");
	        }
			function approveSubmit(){
			     //var approveSelect = $("#memberApproveStatus").find("option:selected").text();
			 	 var suggest=$("#suggest").val();
			 	 if(suggest){
				 	 if(confirm("确定要提交吗？")){
						 var memberIds=$("#memberIds").val();
					 	 var activityId=$("#activityId").val();
					 	 comp.hideModal("approveMember","600px","-200px 0 0 -300px");
					 	 $("#memberIds").val("");
					 	 $("#suggest").val("");
						 $.ajax({
							url:'${rc.contextPath}/activity/manage/opt-add/approveActivityMember.do',
							async: false,
							cache: false,
							type: "POST",
							data:{activityId : activityId, memberIds : memberIds, approveStatus : '2c9d5081506a167301506a3b04540003', suggest : suggest},
							success: function(data){
								if(data){
							 	     comp.message(data,"error");
							 	   }else{
							 	     $("#"+memberIds+"_td").html("拒绝");
							 	     if($("#"+memberIds+"_pass").attr("title")){
								 	     $("#"+memberIds+"_pass").show();
							 	         $("#"+memberIds+"_reject").hide();
							 	     }else{
							 	         $("#"+memberIds+"_reject").attr("onclick","pass("+memberIds+")");
							 	         $("#"+memberIds+"_reject").attr("title","通过");
							 	         $("#"+memberIds+"_reject").attr("id",memberIds+"_pass");
							 	     }
							 	     comp.message("参与人员维护成功!","info");
							 	     submit();
							 	   }
						    }
						});
						//$("#activityMemberQuery").attr("action","${rc.contextPath}/activity/manage/opt-query/activityMemberList.do?activityId="+activityId);
					    //$("#activityMemberQuery").submit();
					}
				}else{
					comp.message("审核意见需必填且长度不超过50!","error");
					return false;
				}
			}
			function setMultiEduClassSelectValue(studentIds,names){
			    var activityId=$("#activityId").val();
				 $.ajax({
					url:'${rc.contextPath}/activity/manage/opt-add/addActivityMembers.do',
					async:false,
					cache: false,
					type: "POST",
				    dataType:"text",
					data:{activityId : activityId,studentIds : studentIds},
					success: function(data){
						if(!data){
					 	   comp.message("参与人员维护成功!","info");
					 	   submit();
					    }else if(data=='error'){
					       comp.message("参与人员维护失败，请联系系统管理员!","error");
					    }
				    }
				});
				$("#activityMemberQuery").attr("action","${rc.contextPath}/activity/manage/opt-query/activityMemberList.do?activityId="+activityId);
				$("#activityMemberQuery").submit();
			}
			//导入
			function importActivityMember(){   
			    var activityId=$("#activityId").val();
				window.location.href="${rc.contextPath}/activity/manage/opt-import/activityMemberImport.do?activityId="+activityId;
			}
			//复选框
		    function selectAllbox(mainbox,boxname){
			    comp.selectAllCheckbox(mainbox,boxname);
		    }
		    function checkBox(memberId,boxname){
		        if($("#"+memberId+"_checkbox").attr("checked")!='checked'){
		            $("#totalCheck").removeAttr('checked');
		        }else{
			        for(i=0;i<$("input[name='"+boxname+"']").length;i++){
				        if(!$("input[name='"+boxname+"']")[i].checked){
	                        return;
				        }
				        if(i==$("input[name='"+boxname+"']").length-1){
			            	$("#totalCheck").attr('checked','checked');
				        }
			        }
		        }
		    }
			//删除
			function del(boxname,selectedBox){
			    var activityId=$("#activityId").val();
			    if(!comp.checkboxSelectValidator(boxname)){
				    comp.message('请选择要删除的学生 !');
 			    }else{
					comp.getCheckboxValue(boxname,selectedBox);
					var param = $("#selectedBox").val();
					//comp.confirm("确定要删除这些数据吗？",function(r){
					if(confirm("确定要删除这些数据吗？")){
						$.ajax({
								url:"${rc.contextPath}/activity/manage/opt-delete/deleteActivityMember.do",
								async:false,
								cache:false,
								type:'POST',
								dataType:'text',
								data:{ids:param,activityId:activityId},
								success: function(data){
									if(data=='success'){
									    comp.message('删除成功 !',"info");
									}else{
									    comp.message('删除失败 !',"error");
									}
							    }
						}); 
						$("#activityMemberQuery").attr("action","${rc.contextPath}/activity/manage/opt-query/activityMemberList.do?activityId="+activityId);
					    $("#activityMemberQuery").submit();
					}
					
	 			}
			}
			function submit(){
			    var activityId=$("#activityId").val();
		        $("#activityMemberQuery").attr("action","${rc.contextPath}/activity/manage/opt-query/activityMemberList.do?activityId="+activityId);
				$("#activityMemberQuery").submit();
			}
		</script>
    </head>
    <body>
		<div id="contentwrapper">
		    <div class="main_content">  
		    	<div class="row-fluid">
		    		<form id="activityMemberQuery" method="post" action="">
						 <div class="span12">
						 	<div class="row-fluid">
						  		<div class="span4">
									<span class="formTitle">学院</span>
								    <select size="1" id="collegeId" name="member.college.id" aria-controls="dt_gal" class="span7" onchange="cascade.changeCollage('collegeId','majorId','classId');" >
										<option value="">请选择..</option>
										<#if collegeList ??>
											<#list collegeList as c>
												<#if  activityMember ?? && activityMember.member ?? && activityMember.member.college ?? && activityMember.member.college.id == c.id >
													<option  value="${c.id}" selected="selected">${c.name!""?html}</option>
												<#else>
													<option value="${c.id}" >${c.name!""?html}</option>
												</#if>
											</#list>
										</#if>
								    </select>
							    </div>
								<div class="span4">
									<span class="formTitle">&#12288;&#12288;专业</span>
									<select size="1" id="majorId" name="member.major.id" aria-controls="dt_gal" class="span7 emptySelect"  onchange="cascade.changeMajor('majorId','classId');">
										<option value="" >请选择..</option>
										<#if majorList ?? >
											<#list majorList as m>
												<#if activityMember ?? && activityMember.member ?? && activityMember.member.major ?? && activityMember.member.major.id == m.id >
													<option value="${m.id}" selected >${m.majorName?html}</option>
												<#else>
													<option value="${m.id}">${m.majorName?html}</option>
												</#if>
											</#list>
										</#if>
									</select>
								 </div>
								 <div class="span4">
									 <span class="formTitle">&#12288;&#12288;班级</span>
									 <select size="1" id="classId" name="member.classId.id" aria-controls="dt_gal" class="span7 emptySelect">
										<option value="" >请选择..</option>
										<#if classList ?? >
											<#list classList as c>
												<#if activityMember ?? && activityMember.member ?? && activityMember.member.classId ?? &&  activityMember.member.classId.id == c.id >
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
									<input id="member" name="member.name" class="span7" maxlength="20" <#if activityMember ?? && activityMember.member ??>value="${activityMember.member.name!""?html}"</#if> />
								</div>
								<div class="span4">
									<span class="formTitle">审核状态</span>
									<select size="1" id="approveStatus" name="approveStatus.id" aria-controls="dt_gal" class="span7">
										 <option value="" >请选择..</option>
											 <#list applyApproveList as a>
												 <#if activityMember ?? && activityMember.approveStatus?? && activityMember.approveStatus.id == a.id >
													<option value="${a.id}" selected >${a.name}</option>
												 <#else>
													<option value="${a.id}">${a.name}</option>
												 </#if>
											 </#list>
									</select>
								</div>
							    <div class="span4">
					    			<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
				                    <button class="btn btn-info" type="submit" onclick="submit()">查 询</button>
				                    <button class="btn btn-info" type="button" onclick="comp.clearForm('activityMemberQuery');">清 空</button>
			                    </div>	 	
						    </div>
				         </div>
		    		</form>
                        <input type="hidden" id="members" value="${members!""}"/>
	           			<input type="hidden" id="activityId" name="activityId" value="${activityId!""}" />
	           			<input type="hidden" id="selectedBox" name="selectedBox"/>
	           		<div class="row-fluid">
	           			<div class="span12">
	           				<h5 class="heading"></h5>
	           				<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
				                <#if user_key.optMap?? && activity ?? && (!(activity.summaryStatus ??) || activity.summaryStatus!='SUBMIT')>
	           				    <div class="row">
	           						<div class="span10">
	           							<div class="dt_actions">
	           								<div class="row-fluid">
		           									<#if user_key.optMap['add']??>
						                            	<button class="btn btn-info" type="button"  onclick="selectStudentCheck();">新 增</button>
					                            	</#if>
	           								</div>
	           							</div>
	           							<div class="dt_actions">
					                       <div class="row-fluid">
												   <#if user_key.optMap['import']??>
													   <button class="btn btn-info" type="button"  onclick="importActivityMember();">导 入</button>
												   </#if>
										   </div>
										</div>
										<div class="dt_actions">
					                        <div class="row-fluid">
												    <#if user_key.optMap['del']??>
													    <button class="btn btn-info" type="button"  onclick="del('studentId','selectedBox');">删 除</button>
												    </#if>
										    </div>
	           						    </div>
	           						</div>   
	           					</div>
				                </#if>
	           				    <table class="table table-bordered table-striped tablecut" id="smpl_tbl">
	           						<thead>
										<tr>
										    <th width="6%">
												<#if activity ?? && (!(activity.summaryStatus ??) || activity.summaryStatus!='SUBMIT')>
													<div align="center"><input type="checkbox" id="totalCheck"  onclick="selectAllbox('totalCheck','studentId')"/></div>
												<#else>
													序号
												</#if>
											</th>
											<th width="10%">姓名</th>
											<th width="11%">学号</th>
											<th width="6%">性别</th>
											<th width="12%">学院</th>
											<th width="13%">专业</th>
											<th width="14%">班级</th>
											<th width="12%">联系方式</th>
											<th width="10%">审核状态</th>
											<#if activity ?? && (!(activity.summaryStatus ??) || activity.summaryStatus!='SUBMIT')>
											<th width="6%">操作</th>
											</#if>
										</tr>
									</thead>
	           						<tbody>
	           							<#if page??>	
											<#list page.result as p>
											<#if p.member ??>
												<tr>
												    <#if activity ?? && (!(activity.summaryStatus ??) || activity.summaryStatus!='SUBMIT')>
											        	<td class="autocut"><div align="center"><#if p.registraForm ?? && p.registraForm.id=='402890ef5065538001506570430c000b'><input type="checkbox" id=${p.member.id}_checkbox onclick="checkBox('${p.member.id}','studentId')" name="studentId" value="${(p.member.id!"")?html}"/></#if></div></td>
													<#else>
														<td class="autocut">${p_index+1}</td>
													</#if>
													<td class="autocut">${(p.member.name!"")?html}</td>
													<td class="autocut">${(p.member.stuNumber!"")?html}</td>
													<td class="autocut"><#if p.member.genderDic ?? >${(p.member.genderDic.name!"")?html}</#if></td>
													<td class="autocut"><#if p.member.college ??>${(p.member.college.name!"")?html}</#if></td>
													<td class="autocut"><#if p.member.major ?? >${(p.member.major.majorName!"")?html}</#if></td>
													<td class="autocut"><#if p.member.classId ??>${(p.member.classId.className!"")?html}</#if></td>
													<td class="autocut">${(p.member.phone1!"")?html}</td>
													<td class="autocut" id=${p.member.id}_td><#if p.approveStatus ??>${(p.approveStatus.name!"")?html}</#if></td>
													<#if activity ?? && (!(activity.summaryStatus ??) || activity.summaryStatus!='SUBMIT')>
														<td class="autocut">
															<#if user_key.optMap?? && user_key.optMap['approve']??>
															   <#if p.registraForm ?? && p.registraForm.id!='402890ef5065538001506570430c000b'>
																   <#if p.approveStatus ?? && p.approveStatus.id!='2c9d5081506a167301506a3ac0ad0002'>
																   		<a href="###" onclick="pass('${p.member.id}')" title="通过" id=${p.member.id}_pass><i class="icon-check"></i></a>
																   </#if>
																   <#if p.approveStatus ?? && p.approveStatus.id!='2c9d5081506a167301506a3b04540003'>
																   		<a href="###" onclick="reject('${p.member.id}')" title="拒绝" id=${p.member.id}_reject><i class="icon-ban-circle"></i></a>
																   </#if>
															   </#if>
															 </#if>   
														</td>
													</#if>
												</tr>
											</#if>
											</#list>
										 </#if> 
	           						</tbody>
	           				    </table>
								<#assign pageTagformId="activityMemberQuery"/>
								<#include "/page.ftl">
	           				</div>
	           			</div>
	           		</div>
		    	</div> 
			</div>
		</div>
		<#-- 弹出框脚本开始 -->
        <#include "/activity/info/activityInfo/approveMember.ftl"> 
		<#-- 学生选择多选组件的引入-->
        <#include "/comp/student/queryStudentAllCheckBoxModal.ftl"> 
	</body>
</html>