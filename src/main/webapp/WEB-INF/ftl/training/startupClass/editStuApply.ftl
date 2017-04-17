 <html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- ajax form-->
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
		<script src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
		<script src="${rc.contextPath}/lib/jquery-ui/jquery-ui-1.8.20.custom.min.js"></script>
		<script src="${rc.contextPath}/js/bdp_fileupload.progressbar.js"></script>
		<script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
		<link rel="stylesheet" href="${rc.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.min.css" />
		<!-- multiselect -->
	    <link rel="stylesheet" href="${rc.contextPath}/lib/multiselect/css/multi-select.css" />
		<style>
			.modal{width:320px;margin-top:-180px;margin-left:-80px}
			.fileupload-info{width:740px}
		</style>
    </head>
    <body>
		<div id="contentwrapper">
		    <div class="main_content">
				<h3 class="heading">学生报名调整页面</h3>
				<h4 class="heading">学生信息</h3>
				<div class="row-fluid">
					<div class="formSep">
	    				<div class="row-fluid">
	    					<div class="span6">
	    						<div class="span3">
			    					<span class="formTitle">姓名</span>
	    						</div>
	    						<div class="span9">
			    					<input id="stuName" name="studentId.name" value="${applyInfo.studentId.name!""}" readonly>
	    						</div>
	    					</div>
	    					<div class="span6">
	    						<div class="span3">
			    					<span class="formTitle">学号</span>
	    						</div>
	    						<div class="span9">
			    					<input id="stuNumber" name="studentId.stuNumber" value="${applyInfo.studentId.stuNumber!""}" readonly>
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
			    					<input id="genderDic" name="studentId.genderDic.name" value="${applyInfo.studentId.genderDic.name!""}" readonly>
	    						</div>
	    					</div>
	    					<div class="span6">
	    						<div class="span3">
			    					<span class="formTitle">学院</span>
	    						</div>
	    						<div class="span9">
			    					<input id="college" name="studentId.college.name" value="${applyInfo.studentId.college.name!""}" readonly>
	    						</div>
	    					</div>
						</div>
					</div>
					<div class="formSep">
	    				<div class="row-fluid">
	    					<div class="span6">
	    						<div class="span3">
			    					<span class="formTitle">专业</span>
	    						</div>
	    						<div class="span9">
			    					<input id="majorName" name="studentId.major.majorName" value="${applyInfo.studentId.major.majorName!""}" readonly>
	    						</div>
	    					</div>
	    					<div class="span6">
	    						<div class="span3">
			    					<span class="formTitle">班级</span>
	    						</div>
	    						<div class="span9">
			    					<input id="className" name="studentId.classId.className" value="${applyInfo.studentId.classId.className!""}" readonly>
	    						</div>
	    					</div>
						</div>
					</div>
				</div>
				
					<h4 class="heading">创业班信息</h3>
			<div id="growthClassInclude">
				
				
		    		<form id="saveStuApprove" method="post" action="">
		    			<input type="hidden" id="applyInfoId" name="id" value="${applyInfo.id!""}">
		    			<input type="hidden" id="oldClassId" name="oldClassId" value="${(applyInfo.growthId.id)!""}">
		    			<input type="hidden" id="type" name="type" value="${type!""}">
		    			<input type="hidden" id="checkFlag" name="checkFlag" value="true"/>
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span3">
				    					<span class="formTitle">创业班名称</span>
		    						</div>
		    						<div class="span9">
		    							<select size="1" id="growthClassName" name="growthId.id" aria-controls="dt_gal" class="selectoption" onchange="changeClassInfo(this)">
											<#list classInfoList as d>
												<#if applyInfo?? &&applyInfo.growthId?? && applyInfo.growthId.growthClassName==d.growthClassName>
	    					    	            	<option  value="${d.id}" selected="selected">${d.growthClassName?html}</option>
	    					    	            <#else>
	    					    	            	<option  value="${d.id}" >${d.growthClassName?html}</option>
	    					    	            </#if>
											</#list>
										</select>
		    						</div>
		    					</div>
		    					<div class="span6">
		    						<div class="span3">
		    				    		<span class="formTitle">创业班类型</span>
		    						</div>
		    				    	<div class="span9">
		    				    		<input id="growthClassType" name="growthId.growthClassType.code" value="${applyInfo.growthId.growthClassType.name!""}" readonly>
									</div>
	    				    	</div>
		    				</div>
	    				</div>
		    		</form>	
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span3">
			    				    	<span class="formTitle">创业班主题</span>
		    						</div>
		    						<div class="span9">
										<input id="growthClassTheme" name="growthClassTheme"  value="${applyInfo.growthId.growthClassTheme!""}" readonly>
		    						</div>
		    				    </div>
		    					<div class="span6">
		    						<div class="span3">
			    				    	<span class="formTitle">班主任</span>
		    						</div>
		    				    	<div class="span9">
		    				    		<input id="growthClassLeader" name="growthClassLeader"  value="${applyInfo.growthId.growthClassLeader.name!""}" readonly>
									</div>
		    				    </div>
		    				</div>
		    			</div>
		    			
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span3">
			    				    	<span class="formTitle">报名截止日期</span>
		    						</div>
		    						<div class="span9">
		    							<input id="applyEndDate" name="growthId.applyEndDate"  value="${applyInfo.growthId.applyEndDate?string('yyyy-MM-dd')!""}" readonly>
		    						</div>
		    				    </div>
		    					<div class="span6">
		    						<div class="span3">
			    				    	<span class="formTitle">计划开班日期</span>
		    						</div>
		    				    	<div class="span9">
		    							<input id="classBeginDate" name="growthId.classBeginDate"  value="${applyInfo.growthId.classBeginDate?string('yyyy-MM-dd')!""}" readonly>
									</div>
		    				    </div>
		    				</div>
		    			</div>
		    			
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span3">
			    				    	<span class="formTitle">计划结班日期</span>
		    						</div>
		    						<div class="span9">
		    							<input id="planEndDate" name="growthId.planEndDate"  value="${applyInfo.growthId.planEndDate?string('yyyy-MM-dd')!""}" readonly>
		    						</div>
		    				    </div>
		    				</div>
		    			</div>
		    			
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
	    				    		<div class="span3">
		    				    		<span class="formTitle">备注</span>
	    				    		</div>
		    				    	<div class="span9">
										<textarea id="comments" name="comments" col="12" rows="3" style="width: 770px; height: 111px;" readonly>${applyInfo.growthId.comments!""}</textarea>
										</br>
										<font size="1" color="grey"  style="vertical-align:bottom;">(备注不超过500字)</font>
									</div>
	    				    	</div>
		    				</div>
		    			</div>
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span3">
							    		<label>附件</label>
							    	</div>
		    				    	<div class="span9">
										 <#if uploadFileRefList??>	
											<#list uploadFileRefList as p>
												<div class="fileupload-info">
													<a href="${rc.contextPath}/sys/sysConfig/file.do?id=${p.uploadFile.id}"><strong>${p.uploadFile.name}&nbsp;(${p.uploadFile.fileSize})</strong></a>
													<input type="hidden" id="fileId" name="fileId" value="${p.uploadFile.id}">	
												</div>					
											</#list>
										 </#if>
									</div>
		    				    </div>
		    				</div>
		    			</div>
			</div>
				
				 <br/>
	    		<div class="row-fluid">
					<div class="span6">
						<div class="span3">
		        		</div>
			    		<div class="span9" >
			    			<#if type?? && type=='set'>
			    				<button class="btn btn-info" onclick="saveStuApprove('0')">确 定</button>
			    			<#else>
			    				<button class="btn btn-info" onclick="saveStuApprove('0')">通 过</button>
			              		<button class="btn btn-info" onclick="saveStuApprove('1')">拒 绝</button>
			    			</#if>
			              	<button class="btn" onclick="javascript:window.history.back(-1);">取 消</button>
		           		</div>
		           	</div>
		         </div>
		                
			           
	    </div>
	    </div>
	    </div>       		
		<script>
			//保存
			function saveStuApprove(flag){
				var type = $("#type").val();
				var checkFlag = $("#checkFlag").val();
				if(checkFlag == 'true') {
					if(type != "undefined" && type != "null" && type != "") {
						$("#saveStuApprove").attr("action","${rc.contextPath}/training/startupclass/opt-save/saveStuApprove.do");
						$("#saveStuApprove").submit();
					}else{
						$("#saveStuApprove").attr("action", "${rc.contextPath}/training/approveclass/opt-save/saveStuApprove.do?flag="+flag);
						$("#saveStuApprove").attr("method", "post");
						$("#saveStuApprove").submit();
					}
				}else{
					comp.message("该学生已经报名该班，无法保存调整，请重新选择!","info");
				}
			}
			
			//切换创业班
			function changeClassInfo(obj){
				var classInfoId = $(obj).val();
				var oldClassInfoId = $("#oldClassId").val();
				var stuNumber = $('#stuNumber').val();
				var applyInfoId = $("#applyInfoId").val();
				$("#checkFlag").val('true');
				//if(classInfoId != oldClassInfoId) {
					$.ajax({
						url:"${rc.contextPath}/training/checkClass/opt-query/checkClassInfoJson.do",
						type:"post",
						data:{"applyId":applyInfoId,"classId":classInfoId, "stuNumber":stuNumber},
						success:function(data) {
							var dataObj = eval("(" + data + ")");
							if(dataObj.flag == 'true') {
								$("#checkFlag").val('false');
								comp.message("该学生已经报名该班，无法调整，请重新选择!","info");
								//$("#growthClassName").val(oldClassInfoId);
							}
							else {
								
								/*
									$.ajax({
										url: "${rc.contextPath}/training/approveclass/opt-query/queryClassInfoJson.do",
										async:false,
										cache:false,
										type:"post",
										data:{"id":classInfoId},
										success:function(info){
											if(info != null){
												var infoObj = eval("(" + info + ")");
												$("#growthClassType").val(infoObj.growthClassType);
												$("#growthClassTheme").val(infoObj.growthClassTheme);
												$("#growthClassLeader").val(infoObj.growthClassLeader);
												$("#applyEndDate").val(infoObj.applyEndDate);
												$("#classBeginDate").val(infoObj.classBeginDate);
												$("#planEndDate").val(infoObj.planEndDate);
												$("#comments").val(infoObj.comments);
											}
										}
									});
									*/
								$("#growthClassInclude").load("${rc.contextPath}/training/changeclass/nsm/changeGrowthClass.do",{"classId":classInfoId,"id":applyInfoId},function(){});
								$("#checkFlag").val('true');	
							}
						}
					});
			//	}else {
			//		$("#checkFlag").val('true');
			//	}
			}
			
			$("document").ready(function(){
           		$("#editClassInfo").compValidate({
					rules:{     
					},
					messages:{
					}
				});
			});
			
		$(function(){
			$('.tipTag').poshytip({
				className: 'tip-yellowsimple',
				showOn: 'hover',
				alignTo: 'target',
				alignX: 'right',
				alignY: 'center',
				offsetX: 5
			});
		});	
		</script>	           		
	</body>
</html>