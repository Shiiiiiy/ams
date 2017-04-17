<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
    <script>
    
    <!--显示提示框-->
	$(function(){
		$('.tipTag').poshytip({
			className: 'tip-yellowsimple',
			alignTo: 'target',
			alignX: 'right',
			alignY: 'center',
			offsetX: -20
		});
	});
    
	//导出
	function exportStudentInfo(){
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
			$("#export_studentInfo").load("${rc.contextPath}/student/info/nsm/exportStudentInfoView.do?pageTotalCount="+pageTotalCount+"&exportSize="+exportSize);
		}
	}
	function select(){
			$("#classQuery").attr("action","${rc.contextPath}/student/info/opt-query/listStudent.do");
			$("#classQuery").submit();
	}
	function exportStudentData(exportSize,exportPage){
		$("#classQuery").attr("action","${rc.contextPath}/student/info/opt-export/exportStudentInfo.do");
		var fo=$("#classQuery");
		if($("#studentInfoQuery_exportPage").length==0){
			fo.append($("<input>",{
				id:'studentInfoQuery_exportSize',
				type:'hidden',
				name:'studentInfoQuery_exportSize',
				val:exportSize
			}));
			fo.append($("<input>",{
				id:'studentInfoQuery_exportPage',
				type:'hidden',
				name:'studentInfoQuery_exportPage',
				val:exportPage
			}));
		}else{
			$("#studentInfoQuery_exportSize").val(exportSize);
			$("#studentInfoQuery_exportPage").val(exportPage);
		}
		fo.submit();
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
		
		function clearForm(){
			$("#majorId").attr("value","");
			$("#name").attr("value","");
			$("#stuNumber").attr("value","");
			$("#grade").attr("value","");
			
			if($("#classId option").length>1) {
				var option = $("#classId").get(0).options;
				option.length = 0;
				var nullOption = new Option("请选择", "", false, false);
				option.add(nullOption);
			}
 		 }
	</script>
</head>
<body>
<div id="contentwrapper">
    <div class="main_content">   
    	   <div class="row-fluid">	
    		<form  id="classQuery"  action="" method="post">
				<div class="span12">
				<#if classesList ?? >
				    <div class="row-fluid">
						<div class="span4">
							<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;姓名</span>
							<input id="name" name="name" class="span7" value="${studentInfo.name!""?html}" />
						 </div>
						 <div class="span4">
							<span class="formTitle">学号</span>
							<input id="stuNumber" name="stuNumber" class="span7" value="${studentInfo.stuNumber!""?html}" />
						 </div>
						 <div class="span4">
							<span class="formTitle">性别</span>
							 <select size="1" id="genderDic.id" name="genderDic.id" aria-controls="dt_gal" class="span7">
								<option value="">请选择...</option>
								<#if genderDicList??>
							      <#list genderDicList as g>
									<#if studentInfo ?? && studentInfo.genderDic ?? && studentInfo.genderDic.id == g.id>
											<option  value="${g.id}" selected="selected">${g.name}</option>	
										<#else>
											<option value="${g.id}" >${g.name}</option>
										</#if>
									</#list>
								</#if>
							</select>	
						 </div>
					 	</div>
					    <div class="row-fluid">
					    <div class="span4">
							<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年级</span>
							 <select size="1" id="grade" name="grade" aria-controls="dt_gal" class="span7">
								<option value="">请选择..</option>
								<#if gradeList??>
							      <#list gradeList as g>
									<#if studentInfo ?? && studentInfo.grade ?? && studentInfo.grade == g>
											<option  value="${g}" selected="selected">${g}</option>	
										<#else>
											<option value="${g}" >${g}</option>
										</#if>
									</#list>
								</#if>
							</select>	
						 </div>
				        <div class="span4">
							<span class="formTitle">班级</span>
							<select size="1" id="classId" name="classId.id" aria-controls="dt_gal" class="span7">
								<option value="" >请选择..</option>
									<#list classesList as c>
										<#if studentInfo ?? && studentInfo.classId ?? &&  studentInfo.classId.id == c.id >
											<option value="${c.id}" selected >${c.className?html}</option>
										<#else>
											<option value="${c.id}">${c.className?html}</option>
										</#if>
									</#list>
							</select>
						</div>
						<div class="span4">
							<span class="formTitle">民族</span>
							 <select size="1" id="national" name="national" aria-controls="dt_gal" class="span7">
								<option value="">请选择..</option>
								<#if nationDicList??>
							      <#list nationDicList as a>
									<#if studentInfo ?? && studentInfo.national?? && studentInfo.national  == a.name>
											<option  value="${a.name}" selected="selected">${a.name}</option>	
										<#else>
											<option value="${a.name}" >${a.name}</option>
										</#if>
									</#list>
								</#if>
							</select>	
						   </div>
						</div>
						<div class="row-fluid">
						  <div class="span4">
							<span class="formTitle">政治面貌</span>
							 <select size="1" id="politicalDic" name="politicalDic.id" aria-controls="dt_gal" class="span7">
								<option value="">请选择..</option>
								<#if politicalDicList??>
							      <#list politicalDicList as a>
									<#if studentInfo ?? && studentInfo.politicalDic?? && studentInfo.politicalDic.id  == a.id>
											<option  value="${a.id}" selected="selected">${a.name}</option>	
										<#else>
											<option value="${a.id}" >${a.name}</option>
										</#if>
									</#list>
								</#if>
							</select>	
						  </div>
						  <div class="span4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							  <button class="btn btn-info"  type="submit" onclick="select()">查 询</button>
			              	  <button class="btn btn-info" type="button" onclick="comp.clearForm('classQuery')">清 空</button>
						  </div>
						</div>
				 <#elseif !isStudent >
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学院</span>
							   <select size="1" id="collegeId" name="college.id" aria-controls="dt_gal" class="span7" onchange="cascade.changeCollage('collegeId','majorId','classId');" <#if orgStatus ??>disabled</#if> >
								<option value="">请选择..</option>
								<#if collegeList ??>
									<#list collegeList as c>
										<#if  studentInfo ?? && studentInfo.college ?? &&  studentInfo.college.id == c.id >
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
							<select size="1" id="majorId" name="major.id" aria-controls="dt_gal" class="span7 emptySelect"  onchange="cascade.changeMajor('majorId','classId');">
								<option value="" >请选择..</option>
								<#if majorList ?? >
									<#list majorList as m>
										<#if studentInfo ?? && studentInfo.major ?? &&  studentInfo.major.id == m.id >
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
							<select size="1" id="classId" name="classId.id" aria-controls="dt_gal" class="span7 emptySelect">
								<option value="" >请选择..</option>
								<#if classList ?? >
									<#list classList as c>
										<#if studentInfo ?? && studentInfo.classId ?? &&  studentInfo.classId.id == c.id >
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
							<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;姓名</span>
							<input id="name" name="name" class="span7" value="${studentInfo.name!""?html}" />
						 </div>
						 <div class="span4">
							<span class="formTitle">学号</span>
							<input id="stuNumber" name="stuNumber" class="span7" value="${studentInfo.stuNumber!""?html}" />
						 </div>
						<div class="span4">
							<span class="formTitle">性别</span>
							 <select size="1" id="genderDic.id" name="genderDic.id" aria-controls="dt_gal" class="span7">
								<option value="">请选择...</option>
								<#if genderDicList??>
							      <#list genderDicList as g>
									<#if studentInfo ?? && studentInfo.genderDic ?? && studentInfo.genderDic.id == g.id>
											<option  value="${g.id}" selected="selected">${g.name}</option>	
										<#else>
											<option value="${g.id}" >${g.name}</option>
										</#if>
									</#list>
								</#if>
							</select>	
						 </div>
						 </div>
						 <div class="row-fluid">
							 <div class="span4">
								<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年级</span>
								 <select size="1" id="grade" name="grade" aria-controls="dt_gal" class="span7">
									<option value="">请选择..</option>
									<#if gradeList??>
								      <#list gradeList as g>
										<#if studentInfo ?? && studentInfo.grade ?? && studentInfo.grade == g>
												<option  value="${g}" selected="selected">${g}</option>	
											<#else>
												<option value="${g}" >${g}</option>
											</#if>
										</#list>
									</#if>
								</select>	
							 </div>
							<div class="span4">
								<span class="formTitle">学籍</span>
								 <select size="1" id="edusStatus" name="edusStatus" aria-controls="dt_gal" class="span7">
									<option value="">请选择..</option>
									<#if statusMap??>
								      <#list statusMap?keys as key>
										<#if studentInfo ?? && studentInfo.edusStatus ?? && studentInfo.edusStatus == key>
												<option  value="${key}" selected="selected">${statusMap[key]}</option>	
											<#else>
												<option value="${key}" >${statusMap[key]}</option>
											</#if>
										</#list>
									</#if>
								</select>	
							 </div>
							 <div class="span4">
								<span class="formTitle">民族</span>
								 <select size="1" id="national" name="national" aria-controls="dt_gal" class="span7">
									<option value="">请选择..</option>
									<#if nationDicList??>
								      <#list nationDicList as a>
										<#if studentInfo ?? && studentInfo.national?? && studentInfo.national  == a.name>
												<option  value="${a.name}" selected="selected">${a.name}</option>	
											<#else>
												<option value="${a.name}" >${a.name}</option>
											</#if>
										</#list>
									</#if>
								</select>	
							   </div>
							 </div>
							 <div class="row-fluid">
							  <div class="span4">
								<span class="formTitle">政治面貌</span>
								 <select size="1" id="politicalDic" name="politicalDic.id" aria-controls="dt_gal" class="span7">
									<option value="">请选择..</option>
									<#if politicalDicList??>
								      <#list politicalDicList as a>
										<#if studentInfo ?? && studentInfo.politicalDic?? && studentInfo.politicalDic.id  == a.id>
												<option  value="${a.id}" selected="selected">${a.name}</option>	
											<#else>
												<option value="${a.id}" >${a.name}</option>
											</#if>
										</#list>
									</#if>
								</select>	
							 </div>
							 <div class="span4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button class="btn btn-info"  type="submit" onclick="select()">查 询</button>
			             		<button class="btn btn-info" type="button" onclick=<#if orgStatus ??>"clearForm()"<#else>"comp.clearForm('classQuery')"</#if> >清 空</button>
							 </div>
						 </div>
	            	<#else>
	            	<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">姓名</span>
							<input id="name" name="name" class="span7" value="${studentInfo.name!""?html}" />
						 </div>
						 <div class="span4">
							<span class="formTitle">学号</span>
							<input id="stuNumber" name="stuNumber" class="span7" value="${studentInfo.stuNumber!""?html}" />
						 </div>
						 <div class="span4">
				              <button class="btn btn-info"  type="submit" onclick="select()">查 询</button>
				              <button class="btn btn-info" type="button" onclick="comp.clearForm('classQuery')">清 空</button>
				         </div>
			        </div>
	               </#if>	
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
												<input id="exportSize" name="exportSize" type="hidden" class="span3"  value="5000" title="excel单页条数" />
											    <button class="btn btn-info" type="button"  onclick="javascript:exportStudentInfo();">导 出</button>
											</#if>
										</#if>
									</div>
								</div>
							</div>
						</div>
				<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
							<thead>
								<tr>
								    <th width="6%">序号</th>
									<th width="8%">姓名</th>
									<th width="12%">学号</th>
									<th width="6%">性别</th>
									<th width="6%">民族</th>
									<th width="8%">政治面貌</th>
									<th width="8%">年级</th>
									<th width="15%">身份证号</th>
									<th width="9%">出生日期</th>
									<th width="8%">籍贯</th>
									<th width="8%">学籍</th>
									<th width="8%">操作</th>
								</tr>
							</thead>
							<tbody>
							<#if page??>	
								<#list page.result as p>
								<tr>		
								    <td>${p_index+1}</td>
									<td class="autocut tipTag" data="学院：<#if p.college ?? >${p.college.name!""?html}</#if><br/>专业：<#if p.major ?? >${p.major.majorName!""?html}</#if><br/>班级：<#if p.classId ?? >${p.classId.className!""?html}</#if><br/>"><a href="${rc.contextPath}/student/info/opt-query/queryStudent.do?id=${p.id} " target='_blank' class="sepV_a" title="查看">${p.name!""?html}</a></td>
									<td class="autocut">${p.stuNumber!""?html}</td>
									<td class="autocut"><#if p.genderDic ?? >${p.genderDic.name!""?html}</#if></td>
									<td class="autocut">${(p.national)!""}</td>
									<td class="autocut">${(p.politicalDic.name)!""}</td>
									<td class="autocut"><#if p.classId ?? >${p.classId.grade!""?html}</#if></td>
									<td class="autocut"><#if p.certificateCode ?? >${p.certificateCode!""}</#if></td>
									<td class="autocut"><#if p.brithDate ?? >${p.brithDate!""?html}</#if></td>
									<#-- 
									<td class="autocut"><#if p.classId ?? >${p.classId.className!""?html}</#if></td>
									<td class="autocut"><#if p.major ?? >${p.major.majorName!""?html}</#if></td>
									<td class="autocut"><#if p.college ?? >${p.college.name!""?html}</#if></td>
									-->
									<td class="autocut"><#if p.nativeDic ?? >${p.nativeDic.name!""?html}</#if></td>
									<td class="autocut"><#if p.edusStatus ??>${statusMap[p.edusStatus]}</#if></td>
									<td class="autocut">
										<a href="${rc.contextPath}/student/info/opt-query/queryStudent.do?id=${p.id} " target='_blank' class="sepV_a" title="查看"><i class="icon-list-alt"></i></a>
										<#if user_key.optMap??>
											<#if user_key.optMap['update']??>
												<a href="${rc.contextPath}/student/info/opt-edit/editStudentInfo.do?id=${p.id}" class="sepV_a" title="修改"><i class="icon-edit"></i></a>
										    </#if>
										</#if>
										<#if user_key.optMap??>
											<#if user_key.optMap['print']??>
										        <a href="${rc.contextPath}/student/print/opt-print/printStudent.do?id=${p.id}"  target='_blank' class="sepV_a" title="打印在校证明"><i class="icon-print"></i></a>
                                            </#if>
										</#if>
                                    </td>
								</tr>
								</#list>
							 </#if> 
							</tbody>
						</table>
						<#assign pageTagformId="classQuery"/>
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
		<h3 id="title1">导出学生信息</h3>
	</div>
    <div class="modal-body" id="export_studentInfo">
		
	</div>
	<div class="modal-footer">
		<a href="#" class="btn" data-dismiss="modal">关闭</a>
	</div>
</div>

</body>
</html>