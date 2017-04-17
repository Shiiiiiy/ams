<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<!-- Bootstrap framework -->
		<link rel="stylesheet" href="${rc.contextPath}/bootstrap/css/bootstrap.min.css" />
		<style type="text/css">
				.table{ width: 100%;margin-bottom:0px;}
				.content{text-align:center !important;vertical-align:middle !important;font-size:14px;}
		</style>
	</head>
<body onload="window.print();" style="text-align:center;align:center;padding-left:20px;">
	<#if schoolGoodStudentVO??>
	<div style="line-height:40px;text-align:center;font-size:25px;"><b>杭州科技职业技术学院优秀毕业生登记表</b></div>
		<table class="table">
			<tr style="border:0;line-height:10px;font-size:14px;">
				<td>二级学院： ${((schoolGoodStudentVO.studentId.college.name)!"")?html}</td>
				<td style="text-align: center;">班级: ${((schoolGoodStudentVO.studentId.classId.className)!"")?html}</td>
				<td style="text-align: right;">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日
				</td>
			</tr>
		</table>
		<table class="table table-bordered table-striped tablecut" id="smpl_tbl" style="height:88%;border-color:black;">
			<tbody>
				<tr height="5%">
					<td class="content" width="12.5%">姓 名</td>
					<td class="content" width="12.5%">${((schoolGoodStudentVO.studentId.name)!"")?html}</td>
					<td class="content" width="12.5%">性 别</td>
					<td class="content" width="12.5%">${(schoolGoodStudentVO.studentId.genderDic.name)!""}</td>
					<td class="content" width="12.5%">出 生</br>年 月</td>
					<td class="content" width="17.5%">${((schoolGoodStudentVO.studentId.brithDate)!"")?string("yyyy-MM-dd")}</td>
					<td class="content" width="10%">民 族</td>
					<td class="content" width="10%">${(schoolGoodStudentVO.studentId.national)!""}</td>
				</tr>
				<tr height="5%">
					<td class="content">政 治</br>面 貌</td>
					<td class="content">${(schoolGoodStudentVO.studentId.politicalDic.name)!""}</td>
					<td class="content">职 务</td>
					<td class="content" colspan="2">${(schoolGoodStudentVO.post)!""}</td>
					<td class="content">班 级</br>人 数</td>
					<td class="content" colspan="2">${(schoolGoodStudentVO.classNumber)!""}</td>
				</tr>
				<tr height="5%">
					<td class="content" colspan="2">总成绩平均分</td>
					<td class="content" colspan="2"><#if (schoolGoodStudentVO.avgScore)?? >${(schoolGoodStudentVO.avgScore)?string(".00")}<#else>0.00</#if></td>
					<td class="content" colspan="2">班级排名</td>
					<td class="content" colspan="2">${(schoolGoodStudentVO.classSort)!""}</td>
				</tr>
				<tr height="5%">
					<td class="content" colspan="2">计算机等级</td>
					<td class="content" colspan="2">${(schoolGoodStudentVO.computerLevel)!""}</td>
					<td class="content" colspan="2">外语等级</td>
					<td class="content" colspan="2">${(schoolGoodStudentVO.englishLevel)!""}</td>
				</tr>
				<tr height="25%">
					<td class="content">本人</br></br>在校</br></br>期间</br></br>表现</td>
					<td colspan="7" style="font-size:12px;"><div>${(schoolGoodStudentVO.performance)!""}</div></td>
				</tr>
				<tr height="25%">
					<td class="content">曾</br></br>获</br></br>奖</br></br>项</td>
					<td colspan="7" style="font-size:12px;">
						<div>
							${(schoolGoodStudentVO.honor)!""}
						</div>
					</td>
				</tr>
				<tr height="15%">
					<td class="content" width="12.5%">班</br>主</br>任</br>意</br>见</td>
					<td width="37.5%" colspan="3"></td>
					<td class="content" width="12.5%">学</br>院</br>意</br>见</td>
					<td width="37.5%" colspan="3">
						<div style="width:100%;height:85%;"></div>
						<div style="text-align:right;">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日
							&nbsp;&nbsp;&nbsp;&nbsp;
						</div>
					</td>
				</tr>
				<tr height="15%">
					<td class="content">招</br>就</br>处</br>意</br>见</td>
					<td colspan="3">
						<div style="width:100%;height:85%;"></div>
						<div style="text-align:right;">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日
							&nbsp;&nbsp;&nbsp;&nbsp;
						</div>
					</td>
					<td class="content">学</br>校</br>意</br>见</td>
					<td colspan="3">
						<div style="width:100%;height:85%;"></div>
						<div style="text-align:right;">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;月
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;日
							&nbsp;&nbsp;&nbsp;&nbsp;
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		<div style="line-height:30px;text-align:left;font-size:14px;">注：此表一式三份：本人档案、二级学院、招生就业处各一份
	</#if>
</body>
</html>