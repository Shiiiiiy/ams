<html>
 <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" /> 
    <script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
    <!-- animated progressbars -->
    <script src="${rc.contextPath}/js/bdp_fileupload.progressbar.js"></script>
    <script src="${rc.contextPath}/lib/validation/jquery.validate.min.js"></script> 
    <script src="${rc.contextPath}/js/apw/apw_check.js"></script> 
    <script src="${rc.contextPath}/js/common/common_approve.js"></script>
    <script>
    	//审核历史
		//function showApproveCommnets(){
			//参数为objectId
			//var id=$("#id").val();
		   // approve.showApproveComments(id);
		//}
    </script>
 </head>
<body>
<div id="contentwrapper">
    <div class="main_content">   
        <div class="row-fluid">	
         <div class="row-fluid">	
	      <div class="span12">
	       <h3 class="heading">
			学生更新信息审核
		   </h3>
		  </div>
		 </div>
				<input id="id" type="hidden" name="id"  value="${(studentInfo.id)!""}">
				<div class="span12">	
				    <#include "/integrate/student/studentEdit/disStudentInfo.ftl">
				</div>
				<div class="span12">
				    <div class="span9">
			              <div class="span2">
			              </div>
                          <button class="btn btn-info" type="button" onclick="approve.showHis('${(studentInfo.id)!""}');">审核历史</button>
		                  <button class="btn" type="button" onclick="window.close();">关 闭</button>		            
		            </div>	
		        </div>	
			</div>
        </div>
    </div>
        <#-- 审核历史查看 -->
        <#include "/apw/instance/approveHistory.ftl">	 
</body>
</html>
