<html>
 <head>
 <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
    <link rel="stylesheet" href="${rc.contextPath}/lib/My97DatePicker/skin/WdatePicker.css" />
	<script type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
    <script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
    <!-- animated progressbars -->
    <script src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script>
    <script src="${rc.contextPath}/js/apw/apw_check.js"></script>
    <script src="${rc.contextPath}/js/jquery.form.js"></script>
    <script src="${rc.contextPath}/js/common/common_approve.js"></script>
   
    </head>
<body>
<div id="contentwrapper">
    <div class="main_content">   
        <div class="row-fluid">
        	 <div class="row-fluid">
		   		<div class="span12">
		      		<h3 class="heading">
						志愿者信息查看
			   		</h3>
			  	</div>
			 </div> 	
    	
				    <div class="formSep">
						<div class="row-fluid">
							
							<div class="span6">
								<div class="span2">
									<span class="formTitle">姓名</span>
								</div>
								<div class="span10">
									<input id="name" readOnly <#if vbm?? && vbm.stuInfo??> value="${vbm.stuInfo.name!""?html}" </#if> />
                            	</div>
                            </div>
                            <div class="span6">
								<div class="span2">
									<span class="formTitle">学号</span>
								</div>
								<div class="span10">	
									<input id="stuNumber" readOnly <#if vbm?? && vbm.stuInfo??> value="${vbm.stuInfo.stuNumber!""?html}"</#if> />
								</div>
							</div>
						</div>
					</div>
			 	 	 <div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span2">
									<span class="formTitle">学院</span>
								</div>
	                          	<div class="span10">	
	                          		<input id="collegeName" readOnly <#if vbm?? && vbm.stuInfo??>  value="${vbm.stuInfo.college.name!""?html}"</#if> />
								</div>
							</div>
							<div class="span6">
								<div class="span2">
									<span class="formTitle">专业</span>
								</div>
	                          	<div class="span10">	
	                          		<input id="majorName" readOnly <#if vbm?? && vbm.stuInfo??>  value="${vbm.stuInfo.major.majorName!""?html}"</#if> />
								</div>
							</div>
						</div>	
                    </div>
                    <div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span2">
									<span class="formTitle">班级</span>
								</div>
	                          	<div class="span10">	
	                          		<input id="className" readOnly <#if vbm?? && vbm.stuInfo?? && vbm.stuInfo.classId??>  value="${vbm.stuInfo.classId.className!""?html}"</#if> />
								</div>
							</div>
							<div class="span6">
								<div class="span2">
									<span class="formTitle">性别</span>
								</div>
	                          	<div class="span10">	
	                          		<input id="genderName" readOnly <#if vbm?? && vbm.stuInfo??>  value="${vbm.stuInfo.genderDic.name!""?html}"</#if> />
	                          	</div>											
							</div>
							
						</div>
					</div>
					
					<div class="formSep">
						<div class="row-fluid">
							
							<div class="span6">
								<div class="span2">
									<span class="formTitle">政治面貌</span>
								</div>
								<div class="span10">	
									<input id="politicalName"  readOnly <#if vbm?? && vbm.stuInfo??&&vbm.stuInfo.politicalDic??>  value="${vbm.stuInfo.politicalDic.name!""?html}"</#if> />
								</div>
							</div>
							<div class="span6">
								<div class="span2">
									<span class="formTitle">联系电话</span>
								</div>
	                          	<div class="span10">	
	                          		<input id="phone1"  readOnly <#if vbm?? && vbm.stuInfo??>  value="${vbm.stuInfo.phone1!""?html}" </#if> />
								</div>
							</div>
						</div>
					</div>
					
	                <div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span2">
									<span class="formTitle">QQ</span>
								</div>
	                          	<div class="span10">	
	                          		<input id="qq"  readOnly<#if  vbm?? && vbm.stuInfo??>  value="${vbm.stuInfo.qq!""?html}"</#if> />
								</div>
							</div>
							<div class="span6">
								<div class="span2">
									<span class="formTitle">其他职位</span>
								</div>
	                          	<div class="span10">	
	                          		<input id="otherPosition" name="otherPosition" readOnly <#if vbm??&& vbm.otherPosition??>value="${vbm.otherPosition!""?html}" </#if>/>
								</div>
							</div>
						</div>
					</div>
					<div class="formSep"> 	
						 <div class="row-fluid">
						 	<div class="span6">
								<div class="span2">
									<span class="formTitle">是否培训</span>
								</div>
								<div class="span10">
									<#if isNoList??>
										<#list isNoList as a>
											<#if vbm ?? && vbm.isTraining??  && vbm.isTraining.id==a.id >
												<label class="radio inline"><input type="radio" name="isTraining.id" value="${a.id}"  disabled checked />${a.name?html}</label>
											<#else>												
												<label class="radio inline"><input type="radio" name="isTraining.id" value="${a.id}" disabled />${a.name?html}</label>
											
											</#if>
										</#list>
									</#if>
								</div>
							</div>
						 </div>
					</div>
				  <#if vbm.isTraining?? && vbm.isTraining.code=="Y">
					<div class="formSep" id="hideSketch">
						<div class="row-fluid">
							<div class="span6">
								<div class="span2">
									<span class="formTitle">简述<span class="f_req"></span></span>
								</div>
								<div class="span10">
									<#if vbm?? && vbm.sketch??>
									    <textarea rows="5" cols="12" readOnly id="sketch" style="width: 730px; height: 134px;">${((vbm.sketch)!"")?html}</textarea>
									<#else>
									    <textarea rows="5" cols="12" readOnly id="sketch" style="width: 730px; height: 134px;"></textarea>
									</#if>	
								</div>
						   </div>
						</div>
					</div>  
				  </#if>
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span2">
									<span class="formTitle">注册号</span>
								</div>
								<div class="span10">	
									<input id="registerNum" readOnly <#if vbm?? > value="${vbm.registerNum!""?html}"</#if> />
								</div>
							</div>
							<div class="span6">
								<div class="span2">
									<span class="formTitle">申请时间</span>
								</div>
	                          	<div class="span10">	
	                          		<input id="applyTime"  readOnly<#if  vbm?? && vbm.applyTime??>  value="${vbm.applyTime?date}"</#if> />
								</div>
							</div>
							
						</div>
					</div>
					<div class="formSep">
						<div class="row-fluid">
							<div class="span6">
								<div class="span2">
									<span class="formTitle">特长爱好<span class="f_req"></span></span>
								</div>
								<div class="span10">
									<#if vbm?? && vbm.hobby??>
									    <textarea rows="5" cols="12" readOnly id="hobby" name="hobby"  style="width: 730px; height: 134px;">${((vbm.hobby)!"")?html}</textarea>
									<#else>
									    <textarea rows="5" cols="12" readOnly id="hobby" name="hobby"  style="width: 730px; height: 134px;"></textarea>
									</#if>	
								</div>
						   </div>
						</div>
					</div>  
					<div class="formSep">
						<div class="row-fluid">
							<div class="span12">
								<span class="span1">荣誉列表<span class="f_req"></span></span>
	                          	<div class="span8">	
	                          		<table class="table table-bordered table-striped tablecut" id="smpl_tbl" width="788px;">
										<thead>
											<tr>
												<th width="7%">序号</th>
												<th width="18%">荣誉学年</th>
												<th width="18%">荣誉学期</th>
												<th width="18%">荣誉名称</th>
												<th width="17%">荣誉时间</th>
												<th width="18%">荣誉级别</th>
											</tr>
										</thead>
										<tbody>
											<#if honorList??>	
											  <#list honorList as h>
											  	<tr>
													<td class="autocut">${h_index+1}	</td>
													<td class="autocut">${h.honorYear.name!''}	</td>
													<td class="autocut">${h.honorTerm.name!''}	</td>
													<td class="autocut">${h.honorName!''}	</td>
													<td class="autocut"><#if h.honorTime??>${h.honorTime?date}</#if></td>
													<td class="autocut">${h.honorLevel.name!''}	</td>
												</tr>
											  </#list>
										    </#if> 
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
					 <div class="formSep">
						<div class="row-fluid">					
						  <div class="span12">
						       <div class="span1">
								 <label>荣誉附件</label>
							   </div>
								<div class="span8" >
									 <#if honorFilelist??>	
										<#list honorFilelist as h>
											<#list h as p>
												<div class="fileupload-info">
													<a href="${rc.contextPath}/sys/sysConfig/file.do?id=${p.uploadFile.id}"><strong>${p.uploadFile.name}&nbsp;(${p.uploadFile.fileSize})</strong></a>
													<input   type="hidden" id="fileId" name="fileId" value="${p.uploadFile.id}"/>	
												</div>	
											</#list>				
										</#list>
									 </#if> 
								</div>
							</div>
						 </div>
					 </div>
					<div class="formSep">
						<div class="row-fluid">
							<div class="span12">
								<span class="span1">服务列表<span class="f_req"></span></span>
	                          	<div class="span8">	
	                          		<table class="table table-bordered table-striped tablecut" id="smpl_tbl" width="788px;">
										<thead>
											<tr>
												<th width="7%">序号</th>
												<th width="20%">服务时间</th>
												<th width="20%">服务时长</th>
												<th width="53%">服务记录</th>
											</tr>
										</thead>
										<tbody>
											<#if serviceList??>	
											  <#list serviceList as h>
											  	<tr>
													<td class="autocut">${h_index+1}	</td>
													<td class="autocut">${h.serviceDate?date}	</td>
													<td class="autocut">${h.serviceHour}	</td>
													<td class="autocut">${h.serviceRecord}	</td>
												</tr>
											  </#list>
										    </#if> 
										</tbody>
									</table>
								</div>
							</div>
						</div>
					</div>
	     			<div class="formSep">
						<div class="row-fluid">					
						  <div class="span12">
						       <div class="span1">
								 <label>服务附件</label>
							   </div>
								<div class="span8" >
									 <#if serviceFilelist??>	
										<#list serviceFilelist as s>
											<#list s as p>
												<div class="fileupload-info">
													<a href="${rc.contextPath}/sys/sysConfig/file.do?id=${p.uploadFile.id}"><strong>${p.uploadFile.name}&nbsp;(${p.uploadFile.fileSize})</strong></a>
													<input   type="hidden" id="fileId" name="fileId" value="${p.uploadFile.id}"/>	
												</div>	
											</#list>				
										</#list>
									 </#if> 
								</div>
							</div>
						 </div>
					 </div>
			<br/> 
	    <div class="row-fluid">
		 	<div class="span6">
		  		<div class="span2">
		   		</div>
		   		<div class="span10">
					<button class="btn btn-info" type="button" onclick="approve.showApproveComments('${vbm.id!""}');">审核历史</button>
		  			<button class="btn" type="button" onclick="javascript:window.close();">关 闭</button>
		   		</div>
		   	</div>
		</div>
        </div>
    </div>
     <#-- 审核历史弹出框  end-->
	<#include "/common/approve/approveComment.ftl">
 <script>
 
  
 </script>
</body>
</html>