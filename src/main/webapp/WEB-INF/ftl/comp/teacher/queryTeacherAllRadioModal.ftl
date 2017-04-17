<!--学生选择 -->
<div class="modal hide fade" id="_selectTeacherAllRadioModal">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3>教职工单选</h3>
	</div>
	<div class="modal-body" id="_selectTeacherAllRadioModalBody">
	<div class="row-fluid">
	<div class="span3">
		<ul id="selectUserOrgRadioTree" class="ztree myztree"></ul>
	</div>
	<div class="span9">
		<div class="row-fluid">
			<div class="span12">
				<form  id="_teacherSchoolRadioQuery"  action="${rc.contextPath}/comp/teacher/nsm/queryTeachers.do" method="post">
					<input id="_selectedTeacherId" name="selectedTeacherId" type="hidden" value=""/>	
					<input id="radioFormId" name="formId" value="_teacherSchoolRadioQuery"  type="hidden"/>	
					<input id="queryRadioFlag" name="queryFlag" value="radio" type="hidden"/>	
					<input id="_radioTeacherOrgId" name="org.id" value="" type="hidden"/>	
						<div class="span4">	
							 职工姓名 <input id="_radioTeacherName" name="name" class="span8"  value=""/>
						</div>
						<div class="span4">	
							职工工号  <input id="_radioTeacherId" name="id" class="span8"  value=""/>
						</div>
						<div class="span3">	
							<input type="button" class="btn btn-info" id="_studentRadioQueryButton" onclick="_querySchoolTeacherRadioSubmit();" value="查 询"/>
						</div>
				</form>
				</div>	
				</div>	
				<input id="_teacherRadioAllInfo" name="_teacherRadioAllInfo" type="hidden" value=""/>	
				<div class="row-fluid"  id="_schoolTeachersAllRadioTableDiv">
				</div>	
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<a href="javascript:void(0);" class="btn " data-dismiss="modal">关闭</a>
		<a href="javascript:void(0);" class="btn btn-info" data-dismiss="modal" onclick="_RadioTeacherSelectButton()">确定</a>		
	</div>
</div>

<script>

//业务页面调用方法	
function _queryTeacherRadioAll(id)
{
	_initTeacherRadioValue(id);
	_querySchoolTeacherRadioSubmit();		
	comp.showModal("_selectTeacherAllRadioModal");
}
//打开面板数据初始化
function _initTeacherRadioValue(id)
{
	$('#_selectTeacherAllRadioModal').width(880).css("marginLeft","-350px").css("marginTop","-250px");
	$('#_selectTeacherAllRadioModalBody').height(300).css("max-height","330px");
	$('#selectUserOrgRadioTree').width(200).height(300).css("margin-top","0px");
	$('#_studentRadioQueryButton').css("margin-bottom","9px");
	$('#_studentRadioClearButton').css("margin-bottom","9px");
	$("#_selectedTeacherId").val(id);
	$("#_radioTeacherOrgId").val("");
	$("#_radioTeacherName").val("");
	$("#_radioTeacherId").val("");
	
	//初始化组织机构树
	comp.initTree("selectUserOrgRadioTree",comp.contextPath()+"/user/comp/getOrgTree.do",null,null,_queryTeachersByOrgId);
	
	var treeObj = $.fn.zTree.getZTreeObj("selectUserOrgRadioTree");
	var node = treeObj.getNodes()[0];
	treeObj.expandNode(node, true, true, true);
	treeObj.selectNode(node);	

	//用户ajaxform提交设置
	var ajaxCheckFormOptions = {
        type: "POST",
        success: function(data){
        },            
        error: function(){
            comp.message("教职工信息查询请求失败，请稍后重试。","error");
        },
        beforeSubmit: function(formData, jqForm, options){
        },
        target: '#_schoolTeachersAllRadioTableDiv'
    };
	$("#_teacherSchoolRadioQuery").ajaxForm(ajaxCheckFormOptions);	
}
	
	
function _queryTeachersByOrgId(event, treeId, treeNode){
	var treeObj = $.fn.zTree.getZTreeObj("selectUserOrgRadioTree");
	var node = treeObj.getNodes()[0];
	if(treeObj.id != node.id && treeNode.id !="000")//组机构根节点不传递 组织机构id给后台
		$("#_radioTeacherOrgId").val(treeNode.id);
	else
		$("#_radioTeacherOrgId").val("");
	
	$("#_radioTeacherName").val(""); 
	$("#_radioTeacherId").val(""); 
	$('#_teacherSchoolRadioQuery').submit();
}
	
	
function _querySchoolTeacherRadioSubmit()
{
	if($('#userQuerypageNo').length>0)
		$('#userQuerypageNo').val('1');
	$('#_teacherSchoolRadioQuery').submit();
}
	
function _onClickTeacherRadioBox(obj)
{
	$("#_teacherRadioAllInfo").val($(obj).attr("value"));
}	
	
function _RadioTeacherSelectButton()
{
	var teacherInfo =eval("["+$("#_teacherRadioAllInfo").val()+"]");
	_setTeacherRadioSelectValue( teacherInfo[0] );
}
</script>