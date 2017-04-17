<html>
 <head>
    <meta charset="utf-8"/>
</head>
<body onload="window.print();" style="text-align:center;align:center;padding-left:20px;">
<br/><br/>
	<#if student??>
		<div style="line-height:40px;text-align:left;align:center;width:100%;font-size:18px;">
		<div style="line-height:40px;text-align:center;font-size:28px;"><b>证  明</b></div>
			<br/>
			<br/>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;兹有 <u>&nbsp;${student.name!""}&nbsp;</u>同学 ，性别 <u>&nbsp;${student.genderDic.name!""}&nbsp;</u> ， 系<u>&nbsp;杭州科技职业技术学院${student.college.name}${student.classId.grade}级 ${student.major.majorName!""}&nbsp;</u>学生，籍贯为 <u>&nbsp;<#if student.nativeDic??>${student.nativeDic.name!""}&nbsp;<#else>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</#if></u> ， 
			
			 身份证号为 <u>&nbsp;${student.certificateCode!""}&nbsp;</u>。于 <u> &nbsp;<#if student.enterDate ??>${(student.enterDate!"")?string("yyyy-MM-dd")}</#if> &nbsp;</u>考入本校就读，学制 <u>&nbsp;${student.major.schoolYear!""}&nbsp;</u>年，系  <u>&nbsp;${student.major.majorName!""}专业&nbsp;</u>学生，学历为<u><#if student.studentType??>&nbsp;${student.studentType!""}&nbsp;<#else>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</#if></u>，
			
			于<u>  ${((student.stuNumber!"")?substring(0,4))?number+(student.major.schoolYear)?number}年6月 </u>毕业。<br/>
			<br/><br/><br/><br/>
			&nbsp;&nbsp;&nbsp;&nbsp;特此证明
		</div>
		<div style="line-height:18px; text-align:right;align:right;width:90%;font-size:18px;">
			<br/><br/><br/>
			杭州科技职业技术学院 <br/> <br/>
			<#if student?? && student.college??>${student.college.name}&nbsp;&nbsp;&nbsp;&nbsp;</#if><br/><br/> 
			${currentDate!""}
		<div>
		<#else>
		请选择打印在校证明的学生
	</#if>
</body>
</html>