<!--班专业选择 -->
<div class="modal hide fade" id="_selectMajorAllCheckModal">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3>专业选择</h3>
	</div>
	<div class="modal-body" id="_selectMajorAllCheckModalBody">
	<div class="row-fluid">
	<div class="span9">
		<div class="row-fluid">
			<div class="span12">
				<form  id="_majorAllCheckQuery"  action="${rc.contextPath}/comp/major/nsm/queryMajorCheckBox.do" method="post">
					<input id="selectedMajorId" name="selectedMajorId" type="hidden"/>	
					<input id="queryMajorId" name="queryMajorId" type="hidden"/>	
					<input id="_setFlag_" name="_setFlag" type="hidden"/>
					<input id="formId_" name="formId_" value="_majorAllCheckQuery"  type="hidden"/>	
					<input id="queryFlag_" name="queryFlag" value="checkbox" type="hidden"/>	
					<div class="row-fluid">
						<div class="span4">	
							学院	
							<select  id="_checkCollegeId_" name="collage.id" aria-controls="dt_gal"  class="span8" onchange="cascade.changeCollage('_checkCollegeId_','_checkMajorId_');">
								<option value="">请选择..</option>
							</select>		
						</div>
						<div class="span4">	
							专业
							<select  id="_checkMajorId_" name="baseMajor.id" aria-controls="dt_gal"  class="span8" >
								<option value="">请选择..</option>
							</select>				
						</div>
						<div class="span4">	
							<input type="button" class="btn btn-info" id="_classCheckQueryButton" onclick="_queryClassCheckSubmit();" value="查 询"/>
							<input type="button" class="btn btn-info" id="_classCheckClearButton" onclick="comp.clearForm('_majorAllCheckQuery')" value="清 空"/>	
						</div>
					</div>
				</form>
				</div>	
				</div>	
				<div class="row-fluid">
					<div class="span12" id="_majorsAllCheckTableDiv">
					</div>
					<input id="_majorCheckAllInfo" name="_majorCheckAllInfo" type="hidden" value=""/>		
				</div>	
			</div>
			
			<div class="span3">
				<ul id="_selectedAllMajor" class="ztree myztree"></ul>
				<a href="###" class="btn btn-info" onclick="javascript:deleteAllEduClass()">全部删除</a>
			</div>	
		</div>
	</div>
	<div class="modal-footer">
		<a href="###" class="btn " data-dismiss="modal">关闭</a>
		<a href="###" class="btn btn-info" data-dismiss="modal" onclick="_MultiEduMajorSelectButton()">确定</a>		
	</div>
</div>

<script>

//业务页面调用方法	
function _queryMajorCheckAll(ids,college)
{   
	if(college != '' && college != null)
		$("#_checkCollegeId_").attr("disabled","disabled");
	_initMajorCheckValues(ids,college);
	_queryClassCheckSubmit();		
	comp.showModal("_selectMajorAllCheckModal");
}
//从用户购物车删除
function classSelectedRemove(event, treeId, treeNode) {

	$('input[name="row_sel_multi_"]').each(function(){
          var value=$(this).attr("value");
          var obj=eval("["+value+"]");
          if(obj[0].id==treeNode.id){
          	$(this).attr("checked",false);
          	$("#checkEduMajorAll").attr("checked",false);
          }
    });		
}
//打开面板数据初始化
function _initMajorCheckValues(ids,college)
{
	$('#_selectMajorAllCheckModal').width(890).css("marginLeft","-380px").css("marginTop","-250px");
	$('#_selectMajorAllCheckModalBody').height(350).css("max-height","380px");
	$('#_selectedAllMajor').width(200).height(300).css("margin-top","0px");
	$('#_classCheckQueryButton').css("margin-bottom","9px");
	$('#_classCheckClearButton').css("margin-bottom","9px");
	if(college != '' && college != null)
	{
		$("#__queryCollegeId").remove();
		$("#_majorAllCheckQuery").append("<input type='hidden' id='__queryCollegeId' name='collage.id' value='"+college+"'/>");
	}else{
		$("#_checkCollegeId_").val(college);
		$("#__queryCollegeId").remove();
	}
	$("#_checkMajorId_").val("");
	//$("#_setFlag").val(flag);
	
	initMajorCheckCollege(college);
	
	//选中初始化
	var classesNodes;
	$.ajax({
			async : false,
			cache:false,
			type: 'POST',
			url: comp.contextPath()+"/comp/opt-query/getMajorsJson.do",
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
		$.fn.zTree.init($("#_selectedAllMajor"), _selectedAllClassesSet, classesNodes);	
	
	//用户ajaxform提交设置
	var ajaxCheckFormOptions = {
        type: "POST",
        success: function(data){
          
                $('input[name="row_sel_multi_"]').each(function(){
			          var value=$(this).attr("value");
			          var obj=eval("["+value+"]");
			          var checkbox=$(this);
			         
					var majorTree = $.fn.zTree.getZTreeObj("_selectedAllMajor");
					var majors =majorTree.getNodes();
					$(majors).each(function(){
						if($(this)[0].id==obj[0].id)							
						    checkbox.attr("checked",true);
					 });
			    });	
			    
			    $("#checkEduMajorAll").attr("checked",
			    	$("input[name='row_sel_multi_']").length == $("input[name='row_sel_multi_']:checked").length
			    	&& $("input[name='row_sel_multi_']").length>0? true : false);
        },            
        error: function(){
            comp.message("班级信息查询请求失败，请稍后重试。","error");
        },
        beforeSubmit: function(formData, jqForm, options){
        },
        target: '#_majorsAllCheckTableDiv'
    };
	$("#_majorAllCheckQuery").ajaxForm(ajaxCheckFormOptions);	
}
	
function _queryClassCheckSubmit()
{   
    var majorId = $("#_checkMajorId_").val();
	if($('#userQuerypageNo').length>0)
		$('#userQuerypageNo').val('1');
	$('#queryMajorId').val(majorId);
	$('#_majorAllCheckQuery').submit();
}

//全选 
function checkEduMajorAll(obj) 
{

     $('input[name="row_sel_multi_"]').attr("checked",obj.checked);
     if($("#checkEduMajorAll").attr("checked")!=null)
         $('input[name="row_sel_multi_"]').each(function(){ 
         	 addClassFromTable($(this).attr("value"));
         });
     else
         $('input[name="row_sel_multi_"]').each(function(){ 
         	 removeEduClassFromTable($(this).attr("value"));
         });
  }

//从table中移除购物车的用户
function removeEduClassFromTable(value){

	var obj=eval("["+value+"]");
	var majorTree = $.fn.zTree.getZTreeObj("_selectedAllMajor");
	var majors =majorTree.getNodes();
	$(majors).each(function(){
		if($(this)[0].id==obj[0].id)
			majorTree.removeNode($(this)[0]);
	  });
}

//从table中添加购物车的用户
function addClassFromTable(value){
	
	var majorTree = $.fn.zTree.getZTreeObj("_selectedAllMajor");
	var majors =majorTree.getNodes();
	var obj=eval("["+value+"]");
	var tag= true;
	$(majors).each(function(){
		if($(this)[0].id==obj[0].id){
			tag=false;
			return;
		}
	  });
	if(tag)
		majorTree.addNodes(null,eval("["+value+"]"));
}

// 清空购物车
function deleteAllEduClass(){
	$('input[name="row_sel_multi_"]').attr("checked",false);
	$("#checkEduMajorAll").attr("checked",false);
	var majorTree = $.fn.zTree.getZTreeObj("_selectedAllMajor");
	var nodes = majorTree.getNodes();
	$(nodes).each(function(){
		majorTree.removeNode($(this)[0]);
	});
}
	
//点击checkbox按钮 
function _onClickEduMajorCheckbox(obj)
{
	var $subBox = $("input[name='row_sel_multi_']");
	$("#checkEduMajorAll").attr("checked",$subBox.length == $("input[name='row_sel_multi_']:checked").length ? true : false);
	if($(obj).attr("checked")!=null){
		addClassFromTable($(obj).attr("value"));
	}else{
		removeEduClassFromTable($(obj).attr("value"));
	}
}
	
function _MultiEduMajorSelectButton()
{
	var treeObj = $.fn.zTree.getZTreeObj("_selectedAllMajor");
	if($("#_setFlag").val())
	{
		setMultiEduClassSelectObjValue(treeObj.getNodes());
	}
	else
	{
		var majorIds="";
		var names="";
		var i=0;
		$(treeObj.getNodes()).each(function(){
			if(i>0)
			{
				majorIds+=",";
				names+=";";
			}
			majorIds+=$(this)[0].id;
			names+=	$(this)[0].name;					
			i++;			    
		 });
		setMajorSelectValue(majorIds,names);
	}
}

// 初始化学院信息
function initMajorCheckCollege(collegeId)
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
			  $("#_checkCollegeId_").empty();
			  $("<option value=''>请选择</option>").appendTo("#_checkCollegeId_");		
			  $.each(data, function(i,item){
		 		 if(item.id == collegeId)
		 		 {	
		 			$('<option value='+item.id+' selected>'+item.name+'</option>').appendTo("#_checkCollegeId_");
		 			cascade.changeCollage('_checkCollegeId_','_checkMajorId_');
	 			}
	 			 else
		 			$('<option value='+item.id+'>'+item.name+'</option>').appendTo("#_checkCollegeId_");
			  });
		 }
	});
}

</script>