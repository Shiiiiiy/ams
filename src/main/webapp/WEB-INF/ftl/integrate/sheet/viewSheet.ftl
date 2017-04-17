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
		<!-- My97DatePicker -->
    	<link rel="stylesheet" href="${rc.contextPath}/lib/My97DatePicker/skin/WdatePicker.css" />
		<script type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
	 <script>
		function cancel(){
		 window.location.href="${rc.contextPath}/integrate/sheet/opt-query/sheetList.do";
		}
	 </script>
    </head>
<body>
<div id="contentwrapper">
   <div class="main_content">
    <div class="row-fluid">
    	<div class="row-fluid">
	   	   <div class="span12">
	    	   <h3 class="heading">
	    	 	        报表信息查看
	    	   </h3>
	    	</div>
    	</div>
		<input name="checkValue" id="checkValue" type="hidden" value="true"/>
		  <input id="currentUserId" type="hidden" name="currentUserId"  value="${(currentUserId)!""}">
			<input id="id" type="hidden" name="id"  value="${(sheet.id)!""}">
			  <div class="formSep">
				<div class="row-fluid">
				  <div class="span6">	
			        <div class="span2">
						<label>标题<span class="f_req"></span></label>
					 </div>
					<div class="span9">
						<input id="title" readOnly name="title" value="${(sheet.title)!''}"/>
					</div>
				  </div>
				   
				<div class="span6">
					<div class="span2">
						<label>上报学年<span class="f_req"></span></label>
					</div>
					<div class="span9">
					 <select disabled size="1" id="year" name="year.id" aria-controls="dt_gal">
						  <option value="" />请选择..</option>
							<#if yearList ??>
								<#list yearList as d>
									<#if sheet?? && sheet.year ?? && sheet.year.id==d.id >
										<option  value="${d.id}" selected="selected" />${d.name?html}</option>
									<#else>
										<option value="${d.id}" />${d.name?html}</option>
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
				<div class="span6">
					<div class="span2">
					  <label>上报人<span class="f_req"></span></label>
					 </div>
					<div class="span9 input-append">
						<#if sheet?? && sheet.creator??>
							<input id="creatorName" name="creator.name" readOnly="true" value="${(sheet.creator.name!"")?html}"/>
					    <#else>
					        <input id="creatorName" name="creator.name"  readOnly="true" />
					    </#if>   
					        <input name="creator.id" id="creatorId" type="hidden" value="${(sheet.creator.id)!''}"/> 
					</div>
				</div>
				<div class="span6">
				  <div class="span2">
					<label>上报日期<span class="f_req"></span></label>
				   </div>
				   <div class="span9">
					   <input id="uploadDate" name="uploadDate" disabled="disabled" style="cursor:pointer" onclick="WdatePicker({skin:'whyGreen'});" <#if sheet?? && sheet.uploadDate??> value='${((sheet.uploadDate)!"")?string('yyyy-MM-dd')}'</#if>/>
				   </div>
				</div>
			  </div>
			</div>
		<div class="formSep">
			<div class="row-fluid">					
			  <div class="span12">
			    <div class="span1">
					 <label>材料<span class="f_req"></span></label>
				    </div>
					<div class="span8">
					<form  id="fileUploadForm"  action="" method="post"  enctype="multipart/form-data">
					<!--					    	 
						 <input type="hidden" name="allowedExt" value="jpg,png,img,gif,txt,iso,zip,rar"/>
						 <input type="hidden" name="maxSize" value="2097152000"/> 
						 <input type="hidden" name="isTempFile" value="false"/>
						 	-->						
						 <#if uploadFileRefList??>	
							<#list uploadFileRefList as p>
								<div class="fileupload-info">
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
				<div class="span2"></div>
				<div class="span9">
			  		<button class="btn" type="button" onclick="cancel();">返 回</button>
		  		</div>
	  		</div>
		</div>
	</div>
  </div>
</div>

</body>
</html>
