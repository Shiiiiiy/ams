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
	                         学生公寓评比查看
		   </h3>
		  </div>
		 </div> 
		 <input name="errorText" id="errorText" type="hidden" value="${errorText!""}"/>
		 <div class="formSep">
			<div class="row-fluid">
				<div class="span6">
					<div class="span3">
						<label>公寓<span class="f_req"></span></label>
					</div>
					<div class="span9">
						<input id="name" name="name" readOnly value="${((dormRating.room.building.name)!"")?html}"/>
					</div>
				</div>
				<div class="span6">
					<div class="span3">
						<label>楼层<span class="f_req"></span></label>
					</div>
					<div class="span9">
						<input id="floorNum" name="floorNum" readOnly value="${((dormRating.room.floorNum)!"")?html}"/>
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
					   <input id="room" name="room" readOnly value="${((dormRating.room.name)!"")?html}"/>
				  </div>
				</div>
			  <div class="span6">	
				<div class="span3">
				  <label>批次名称<span class="f_req"></span></label>
				   </div>
					<div class="span9">
					   <input id="batchName" name="batchName" readOnly value="${((dormRating.batchName)!"")?html}"/>
					</div>
				 </div>
			  </div>
		   </div>
		   <div class="formSep">
			 <div class="row-fluid">
				<div class="span6">
					<div class="span3">
						<label>扣分项目<span class="f_req"></span></label>
					</div>
					<div class="span9">
					   <input id="projectName" name="projectName" readOnly value="${((dormRating.projectName)!"")?html}"/>
				  </div>
				</div>
			  <div class="span6">	
				<div class="span3">
				  <label>扣分值<span class="f_req"></span></label>
				   </div>
					<div class="span9">
					   <input id="loseScore" name="loseScore" readOnly value="${((dormRating.loseScore)!"")?html}"/>
					</div>
				 </div>
			  </div>
		   </div>
		   <div class="formSep">
			 <div class="row-fluid">
				<div class="span6">
					<div class="span3">
						<label>检查人<span class="f_req"></span></label>
					</div>
					<div class="span9">
					   <input id="checkUser" name="checkUser" readOnly value="${((dormRating.checkUser)!"")?html}"/>
				  </div>
				</div>
			  <div class="span6">	
				<div class="span3">
				  <label>检查时间<span class="f_req"></span></label>
				   </div>
					<div class="span9">
					   <input id="checkTime" name="checkTime" readOnly <#if dormRating?? && dormRating.checkTime??> value="${((dormRating.checkTime)!"")?string("yyyy-MM-dd")}"</#if>/>
					</div>
				 </div>
			  </div>
		   </div>
		   <div class="formSep">
			 <div class="row-fluid">
				<div class="span6">
					<div class="span3">
						<label>文明标兵寝室<span class="f_req"></span></label>
					</div>
					<div class="span9">
					   <input id="isPacesetter" name="isPacesetter" readOnly value="${((dormRating.isPacesetter)!"")?html}"/>
				  </div>
				</div>
			  <div class="span6">	
				<div class="span3">
				  <label>较差寝室<span class="f_req"></span></label>
				   </div>
					<div class="span9">
					   <input id="isBedRoom" name="isBedRoom" readOnly value="${((dormRating.isBedRoom)!"")?html}"/>
					</div>
				 </div>
			  </div>
		   </div>
		  <div class="formSep">
			 <div class="row-fluid">
				<div class="span6">
					<div class="span3">
						<label>等级<span class="f_req"></span></label>
					</div>
					<div class="span9">
					   <input id="level" name="level" readOnly value="${((dormRating.level)!"")?html}"/>
				  </div>
				</div>
			  <div class="span6">	
				<div class="span3">
				  <label>得分<span class="f_req"></span></label>
				   </div>
					<div class="span9">
					   <input id="getScore" name="getScore" readOnly value="${((dormRating.getScore)!"")?html}"/>
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
					   <textarea rows="5" cols="12" id="comments" readOnly name="comments" class="span6" style="width: 775px; height: 134px;">${((dormRating.comments)!"")?html}</textarea>
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
