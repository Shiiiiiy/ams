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
        <script src="${rc.contextPath}/js/jquery.metadata.js"></script>
		<!-- bootstrap-fileupload -->	
		<link rel="stylesheet" href="${rc.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.min.css" />
		<!-- multiselect -->
	    <link rel="stylesheet" href="${rc.contextPath}/lib/multiselect/css/multi-select.css" />
		<script src="${rc.contextPath}/lib/multiselect/js/jquery.multi-select.min.js"></script>	
        <!-- ajax form-->
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
		<script src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
		<script>
			//保存
			function saveAward(){
				copyFileIdInput();
				$("#awardEdit").submit();
			}
			function copyFileIdInput(){
				$("#awardEdit").append($("#fileUploadForm input[name='fileId']"));
			}
			//返回评优类型列表
			function returnList(){   
				window.location.href="${rc.contextPath}/reward/settingaward/opt-query/queryAwardPage.do?type=AWARD";
			}
			//发布
			function publish(){
				copyFileIdInput();
				$("#awardEdit").attr("action","${rc.contextPath}/reward/settingaward/opt-query/saveUpdatedAward.do?buttonType=publish");
				$("#awardEdit").submit();
			}
			//点击checkbox时修改input状态
			function changeInput(obj){
				var submitIds = $("#submitIds").val();
				var status = $(obj).is(':checked');
				var id = $(obj).attr("name");
				var tempId = id.replace("1","");
				var text = $(obj).parent().text();
				if(status == true) {
					submitIds = submitIds + tempId + ",";
					$("#submitIds").val(submitIds);
					//添加文本框传checkbox文本名称到后台
					$(obj).parent().append("<input type='hidden' name='" + tempId+ "TEXT'" + "value='" + text + "'" + "id='"+ tempId +"TEXT" +"'>");
					if(id.indexOf("Radio") > -1) {
						$("."+tempId).attr("disabled",false);
						$("."+tempId).attr("checked",true);
					}else{
						$("#"+tempId).attr("disabled",false);
					}
				}else if(status == false) {
					submitIds = submitIds.replace(tempId+",","");
					$("#submitIds").val(submitIds);
					if(id.indexOf("Radio") > -1) {
						$("."+tempId).attr("disabled","disabled");
						$("."+tempId).attr("checked",false);
					}else{
						$("#"+tempId).attr("disabled","disabled");
						$("#"+tempId).val("");
					}
				}
			}			
			
			//切换二级奖项名称
			function changeSecond(){
				var awardName = $("#awardInfoId option:selected").text();
				var xingzhiName = $("#xingzhiName").val();
				if(awardName == xingzhiName) {
					$("#secondAwardName").show();
				}else{
					$("#secondAwardName").hide();
					$("#secondAwardName option:selected").val("");
				}
			}
			jQuery.validator.addMethod("numberCheck",function(value,element){
			   if(value != ""){
			      var patrn = /^\+?[1-9]\d*$/;
			      return patrn.exec(value);
			   }else{
			      return true;
			   }
			  return false;
			},"请输入最小为1的正整数");
			
			$("document").ready(function(){
				//初始没选中的input设为disabled
				var submitIds = "";
				$(':checkbox').each(function(){
					var status = $(this).is(':checked');
					if(status == true) {
						var id  = $(this).attr("name")
						id = id.replace("1","");
						submitIds = submitIds + id + ",";
						$("#submitIds").val(submitIds);
						
						var text = $(this).parent().text();
						//添加文本框传checkbox文本名称到后台
						$(this).parent().append("<input type='hidden' name='" + id+ "TEXT'" + "value='" + text + "'" + "id='"+ id +"TEXT" +"'>");
					}
					
				})
				
				var secondNameInput = $("#secondNameInput").val();
				if(secondNameInput == '' || secondNameInput == 'undefined' || secondNameInput == 'null'){
					$("#secondAwardName").hide();
				}
				
       			var data = {id:function(){return $('#id').val();},name:function(){return $('#awardInfoId').val();},
       						secondName:function(){return $('#secondName').val();},schoolYear:function(){return $("#schoolYear").val();}};
				comp.validate.addRemote("nameCheck","${rc.contextPath}/reward/settingaward/opt-query/checkAwardType.do",data,"名称重复");
           		$("#awardEdit").validate({
           		
           			errorClass:'error',
           			validClass:'valid',
           			focusCleanup:true,
           			focusInvalid:false,
           			highlight:function(element){
           				$(element).parent().addClass("f_error");
           			},
           			unhighlight:function(element){ 
           				$(element).parent().removeClass("f_error");
       				},
					rules:{     
						'schoolYear.code': {required:true},
						'awardInfoId.id': {required:true,nameCheck:true},
						'secondAwardName.code': {required:true,nameCheck:true},
						beginDateStr: {required:true},
						conComments: {maxlength:500},
						zhcpScoreMajorRank:{required:true,numberCheck:true,maxlength:32},
						zhcpScoreClassRank:{required:true,numberCheck:true,maxlength:32},
						sportScore:{required:true,numberCheck:true,maxlength:32},
						usualWork:{required:true,numberCheck:true,maxlength:32},
						averageScoreOfYear:{required:true,numberCheck:true,maxlength:32},
						singleScore:{required:true,numberCheck:true,maxlength:32},
						dycpScoreMajorRank:{required:true,numberCheck:true,maxlength:32},
						zycpScoreMajorRank:{required:true,numberCheck:true,maxlength:32},
						wtcpScoreMajorRank:{required:true,numberCheck:true,maxlength:32},
						nlcpScoreMajorRank:{required:true,numberCheck:true,maxlength:32},
						dycpScoreClassRank:{required:true,numberCheck:true,maxlength:32},
						zycpScoreClassRank:{required:true,numberCheck:true,maxlength:32},
						wtcpScoreClassRank:{required:true,numberCheck:true,maxlength:32},
						nlcpScoreClassRank:{required:true,numberCheck:true,maxlength:32},
						endDateStr: {required:true}
					},
					messages:{
						'schoolYear.code': {required:'请选择学期'},
						'awardInfoId.id': {required:'请选择评奖名称'},
						'secondAwardName.code': {required:'请选择行知奖学金二级奖项'},
						beginDateStr: {required:'请选择申请开始日期'},
						conComments: {maxlength:'备注最多不能超过500字'},
						zhcpScoreMajorRank:{required:'请输入综合测评成绩专业排名',maxlength:'最多只能输入32个字符'},
						zhcpScoreClassRank:{required:'请输入综合测评成绩班级排名',maxlength:'最多只能输入32个字符'},
						sportScore:{required:'请输入体育成绩',maxlength:'最多只能输入32个字符'},
						usualWork:{required:'请输入平时成绩完成量条件值',maxlength:'最多只能输入32个字符'},
						averageScoreOfYear:{required:'请输入学年课程总平均成绩条件值',maxlength:'最多只能输入32个字符'},
						singleScore:{required:'请输入单科成绩条件值',maxlength:'最多只能输入32个字符'},
						dycpScoreMajorRank:{required:'请输入德育测评成绩专业排名',maxlength:'最多只能输入32个字符'},
						zycpScoreMajorRank:{required:'请输入智育测评成绩专业排名',maxlength:'最多只能输入32个字符'},
						wtcpScoreMajorRank:{required:'请输入文体测评成绩专业排名',maxlength:'最多只能输入32个字符'},
						nlcpScoreMajorRank:{required:'请输入能力测评成绩专业排名',maxlength:'最多只能输入32个字符'},
						dycpScoreClassRank:{required:'请输入德育测评成绩班级排名',maxlength:'最多只能输入32个字符'},
						zycpScoreClassRank:{required:'请输入智育测评成绩班级排名',maxlength:'最多只能输入32个字符'},
						wtcpScoreClassRank:{required:'请输入文体测评成绩班级排名',maxlength:'最多只能输入32个字符'},
						nlcpScoreClassRank:{required:'请输入能力测评成绩班级排名',maxlength:'最多只能输入32个字符'},
						endDateStr: {required:'请选择申请截止日期'}
					}
				});
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
			
		var tag=0;
		function uploadfile(obj){	
			if($("#fileUploadForm .sepH_b").length>0||tag){//创建进度条以及包括页面中存在进度条时候不能再上传，平台只提供一个用户同时只能上传一个文件
				comp.message("同时只能上传一个文件，待上传完成后，再重试。","error");
				return;
			}
			
			//验证文件扩展名,该逻辑根据具体业务可自行调整
			var fileName=$(obj).val();
			fileName=fileName.substring(fileName.lastIndexOf("\\")+1,fileName.length);
			
			if(fileName.indexOf(".")>-1){
				var ext=fileName.substring(fileName.lastIndexOf(".")+1,fileName.length).toLowerCase();
				if("doc,docx,xls,xlsx,ppt,pptx,pdf,jpg,png,img,gif,txt,iso,zip,rar,".indexOf(ext+",")<0){
					comp.message("文件上传类型只能是jpg,png,img,gif,txt,iso,zip,doc,docx,请重新选择文件。","error");
					return;
				}
			}
			
			tag=1;
			var div=fileupload.create_fileupload_div($("#fileUploadForm"),$(obj).val());
			tag=0;	
			var param="?maxSize=10485760&isTempFile=false";//设置业务文件大小限制上线不能超过10M
			$("#fileUploadForm").attr("action","${rc.contextPath}/sys/sysConfig/singleFileUpload.do"+param);		
			$("#fileUploadForm").ajaxSubmit(function(data){
				
				try{//ie8才能执行如下代码
					data=$(data).unwrap().text();
					}catch(e){//ff chrome浏览器
					}
					
				try{
					var obj=eval(data)[0];				
					if(obj.fileId==''){
						comp.message(obj.errorInfo,"error");
						$(div).remove();
					}else{
						comp.message("上传文件完成。","info");
						$(div).append($("<input>",{						
							type:'hidden',
							val:obj.fileId,
							name:'fileId',
						}));
						$(div).find("div").remove();
						$(div).find("strong").append(("&nbsp;("+obj.fileSize+")"));
						$(div).find("strong").wrapAll("<a href=\"${rc.contextPath}/sys/sysConfig/file.do?id="+obj.fileId+"\"/>");
					}
				}catch(e){
					comp.message("文件提交服务器失败，请稍后刷新页面重试，如果还未成功请联系管理。","error");
				}				
				//下面代码解决重名文件可以连续上传问题，该功能需要根据实际业务进行调整	
				var file=$("#file");
				file.after(file.clone().val(''));
				file.remove();
			});
		}
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
						<h3 class="heading">评奖信息编辑页面</h3>
					</div>
				</div>
		    	<div class="row-fluid">
		    		<form id="awardEdit" method="post" action="${rc.contextPath}/reward/settingaward/opt-query/saveUpdatedAward.do?type=AWARD">
		    				<#-- 提交的已选中条件name  -->
		    				<input id="submitIds" name="submitIds" value="" type="hidden">
		    				<input id="id" value="${award.id!""}" name="id" type="hidden">
		    				<input id="secondNameInput" value="<#if award.secondAwardName??>${award.secondAwardName.name!""}</#if>" name="secondAwardName.name" type="hidden">
		    				<input id="xingzhiName" value="${xingzhiName!""}" name="xingzhiName" type="hidden">
			    			<div class="formSep">
			    				<div class="row-fluid">
			    					<div class="span6">
			    				    	<span class="span4">学年<span class="f_req">*</span></span>
			    				    	<div class="span4">
											<select size="1" id="schoolYear" name="schoolYear.code" aria-controls="dt_gal" class="selectoption" >
												<option value="" />请选择..</option>
												<#list schoolYearList as d>
													<#if award.schoolYear?? && award.schoolYear.code==d.code>
		    					    	            	<option  value="${d.code}" selected="selected">${d.name?html}</option>
		    					    	            <#else>
		    					    	            	<option  value="${d.code}" >${d.name?html}</option>
		    					    	            </#if>
												</#list>
											</select>
										</div>
			    				    </div>
			    				    
			    				    <div class="span6">
			    				    	<span class="span4">评奖名称<span class="f_req">*</span></span>
			    				    	<div class="span4">
			    				    		<select size="1" id="awardInfoId" name="awardInfoId.id" aria-controls="dt_gal" class="selectoption" onchange="changeSecond();">
												<option value="" />请选择..</option>
												<#list awardInfoList as d>
													<#if award.awardInfoId?? && award.awardInfoId.awardName?? && award.awardInfoId.awardName == d.awardName>
														<option value="${d.id}" selected="selected">${d.awardName?html}</option>
													<#else>
														<option value="${d.id}">${d.awardName?html}</option>
													</#if>
												</#list>
											</select>
										</div>
			    				    </div>
			    				</div>
			    			</div>
			    			<div class="formSep" id="secondAwardName">
								<div class="row-fluid">
									<div class="span6">
			    				    	<span class="span4">二级奖项名称<span class="f_req">*</span></span>
			    				    	<div class="span4">
			    				    		<select size="1" id="secondName" name="secondAwardName.code" aria-controls="dt_gal" class="selectoption" >
												<option value="" />请选择..</option>
												<#list secondAwardList as d>
													<#if award.secondAwardName?? && award.secondAwardName.code==d.code>
		    					    	            	<option  value="${d.code}" selected="selected">${d.name?html}</option>
		    					    	            <#else>
		    					    	            	<option  value="${d.code}" >${d.name?html}</option>
		    					    	            </#if>
												</#list>
											</select>

										</div>
			    				    </div>
								</div>
							</div>	
			    			
			    			<div class="formSep">
			    				<div class="row-fluid">
			    					<div class="span6">
			    				    	<span class="span4">申请开始日期<span class="f_req">*</span></span>
			    				    	<div class="span4">
			    							<input type="text" id="beginDate" name="beginDateStr" style="width:210px;cursor:pointer" value="${award.beginDate?string("yyyy-MM-dd")}"  class="Wdate" 
												onclick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'%y-%M-%d',skin:'whyGreen',el:$dp.$('beginDate')})" 
												style="cursor:pointer"  />
			    						</div>
			    				    </div>
			    				    <div class="span6">
			    				    	<span class="span4">申请截止日期<span class="f_req">*</span></span>
			    				    	<div class="span4">
											<input type="text" id="endDate" name="endDateStr" style="width:210px;cursor:pointer" value="${award.endDate?string("yyyy-MM-dd")}"  class="Wdate" 
												onclick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'beginDate\')}',skin:'whyGreen',el:$dp.$('endDate')})" 
												style="cursor:pointer"  />
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
														<input type="hidden" value=">=" name="sportScoreCOMPARE">
														<input type="hidden" value="Y" name="sportScoreCHECK">
													</label>
												<#else>
									    			<label class="checkbox inline">
														<input type="checkbox" name="sportScore1" onclick="changeInput(this)"/>体育成绩以上
														<input type="hidden" value=">=" name="sportScoreCOMPARE">
														<input type="hidden" value="Y" name="sportScoreCHECK">
													</label>
												</#if>
											</#if>
								    	</div>
			    				    	<div class="span4 tipTag" data="体育成绩以上">
			    				    		<#if conInfoMap??>
				    							<#if conInfoMap['sportScore']??>
			    									<input id="sportScore"  value="${conInfoMap['sportScore'].conditionValue}" name="sportScore" >
		    									<#else>
			    									<input id="sportScore"  value="" name="sportScore"  disabled="disabled">
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
														<input type="hidden" value=">=" name="singleScoreCOMPARE">
														<input type="hidden" value="Y" name="singleScoreCHECK">
													</label>
												<#else>
									    			<label class="checkbox inline">
														<input type="checkbox"  name="singleScore1" onclick="changeInput(this)"/>单科成绩以上
														<input type="hidden" value=">=" name="singleScoreCOMPARE">
														<input type="hidden" value="Y" name="singleScoreCHECK">
													</label>
												</#if>
											</#if>
								    	</div>
			    				    	<div class="span4 tipTag" data="单科成绩以上">
			    				    		<#if conInfoMap??>
				    							<#if conInfoMap['singleScore']??>
			    									<input id="singleScore"  value="${conInfoMap['singleScore'].conditionValue}" name="singleScore" >
		    									<#else>
			    									<input id="singleScore"  value="" name="singleScore"  disabled="disabled">
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
														<input type="hidden" value=">=" name="averageScoreOfYearCOMPARE">
														<input type="hidden" value="Y" name="averageScoreOfYearCHECK">
													</label>
												<#else>
									    			<label class="checkbox inline">
														<input type="checkbox"  name="averageScoreOfYear1" onclick="changeInput(this)"/>学年课程总平均成绩
														<input type="hidden" value=">=" name="averageScoreOfYearCOMPARE">
														<input type="hidden" value="Y" name="averageScoreOfYearCHECK">
													</label>
												</#if>
											</#if>
								    	</div>
			    				    	<div class="span4 tipTag" data="学年课程总平均成绩">
			    				    		<#if conInfoMap??>
				    							<#if conInfoMap['averageScoreOfYear']??>
			    									<input id="averageScoreOfYear"  value="${conInfoMap['averageScoreOfYear'].conditionValue}" name="averageScoreOfYear" >
		    									<#else>
			    									<input id="averageScoreOfYear"  value="" name="averageScoreOfYear"  disabled="disabled">
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
														<input type="hidden" value="<=" name="usualWorkCOMPARE">
														<input type="hidden" value="N" name="usualWorkCHECK">
													</label>
												<#else>
									    			<label class="checkbox inline">
														<input type="checkbox"  name="usualWork1" onclick="changeInput(this)"/>平时作业未完成量低于
														<input type="hidden" value="<=" name="usualWorkCOMPARE">
														<input type="hidden" value="N" name="usualWorkCHECK">
													</label>
												</#if>
											</#if>
								    	</div>
			    				    	<div class="span4 tipTag" data="平时作业未完成量低于">
			    				    		<#if conInfoMap??>
				    							<#if conInfoMap['usualWork']??>
			    									<input id="usualWork" value="${conInfoMap['usualWork'].conditionValue}" name="usualWork" >
		    									<#else>
			    									<input id="usualWork" value="" name="usualWork"  disabled="disabled">
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
														<input type="hidden" value="<=" name="zhcpScoreMajorRankCOMPARE">
														<input type="hidden" value="Y" name="zhcpScoreMajorRankCHECK">
													</label>
												<#else>
									    			<label class="checkbox inline">
														<input type="checkbox"   name="zhcpScoreMajorRank1" onclick="changeInput(this)"/>综合成绩专业排名
														<input type="hidden" value="<=" name="zhcpScoreMajorRankCOMPARE">
														<input type="hidden" value="Y" name="zhcpScoreMajorRankCHECK">
													</label>
												</#if>
											</#if>
								    	</div>
			    				    	<div class="span4 tipTag" data="学年综合测评成绩列该年级同专业同类型学生数前">
						    				<#if conInfoMap??>
					    						<#if conInfoMap['zhcpScoreMajorRank']??>
			    									<input id="zhcpScoreMajorRank"  value="${conInfoMap['zhcpScoreMajorRank'].conditionValue}" name="zhcpScoreMajorRank" >%
			    								<#else>
			    									<input id="zhcpScoreMajorRank"   value="" name="zhcpScoreMajorRank"  disabled="disabled">%
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
														<input type="hidden" value="<=" name="zhcpScoreClassRankCOMPARE">
														<input type="hidden" value="Y" name="zhcpScoreClassRankCHECK">
													</label>
												<#else>
									    			<label class="checkbox inline">
														<input type="checkbox"  name="zhcpScoreClassRank1" onclick="changeInput(this)"/>综合成绩班级排名
														<input type="hidden" value="<=" name="zhcpScoreClassRankCOMPARE">
														<input type="hidden" value="Y" name="zhcpScoreClassRankCHECK">
													</label>
												</#if>
											</#if>
								    	</div>
			    				    	<div class="span4 tipTag" data="学年综合测评成绩列该班级学生数前">
										    <#if conInfoMap??>
				    							<#if conInfoMap['zhcpScoreClassRank']??>
			    									<input id="zhcpScoreClassRank" value="${conInfoMap['zhcpScoreClassRank'].conditionValue}" name="zhcpScoreClassRank">%
		    									<#else>
			    									<input id="zhcpScoreClassRank" value="" name="zhcpScoreClassRank"  disabled="disabled">%
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
														<input type="hidden" value="<=" name="dycpScoreMajorRankCOMPARE">
														<input type="hidden" value="Y" name="dycpScoreMajorRankCHECK">
													</label>
												<#else>
									    			<label class="checkbox inline">
														<input type="checkbox"  name="dycpScoreMajorRank1" onclick="changeInput(this)"/>德育成绩专业排名
														<input type="hidden" value="<=" name="dycpScoreMajorRankCOMPARE">
														<input type="hidden" value="Y" name="dycpScoreMajorRankCHECK">
													</label>
												</#if>
											</#if>
								    	</div>
			    				    	<div class="span4 tipTag" data="德育测评成绩列该年级同专业同类型学生数前">
			    				    		<#if conInfoMap??>
				    							<#if conInfoMap['dycpScoreMajorRank']??>
			    									<input id="dycpScoreMajorRank"  value="${conInfoMap['dycpScoreMajorRank'].conditionValue}" name="dycpScoreMajorRank">%
			    								<#else>
			    									<input id="dycpScoreMajorRank"  value="" name="dycpScoreMajorRank"  disabled="disabled">%
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
														<input type="hidden" value="<=" name="dycpScoreClassRankCOMPARE">
														<input type="hidden" value="Y" name="dycpScoreClassRankCHECK">
													</label>
												<#else>
									    			<label class="checkbox inline">
														<input type="checkbox"  name="dycpScoreClassRank1" onclick="changeInput(this)"/>德育成绩班级排名
														<input type="hidden" value="<=" name="dycpScoreClassRankCOMPARE">
														<input type="hidden" value="Y" name="dycpScoreClassRankCHECK">
													</label>
												</#if>
											</#if>
								    	</div>
			    				    	<div class="span4 tipTag" data="德育测评成绩列该班级学生数前">
			    				    		<#if conInfoMap??>
				    							<#if conInfoMap['dycpScoreClassRank']??>
			    									<input id="dycpScoreClassRank"  value="${conInfoMap['dycpScoreClassRank'].conditionValue}" name="dycpScoreClassRank" >%
		    									<#else>
			    									<input id="dycpScoreClassRank"  value="" name="dycpScoreClassRank"  disabled="disabled">%
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
														<input type="hidden" value="<=" name="wtcpScoreMajorRankCOMPARE">
														<input type="hidden" value="Y" name="wtcpScoreMajorRankCHECK">
													</label>
												<#else>
									    			<label class="checkbox inline">
														<input type="checkbox"  name="wtcpScoreMajorRank1" onclick="changeInput(this)"/>文体成绩专业排名
														<input type="hidden" value="<=" name="wtcpScoreMajorRankCOMPARE">
														<input type="hidden" value="Y" name="wtcpScoreMajorRankCHECK">
													</label>
												</#if>
											</#if>
								    	</div>
			    				    	<div class="span4 tipTag" data="文体测评成绩列该年级同专业同类型学生数前">
			    				    		<#if conInfoMap??>
				    							<#if conInfoMap['wtcpScoreMajorRank']??>
			    									<input id="wtcpScoreMajorRank"  value="${conInfoMap['wtcpScoreMajorRank'].conditionValue}" name="wtcpScoreMajorRank" >%
		    									<#else>
			    									<input id="wtcpScoreMajorRank"  value="" name="wtcpScoreMajorRank"  disabled="disabled">%
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
														<input type="hidden" value="<=" name="wtcpScoreClassRankCOMPARE">
														<input type="hidden" value="Y" name="wtcpScoreClassRankCHECK">
													</label>
												<#else>
									    			<label class="checkbox inline">
														<input type="checkbox"  name="wtcpScoreClassRank1" onclick="changeInput(this)"/>文体成绩班级排名
														<input type="hidden" value="<=" name="wtcpScoreClassRankCOMPARE">
														<input type="hidden" value="Y" name="wtcpScoreClassRankCHECK">
													</label>
												</#if>
											</#if>
								    	</div>
			    				    	<div class="span4 tipTag" data="文体测评成绩列该班级学生数前">
			    				    		<#if conInfoMap??>
				    							<#if conInfoMap['wtcpScoreClassRank']??>
			    									<input id="wtcpScoreClassRank" value="${conInfoMap['wtcpScoreClassRank'].conditionValue}" name="wtcpScoreClassRank" >%
		    									<#else>
			    									<input id="wtcpScoreClassRank" value="" name="wtcpScoreClassRank"  disabled="disabled">%
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
														<input type="hidden" value="<=" name="zycpScoreMajorRankCOMPARE">
														<input type="hidden" value="Y" name="zycpScoreMajorRankCHECK">
													</label>
												<#else>
									    			<label class="checkbox inline">
														<input type="checkbox"  name="zycpScoreMajorRank1" onclick="changeInput(this)"/>智育成绩专业排名
														<input type="hidden" value="<=" name="zycpScoreMajorRankCOMPARE">
														<input type="hidden" value="Y" name="zycpScoreMajorRankCHECK">
													</label>
												</#if>
											</#if>
								    	</div>
			    				    	<div class="span4 tipTag" data="智育测评成绩列该年级同专业同类型学生数前">
			    				    		<#if conInfoMap??>
				    							<#if conInfoMap['zycpScoreMajorRank']??>
			    									<input id="zycpScoreMajorRank"  value="${conInfoMap['zycpScoreMajorRank'].conditionValue}" name="zycpScoreMajorRank" >%
		    									<#else>
			    									<input id="zycpScoreMajorRank"  value="" name="zycpScoreMajorRank" disabled="disabled">%
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
														<input type="hidden" value="<=" name="zycpScoreClassRankCOMPARE">
														<input type="hidden" value="Y" name="zycpScoreClassRankCHECK">
													</label>
												<#else>
									    			<label class="checkbox inline">
														<input type="checkbox" name="zycpScoreClassRank1" onclick="changeInput(this)"/>智育成绩班级排名
														<input type="hidden" value="<=" name="zycpScoreClassRankCOMPARE">
														<input type="hidden" value="Y" name="zycpScoreClassRankCHECK">
													</label>
												</#if>
											</#if>
								    	</div>
			    				    	<div class="span4 tipTag" data="智育测评成绩列该班级学生数前">
			    				    		<#if conInfoMap??>
				    							<#if conInfoMap['zycpScoreClassRank']??>
			    									<input id="zycpScoreClassRank"  value="${conInfoMap['zycpScoreClassRank'].conditionValue}" name="zycpScoreClassRank">%
		    									<#else>
			    									<input id="zycpScoreClassRank"  value="" name="zycpScoreClassRank"  disabled="disabled">%
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
														<input type="hidden" value="<=" name="nlcpScoreMajorRankCOMPARE">
														<input type="hidden" value="Y" name="nlcpScoreMajorRankCHECK">
													</label>
												<#else>
									    			<label class="checkbox inline">
														<input type="checkbox"  name="nlcpScoreMajorRank1" onclick="changeInput(this)"/>能力成绩专业排名
														<input type="hidden" value="<=" name="nlcpScoreMajorRankCOMPARE">
														<input type="hidden" value="Y" name="nlcpScoreMajorRankCHECK">
													</label>
												</#if>
											</#if>
								    	</div>
			    				    	<div class="span4 tipTag" data="能力测评成绩列该年级同专业同类型学生数前">
			    				    		<#if conInfoMap??>
				    							<#if conInfoMap['nlcpScoreMajorRank']??>
			    									<input id="nlcpScoreMajorRank"  value="${conInfoMap['nlcpScoreMajorRank'].conditionValue}" name="nlcpScoreMajorRank" >%
		    									<#else>
			    									<input id="nlcpScoreMajorRank"  value="" name="nlcpScoreMajorRank"  disabled="disabled">%
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
														<input type="hidden" value="<=" name="nlcpScoreClassRankCOMPARE">
														<input type="hidden" value="Y" name="nlcpScoreClassRankCHECK">
													</label>
												<#else>
									    			<label class="checkbox inline">
														<input type="checkbox"  name="nlcpScoreClassRank1" onclick="changeInput(this)"/>能力成绩班级排名
														<input type="hidden" value="<=" name="nlcpScoreClassRankCOMPARE">
														<input type="hidden" value="Y" name="nlcpScoreClassRankCHECK">
													</label>
												</#if>
											</#if>
								    	</div>
			    				    	<div class="span4 tipTag" data="能力测评成绩列该班级学生数前">
			    				    		<#if conInfoMap??>
				    							<#if conInfoMap['nlcpScoreClassRank']??>
			    									<input id="nlcpScoreClassRank"  value="${conInfoMap['nlcpScoreClassRank'].conditionValue}" name="nlcpScoreClassRank" >%
		    									<#else>
			    									<input id="nlcpScoreClassRank"  value="" name="nlcpScoreClassRank"  disabled="disabled">%
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
														<input type="hidden" value="=" name="classLeaderRadioCOMPARE">
														<input type="hidden" value="N" name="classLeaderRadioCHECK">
													</label>
												<#else>
									    			<label class="checkbox inline">
														<input type="checkbox"  name="classLeaderRadio1" onclick="changeInput(this)"/>是否为班级干部
														<input type="hidden" value="=" name="classLeaderRadioCOMPARE">
														<input type="hidden" value="N" name="classLeaderRadioCHECK">
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
														<input type="hidden" value="=" name="schoolRuleRadioCOMPARE">
														<input type="hidden" value="N" name="schoolRuleRadioCHECK">
													</label>
												<#else>
									    			<label class="checkbox inline">
														<input type="checkbox"  name="schoolRuleRadio1" onclick="changeInput(this)"/>是否遵守校规校纪
														<input type="hidden" value="=" name="schoolRuleRadioCOMPARE">
														<input type="hidden" value="N" name="schoolRuleRadioCHECK">
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
														<input type="hidden" value="=" name="truancyRadioCOMPARE">
														<input type="hidden" value="N" name="truancyRadioCHECK">
													</label>
												<#else>
									    			<label class="checkbox inline">
														<input type="checkbox"  name="truancyRadio1" onclick="changeInput(this)"/>是否旷课
														<input type="hidden" value="=" name="truancyRadioCOMPARE">
														<input type="hidden" value="N" name="truancyRadioCHECK">
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
														<input type="hidden" value="=" name="dormRadioCOMPARE">
														<input type="hidden" value="Y" name="dormRadioCHECK">
													</label>
												<#else>
									    			<label class="checkbox inline">
														<input type="checkbox"  name="dormRadio1" onclick="changeInput(this)"/>合格寝室
														<input type="hidden" value="=" name="dormRadioCOMPARE">
														<input type="hidden" value="Y" name="dormRadioCHECK">
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
														<input type="hidden" value="=" name="highGradeRadioCOMPARE">
														<input type="hidden" value="Y" name="highGradeRadioCHECK">
													</label>
												<#else>
									    			<label class="checkbox inline">
														<input type="checkbox"  name="highGradeRadio1" onclick="changeInput(this)"/>所有科目成绩及格
														<input type="hidden" value="=" name="highGradeRadioCOMPARE">
														<input type="hidden" value="Y" name="highGradeRadioCHECK">
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
														<input type="hidden" value="=" name="honorRadioCOMPARE">
														<input type="hidden" value="N" name="honorRadioCHECK">
													</label>
												<#else>
									    			<label class="checkbox inline">
														<input type="checkbox"  name="honorRadio1" onclick="changeInput(this)"/>是否获得荣誉
														<input type="hidden" value="=" name="honorRadioCOMPARE">
														<input type="hidden" value="N" name="honorRadioCHECK">
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
														<input type="hidden" value="=" name="tuitionRadioCOMPARE">
														<input type="hidden" value="N" name="tuitionRadioCHECK">
													</label>
												<#else>
									    			<label class="checkbox inline">
														<input type="checkbox"  name="tuitionRadio1" onclick="changeInput(this)"/>是否按时缴纳学费
														<input type="hidden" value="=" name="tuitionRadioCOMPARE">
														<input type="hidden" value="N" name="tuitionRadioCHECK">
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
											</br>
											<font size="1" color="grey"  style="vertical-align:bottom;">(描述不超过500字)</font>
										</div>
			    				    </div>
			    				</div>
			    			</div>
			    			
    			<div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span4">
				    		<span>名额限制</span>
						</div>
				    	<div class="span4">
           					<div id="dt_gal_wrapper"  style="width:780px;" role="grid">
								<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
		   						<#if quotaInfoList??>	
			   						<thead>
										<tr>
										<#list quotaInfoList as p>
											<th class="autocut" style="text-align: center">${p.academyId.name!""?html}</th>
										</#list>
										</tr>
									</thead>
			   						<tbody>
									<tr>
										<#list quotaInfoList as p>
											<td class="autocut" style="text-align: center;padding:5px;padding-bottom:0px;">
												<input id="${p.academyId.id}" name="${p.academyId.id}academy" class="{numberCheck:true,maxlength:32,messages:{maxlength:'最多可输入32个字符'}}${p.academyId.id}" style="width:80px;" value="${p.num!""}"/>
											</td>
										</#list>
									</tr>
			   						</tbody>
		   						 </#if> 
							</table>
							</div>
						</div>
					</div>
				</div>
			</div>
			    	</form>		
							
			    			
			    			<div class="formSep">
			    				<div class="row-fluid">
			    					<div class="span6">
			    						<div class="span4">
								    		<label>相关附件</label>
								    	</div>
			    				    	<div class="span4">
											<form  id="fileUploadForm"  action="" method="post"  enctype="multipart/form-data">
												<div data-fileupload="file" class="fileupload fileupload-new">
														<span class="btn btn-file"><span class="fileupload-new">选择文件</span><input id="file" type="file" name="file" onchange="uploadfile(this)"></span>
												 </div>
												 <div class="upload-alert-message" style="word-break:break-all;width: 760px; height: 20px;">
							        		       	文件只支持：jpg,jpeg,png,gif,txt,ppt,rar,zip,doc,docx,xls,xlsx,ppt,pptx,wps,et,dps，且大小不超过10MB。
							        		 	</div>
												 <#if uploadFileRefList??>	
													<#list uploadFileRefList as p>
														<div class="fileupload-info">
															<a class="close" data-dismiss="alert">×</a>
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
							
							
			    			
			        		<br/>
		    		<div class="row-fluid">
						<div class="span6">
							<div class="span4">
			        		</div>
				    		<div class="span6" >
				              	<button class="btn btn-info" onclick="saveAward()">保 存</button>
				              	<button class="btn btn-info" onclick="publish()">发 布</button>
				              	<button class="btn" onclick="returnList()">取 消</button>
			           		</div>
			           	</div>
			         </div>
			         
			         
	    </div>
	    </div>
	    </div>       		
	    </div>       		
	</body>
</html>