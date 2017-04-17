<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>报道流程打印</title>
</head>
	<body onload="window.print();" style="text-align:center">
		<br/>
		<h3 align="center">杭州科技职业技术学院  ${(year)!""} 级新生报到流程表</h3>
			<#-- 
			<table  align="right">
				<tr>
					<td>
						<button type="button" onclick="javascript:window.print();">
							打印
						</button>
					</td>
				</tr>
			</table>-->
			<table  align="center">
				<tr>
					<td>
						<font size="3" style="font-weight:bold;" >学院： </font> ${(collegeName)!""}
					</td>
					<td colspan="2">
						<font size="3"  style="font-weight:bold;">专业： </font> ${(majorName)!""}
					</td>
					<td colspan="2">
						<font size="3" style="font-weight:bold;">班级：</font>${(className)!""}
					</td>
				</tr>
				<tr>
					<td>
						<font size="3" style="font-weight:bold;">姓名： </font>${(name)!""}
					</td>
					<td colspan="4">
						<font size="3" style="font-weight:bold;">宿舍： </font>${(dormName)!""}
					</td>
				</tr>
				<tr  style="padding:0;margin:0" >
					<td colspan="5" style="padding-top:10;padding-bottom:10" >
						${reportComm!""?html}
					</td>
				 </tr>
				<tr>
					<td colspan="5">
						您的报到手续已办理完毕！到本学院交回此报到流程表
					</td>
				</tr>
				
			</table>
			
</body>
</html>