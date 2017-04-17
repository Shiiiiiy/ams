<!--学生选择 -->
<div class="modal hide fade" id="_selectStudentClassRadioModal">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3>学生选择</h3>
	</div>
	<div class="modal-body" id="_selectStudentClassRadioModalBody">
		<div class="row-fluid">
			<div class="span12">
				<form  id="_studentClassRadioQuery"  action="${rc.contextPath}/comp/student/nsm/querySteudentByClass.do" method="post">
					<input id="_raidoStudentClassId" name="classId.id" type="hidden" value=""/>	
					<input id="_selectedStudentByClassId" name="selectedStudentId" type="hidden" value=""/>
					<input id="queryFlag" name="queryFlag" value="radio" type="hidden"/>	
					<input id="formId" name="formId" value="_studentClassRadioQuery"  type="hidden"/>	
					<div class="row-fluid">
						<div class="span4">	
							 姓名	
							<input id="_radioClassStudentName" name="name" class="span8"  value=""/>
						</div>
						<div class="span4">	
							学号
							<input id="_radioClassStudentStuNumber" name="stuNumber" class="span8"  value=""/>
						</div>
						<div class="span4">	
							<input type="button" class="btn btn-info" id="_studentByClassRadioQueryButton" onclick="_queryStudentByClassRadioSubmit()" value="查 询"/>
							<input type="button" class="btn btn-info" id="_studentByClassRadioClearButton" onclick="comp.clearForm('_studentClassRadioQuery')" value="清 空"/>	
						</div>
					</div>
				</form>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span12" id="_studentsByClassRadioTableDiv">
				</div>	
				<input id="_studentRadioClassStudentInfo" name="_studentRadioClassStudentInfo" type="hidden" value=""/>						
			</div>		
		</div>
	<div class="modal-footer">
		<a href="###" class="btn " data-dismiss="modal">关闭</a>
		<a href="###" class="btn btn-info" data-dismiss="modal" onclick="_getSelectedClassStudent()">确定</a>		
	</div>
</div>

<script>

//选择确定传值方法
function _getSelectedClassStudent()
{
	var studentInfo =eval("["+$("#_studentRadioClassStudentInfo").val()+"]");
	setClassStudentSelectValue( studentInfo[0] );
}

//业务页面调用方法	
function _queryStudentRadioByClass(classId,studentId)
{
	_initRadioClassStudentValues(classId,studentId);
	_queryStudentByClassRadioSubmit();		
	comp.showModal("_selectStudentClassRadioModal");
}

//打开面板数据初始化
function _initRadioClassStudentValues(classId,studentId)
{
	$('#_selectStudentClassRadioModal').width(800).css("marginLeft","-380px").css("marginTop","-250px");
	$('#_selectStudentClassRadioModalBody').height(300).css("max-height","420px");
	$('#_studentByClassRadioQueryButton').css("margin-bottom","9px");
	$('#_studentByClassRadioClearButton').css("margin-bottom","9px");
	$("#_selectedStudentByClassId").val(studentId);
	$("#_raidoStudentClassId").val(classId);
	$("#_radioClassStudentName").val("");
	$("#_radioClassStudentStuNumber").val("");
	$("#_studentRadioClassStudentInfo").val("");
	
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
        target: '#_studentsByClassRadioTableDiv'
    };
	$("#_studentClassRadioQuery").ajaxForm(ajaxStudentFormOptions);	
}
	
function _queryStudentByClassRadioSubmit()
{
	if($('#userQuerypageNo').length>0)
		$('#userQuerypageNo').val('1');
	$('#_studentClassRadioQuery').submit();
}

function _onClickClassStudentRadio(obj)
{
	$("#_studentRadioClassStudentInfo").val($(obj).attr("value"));
}

// 初始化学院信息
function initCollege()
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
			 		$('<option value='+item.id+'>'+item.name+'</option>').appendTo("#_radioCollegeId");
			  });
		}
	});
}

</script>