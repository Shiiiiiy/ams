<html>
 <head>
       <link rel="stylesheet" href="${rc.contextPath}/lib/jquery-ui/css/Aristo/Aristo.css" />
       
        <script src="${rc.contextPath}/lib/jquery-ui/jquery-ui-1.8.20.custom.min.js"></script>
        <!-- animated progressbars -->
        <script src="${rc.contextPath}/js/bdp_fileupload.progressbar.js"></script>
        <script src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script>
        <!-- ajax form-->
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
		<script src="${rc.contextPath}/js/apw/apw_check.js"></script>
		<!-- bootstrap-fileupload -->	
		<link rel="stylesheet" href="${rc.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.min.css" />
		<!--date-->
		<script language="javascript" type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>	
		<!-- multiselect -->
	    <link rel="stylesheet" href="${rc.contextPath}/lib/multiselect/css/multi-select.css" />
		<script src="${rc.contextPath}/lib/multiselect/js/jquery.multi-select.min.js"></script>
    </head>
<body>
<div id="contentwrapper">
	<div class="main_content">
  		<div class="row-fluid">
	    	<div class="row-fluid">
		   		<div class="span12">
			   		<h3 class="heading">团员查看</h3>
			 		<input name="errorText" id="errorText" type="hidden" value="${errorText!""}"/>
		   		</div>
			</div> 
				<#if member??>
				 		<input type="hidden" id="id" name="id" value="${(member.id!"")?html}"/>	
						<input type="hidden" id="stuInfo.id" name="stuInfo.id" value="${(member.stuInfo.id!"")?html}"/>	
				 <#else>	
				 		<input type="hidden" id="id" name="id"/>	
				 </#if>

			 	<div class="formSep"> 
			 		<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<span class="formTitle">姓名</span>
							</div>
							<div class="span9">
								<input id="stuInfo.name"  readOnly <#if member?? && member.stuInfo??> value="${(member.stuInfo.name!"")?html}" </#if>/>
							</div>
						</div>
					    <div class="span6">
							<div class="span3">
								<span class="formTitle">学号</span>
							</div>
							<div class="span9">
								<input id="stuNumber"  readOnly value="${((member.stuInfo.stuNumber)!"")?html}"/>
							</div>
					    </div>                
				    </div>
			    </div>
			    
			    <div class="formSep"> 
			   		<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<span class="formTitle">性别</span>
							</div>
							<div class="span9">
							 <#if genderList??>
								<#list genderList as a>
					    			<#if member ?? && member.stuInfo?? && member.stuInfo.genderDic?? && member.stuInfo.genderDic.id==a.id >
											<input  id="sexId"  readOnly value="${a.name}" />
					    		   </#if>
			    			  	</#list>
			    			 </#if>
							</div>
						</div>
						<div class="span6">
							<div class="span3">
								<span class="formTitle">籍贯</span>
							</div>
							<div class="span9">
								<input id="native" readOnly <#if member?? && member.stuInfo?? && member.stuInfo.nativeDic??>  value="${((member.stuInfo.nativeDic.name)!"")?html}"</#if>/>
							</div>
						</div>
				  </div>
			  </div>
			   
			 <div class="formSep"> 
			  	<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<span class="formTitle">出生年月</span>
						</div>
						<div class="span9">
							<input id="brithDate"  readOnly <#if member?? && member.stuInfo?? && member.stuInfo.brithDate??> value="${(member.stuInfo.brithDate!"")?string("yyyy-MM-dd")}"</#if>/>
						</div>
					</div>
					<div class="span6">
						<div class="span3">
							<span class="formTitle">政治面貌</span>
						</div>
						<div class="span9">
							<select size="1" id="memberType" disabled  aria-controls="dt_gal" >
								<option value="" >请选择</option>
								<#if politicalList??>
									<#list politicalList as c>
										<#if member?? && member.memberType?? && member.memberType.id??&& c.id==member.memberType.id>
											<option value="${c.id}" selected="selected">${c.name?html}</option>
										<#elseif c.code!="2">
											<option value="${c.id}">${c.name?html}</option>
										</#if>
									</#list>
								</#if>
							</select>
								
						</div>
					</div>	
				 </div>
			 </div>
			
			 <div class="formSep"> 
			     <div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<span class="formTitle">入团时间</span>
						</div>
						<div class="span9">
							<input type="text" readOnly  <#if member?? && member.joinTime??> selected  value="${(member.joinTime!"")?date}"</#if>/>
						</div>
					</div>
					<#if member?? && member.partyTime??>
						<div class="span6">
							<div class="span3">
								<span class="formTitle">入党时间</span>
							</div>
							<div class="span9">
								<input type="text" readOnly   selected  value="${(member.partyTime!"")?date}"/>
							</div>
						</div>
					</#if>
	  			</div>
   			</div>
   			<div class="formSep"> 
			 	<div class="row-fluid">
			   		<div class="span6">
						<div class="span3">
							<span class="formTitle">是否团支书</span>
						</div>
						<div class="span9">
							<#if isNoList??>
								<#list isNoList as a>
									<#if member ?? && member.isSecretary??  && member.isSecretary.id==a.id >
										<label class="radio inline"><input type="radio" name="isSecretary.id" value="${a.id}" disabled checked />${a.name?html}</label>
									<#else>
										<label class="radio inline"><input type="radio" name="isSecretary.id" value="${a.id}" disabled />${a.name?html}</label>
									</#if>
								</#list>
							</#if>
						</div>
					</div>
					<div class="span6">
						<div class="span3">
							<span class="formTitle">团内外职务</span>
						</div>
						<div class="span9">
							<input id="leaguePosition"  name="leaguePosition"  <#if member?? && member.leaguePosition??> 
								value="${(member.leaguePosition!"")?html}" </#if> readonly/>
						</div>
					</div>
			   	</div>
			</div>
   			<div class="formSep"> 
			     <div class="row-fluid">
					 <div class="span6">
							<div class="span3">
								<span class="formTitle">参加团干培训</span>
							</div>
							<div class="span9">
								<#if isNoList??>
									<#list isNoList as a>
										<#if member ?? && member.isTrianing??  && member.isTrianing.id==a.id >
											<label class="radio inline"><input type="radio" name="isTrianing.id" value="${a.id}" disabled checked />${a.name?html}</label>
										<#else>
											<label class="radio inline"><input type="radio" name="isTrianing.id" value="${a.id}"  disabled/>${a.name?html}</label>
										
										</#if>
									</#list>
								</#if>
							</div>
					 </div>          
					 <div class="span6" id="hideTrianingTime">
						<div class="span3">
							<span class="formTitle">团干培训时间<span class="f_req"></span></span>
						</div>
						<div class="span5">
								<input  id="trianingTime" name="trianingTime"  <#if member?? && member.trianingTime??>value="${(member.trianingTime)?date}"</#if>" 
									class="Wdate" readOnly/>
						</div>
					 </div>
			     </div>
   			</div>
   			
   			<div class="formSep"> 
			   <div class="row-fluid">
			   		  <div class="span6">
							<div class="span3">
								<span class="formTitle">递交入党申请</span>
							</div>
							<div class="span9">
								<#if isNoList??>
									<#list isNoList as a>
										<#if member ?? && member.isPartyApply??  && member.isPartyApply.id==a.id >
											<label class="radio inline"><input type="radio" name="isPartyApply.id"  value="${a.id}" disabled checked />${a.name?html}</label>
										<#else>
											<label class="radio inline"><input type="radio" name="isPartyApply.id"   value="${a.id}" disabled />${a.name?html}</label>
										</#if>
									</#list>
								</#if>
							</div>
					 </div>          
			   		<div class="span6" id="hidePartyApplyTime">
						<div class="span3">
							<span class="formTitle">入党申请时间</span>
						</div>
						<div class="span9">
                        <input id="time12" name="partyApplyTime" class="Wdate"
							<#if member?? && member.partyApplyTime??>value="${(member.partyApplyTime)?date}"</#if> readonly/>			
						</div>
					</div>
			   </div>
   			</div>
   			
   			<div class="formSep"> 
			   <div class="row-fluid">
			   		<div class="span6">
						<div class="span3">
							<span class="formTitle">是否被推优</span>
						</div>
						<div class="span9">
							<#if isNoList??>
								<#list isNoList as a>
									<#if member ?? && member.isRecommoned??  && member.isRecommoned.id==a.id >
										<label class="radio inline"><input type="radio" name="isRecommoned.id" value="${a.id}" disabled checked />${a.name?html}</label>
									<#else>
										<label class="radio inline"><input type="radio" name="isRecommoned.id" value="${a.id}" disabled />${a.name?html}</label>
									</#if>
								</#list>
							</#if>
						</div>
					</div>
					<div class="span6" id="hideRecommonedTime">
						<div class="span3">
							<span class="formTitle">推优时间<span class="f_req"></span></span>
						</div>
						<div class="span5">
								<input type="text" readOnly id="recommonedTime" name="recommonedTime"  <#if member?? && member.recommonedTime??>value="${(member.recommonedTime)?date}"</#if>" 
									class="Wdate"  />
						</div>
					</div>
			   </div>
			</div>
			<div class="formSep"> 
			 	<div class="row-fluid">
			   		
					<div class="span6">
						<div class="span3">
							<span class="formTitle">获得团内外荣誉</span>
						</div>
						<div id="isHonor" class="span9">
							<#if isNoList??>
								<#list isNoList as a>
									<#if member??&& (!member.isHaveHonor??) >
										<#if a.code=="N">
											<label class="radio inline"><input type="radio"  value="${a.id}" disabled checked />${a.name?html}</label>
										<#else>
											<label class="radio inline"><input type="radio"  value="${a.id}" disabled />${a.name?html}</label>
										</#if>
									<#else>
										<#if member ?? && member.isHaveHonor??  && member.isHaveHonor.id==a.id >
											<label class="radio inline"><input type="radio"   name="isHaveHonor.id" value="${a.id}"  disabled checked />${a.name?html}</label>
										<#else>
											<label class="radio inline"><input type="radio"  name="isHaveHonor.id" value="${a.id}"   disabled />${a.name?html}</label>
										</#if>
									</#if>
								</#list>
							</#if>
						</div>
					</div>
			   	</div>
			</div>
			<div class="formSep">
				<div class="row-fluid">
					<div class="span9">
						<div class="span2">荣誉列表</div>
						<div class="span10">
								<div role="grid" class="dataTables_wrapper form-inline" id="dt_gal_wrapper">	
									<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
										<thead>
											<tr>
												<th width="7%">序号</th>
												<th width="10%">姓名</th>
												<th width="15%" >学号</th>
												<th width="20%" >荣誉名称</th>
												<th width="15%" >获得荣誉时间</th>
												<th width="15%" >获得荣誉级别</th>
												<th width="10%" >操作</th>
											</tr>
										</thead>
										<tbody>
											   <#if honorList  ??>
												 <#list honorList as h>
												  <tr>
													<td class="autocut">${h_index+1}</td>								
													<td class="autocut">${h.memberInfo.stuInfo.name?html}</td>
											    	<td class="autocut">${h.memberInfo.stuInfo.stuNumber?html}</td>
											    	<td class="autocut">${h.honorName?html}</td>
											    	<td class="autocut">${h.honorTime?date}</td>
											    	<td class="autocut"><#if h.honorLevel??>${h.honorLevel.name?html}</#if></td>
											    	<td class="autocut">
											    			<a href="${rc.contextPath}/league/leagueManage/opt-view/viewMemberHonor.do?id=${h.id}&memberId=${(member.id!"")?html}" target="_blank" title="查看荣誉信息"> <i class="icon-list-alt"></i></a>										
											    	</td>
													
												 </tr>
											  </#list>	
											</#if>
										</tbody>
									</table>
								</div>
						</div>
					</div>
				</div>
			</div>
		
			<!--<div class="formSep">
				<div class="row-fluid">
					<div class="span9">
						<div class="span2">荣誉附件</div>
						<div class="span10">
							<#if fileList??>	
								<#list fileList as p>
										<div class="fileupload-info">
											<a href="${rc.contextPath}/sys/sysConfig/file.do?id=${p.uploadFile.id}"><strong>${p.uploadFile.name}&nbsp;(${p.uploadFile.fileSize})</strong></a>
											<input   type="hidden" id="fileId" name="fileId" value="${p.uploadFile.id}"/>	
										</div>	
								</#list>
							 </#if> 
						</div>
					</div>
				</div>
			</div>	-->
			 
			<div class="row-fluid">					
				<div class="span6">
					<div class="span3">
					</div>
					<div class="span9" style="padding:10px 0px 0px 0px">
		  				<button class="btn" type="button" onclick="javascript:window.close();">关 闭</button>
					</div>
				</div>
			</div>
	   
 	 </div>
  </div>
 </div>
 </div>
 </div>
 <script>
 	$("document").ready(function(){
		var trianingVal=$('input:radio[name="isTrianing.id"]:checked').val();
		var partyApplyVal=$('input:radio[name="isPartyApply.id"]:checked').val();
		var recommonedVal=$('input:radio[name="isRecommoned.id"]:checked').val();
		if(trianingVal=="4028900f40cd477c0140cd4afd8d0001"){
	     	$("#hideTrianingTime").show();
	    }else{
	     	$("#hideTrianingTime").hide();
	    }
		if(partyApplyVal=="4028900f40cd477c0140cd4afd8d0001"){
	     	$("#hidePartyApplyTime").show();
	    }else{
	     	$("#hidePartyApplyTime").hide();
	    }
	    if(recommonedVal =="4028900f40cd477c0140cd4afd8d0001"){
	     	$("#hideRecommonedTime").show();
	    }else{
	     	$("#hideRecommonedTime").hide();
	    }
	});
	
 </script>
</body>
</html>
					   