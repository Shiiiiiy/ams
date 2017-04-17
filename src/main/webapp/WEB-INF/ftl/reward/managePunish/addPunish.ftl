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
		<script>
			//保存
			function savePunish(){
				copyFileIdInput();
				
				$("#punishEdit").submit();
			}
			function copyFileIdInput(){
				$("#punishEdit").append($("#fileUploadForm input[name='fileId']"));
			}
			//返回评优类型列表
			function returnPunishList(){   
				window.location.href="${rc.contextPath}/reward/managepunish/opt-query/queryPunishPage.do";
			}
			
			$("document").ready(function(){
				var data = {punishNum:function(){return $('#punishNum').val();},studentId:function(){return $('#stuIds').val();},punishId:function(){return $('#punishId').val();}};
				comp.validate.addRemote("nameCheck","${rc.contextPath}/reward/managepunish/opt-query/checkPunishRepeat.do",data,"该学生已有此文号处罚");
           		$("#punishEdit").compValidate({
					rules:{     
						'punish.code': {required:true},
						'punishYear.code': {required:true},
						'punishTerm.code': {required:true},
						punishNum  :{maxlength:32,nameCheck:true},
						punishReason :{required:true,maxlength:500},
						comments:{maxlength:500},
						punishCode :{maxlength:32},
						punishTypeCode :{maxlength:32},
						punishInfo :{maxlength:500},
						punishRepealNum :{maxlength:32},
						examineResult:{maxlength:500},
						'stuId.name':{required:true}
					},
					messages:{
						'punish.code': {required:'请选择处分名称'},
						'punishYear.code': {required:'请选择学年'},
						'punishTerm.code': {required:'请选择学期'},
						punishNum: {maxlength:'处分文号最多可输入32字'},
						punishReason: {required:'请填写处分原因',maxlength:'处分原因最多可输入500字'},
						comments:{maxlength:'备注最多可输入500字'},
						punishCode :{maxlength:'处分编号最多可输入32字'},
						punishTypeCode :{maxlength:'违纪类别码最多可输入32字'},
						punishInfo :{maxlength:'违纪简况最多可输入500字'},
						punishRepealNum :{maxlength:'处分撤销文号最多可输入32字'},
						examineResult:{maxlength:'申委会审议结论最多可输入500字'},
						'stuId.name' :{required:'请选择学生'}
					}
				});
			});
			
			
			function selectStudentRadio()
			{
				_queryStudentRadioAll("",$("#collegeId").val());
			}
			function setStudentRadioSelectValue(student)
			{
				$("#stuId\\.name").val(student.name);
				$("#stuIds").val(student.id);
			}
			
			
			
			
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
						<h3 class="heading">违纪信息新增页面</h3>
					</div>
				</div>
		    	<div class="row-fluid">
		    		<form id="punishEdit" method="post" action="${rc.contextPath}/reward/managepunish/opt-query/savePunish.do">
		    			<input type="hidden" name="id" value="">
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span4">
				    					<span>姓名<span class="f_req">*</span></span>
		    						</div>
		    						<div class="span7">
				    					<input id="stuId.name" name="stuId.name" value="" readonly>
				    					<a id="course-lecture-select"  style="margin-left: -4px;margin-top:-10px" href="javascript:void(0);" onclick="selectStudentRadio();" class="btn"><i class="icon-search"></i></a>
		    						</div>
			    					<input id="punishId" name="punishId" type="hidden" value="">
			    					<input id="stuIds" name="stuIds" type="hidden" value="">
			    					<input id="collegeId" name="collegeId" type="hidden" value="${collegeId!""}">
		    					</div>
		    					<div class="span6">
		    						<div class="span4">
		    				    		<span>处分文号</span>
		    						</div>
		    				    	<div class="span4">
										<input id="punishNum" name="punishNum" value="">
									</div>
	    				    	</div>
		    				</div>
	    				</div>
		    			
		    				
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span4">
			    				    	<span>处分名称<span class="f_req">*</span></span>
		    						</div>
		    						<div class="span4">
			    				    	<select size="1" id="punish" name="punish.code" aria-controls="dt_gal" class="selectoption" >
											<option value="" />请选择..</option>
											<#list punishCodeList as d>
												<#if punishInfo.punish?? && punishInfo.punish.code==d.code>
	    					    	            	<option  value="${d.code}" selected="selected">${d.name?html}</option>
	    					    	            <#else>
	    					    	            	<option  value="${d.code}" >${d.name?html}</option>
	    					    	            </#if>
											</#list>
										</select>
		    						</div>
		    				    </div>
		    					<div class="span6">
		    						<div class="span4">
			    				    	<span>处分时限</span>
		    						</div>
		    				    	<div class="span6">
		    				    		<input type="text" id="punishStartDateStr" name="punishStartDate" style="width:92px;cursor:pointer" value="<#if punishInfo.punishStartDate??>${(punishInfo.punishStartDate!"")?string("yyyy-MM-dd")}</#if>"  class="Wdate" 
												onclick="WdatePicker({dateFmt:'yyyy-MM-dd',skin:'whyGreen',el:$dp.$('punishStartDate')})" 
												style="cursor:pointer" />至
										<input type="text" id="punishEndDateStr" name="punishEndDate" style="width:92px;cursor:pointer" value="<#if punishInfo.punishStartDate??>${(punishInfo.punishEndDate!"")?string("yyyy-MM-dd")}</#if>"  class="Wdate" 
												onclick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'punishStartDateStr\')}',skin:'whyGreen',el:$dp.$('punishEndDate')})" 
												style="cursor:pointer" />
									</div>
		    				    </div>
		    				</div>
		    			</div>
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span4">
	    				    			<span>处分编号</span>
    				    			</div>
		    				    	<div class="span4">
										<input id="punishCode" name="punishCode" value="">
									</div>
	    				    	</div>
		    					<div class="span6">
		    						<div class="span4">
	    				    			<span>违纪类别码</span>
    				    			</div>
		    				    	<div class="span4">
										<input id="punishTypeCode" name="punishTypeCode" value="">
									</div>
	    				    	</div>
		    				</div>
		    			</div>	
		    			
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span4">
	    				    			<span>违纪日期</span>
    				    			</div>
		    				    	<div class="span4">
										<input type="text" id="punishStartDateStr" name="punishDate" style="cursor:pointer" value="<#if punishInfo.punishDate??>${punishInfo.punishDate?string('yyyy-MM-dd')!""}</#if>"  class="Wdate" 
												onclick="WdatePicker({dateFmt:'yyyy-MM-dd',skin:'whyGreen'})"/>
									</div>
	    				    	</div>	
		    				</div>
		    			</div>	
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span4">
			    				    	<span>学年<span class="f_req">*</span></span>
		    						</div>
		    						<div class="span4">
			    				    	<select size="1" id="punishYear" name="punishYear.code" aria-controls="dt_gal" class="selectoption" >
											<option value="" />请选择..</option>
											<#list schoolYearList as d>
												<#if punishInfo.punishYear?? && punishInfo.punishYear.code==d.code>
	    					    	            	<option  value="${d.code}" selected="selected">${d.name?html}</option>
	    					    	            <#else>
	    					    	            	<option  value="${d.code}" >${d.name?html}</option>
	    					    	            </#if>
											</#list>
										</select>
		    						</div>
		    				    </div>
		    					<div class="span6">
		    						<div class="span4">
			    				    	<span>学期<span class="f_req">*</span></span>
		    						</div>
		    						<div class="span4">
			    				    	<select size="1" id="punishTerm" name="punishTerm.code" aria-controls="dt_gal" class="selectoption">
											<option value="" />请选择..</option>
											<#list schoolTermList as d>
												<#if punishInfo.punishTerm?? && punishInfo.punishTerm.code==d.code>
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
		    						<div class="span4">
	    				    			<span>处分撤销日期</span>
    				    			</div>
		    				    	<div class="span4">
										<input type="text" id="punishRepealDate" name="punishRepealDate" style="cursor:pointer" value="<#if punishInfo.punishRepealDate??>${punishInfo.punishRepealDate?string('yyyy-MM-dd')!""}</#if>"  class="Wdate" 
												onclick="WdatePicker({dateFmt:'yyyy-MM-dd',skin:'whyGreen'})"/>
									</div>
	    				    	</div>
	    				    	<div class="span6">
		    						<div class="span4">
	    				    			<span>处分撤销文号</span>
    				    			</div>
		    				    	<div class="span4">
										<input id="punishRepealNum" name="punishRepealNum" value="">
									</div>
	    				    	</div>	
		    				</div>
		    			</div>
		    			
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span4">
	    				    			<span>申诉日期</span>
    				    			</div>
		    				    	<div class="span4">
										<input type="text" id="appealDate" name="appealDate" style="cursor:pointer" value="<#if punishInfo.appealDate??>${punishInfo.appealDate?string('yyyy-MM-dd')!""}</#if>"  class="Wdate" 
												onclick="WdatePicker({dateFmt:'yyyy-MM-dd',skin:'whyGreen'})"/>
									</div>
	    				    	</div>
	    				    	<div class="span6">
		    						<div class="span4">
	    				    			<span>申委会审议日期</span>
    				    			</div>
		    				    	<div class="span4">
										<input type="text" id="examineDate" name="examineDate" style="cursor:pointer" value="<#if punishInfo.examineDate??>${punishInfo.examineDate?string('yyyy-MM-dd')!""}</#if>"  class="Wdate" 
												onclick="WdatePicker({dateFmt:'yyyy-MM-dd',skin:'whyGreen'})"/>
									</div>
	    				    	</div>	
		    				</div>
		    			</div>
		    			
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span4">
		    				    		<span>违纪简况</span>
		    						</div>
		    				    	<div class="span4">
										<textarea id="punishInfo" name="punishInfo" col="12" rows="3" style="width: 770px; height: 111px;"></textarea>
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
		    				    		<span>处分原因<span class="f_req">*</span></span>
		    						</div>
		    				    	<div class="span4">
										<textarea id="punishReason" name="punishReason" col="12" rows="3" style="width: 770px; height: 111px;"></textarea>
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
		    				    		<span>备注</span>
	    				    		</div>
		    				    	<div class="span4">
										<textarea id="comments" name="comments" col="12" rows="3" style="width: 770px; height: 111px;"></textarea>
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
		    				    		<span>申委会审议结论</span>
	    				    		</div>
		    				    	<div class="span4">
										<textarea id="examineResult" name="examineResult" col="12" rows="3" style="width: 770px; height: 111px;"></textarea>
										</br>
										<font size="1" color="grey"  style="vertical-align:bottom;">(描述不超过500字)</font>
									</div>
	    				    	</div>
		    				</div>
		    			</div>
		    		</form>	
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span4">
							    		<label>处分文件</label>
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
														<input type="hidden" id="fileId" name="fileId" value="${p.uploadFile.id}">	
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
				    		<div class="span4">
				              	<button class="btn btn-info" onclick="savePunish()">保 存</button>
				              	<button class="btn" onclick="javascript:window.history.back(-1);">返 回</button>
			           		</div>
			           	</div>
			         </div>
	<#include "/comp/student/queryStudentAllRadioModal.ftl">		         
			         
	    </div>
	    </div>
	    </div>       		
	           		
	</body>
</html>