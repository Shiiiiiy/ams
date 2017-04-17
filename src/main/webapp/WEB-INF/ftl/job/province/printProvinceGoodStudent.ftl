<html>
 <head>
     <meta charset="utf-8" />
     <meta name="viewport" content="width=device-width, initial-scale=1.0" />
     <!-- Bootstrap framework -->
    <link rel="stylesheet" href="${rc.contextPath}/bootstrap/css/bootstrap.min.css" />
    <style type="text/css">
			.table{ width: 100%;margin-bottom:0px;} 
	</style>
 </head>
<body onload="window.print();" style="text-align:center;align:center;padding-left:20px;">

	<#if provinceGoodStudent??>
	  <div style="line-height:40px;text-align:center;font-size:25px;"><b>浙江省普通高等学校优秀毕业生登记表</b></div></br></br>
	  	<table class="table">
	  	<tr style="border:0;line-height:10px;font-size:14px;">
	  		<td width="30%">学校: 杭州科技职业学院</td>
	  		<td width="30%" style="padding-left:10px;">院(系): <#if provinceGoodStudent.schoolGoodStudent?? && provinceGoodStudent.schoolGoodStudent.studentId?? && provinceGoodStudent.schoolGoodStudent.studentId.college??>${(provinceGoodStudent.schoolGoodStudent.studentId.college.name!"")?html}</#if></td>
	  		<td width="40%" style="padding-left:10px;">专业: <#if provinceGoodStudent.schoolGoodStudent?? && provinceGoodStudent.schoolGoodStudent.studentId?? && provinceGoodStudent.schoolGoodStudent.studentId.major??>${(provinceGoodStudent.schoolGoodStudent.studentId.major.majorName!"")?html}</#if>	</td>
	  	</tr>
	  	<tr style="border:0;line-height:10px;font-size:14px;">
	  		<td colspan="2">班级: <#if provinceGoodStudent.schoolGoodStudent?? && provinceGoodStudent.schoolGoodStudent.studentId?? && provinceGoodStudent.schoolGoodStudent.studentId.classId??>${(provinceGoodStudent.schoolGoodStudent.studentId.classId.className!"")?html}</#if></td>
	  		<td style="padding-left:20px;">
	  			<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>年
	  			<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>月
	  			<u>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</u>日
	  		</td>
	  	</tr>
	  	</table>
	  <table class="table table-bordered table-striped tablecut" id="smpl_tbl">
			<tbody>
				<tr>
					<td width="13%" style="text-align:center;vertical-align:middle;">姓名</td>
					<td width="20%"><#if provinceGoodStudent.schoolGoodStudent?? && provinceGoodStudent.schoolGoodStudent.studentId??>${(provinceGoodStudent.schoolGoodStudent.studentId.name!"")?html}</#if></td>
					<td width="9%">性别</td>
					<td width="8%"><#if provinceGoodStudent.schoolGoodStudent?? && provinceGoodStudent.schoolGoodStudent.studentId?? && provinceGoodStudent.schoolGoodStudent.studentId.genderDic??>${(provinceGoodStudent.schoolGoodStudent.studentId.genderDic.name!"")?html}</#if></td>
					<td width="13%">出生年月</td>
					<td width="17%"><#if provinceGoodStudent.schoolGoodStudent?? && provinceGoodStudent.schoolGoodStudent.studentId?? && provinceGoodStudent.schoolGoodStudent.studentId.brithDate??>${(provinceGoodStudent.schoolGoodStudent.studentId.brithDate!"")?string("yyyy-MM-dd")}</#if></td>
					<td width="10%">名族</td>
					<td width="13%"><#if provinceGoodStudent.schoolGoodStudent?? && provinceGoodStudent.schoolGoodStudent.studentId??>${(provinceGoodStudent.schoolGoodStudent.studentId.national!"")?html}</#if></td>
				</tr>
				<tr>
				    <td width="8%" height=80 style="text-align:center;vertical-align:middle">生源地</td>
				    <td width="8%" style="vertical-align:middle;">${(native.name)!""}</td>
				    <td width="8%" style="text-align:center;vertical-align:middle" colspan="2">政治面貌</td>
				    <td width="8%" style="vertical-align:middle;" colspan="2"><#if provinceGoodStudent.schoolGoodStudent?? && provinceGoodStudent.schoolGoodStudent.studentId?? && provinceGoodStudent.schoolGoodStudent.studentId.politicalDic??>${(provinceGoodStudent.schoolGoodStudent.studentId.politicalDic.name!"")?html}</#if></td>
				    <td width="8%" style="text-align:center;vertical-align:middle">职务</td>
				    <td width="8%" style="vertical-align:middle;"><#if provinceGoodStudent.schoolGoodStudent??>${(provinceGoodStudent.schoolGoodStudent.post)!""}</#if></td>
				</tr>
				<tr>
				    <td width="8%" style="text-align:center;vertical-align:middle" height=80>家庭</br>地址</td>
				    <td width="8%" colspan="4"><#if provinceGoodStudent.schoolGoodStudent?? && provinceGoodStudent.schoolGoodStudent.studentId??>${(provinceGoodStudent.schoolGoodStudent.studentId.homeAddress!"")?html}</#if></td>
				    <td width="8%" style="text-align:center;vertical-align:middle">联系电话</td>
				    <td width="8%"  style="text-align:center;vertical-align:middle" colspan="2"><#if provinceGoodStudent.schoolGoodStudent?? && provinceGoodStudent.schoolGoodStudent.studentId??>${(provinceGoodStudent.schoolGoodStudent.studentId.phone1!"")?html}</#if></td>
				</tr>
				<tr align="center">
				    <td width="8%" style="text-align:center;vertical-align:middle" height=310>本</br>人</br>简</br>历</td>
				    <td width="8%" colspan="7">${(provinceGoodStudent.resume)!""}</td>
				</tr>
				<tr>
				    <td width="8%" style="text-align:center;vertical-align:middle" height=313>主</br>要</br>事</br>迹</td>
				    <td width="8%" colspan="7">${(provinceGoodStudent.mainStory)!""}</td>
				</tr>
			</tbody>
		</table>
		</br>
		<table class="table table-bordered table-striped tablecut">
			<tbody>
			    <tr>
				    <td width="13%" style="text-align:center;vertical-align:middle" height=250>在</br>校</br>期</br>间</br>获</br>奖</br>情</br>况</td>
				    <td width="92%" colspan="7">
				    <#if listBurse??>	
						  <#list listBurse as b>
							   ${b.schoolYear.name!''}:
							   ${b.burseName.name!''}</br>
						   </#list>
				    <#else>
				    	<b>暂无奖项</b>	   
					</#if>
					 
					 <#list listAward as a>
							<#if a.awardTypeId??&&a.awardTypeId.schoolYear??>${a.awardTypeId.schoolYear.name!''}:</#if>
							<#if a.id?? >${a.id!''}
							</#if>
					   </#list>
				    </td>
				</tr>
				<tr>
				    <td style="text-align:center;vertical-align:middle" height=200>院</br>系</br>意</br>见</td>
				    <td colspan="3"></td>
				    <td width="13%" style="text-align:center;vertical-align:middle" height=200>学</br>校</br>意</br>见</td>
				    <td colspan="3"></td>
				</tr>
				<tr>
				    <td style="text-align:center;vertical-align:middle" height=200>省</br>教</br>育</br>厅</br>意</br>见</td>
				    <td colspan="3"></td>
				    <td width="13%" style="text-align:center;vertical-align:middle" height=200>毕</br>业</br>就</br>业</br>去</br>向</td>
				    <td colspan="3"></td>
				</tr>
				<tr>
				    <td style="text-align:center;vertical-align:middle" height=100>备</br>注</td>
				    <td colspan="7"></td>
				</tr>	 
			</tbody>
		</table>
		 </br>
		<div style="line-height:18px; text-align:right;width:90%;font-size:18px;">
			浙江省教育厅制表
		<div>
		<div style="line-height:30px;text-align:left;font-size:14px;">注：1.此表一式两份：学生本人档案、学校各一份。 
		<div style="line-height:30px;font-size:14px;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2.本表内容可打印或用钢笔填写，经院（系）及校领导签字（或盖章）、院（系）及学校盖章，方有效。
	</#if>
</body>
</html>