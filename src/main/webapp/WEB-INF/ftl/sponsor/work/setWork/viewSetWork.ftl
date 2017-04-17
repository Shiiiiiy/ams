<html>
 <head>
      <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- jQuery UI theme-->
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
		<!-- multiselect -->
	    <link rel="stylesheet" href="${rc.contextPath}/lib/multiselect/css/multi-select.css" />
		<script src="${rc.contextPath}/lib/multiselect/js/jquery.multi-select.min.js"></script>	
   		<script src="${rc.contextPath}/js/common/common_approve.js"></script>
  </head>
<body>
<div id="contentwrapper">
 	<div class="main_content">
  		<div class="row-fluid">
    		<div class="row-fluid">
	   			<div class="span12">
		      		<h3 class="heading">
						岗位设置查看
			   		</h3>
		  		</div>
		 	</div> 
	    	<div class="formSep"> 
		   		<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<lable>学年<span class="f_req"></span></lable>
						</div>
						<div class="span9">
							<select disabled="disabled" size="1" id="schoolYear" name="schoolYear.id" aria-controls="dt_gal" >
								<option   selected="selected">${workOrg.schoolYear.name?html}</option>
						    </select>
						</div>
					</div>
					
					<div class="span6">
						<div class="span3">
							<lable>学期<span class="f_req"></span></lable>
						</div>
						<div class="span9">
							<select disabled="disabled" size="1" id="term" name="term.id" aria-controls="dt_gal" onchange="changeTerm()">
									<option value="" >请选择</option>
									<option   selected="selected">${workOrg.term.name?html}</option>
							</select>
						</div>
				  	</div>
			  	</div>
		   	</div>
		 	<div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<lable>用工部门<span class="f_req"></span></lable>
						</div>
						<div class="span9">
							<input id="org.id" type="hidden" name="workOrg.org.id"  value="${(workOrg.org.id)!""}"/>
							<input readOnly id="org.name" name="workOrg.org.name"  readOnly   title="${(workOrg.org.name)!""}" value="${(workOrg.org.name)!""}" />
						</div>
					</div>
					
					<div class="span6">
						<div class="span3">
							<lable>用工岗位数<span class="f_req"></span></lable>
						</div>
						<div class="span9">
						 <input  readOnly id="workJobNumber" name="workJobNumber"  value="${(workOrg.workJobNumber)!""}" 
								class="{required:true,minlength:1,maxlength:32,intCheck:true,messages:{required:'岗位数不能为空'}}" />
						</div>
					 </div>
			  	</div>
		   	</div>
			  
		 	<div class="formSep"> 
		   		<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<lable>工作时间(小时/天)<span class="f_req"></span></lable>
						</div>
						<div class="span9">
							<input readOnly id="workTime" name="workTime"  value="${(workOrg.workTime)!""}"  
								class="{required:true,minlength:1,maxlength:32,workTimeCheck:true,messages:{required:'工作时间不能为空'}}"/>
						</div>
					</div>
					<div class="span6">
						<div class="span3">
							<lable>预算金额(元/月)<span class="f_req"></span></lable>
						</div>
						<div class="span9">
							<input readOnly id="budgetSalary" name="budgetSalary"  value="${(workOrg.budgetSalary)!""}" 
								class="{required:true,minlength:1,maxlength:32,floatCheck:true,messages:{required:'预算金额不能为空'}}"/>
						</div>
					</div>
			  	</div>
		   	</div>
		  	</br>		   
			<div class="row-fluid">
				<div class="span6">
					<div class="span3">
						<label>申请理由<span class="f_req"></span></label>
				 	</div>
					<div class="span9">
						<#if workOrg?? && workOrg.applyReason??>
						    <textarea readOnly rows="5" cols="12" id="applyReason" name="applyReason"  style="width: 775px; height: 134px;">${(workOrg.applyReason!"")}</textarea>
						<#else>
						    <textarea   readOnly rows="5" cols="12" id="applyReason" name="applyReason"   style="width: 775px; height: 134px;"></textarea>
						</#if>	
					</div>
			  	</div>
			</div>
		  	<div class="formSep">
		   		<div class="span12">
					<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" setWork="grid">
				 		<div class="row">
                  			<div class="span6">
            					<div class="dt_actions">
		                      		<div class="btn-group">
		                      			</br>
		                       			<#if !(sponsorPosition?? && sponsorPosition.id)??>
		        						 	<button class="btn btn-info" type="button" onclick="addTable()">新 增</button>
		          				 		</#if>
		              				</div>
                   				</div>
		           			</div>
		       			</div>
		       	
					    <div class="formSep">
						   <div class="row-fluid">
								<div class="span9">
									<div class="span2">
										<lable>岗位列表</lable>
									</div>
									<div class="span10">
										<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
											<thead>
												<tr>
													<th width="7%">序号</th>
													<th width="30%">岗位名称</th>
													<th width="25%" >岗位说明</th>
													<th width="25%">岗位人数</th>
												</tr>
											</thead>
											<tbody>
											   	<#if allPosition  ??>
													<#list allPosition as p>
													  <tr>
														<td class="autocut">${p_index+1}</td>								
														<td class="autocut">${(p.workName)!""} </td>
												    	<td class="autocut">${(p.workDesc)!""}	</td>
														<td class="autocut">${(p.workNumber)!""}</td>
													 </tr>
											  		</#list>	
												</#if>
											</tbody>
										</table>
								 	</div>
				  				</div>
		        			 </div>
			    		</div>
			    		 <br/> 
			    		<div class="row-fluid">
							<div class="span6">
								<div class="span3">
									
							 	</div>
								<div class="span9">
									<button class="btn btn-info" type="button" onclick="approve.showHis('${(workOrg.workOrgId)!""}');">审批历史</button>
									<button class="btn" type="button" onclick="javascript:window.close();">关闭</button>
									
								</div>
						  	</div>
						</div>
    				</div>
		       	</div>
		      </div>
   			</div>
  		</div>
  	 <#-- 审核历史查看 -->
	 <#include "/apw/instance/approveHistory.ftl">   
</div>
	

</body>
</html>
