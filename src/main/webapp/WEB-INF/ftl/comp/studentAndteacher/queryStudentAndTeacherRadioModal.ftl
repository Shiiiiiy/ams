<!--学生选择 -->
<div class="modal hide fade" id="_selectStudentAndTeacherRadioModal">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3></h3>
	</div>
	<div class="modal-body" id="_selectStudentAndTeacherRadioModalBody">
		<div class="row-fluid">
			<div class="span12">
				<form  id="_studentAndTeacherAllRadioQuery"  action="${rc.contextPath}/comp/studentAndteacher/nsm/queryRadioStudentAndTeacher.do" method="post">
					<input id="selectedStudentId" name="studentId" type="hidden"/>	
					<input id="selectedTeacherId" name="teacherId" type="hidden"/>	
					<input id="formId" name="formId" value="_studentAndTeacherAllRadioQuery"  type="hidden"/>
					<input id="_radioTeachersOrgId" name="org.id" value="" type="hidden"/>
					<div class="row-fluid">
						<div class="span4">	
							类别	
							<select  id="queryType" name="queryType" aria-controls="dt_gal"  class="span8" onchange="changeQueryType(this.value);">
								<option value="student">学生</option>
								<option value="teacher">教师</option>
							</select>		
						</div>
						<div class="span4" id="collegeDiv">	
							学院	
							<select  id="_radioCollegeId" name="college.id" aria-controls="dt_gal"  class="span8" onchange="cascade.changeCollage('_radioCollegeId','_radioMajorId','_radioClassId');">
								<option value="">请选择..</option>
							</select>		
						</div>
						<div class="span4" id="majorDiv">	
							专业
							<select  id="_radioMajorId" name="major.id" aria-controls="dt_gal"  class="span8 emptySelect" onchange="cascade.changeMajor('_radioMajorId','_radioClassId');">
								<option value="">请选择..</option>
							</select>				
						</div>
						<div class="span4" id="teacherNameDiv" style="display:none">	
							 职工姓名 <input id="_radioTeacherName" name="name" class="span8"  value=""/>
						</div>
						<div class="span4" id="teacherIdDiv" style="display:none">	
							职工工号  <input id="_radioTeacherId" name="id" class="span8"  value=""/>
						</div>
					</div>
						
					<div class="row-fluid" id="studentQueryDiv">
						<div class="span4">	
							班级	
							<select  id="_radioClassId" name="classId.id" aria-controls="dt_gal"  class="span8 emptySelect">
								<option value="">请选择..</option>
							</select>				
						</div>
						<div class="span4">	
							 姓名	
							<input id="_radioName" name="namePy" class="span8"  value=""/>
						</div>
						<div class="span4">	
							学号
							<input id="_radioStuNumber" name="stuNumber" class="span8"  value=""/>
						</div>
					</div>
					<div class="row-fluid">
						<div class="btnCenter">	
							<input type="button" class="btn btn-info" id="_studentRadioQueryButton" onclick="_queryStudentAndTeacherRadioSubmit()" value="查 询"/>
							<input type="button" class="btn btn-info" id="_studentRadioClearButton" onclick="clearForm('_studentAndTeacherAllRadioQuery')" value="清 空"/>	
						</div>
					</div>
				</form>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span12" id="_studentAndTeacherAllRadioTableDiv">
				</div>	
				<input id="_studentRadioAllInfo" name="_studentRadioAllInfo" type="hidden" value=""/>
				<input id="_teachersRadioAllInfo" name="_teachersRadioAllInfo" type="hidden" value=""/>							
			</div>		
		</div>
	<div class="modal-footer">
		<a href="###" class="btn " data-dismiss="modal">关闭</a>
		<a href="###" class="btn btn-info" data-dismiss="modal" onclick="_getSelectedRadioValue()">确定</a>		
	</div>
</div>

<script>

function clearForm(formId){
	var queryType = $("#queryType").val();
	$(':input','#'+formId).not(':button, :submit, :reset, :hidden, .notClear').val('').removeAttr('checked').removeAttr('selected');
	$(':input','#'+formId).not(':button, :submit, :reset, :hidden, .notClear').val('').removeAttr('checked').removeAttr('selected');
	$(".emptySelect").each(function(){
		$(this).empty();
		$(this).append("<option value=''>请选择</option>"); 
	});
	$("#queryType").val(queryType);
}


//切换控件查询类型
function changeQueryType(type){
	if(type == 'teacher'){
		$("#collegeDiv").hide();
		$("#majorDiv").hide();
		$("#studentQueryDiv").hide();
		$("#teacherNameDiv").show();
		$("#teacherIdDiv").show();
		$("#teacherNameDiv").attr("disabled",false);
		$("#_studentAndTeacherAllRadioQuery").submit();
	}else{
		$("#teacherNameDiv").hide();
		$("#teacherIdDiv").hide();
		$("#teacherNameDiv").attr("disabled",true);
		$("#collegeDiv").show();
		$("#majorDiv").show();
		$("#studentQueryDiv").show();
		$("#_studentAndTeacherAllRadioQuery").submit();
	}
}


//选择确定传值方法
function _getSelectedRadioValue()
{
	var queryType = $("#queryType").val();
	if(queryType == 'student'){
		var studentInfo =eval("["+$("#_studentRadioAllInfo").val()+"]");
		setStudentAndTeacherRadioSelectValue(studentInfo[0],queryType);
	}else{
		var teacherInfo =eval("["+$("#_teachersRadioAllInfo").val()+"]");
		setStudentAndTeacherRadioSelectValue(teacherInfo[0],queryType)
	}
}

//业务页面调用方法	
function _queryStudentAndTeacherRadio(studentId,teacherId)
{
	_initStudentAndTeacherRadioValues(studentId,teacherId);
	_queryStudentAndTeacherRadioSubmit();		
	comp.showModal("_selectStudentAndTeacherRadioModal");
}

//打开面板数据初始化
function _initStudentAndTeacherRadioValues(studentId,teacherId)
{
	$('#_selectStudentAndTeacherRadioModal').width(800).css("marginLeft","-380px").css("marginTop","-250px");
	$('#_selectStudentAndTeacherRadioModalBody').height(350).css("max-height","420px");
	$('#_studentRadioQueryButton').css("margin-bottom","9px");
	$('#_studentRadioClearButton').css("margin-bottom","9px");
	$("#selectedStudentId").val(studentId);
	$("#selectedTeacherId").val(teacherId);
	$("#_studentRadioAllInfo").val("");
	$("#_radioMajorId").val("");
	$("#_radioClassId").val("");
	$("#_radioName").val("");
	$("#_radioStuNumber").val("");
	if(studentId != ''){
		$("#queryType").val("student");
	}else if(teacherId != ''){
		$("#queryType").val("teacher");
	}else{
		$("#queryType").val("student");
		$("#teacherNameDiv").hide();
		$("#teacherIdDiv").hide();
		$("#teacherNameDiv").attr("disabled",true);
		$("#collegeDiv").show();
		$("#majorDiv").show();
		$("#studentQueryDiv").show();
	}
	initStudentCollege("");
	
	//用户ajaxform提交设置
	var ajaxStudentFormOptions = {
        type: "POST",
        success: function(data){
        },            
        error: function(){
            comp.message("学生信息查询请求失败，请稍后重试。","error");
        },
        beforeSubmit: function(formData, jqForm, options){
        },
        target: '#_studentAndTeacherAllRadioTableDiv'
    };
	$("#_studentAndTeacherAllRadioQuery").ajaxForm(ajaxStudentFormOptions);	
}
	
function _queryStudentAndTeacherRadioSubmit()
{
	if($('#userQuerypageNo').length>0)
		$('#userQuerypageNo').val('1');
	$('#_studentAndTeacherAllRadioQuery').submit();
}

function _onClickStudentRadio(obj)
{
	$("#_studentRadioAllInfo").val($(obj).attr("value"));
}

function _onClickTeachersRadioBox(obj)
{
	$("#_teachersRadioAllInfo").val($(obj).attr("value"));
}	

// 初始化学院信息
function initStudentCollege(collegeId)
{
	$.ajax({
		async : false,
		cache:false,
		type: 'POST',
		dataType : "json",
		url: comp.contextPath()+"/comp/opt-query/initCollegeJson.do",
		error: function () {
			/*扩展错误提示 */
			comp.message("\u8BF7\u6C42\u5931\u8D25\uFF0C\u8BF7\u7A0D\u540E\u518D\u8BD5!","error");
		},
		success:function(data){ 
		
			  $("#_radioCollegeId").empty();
			  $("<option value=''>请选择</option>").appendTo("#_radioCollegeId");		
			  $.each(data, function(i,item){
		 		 if(item.id == collegeId)
		 		 {	
		 			$('<option value='+item.id+' selected>'+item.name+'</option>').appendTo("#_radioCollegeId");
		 			cascade.changeCollage('_radioCollegeId','_radioMajorId','_radioClassId');
	 			}
	 			 else
		 			$('<option value='+item.id+'>'+item.name+'</option>').appendTo("#_radioCollegeId");
			  });
		}
	});
}

</script>