<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<link rel="stylesheet" href="${rc.contextPath}/css/bdp_comp.css" type="text/css" />
	<script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
</head>
<body>
<OBJECT ID="CVR_IDCard"   name="CVR_IDCard"  CLASSID="CLSID:10946843-7507-44FE-ACE8-2B3483D179B7" width="0" height="0"></OBJECT>
<div id="contentwrapper">
	<div class="main_content">
		<div class="row-fluid">
			<form id="leaveList" action="${rc.contextPath}/leave/college/opt-query/queryCollegeLeavePage.do" method="post">
				<div class="span12">
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;学院</span>
							<select id="college" name="student.college.id" aria-controls="dt_gal" class="span7" onchange="cascade.changeCollage('college','major', 'class');">
								<option value="">请选择</option>
								<#if collegeList??>
								<#list collegeList as college>
									<#if (leave.student)?? && (leave.student.college)?? && leave.student.college.id == college.id>
										<option value="${college.id}" selected="selected">${college.name}</option>
									<#else>
										<option value="${college.id}">${college.name}</option>
									</#if>
								</#list>
								</#if>
							</select>
						</div>
						<div class="span4">
							<span class="formTitle">专业</span>
							<select id="major" name="student.major.id" aria-controls="dt_gal" class="span7 emptySelect" onchange="cascade.changeMajor('major','class');">
								<option value="">请选择</option>
								<#if majorList??>
								<#list majorList as major>
									<#if (leave.student)?? && (leave.student.major)?? && leave.student.major.id == major.id>
										<option value="${major.id}" selected="selected">${major.majorName}</option>
									<#else>
										<option value="${major.id}">${major.majorName}</option>
									</#if>
								</#list>
								</#if>
							</select>
						</div>
						<div class="span4">
							<span class="formTitle">班级</span>
							<select id="class" name="student.classId.id" size="1" aria-controls="dt_gal" class="span7 emptySelect">
								<option value="">请选择</option>
								<#if classList??>
								<#list classList as class>
									<#if (leave.student)?? && (leave.student.classId)?? && leave.student.classId.id == class.id>
										<option value="${class.id}" selected="selected">${class.className}</option>
									<#else>
										<option value="${class.id}">${class.className}</option>
									</#if>
								</#list>
								</#if>
							</select>
						</div>
					</div>
					<div class="row-fluid">
						<div class="span4">
							<span class="formTitle">办理年份</span>
							<select name="year" size="1" aria-controls="dt_gal" class="span7">
								<option value="">请选择</option>
								<#if yearList??>
								<#list yearList as y>
									<#if (leave.year)?? && leave.year == y>
										<option value="${y!''}" selected="selected">${y!''}</option>
									<#else>
										<option value="${y!''}">${y!''}</option>
									</#if>
								</#list>
								</#if>
							</select>
						</div>
						<div class="span4">
							<span class="formTitle">姓名</span>
							<input class="span7" name="student.name" value="${(leave.student.name)!""}"/>
						</div>
						<div class="span4">
							<span class="formTitle">学号</span>
							<input class="span7" name="student.stuNumber" value="${(leave.student.stuNumber)!""}"/>
						</div>
					</div>
				</div>
				<div class="btnCenter">
					<button class="btn btn-info" type="button" onClick="queryLeave();">查 询</button>
					<button class="btn btn-info" type="button" onclick="comp.clearForm('leaveList')">清 空</button>
				</div>
			</form>
			<div class="row-fluid">
				<div class="span12">
					<h5 class="heading"></h5>
					<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
						<div class="row">
						   <button class="btn btn-info" type="button"  onclick="cerDo()" >
	                              	刷身份证 
	                      </button>
						</div>
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl" >
							<thead>
								<tr>
									<th width="5%">序号</th>
									<th width="7%">姓名</th>
									<th width="10%">学号</th>
									<th width="6%">办理<br/>年份</th>
									<th width="7%">图书信<br/>息中心</th>
									<th width="7%">公寓管<br/>理中心</th>
									<th width="7%">计财处</th>
									<th width="7%">一卡通</th>
									<th width="7%">党组织</th>
									<th width="7%">保卫处</th>
									<th width="7%">二级学院</th>
									<th width="7%">离校状态</th>
									<th width="10%">离校原因</th>
									<#if user_key.optMap['update']??>
									<th width="7%">操作</th>
									</#if>
								</tr>
							</thead>
							<tbody>
								<#if page??>
									<#list page.result as p>
										<tr>
											<td class="autocut">${p_index+1}</td>
											<td class="autocut tipTag" data="学院：${(p.student.college.name)!""}<br/>专业：${(p.student.major.majorName)!""}<br/>班级：${(p.student.classId.className)!""}<br/>">${(p.student.name)!""}</td>
											<td class="autocut">${(p.student.stuNumber)!""}</td>
											<td class="autocut" id=${p.id!""?html}_year>${(p.year)!""}</td>
											<td class="autocut"><#if p.status=='0'>未办理<#else><#if p.library??&&(p.library)?lower_case=='true'>已办理<#else>${p.library!""}</#if></#if></td>
											<td class="autocut">${p.dorm!""?html}</td>
											<td class="autocut">${p.finance!""?html}</td>
											<td class="autocut"><#if p.oneCard?? && p.oneCard !='数据同步异常'>${(p.oneCard?number)/100}<#else>${p.oneCard!""?html}</#if></td>
											<td class="autocut">
											  <#if p.student?? && p.student.politicalDic?? 
											  && (p.student.politicalDic.code=="02" ||p.student.politicalDic.code=="01")>
											       <#if p.caucus=='0'>未办理<#else>已办理</#if>
											  <#else>不需办理
											  </#if>
											</td>
											<td class="autocut"><#if p.security=='0'>不需办理<#elseif p.security=='1'>未办理<#else>已办理</#if></td>
											<td class="autocut"><#if p.college=='0'>未办理<#elseif p.college=='1'>已办理</#if></td>
											<td class="autocut"><#if p.status=='0'>未发起<#elseif p.status=='1'>发起<#else>办结</#if></td>
											<td class="autocut">${p.reason!""?html}</td>
											<#if user_key.optMap['update']??>
											<td class="autocut">
											<#if p.status=='1' && (p.library??&&(p.library)?lower_case=='true') && (p.dorm?? && p.dorm=='已退宿')
												&& (p.finance?? && p.finance=='缴清') && (p.oneCard?? && p.oneCard?number >= 0) 
												&& ((p.student?? && p.student.politicalDic?? && (p.student.politicalDic.code == "02" || p.student.politicalDic.code == "01") && p.caucus=='1')
												|| (p.student?? && p.student.politicalDic?? && (p.student.politicalDic.code != "02" && p.student.politicalDic.code != "01"))
												|| !(p.student?? && p.student.politicalDic??))  
												&& (p.security?? && (p.security == '0' || p.security == '2'))>
												<a href="###"  onclick="operateCollegeLeave('${p.id}','1')" title="办结"><i class="icon-edit"></i></a>
											</#if>
											<#if p.status=='1' && ((p.library??&&(p.library)?lower_case !='true') || (p.dorm?? && p.dorm !='已退宿')
												|| (p.finance?? && p.finance != '缴清') || (p.oneCard?? && p.oneCard?number < 0))>
												<a href="###"  onclick="refreshStatus('${p.id}')" title="刷新"><i class="icon-refresh"></i></a>
											</#if>
											</td>
											</#if>
										</tr>
									</#list>
									<input type="hidden" id="currentPageNo" name="currentPageNo" value="${page.currentPageNo}">
								</#if>
							</tbody>
						</table>
						<#assign pageTagformId="leaveList"/>
						<#include "/page.ftl">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<#---脚本开始----->
<script>
function queryLeave(){
	$("#leaveList").submit();
}

//二级学院办理离校手续
function operateCollegeLeave(id, status){
	var str="确认要办结离校手续？";
	if(status=='0'){
		str="确认要取消办结离校手续？";
	}
	comp.confirm(str, function(result) {
    	if(!result){
    		return; 
		}
		$.ajax({
			url:'${rc.contextPath}/leave/operate/opt-edit/operateCollegeLeave.do',
			async:false,
			cache: false,
			type: "POST",
			data:{studentId : id , status: status},
			success: function(data){
				if("success" == data){
					$("#leaveList").attr("action","${rc.contextPath}/leave/college/opt-query/queryCollegeLeavePage.do?pageNo="+$("#currentPageNo").val());
					$("#leaveList").submit();
				}else{
					comp.message("操作失败");
				}
		    }
		});
	}); 
}


//刷新状态  主要是针对图书馆、宿舍、计财处及一卡通状态
function refreshStatus(id){
	$.ajax({
		url:'${rc.contextPath}/leave/refreshStatus/opt-edit/refreshLeaveStatus.do',
		async:false,
		cache: false,
		type: "POST",
		data:{studentId : id},
		success: function(data){
			if("success" == data){
				$("#leaveList").attr("action","${rc.contextPath}/leave/college/opt-query/queryCollegeLeavePage.do?pageNo="+$("#currentPageNo").val());
				$("#leaveList").submit();
			}else{
				comp.message("操作失败");
			}
	    }
	});
}

//刷身份证
function cerDo(){
	//取得刷身份证的对象
 	var calc = document.getElementById('CVR_IDCard');
 	//获得读卡器的链接状态 1：正常  0  吴读卡器链接  -1：有异常。
 	var status = calc.ListReaderCard();
 	if(status ==1){
 		//读取信息
 		var info = calc.ReadCard();
 		if(info ==0){
 			// 身份证号码
 			var code = calc.CardNo;
 			//弹出框
 			$("#leaveList").attr("action","${rc.contextPath}/leave/college/opt-query/queryCollegeLeavePage.do?cardId="+code);
			$("#leaveList").submit();
 			
 		}else{
 			comp.message("读卡失败，请重新读取!","error");
 		}
 	}else{
 		comp.message("没有读卡器连接 !","error");
 	}
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