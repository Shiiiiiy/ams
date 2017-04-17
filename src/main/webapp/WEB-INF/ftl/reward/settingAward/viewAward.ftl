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
				window.location.href="${rc.contextPath}/reward/settingaward/opt-query/queryAwardPage.do?type=AWARD";
			}
			$("document").ready(function(){
				//初始没选中的input设为disabled
				$(':input').attr("disabled",true);
				$('#return').attr("disabled",false);
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
						<h3 class="heading">评奖信息查看页面</h3>
					</div>
				</div>
		    	<div class="row-fluid">
		    		<form id="awardEdit" method="post" action="${rc.contextPath}/reward/settingaward/opt-query/saveUpdatedAward.do?type=AWARD">
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
			    				    	<span class="span4">评奖名称</span>
			    				    	<div class="span4">
			    				    		<input id="awardInfoId" name="awardInfoId.id" value="${award.awardInfoId.awardName}" readonly>
										</div>
			    				    </div>
			    				</div>
			    			</div>
			    			<#if award.secondAwardName??>
			    			<div class="formSep">
								<div class="row-fluid">
									<div class="span6">
			    				    	<span class="span4">二级奖项名称</span>
			    				    	<div class="span4">
			    				    		<input id="secondAwardName" value="${award.secondAwardName.name!""}"  name="secondAwardName" disabled="disabled">
										</div>
			    				    </div>
								</div>
							</div>	
			    			</#if>
			    			<div class="formSep">
			    				<div class="row-fluid">
			    					<div class="span6">
			    				    	<span class="span4">申请开始日期</span>
			    				    	<div class="span4">
			    							<input type="text" id="beginDate" name="beginDateStr"  value="${award.beginDate?string("yyyy-MM-dd")}" readOnly/>
			    						</div>
			    				    </div>
			    				    <div class="span6">
			    				    	<span class="span4">申请截止日期</span>
			    				    	<div class="span4">
											<input type="text" id="endDate" name="endDateStr"  value="${award.endDate?string("yyyy-MM-dd")}" readOnly />
			    						</div>
			    				    </div>
			    				</div>
			    			</div>
			    			
			    			<div class="formSep">
								<div class="row-fluid">
								    <div class="span6">
			    						<div class="span4">
			    							<#if conInfoMap??>
					    						<#if conInfoMap['sportScore']??>
									    			<label class="checkbox inline">
														<input type="checkbox"   name="sportScore1" onclick="changeInput(this)" checked="checked"/>体育成绩以上
													</label>
												<#else>
									    			<label class="checkbox inline">
														<input type="checkbox" name="sportScore1" onclick="changeInput(this)"/>体育成绩以上
													</label>
												</#if>
											</#if>
								    	</div>
			    				    	<div class="span4">
			    				    		<#if conInfoMap??>
				    							<#if conInfoMap['sportScore']??>
			    									<input id="sportScore" class="tipTag" value="${conInfoMap['sportScore'].conditionValue}" name="sportScore" data="体育成绩以上">
		    									<#else>
			    									<input id="sportScore" class="tipTag" value="" name="sportScore" data="体育成绩以上">
		    									</#if>
	    									</#if>
			    						</div>
			    				    </div>
			    				    
			    				     <div class="span6">
			    				    	<div class="span4">
			    				    		<#if conInfoMap??>
					    						<#if conInfoMap['singleScore']??>
									    			<label class="checkbox inline">
														<input type="checkbox"   name="singleScore1" onclick="changeInput(this)" checked="checked"/>单科成绩以上
													</label>
												<#else>
									    			<label class="checkbox inline">
														<input type="checkbox"  name="singleScore1" onclick="changeInput(this)"/>单科成绩以上
													</label>
												</#if>
											</#if>
								    	</div>
			    				    	<div class="span4">
			    				    		<#if conInfoMap??>
				    							<#if conInfoMap['singleScore']??>
			    									<input id="singleScore" class="tipTag" value="${conInfoMap['singleScore'].conditionValue}" name="singleScore" data="单科成绩以上">
		    									<#else>
			    									<input id="singleScore" class="tipTag" value="" name="singleScore" data="单科成绩以上">
		    									</#if>
	    									</#if>
			    						</div>
			    				    </div>
								</div>
							</div>
							<div class="formSep">
								<div class="row-fluid">
									<div class="span6">
			    						<div class="span4">
			    							<#if conInfoMap??>
					    						<#if conInfoMap['averageScoreOfYear']??>
									    			<label class="checkbox inline">
														<input type="checkbox"   name="averageScoreOfYear1" onclick="changeInput(this)" checked="checked"/>学年课程总平均成绩
													</label>
												<#else>
									    			<label class="checkbox inline">
														<input type="checkbox"  name="averageScoreOfYear1" onclick="changeInput(this)"/>学年课程总平均成绩
													</label>
												</#if>
											</#if>
								    	</div>
			    				    	<div class="span4">
			    				    		<#if conInfoMap??>
				    							<#if conInfoMap['averageScoreOfYear']??>
			    									<input id="averageScoreOfYear" class="tipTag" value="${conInfoMap['averageScoreOfYear'].conditionValue}" name="averageScoreOfYear" data="学年课程总平均成绩">
		    									<#else>
			    									<input id="averageScoreOfYear" class="tipTag" value="" name="averageScoreOfYear" data="学年课程总平均成绩">
		    									</#if>
	    									</#if>
			    						</div>
			    				    </div>
			    				   
			    				   <div class="span6">
			    				    	<div class="span4">
			    				    		<#if conInfoMap??>
					    						<#if conInfoMap['usualWork']??>
									    			<label class="checkbox inline">
														<input type="checkbox"   name="usualWork1" onclick="changeInput(this)" checked="checked"/>平时作业未完成量低于
													</label>
												<#else>
									    			<label class="checkbox inline">
														<input type="checkbox"  name="usualWork1" onclick="changeInput(this)"/>平时作业未完成量低于
													</label>
												</#if>
											</#if>
								    	</div>
			    				    	<div class="span4">
			    				    		<#if conInfoMap??>
				    							<#if conInfoMap['usualWork']??>
			    									<input id="usualWork" class="tipTag" value="${conInfoMap['usualWork'].conditionValue}" name="usualWork" data="平时作业未完成量低于">
		    									<#else>
			    									<input id="usualWork" class="tipTag" value="" name="usualWork" data="平时作业未完成量低于">
		    									</#if>
	    									</#if>
			    						</div>
			    				    </div>
								</div>
							 </div>
			    			
							<div class="formSep">
								<div class="row-fluid">
		    						<div class="span6" style="white-space: nowrap;">
			    						<div class="span4">
			    							<#if conInfoMap??>
					    						<#if conInfoMap['zhcpScoreMajorRank']??>
									    			<label class="checkbox inline">
														<input type="checkbox"   name="zhcpScoreMajorRank1" onclick="changeInput(this)" checked="checked"/>综合成绩专业排名
													</label>
												<#else>
									    			<label class="checkbox inline">
														<input type="checkbox"   name="zhcpScoreMajorRank1" onclick="changeInput(this)"/>综合成绩专业排名
													</label>
												</#if>
											</#if>
								    	</div>
			    				    	<div class="span4">
						    				<#if conInfoMap??>
					    						<#if conInfoMap['zhcpScoreMajorRank']??>
			    									<input id="zhcpScoreMajorRank" class="tipTag"  value="${conInfoMap['zhcpScoreMajorRank'].conditionValue}" name="zhcpScoreMajorRank" data="学年综合测评成绩列该年级同专业同类型学生数前">%
			    								<#else>
			    									<input id="zhcpScoreMajorRank" class="tipTag"  value="" name="zhcpScoreMajorRank" data="学年综合测评成绩列该年级同专业同类型学生数前">%
			    								</#if>
		    								</#if>
			    						</div>
			    				    </div>
								    <div class="span6" style="white-space: nowrap;">
			    				    	<div class="span4">
			    				    		<#if conInfoMap??>
					    						<#if conInfoMap['zhcpScoreClassRank']??>
									    			<label class="checkbox inline">
														<input type="checkbox"   name="zhcpScoreClassRank1" onclick="changeInput(this)" checked="checked"/>综合成绩班级排名
													</label>
												<#else>
									    			<label class="checkbox inline">
														<input type="checkbox"  name="zhcpScoreClassRank1" onclick="changeInput(this)"/>综合成绩班级排名
													</label>
												</#if>
											</#if>
								    	</div>
			    				    	<div class="span4">
										    <#if conInfoMap??>
				    							<#if conInfoMap['zhcpScoreClassRank']??>
			    									<input id="zhcpScoreClassRank" class="tipTag" value="${conInfoMap['zhcpScoreClassRank'].conditionValue}" name="zhcpScoreClassRank" data="学年综合测评成绩列该班级学生数前">%
		    									<#else>
			    									<input id="zhcpScoreClassRank" class="tipTag" value="" name="zhcpScoreClassRank" data="学年综合测评成绩列该班级学生数前">%
			    								</#if>
		    								</#if>
			    						</div>
								    </div>
								</div>
							</div>
							 
							 <div class="formSep">
			    				<div class="row-fluid">
			    					<div class="span6" style="white-space: nowrap;">
			    						<div class="span4">
			    							<#if conInfoMap??>
					    						<#if conInfoMap['dycpScoreMajorRank']??>
									    			<label class="checkbox inline">
														<input type="checkbox"   name="dycpScoreMajorRank1" onclick="changeInput(this)" checked="checked"/>德育成绩专业排名
													</label>
												<#else>
									    			<label class="checkbox inline">
														<input type="checkbox"  name="dycpScoreMajorRank1" onclick="changeInput(this)"/>德育成绩专业排名
													</label>
												</#if>
											</#if>
								    	</div>
			    				    	<div class="span4">
			    				    		<#if conInfoMap??>
				    							<#if conInfoMap['dycpScoreMajorRank']??>
			    									<input id="dycpScoreMajorRank" class="tipTag" value="${conInfoMap['dycpScoreMajorRank'].conditionValue}" name="dycpScoreMajorRank" data="德育测评成绩列该年级同专业同类型学生数前">%
			    								<#else>
			    									<input id="dycpScoreMajorRank" class="tipTag" value="" name="dycpScoreMajorRank" data="德育测评成绩列该年级同专业同类型学生数前">%
			    								</#if>	
		    								</#if>	
			    						</div>
			    				    </div>
			    				   
			    				    <div class="span6" style="white-space: nowrap;">
			    						<div class="span4">
			    							<#if conInfoMap??>
					    						<#if conInfoMap['dycpScoreClassRank']??>
									    			<label class="checkbox inline">
														<input type="checkbox"   name="dycpScoreClassRank1" onclick="changeInput(this)" checked="checked"/>德育成绩班级排名
													</label>
												<#else>
									    			<label class="checkbox inline">
														<input type="checkbox"  name="dycpScoreClassRank1" onclick="changeInput(this)"/>德育成绩班级排名
													</label>
												</#if>
											</#if>
								    	</div>
			    				    	<div class="span4">
			    				    		<#if conInfoMap??>
				    							<#if conInfoMap['dycpScoreClassRank']??>
			    									<input id="dycpScoreClassRank" class="tipTag" value="${conInfoMap['dycpScoreClassRank'].conditionValue}" name="dycpScoreClassRank" data="德育测评成绩列该班级学生数前">%
		    									<#else>
			    									<input id="dycpScoreClassRank" class="tipTag" value="" name="dycpScoreClassRank" data="德育测评成绩列该班级学生数前">%
		    									</#if>
	    									</#if>
			    						</div>
			    				    </div>
			    				</div>
			    			</div>
			    			
			    			<div class="formSep">
			    				<div class="row-fluid">
			    					<div class="span6" style="white-space: nowrap;">
			    						<div class="span4">
			    							<#if conInfoMap??>
					    						<#if conInfoMap['wtcpScoreMajorRank']??>
									    			<label class="checkbox inline">
														<input type="checkbox"   name="wtcpScoreMajorRank1" onclick="changeInput(this)" checked="checked"/>文体成绩专业排名
													</label>
												<#else>
									    			<label class="checkbox inline">
														<input type="checkbox"  name="wtcpScoreMajorRank1" onclick="changeInput(this)"/>文体成绩专业排名
													</label>
												</#if>
											</#if>
								    	</div>
			    				    	<div class="span4">
			    				    		<#if conInfoMap??>
				    							<#if conInfoMap['wtcpScoreMajorRank']??>
			    									<input id="wtcpScoreMajorRank" class="tipTag" value="${conInfoMap['wtcpScoreMajorRank'].conditionValue}" name="wtcpScoreMajorRank" data="文体测评成绩列该年级同专业同类型学生数前">%
		    									<#else>
			    									<input id="wtcpScoreMajorRank" class="tipTag" value="" name="wtcpScoreMajorRank" data="文体测评成绩列该年级同专业同类型学生数前">%
		    									</#if>
	    									</#if>
			    						</div>
			    				    </div>
			    				    
			    				    <div class="span6" style="white-space: nowrap;">
			    						<div class="span4">
			    							<#if conInfoMap??>
					    						<#if conInfoMap['wtcpScoreClassRank']??>
									    			<label class="checkbox inline">
														<input type="checkbox"   name="wtcpScoreClassRank1" onclick="changeInput(this)" checked="checked"/>文体成绩班级排名
													</label>
												<#else>
									    			<label class="checkbox inline">
														<input type="checkbox"  name="wtcpScoreClassRank1" onclick="changeInput(this)"/>文体成绩班级排名
													</label>
												</#if>
											</#if>
								    	</div>
			    				    	<div class="span4">
			    				    		<#if conInfoMap??>
				    							<#if conInfoMap['wtcpScoreClassRank']??>
			    									<input id="wtcpScoreClassRank" class="tipTag" value="${conInfoMap['wtcpScoreClassRank'].conditionValue}" name="wtcpScoreClassRank" data="文体测评成绩列该班级学生数前">%
		    									<#else>
			    									<input id="wtcpScoreClassRank" class="tipTag" value="" name="wtcpScoreClassRank" data="文体测评成绩列该班级学生数前">%
		    									</#if>
	    									</#if>
			    						</div>
			    				    </div>
			    				</div>
			    			</div>
			    			
			    			<div class="formSep">
			    				<div class="row-fluid">
			    					 <div class="span6" style="white-space: nowrap;">
			    				    	<div class="span4">
			    				    		<#if conInfoMap??>
					    						<#if conInfoMap['zycpScoreMajorRank']??>
									    			<label class="checkbox inline">
														<input type="checkbox"   name="zycpScoreMajorRank1" onclick="changeInput(this)" checked="checked"/>智育成绩专业排名
													</label>
												<#else>
									    			<label class="checkbox inline">
														<input type="checkbox"  name="zycpScoreMajorRank1" onclick="changeInput(this)"/>智育成绩专业排名
													</label>
												</#if>
											</#if>
								    	</div>
			    				    	<div class="span4">
			    				    		<#if conInfoMap??>
				    							<#if conInfoMap['zycpScoreMajorRank']??>
			    									<input id="zycpScoreMajorRank" class="tipTag" value="${conInfoMap['zycpScoreMajorRank'].conditionValue}" name="zycpScoreMajorRank" data="智育测评成绩列该年级同专业同类型学生数前">%
		    									<#else>
			    									<input id="zycpScoreMajorRank" class="tipTag" value="" name="zycpScoreMajorRank" data="智育测评成绩列该年级同专业同类型学生数前">%
		    									</#if>
	    									</#if>
			    						</div>
			    				    </div>
			    					
			    				    <div class="span6" style="white-space: nowrap;">
			    				    	<div class="span4">
			    				    		<#if conInfoMap??>
					    						<#if conInfoMap['zycpScoreClassRank']??>
									    			<label class="checkbox inline">
														<input type="checkbox"   name="zycpScoreClassRank1" onclick="changeInput(this)" checked="checked"/>智育成绩班级排名
													</label>
												<#else>
									    			<label class="checkbox inline">
														<input type="checkbox" name="zycpScoreClassRank1" onclick="changeInput(this)"/>智育成绩班级排名
													</label>
												</#if>
											</#if>
								    	</div>
			    				    	<div class="span4">
			    				    		<#if conInfoMap??>
				    							<#if conInfoMap['zycpScoreClassRank']??>
			    									<input id="zycpScoreClassRank" class="tipTag" value="${conInfoMap['zycpScoreClassRank'].conditionValue}" name="zycpScoreClassRank" data="智育测评成绩列该班级学生数前">%
		    									<#else>
			    									<input id="zycpScoreClassRank" class="tipTag" value="" name="zycpScoreClassRank" data="智育测评成绩列该班级学生数前">%
		    									</#if>
	    									</#if>
			    						</div>
			    				    </div>
			    				</div>
			    			</div>
			    			
			    			<div class="formSep">
			    				<div class="row-fluid">
			    					<div class="span6" style="white-space: nowrap;">
			    				    	<div class="span4">
			    				    		<#if conInfoMap??>
					    						<#if conInfoMap['nlcpScoreMajorRank']??>
									    			<label class="checkbox inline">
														<input type="checkbox"   name="nlcpScoreMajorRank1" onclick="changeInput(this)" checked="checked"/>能力成绩专业排名
													</label>
												<#else>
									    			<label class="checkbox inline">
														<input type="checkbox"  name="nlcpScoreMajorRank1" onclick="changeInput(this)"/>能力成绩专业排名
													</label>
												</#if>
											</#if>
								    	</div>
			    				    	<div class="span4">
			    				    		<#if conInfoMap??>
				    							<#if conInfoMap['nlcpScoreMajorRank']??>
			    									<input id="nlcpScoreMajorRank" class="tipTag" value="${conInfoMap['nlcpScoreMajorRank'].conditionValue}" name="nlcpScoreMajorRank" data="能力测评成绩列该年级同专业同类型学生数前">%
		    									<#else>
			    									<input id="nlcpScoreMajorRank" class="tipTag" value="" name="nlcpScoreMajorRank" data="能力测评成绩列该年级同专业同类型学生数前">%
		    									</#if>
	    									</#if>
			    						</div>
			    				    </div>
			    					
			    				    <div class="span6" style="white-space: nowrap;">
			    				    	<div class="span4">
			    				    		<#if conInfoMap??>
					    						<#if conInfoMap['nlcpScoreClassRank']??>
									    			<label class="checkbox inline">
														<input type="checkbox"   name="nlcpScoreClassRank1" onclick="changeInput(this)" checked="checked"/>能力成绩班级排名
													</label>
												<#else>
									    			<label class="checkbox inline">
														<input type="checkbox"  name="nlcpScoreClassRank1" onclick="changeInput(this)"/>能力成绩班级排名
													</label>
												</#if>
											</#if>
								    	</div>
			    				    	<div class="span4">
			    				    		<#if conInfoMap??>
				    							<#if conInfoMap['nlcpScoreClassRank']??>
			    									<input id="nlcpScoreClassRank" class="tipTag" value="${conInfoMap['nlcpScoreClassRank'].conditionValue}" name="nlcpScoreClassRank" data="能力测评成绩列该班级学生数前">%
		    									<#else>
			    									<input id="nlcpScoreClassRank" class="tipTag" value="" name="nlcpScoreClassRank" data="能力测评成绩列该班级学生数前">%
		    									</#if>
	    									</#if>
			    						</div>
			    				    </div>
			    				</div>
			    			</div>
			    			
			    			<div class="formSep">
			    				<div class="row-fluid">
			    					<div class="span6">
			    						<div class="span4">
			    							<#if conInfoMap??>
					    						<#if conInfoMap['classLeaderRadio']??>
									    			<label class="checkbox inline">
														<input type="checkbox"   name="classLeaderRadio1" onclick="changeInput(this)" checked="checked"/>是否为班级干部
													</label>
												<#else>
									    			<label class="checkbox inline">
														<input type="checkbox"  name="classLeaderRadio1" onclick="changeInput(this)"/>是否为班级干部
													</label>
												</#if>
											</#if>
								    	</div>
			    				    	<div class="span4">
		    								<#if conInfoMap??>
			    								<#if conInfoMap['classLeaderRadio']?? && conInfoMap['classLeaderRadio'].conditionValue == 'Y'>
					    							<label class="radio inline">
														<input type="radio"  name="classLeaderRadio" class="classLeaderRadio" value="Y" checked="checked"/>是
													</label>
					    							<label class="radio inline">
														<input type="radio"  name="classLeaderRadio" class="classLeaderRadio" value="N" />否
													</label>
												<#elseif conInfoMap['classLeaderRadio']?? && conInfoMap['classLeaderRadio'].conditionValue == 'N'>
													<label class="radio inline">
														<input type="radio"  name="classLeaderRadio" class="classLeaderRadio" value="Y" />是
													</label>
													<label class="radio inline">
														<input type="radio"  name="classLeaderRadio" class="classLeaderRadio" value="N" checked="checked"/>否
													</label>
												<#else>
													<label class="radio inline">
														<input type="radio"  name="classLeaderRadio" class="classLeaderRadio" value="Y" disabled="disabled"/>是
													</label>
													<label class="radio inline">
														<input type="radio"  name="classLeaderRadio" class="classLeaderRadio" value="N" disabled="disabled"/>否
													</label>
												</#if>
											</#if>
			    						</div>
			    				    </div>
			    				    <div class="span6">
			    				    	<div class="span4">
			    				    		<#if conInfoMap??>
					    						<#if conInfoMap['schoolRuleRadio']??>
									    			<label class="checkbox inline">
														<input type="checkbox"   name="schoolRuleRadio1" onclick="changeInput(this)" checked="checked"/>是否遵守校规校纪
													</label>
												<#else>
									    			<label class="checkbox inline">
														<input type="checkbox"  name="schoolRuleRadio1" onclick="changeInput(this)"/>是否遵守校规校纪
													</label>
												</#if>
											</#if>
								    	</div>
			    				    	<div class="span4">
			    				    		<#if conInfoMap??>
			    								<#if conInfoMap['schoolRuleRadio']?? && conInfoMap['schoolRuleRadio'].conditionValue == 'Y'>
					    							<label class="radio inline">
														<input type="radio" name="schoolRuleRadio" class="schoolRuleRadio" value="Y" checked="checked"/>是
													</label>
													<label class="radio inline">
														<input type="radio" name="schoolRuleRadio" class="schoolRuleRadio" value="N" />否
													</label>
												<#elseif conInfoMap['schoolRuleRadio']?? && conInfoMap['schoolRuleRadio'].conditionValue == 'N'>
													<label class="radio inline">
														<input type="radio" name="schoolRuleRadio" class="schoolRuleRadio" value="Y" />是
													</label>
													<label class="radio inline">
														<input type="radio" name="schoolRuleRadio" class="schoolRuleRadio" value="N" checked="checked"/>否
													</label>
												<#else>
													<label class="radio inline">
														<input type="radio" name="schoolRuleRadio" class="schoolRuleRadio" value="Y" disabled="disabled"/>是
													</label>
													<label class="radio inline">
														<input type="radio" name="schoolRuleRadio" class="schoolRuleRadio" value="N" disabled="disabled"/>否
													</label>
												</#if>
											</#if>
			    						</div>
			    				    </div>
			    				</div>
			    			</div>
			    			
			    			<div class="formSep">
			    				<div class="row-fluid">
			    					<div class="span6">
			    						<div class="span4">
			    							<#if conInfoMap??>
					    						<#if conInfoMap['truancyRadio']??>
									    			<label class="checkbox inline">
														<input type="checkbox"   name="truancyRadio1" onclick="changeInput(this)" checked="checked"/>是否旷课
													</label>
												<#else>
									    			<label class="checkbox inline">
														<input type="checkbox"  name="truancyRadio1" onclick="changeInput(this)"/>是否旷课
													</label>
												</#if>
											</#if>
								    	</div>
			    				    	<div class="span4">
			    				    		<#if conInfoMap??>
			    								<#if conInfoMap['truancyRadio']?? && conInfoMap['truancyRadio'].conditionValue == 'Y'>
					    							<label class="radio inline">
														<input type="radio" name="truancyRadio" class="truancyRadio"  value="Y" checked="checked"/>是
													</label>
													<label class="radio inline">
														<input type="radio" name="truancyRadio" class="truancyRadio" value="N" />否
													</label>
												<#elseif conInfoMap['truancyRadio']?? && conInfoMap['truancyRadio'].conditionValue == 'N'>
													<label class="radio inline">
														<input type="radio" name="truancyRadio" class="truancyRadio"  value="Y" />是
													</label>
													<label class="radio inline">
														<input type="radio" name="truancyRadio" class="truancyRadio" value="N" checked="checked"/>否
													</label>
												<#else>
													<label class="radio inline">
														<input type="radio" name="truancyRadio" class="truancyRadio"  value="Y" disabled="disabled"/>是
													</label>
													<label class="radio inline">
														<input type="radio" name="truancyRadio" class="truancyRadio" value="N" disabled="disabled"/>否
													</label>
												</#if>
											</#if>
			    						</div>
			    				    </div>
			    				    <div class="span6">
			    				    	<div class="span4">
			    				    		<#if conInfoMap??>
					    						<#if conInfoMap['dormRadio']??>
									    			<label class="checkbox inline">
														<input type="checkbox"   name="dormRadio1" onclick="changeInput(this)" checked="checked"/>合格寝室
													</label>
												<#else>
									    			<label class="checkbox inline">
														<input type="checkbox"  name="dormRadio1" onclick="changeInput(this)"/>合格寝室
													</label>
												</#if>
											</#if>
								    	</div>
			    				    	<div class="span4">
			    				    		<#if conInfoMap??>
			    								<#if conInfoMap['dormRadio']?? && conInfoMap['dormRadio'].conditionValue == 'Y'>
					    							<label class="radio inline">
														<input type="radio" name="dormRadio" class="dormRadio" value="Y" checked="checked"/>是
													</label>
													<label class="radio inline">
														<input type="radio" name="dormRadio" class="dormRadio"  value="N" />否
													</label>
												<#elseif conInfoMap['dormRadio']?? && conInfoMap['dormRadio'].conditionValue == 'N'>
													<label class="radio inline">
														<input type="radio" name="dormRadio" class="dormRadio" value="Y" />是
													</label>
													<label class="radio inline">
														<input type="radio" name="dormRadio" class="dormRadio"  value="N" checked="checked"/>否
													</label>
												<#else>
													<label class="radio inline">
														<input type="radio" name="dormRadio" class="dormRadio" value="Y" disabled="disabled"/>是
													</label>
													<label class="radio inline">
														<input type="radio" name="dormRadio" class="dormRadio"  value="N" disabled="disabled"/>否
													</label>
												</#if>
											</#if>
			    						</div>
			    				    </div>
			    				</div>
			    			</div>
			    			
			    			<div class="formSep">
			    				<div class="row-fluid">
			    					<div class="span6">
			    						<div class="span4">
			    							<#if conInfoMap??>
					    						<#if conInfoMap['highGradeRadio']??>
									    			<label class="checkbox inline">
														<input type="checkbox"   name="highGradeRadio1" onclick="changeInput(this)" checked="checked"/>所有科目成绩及格
													</label>
												<#else>
									    			<label class="checkbox inline">
														<input type="checkbox"  name="highGradeRadio1" onclick="changeInput(this)"/>所有科目成绩及格
													</label>
												</#if>
											</#if>
								    	</div>
			    				    	<div class="span4">
			    				    		<#if conInfoMap??>
			    								<#if conInfoMap['highGradeRadio']?? && conInfoMap['highGradeRadio'].conditionValue == 'Y'>
					    							<label class="radio inline">
														<input type="radio" name="highGradeRadio" class="highGradeRadio"  value="Y" checked="checked"/>是
													</label>
													<label class="radio inline">
														<input type="radio" name="highGradeRadio" class="highGradeRadio"  value="N" />否
													</label>
												<#elseif conInfoMap['highGradeRadio']?? && conInfoMap['highGradeRadio'].conditionValue == 'N'>
													<label class="radio inline">
														<input type="radio" name="highGradeRadio" class="highGradeRadio"  value="Y" />是
													</label>
													<label class="radio inline">
														<input type="radio" name="highGradeRadio" class="highGradeRadio"  value="N" checked="checked"/>否
													</label>
												<#else>
													<label class="radio inline">
														<input type="radio" name="highGradeRadio" class="highGradeRadio"  value="Y" disabled="disabled"/>是
													</label>
													<label class="radio inline">
														<input type="radio" name="highGradeRadio" class="highGradeRadio"  value="N" disabled="disabled"/>否
													</label>
												</#if>
											</#if>
			    						</div>
			    				    </div>
			    				    <div class="span6">
			    				    	<div class="span4">
			    				    		<#if conInfoMap??>
					    						<#if conInfoMap['honorRadio']??>
									    			<label class="checkbox inline">
														<input type="checkbox"   name="honorRadio1" onclick="changeInput(this)" checked="checked"/>是否获得荣誉
													</label>
												<#else>
									    			<label class="checkbox inline">
														<input type="checkbox"  name="honorRadio1" onclick="changeInput(this)"/>是否获得荣誉
													</label>
												</#if>
											</#if>
								    	</div>
			    				    	<div class="span4">
			    				    		<#if conInfoMap??>
			    								<#if conInfoMap['honorRadio']?? && conInfoMap['honorRadio'].conditionValue == 'Y'>
					    							<label class="radio inline">
														<input type="radio" name="honorRadio" class="honorRadio"  value="Y" checked="checked"/>是
													</label>
													<label class="radio inline">
														<input type="radio" name="honorRadio" class="honorRadio"  value="N" />否
													</label>
												<#elseif conInfoMap['honorRadio']?? && conInfoMap['honorRadio'].conditionValue == 'N'>
													<label class="radio inline">
														<input type="radio" name="honorRadio" class="honorRadio"  value="Y" />是
													</label>
													<label class="radio inline">
														<input type="radio" name="honorRadio" class="honorRadio"  value="N" checked="checked"/>否
													</label>
												<#else>
													<label class="radio inline">
														<input type="radio" name="honorRadio" class="honorRadio"  value="Y" disabled="disabled"/>是
													</label>
													<label class="radio inline">
														<input type="radio" name="honorRadio" class="honorRadio"  value="N" disabled="disabled"/>否
													</label>
												</#if>
											</#if>
			    						</div>
			    				    </div>
			    				</div>
			    			</div>
			    			
			    			<div class="formSep">
			    				<div class="row-fluid">
			    					<div class="span6">
			    						<div class="span4">
			    							<#if conInfoMap??>
					    						<#if conInfoMap['tuitionRadio']??>
									    			<label class="checkbox inline">
														<input type="checkbox"   name="tuitionRadio1" onclick="changeInput(this)" checked="checked"/>是否按时缴纳学费
													</label>
												<#else>
									    			<label class="checkbox inline">
												<input type="checkbox"  name="tuitionRadio1" onclick="changeInput(this)"/>是否按时缴纳学费
											</label>
												</#if>
											</#if>
								    	</div>
			    				    	<div class="span4">
			    				    		<#if conInfoMap??>
			    								<#if conInfoMap['tuitionRadio']?? && conInfoMap['tuitionRadio'].conditionValue == 'Y'>
					    							<label class="radio inline">
														<input type="radio" name="tuitionRadio" class="tuitionRadio"  value="Y" checked="checked"/>是
													</label>
													<label class="radio inline">
														<input type="radio" name="tuitionRadio" class="tuitionRadio"  value="N" />否
													</label>
												<#elseif conInfoMap['tuitionRadio']?? && conInfoMap['tuitionRadio'].conditionValue == 'N'>
													<label class="radio inline">
														<input type="radio" name="tuitionRadio" class="tuitionRadio"  value="Y" />是
													</label>
													<label class="radio inline">
														<input type="radio" name="tuitionRadio" class="tuitionRadio"  value="N" checked="checked"/>否
													</label>
												<#else>
													<label class="radio inline">
														<input type="radio" name="tuitionRadio" class="tuitionRadio"  value="Y" disabled="disabled"/>是
													</label>
													<label class="radio inline">
														<input type="radio" name="tuitionRadio" class="tuitionRadio"  value="N" disabled="disabled"/>否
													</label>
												</#if>
											</#if>
			    						</div>
			    				    </div>
			    				</div>
			    			</div>
							 
							 <div class="formSep">
			    				<div class="row-fluid">
			    					<div class="span6">
			    						<div class="span4">
								    		<label>备注</label>
								    	</div>
			    				    	<div class="span4">
											<textarea id="comments" name="conComments" col="12" rows="3" style="width: 770px; height: 111px;">${conComments!""}</textarea>
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
				              	<button id="return" class="btn btn-info" onclick="javascript:window.close();">关 闭</button>
			           		</div>
			           	</div>
			         </div>         
		
		
		
			         
	    </div>
	    </div>
	    </div>       		
	    </div>       		
	</body>
</html>