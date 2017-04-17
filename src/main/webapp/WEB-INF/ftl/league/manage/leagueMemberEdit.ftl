<html>
 <head>
       <link rel="stylesheet" href="${rc.contextPath}/lib/jquery-ui/css/Aristo/Aristo.css" />
       
        <script src="${rc.contextPath}/lib/jquery-ui/jquery-ui-1.8.20.custom.min.js"></script>
        <!-- animated progressbars -->
        <script src="${rc.contextPath}/js/bdp_fileupload.progressbar.js"></script>
        <script src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script>
        <!-- ajax form-->
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
		<script src="${rc.contextPath}/js/apw/apw_check.js"></script>
		<!-- bootstrap-fileupload -->	
		<link rel="stylesheet" href="${rc.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.min.css" />
		<!--date-->
	<script language="javascript" type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>	
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
			      		<#if member?? && member.id??>
							团员修改
						<#else>
							团员新增
						</#if>
				   </h3>
		  		</div>
		 	</div> 
				
		<#if member?? && member.id??>
			<form  id="memberForm" class="form_validation_reg" action="${rc.contextPath}/league/leagueManage/opt-update/saveMember.do?classIdText=${classIdText}" method="post">
		<#else>
			<form  id="memberForm" class="form_validation_reg" action="${rc.contextPath}/league/leagueManage/opt-add/saveMember.do?classIdText=${classIdText}" method="post">
			
		</#if>
   			<div class="formSep"> 
				<input type="hidden" id="errorText" value="false"/>	
		 		<input type="hidden" id="id" name="id" <#if member??> value="${(member.id!"")?html}" </#if>/>	
				<input type="hidden" id="stuId" name="stuInfo.id" <#if member??> value="${(member.stuInfo.id!"")?html}"  </#if>/>	
					
			 	 <div class="formSep"> 
			 		<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<span class="formTitle">姓名</span>
							</div>
							<div class="span9">
								<input id="stuName"  name="stuName" readOnly <#if member?? && member.stuInfo??> value="${(member.stuInfo.name!"")?html}" </#if>/>
								<#if !(member?? && member.id??)>
									<a id="course-lecture-select"  style="margin-left: -4px;margin-top: -10px;" href="javascript:void(0);" onclick="selectStudentByClassRadio('${classIdText}');" class="btn"><i class="icon-search"></i></a>
								</#if>
							</div>
						</div>
					  	<div class="span6">
							<div class="span3">
								<span class="formTitle">学号</span>
							</div>
							<div class="span9">
								<input id="stuNumber"  readOnly value="${((member.stuInfo.stuNumber)!"")?html}"/>
							</div>
					 	</div>                
				   </div>
			    </div>
			   <div class="formSep"> 
				<div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<span class="formTitle">性别</span>
						</div>
						<div class="span9">
						 <#if genderList??>
							<#list genderList as a>
				    			<#if member ?? && member.stuInfo?? && member.stuInfo.genderDic?? && member.stuInfo.genderDic.id==a.id >
										<input  id="sexId"  readOnly value="${a.name}" />
				    		   </#if>
		    			    </#list>
		    			 <#else>
								<input  id="sexId"  readOnly value="" />
		    			 </#if>
						</div>
					</div>
					<div class="span6">
						<div class="span3">
							<span class="formTitle">籍贯</span>
						</div>
						<div class="span9">
							<input id="native" readOnly <#if member?? && member.stuInfo?? && member.stuInfo.nativeDic??>  value="${((member.stuInfo.nativeDic.name)!"")?html}"</#if>/>
						</div>
					</div>
				  </div>
			   </div>
			 <div class="formSep"> 
			   <div class="row-fluid">
					<div class="span6">
						<div class="span3">
							<span class="formTitle">出生年月</span>
						</div>
						<div class="span9">
							<input id="birthDate"  readOnly <#if member?? && member.stuInfo?? && member.stuInfo.brithDate??> value="${(member.stuInfo.brithDate!"")?string("yyyy-MM-dd")}"</#if>/>
						</div>
					</div>
					<div class="span6">
						<div class="span3">
							<span class="formTitle">政治面貌 <span class="f_req">*</span></span>
						</div>
						<div class="span9">
							<select size="1" id="memberType" name="memberType.id" aria-controls="dt_gal" onchange="policalChange()">
								<option value="" >请选择</option>
								<#if politicalList??>
									<#list politicalList as c>
										<#if member?? && member.memberType?? && member.memberType.id??&& c.id==member.memberType.id>
											<option value="${c.id}" selected="selected">${c.name?html}</option>
										<#elseif c.code!="2">
											<option value="${c.id}">${c.name?html}</option>
										</#if>
									</#list>
								</#if>
							</select>
							
						</div>
					</div>	
					
				  </div>
			   </div>
			   <div class="formSep"> 
			     	<div class="row-fluid">
						<div class="span6" id="hideJoinTime">
							<div class="span3">
								<span class="formTitle">入团时间<span class="f_req">*</span></span>
							</div>
							<div class="span9">
									<input type="text" id="joinTime" name="joinTime"  <#if member?? && member.joinTime??>value="${(member.joinTime)?date}"</#if> style="cursor:pointer;width:210px;" 
										class="Wdate"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',skin:'whyGreen',el:$dp.$('joinTime')})" style="cursor:pointer"  />
							</div>
						</div>
						<div class="span6" id="hidePartyTime">
							<div class="span3">
								<span class="formTitle">入党时间<span class="f_req">*</span></span>
							</div>
							<div class="span9">
									<input type="text" id="partyTime" name="partyTime"  <#if member?? && member.partyTime??>value="${(member.partyTime)?date}"</#if> style="cursor:pointer;width:210px;" 
										class="Wdate"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',skin:'whyGreen',el:$dp.$('partyTime')})" style="cursor:pointer"  />
							</div>
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
		             <!--判断是保存还是提交，保存=0   提交=1 -->
				    <button class="btn btn-info" type="button" id="save-course" onclick="onSub()">保 存</button>
		  			<button class="btn" type="button" onclick="javascript:window.history.back(-1);">取 消</button>
			  </div>
		   </div>
		</div>

 	 </div>
  </div>
 </div>
<#-- 学生按照班级选择单选组件的引入-->
<#include "/comp/student/queryStudentByClassRadioModal.ftl"> 
 <#-- 脚本开始 -->

<script>
	
	//按照班级过滤的选择单选
	function selectStudentByClassRadio(classId)
	{
		_queryStudentRadioByClass(classId,"");
	}
	function setClassStudentSelectValue(student)
	{
		$("#stuName").val(student.name);
		$("#stuNumber").val(student.id);
		$("#stuId").val(student.id);
		
		var studentId=student.id;
		$("#sexId").val(student.genderName);
		$("#native").val(student.nativeName);
		$("#birthDate").val(student.birthDay);
		var id=$("#id").val();
		if(id==null || id==undefined || id==""){
			$.ajax({
				url: "${rc.contextPath}/league/leagueManage/opt-query/isMember.do",
				async:false,
				cache:false,
				type:"POST",
				data:{stuNumber:studentId},
	    		success: function(str){
	    		
					if(str=="is"){
						$("#errorText").val("true");
						comp.message("选择的学生在共青团业务中已经存在了，请重新选择","error");
		   	 		}else{
		   	 			$("#errorText").val("false");
		   	 		}
				}
	 		});
		}
		
			
		//window.location.href="${rc.contextPath}/league/leagueManage/opt-add/editMember.do?classIdText=${unit.classId.id}";
	}

	$("document").ready(function(){
		 var val=$("#memberType option:selected").val();
	     if(val=="2c9d94814a75c086014a7614c0f30045"){
	     	$("#hidePartyTime").show();
	     	
	     }else if(val=="2c9d94814a75c086014a761523fd0047"||val=="2c9d94814a75c086014a7614f4430046"){
	     	$("#hidePartyTime").hide();
	     	$("#hideJoinTime").show();
	     }
		//页面校验
		 $(".form_validation_reg").compValidate({
			rules:{   
					'stuName':{required:true},
					'memberType.id':{required:true},
					'joinTime':{required:true},
					'partyTime':{required:true}
					
				},
			messages:{
					'stuName':{required:'姓名不能为空'},
					'memberType.id':{required:'政治面貌不能为空'},
					'joinTime':{required:'入团时间不能为空'},
					'partyTime':{required:'入党时间不能为空'}
			}		
		 });
     });
 

	function policalChange(){
		 var val=$("#memberType option:selected").val();
	     if(val=="2c9d94814a75c086014a7614c0f30045"){
	     	$("#hidePartyTime").show();
	     }else if(val=="2c9d94814a75c086014a761523fd0047"||val=="2c9d94814a75c086014a7614f4430046"){
	     	$("#hidePartyTime").hide();
	     	$("#hideJoinTime").show();
	     	$("#partyTime").val("");
	     }
		
	}

	//保存方法 
	 function onSub(){
	 	var error=$("#errorText").val()
	 	if(error=="false"){
	 		if($("#memberForm").valid()){
		  		$('#memberForm').submit();
 			}
	 	}else{
	 		comp.message("选择的学生已经是团员了，请重新选择","error");
	 	}
 		
     }
 	

 </script>
</body>
</html>
