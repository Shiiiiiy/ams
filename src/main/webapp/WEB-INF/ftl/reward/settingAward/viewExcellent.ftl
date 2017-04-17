<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
         <!-- jQuery UI theme-->
        <link rel="stylesheet" href="${rc.contextPath}/lib/jquery-ui/css/Aristo/Aristo.css" />
        <script src="${rc.contextPath}/lib/jquery-ui/jquery-ui-1.8.20.custom.min.js"></script>
        <!-- animated progressbars -->
        <script src="${rc.contextPath}/js/bdp_fileupload.progressbar.js"></script>
        <script src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script>
		<!-- bootstrap-fileupload -->	
		<link rel="stylesheet" href="${rc.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.min.css" />
		<!-- multiselect -->
	    <link rel="stylesheet" href="${rc.contextPath}/lib/multiselect/css/multi-select.css" />
		<script src="${rc.contextPath}/lib/multiselect/js/jquery.multi-select.min.js"></script>	
        <!-- ajax form-->
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
		<script src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
		<script>
			//返回评优类型列表
			function returnList(){   
				window.location.href="${rc.contextPath}/reward/settingaward/opt-query/queryAwardPage.do?type=EXCELLENT";
			}
			
			$("document").ready(function(){
				//初始没选中的input设为disabled
				$(".tipTag").each(function(){
					if($(this).val()==''){
						$(this).attr("disabled",true);
					}
				})
				
				var submitIds = "";
				$(':checkbox').each(function(){
					var status = $(this).is(':checked');
					if(status == true) {
						var id  = $(this).attr("name")
						id = id.replace("1","");
						submitIds = submitIds + id + ",";
						$("#submitIds").val(submitIds);
					}
				})
			});
			/*
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
			*/
			
		</script>
		<style>
			.modal{width:320px;margin-top:-180px;margin-left:-80px}
			.fileupload-info{width:740px}
		</style>
    </head>
    <body>
		<div id="contentwrapper">
		    <div class="main_content">
		    	<div class="row-fluid">
					<div class="span12">
						<h3 class="heading">评优信息查看页面</h3>
					</div>
				</div>
		    	<div class="row-fluid">
		    		<form id="awardEdit" method="post" action="${rc.contextPath}/reward/settingaward/opt-query/saveUpdatedAward.do">
		    				<#-- 提交的已选中条件name  -->
		    				<input id="submitIds" name="submitIds" value="" type="hidden">
		    				<input id="awardId" name="awardId" value="${award.id}" type="hidden">
			    			<div class="formSep">
			    				<div class="row-fluid">
			    					<div class="span6">
			    				    	<span class="span4">学年</span>
			    				    	<div class="span4">
			    				    		<input id="schoolYear" name="schoolYear.code" value="${award.schoolYear.name}" readOnly>
										</div>
			    				    </div>
			    				    
			    				    <div class="span6">
			    				    	<span class="span4">评优名称</span>
			    				    	<div class="span4">
			    				    		<input id="awardInfoId" name="awardInfoId.id" value="${award.awardInfoId.awardName}" readOnly>
										</div>
			    				    </div>
			    				    
			    				</div>
			    			</div>
			    			
			    			<div class="formSep">
			    				<div class="row-fluid">
			    					<div class="span6">
			    				    	<span class="span4">申请开始日期</span>
			    				    	<div class="span4">
			    							<input type="text" id="beginDate" name="beginDateStr" style="width:210px;" value="${award.beginDate?string("yyyy-MM-dd")}"   
												readOnly/>
			    						</div>
			    				    </div>
			    				    <div class="span6">
			    				    	<span class="span4">申请截止日期</span>
			    				    	<div class="span4">
											<input type="text" id="endDate" name="endDateStr" style="width:210px;" value="${award.endDate?string("yyyy-MM-dd")}" 
												readOnly/>
			    						</div>
			    				    </div>
			    				</div>
			    			</div>
			    			
							<div class="formSep">
								<div class="row-fluid">
										
			    				<#--if conInfoMap??>
		    						<#if conInfoMap['gainAwardBOX']??>
										<div class="span6">
									    	<div class="span4">
								    			<label class="checkbox inline">
													<input type="checkbox"   name="gainAwardBOX1" onclick="changeInput(this)" checked="checked" disabled="disabled"/>获得奖学金
												</label>
									    	</div>
									    	<div class="span4">
											<#if conInfoMap['gainAwardBOX'].conditionValue == '1'>
												<label class="radio inline">
													<input type="radio" name="gainAwardBOX" class="gainAwardBOX"  value="一等奖学金" checked="checked" disabled="disabled"/>一等奖学金
												</label> 
												<label class="radio inline">
													<input type="radio" name="gainAwardBOX" value="二等奖学金" class="gainAwardBOX" disabled="disabled"/>二等奖学金
												</label>
												<label class="radio inline">
													<input type="radio" name="gainAwardBOX" value="三等奖学金" class="gainAwardBOX" disabled="disabled"/>三等奖学金
												</label>
											<#elseif conInfoMap['gainAwardBOX'].conditionValue == '2'>
												<label class="radio inline">
													<input type="radio" name="gainAwardBOX" class="gainAwardBOX"  value="一等奖学金"  disabled="disabled"/>一等奖学金
												</label> 
												<label class="radio inline">
													<input type="radio" name="gainAwardBOX" value="二等奖学金" class="gainAwardBOX" disabled="checked" disable="disabled"/>二等奖学金
												</label>
												<label class="radio inline">
													<input type="radio" name="gainAwardBOX" value="三等奖学金" class="gainAwardBOX" disabled="disabled"/>三等奖学金
												</label>
											<#else>
												<label class="radio inline">
													<input type="radio" name="gainAwardBOX" class="gainAwardBOX"  value="一等奖学金"  disabled="disabled"/>一等奖学金
												</label> 
												<label class="radio inline">
													<input type="radio" name="gainAwardBOX" value="二等奖学金" class="gainAwardBOX" disabled="disabled"/>二等奖学金
												</label>
												<label class="radio inline">
													<input type="radio" name="gainAwardBOX" value="三等奖学金" class="gainAwardBOX" checked="checked" disabled="disabled"/>三等奖学金
												</label>
											</#if>
											</div>
									    </div>
								   <#else>
								   		<div class="span6">
									    	<div class="span4">
								    			<label class="checkbox inline">
													<input type="checkbox"   name="gainAwardBOX1" onclick="changeInput(this)" disabled="disabled"/>获得奖学金
												</label>
									    	</div>
									    	<div class="span4">
												<label class="radio inline">
													<input type="radio" name="gainAwardBOX" class="gainAwardBOX"  value="一等奖学金" disabled="disabled"/>一等奖学金
												</label>
												<label class="radio inline">
													<input type="radio" name="gainAwardBOX" value="二等奖学金" class="gainAwardBOX" disabled="disabled"/>二等奖学金
												</label>
												<label class="radio inline">
													<input type="radio" name="gainAwardBOX" value="三等奖学金" class="gainAwardBOX" disabled="disabled"/>三等奖学金
												</label>
											</div>
									    </div>				
								   </#if>
								</#if-->	   
								    <div class="span6">
								    <#if conInfoMap??>
		    							<#if conInfoMap['sportScore']??>
									    	<div class="span4">
								    			<label class="checkbox inline">
													<input type="checkbox"   name="sportScore1" onclick="changeInput(this)" checked="checked"/ disabled="disabled">体育成绩以上
												</label>
									    	</div>
									    	<div class="span4">
												<input id="sportScore" value="${conInfoMap['sportScore'].conditionValue}" name="sportScore"  data="体育成绩多少分以上" disabled="disabled">
											</div>
										<#else>
											<div class="span4">
								    			<label class="checkbox inline">
													<input type="checkbox"   name="sportScore1" onclick="changeInput(this)" disabled="disabled"/>体育成绩以上
												</label>
									    	</div>
									    	<div class="span4">
												<input id="sportScore" value="" name="sportScore" class="tipTag" data="体育成绩多少分以上" disabled="disabled">
											</div>
										</#if>
									</#if>
								    </div>
								</div>
							</div>
							<div class="formSep">
								<div class="row-fluid">
								    <div class="span6" style="white-space: nowrap;">
								    <#if conInfoMap??>
		    							<#if conInfoMap['zhszClassRank']??>
									    	<div class="span4">
								    			<label class="checkbox inline">
													<input type="checkbox"   name="zhszClassRank1" onclick="changeInput(this)" checked="checked" disabled="disabled"/>综合素质班排前
												</label>
									    	</div>
									    	<div class="span4">
												<input id="zhszClassRank" value="${conInfoMap['zhszClassRank'].conditionValue}" name="zhszClassRank"  data="综合素质评分本班排名" disabled="disabled">%
											</div>
										<#else>
											<div class="span4">
								    			<label class="checkbox inline">
													<input type="checkbox"   name="zhszClassRank1" onclick="changeInput(this)" disabled="disabled"/>综合素质班排前
												</label>
								    		</div>
									    	<div class="span4">
												<input id="zhszClassRank" value="" name="zhszClassRank" class="tipTag" data="综合素质评分本班排名" disabled="disabled">%
											</div>
										</#if>
									</#if>
								    </div>
								    <div class="span6" style="white-space: nowrap;">
								    	<#if conInfoMap??>
		    								<#if conInfoMap['pdcpClassRank']??>
										    	<div class="span4">
									    			<label class="checkbox inline">
														<input type="checkbox"   name="pdcpClassRank1" onclick="changeInput(this)" checked="checked" disabled="disabled"/>品德测评班级排名前
													</label>
										    	</div>
										    	<div class="span4">
										    		<input id="pdcpClassRank" value="${conInfoMap['pdcpClassRank'].conditionValue}"  name="pdcpClassRank" data="品德测评成绩在本班排名" disabled="disabled">%
												</div>
											<#else>
												<div class="span4">
									    			<label class="checkbox inline">
														<input type="checkbox"   name="pdcpClassRank1" onclick="changeInput(this)" disabled="disabled"/>品德测评班级排名前
													</label>
										    	</div>
										    	<div class="span4">
										    		<input id="pdcpClassRank" value="" class="tipTag" name="pdcpClassRank" data="品德测评成绩在本班排名" disabled="disabled">%
												</div>
											</#if>
										</#if>
								    </div>
								</div>
							</div>
							<div class="formSep">
								<div class="row-fluid">
									 <!--div class="span6">
									    <#if conInfoMap??>
			    							<#if conInfoMap['percentOfAllAcademy']??>
										    	<div class="span4">
									    			<label class="checkbox inline">
														<input type="checkbox"   name="percentOfAllAcademy1" onclick="changeInput(this)" checked="checked" disabled="disabled"/>占学院班级总数
													</label>
										    	</div>
										    	<div class="span4">
										    		<input id="percentOfAllAcademy" value="${conInfoMap['percentOfAllAcademy'].conditionValue}" data="优秀班级占学院班级总数" name="percentOfAllAcademy" disabled="disabled">
												</div>
											<#else>
												<div class="span4">
									    			<label class="checkbox inline">
														<input type="checkbox"   name="percentOfAllAcademy1" onclick="changeInput(this)" disabled="disabled"/>占学院班级总数
													</label>
										    	</div>
										    	<div class="span4">
										    		<input id="percentOfAllAcademy" class="tipTag" value="" data="优秀班级占学院班级总数" name="percentOfAllAcademy" disabled="disabled">
												</div>
											</#if>
										</#if>
								    </div-->
									<!--div class="span6">
									<#if conInfoMap??>
		    							<#if conInfoMap['zbjxsgb']??>
									    	<div class="span4">
								    			<label class="checkbox inline">
													<input type="checkbox"   name="zbjxsgb1" onclick="changeInput(this)" checked="checked" disabled="disabled"/>占班级学生干部总数
												</label>
									    	</div>
									    	<div class="span4">
									    		<input id="zbjxsgb" value="${conInfoMap['zbjxsgb'].conditionValue}"  name="zbjxsgb" data="优秀学生干部占班级学生干部总数" disabled="disabled">
											</div>
										<#else>
											<div class="span4">
								    			<label class="checkbox inline">
													<input type="checkbox"   name="zbjxsgb1" onclick="changeInput(this)" disabled="disabled"/>占班级学生干部总数
												</label>
									    	</div>
									    	<div class="span4">
									    		<input id="zbjxsgb" value="" class="tipTag" name="zbjxsgb" data="优秀学生干部占班级学生干部总数" disabled="disabled">
											</div>
										</#if>
									</#if>
								    </div-->
								    
								</div>
							 </div>
							 
							 <div class="formSep">
			    				<div class="row-fluid">
			    					<div class="span6">
			    						<div class="span4">
								    		<label>备注</label>
								    	</div>
			    				    	<div class="span4">
											<textarea id="comments" name="conComments" col="12" rows="3" readOnly="true" style="width: 770px; height: 111px;">${conComments!""}</textarea>
										</div>
			    				    </div>
			    				</div>
			    			</div>
			    			
							<#--名额限制引入-->
		    			<#include "/reward/awardcommon/quotaLimitList.ftl" />
							
							</form>
			    			
			    			<div class="formSep">
			    				<div class="row-fluid">
			    					<div class="span6">
			    						<div class="span4">
								    		<label>相关附件</label>
								    	</div>
			    				    	<div class="span4">
											<form  id="fileUploadForm"  action="" method="post"  enctype="multipart/form-data">
												 <#if uploadFileRefList??>	
													<#list uploadFileRefList as p>
														<div class="fileupload-info">
															<a href="${rc.contextPath}/sys/sysConfig/file.do?id=${p.uploadFile.id}"><strong>${p.uploadFile.name}&nbsp;(${p.uploadFile.fileSize})</strong></a>
															<input type="hidden" id="fileId" name="fileId" value="${p.uploadFile.id}"/>	
														</div>					
													</#list>
												 </#if>
											</form>	
											
										</div>
			    				    </div>
			    				</div>
			    			</div>
							
					</br>			    			
		    		<div class="row-fluid">
						<div class="span6">
							<div class="span4">
			        		</div>
				    		<div class="span4">
				              	<button class="btn btn-info" onclick="javascript:window.close();">关 闭</button>
			           		</div>
			           	</div>
			         </div>
			         
		
		
			         
	    </div>
	    </div>
	    </div>       		
	    </div>       		
	</body>
</html>