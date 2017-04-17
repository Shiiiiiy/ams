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
				window.location.href="${rc.contextPath}/reward/settingaward/opt-query/queryAwardPage.do?type=EXCELLENT";
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
					if(id.indexOf("BOX") > -1) {
						$("."+tempId).attr("disabled",false);
						$("."+tempId).attr("checked",true);
					}else{
						$("#"+tempId).attr("disabled",false);
					}
				}else if(status == false) {
					submitIds = submitIds.replace(tempId+",","");
					$("#submitIds").val(submitIds);
					if(id.indexOf("BOX") > -1) {
						$("."+tempId).attr("disabled","disabled");
						$("."+tempId).attr("checked",false);
					}else{
						$("#"+tempId).attr("disabled","disabled");
						$("#"+tempId).val("");
					}
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
				var data = {id:function(){return $('#id').val();},name:function(){return $('#awardInfoId').val();},
							secondName:"",schoolYear:function(){return $("#schoolYear").val();}};
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
						beginDateStr: {required:true},
						conComments: {maxlength:500},
						sportScore: {required:true,numberCheck:true,maxlength:32},
						zhszClassRank: {required:true,numberCheck:true,min:1,maxlength:32},
						percentOfAllAcademy: {required:true,numberCheck:true,min:1,maxlength:32},
						zbjxsgb: {required:true,numberCheck:true,min:1,maxlength:32},
						pdcpClassRank: {required:true,numberCheck:true,min:1,maxlength:32},
						endDateStr: {required:true}
					},
					messages:{
						'schoolYear.code': {required:'请选择学期'},
						'awardInfoId.id': {required:'请选择评奖名称'},
						beginDateStr: {required:'请选择申请开始日期'},
						conComments: {maxlength:'备注最多不能超过500字'},
						sportScore: {required:'请输入体育成绩条件值',maxlength:'最多只能输入32个字符'},
						zhszClassRank: {required:'请输入综合素质本班排名条件值',maxlength:'最多只能输入32个字符'},
						percentOfAllAcademy: {required:'请输入优秀班级占学院班级总数条件值',maxlength:'最多只能输入32个字符'},
						zbjxsgb: {required:'请输入占班级学生干部总数条件值',maxlength:'最多只能输入32个字符'},
						pdcpClassRank: {required:'请输入品德测评成绩本班排名条件值',maxlength:'最多只能输入32个字符'},
						gainAwardBOX:{required:'请选择奖学金等级',maxlength:'最多只能输入32个字符'},
						endDateStr: {required:'请选择申请截止日期'}
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
						<h3 class="heading">&nbsp;&nbsp;&nbsp;评优信息编辑页面</h3>
					</div>
				</div>
		    	<div class="row-fluid">
		    		<form id="awardEdit" method="post" action="${rc.contextPath}/reward/settingaward/opt-query/saveUpdatedAward.do?type=EXCELLENT">
		    				<#-- 提交的已选中条件name  -->
		    				<input id="submitIds" name="submitIds" value="" type="hidden">
		    				<input id="id" value="${award.id!""}" name="id" type="hidden">
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
		    					    	            	<option  value="${d.code}">${d.name?html}</option>
		    					    	            </#if>
												</#list>
											</select>
										</div>
			    				    </div>
			    				    
			    				    <div class="span6">
			    				    	<span class="span4">评优名称<span class="f_req">*</span></span>
			    				    	<div class="span4">
			    				    		<select size="1" id="awardInfoId" name="awardInfoId.id" aria-controls="dt_gal" class="selectoption" >
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
										
			    				<#--if conInfoMap??>
		    						<#if conInfoMap['gainAwardBOX']??>
										<div class="span6">
									    	<div class="span4">
								    			<label class="checkbox inline">
													<input type="checkbox"   name="gainAwardBOX1" onclick="changeInput(this)" checked="checked"/>获得奖学金
													<input type="hidden" value="<=" name="gainAwardBOXCOMPARE">
													<input type="hidden" value="Y" name="gainAwardBOXCHECK">
												</label>
									    	</div>
									    	<div class="span4">
											<#if conInfoMap['gainAwardBOX'].conditionValue == '1'>
												<label class="radio inline">
													<input type="radio" name="gainAwardBOX" class="gainAwardBOX"  value="1" checked="checked" />一等奖学金
												</label> 
												<label class="radio inline">
													<input type="radio" name="gainAwardBOX" value="2" class="gainAwardBOX" />二等奖学金
												</label>
												<label class="radio inline">
													<input type="radio" name="gainAwardBOX" value="3" class="gainAwardBOX" />三等奖学金
												</label>
											<#elseif conInfoMap['gainAwardBOX'].conditionValue == '2'>
												<label class="radio inline">
													<input type="radio" name="gainAwardBOX" class="gainAwardBOX"  value="1"  />一等奖学金
												</label> 
												<label class="radio inline">
													<input type="radio" name="gainAwardBOX" value="2" class="gainAwardBOX" checked="checked"/>二等奖学金
												</label>
												<label class="radio inline">
													<input type="radio" name="gainAwardBOX" value="3" class="gainAwardBOX" />三等奖学金
												</label>
											<#else>
												<label class="radio inline">
													<input type="radio" name="gainAwardBOX" class="gainAwardBOX"  value="1"  />一等奖学金
												</label> 
												<label class="radio inline">
													<input type="radio" name="gainAwardBOX" value="2" class="gainAwardBOX" />二等奖学金
												</label>
												<label class="radio inline">
													<input type="radio" name="gainAwardBOX" value="3" class="gainAwardBOX" checked="checked"/>三等奖学金
												</label>
											</#if>
											</div>
									    </div>
								   <#else>
								   		<div class="span6">
									    	<div class="span4">
								    			<label class="checkbox inline">
													<input type="checkbox"   name="gainAwardBOX1" onclick="changeInput(this)"/>获得奖学金
													<input type="hidden" value="<=" name="gainAwardBOXCOMPARE">
													<input type="hidden" value="Y" name="gainAwardBOXCHECK">
												</label>
									    	</div>
									    	<div class="span4">
												<label class="radio inline">
													<input type="radio" name="gainAwardBOX" class="gainAwardBOX"  value="1" disabled="disabled"/>一等奖学金
												</label>
												<label class="radio inline">
													<input type="radio" name="gainAwardBOX" value="2" class="gainAwardBOX" disabled="disabled"/>二等奖学金
												</label>
												<label class="radio inline">
													<input type="radio" name="gainAwardBOX" value="3" class="gainAwardBOX" disabled="disabled"/>三等奖学金
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
													<input type="checkbox"   name="sportScore1" onclick="changeInput(this)" checked="checked"/>体育成绩以上
													<input type="hidden" value=">=" name="sportScoreCOMPARE">
													<input type="hidden" value="Y" name="sportScoreCHECK">
												</label>
									    	</div>
									    	<div class="span4">
												<input id="sportScore" value="${conInfoMap['sportScore'].conditionValue}" name="sportScore"  data="体育成绩多少分以上">
											</div>
										<#else>
											<div class="span4">
								    			<label class="checkbox inline">
													<input type="checkbox"   name="sportScore1" onclick="changeInput(this)"/>体育成绩以上
													<input type="hidden" value=">=" name="sportScoreCOMPARE">
													<input type="hidden" value="Y" name="sportScoreCHECK">
												</label>
									    	</div>
									    	<div class="span4 tipTag" data="体育成绩多少分以上">
												<input id="sportScore" value="" name="sportScore"   disabled="disabled">
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
													<input type="checkbox"   name="zhszClassRank1" onclick="changeInput(this)" checked="checked"/>综合素质班排前
													<input type="hidden" value="<=" name="zhszClassRankCOMPARE">
													<input type="hidden" value="Y" name="zhszClassRankCHECK">
												</label>
									    	</div>
									    	<div class="span4">
												<input id="zhszClassRank" value="${conInfoMap['zhszClassRank'].conditionValue}" name="zhszClassRank"  data="综合素质评分本班排名">%
											</div>
										<#else>
											<div class="span4">
								    			<label class="checkbox inline">
													<input type="checkbox"   name="zhszClassRank1" onclick="changeInput(this)"/>综合素质班排前
													<input type="hidden" value="<=" name="zhszClassRankCOMPARE">
													<input type="hidden" value="Y" name="zhszClassRankCHECK">
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
														<input type="checkbox"   name="pdcpClassRank1" onclick="changeInput(this)" checked="checked"/>品德测评班级排名前
														<input type="hidden" value="<=" name="pdcpClassRankCOMPARE">
														<input type="hidden" value="Y" name="pdcpClassRankCHECK">
													</label>
										    	</div>
										    	<div class="span4">
										    		<input id="pdcpClassRank" value="${conInfoMap['pdcpClassRank'].conditionValue}"  name="pdcpClassRank" data="品德测评成绩在本班排名">%
												</div>
											<#else>
												<div class="span4">
									    			<label class="checkbox inline">
														<input type="checkbox"   name="pdcpClassRank1" onclick="changeInput(this)"/>品德测评班级排名前
														<input type="hidden" value="<=" name="pdcpClassRankCOMPARE">
														<input type="hidden" value="Y" name="pdcpClassRankCHECK">
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
													<input type="checkbox"   name="percentOfAllAcademy1" onclick="changeInput(this)" checked="checked"/>占学院班级总数
													<input type="hidden" value="<=" name="percentOfAllAcademyCOMPARE">
													<input type="hidden" value="N" name="percentOfAllAcademyCHECK">
												</label>
									    	</div>
									    	<div class="span4">
									    		<input id="percentOfAllAcademy" value="${conInfoMap['percentOfAllAcademy'].conditionValue}" data="优秀班级占学院班级总数" name="percentOfAllAcademy">
											</div>
										<#else>
											<div class="span4">
								    			<label class="checkbox inline">
													<input type="checkbox"   name="percentOfAllAcademy1" onclick="changeInput(this)"/>占学院班级总数
													<input type="hidden" value="<=" name="percentOfAllAcademyCOMPARE">
													<input type="hidden" value="N" name="percentOfAllAcademyCHECK">
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
													<input type="checkbox"   name="zbjxsgb1" onclick="changeInput(this)" checked="checked"/>占班级学生干部总数
													<input type="hidden" value="<=" name="zbjxsgbCOMPARE">
													<input type="hidden" value="N" name="zbjxsgbCHECK">
												</label>
									    	</div>
									    	<div class="span4">
									    		<input id="zbjxsgb" value="${conInfoMap['zbjxsgb'].conditionValue}"  name="zbjxsgb" data="优秀学生干部占班级学生干部总数">
											</div>
										<#else>
											<div class="span4">
								    			<label class="checkbox inline">
													<input type="checkbox"   name="zbjxsgb1" onclick="changeInput(this)"/>占班级学生干部总数
													<input type="hidden" value="<=" name="zbjxsgbCOMPARE">
													<input type="hidden" value="N" name="zbjxsgbCHECK">
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
																<td class="autocut" style="text-align:center;padding:5px;padding-bottom:0px;">
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
				    		<div class="span6">
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