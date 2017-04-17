<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <script src="${rc.contextPath}/js/jquery.form.js"></script> 
        <script type="text/javascript" src="${rc.contextPath}/js/common/cascadecommon.js"></script>
    </head>
    <body>
		<div id="contentwrapper">
   		<div class="main_content">   
    	   <div class="row-fluid">	
    		<form  id="leagueSelectQuery"  action="${rc.contextPath}/league/leagueSelect/opt-query/pageQueryMemebrSelect.do" method="post">
				<div class="span12">
					<#if !studentInfo??>			
						<div class="row-fluid"> 
						 <div class="span4">
							<span class="formTitle">学院</span>
							<select size="1" id="college" name="college.id"<#if teacherOrgId??> disabled class="span6 notClear"</#if> aria-controls="dt_gal" class="span6" onChange="cascade.changeCollage('college', 'majorId');">
								<option value="" >请选择</option>
								<#if collegeList??>
									<#list collegeList as c>
										<#if teacherOrgId?? && c.id==teacherOrgId>
											<option value="${c.id}" selected="selected" >${c.name?html}</option>
										<#elseif unit?? && unit.college?? && unit.college.id?? && c.id==unit.college.id>
											<option value="${c.id}" selected="selected">${c.name?html}</option>
										<#else>
											<option value="${c.id}">${c.name?html}</option>
										</#if>
									</#list>
								</#if>
							</select>
							
						</div>
						<div class="span4">
							<span class="formTitle">专业</span>
							<select size="1" id="majorId" name="major.id"  class="span6 emptySelect" aria-controls="dt_gal"  onChange="cascade.changeMajor('majorId', 'classId');">
								<option value="" >请选择</option>
								<#if majorList ?? >
									<#list majorList as m>
										<#if unit?? && unit.major?? &&  unit.major.id == m.id >
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
							
							<select size="1" id="classId" name="classId.id"  class="span6 emptySelect" aria-controls="dt_gal"  >
								<option value="" >请选择</option>
								<#if classList ?? >
									<#list classList as c>
										<#if unit?? && unit.classId?? && unit.classId.id == c.id >
											<option value="${c.id}" selected >${c.className}</option>
										<#else>
											<option value="${c.id}">${c.className}</option>
										</#if>
									</#list>
								</#if>
							</select>
						</div>
					</div>
					</#if>
					<div class="row-fluid"> 
						 <div class="span4">
						 	<span class="formTitle">学号</span>
						 	<input class="span6" id="stuNumber" name="stuInfo.stuNumber" <#if studentInfo??>value="${studentInfo.stuNumber!''}"<#elseif member?? && member.stuInfo??>value="${member.stuInfo.name!''}" </#if>/>
						 </div>
						 <div class="span4">
						 	<span class="formTitle">姓名</span>
						 	<input class="span6" id="stuName" name="stuInfo.name" <#if studentInfo??>value="${studentInfo.name!''}"<#elseif member?? && member.stuInfo??>value="${member.stuInfo.name!''}" </#if> />
						 </div>
						 <div class="span4">
						 	<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
						 
						   	<input type="button" class="btn btn-info"  onclick="selectStudentInfo();" value="查 询"/>
			              	<input type="button" class="btn btn-info"  onclick="comp.clearForm('leagueSelectQuery')" value="清 空"/>
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
											 	
					              			<#if user_key.optMap['export']??>
				              						<div class="input-append">
				            							<input id="exportSize" type="hidden" name="exportSize" class="span3"  value="400" title="excel单页条数" />
				            							<button class="btn btn-info" type="button" onclick="exportLeagueMemberManage()">Excel导出</button>
				              						</div>
			              					</#if>	
										</#if>	
										       
				                    </div>
				                </div>
				            </div>
				        </div>
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl" >
							<thead>
								<tr>
									<th width="5%">序号</th>
									<th width="7%">姓名</th>
									<th width="10%">学号</th>
									<th width="10%">政治面貌</th>
									<th width="10%">团干培训时间</th>
									<th width="10%">入党推优时间</th>
									<th width="10%">是否获得荣誉</th>
									<th width="8%">班级人数</th>
									<th width="8%">团员人数</th>
									<th width="8%">党员人数</th>
									<th width="12%">预备党员人数</th>
								</tr>
							</thead>
							<tbody>
								<#if page??>	
									<#list page.result as p>
										<tr>
											<td class="autocut">${p_index+1}</td>
											<td class="autocut tipTag" data="学院：${(p[0].college.name)!''}<br/>专业：${(p[0].major.majorName)!''}<br/>班级：${(p[0].classId.className)!''}<br/>班主任：${(p[0].headmaster.name)!''}<br/>团支书：${(p[0].secretary.name)!''}<br/>">
												<a href="${rc.contextPath}/league/leagueSelect/opt-view/leagueMemberView.do?id=${(p[1].id)!''}" target="_blank" title="查看团员信息"> ${(p[1].stuInfo.name)!""}</a></td>											
											<td class="autocut">${(p[1].stuInfo.stuNumber)!""}</td>
											<td class="autocut">${(p[1].memberType.name)!""}</td>
											<td class="autocut"><#if p[1].trianingTime??>${(p[1].trianingTime?string('yyyy-MM-dd'))!""}</#if></td>
											<td class="autocut"><#if p[1].recommonedTime??>${(p[1].recommonedTime?string('yyyy-MM-dd'))!""}</#if></td>
											<td class="autocut"><#if p[1].isHaveHonor??>${(p[1].isHaveHonor.name)!""}<#else>否</#if></td>
											<td class="autocut">${(p[0].stunums)!""}</td>
											<td class="autocut">${(p[0].membernums)!""} </td>
											<td class="autocut">${(p[0].partyNums)!""} </td>
											<td class="autocut">${(p[0].probationaryNums)!""} </td>
										</tr>
									</#list>
								 </#if> 
							</tbody>
						</table>
						 <#assign pageTagformId="leagueSelectQuery"/>
						  <!--用于用户导出 -->
						<input id="pageTotalCount" name="pageTotalCount" type="hidden"  value="${page.totalCount}"/>
						 <#include "/page.ftl">
					</div>
				</div>
			</div> 
		</div> 
	</div>
</div>
<div class="modal hide fade" id="exportdemoManage">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3 id="title1">导出团员管理信息</h3>
	</div>
	<div class="modal-body" id="export_leagueMemberManage">
		
	</div>
	<div class="modal-footer">
		<a href="#" class="btn" data-dismiss="modal">关闭</a>
	</div>
</div>

<#-- 脚本开始 -->
<script>
	
	//查询
	function selectStudentInfo(){
	    $("#leagueSelectQuery").attr("action","${rc.contextPath}/league/leagueSelect/opt-query/pageQueryMemebrSelect.do");
		$("#leagueSelectQuery").submit();
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
	function exportLeagueMemberManage(){
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
				comp.showModal("exportdemoManage","500px","-250px 0 0 -250px");
				$("#export_leagueMemberManage").load("${rc.contextPath}/league/leagueSelect/opt-query/nsm/exportLeagueMemberManageList.do?pageTotalCount="+pageTotalCount+"&exportSize="+exportSize);
			}
		}
		
		function exportDate(exportSize,exportPage){
		
			$("#leagueSelectQuery").attr("action","${rc.contextPath}/league/leagueSelect/opt-query/exportLeagueMemberManage.do");
			var fo=$("#leagueSelectQuery");
			if($("#leagueMemberManage_exportPage").length==0){
				fo.append($("<input>",{
					id:'leagueMemberManage_exportSize',
					type:'hidden',
					name:'leagueMemberManage_exportSize',
					val:exportSize
				}));
				fo.append($("<input>",{
					id:'leagueMemberManage_exportPage',
					type:'hidden',
					name:'leagueMemberManage_exportPage',
					val:exportPage
				}));
			}else{
				$("#leagueMemberManage_exportSize").val(exportSize);
				$("#leagueMemberManage_exportPage").val(exportPage);
			}
			fo.submit();
		}
		
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