<html>
 <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- jQuery UI theme-->
        <link rel="stylesheet" href="${rc.contextPath}/lib/jquery-ui/css/Aristo/Aristo.css" />
        <script src="${rc.contextPath}/lib/jquery-ui/jquery-ui-1.8.20.custom.min.js"></script>
        <!-- animated progressbars -->
        <script src="${rc.contextPath}/js/bdp_fileupload.progressbar.js"></script>
        <!-- ajax form-->
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
		<!-- bootstrap-fileupload -->	
		<link rel="stylesheet" href="${rc.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.min.css" />
		<!--date-->
		
		
		 <!-- My97DatePicker -->
    	<link rel="stylesheet" href="${rc.contextPath}/lib/My97DatePicker/skin/WdatePicker.css" />
		<script type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
		<!-- jquery.validate -->
		<script src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script>
		
		<!-- 富文本编辑器 -->
		<script src="${rc.contextPath}/lib/tinymce/tinymce.min.js"></script>	
		
		<script>
		
		//初始化
		$("document").ready(function(){
		
			//判断专业Id
			if('${(flag)!""}'=="save"){
				//提示信息
				comp.message("迎新数据设置成功！","info");
			}
		
				//输入数据的检查
					$(function(){	
	            
						$("#welcomeSetEdit").compValidate({
								rules:{
										moveAdderss:{required:true},
										
										writeComm:{required:true},
										
										airCondComm:{required:true},
										
										bedComm:{required:true},
										
										reportComm:{required:true}
									},
								messages: {  
									moveAdderss:{required: "户口迁移地址不能为空！"  },
									writeComm:{required: "信息采集填写不能为空！"  },
									airCondComm:{required: "空调说明不能为空！"  },
									bedComm:{required: "寝具包说明不能为空！"  },
						            reportComm: {  
						                required: "报到流程说明不能为空！"
						            }
						        },
						        submitHandler: function (form) {  
						            form.submit();  
						        },
						        errorClass: "error",  
		       					focusCleanup: true,
		       					success: function (label) {  
		            				//label.html("<span style=\"color:green\">填写正确！</span>").addClass("success");
		            			}
            			});
					});
			});
			
			//提交保存的处理
			function onSub(){
				//from 提交
				$('#welcomeSetEdit').submit();
				
			}
		
			// 取消
			function cancel(){
				
			}
			
			
			//修改弹出选择专业框
		function selectMajor(url){
			comp.showModal("selectMajorId","800px","-250px 0 0 -400px");
			$("#stmp_selectMajorId").load(url,{"":""},function(){});
		}
		
		
		//批量处理从财务系统通过接口的方式，更新收费的状态
		function refreshCostState(){
		
			comp.confirm("更新学生收费状态需要很长时间，还要更新吗？", function(result) {
        			if(result)	{	 	
    			$.ajax({
    				async :true,
					cache :false,
					//timeout: 100000,
					type:"get",
					url:"${rc.contextPath}/orientation/scene/dataset/nsm/costTotal.do",
		
				error: function () {
					comp.message("连接服务器失败","error");
					return;
				},
				success:function() { 
			
				}
		
    		});
			//setInterval(function() {refreshOnTime(); }, 3000);
			
			}
		});
		}
	 </script>
    </head>
<body>
<div id="contentwrapper">
    <div class="main_content">
    	<div class="row-fluid">
	   		 <div class="span12">
	    	<h3 class="heading">
				迎新数据设置
			</h3>
	    	</div>
    	</div>
		
		<input name="errorText" id="errorText" type="hidden" value="${errorText!""}"/>
		<form  id="welcomeSetEdit" class="form_validation_reg" action="${rc.contextPath}/welcome/set/opt-add/submitWelcomeSet.do"  method="post" enctype="multipart/form-data">
		<#if welcomeSet?? && welcomeSet.id?? >
		<#else>
			<@token/>
		</#if>
		<input id="id" type="hidden" name="id"  value="${(welcomeSet.id)!""}">
		
		<div class="formSep">
				<div class="row-fluid">
					<div class="span8">
						<div class="span2">
							<label>信息采集时间<span class="f_req">*</span></label>
						</div>
						<div class="span10">
							
							<div class="span2">
							<#if welcomeSet.startDate??>
									<input id="startDate" name="startDate" class="Wdate"
									 style="cursor:pointer;width: 89px;" onclick="WdatePicker({skin:'whyGreen', maxDate:'#F{$dp.$D(\'endDate\')}'});"  value='${(welcomeSet.startDate!"")?string("yyyy-MM-dd")}' />
								<#else>
									<input id="startDate" name="startDate" class="Wdate" 
									style="cursor:pointer;width: 89px;" onclick="WdatePicker({skin:'whyGreen', maxDate:'#F{$dp.$D(\'endDate\')}'});"  value=""  />
								</#if>
								
								</div>
								
								<div class="span1" style="padding-top:5px; padding-left:20px;">
								至
								</div>
							
							<div class="span2">
								<#if welcomeSet.endDate??>
									<input id="endDate" name="endDate" class="Wdate"
									 style="cursor:pointer;width: 89px;" onclick="WdatePicker({skin:'whyGreen', minDate:'#F{$dp.$D(\'startDate\')}'});"  value='${(welcomeSet.endDate!"")?string("yyyy-MM-dd")}' />
								<#else>
									<input id="endDate" name="endDate" class="Wdate" 
									style="cursor:pointer;width: 89px;" onclick="WdatePicker({skin:'whyGreen', minDate:'#F{$dp.$D(\'startDate\')}'});"  value="" />
								</#if>
							</div>
							
						</div>
					</div>
				</div>
			</div>	
			
			<div class="formSep">
				<div class="row-fluid">
					<div class="span8">
						<div class="span2">
							<label>户口迁移地址<span class="f_req">*</span></label>
						</div>
						<div class="span10">
							
							<#if welcomeSet.moveAdderss?? >
								<input id="moveAdderss" name="moveAdderss" maxlength="40" value="${welcomeSet.moveAdderss?html}" style='width:244px;'/>
						
							<#else>
								<input id="moveAdderss" name="moveAdderss" maxlength="40"  style='width:244px;' />
							</#if> 
							
						</div>
					</div>
				</div>
			</div>	
			
			<div class="formSep">
					<div class="row-fluid">
					    <div class="span8">
							<div class="span2">
								<label>信息采集填写<span class="f_req">*</span></label>	
							</div>
							<div class="span10">
							 	<textarea name="writeComm" id="writeComm" maxlength="3000" cols="12" rows="5" class="span12">${(welcomeSet.writeComm!"")?html}</textarea>
							</div>
						</div>
				 	</div>
				</div>   
			
			
			<#--<div class="formSep">
					<div class="row-fluid">
					    <div class="span8">
							<div class="span2">
								<label>空调说明<span class="f_req">*</span></label>	
							</div>
							<div class="span10">
							 	<textarea name="airCondComm" id="airCondComm" maxlength="500" cols="12" rows="5" class="span12">${(welcomeSet.airCondComm!"")?html}</textarea>
							</div>
						</div>
				 	</div>
				</div>-->   
				
				<div class="formSep">
					<div class="row-fluid">
					    <div class="span8">
							<div class="span2">
								<label>寝具包说明<span class="f_req">*</span></label>	
							</div>
							<div class="span10">
							 	<textarea name="bedComm" id="bedComm" maxlength="500" cols="12" rows="5" class="span12">${(welcomeSet.bedComm!"")?html}</textarea>
							</div>
						</div>
				 	</div>
				</div>  
				
				<div class="formSep">
					<div class="row-fluid">
					    <div class="span8">
							<div class="span2">
								<label>报到流程说明<span class="f_req">*</span></label>	
							</div>
							<div class="span10">
							 	<textarea name="reportComm" id="reportComm" cols="100" rows="5" class="span12"  style='height:350px;'>${(welcomeSet.reportComm!"")?html}</textarea>
							</div>
						</div>
				 	</div>
				</div> 
				
				<div class="span6">
	        	<p class="btnMargin">
	        		<button class="btn btn-info" type="button" onclick="refreshCostState()">
	        		 批量获取学生缴费状态
				</button>
			  	<!--<button class="btn" type="button" onclick="cancel()">取消</button>-->
			</p>
		</div>  
			
			</form>
			
			<div class="span6">
	        	<p class="btnMargin">
	        		<button class="btn btn-info" type="button" onclick="onSub()">
	        		 保存
				</button>
			  	<!--<button class="btn" type="button" onclick="cancel()">取消</button>-->
			</p>
		</div>
		<input name="check_error" id="check_error" type="hidden" value="true"/>
	</div>
	

<script>

//富文本插件初始化
		tinymce.init({
		    selector: "textarea#reportComm",
		    language:'zh_CN',
		    menubar: false,
		    statusbar : false,
		    toolbar_items_size: 'small',
		    theme: "modern",
		    plugins: [
		         "advlist autolink link image lists charmap print preview hr anchor pagebreak",
		         "searchreplace wordcount visualblocks visualchars code fullscreen insertdatetime media nonbreaking",
		         "save table contextmenu directionality emoticons template paste textcolor"
		   ],
		   toolbar: "insertfile undo redo | styleselect | bold italic | table | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image | print preview media fullpage | forecolor backcolor fontselect fontsizeselect emoticons",
		   fontsize_formats: "8pt 10pt 12pt 14pt 18pt 24pt 36pt"
		});  
		

	if($('#errorText').val()!=""){
		$.sticky($('#errorText').val(), {autoclose : 5000, position: "top-right", type: "st-error" });
	}
</script>

</div>

</body>
</html>

