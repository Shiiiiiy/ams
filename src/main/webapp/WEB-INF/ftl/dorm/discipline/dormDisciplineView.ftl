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
	      <h3 class="heading">
	                         学生公寓行为查看
		   </h3>
		  </div>
		 </div> 
		 <input name="errorText" id="errorText" type="hidden" value="${errorText!""}"/>
		 <div class="formSep">
			<div class="row-fluid">
				<div class="span6">
					<div class="span3">
						<label>姓名<span class="f_req"></span></label>
					</div>
					<div class="span9">
						<input id="name" name="name" readOnly value="${((dormDiscipline.student.name)!"")?html}"/>
					</div>
				</div>
				<div class="span6">
					<div class="span3">
						<label>学号<span class="f_req"></span></label>
					</div>
					<div class="span9">
						<input id="stuNumber" name="stuNumber" readOnly value="${((dormDiscipline.student.stuNumber)!"")?html}"/>
					</div>
				</div>	
			  </div>
		   </div>
		   <div class="formSep">
			 <div class="row-fluid">
				<div class="span6">
					<div class="span3">
						<label>性别<span class="f_req"></span></label>
					</div>
					<div class="span9">
					   <input id="genderDic" name="genderDic" readOnly value="${((dormDiscipline.student.genderDic.name)!"")?html}"/>
				  </div>
				</div>
			  <div class="span6">	
				<div class="span3">
				  <label>手机<span class="f_req"></span></label>
				   </div>
					<div class="span9">
					   <input id="phone1" name="phone1" readOnly value="${((dormDiscipline.student.phone1)!"")?html}"/>
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
					   <input id="college" name="college" readOnly value="${((dormDiscipline.student.college.name)!"")?html}"/>
				  </div>
				</div>
			  <div class="span6">	
				<div class="span3">
				  <label>专业<span class="f_req"></span></label>
				   </div>
					<div class="span9">
					   <input id="majorName" name="majorName" readOnly value="${((dormDiscipline.student.major.majorName)!"")?html}"/>
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
					   <input id="className" name="className" readOnly value="${((dormDiscipline.student.classId.className)!"")?html}"/>
				  </div>
				</div>
			  </div>
		   </div>
		   <div class="formSep">
			 <div class="row-fluid">
				<div class="span6">
					<div class="span3">
						<label>公寓<span class="f_req"></span></label>
					</div>
					<div class="span9">
					   <input id="building" name="building" readOnly value="${((studentRoomModel.room.building.name)!"")?html}"/>
				  </div>
				</div>
			  <div class="span6">	
				<div class="span3">
				  <label>楼层<span class="f_req"></span></label>
				   </div>
					<div class="span9">
					   <input id="floorNum" name="floorNum" readOnly value="${((studentRoomModel.room.floorNum)!"")?html}"/>
					</div>
				 </div>
			  </div>
		   </div>
		   <div class="formSep">
			 <div class="row-fluid">
				<div class="span6">
					<div class="span3">
						<label>寝室号<span class="f_req"></span></label>
					</div>
					<div class="span9">
					   <input id="roomName" name="roomName" readOnly value="${((studentRoomModel.room.name)!"")?html}"/>
				  </div>
				</div>
			  <div class="span6">	
				<div class="span3">
				  <label>床位号<span class="f_req"></span></label>
				   </div>
					<div class="span9">
					   <input id="bedNumber" name="bedNumber" readOnly value="${((studentRoomModel.bedNumber)!"")?html}"/>
					</div>
				 </div>
			  </div>
		   </div>
		   <div class="formSep">
			 <div class="row-fluid">
				<div class="span6">
					<div class="span3">
						<label>行为类型<span class="f_req"></span></label>
					</div>
					<div class="span9">
					   <input id="disciplineLevel" name="disciplineLevel" readOnly value="${((dormDiscipline.disciplineLevel)!"")?html}"/>
				  </div>
				</div>
			  <div class="span6">	
				<div class="span3">
				  <label>行为名称<span class="f_req"></span></label>
				   </div>
					<div class="span9">
					   <input id="disciplineName" name="disciplineName" readOnly value="${((dormDiscipline.disciplineName)!"")?html}"/>
					</div>
				 </div>
			  </div>
		   </div>
		   <div class="formSep">
			 <div class="row-fluid">
				<div class="span6">
					<div class="span3">
						<label>行为时间<span class="f_req"></span></label>
					</div>
					<div class="span9">
					   <input id="disciplineTime" name="disciplineTime" readOnly value="${((dormDiscipline.disciplineTime)!"")?string("yyyy-MM-dd")}"/>
				  </div>
				</div>
			  </div>
		   </div>
		   <div class="formSep">
			<div class="row-fluid">
			  <div class="span6">
				<div class="span3">
					<label>处理结果<span class="f_req"></span></label>
				 </div>
				  <div class="span9">
					  <textarea rows="5" cols="12" id="result" readOnly name="result" class="span6" style="width: 775px; height: 134px;">${(dormDiscipline.zt!"")?html}</textarea>
				</div>
			  </div>
			 </div>
			</div>
		  <div class="formSep">
			<div class="row-fluid">
			  <div class="span6">
				<div class="span3">
					<label>备注<span class="f_req"></span></label>
				 </div>
				  <div class="span9">
					<#if grantInfoSet?? && grantInfoSet.grantIntroduce??>
					    <textarea rows="5" cols="12" id="grantIntroduce" readOnly name="grantIntroduce" class="span6" style="width: 775px; height: 134px;">${(grantInfoSet.grantIntroduce!"")?html}</textarea>
					<#else>
					    <textarea rows="5" cols="12" id="grantIntroduce" readOnly name="grantIntroduce" class="span6" style="width: 775px; height: 134px;"></textarea>
					</#if>	
				</div>
			  </div>
			 </div>
			</div> 
	    </div>
       <br/> 
	    <div class="row-fluid">
		 <div class="span6">
		  <div class="span3">
		   </div>
		      <div class="span9">
				  <button class="btn" type="button" onclick="javascript:window.history.back(-1);">返 回</button>
			  </div>
			</div>
			<input name="check_error" id="check_error" type="hidden" value="true"/>
		</div>
    </div>
  </div>
 </div>
 
<script>
    
	
</script>
</body>
</html>
