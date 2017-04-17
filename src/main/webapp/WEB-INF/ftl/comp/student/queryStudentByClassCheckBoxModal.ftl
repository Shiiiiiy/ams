<!--学生选择 -->
<div class="modal hide fade" id="_selectStudentByClassCheckModal">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3>学生选择</h3>
	</div>
	<div class="modal-body" id="_selectStudentByClassCheckModalBody">
	<div class="row-fluid">
	<div class="span9">
		<div class="row-fluid">
			<div class="span12">
				<form  id="_studentByClassCheckQuery"  action="${rc.contextPath}/comp/student/nsm/querySteudentByClass.do" method="post">
					<input id="selectedStudentId" name="selectedStudentId" type="hidden"/>		
					<input id="__falg" name="__falg" type="hidden"/>
					<input id="_checkStudentClassId" name="classId.id" type="hidden" value=""/>	
					<input id="formId" name="formId" value="_studentByClassCheckQuery"  type="hidden"/>	
					<input id="queryFlag" name="queryFlag" value="checkbox" type="hidden"/>	
					<div class="row-fluid">
						<div class="span4">	
							 姓名	
							<input id="_checkName" name="name" class="span8"  value=""/>
						</div>
						<div class="span4">	
							学号
							<input id="_checkStuNumber" name="stuNumber" class="span8"  value=""/>
						</div>
						<div class="span4">	
							<input type="button" class="btn btn-info" id="_studentCheckQueryByClassButton" onclick="_queryStudentByClassCheckSubmit();" value="查 询"/>
							<input type="button" class="btn btn-info" id="_studentCheckClearByClassButton" onclick="comp.clearForm('_studentByClassCheckQuery')" value="清 空"/>	
						</div>
					</div>
				</form>
				</div>	
				</div>	
				<div class="row-fluid">
					<div class="span12" id="_studentsByClassCheckTableDiv">
					</div>	
				</div>	
			</div>
			
			<div class="span3">
				<ul id="_selectedClassStudentTree" class="ztree myztree"></ul>
				<a href="###" class="btn btn-info" onclick="javascript:_deleteAllClassStudent()">全部删除</a>
			</div>	
		</div>
	</div>
	<div class="modal-footer">
		<a href="###" class="btn " data-dismiss="modal">关闭</a>
		<a href="###" class="btn btn-info" data-dismiss="modal" onclick="_MultiClassStudentSelectButton()">确定</a>		
	</div>
</div>

<script>

//业务页面调用方法	
function _queryStudentByClassCheck(ids,classId,flag)
{
	_initStudentByClassCheckValues(ids,classId,flag);
	_queryStudentByClassCheckSubmit();		
	comp.showModal("_selectStudentByClassCheckModal");
}
//从用户购物车删除
function _studentRemove(event, treeId, treeNode) {

	$('input[name="row_sel_student_multi"]').each(function(){
          var value=$(this).attr("value");
          var obj=eval("["+value+"]");
          if(obj[0].id==treeNode.id){
          	$(this).attr("checked",false);
          	$("#checkClassStudentAll").attr("checked",false);
          }
    });		
}
//打开面板数据初始化
function _initStudentByClassCheckValues(ids,classId,flag)
{
	$('#_selectStudentByClassCheckModal').width(890).css("marginLeft","-380px").css("marginTop","-250px");
	$('#_selectStudentByClassCheckModalBody').height(350).css("max-height","380px");
	$('#_selectedClassStudentTree').width(200).height(300).css("margin-top","0px");
	$('#_studentCheckQueryByClassButton').css("margin-bottom","9px");
	$('#_studentCheckClearByClassButton').css("margin-bottom","9px");
	$("#_checkStudentClassId").val(classId);
	$("#__falg").val(flag);
	$("#_checkName").val("");
	$("#_checkStuNumber").val("");
	
	//选中初始化
	var calssStudentNodes;
	$.ajax({
			async : false,
			cache:false,
			type: 'POST',
			url: comp.contextPath()+"/comp/opt-query/getStudentsJson.do",
			data:"ids="+ids,
			error: function () {
				/*扩展错误提示 */
				comp.message("\u8BF7\u6C42\u5931\u8D25\uFF0C\u8BF7\u7A0D\u540E\u518D\u8BD5!","error");
			},
			success:function(data){
				calssStudentNodes = eval(data); 
			}
		});
		var selectedClassStudentSet = {data:{},view:{showLine:false,selectedMulti: false,showIcon: false},
			edit:{enable:true,showRenameBtn:false,drag:{prev:true,next:true,inner:false}},callback:{onRemove:_studentRemove}};
		$.fn.zTree.init($("#_selectedClassStudentTree"), selectedClassStudentSet, calssStudentNodes);	
	
	//用户ajaxform提交设置
	var ajaxCheckFormOptions = {
        type: "POST",
        success: function(data){
          
                $('input[name="row_sel_student_multi"]').each(function(){
			          var value=$(this).attr("value");
			          var obj=eval("["+value+"]");
			          var checkbox=$(this);
			         
					var userTree = $.fn.zTree.getZTreeObj("_selectedClassStudentTree");
					var users =userTree.getNodes();
					$(users).each(function(){
						if($(this)[0].id==obj[0].id)							
						    checkbox.attr("checked",true);
					 });
			    });	
			    
			    $("#checkClassStudentAll").attr("checked",
			    	$("input[name='row_sel_student_multi']").length == $("input[name='row_sel_student_multi']:checked").length
			    	&& $("input[name='row_sel_student_multi']").length>0? true : false);
        },            
        error: function(){
            comp.message("学生信息查询请求失败，请稍后重试。","error");
        },
        beforeSubmit: function(formData, jqForm, options){
        },
        target: '#_studentsByClassCheckTableDiv'
    };
	$("#_studentByClassCheckQuery").ajaxForm(ajaxCheckFormOptions);	
}
	
function _queryStudentByClassCheckSubmit()
{
	if($('#userQuerypageNo').length>0)
		$('#userQuerypageNo').val('1');
	$('#_studentByClassCheckQuery').submit();
}

//全选 
function checkClassStudentAll(obj) 
{

     $('input[name="row_sel_student_multi"]').attr("checked",obj.checked);
     if($("#checkClassStudentAll").attr("checked")!=null)
         $('input[name="row_sel_student_multi"]').each(function(){ 
         	 addClassStudentFromTable($(this).attr("value"));
         });
     else
         $('input[name="row_sel_student_multi"]').each(function(){ 
         	 removeClassStudentFromTable($(this).attr("value"));
         });
  }

//从table中移除购物车的用户
function removeClassStudentFromTable(value){

	var obj=eval("["+value+"]");
	var userTree = $.fn.zTree.getZTreeObj("_selectedClassStudentTree");
	var users =userTree.getNodes();
	$(users).each(function(){
		if($(this)[0].id==obj[0].id)
			userTree.removeNode($(this)[0]);
	  });
}

//从table中添加购物车的用户
function addClassStudentFromTable(value){

	var userTree = $.fn.zTree.getZTreeObj("_selectedClassStudentTree");
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
function _deleteAllClassStudent(){
	$('input[name="row_sel_student_multi"]').attr("checked",false);
	$("#checkClassStudentAll").attr("checked",false);
	var userTree = $.fn.zTree.getZTreeObj("_selectedClassStudentTree");
	var nodes = userTree.getNodes();
	$(nodes).each(function(){
		userTree.removeNode($(this)[0]);
	});
}
	
//点击checkbox按钮 
function _onClickClassStudentCheckbox(obj)
{
	var $subBox = $("input[name='row_sel_student_multi']");
	$("#checkClassStudentAll").attr("checked",$subBox.length == $("input[name='row_sel_student_multi']:checked").length ? true : false);
	if($(obj).attr("checked")!=null){
		addClassStudentFromTable($(obj).attr("value"));
	}else{
		removeClassStudentFromTable($(obj).attr("value"));
	}
}
	
	
function _MultiClassStudentSelectButton()
{
	var treeObj = $.fn.zTree.getZTreeObj("_selectedClassStudentTree");
	if($("#__falg").val())
	{
		setClassStudentSelectCheckObjValue(treeObj.getNodes());
	}
	else
	{
		var classIds="";
		var names="";
		var i=0;
		$(treeObj.getNodes()).each(function(){
			if(i>0)
			{
				classIds+=",";
				names+=";";
			}
			classIds+=$(this)[0].id;
			names+=	$(this)[0].name;					
			i++;			    
		 });		
		setClassStudentSelectCheckValue(classIds,names);
	}
}

// 初始化学院信息
function initCheckCollege()
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
		  $("#_checkCollegeId").empty();
		  $("<option value=''>请选择</option>").appendTo("#_checkCollegeId");		
		  $.each(data, function(i,item){	
		 		$('<option value='+item.id+'>'+item.name+'</option>').appendTo("#_checkCollegeId");
		  });
		}
	});
}

</script>