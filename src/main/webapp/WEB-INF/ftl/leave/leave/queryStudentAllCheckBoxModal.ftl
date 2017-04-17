<!--学生选择 -->
<div class="modal hide fade" id="_selectStudentAllCheckModal">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3>选择需办理户口手续学生</h3>
	</div>
	<div class="modal-body" id="_selectStudentAllCheckModalBody">
	<div class="row-fluid">
	<div class="span9">
		<div class="row-fluid">
			<div class="span12">
				<form  id="_studentAllCheckQuery"  action="${rc.contextPath}/comp/leave/nsm/queryCheckStudent.do" method="post">
					<input id="selectedStudentId" name="selectedStudentId" type="hidden"/>	
					<input id="_setFlag" name="_setFlag" type="hidden"/>
					<input id="formId" name="formId" value="_studentAllCheckQuery"  type="hidden"/>	
					<input id="queryFlag" name="queryFlag" value="checkbox" type="hidden"/>	
					<div class="row-fluid">
						<div class="span4">	
							学院	
							<select  id="_checkCollegeId" name="college.id" aria-controls="dt_gal"  class="span8" onchange="cascade.changeCollage('_checkCollegeId','_checkMajorId','_checkClassId');">
								<option value="">请选择..</option>
							</select>		
						</div>
						<div class="span4">	
							专业
							<select  id="_checkMajorId" name="major.id" aria-controls="dt_gal"  class="span8 emptySelect" onchange="cascade.changeMajor('_checkMajorId','_checkClassId');">
								<option value="">请选择..</option>
							</select>				
						</div>
						<div class="span4">	
							班级	
							<select  id="_checkClassId" name="classId.id" aria-controls="dt_gal"  class="span8 emptySelect">
								<option value="">请选择..</option>
							</select>				
						</div>
					</div>
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
							<input type="button" class="btn btn-info" id="_studentCheckQueryButton" onclick="_queryStudentCheckSubmit();" value="查 询"/>
							<input type="button" class="btn btn-info" id="_studentCheckClearButton" onclick="comp.clearForm('_studentAllCheckQuery')" value="清 空"/>	
						</div>
					</div>
				</form>
				</div>	
				</div>	
				<div class="row-fluid">
					<div class="span12" id="_studentsAllCheckTableDiv">
					</div>	
				</div>	
			</div>
			
			<div class="span3">
				<ul id="_selectedAllClassStudent" class="ztree myztree"></ul>
				<a href="###" class="btn btn-info" onclick="javascript:deleteAllEduClass()">全部删除</a>
			</div>	
		</div>
	</div>
	<div class="modal-footer">
		<a href="###" class="btn " data-dismiss="modal">关闭</a>
		<a href="###" class="btn btn-info" data-dismiss="modal" onclick="_MultiEduClassSelectButton()">确定</a>		
	</div>
</div>

<script>

//业务页面调用方法	
function _queryStudentCheckAll(ids,flag)
{
	_initCheckValues(ids,flag);
	_queryStudentCheckSubmit();		
	comp.showModal("_selectStudentAllCheckModal");
}
//从用户购物车删除
function classStudentRemove(event, treeId, treeNode) {

	$('input[name="row_sel_multi"]').each(function(){
          var value=$(this).attr("value");
          var obj=eval("["+value+"]");
          if(obj[0].id==treeNode.id){
          	$(this).attr("checked",false);
          	$("#checkEduClassAll").attr("checked",false);
          }
    });		
}
//打开面板数据初始化
function _initCheckValues(ids,flag)
{
	$('#_selectStudentAllCheckModal').width(890).css("marginLeft","-380px").css("marginTop","-250px");
	$('#_selectStudentAllCheckModalBody').height(350).css("max-height","380px");
	$('#_selectedAllClassStudent').width(200).height(300).css("margin-top","0px");
	$('#_studentCheckQueryButton').css("margin-bottom","9px");
	$('#_studentCheckClearButton').css("margin-bottom","9px");
	$("#_checkCollegeId").val("");
	$("#_checkMajorId").val("");
	$("#_checkClassId").val("");
	$("#_checkName").val("");
	$("#_setFlag").val(flag);
	$("#_checkStuNumber").val("");
	
	initCheckCollege();
	
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
		var _selectedAllClassStudentSet = {data:{},view:{showLine:false,selectedMulti: false,showIcon: false},
			edit:{enable:true,showRenameBtn:false,drag:{prev:true,next:true,inner:false}},callback:{onRemove:classStudentRemove}};
		$.fn.zTree.init($("#_selectedAllClassStudent"), _selectedAllClassStudentSet, calssStudentNodes);	
	
	//用户ajaxform提交设置
	var ajaxCheckFormOptions = {
        type: "POST",
        success: function(data){
          
                $('input[name="row_sel_multi"]').each(function(){
			          var value=$(this).attr("value");
			          var obj=eval("["+value+"]");
			          var checkbox=$(this);
			         
					var userTree = $.fn.zTree.getZTreeObj("_selectedAllClassStudent");
					var users =userTree.getNodes();
					$(users).each(function(){
						if($(this)[0].id==obj[0].id)							
						    checkbox.attr("checked",true);
					 });
			    });	
			    
			    $("#checkEduClassAll").attr("checked",
			    	$("input[name='row_sel_multi']").length == $("input[name='row_sel_multi']:checked").length
			    	&& $("input[name='row_sel_multi']").length>0? true : false);
        },            
        error: function(){
            comp.message("学生信息查询请求失败，请稍后重试。","error");
        },
        beforeSubmit: function(formData, jqForm, options){
        },
        target: '#_studentsAllCheckTableDiv'
    };
	$("#_studentAllCheckQuery").ajaxForm(ajaxCheckFormOptions);	
}
	
function _queryStudentCheckSubmit()
{
	if($('#userQuerypageNo').length>0)
		$('#userQuerypageNo').val('1');
	$('#_studentAllCheckQuery').submit();
}

//全选 
function checkEduClassAll(obj) 
{

     $('input[name="row_sel_multi"]').attr("checked",obj.checked);
     if($("#checkEduClassAll").attr("checked")!=null)
         $('input[name="row_sel_multi"]').each(function(){ 
         	 addStudentFromTable($(this).attr("value"));
         });
     else
         $('input[name="row_sel_multi"]').each(function(){ 
         	 removeEduStudentFromTable($(this).attr("value"));
         });
  }

//从table中移除购物车的用户
function removeEduStudentFromTable(value){

	var obj=eval("["+value+"]");
	var userTree = $.fn.zTree.getZTreeObj("_selectedAllClassStudent");
	var users =userTree.getNodes();
	$(users).each(function(){
		if($(this)[0].id==obj[0].id)
			userTree.removeNode($(this)[0]);
	  });
}

//从table中添加购物车的用户
function addStudentFromTable(value){

	var userTree = $.fn.zTree.getZTreeObj("_selectedAllClassStudent");
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
function deleteAllEduClass(){
	$('input[name="row_sel_multi"]').attr("checked",false);
	$("#checkEduClassAll").attr("checked",false);
	var userTree = $.fn.zTree.getZTreeObj("_selectedAllClassStudent");
	var nodes = userTree.getNodes();
	$(nodes).each(function(){
		userTree.removeNode($(this)[0]);
	});
}
	
//点击checkbox按钮 
function _onClickEduClassCheckbox(obj)
{
	var $subBox = $("input[name='row_sel_multi']");
	$("#checkEduClassAll").attr("checked",$subBox.length == $("input[name='row_sel_multi']:checked").length ? true : false);
	if($(obj).attr("checked")!=null){
		addStudentFromTable($(obj).attr("value"));
	}else{
		removeEduStudentFromTable($(obj).attr("value"));
	}
}
	
function _MultiEduClassSelectButton()
{
	var treeObj = $.fn.zTree.getZTreeObj("_selectedAllClassStudent");
	if($("#_setFlag").val())
	{
		setMultiEduClassSelectObjValue(treeObj.getNodes());
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
		setMultiEduClassSelectValue(classIds,names);
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