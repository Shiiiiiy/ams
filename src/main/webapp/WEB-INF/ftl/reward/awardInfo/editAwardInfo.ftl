<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- ajax form-->
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
		<script src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
		<script>
			//保存
			function saveAward(){
				$('#availableObject input[name="availableObject.code"]').attr("disabled",false);
				$("#awardEdit").submit();
			}
			//返回评优类型列表
			function returnAwardList(){   
				window.location.href="${rc.contextPath}/reward/awardinfo/opt-query/queryAwardInfoPage.do";
			}
			
			function changeObj(obj){
				var type = $(obj).val();
				if(type == 'AWARD'){
					$('#availableObject input[name="availableObject.code"][value="STUDENT"]').attr("checked",'checked');
					$('#availableObject input[name="availableObject.code"]').attr("disabled",true);
				}else{
					$('#availableObject input[name="availableObject.code"]').attr("disabled",false);
				}
			}
			
			$("document").ready(function(){
				//初始设置如果类型为评奖则适用对象设置为 学生 readonly
				var type = $('#type input[name="awardType.code"]:checked').val();
				if(type == 'AWARD'){
					$('#availableObject input[name="availableObject.code"]').attr("disabled",true);
				}else{
					$('#availableObject input[name="availableObject.code"]').attr("disabled",false);
				}
				
				var data = {name:function(){return $('#awardName').val();},id:function(){return $('#id').val();}};
				comp.validate.addRemote("nameCheck","${rc.contextPath}/reward/awardinfo/opt-query/checkAwardInfoName.do",data,"名称重复");
           		$("#awardEdit").compValidate({
					rules:{     
						'awardType.code': {required:true},
						awardName: {required:true,maxlength:32,nameCheck:true},
						'awardStatus.code': {required:true},
						'availableObject.code':{required:true}
					},
					messages:{
						'awardType.code': {required:'请选择类型'},
						awardName: {required:'请填写名称',maxlength:'不可超过32个字'},
						'awardStatus.code': {required:'请选择状态'},
						'availableObject.code':{required:'请选择适用对象'}
					}
				});
			});
			
		</script>
		<style>
			.modal{width:320px;margin-top:-180px;margin-left:-80px}
		</style>
    </head>
    <body>
		<div id="contentwrapper">
		    <div class="main_content">
		    	<div class="row-fluid">
					<div class="span12">
						<h3 class="heading">奖项名称编辑页面</h3>
					</div>
				</div>
		    	<div class="row-fluid">
		    		<form id="awardEdit" method="post" action="${rc.contextPath}/reward/awardinfo/opt-query/saveAwardInfo.do">
			    			<div class="formSep">
			    				<div class="row-fluid">
			    					<div class="span5">
			    				    	<label class="span3">名称<span class="f_req">*</span></label>
			    				    	<div class="span9">
			    				    		<input id="awardName" class="span10" value="${awardInfo.awardName!""?html}" name="awardName">
			    				    		<input id="id" value="${awardInfo.id!""}" name="id" type="hidden">
										</div>
			    				    </div>
			    					<div class="span4">
			    				    	<label class="span3">类型<span class="f_req">*</span></label>
			    				    	<div class="span9" id="type">
			    				    		<#list awardDicList as d>
												<#if awardInfo.awardType?? && awardInfo.awardType.code==d.code>
													<label class="radio inline">
		    					    	            	<input type="radio" name="awardType.code" value="${d.code}" checked="checked" onclick="changeObj(this)">${d.name?html}
	    					    	            	</label>
	    					    	            <#else>
		    					    	            <label class="radio inline">
		    					    	            	<input type="radio" name="awardType.code" value="${d.code}" onclick="changeObj(this)">${d.name?html}
	    					    	            	</label>
	    					    	            </#if>
											</#list>
										</div>
			    				    </div>
			    				</div>
			    			</div>
			    			<div class="formSep">
			    				<div class="row-fluid">
			    					<div class="span5">
			    				    	<label class ="span3">适用对象<span class="f_req">*</span></label>
			    				    	<div class="span9" id="availableObject">
											<#list infoObject as d>
												<#if awardInfo.availableObject?? && awardInfo.availableObject.code==d.code>
													<label class="radio inline">
		    					    	            	<input type="radio" name="availableObject.code" value="${d.code}" checked="checked">${d.name?html}
		    					    	            </label>	
	    					    	            <#else>
		    					    	            <label class="radio inline">
		    					    	            	<input type="radio" name="availableObject.code" value="${d.code}">${d.name?html}
	    					    	            	</label>
	    					    	            </#if>
											</#list>
										</div>
			    				    </div>
			    				
			    				
			    					<div class="span4">
			    				    	<label class="span3">状态<span class="f_req">*</span></label>
			    				    	<div class="span9">
												<#list statusDicList as d>
													<#if awardInfo.awardStatus?? && awardInfo.awardStatus.code==d.code>
														<label class="radio inline">
		    					    	            		<input type="radio" name="awardStatus.code" value="${d.code}" checked="checked">${d.name?html}
		    					    	            	</label>
		    					    	            <#else>
		    					    	            	<label class="radio inline">
		    					    	            		<input type="radio" name="awardStatus.code" value="${d.code}">${d.name?html}
		    					    	            	</label>
		    					    	            </#if>
												</#list>
										</div>
			    				    </div>
			    				</div>
			    			</div>
		    		</form>
		    		
		    		<br/>
		    		<div class="row-fluid">
						<div class="span5">
							<div class="span3">
			        		</div>
				    		<div class="span9">
				              	<button class="btn btn-info" onclick="saveAward()">保 存</button>
				              	<button class="btn" type="button" onclick="javascript:window.history.back(-1);">返 回</button>
			           		</div>
			           	</div>
			         </div>
			         
			         
			         
	    </div>
	    </div>
	    </div>       		
	           		
	</body>
</html>