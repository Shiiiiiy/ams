<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
</head>
<body>
<div id="contentwrapper">
    <div class="main_content">   
    	   <div class="row-fluid">	
    		<form  id="classManageQuery"  action="${rc.contextPath}/base/classmanage/opt-query/listClassManage.do" method="post">
				<div class="span12">			
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">学院</span>
							<select size="1" id="collageId" name="major.collage.id" aria-controls="dt_gal" class="span7" onchange="cascade.changeCollage('collageId','majorId');" >
								<option value="">请选择..</option>
								<#if baseClass.major?? && baseClass.major.collage ?? >
									<#list collageList as d>
										<#if baseClass.major.collage.id ==d.id >
											<option  value="${d.id}" selected="selected">${d.name?html}</option>
										<#else>
											<option value="${d.id}" >${d.name?html}</option>
										</#if>
									</#list>
								<#else>
									<#list collageList as d>
										<option  value="${d.id}">${d.name?html}</option>
									</#list>
								</#if>
							</select>
						 </div>
						 <div class="span4">
							<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;专业</span>
							<select size="1" id="majorId" name="major.id" aria-controls="dt_gal" class="span7"  onchange="cascade.changeMajor('majorId','classId');">
								<option value="" >请选择..</option>
								<#if majorList ?? >
									<#list majorList as m>
										<#if baseClass ?? && baseClass.major ?? &&  baseClass.major.id == m.id >
											<option value="${m.id}" selected >${m.majorName}</option>
										<#else>
											<option value="${m.id}">${m.majorName}</option>
										</#if>
									</#list>
								</#if>
							</select>
						  </div>
						<div class="span4">
							<span class="formTitle">班级名称</span>
							<input id="className" name="className" class="span7" value="${baseClass.className!""?html}" />
						</div>
					</div>
					
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">年级</span>
							 <select size="1" id="grade" name="grade" aria-controls="dt_gal" class="span7">
								<option value="">请选择..</option>
								<#if gradeList??>
							      <#list gradeList as g>
									<#if baseClass ?? && baseClass.grade?? && baseClass.grade == g>
											<option  value="${g}" selected="selected">${g}</option>	
										<#else>
											<option value="${g}" >${g}</option>
										</#if>
									</#list>
								</#if>
							</select>	
						 </div>
						 <div class="span4">
							<span class="formTitle">是否毕业</span>
							 <select size="1" id="isGraduatedDic.id" name="isGraduatedDic.id" aria-controls="dt_gal" class="span7">
								<option value="">请选择..</option>
								<#if idGraduatedStatus??>
							      <#list idGraduatedStatus as g>
									<#if baseClass ?? && baseClass.isGraduatedDic?? && baseClass.isGraduatedDic.id == g.id>
											<option  value="${g.id}" selected="selected">${g.name!""}</option>	
										<#else>
											<option value="${g.id}" >${g.name!""}</option>
										</#if>
									</#list>
								</#if>
							</select>	
						 </div>
						 <div class="span4">
						    <button class="btn btn-info"  type="submit">查 询</button>
		              		<button class="btn btn-info" type="button" onclick="comp.clearForm('classManageQuery');">清 空</button>
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
											    <button class="btn btn-info" onclick="classGraduate();">标记毕业班</button>
											    <button class="btn btn-info" onclick="cancelClassGraduate();">取消毕业班</button>
											</#if>
										</#if>
									</div>
								</div>
							</div>
						</div>
				        <form  id="classGraduateManageForm"  action="#" method="post">
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
							<thead>
								<tr>
									<th width="4%">
									<input type="checkbox" id="totalCheck"  onclick="comp.selectAllCheckbox('totalCheck','graduateClassId')"/>
									</th>
									<th width="15%">班级名称</th>
									<th width="12%">班号</th>
									<th width="10%">班长</th>
									<th width="10%">班主任</th>
									<th width="8%">年级</th>
									<th width="8%">学制</th>
									<th width="12%">毕业年份</th>
									<th width="9%">是否毕业</th>
									<th width="10%">毕业学年</th>
									<#--
									<th width="12%">专业</th>
									<th width="15%">学院</th>-->
								</tr>
							</thead>
							<tbody>
							<#if page??>	
								<#list page.result as p>
								<tr>
									<td>
									<#if !p.isGraduatedDic ?? || p.isGraduatedDic.id == idGraduatedNo.id ></#if>
										<input type="checkbox"  name="graduateClassId" onclick="onClickSingleCheckbox(this);" value="${p.id!""}"/>
									</td>
									<td class="autocut tipTag" data="专业：${p.major.majorName!""?html}<br/>学院：${p.major.collage.name!""?html}">${p.className!""?html}</td>
									<td class="autocut">${p.code!""?html}</td>
									<td class="autocut"><#if p.monitor ?? >${p.monitor.name!""?html}</#if></td>
									<td class="autocut"><#if p.headermaster ?? >${p.headermaster.name!""?html}</#if></td>
									<td class="autocut">${p.grade!""?html}</td>
									<td class="autocut"><#if p.major ?? >${p.major.schoolYear!""?html}</#if></td>
									<td class="autocut"><#if p.major ?? >${(p.major.schoolYear?number)+(p.grade?number)}</#if>年</td>
									<td class="autocut"><#if p.isGraduatedDic ?? >${p.isGraduatedDic.name!""?html}</#if></td>
									<td class="autocut"><#if p.graduatedYearDic ?? >${p.graduatedYearDic.name!""?html}</#if></td>
									<#-- 
									<td class="autocut"><#if p.major ?? >${p.major.majorName!""?html}</#if></td>
									<td class="autocut"><#if p.major ?? && p.major.collage ??  >${p.major.collage.name!""?html}</#if></td>-->
								</tr>
								</#list>
							 </#if> 
							</tbody>
						</table>
						</form>
						 <#assign pageTagformId="classManageQuery"/>
						 <#include "/page.ftl">
					</div>
				</div>
			</div> 
		</div> 
	</div>
</div>
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
	//点击checkbox按钮 
	function onClickSingleCheckbox(obj)
	{
		var $subBox = $("input[name='graduateClassId']");
		$("#totalCheck").attr("checked",$subBox.length == $("input[name='graduateClassId']:checked").length ? true : false);
	}
	
	//毕业标记
	function classGraduate()
	{
		var len =  $("input[name='graduateClassId']:checked").length ;
		if(len >0)
		{
			comp.confirm("确认要标记这些为毕业班吗？", function(result) {
            	if(!result)
            		return;  
         		
         		$.ajax({
					url: "${rc.contextPath}/base/classmanage/opt-edit/markClassGraduate.do",
					async:false,
					cache:false,
					type:"POST",
					data:$('#classGraduateManageForm').serialize(),
				    success: function(data){
						if(data == "success"){
					       $("#classManageQuery").submit();
					    }else{
					    	$.sticky("毕业班标记失败，请联系管理员", {autoclose:5000, position:"top-right", type:"st-error"});
					    	return;
					    }
					}
			   });

			}); 
		}
		else
		{
			comp.message("请选择要标记毕业班的班级信息!","info");
		}
	}
	//毕业标记
	function cancelClassGraduate()
	{
		var len =  $("input[name='graduateClassId']:checked").length ;
		if(len >0)
		{
			comp.confirm("取消选择的班级毕业班标记可能会系统运行造成影响，确认要取消毕业班标记吗？", function(result) {
            	if(!result)
            		return;  
         		$.ajax({
					url: "${rc.contextPath}/base/classmanage/opt-edit/cancelClassGraduate.do",
					async:false,
					cache:false,
					type:"POST",
					data:$('#classGraduateManageForm').serialize(),
				    success: function(data){
						if(data == "success"){
					       $("#classManageQuery").submit();
					    }else{
					    	$.sticky("毕业班标记取消操作失败，请联系管理员", {autoclose:5000, position:"top-right", type:"st-error"});
					    	return;
					    }
					}
			   });

			}); 
		}
		else
		{
			comp.message("请选择要取消标记毕业班的班级信息!","info");
		}
	}
	
</script>
</body>
</html>