<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- ajax form-->
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
		<script src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
		<script>
			//返回评优类型列表
			function closeWindow(){   
				window.close();
			}
			
			$("document").ready(function(){
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
						<h3 class="heading">国家奖学金查看页面</h3>
					</div>
				</div>
		    	<div class="row-fluid">
		    		<form id="burseView" method="post" action="${rc.contextPath}/reward/countryburse/opt-query/savePunish.do">
		    			<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span4">
				    					<span>姓名</span>
		    						</div>
		    						<div class="span4">
				    					<input id="stuId.name" name="stuId.name" value="${burse.stuId.name!""}" readonly>
		    						</div>
		    					</div>
		    					<div class="span6">
		    						<div class="span4">
				    					<span>学号</span>
		    						</div>
		    						<div class="span4">
										<input id="stuId.id" name="stuId.id" value="${burse.stuId.id!""}" readonly>
		    						</div>
	    				    	</div>
		    				</div>
	    				</div>
	    				
	    				<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    				    	<div class="span4">
				    					<span>学年</span>
		    						</div>
		    						<div class="span4">
			    				    	<input id="schoolYear.code" name="schoolYear.code" value="${burse.schoolYear.name}" readonly>
		    						</div>
		    				    </div>
		    					<div class="span6">
		    						<div class="span4">
				    					<span>学院</span>
		    						</div>
		    						<div class="span4">
				    					<input id="stuId.college.name" name="stuId.college.name" value="${burse.stuId.college.name!""}" readonly>
		    						</div>
		    					</div>
		    				</div>
		    			</div>
	    				
	    				
		    				<div class="formSep">
			    				<div class="row-fluid">
			    					<div class="span6">
			    						<div class="span4">
					    					<span>专业</span>
			    						</div>
			    						<div class="span4">
											<input id="stuId.major.majorName" name="stuId.major.majorName" value="${burse.stuId.major.majorName!""}" readonly>
			    						</div>
		    				    	</div>
		    				    	<div class="span6">
		    				    		<div class="span4">
					    					<span>班级</span>
			    						</div>
			    						<div class="span4">
											<input id="stuId.classId.className" name="stuId.classId.className" value="${burse.stuId.classId.className!""}" readonly>
			    						</div>
		    				    	</div>
			    				</div>
		    				</div>
	    				
	    				
	    				<div class="formSep">
		    				<div class="row-fluid">
    							<div class="span6">
	    				    		<div class="span4">
				    					<span>身份证号</span>
		    						</div>
		    						<div class="span4">
										<input id="stuId.certificateCode" name="stuId.certificateCode" value="${burse.stuId.certificateCode!""}" readonly>
		    						</div>
    				    		</div>
		    					<div class="span6">
		    						<div class="span4">
				    					<span>开户行</span>
		    						</div>
		    						<div class="span4">
				    					<input id="stuId.bank" name="stuId.bank" value="${burse.stuId.bank!""}" readonly>
		    						</div>
		    					</div>
		    				</div>
	    				</div>
	    				
	    				<div class="formSep">
		    				<div class="row-fluid">
		    					<div class="span6">
		    						<div class="span4">
				    					<span>银行卡号</span>
		    						</div>
		    						<div class="span4">
				    					<input id="stuId.bankCode" name="stuId.bankCode" value="${burse.stuId.bankCode!""}" readonly>
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
										<textarea id="comments" name="comments" col="12" rows="3" readonly style="width: 770px; height: 111px;">${burse.comments!""}</textarea>
									</div>
	    				    	</div>
		    				</div>
		    			</div>
		    		</form>	
		    		
	        		</br>
		    		<div class="row-fluid">
						<div class="span6">
							<div class="span4">
			        		</div>
				    		<div class="span4">
				              	<button class="btn btn-info" onclick="closeWindow()">关 闭</button>
			           		</div>
			           	</div>
			         </div>
			         
			         
	    </div>
	    </div>
	    </div>       		
	           		
	</body>
</html>