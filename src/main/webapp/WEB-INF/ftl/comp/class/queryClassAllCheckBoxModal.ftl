<!--班级选择 -->
<div class="modal hide fade" id="_selectClassAllCheckModal">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3>班级选择</h3>
	</div>
	<div class="modal-body" id="_selectClassAllCheckModalBody">
	<div class="row-fluid">
	<div class="span9">
		<div class="row-fluid">
			<div class="span12">
				<form  id="_classAllCheckQuery"  action="${rc.contextPath}/comp/class/nsm/queryClassCheckBox.do" method="post">
					<input id="selectedClassId" name="selectedClassId" type="hidden"/>	
					<input id="_setFlag" name="_setFlag" type="hidden"/>
					<input id="formId" name="formId" value="_classAllCheckQuery"  type="hidden"/>	
					<input id="queryFlag" name="queryFlag" value="checkbox" type="hidden"/>	
					<div class="row-fluid">
						<div class="span4">	
							学院	
							<select  id="_checkCollegeId" name="major.collage.id" aria-controls="dt_gal"  class="span8" onchange="cascade.changeCollage('_checkCollegeId','_checkMajorId','');">
								<option value="">请选择..</option>
							</select>		
						</div>
						<div class="span4">	
							专业
							<select  id="_checkMajorId" name="major.id" aria-controls="dt_gal"  class="span8" >
								<option value="">请选择..</option>
							</select>				
						</div>
						<div class="span4">	
							<input type="button" class="btn btn-info" id="_classCheckQueryButton" onclick="_queryClassCheckSubmit();" value="查 询"/>
							<input type="button" class="btn btn-info" id="_classCheckClearButton" onclick="comp.clearForm('_classAllCheckQuery')" value="清 空"/>	
						</div>
					</div>
				</form>
				</div>	
				</div>	
				<div class="row-fluid">
					<div class="span12" id="_classesAllCheckTableDiv">
					</div>	
				</div>	
			</div>
			
			<div class="span3">
				<ul id="_selectedAllClass" class="ztree myztree"></ul>
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
function _queryClassCheckAll(ids,flag)
{
	_initCheckValues(ids,flag);
	_queryClassCheckSubmit();		
	comp.showModal("_selectClassAllCheckModal");
}
//从用户购物车删除
function classSelectedRemove(event, treeId, treeNode) {

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
	$('#_selectClassAllCheckModal').width(890).css("marginLeft","-380px").css("marginTop","-250px");
	$('#_selectClassAllCheckModalBody').height(350).css("max-height","380px");
	$('#_selectedAllClass').width(200).height(300).css("margin-top","0px");
	$('#_classCheckQueryButton').css("margin-bottom","9px");
	$('#_classCheckClearButton').css("margin-bottom","9px");
	$("#_checkCollegeId").val("");
	$("#_checkMajorId").val("");
	$("#_checkClassId").val("");
	$("#_setFlag").val(flag);
	
	initCheckCollege();
	
	//选中初始化
	var classesNodes;
	$.ajax({
			async : false,
			cache:false,
			type: 'POST',
			url: comp.contextPath()+"/comp/opt-query/getClassesJson.do",
			data:"ids="+ids,
			error: function () {
				/*扩展错误提示 */
				comp.message("\u8BF7\u6C42\u5931\u8D25\uFF0C\u8BF7\u7A0D\u540E\u518D\u8BD5!","error");
			},
			success:function(data){
				classesNodes = eval(data); 
			}
		});
		var _selectedAllClassesSet = {data:{},view:{showLine:false,selectedMulti: false,showIcon: false},
			edit:{enable:true,showRenameBtn:false,drag:{prev:true,next:true,inner:false}},callback:{onRemove:classSelectedRemove}};
		$.fn.zTree.init($("#_selectedAllClass"), _selectedAllClassesSet, classesNodes);	
	
	//用户ajaxform提交设置
	var ajaxCheckFormOptions = {
        type: "POST",
        success: function(data){
          
                $('input[name="row_sel_multi"]').each(function(){
			          var value=$(this).attr("value");
			          var obj=eval("["+value+"]");
			          var checkbox=$(this);
			         
					var userTree = $.fn.zTree.getZTreeObj("_selectedAllClass");
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
            comp.message("班级信息查询请求失败，请稍后重试。","error");
        },
        beforeSubmit: function(formData, jqForm, options){
        },
        target: '#_classesAllCheckTableDiv'
    };
	$("#_classAllCheckQuery").ajaxForm(ajaxCheckFormOptions);	
}
	
function _queryClassCheckSubmit()
{
	if($('#userQuerypageNo').length>0)
		$('#userQuerypageNo').val('1');
	$('#_classAllCheckQuery').submit();
}

//全选 
function checkEduClassAll(obj) 
{

     $('input[name="row_sel_multi"]').attr("checked",obj.checked);
     if($("#checkEduClassAll").attr("checked")!=null)
         $('input[name="row_sel_multi"]').each(function(){ 
         	 addClassFromTable($(this).attr("value"));
         });
     else
         $('input[name="row_sel_multi"]').each(function(){ 
         	 removeEduClassFromTable($(this).attr("value"));
         });
  }

//从table中移除购物车的用户
function removeEduClassFromTable(value){

	var obj=eval("["+value+"]");
	var userTree = $.fn.zTree.getZTreeObj("_selectedAllClass");
	var users =userTree.getNodes();
	$(users).each(function(){
		if($(this)[0].id==obj[0].id)
			userTree.removeNode($(this)[0]);
	  });
}

//从table中添加购物车的用户
function addClassFromTable(value){
	
	var userTree = $.fn.zTree.getZTreeObj("_selectedAllClass");
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
	var userTree = $.fn.zTree.getZTreeObj("_selectedAllClass");
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
		addClassFromTable($(obj).attr("value"));
	}else{
		removeEduClassFromTable($(obj).attr("value"));
	}
}
	
function _MultiEduClassSelectButton()
{
	var treeObj = $.fn.zTree.getZTreeObj("_selectedAllClass");
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