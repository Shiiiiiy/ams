<!--学生选择 -->
<div class="modal hide fade" id="_selectStudentAllRadioModal">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3>学生选择</h3>
	</div>
	<div class="modal-body" id="_selectStudentAllRadioModalBody">
		<div class="row-fluid">
			<div class="span12">
				<form  id="_studentAllRadioQuery"  action="${rc.contextPath}/job/schoolGoodStudent/nsm/queryAwardGraduateStudent.do" method="post">
					<input id="selectedStudentId" name="selectedStudentId" type="hidden"/>	
					<input id="queryFlag" name="queryFlag" value="radio" type="hidden"/>	
					<input id="formId" name="formId" value="_studentAllRadioQuery"  type="hidden"/>	
					<div class="row-fluid">
						<div class="span4">	
							学院	
							<select  id="_radioCollegeId" name="college.id" aria-controls="dt_gal"  class="span8" onchange="cascade.changeCollage('_radioCollegeId','_radioMajorId','_radioClassId');">
								<option value="">请选择..</option>
							</select>		
						</div>
						<div class="span4">	
							专业
							<select  id="_radioMajorId" name="major.id" aria-controls="dt_gal"  class="span8 emptySelect" onchange="cascade.changeMajor('_radioMajorId','_radioClassId');">
								<option value="">请选择..</option>
							</select>				
						</div>
						<div class="span4">	
							班级	
							<select  id="_radioClassId" name="classId.id" aria-controls="dt_gal"  class="span8 emptySelect">
								<option value="">请选择..</option>
							</select>				
						</div>
					</div>
					<div class="row-fluid">
						<div class="span4">	
							 姓名	
							<input id="_radioName" name="name" class="span8"  value=""/>
						</div>
						<div class="span4">	
							学号
							<input id="_radioStuNumber" name="stuNumber" class="span8"  value=""/>
						</div>
						<div class="span4">	
							<input type="button" class="btn btn-info" id="_studentRadioQueryButton" onclick="_queryStudentRadioSubmit()" value="查 询"/>
							<input type="button" class="btn btn-info" id="_studentRadioClearButton" onclick="comp.clearForm('_studentAllRadioQuery')" value="清 空"/>	
						</div>
					</div>
				</form>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span12" id="_studentsAllRadioTableDiv">
				</div>	
				<input id="_studentRadioAllInfo" name="_studentRadioAllInfo" type="hidden" value=""/>						
			</div>		
		</div>
	<div class="modal-footer">
		<a href="###" class="btn " data-dismiss="modal">关闭</a>
		<a href="###" class="btn btn-info" data-dismiss="modal" onclick="_getSelectedRadioStudent()">确定</a>		
	</div>
</div>

<script>

//选择确定传值方法
function _getSelectedRadioStudent()
{
	var studentInfo =eval("["+$("#_studentRadioAllInfo").val()+"]");
	setStudentRadioSelectValue( studentInfo[0] );
}

//业务页面调用方法	
function _queryStudentRadioAll(selectedId,collegeId)
{
	_initRadioValues(selectedId,collegeId);
	_queryStudentRadioSubmit();		
	comp.showModal("_selectStudentAllRadioModal");
}

//打开面板数据初始化
function _initRadioValues(selectedId,collegeId)
{
	$('#_selectStudentAllRadioModal').width(800).css("marginLeft","-380px").css("marginTop","-250px");
	$('#_selectStudentAllRadioModalBody').height(350).css("max-height","420px");
	$('#_studentRadioQueryButton').css("margin-bottom","9px");
	$('#_studentRadioClearButton').css("margin-bottom","9px");
	$("#selectedStudentId").val(selectedId);
	$("#_radioCollegeId").val(collegeId);
	$("#_studentRadioAllInfo").val("");
	$("#_radioMajorId").val("");
	$("#_radioClassId").val("");
	$("#_radioName").val("");
	$("#_radioStuNumber").val("");
	
	initStudentCollege(collegeId);
	
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
        target: '#_studentsAllRadioTableDiv'
    };
	$("#_studentAllRadioQuery").ajaxForm(ajaxStudentFormOptions);	
}
	
function _queryStudentRadioSubmit()
{
	if($('#userQuerypageNo').length>0)
		$('#userQuerypageNo').val('1');
	$('#_studentAllRadioQuery').submit();
}

function _onClickStudentRadio(obj)
{
	$("#_studentRadioAllInfo").val($(obj).attr("value"));
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