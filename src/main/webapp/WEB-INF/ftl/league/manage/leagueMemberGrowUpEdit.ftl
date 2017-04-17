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
        <script type="text/javascript" src="${rc.contextPath}/js/common/cascadecommon.js"></script>
    </head>
<body>
<div id="contentwrapper">
	<div class="main_content">
		<div class="row-fluid">
    		<div class="row-fluid">
	   			<div class="span12">
				      <h3 class="heading">
								团员成长记录修改
					  </h3>
		  		</div>
		 	</div> 
		 	<input name="errorText" id="errorText" type="hidden" value="${errorText!""}"/>
			<#if member?? && member.id??>
				<form  id="memberForm" class="form_validation_reg" action="${rc.contextPath}/league/leagueManage/opt-update/saveMember.do?classIdText=${classIdText}" method="post">
			</#if>
   			<div class="formSep"> 
		 		<input type="hidden" id="id" name="id" <#if member??> value="${(member.id!"")?html}"</#if>/>	
				<input type="hidden" id="stuInfo.id" name="stuInfo.id"  <#if member??> value="${(member.stuInfo.id!"")?html}"</#if>/>	
			 	<div class="formSep"> 
			 		<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<span class="formTitle">姓名</span>
							</div>
							<div class="span9">
								<input id="stuInfo.name"  readOnly <#if member?? && member.stuInfo??> value="${(member.stuInfo.name!"")?html}" </#if>/>
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
								<input id="brithDate"  readOnly <#if member?? && member.stuInfo?? && member.stuInfo.brithDate??> value="${(member.stuInfo.brithDate!"")?string("yyyy-MM-dd")}"</#if>/>
							</div>
						</div>
						<div class="span6">
							<div class="span3">
								<span class="formTitle">政治面貌</span>
							</div>
							<div class="span9">
								<select size="1" id="memberType" disabled  aria-controls="dt_gal" >
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
								<input  type="hidden" name="memberType.id"  <#if member?? && member.memberType??> value="${(member.memberType.id)!''}" </#if>/>
							</div>
						</div>	
				  	</div>
			   </div>
			   <div class="formSep"> 
			   		<div class="row-fluid">
						<div class="span6">
							<div class="span3">
								<span class="formTitle">入团时间</span>
							</div>
							<div class="span5">
								<input type="text" name="joinTime" readOnly  <#if member?? && member.joinTime??>   value="${(member.joinTime!"")?date}"</#if>/>
							</div>
						</div>
						<#if member?? && member.partyTime??>
							<div class="span6">
								<div class="span3">
									<span class="formTitle">入党时间</span>
								</div>
								<div class="span5">
									<input type="text" name="partyTime" readOnly     value="${(member.partyTime!"")?date}"/>
									
								</div>
							</div>
						</#if>
	  				</div>
   			  </div>
   			  <div class="formSep"> 
			 	  <div class="row-fluid">
			   		  <div class="span6">
						    <div class="span3">
								<span class="formTitle">是否团支书</span>
							</div>
							<div class="span9">
								<#if isNoList??>
									<#list isNoList as a>
										<#if member ?? && member.isSecretary??  && member.isSecretary.id==a.id >
											<label class="radio inline"><input type="radio" name="isSecretary.id" value="${a.id}" disabled checked />${a.name?html}</label>
										<#else>
											<label class="radio inline"><input type="radio" name="isSecretary.id" value="${a.id}" disabled />${a.name?html}</label>
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
									<span class="formTitle">参加团干培训<span class="f_req">*</span></span>
								</div>
								<div class="span9">
									<#if isNoList??>
										<#list isNoList as a>
											<#if member ?? && member.isTrianing??  && member.isTrianing.id==a.id >
												<label class="radio inline"><input type="radio"   name="isTrianing.id" value="${a.id}" checked onclick="changeTrianing()"/>${a.name?html}</label>
											<#else>
												<label class="radio inline"><input type="radio"  name="isTrianing.id" value="${a.id}"  onclick="changeTrianing()"/>${a.name?html}</label>
											
											</#if>
										</#list>
									</#if>
								</div>
						</div>          
				   		<div class="span6" id="hideTrianingTime">
							<div class="span3">
								<span class="formTitle">团干培训时间<span class="f_req">*</span></span>
							</div>
							<div class="span5">
									<input type="text" id="trianingTime" name="trianingTime"  <#if member?? && member.trianingTime??>value="${(member.trianingTime)?date}"</#if> style="cursor:pointer;width:210px;" 
										class="Wdate"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',skin:'whyGreen',el:$dp.$('trianingTime')})" style="cursor:pointer"  />
							</div>
						</div>
			   	</div>
   			</div>
   			<div class="formSep"> 
			   <div class="row-fluid">
			   		  <div class="span6">
							<div class="span3">
								<span class="formTitle">递交入党申请<span class="f_req">*</span></span>
							</div>
							<div class="span9">
								<#if isNoList??>
									<#list isNoList as a>
										<#if member ?? && member.isPartyApply??  && member.isPartyApply.id==a.id >
											<label class="radio inline"><input type="radio"   name="isPartyApply.id" value="${a.id}" checked onclick="changePartyApply()"/>${a.name?html}</label>
										<#else>
											<label class="radio inline"><input type="radio"  name="isPartyApply.id" value="${a.id}"  onclick="changePartyApply()"/>${a.name?html}</label>
										
										</#if>
									</#list>
								</#if>
							</div>
					 </div>          
			   		<div class="span6" id="hidePartyApplyTime">
						<div class="span3">
							<span class="formTitle">入党申请时间<span class="f_req">*</span></span>
						</div>
						<div class="span5">
								<input type="text" id="partyApplyTime" name="partyApplyTime"  <#if member?? && member.partyApplyTime??>value="${(member.partyApplyTime)?date}"</#if> style="cursor:pointer;width:210px;" 
									class="Wdate"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',skin:'whyGreen',el:$dp.$('partyApplyTime')})" style="cursor:pointer"  />
						</div>
					</div>
			   	</div>
   			</div>
   			<div class="formSep"> 
			   <div class="row-fluid">
			   		  <div class="span6">
							<div class="span3">
								<span class="formTitle">是否被推优<span class="f_req">*</span></span>
							</div>
							<div class="span9">
								<#if isNoList??>
									<#list isNoList as a>
										<#if member ?? && member.isRecommoned??  && member.isRecommoned.id==a.id >
											<label class="radio inline"><input type="radio"   name="isRecommoned.id" value="${a.id}" checked onclick="changeRecommoned()"/>${a.name?html}</label>
										<#else>
											<label class="radio inline"><input type="radio"  name="isRecommoned.id" value="${a.id}"  onclick="changeRecommoned()"/>${a.name?html}</label>
										
										</#if>
									</#list>
								</#if>
							</div>
					 </div>          
			   		<div class="span6" id="hideRecommonedTime">
						<div class="span3">
							<span class="formTitle">推优时间<span class="f_req">*</span></span>
						</div>
						<div class="span5">
								<input type="text" id="recommonedTime" name="recommonedTime"  <#if member?? && member.recommonedTime??>value="${(member.recommonedTime)?date}"</#if> style="cursor:pointer;width:210px;" 
									class="Wdate"  onclick="WdatePicker({dateFmt:'yyyy-MM-dd',skin:'whyGreen',el:$dp.$('recommonedTime')})" style="cursor:pointer"  />
						</div>
					</div>
			   	</div>
   			</div>
   			
			 <div class="formSep"> 
			 	<div class="row-fluid">
			   		<div class="span6">
						<div class="span3">
							<span class="formTitle">团内外职务</span>
						</div>
						<div class="span9">
							<input id="leaguePosition"  name="leaguePosition"  <#if member?? && member.leaguePosition??> value="${(member.leaguePosition!"")?html}" </#if>/>
						</div>
					</div>
			   	</div>
			</div>
		</div>
	 </form>
	    <br/>
		<div class="row-fluid">
			<div class="span12">
			   	<div class="span6">
				  	  <div class="span3">
				   	  </div>
				      <div class="span9">
					    <button class="btn btn-info" type="button" id="save-course" onclick="onSub()">保 存</button>
			  			<button class="btn" type="button" onclick="javascript:window.location.href='${rc.contextPath}/league/leagueManage/opt-query/pageQueryLeagueMember.do?classIdText=${classIdText}'">取 消</button>
					  </div>
			   	</div>
		   	</div>
  		</div>
 	  </div>
   </div>
</div>

<script>
	
	$("document").ready(function(){
		 var trianingVal=$('input:radio[name="isTrianing.id"]:checked').val();
		 var partyApplyVal=$('input:radio[name="isPartyApply.id"]:checked').val();
		 var recommonedVal=$('input:radio[name="isRecommoned.id"]:checked').val();
	     
	     if(trianingVal=="4028900f40cd477c0140cd4afd8d0001"){
	     	$("#hideTrianingTime").show();
	     }else{
	     	$("#hideTrianingTime").hide();
	     }
	     if(partyApplyVal=="4028900f40cd477c0140cd4afd8d0001"){
	     	$("#hidePartyApplyTime").show();
	     }else{
	     	$("#hidePartyApplyTime").hide();
	     }
	     if(recommonedVal =="4028900f40cd477c0140cd4afd8d0001"){
	     	$("#hideRecommonedTime").show();
	     }else{
	     	$("#hideRecommonedTime").hide();
	     }
		//页面校验
		 $("#memberForm").compValidate({
			rules:{   
					'isTrianing.id':{required:true},
					'isPartyApply.id':{required:true},
					'isRecommoned.id':{required:true},
					'leaguePosition':{maxlength:32},
					'trianingTime':{required:true},
					'partyApplyTime':{required:true},
					'recommonedTime':{required:true}
				},
			messages:{
					'isTrianing.id':{required:'参加团干培训不能为空'},
					'isPartyApply.id':{required:'递交入党申请不能为空'},
					'isRecommoned.id':{required:'是否被推优不能为空'},
					'leaguePosition':{maxlength:'团内外职务最大长度为32'},
					'trianingTime':{required:'团干培训时间不能为空'},
					'partyApplyTime':{required:'入党申请时间不能为空'},
					'recommonedTime':{required:'推优时间不能为空'}
					
			}		
		 });
		 
     });
    function changeTrianing(){
    	var trianingVal=$('input:radio[name="isTrianing.id"]:checked').val();
    	if(trianingVal=="4028900f40cd477c0140cd4afd8d0001"){
	     	$("#hideTrianingTime").show();
	    }else{
	     	$("#hideTrianingTime").hide();
	     	$("#trianingTime").val("");
	    }
    }
    function changePartyApply(){
		 
		 var partyApplyVal=$('input:radio[name="isPartyApply.id"]:checked').val();
	     
		 if(partyApplyVal=="4028900f40cd477c0140cd4afd8d0001"){
	     	$("#hidePartyApplyTime").show();
	     }else{
	     	$("#hidePartyApplyTime").hide();
	     	$("#partyApplyTime").val("");
	     }
	     
	}
 	function changeRecommoned(){
 		 var recommonedVal=$('input:radio[name="isRecommoned.id"]:checked').val();
 		 if(recommonedVal=="4028900f40cd477c0140cd4afd8d0001"){
	     	$("#hideRecommonedTime").show();
	     }else{
	     	$("#hideRecommonedTime").hide();
	     	$("#recommonedTime").val("");
	     }
 	}
 	
	//保存方法 
	 function onSub(){
 		if($("#memberForm").valid()){
 			var isPartyApply=$(" input[name='isPartyApply.id']:checked ").val();
 			$('#memberForm').submit();
 		}
     }
 	
  

	
	
 </script>
</body>
</html>
					   