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
    					<div class="span6">
	    					<div class="span3">
	    						<span>人员列表</span>
	    					</div>
	    					<div class="span9">
	    					<div id="dt_gal_wrapper"  style="width:785px;" role="grid">
		    					<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
	           						<thead>
										<tr>
											<th width="5%" style="text-align: center">姓名</th>
											<th width="5%" style="text-align: center">学号</th>
											<th width="5%" style="text-align: center">学院</th>
											<th width="5%" style="text-align: center">专业</th>
											<th width="5%" style="text-align: center">班级</th>
										</tr>
									</thead>
									<tbody id="tbodyId">
											<#if applyInfoList??>
												<#list applyInfoList as p>
													<tr>
														<td class="autocut" style="text-align: center">${p.studentId.name}</td>
														<td class="autocut" style="text-align: center">${p.studentId.id}</td>
														<td class="autocut" style="text-align: center">${p.studentId.college.name}</td>
														<td class="autocut" style="text-align: center">${p.studentId.major.majorName}</td>
														<td class="autocut" style="text-align: center">${p.studentId.classId.className}</td>
													<tr>
												</#list>
											</#if>
									</tbody>
								</table>
		    				</div>
	    				</div>
					</div>
				</div>
				<h4 class="heading">创业班信息</h3>
		    	<div class="row-fluid">
		    		<form id="saveStuApprove">
		    			<input type="hidden" name="applyInfoIds" value="${applyInfoIds}">
		    			<input type="hidden" id="checkFlag" name="checkFlag" value="true"/>
		    			<input type="hidden" id="oldClassId" name="oldClassId" value="${(applyInfo.growthId.id)!""}"/>
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span3">
				    					<span>创业班名称</span>
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
		    				    		<span>创业班类型</span>
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
			    				    	<span>创业班主题</span>
		    						</div>
		    						<div class="span9">
										<input id="growthClassTheme" name="growthClassTheme"  value="${applyInfo.growthId.growthClassTheme!""}" readonly>
		    						</div>
		    				    </div>
		    					<div class="span6">
		    						<div class="span3">
			    				    	<span>班主任</span>
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
			    				    	<span>报名截止日期</span>
		    						</div>
		    						<div class="span9">
		    							<input id="applyEndDate" name="growthId.applyEndDate"  value="${applyInfo.growthId.applyEndDate?string('yyyy-MM-dd')!""}" readonly>
		    						</div>
		    				    </div>
		    					<div class="span6">
		    						<div class="span3">
			    				    	<span>计划开班日期</span>
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
			    				    	<span>计划结班日期</span>
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
		    				    		<span>备注</span>
	    				    		</div>
		    				    	<div class="span9">
										<textarea id="comments" name="comments" col="12" rows="3" style="width: 770px; height: 111px;" readonly>${applyInfo.growthId.comments!""}</textarea>
										</br>
										<font size="1" color="grey"  style="vertical-align:bottom;">(备注不超过500字)</font>
									</div>
	    				    	</div>
		    				</div>
		    			</div>
		    		<#-->	
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span4">
							    		<label>附件</label>
							    	</div>
		    				    	<div class="span4">
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
    				<-->	
	        		<br/>
		    		<div class="row-fluid">
						<div class="span6">
							<div class="span3">
			        		</div>
				    		<div class="span9" >
				              	<button class="btn btn-info" onclick="saveMulStuApprove('0')">通 过</button>
				              	<button class="btn btn-info" onclick="saveMulStuApprove('1')">拒 绝</button>
				              	<button class="btn" onclick="javascript:window.history.back(-1);">取 消</button>
			           		</div>
			           	</div>
			         </div>
			         
			         
	    </div>
	    </div>
	    </div>       		
		<script>
			//保存
			function saveMulStuApprove(flag){
				var checkFlag = $("#checkFlag").val();
				if(checkFlag == 'true') {
					$("#saveStuApprove").attr("action", "${rc.contextPath}/training/approveclass/opt-save/saveMultyStuApprove.do?flag="+flag);
					$("#saveStuApprove").attr("method", "post");
					$("#saveStuApprove").submit();
				}else{
					comp.message("所选学生已经报名该班，无法保存调整，请重新选择!","info");
				}
			}
			
			//切换创业班
			function changeClassInfo(obj){
				var classInfoId = $(obj).val();
				var oldClassInfoId = $("#oldClassId").val();
				var stuIds = "${stuIds!""}";
				$("#checkFlag").val('true');
				if(classInfoId != oldClassInfoId) {
					$.ajax({
						url:"${rc.contextPath}/training/checkMultyApply/opt-query/checkMultyApplyInfo.do",
						type:"post",
						data:{"classId":classInfoId, "stuIds":stuIds},
						success:function(data) {
								var dataObj = eval("(" + data + ")");
								if(dataObj.flag == 'true') {
									comp.message("您选择的学生中的&nbsp"+dataObj.names+"已经报名该班，故不能调班，请重新选择！","info");
									$("#checkFlag").val('false');
								}else {
									$("#checkFlag").val('true');
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
								}
						}
					});
				}else {
					$("#checkFlag").val('true');
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
				}
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