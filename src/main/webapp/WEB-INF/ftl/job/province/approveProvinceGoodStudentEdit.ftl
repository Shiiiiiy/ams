<html>
 <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- jQuery UI theme-->
        <link rel="stylesheet" href="${rc.contextPath}/lib/jquery-ui/css/Aristo/Aristo.css" />
        <script src="${rc.contextPath}/lib/jquery-ui/jquery-ui-1.8.20.custom.min.js"></script>
        <!-- animated progressbars -->
        <script src="${rc.contextPath}/js/bdp_fileupload.progressbar.js"></script>
        <script src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script>
        <!-- ajax form-->
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
		<script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
		<!-- bootstrap-fileupload -->	
		<link rel="stylesheet" href="${rc.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.min.css" />
		<!-- multiselect -->
	    <link rel="stylesheet" href="${rc.contextPath}/lib/multiselect/css/multi-select.css" />
		<script src="${rc.contextPath}/lib/multiselect/js/jquery.multi-select.min.js"></script>	
    </head>
<body>
<div id="contentwrapper">
 <div class="main_content">
  <div class="row-fluid">
    <div class="row-fluid">
	   <div class="span12">
	      <h3 class="heading">
	      <#if flag?? && flag=="view">
	                              省优秀毕业生查看
	      <#else>
				省优秀毕业生审核
	      </#if>
		   </h3>
		  </div>
		 </div> 
		 <input name="errorText" id="errorText" type="hidden" value="${errorText!""}"/>
			 <div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>姓名<span class="f_req">*</span></label>
						</div>
						<div class="span9 input-append">
						<#if provinceGoodStudent?? && provinceGoodStudent.schoolGoodStudent?? && provinceGoodStudent.schoolGoodStudent.studentId??>
							<input id="studentName" name="schoolGoodStudent.studentId.name" readOnly="true" value="${(provinceGoodStudent.schoolGoodStudent.studentId.name!"")?html}"/>
							
							<#--><a style="cursor:pointer;margin-left:-4px;" onclick="selectStudentRadio()" title="选择" class="btn"><i class="icon-search"></i></a>-->
					    <#else>
					        <input id="studentName" name="schoolGoodStudent.studentId.name"  readOnly="true" />
					        <#--> <a style="cursor:pointer;margin-left:-4px;" onclick="selectStudentRadio()" title="选择" class="btn"><i class="icon-search"></i></a>-->
					    </#if>   
					        <input name="schoolGoodStudent.studentId.id" id="studentId" type="hidden" value="${(provinceGoodStudent.schoolGoodStudent.studentId.id)!''}"/> 
						</div>
					</div>
					
					<div class="span6">
						<div class="span3">
							<label>性别<span class="f_req"></span></label>
						</div>
						<div class="span9">
						 <#if genderList??>
							<#list genderList as a>
				    			<#if provinceGoodStudent.schoolGoodStudent?? && provinceGoodStudent.schoolGoodStudent.studentId?? && provinceGoodStudent.schoolGoodStudent.studentId.genderDic.id==a.id >
    				    				<label class="radio inline">
											<input type="radio" id="sexId" name="genderDic.name" disabled checked="checked" value="${a.id}" />${a.name?html}
										</label>
    				    			
				    			<#else>
				    				<label class="radio inline">
										<input type="radio" id="sexId" name="genderDic.name" disabled  value="${a.id}" />${a.name?html}
									</label>
				    		   </#if>
		    			  </#list>
		    			 </#if>
					</div>
				  </div>
			   </div>
			 </div>
			 
			 <div class="formSep"> 
			   <div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>名族<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="national" name="national" readOnly <#if provinceGoodStudent.schoolGoodStudent?? && provinceGoodStudent.schoolGoodStudent.studentId??> value="${((provinceGoodStudent.schoolGoodStudent.studentId.national)!"")?html}" </#if>/>
						</div>
					 </div>
						
					<div class="span6">
						<div class="span3">
							<label>出生年月<span class="f_req"></span></label>
						</div>
						<div class="span9">
						    <input id="birthday" name="birthday" readOnly <#if provinceGoodStudent.schoolGoodStudent?? && provinceGoodStudent.schoolGoodStudent.studentId??>  value="${(provinceGoodStudent.schoolGoodStudent.studentId.brithDate!"")?string("yyyy-MM-dd")}"</#if>/>
							
						</div>
					 </div>
				  </div>
			   </div>
			   
			  <div class="formSep"> 
			   <div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>政治面貌<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="politicalDic" name="politicalDic" readOnly <#if provinceGoodStudent.schoolGoodStudent?? && provinceGoodStudent.schoolGoodStudent.studentId?? && provinceGoodStudent.schoolGoodStudent.studentId.politicalDic??> value="${((provinceGoodStudent.schoolGoodStudent.studentId.politicalDic.name)!"")?html}" </#if>/>
						</div>
					 </div>
						
					<div class="span6">
						<div class="span3">
							<label>职务<span class="f_req"></span></label>
						</div>
						<div class="span9">
						    <input id="post" name="post" readOnly <#if provinceGoodStudent.schoolGoodStudent??>  value="${((provinceGoodStudent.schoolGoodStudent.post)!"")?html}"</#if>/>
							
						</div>
					 </div>
				  </div>
			   </div>
			   
			  <div class="formSep"> 
			   <div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>生源地<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="sourceLand" name="sourceLand" readOnly value="${((native.name)!"")?html}"/>
						</div>
					 </div>
						
					<div class="span6">
						<div class="span3">
							<label>家庭地址<span class="f_req"></span></label>
						</div>
						<div class="span9">
						    <input id="homeAddress" name="homeAddress" readOnly <#if provinceGoodStudent.schoolGoodStudent?? && provinceGoodStudent.schoolGoodStudent.studentId??>  value="${((provinceGoodStudent.schoolGoodStudent.studentId.homeAddress)!"")?html}"</#if>/>
							
						</div>
					 </div>
				  </div>
			   </div>
			 
			  <div class="formSep"> 
			   <div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>学院<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="college" name="college.name" readOnly <#if provinceGoodStudent.schoolGoodStudent?? && provinceGoodStudent.schoolGoodStudent.studentId?? && provinceGoodStudent.schoolGoodStudent.studentId.college??> value="${(provinceGoodStudent.schoolGoodStudent.studentId.college.name!"")?html}" </#if>/>
						</div>
					</div>
						
					<div class="span6">
						<div class="span3">
							<label>专业<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="majorName" name="major.majorName" readOnly <#if provinceGoodStudent.schoolGoodStudent?? && provinceGoodStudent.schoolGoodStudent.studentId?? && provinceGoodStudent.schoolGoodStudent.studentId.major??>  value="${(provinceGoodStudent.schoolGoodStudent.studentId.major.majorName!"")?html}"</#if>/>
						</div>
					 </div>
				  </div>
			   </div>
			   
			  <div class="formSep"> 
			   <div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>班级<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="className" name="classId.className" readOnly <#if provinceGoodStudent.schoolGoodStudent?? && provinceGoodStudent.schoolGoodStudent.studentId?? && provinceGoodStudent.schoolGoodStudent.studentId.classId??>  value="${(provinceGoodStudent.schoolGoodStudent.studentId.classId.className!"")?html}"</#if>/>
						</div>
					 </div>
						
					<div class="span6">
						<div class="span3">
							<label>联系电话<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input id="phone1" name="phone1" readOnly <#if provinceGoodStudent.schoolGoodStudent?? && provinceGoodStudent.schoolGoodStudent.studentId?? && provinceGoodStudent.schoolGoodStudent.studentId.phone1??> value="${((provinceGoodStudent.schoolGoodStudent.studentId.phone1)!"")?html}" </#if>/>
						</div>
					 </div>
				  </div>
			   </div>
			   
			   <div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>班级排名<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input name="classSort" readOnly value='${(provinceGoodStudent.schoolGoodStudent.classSort)!""}'/>
						</div>
					</div>
					<div class="span6">
						<div class="span3">
							<label>班级人数<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input name="classNumber" readOnly value='${(provinceGoodStudent.schoolGoodStudent.classNumber)!""}'/>
						</div>
					</div>
				</div>
			</div>
			<div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>计算机等级<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input name="computerLevel" readOnly value='${(provinceGoodStudent.schoolGoodStudent.computerLevel)!""}'/>
						</div>
					</div>
					<div class="span6">
						<div class="span3">
							<label>外语等级<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input name="englishLevel" readOnly value='${(provinceGoodStudent.schoolGoodStudent.englishLevel)!""}'/>
						</div>
					</div>
				</div>
			</div>
			<div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>入学以来学习总成绩平均分<span class="f_req"></span></label>
						</div>
						<div class="span9">
							<input name="avgScore" readOnly value=
								<#if provinceGoodStudent?? && provinceGoodStudent.schoolGoodStudent?? && provinceGoodStudent.schoolGoodStudent.avgScore??>
										${(provinceGoodStudent.schoolGoodStudent.avgScore)?string(".00")}
								<#else>
									0.00
								</#if>
							 >
						</div>
					</div>
				</div>
			</div>
			<div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>本人在校期间表现</label>
						</div>
						<div class="span9">
							<textarea id="performance" rows="5" cols="12" readlony="readlony" name="performance" readonly="readonly" style="width:770px; height:308px;">${(provinceGoodStudent.schoolGoodStudent.performance)!""}</textarea>
						</div>
					</div>
				</div>
			</div>
			<div class="formSep">
				<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<label>曾获荣誉</label>
						</div>
						<div class="span9">
							<textarea id="honor" rows="5" cols="12" name="honor" style="width:770px; height: 200px;" readonly="readonly">${(provinceGoodStudent.schoolGoodStudent.honor)!""}</textarea>
						</div>
					</div>
				</div>
			</div>
			   
			  <form  id="editsProvinceGoodStudentForm" class="form_validation_reg" action="${rc.contextPath}/job/approveProvinceGoodStudent/opt-save/saveApproveProvinceGoodStudent.do" method="post"><@token/>
		       <input id="id" type="hidden" name="id"  value="${(provinceGoodStudent.id)!""}">
		       <input id="flag" type="hidden" name="flag">
		       <div class="formSep">
				 <div class="row-fluid">
					 <div class="span6">
						<div class="span3">
							<label>审核意见<span class="f_req"></span></label>
						 </div>
					     <div class="span9">
							<#if provinceGoodStudent?? && provinceGoodStudent.approveReason??>
							    <textarea rows="5" cols="12" id="approveReason" <#if flag?? && flag=="view"> readOnly </#if> name="approveReason" style="width: 775px; height: 134px;">${(provinceGoodStudent.approveReason!"")}</textarea>
							<#else>
							    <textarea rows="5" cols="12" id="approveReason"  <#if flag?? && flag=="view"> readOnly </#if> name="approveReason" style="width: 775px; height: 134px;"></textarea>
						</#if>	
					</div>
				 </div>
			  </div>
		    </div> 
		   </form>
        <br/> 
	    <div class="row-fluid">
		 <div class="span6">
		  <div class="span3">
		   </div>
		      <div class="span9">
		      <#if flag?? && flag=="view">
		  	        <button class="btn" type="button" onclick="javascript:window.close();">关 闭</button>
		  	   <#else>
				    <button class="btn btn-info" type="button" id="save-course" onclick="onSub('1')">通 过</button>
				    <button class="btn btn-info" type="button" id="submit-button" onclick="onSub('0')">拒 绝</button>
				    <button type="button" class="btn btn-info" onclick="cleanForm()">清 空</button>
		  			<button class="btn" type="button" onclick="javascript:window.history.back(-1);">取 消</button>
		  	   </#if>     		
			  </div>
			</div>
			<input name="check_error" id="check_error" type="hidden" value="true"/>
		</div>
    </div>
  </div>
 </div>

<script>
	
	
	var attachFlag;
	$("document").ready(function(){
		//页面校验
		attachFlag = $(".form_validation_reg").compValidate({
			rules:{     
					approveReason: {minlength:0,maxlength:500}
				
				},
				messages:{
					approveReason:{maxlength:'审核意见不能超过500字'}
				}
		 });
	});
	
	
	  function onSub(status){
	     var check_error=$("#check_error").val();
	     if(check_error == "true"){
	        if(status=='1'){
	           fillDefaltMessage("通过");
	           comp.confirm("确认要通过吗？", function(result){
                if(!result)
                return; 
	           $("#flag").val("1");
	           $('#editsProvinceGoodStudentForm').submit();
	           });  
	        }else{
	            fillDefaltMessage("拒绝");
	            comp.confirm("确认要拒绝吗？", function(result){
                if(!result)
                return;
	            $("#flag").val("0");
	           $('#editsProvinceGoodStudentForm').submit();
	           });  
	        }
	     }
	 }
	
    /**
	  * 为审批意见默认赋值
	  */
	function fillDefaltMessage(defultMsg){
	    var curMsg = $.trim($("#approveReason").val());
		if(comp.isNull(curMsg)){
			$("#approveReason").val(defultMsg);
		}
	}	
	
	function cleanForm(){
		$("#approveReason").val("");
	}
				
	
</script>
</body>
</html>
