<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link rel="stylesheet" href="${rc.contextPath}/css/bdp_comp.css" type="text/css"/>
		<!-- My97DatePicker -->
		<link rel="stylesheet" href="${rc.contextPath}/lib/My97DatePicker/skin/WdatePicker.css" />
		<script type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
		<script src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script>
		<script src="${rc.contextPath}/lib/validation/localization/messages_cn.js"></script>
		<script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
	</head>
	<body>
		<div id="contentwrapper">
			<div class="main_content">
				<div class="row-fluid">
					<div class="span12">
						<h3 class="heading">
							企业信息查看
						</h3>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span4">
								<label>所属学院</label>
							</div>
							<div class="span8">
								<input value='<#if (companyInfoVO.college.id)?? && companyInfoVO.college.id='05'>${companyManagerName!""}<#else>${(companyInfoVO.college.name)!""}</#if>' readonly="readonly" class="span8"/>
							</div>
						</div>
						<div class="span6">
							<div class="span4">
								<label>企业名称</label>
							</div>
							<div class="span8">
								<input value='${(companyInfoVO.companyName)!""}' readonly="readonly" class="span8"/>
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span4">
								<label>企业性质</label>
							</div>
							<div class="span8">
								<input value='${(companyInfoVO.companyProerty.name)!""}' readonly="readonly" class="span8"/>
							</div>
						</div>
						<div class="span6">
							<div class="span4">
								<label>联系人</label>
							</div>
							<div class="span8">
								<input value='${(companyInfoVO.contactPerson)!""}' readonly="readonly" class="span8"/>
							</div>
						</div>
					</div>
				</div>
				
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span4">
								<label>联系人职务</label>
							</div>
							<div class="span8">
								<input value='${(companyInfoVO.contactPost)!""}' readonly="readonly" class="span8"/>
							</div>
						</div>
						<div class="span6">
							<div class="span4">
								<label>联系电话</label>
							</div>
							<div class="span8">
								<input value='${(companyInfoVO.contactPhone)!""}' readonly="readonly" class="span8"/>
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span4">
								<label>手机号码</label>
							</div>
							<div class="span8">
								<input value='${(companyInfoVO.phoneNum)!""}' readonly="readonly" class="span8"/>
							</div>
						</div>
						<div class="span6">
							<div class="span4">
								<label>是否签订校企合作协议</label>
							</div>
							<div class="span8">
								<input value='${(companyInfoVO.isSchoolCompanyProtocol.name)!""}' readonly="readonly" class="span8"/>
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span4">
								<label>是否批量就业单位</label>
							</div>
							<div class="span8">
								<input value='${(companyInfoVO.isBatchWork.name)!""}' readonly="readonly" class="span8"/>
							</div>
						</div>
						<div class="span6">
							<div class="span4">
								<label>更新时间</label>
							</div>
							<div class="span8">
								<input class="span8" <#if (companyInfoVO.updateDate)??>value='${(companyInfoVO.updateDate)?string("yyyy-MM-dd")}'</#if> type="text" readonly="readonly" />
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span4">
								<label>需求岗位</label>
							</div>
							<div class="span8">
								<textarea id="needWork" rows="5" name="needWork" style="width:770px;" readonly="readonly">${(companyInfoVO.needWork)!""}</textarea>
								<#--<input value='${(companyInfoVO.needWork)!""}' readonly="readonly" style="width:788px;" class="span8"/>-->
							</div>
						</div>
					</div>
				</div>
				<div class="formSep">
					<div class="row-fluid">
						<div class="span6">
							<div class="span4">
								<label>企业详细地址</label>
							</div>
							<div class="span8">
								<textarea id="address" rows="5" name="address" style="width:770px;" readonly="readonly">${(companyInfoVO.address)!""}</textarea>
								<#--<input value='${(companyInfoVO.address)!""}' readonly="readonly" style="width:788px;" class="span8"/>-->
							</div>
						</div>
					</div>
				</div>
				<br/>
				<div class="row-fluid">
					<div class="span6">
						<div class="span4"></div>
						<div class="span6">
							<input class="btn" type="button" value="关 闭" onclick="window.close();"/>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>