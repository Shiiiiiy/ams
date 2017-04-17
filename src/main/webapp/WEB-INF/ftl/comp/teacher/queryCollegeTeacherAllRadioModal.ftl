<div class="modal hide fade" id="_selectCollegeTeacherAllRadioModal">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3>教师选择</h3>
	</div>
	<div class="modal-body" id="_selectCollegeTeacherAllRadioModalBody">
		<div class="row-fluid">
			<div class="span12">
				<form  id="_teacherAllRadioQuery"  action="${rc.contextPath}/comp/taecher/nsm/queryRadioCollegeTeacher.do" method="post">
					<input id="selectedTeachertId" name="selectedTeachertId" type="hidden"/>	
					<input id="queryFlag" name="queryFlag" value="radio" type="hidden"/>	
					<input id="formId" name="formId" value="_teacherAllRadioQuery"  type="hidden"/>	
					<div class="row-fluid">
						<div class="span4">	
							学院	
							<select  id="_radioTeacherCollegeId" name="org.id" aria-controls="dt_gal"  class="span9">
								<option value="">请选择..</option>
							</select>		
						</div>
						<div class="span3">	
							 姓名	
							<input id="_radioName" name="name" class="span9"  value=""/>
						</div>
						<div class="span3">	
							工号
							<input id="_radioStuNumber" name="code" class="span9"  value=""/>
						</div>
						<div class="span2">	
							<input type="button" class="btn btn-info" id="_teacherRadioQueryButton" onclick="_queryTeacherRadioSubmit()" value="查 询"/>
							<input type="button" class="btn btn-info" id="_teacherRadioClearButton" onclick="comp.clearForm('_teacherAllRadioQuery')" value="清 空"/>	
						</div>
					</div>
				</form>
				</div>
			</div>
			<div class="row-fluid">
				<div class="span12" id="_teachersAllRadioTableDiv">
				</div>	
				<input id="_collegeTeacherRadioAllInfo" name="_collegeTeacherRadioAllInfo" type="hidden" value=""/>						
			</div>		
		</div>
	<div class="modal-footer">
		<a href="javascript:void(0);" class="btn " data-dismiss="modal">关闭</a>
		<a href="javascript:void(0);" class="btn btn-info" data-dismiss="modal" onclick="_getSelectedCollegeRadioRadioTeacher()">确定</a>		
	</div>
</div>

<script>

//选择确定传值方法
function _getSelectedCollegeRadioRadioTeacher()
{
	var teacherInfo =eval("["+$("#_collegeTeacherRadioAllInfo").val()+"]");
	setCollegeTeacherRadioSelectValue( teacherInfo[0] );
}

//业务页面调用方法	
function _queryCollegeTeacherRadio(selectedId,orgId)
{
	_queryCollegeTeacherRadioAll(selectedId,orgId);
	_queryTeacherRadioSubmit();		
	comp.showModal("_selectCollegeTeacherAllRadioModal");
}

//打开面板数据初始化
function _queryCollegeTeacherRadioAll(selectedId,orgId)
{
	$('#_selectCollegeTeacherAllRadioModal').width(800).css("marginLeft","-380px").css("marginTop","-250px");
	$('#_selectCollegeTeacherAllRadioModalBody').height(300).css("max-height","400px");
	$('#_teacherRadioQueryButton').css("margin-bottom","9px");
	$('#_teacherRadioClearButton').css("margin-bottom","9px");
	$("#selectedTeachertId").val(selectedId);
	$("#_radioTeacherCollegeId").val(orgId);
	$("#_radioTeacherCollegeId").addClass("notClear");
	$("#_collegeTeacherRadioAllInfo").val("");
	$("#_radioName").val("");
	$("#_radioStuNumber").val("");
	
	_initCollege(orgId);
	
	//用户ajaxform提交设置
	var ajaxStudentFormOptions = {
        type: "POST",
        success: function(data){
        },            
        error: function(){
            comp.message("教师信息查询请求失败，请稍后重试。","error");
        },
        beforeSubmit: function(formData, jqForm, options){
        },
        target: '#_teachersAllRadioTableDiv'
    };
	$("#_teacherAllRadioQuery").ajaxForm(ajaxStudentFormOptions);
}
	
function _queryTeacherRadioSubmit()
{
	if($('#userQuerypageNo').length>0)
		$('#userQuerypageNo').val('1');
	$('#_teacherAllRadioQuery').submit();
}

function _onClickCollegeTeacherRadio(obj)
{
	$("#_collegeTeacherRadioAllInfo").val($(obj).attr("value"));
}

// 初始化学院信息
function _initCollege(orgId)
{
	$.ajax({
		async : false,
		cache:false,
		type: 'POST',
		dataType : "json",
		url: comp.contextPath()+"/comp/opt-query/initCollegeJson.do",
		error: function () {
			/*扩展错误提示 */
			comp.message("学院信息初始化失败，请联系管理员!","error");
		},
		success:function(data){ 
			  $("#_radioTeacherCollegeId").empty();
			  $("<option value=''>请选择</option>").appendTo("#_radioTeacherCollegeId");		
			  $.each(data, function(i,item){
			  		if(item.id == orgId)	
			 			$('<option value='+item.id+' selected>'+item.name+'</option>').appendTo("#_radioTeacherCollegeId");
		 			else
			 			$('<option value='+item.id+'>'+item.name+'</option>').appendTo("#_radioTeacherCollegeId");
			  });
		}
	});
}

</script>