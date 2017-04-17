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
    		<form  id="leagueMemberQuery"  action="${rc.contextPath}/league/leagueManage/opt-query/pageQueryLeagueMember.do?classIdText=${unit.classId.id}" method="post">
				<div class="span12">			
				
					<div class="row-fluid"> 
						
						<div  class="span4">
							
							<span class="formTitle">学院：  <#if unit.college??>${unit.college.name}</#if>      </span>
							
						</div>
						<div  class="span4">
							<span class="formTitle">专业：<#if unit.major??>${unit.major.majorName}  </#if></span>    
						</div>
						<div  class="span4">
							<span class="formTitle">班级：<#if unit.classId??>${unit.classId.className}</#if></span>	
						</div>
						
						
					</div>
					<div class="row-fluid">
						<div  class="span4">
							<span class="formTitle">班主任：<#if unit.headmaster??>${unit.headmaster.name}</#if></span>
						</div>
						
						<div  class="span4">
							<span class="formTitle">团支书：<#if unit??&& unit.secretary?? && unit.secretary.name??>${unit.secretary.name}</#if></span>
						</div>
						<div  class="span4">
							<span class="formTitle">团员数：<#if unit.membernums??>${unit.membernums}</#if></span>
						</div>
					</div>
					<div class="row-fluid">
						<div  class="span4">
							<span class="formTitle">党员数：<#if unit.partyNums??>${unit.partyNums}</#if></span>
						</div>
						<div  class="span4">
							<span class="formTitle">预备党员数：<#if unit.probationaryNums??>${unit.probationaryNums}</#if></span>
						</div>
					</div>
					<div class="row-fluid">
						 <div class="span4">
						 	<span class="formTitle">学号</span>
						 	<input class="span6" id="stuNumber" name="stuInfo.stuNumber"<#if member?? && member.stuInfo??>value="${(member.stuInfo.stuNumber)!''}"</#if>/>
						 </div>
						 <div class="span4">
						 	<span class="formTitle">姓名</span>
						 	<input class="span6" id="stuName" name="stuInfo.name" <#if member?? && member.stuInfo??>value="${(member.stuInfo.name)!''}"</#if>/>
						 </div>
						 <div>
		             		 	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" class="btn btn-info"  onclick="selectStudentInfo();" value="查 询"/>
		              			<input type="button" class="btn btn-info"  onclick="comp.clearForm('leagueMemberQuery')" value="清 空"/>
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
											 	<#if user_key.optMap['add']??>
					              						<div class="input-append">
													 			<button class="btn btn-info" type="button" id="add-button">新 增</button>&nbsp;&nbsp;
					              						</div>
				              				 	</#if>
				              				 	
					                    		<#if user_key.optMap['import']??>
					              						<div class="input-append">
				            								<button class="btn btn-info" type="button" onclick="importMember()">导 入</button>&nbsp;&nbsp;
					              						</div>
				              				    </#if>											 	
				              				    <!--<#if user_key.optMap['export']??>
					              						<div class="input-append">
					            							<input id="exportSize" type="hidden" name="exportSize" class="span3"  value="400" title="excel单页条数" />
					            							<button class="btn btn-info" type="button" onclick="exportLeagueMember()">Excel导出</button>&nbsp;&nbsp;
					              						</div>
				              					</#if>	-->
										</#if>	
										<div class="input-append">
												 <input class="btn btn-info" type="button" onclick="javascript:window.location.href='${rc.contextPath}/league/leagueManage/opt-query/pageQueryLeagueUnit.do'" value="返 回"/>
										</div>
										       
				                    </div>
				                </div>
				            </div>
				        </div>
				        
				        
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl" >
							<thead>
								<tr>
									<th width="5%">序号</th>
									<th width="9%">姓名</th>
									<th width="10%">学号</th>
									<th width="6%">性别</th>
									<th width="9%">是否培训</th>
									<th width="10%">是否推优</th>
									<th width="12%">政治面貌</th>
									<th width="10%">入团时间</th>
									<th width="10%">入党时间</th>
									<th width="9%">团内外职务</th>
									<th width="8%">操作</th>
								</tr>
							</thead>
							<tbody>
								<#if page??>	
									<#list page.result as p>
										<tr>
											<td class="autocut">${p_index+1}</td>
											<td class="autocut"><a href="${rc.contextPath}/league/leagueSelect/opt-view/leagueMemberView.do?id=${(p.id)!''}" target="_blank" title="查看团员信息"> ${(p.stuInfo.name)!""}</a></td>											
											<td class="autocut">${(p.stuInfo.stuNumber)!""}</td>
											<td class="autocut"><#if p.stuInfo.genderDic??>${(p.stuInfo.genderDic.name)!""}</#if></td>
											<td class="autocut"><#if p.isTrianing??>${(p.isTrianing.name)!""}<#else>否</#if></td>
											<td class="autocut"><#if p.isRecommoned??>${(p.isRecommoned.name)!""}<#else>否</#if></td>
											<td class="autocut">${(p.memberType.name)!""}</td>
											<td class="autocut">${(p.joinTime?date)!""}</td>
											<td class="autocut">${(p.partyTime?date)!""}</td>
											<td class="autocut">${(p.leaguePosition)!""}</td>
											<td>
												<#if user_key.optMap??>
													<#if user_key.optMap['update']??  >
												   		<a href="${rc.contextPath}/league/leagueManage/opt-update/editMember.do?id=${p.id}&classIdText=${unit.classId.id}" class="sepV_a" title="编辑团员信息"><i class="icon-edit"></i></a>
													</#if>
													
													<#if user_key.optMap['honorMaintain']??  >
														<a href="${rc.contextPath}/league/leagueManage/opt-honorMaintain/memberHonorList.do?memberId=${p.id}&classIdText=${unit.classId.id}" class="sepV_a" title="维护团员荣誉"><i class="icon-tasks"></i></a>
													</#if>
													<#if user_key.optMap['del']?? && !(secretaryUserId?? && secretaryUserId==p.stuInfo.id)>
												   		<a href="javascript:void(0);" onclick="deleteMember('${(p.stuInfo.name)!""}','${p.id!""}');" class="sepV_a" title="删除团员信息"><i class="icon-trash"></i></a>
													</#if>
												</#if>  												   	
											</td>
										</tr>
									</#list>
								 </#if> 
							</tbody>
						</table>
						 <#assign pageTagformId="leagueMemberQuery"/>
						  <!--用于用户导出 -->
						<input id="pageTotalCount" name="pageTotalCount" type="hidden"  value="${page.totalCount}"/>
						 <#include "/page.ftl">
					</div>
				</div>
			</div> 
		</div> 
	</div>
</div>
<div class="modal hide fade" id="exportdemo">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3 id="title1">导出团员花名册</h3>
	</div>
	<div class="modal-body" id="export_leagueMember">
		
	</div>
	<div class="modal-footer">
		<a href="#" class="btn" data-dismiss="modal">关闭</a>
	</div>
</div>

<#-- 脚本开始 -->
<script>
	
	$(document).ready(function(){
	 
	 	//新增方法 
	 	$("#add-button").click( function () { 
	 		window.location.href="${rc.contextPath}/league/leagueManage/opt-add/editMember.do?classIdText=${unit.classId.id}";
	 	 });
	 	
	});
	
	//删除操作
	function deleteMember(name,id)
	{
		comp.confirm("删除后所关联的荣誉信息将一起被删除,确定要删除【"+name+"】的信息吗？", function(result) {
		
        	if(!result)
        		return;  
    		$.post("${rc.contextPath}/league/leagueManage/opt-del/deleteMember.do", { id: id }, function(data){
    			
    			if(data === "success")
    			{
    				comp.message(name +"删除成功！","info");
    				window.location.href="${rc.contextPath}/league/leagueManage/opt-query/pageQueryLeagueMember.do?classIdText=${unit.classId.id}";
    			}
			    
			   },"text");
		}); 
	}
	//跳转到导入页面
	function importMember(){
			window.location.href="${rc.contextPath}/league/leagueManage/opt-query/toImportPage.do?classIdText=${unit.classId.id}";
	}
	//查询
	function selectStudentInfo(){
		$("#leagueMemberQuery").attr("action","${rc.contextPath}/league/leagueManage/opt-query/pageQueryLeagueMember.do?classIdText=${unit.classId.id}");
		$("#leagueMemberQuery").submit();
	}
	
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
	

	<!--导出-->
	function exportLeagueMember(){
			var pageTotalCount= $("#pageTotalCount").val();
			var exportSize= $("#exportSize").val();
			var patrn=/^[0-9]{1,20}$/; 
			if(exportSize==""){
				comp.message("请输入大于0的正整数","error");
			}else if(!patrn.exec(exportSize)){
				comp.message("请输入大于0的正整数","error");
			}else if(exportSize<1){
				comp.message("请输入大于0的正整数","error");
			}else if(exportSize>10000){
				comp.message("请输入小于10000的正整数","error");
			}else{
				comp.showModal("exportdemo","500px","-250px 0 0 -250px");
				$("#export_leagueMember").load("${rc.contextPath}/league/leagueManage/opt-query/nsm/exportLeagueMemberList.do?pageTotalCount="+pageTotalCount+"&exportSize="+exportSize);
			}
		}
		
		function exportDate(exportSize,exportPage){
		
			$("#leagueMemberQuery").attr("action","${rc.contextPath}/league/leagueManage/opt-query/exportLeagueMember.do?classIdText=${unit.classId.id}");
			var fo=$("#leagueMemberQuery");
			if($("#leagueMember_exportPage").length==0){
				fo.append($("<input>",{
					id:'leagueMember_exportSize',
					type:'hidden',
					name:'leagueMember_exportSize',
					val:exportSize
				}));
				fo.append($("<input>",{
					id:'leagueMember_exportPage',
					type:'hidden',
					name:'leagueMember_exportPage',
					val:exportPage
				}));
			}else{
				$("#leagueMember_exportSize").val(exportSize);
				$("#leagueMember_exportPage").val(exportPage);
			}
			fo.submit();
		}
	
</script>
</body>
</html>