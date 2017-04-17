<!--学生选择 -->
<div class="modal hide fade" id="_selectTeacherAllCheckModal">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3>教职工多选</h3>
	</div>
	<div class="modal-body" id="_selectTeacherAllCheckModalBody">
	<div class="row-fluid">
	
			<div class="span3">
				<ul id="selectUserOrgTree" class="ztree myztree"></ul>
			</div>
	<div class="span6">
		<div class="row-fluid">
			<div class="span12">
				<form  id="_teacherAllCheckQuery"  action="${rc.contextPath}/comp/teacher/nsm/queryTeachers.do" method="post">
					<input id="selectedTeacherId" name="selectedTeacherId" type="hidden"/>	
					<input id="formId" name="formId" value="_teacherAllCheckQuery"  type="hidden"/>	
					<input id="queryFlag" name="queryFlag" value="checkbox" type="hidden"/>	
					<input id="_checkTeacherOrgId" name="org.id" value="" type="hidden"/>	
					<div class="row-fluid">
						<div class="span5">	
							 职工姓名 <input id="_checkTeacherName" name="name" class="span7"  value=""/>
						</div>
						<div class="span4">	
							职工工号  <input id="_checkTeacherId" name="id" class="span7"  value=""/>
						</div>
						<div class="span3">	
							<input type="button" class="btn btn-info" id="_teacherCheckQueryButton" onclick="_queryTeacherCheckSubmit();" value="查 询"/>
						</div>
					</div>
				</form>
				</div>	
				</div>	
				<div class="row-fluid">
					<div class="span12" id="_teachersAllCheckTableDiv">
					</div>	
				</div>	
			</div>
			
			<div class="span3">
				<ul id="_selectedAllTeachers" class="ztree myztree"></ul>
				<a href="###" class="btn btn-info" onclick="javascript:_deleteAllTeachers()">全部删除</a>
			</div>	
		</div>
	</div>
	<div class="modal-footer">
		<a href="###" class="btn " data-dismiss="modal">关闭</a>
		<a href="###" class="btn btn-info" data-dismiss="modal" onclick="_MultiTeacherSelectButton()">确定</a>		
	</div>
</div>

<script>

//业务页面调用方法	
function _queryTeacherCheckAll(ids)
{
	_initTeacherCheckValues(ids);
	_queryTeacherCheckSubmit();		
	comp.showModal("_selectTeacherAllCheckModal");
}
//从用户购物车删除
function teacherRemove(event, treeId, treeNode) {

	$('input[name="row_teacher_multi"]').each(function(){
          var value=$(this).attr("value");
          var obj=eval("["+value+"]");
          if(obj[0].id==treeNode.id){
          	$(this).attr("checked",false);
          	$("#checkTeacherAll").attr("checked",false);
          }
    });		
}
//打开面板数据初始化
function _initTeacherCheckValues(ids)
{
	$('#_selectTeacherAllCheckModal').width(910).css("marginLeft","-380px").css("marginTop","-250px");
	$('#_selectTeacherAllCheckModalBody').height(350).css("max-height","350px");
	$('#selectUserOrgTree').width(200).height(340).css("margin-top","0px");
	$('#_selectedAllTeachers').width(200).height(320).css("margin-top","0px");
	$('#_teacherCheckQueryButton').css("margin-bottom","9px");
	$("#_checkTeacherOrgId").val("");
	$("#_checkTeacherName").val("");
	$("#_checkTeacherId").val("");
	
	//初始化组织机构树
	comp.initTree("selectUserOrgTree",comp.contextPath()+"/user/comp/getOrgTree.do",null,null,_queryUsersByOrgId);
	
	var treeObj = $.fn.zTree.getZTreeObj("selectUserOrgTree");
	var node = treeObj.getNodes()[0];
	treeObj.expandNode(node, true, true, true);
	treeObj.selectNode(node);	
	
	//选中初始化
	var calssStudentNodes;
	$.ajax({
			async : false,
			cache:false,
			type: 'POST',
			url: comp.contextPath()+"/comp/opt-query/getTeadcherJson.do",
			data:"ids="+ids,
			error: function () {
				/*扩展错误提示 */
				comp.message("教职工信息查询失败!","error");
			},
			success:function(data){
				calssStudentNodes = eval(data); 
			}
		});
		var selectedClassStudentSet = {data:{},view:{showLine:false,selectedMulti: false,showIcon: false},
			edit:{enable:true,showRenameBtn:false,drag:{prev:true,next:true,inner:false}},callback:{onRemove:teacherRemove}};
		$.fn.zTree.init($("#_selectedAllTeachers"), selectedClassStudentSet, calssStudentNodes);	
	
	//用户ajaxform提交设置
	var ajaxCheckFormOptions = {
        type: "POST",
        success: function(data){
          
                $('input[name="row_teacher_multi"]').each(function(){
			          var value=$(this).attr("value");
			          var obj=eval("["+value+"]");
			          var checkbox=$(this);
			         
					var userTree = $.fn.zTree.getZTreeObj("_selectedAllTeachers");
					var users =userTree.getNodes();
					$(users).each(function(){
						if($(this)[0].id==obj[0].id)							
						    checkbox.attr("checked",true);
					 });
			    });	
			    
			    $("#checkTeacherAll").attr("checked",
			    	$("input[name='row_teacher_multi']").length == $("input[name='row_teacher_multi']:checked").length
			    	&& $("input[name='row_teacher_multi']").length>0? true : false);
        },            
        error: function(){
            comp.message("学生信息查询请求失败，请稍后重试。","error");
        },
        beforeSubmit: function(formData, jqForm, options){
        },
        target: '#_teachersAllCheckTableDiv'
    };
	$("#_teacherAllCheckQuery").ajaxForm(ajaxCheckFormOptions);	
}
	
	
function _queryUsersByOrgId(event, treeId, treeNode){
	var treeObj = $.fn.zTree.getZTreeObj("selectUserOrgTree");
	var node = treeObj.getNodes()[0];
	if(treeObj.id != node.id && treeNode.id!="000" )//组机构根节点不传递 组织机构id给后台
		$("#_checkTeacherOrgId").val(treeNode.id);
	else
		$("#_checkTeacherOrgId").val("");
	
	$("#_checkTeacherName").val(""); 
	$("#_checkTeacherId").val(""); 
	$('#_teacherAllCheckQuery').submit();
}
	
	
function _queryTeacherCheckSubmit()
{
	if($('#userQuerypageNo').length>0)
		$('#userQuerypageNo').val('1');
	$('#_teacherAllCheckQuery').submit();
}

//全选 
function checkTeacherAll(obj) 
{

     $('input[name="row_teacher_multi"]').attr("checked",obj.checked);
     if($("#checkTeacherAll").attr("checked")!=null)
         $('input[name="row_teacher_multi"]').each(function(){ 
         	 addEduClassFromTable($(this).attr("value"));
         });
     else
         $('input[name="row_teacher_multi"]').each(function(){ 
         	 removeEduClassFromTable($(this).attr("value"));
         });
  }

//从table中移除购物车的用户
function removeEduClassFromTable(value){

	var obj=eval("["+value+"]");
	var userTree = $.fn.zTree.getZTreeObj("_selectedAllTeachers");
	var users =userTree.getNodes();
	$(users).each(function(){
		if($(this)[0].id==obj[0].id)
			userTree.removeNode($(this)[0]);
	  });
}

//从table中添加购物车的用户
function addEduClassFromTable(value){

	var userTree = $.fn.zTree.getZTreeObj("_selectedAllTeachers");
	var users =userTree.getNodes();
	var obj=eval("["+value+"]");
	var tag= true;
	$(users).each(function(){
		if($(this)[0].id==obj[0].id){
			tag=false;
			return;
		}
	  });
	if(tag)
		userTree.addNodes(null,eval("["+value+"]"));
}

// 清空购物车
function _deleteAllTeachers(){
	$('input[name="row_teacher_multi"]').attr("checked",false);
	$("#checkTeacherAll").attr("checked",false);
	var userTree = $.fn.zTree.getZTreeObj("_selectedAllTeachers");
	var nodes = userTree.getNodes();
	$(nodes).each(function(){
		userTree.removeNode($(this)[0]);
	});
}
	
//点击checkbox按钮 
function _onClickTeacherCheckbox(obj)
{
	var $subBox = $("input[name='row_teacher_multi']");
	$("#checkTeacherAll").attr("checked",$subBox.length == $("input[name='row_teacher_multi']:checked").length ? true : false);
	if($(obj).attr("checked")!=null){
		addEduClassFromTable($(obj).attr("value"));
	}else{
		removeEduClassFromTable($(obj).attr("value"));
	}
}
	
	
function _MultiTeacherSelectButton()
{
	var treeObj = $.fn.zTree.getZTreeObj("_selectedAllTeachers");
	var teacherIds="";
	var names="";
	var i=0;
	$(treeObj.getNodes()).each(function(){
		if(i>0)
		{
			teacherIds+=",";
			names+=";";
		}
		teacherIds+=$(this)[0].id;
		names+=	$(this)[0].name;					
		i++;			    
	 });		
	setTeacherSelectValue(teacherIds,names);
}
</script>