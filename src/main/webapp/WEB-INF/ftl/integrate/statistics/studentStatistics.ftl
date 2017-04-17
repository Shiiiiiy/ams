<html>
<body>
	<div id="contentwrapper">
    <div class="main_content">  
    	<div class="tabbable ">
    	
	    	<ul class="nav nav-tabs">
				<li class="active"><a href="#school_tab" id="school_change_tab" data-toggle="tab">按学校统计</a></li>
				<li><a href="#college_tab" id="college_change_tab" data-toggle="tab">按学院统计</a></li>
			</ul>
			<div class="tab-content">
			
	       		<div class="tab-pane active" id="school_tab">
	        		<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
						<thead>
							<tr>
							    <th width="10%">年级</th>
								<th width="15%">学生总数</th>
								<th width="10%">男生</th>
								<th width="10%">男生占比</th>
								<th width="10%">女生</th>
								<th width="10%">女生占比</th>
							</tr>
						</thead>
						<tbody>
						<#if schoolCountList??>	
							<#list schoolCountList as p>
							<tr>		
								<td class="autocut">${p.grade!""?html}</td>
								<td class="autocut">${p.totalCount!""?html}</td>
								<td class="autocut">${p.boy!""?html}</td>
								<td class="autocut">${((p.boy*100)/p.totalCount)?string("#.##")}%</td>
								<td class="autocut">${p.girl!""?html}</td>
								<td class="autocut">${((p.girl*100)/p.totalCount)?string("#.##")}%</td>
							</tr>
							</#list>
						 </#if> 
						</tbody>
					</table>
	        	</div>
	        	
	        	<div class="tab-pane" id="college_tab">
        		 <div class="row-fluid">	
	        	 <div class="span2">年级 &nbsp;&nbsp;&nbsp;
	        		<select size="1" id="grade" name="grade" aria-controls="dt_gal" class="span8">
						<option value="">请选择...</option>
						<#if gradeList??>
					      	<#list gradeList as g>
								<option  value="${g}">${g}</option>	
							</#list>
						</#if>
					</select>
				</div>	 
				  <div class="span3">
					<input type="button" value="查  询" class="btn btn-info" onclick="queryByYear();"/>
				   </div>
				</div>
				      <div id="student_body">
	        		  <#include "studentCollegeCountBody.ftl"/> 
	        		  </div>
	        	</div>
	        	
    		</div>
        </div>
    </div>
</div> 
    
 <script type="text/javascript">
 function queryByYear()
 {
 	var grade = $("#grade").val();
 	$("#student_body").load("${rc.contextPath}/student/manage/nsm/studentCollegeCountByGrade.do",{"grade":grade},function(){});
 	//alert(grade);
 }
 </script>
   
</body>
<html>