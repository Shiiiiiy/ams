<html>
 <head>
 <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
</head>
<body>
<div id="contentwrapper">
    <div class="main_content">
        <div class="row-fluid">
        	<div class="row-fluid">
		   		<div class="span12">
		      		<h3 class="heading">社团注销查看</h3>
			  	</div>
			 </div> 
		 	<#include "/association/apply/applyNoramlView.ftl"/>	
			 <div class="formSep">
					<div class="row-fluid">
						<div class="span12">
						<div class="span1"><label>注销原因</label></div>
						<div class="span8">
							<textarea cols="80" rows="6" readonly name="applyReason" class="span12">${(applyModel.applyReason!"")?html}</textarea>
	                    </div>
	            	 </div>
				</div>
			</div>
            <div class="formSep">
					<div class="row-fluid">
						<div class="span12">
						<div class="span1"><label>财务清算</label></div>
						<div class="span8">
							<textarea cols="80" rows="6" readonly name="financialComments" class="span12">${(applyModel.financialComments!"")?html}</textarea>
	                    </div>
	            	 </div> </div>
				</div>
			</form>

				<div class="formSep">
						<div class="row-fluid">
							 <div class="span12">
								<div class="span1"><label>附件</label> </div>
								<div class="span8" id="_finance_upload_div">
										 <#if fileList??>	
											<#list fileList as p>
												<div class="fileupload-info">
													<a href="${rc.contextPath}/sys/sysConfig/file.do?id=${(p.uploadFile.id)?html}"><strong>${(p.uploadFile.name)?html}&nbsp;(${(p.uploadFile.fileSize)?html})</strong></a>
													<input type="hidden" id="financeFileId" name="financeFileId" value="${(p.uploadFile.id)?html}"/>	
												</div>					
											</#list>
										 </#if> 
								</div>
					   		</div>
		            	</div>
		            </div>	
		        	<br/>
		        	<div class="row-fluid">
						<div class="span12">
						<div class="span1"></div>
			        	<div class="span9">
				            <input class="btn" type="button" onclick="javascript:window.close();" value="关  闭"/>
			        	</div>	
		        	</div>	
	 	</div>
	 </div> 
</div>


<#--查看 -->
<div class="modal hide fade" id="view_id">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3 id="view_title"></h3>
	</div>
	<div class="modal-body" id="view_body">
		
	</div>
	<div class="modal-footer">
		<a href="#" class="btn" data-dismiss="modal">关闭</a>
	</div>
</div>
<script>

  // 指导老师简介查看
  function viewAdvisorDetail(id){
  		$("#view_title").html("指导老师简介");
  		comp.showModal("view_id","680px","-250px 0 0 -300px");
		$("#view_body").load("${rc.contextPath}/association/apply/nsm/viewAdvisor.do?id="+id);
  }
  
  // 社员信息查看
 function viewMember(id){
 		$("#view_title").html("社团成员列表");
 		comp.showModal("view_id","800px","-250px 0 0 -350px");
		$("#view_body").load("${rc.contextPath}/association/apply/nsm/viewMember.do?id="+id);
 }
</script>

</body>
</html>