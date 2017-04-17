
 <style>
 #selectedItem li a {padding-right:20px;} 
 </style>
<!--课程选择多选 -->
<div class="modal hide fade" id="selectCoursesModal">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3>题目选择</h3>
	</div>
	<div class="modal-body" id="selectCoursesModalBody">
		<div class="row-fluid">
			<div class="span9">
				<div class="row-fluid">
						<div class="span12" >
							
							<form  id="itemQuery"  action="${rc.contextPath}/question/itemManage/comp/queryItemList.do" method="post">
								<input id="__itemids" name="_itemids" type="hidden" value=""/>
								<div class="row-fluid">
									<div class="span4">
										<div class="span4">
											<label>题目名称 </label>
										</div>
											<input id="_itemName" name="itemName"  value="${(itemName!"")?html}" class="span8" maxlength="255"/>
											<input type="hidden" id="paperType" name="paperType"  value=""/>
									</div>
									
									<div class="span4">
										<div class="span4">
											<label>问题类型</label>
										</div>
											<select size="1" id="_itemCategoryId" name="itemCategoryId" aria-controls="dt_gal" class="span8" >
												<option value="" />请选择..</option>
												<#if itemCategoryId??>
													<#list paperTypeList as d>
														<#if itemCategoryId==d.id >
															<option  value="${d.id}" selected="selected" />${d.name?html}</option>
														<#else>
															<option value="${d.id}" />${d.name?html}</option>
														</#if>
													</#list>
												<#else>
													<#list paperTypeList as d>
														<option  value="${d.id}"/>${d.name?html}</option>
													</#list>
												</#if>
											</select>
									</div>
									
									<div class="span4">
										<div class="span2">
											<label>题型</label>
										</div>
												<select size="1" id="_itemTypeId" name="itemTypeId" aria-controls="dt_gal" class="span8">
													<option value="" />请选择..</option>
													<#if itemTypeId??>
														<#list itemTypeList as r>
															<#if itemTypeId==r.id >
																<option  value="${r.id}" selected="selected">${r.name}</option>
															<#else>
																<option value="${r.id}">${r.name?html}</option>
															</#if>
														</#list>
													<#else>
														<#list itemTypeList as r>
															<option  value="${r.id}">${r.name?html}</option>
														</#list>
													</#if>
											 </select>
										</div>
									</div>	
							<input type="button" class="btn btn-info" id="courseQueryButton" onclick="queryCourseSubmit()" value="查 询"/>	
							</form>
							
						</div>
				</div>
				<div class="row-fluid">
					<div class="span12" id="coursesTableDiv">
					</div>					
				</div>		
			</div>
			<div class="span3">
				<ul id="selectedItem" class="ztree myztree"></ul>
				<a href="###" class="btn btn-info" onclick="javascript:_deleteAllCourses()" style="margin:5px 0;">全部删除</a>
			</div>
		</div>
	</div>
	
	<div class="modal-footer">
		<a href="###" class="btn " data-dismiss="modal" >取 消</a>
		<a href="###" class="btn btn-info" onclick="_getCourseInfos()">确 定</a>		
	</div>
</div>


<script>

	
	
	//从用户购物车删除
	function _courseRemove(event, treeId, treeNode) {
	
		$('input[name="row_sel"]').each(function(){
		
	          var value=$(this).attr("value");
	          var obj=eval("["+value+"]");
	          if(obj[0].Id==treeNode.Id){
	          	$(this).attr("checked",false);
	          	$("#course-checkbox-all").attr("checked",false);
	          }
	    });		
	}
	
	//从table中移除购物车的用户
	function _removeCourseFromTable(value){
	
		var obj=eval("["+value+"]");
		var courseTree = $.fn.zTree.getZTreeObj("selectedItem");
		var courses =courseTree.getNodes();
		$(courses).each(function(){
			if($(this)[0].Id==obj[0].Id)
				courseTree.removeNode($(this)[0]);
		  });
	}
	
	//从table中添加购物车
	function _addCourseFromTable(value){
		var courseTree = $.fn.zTree.getZTreeObj("selectedItem");
		var courses =courseTree.getNodes();
		var obj=eval("["+value+"]");
		var tags= true;
		
		$(courses).each(function(){
			if($(this)[0].Id==obj[0].Id){
				tags=false;
				return;
				}
		  });
		if(tags)
			courseTree.addNodes(null,eval("["+value+"]"));
	}
	// 全选按钮 单击	
	function _checkCourseAll(obj) {
         $('input[name="row_sel"]').attr("checked",obj.checked);
         if($("#course-checkbox-all").attr("checked")!=null)
         {
             $('input[name="row_sel"]').each(function(){
             	 _addCourseFromTable($(this).attr("value"));
             });
         }
         else
         {
             $('input[name="row_sel"]').each(function(){ 
             	 _removeCourseFromTable($(this).attr("value"));
             });
         }
      }
      
      //单条记录 单击
      function  _onClickCheckCoursebox(obj){
 			var $subBox = $("input[name='row_sel']");
        	$("#course-checkbox-all").attr("checked",$subBox.length == $("input[name='row_sel']:checked").length ? true : false);
        	if($(obj).attr("checked")!=null){
        	
       			_addCourseFromTable($(obj).attr("value"));
        	}else{
        		_removeCourseFromTable($(obj).attr("value"));
        	}
		}
    
	
	//获取课程值 并返回给业务调用
	function _getCourseInfos(){
	
		var treeObj = $.fn.zTree.getZTreeObj("selectedItem");
		var itemIds="";
		var itemNames="";
		var itemCategoryTypes="";
		var itemTypes="";
		var i=0;
		$(treeObj.getNodes()).each(function(){
			if(i>0)
			{
				itemIds+=",";
				itemNames+=",";
				itemCategoryTypes+=",";
				itemTypes+=",";
			}
			itemIds+=$(this)[0].Id;	
			itemNames+=$(this)[0].name;	
			itemCategoryTypes+=$(this)[0].itemCategoryTypeId;	
			itemTypes+=$(this)[0].itemTypeId;	
			i++;			    
		 });		
		comp.hideModal("selectCoursesModal");
		//赋值回调
		getSelectedItem(itemIds,itemNames,itemCategoryTypes,itemTypes);
	
	}

	
	function queryCoursesByTreeId(event, treeId, treeNode){
		var treeObj = $.fn.zTree.getZTreeObj("selectCoursesTree");
		var node = treeObj.getNodes()[0];
		if(treeObj.id!=node.id)//组机构根节点不传递 组织机构id给后台
			$("#_courseTreeIds").val(treeNode.id);
		 
		$("#selectCourseValue").val(""); 
		$('#itemQuery').submit();
	}
	//打开面板数据初始化
	function initValues(ids,status){
	
		$('#selectCoursesModal').width(910).css("marginLeft","-450px").css("marginTop","-250px");
		$('#selectCoursesModalBody').css("max-height","380px");
		$('#selectedItem').width(200).height(300).css("margin-top","0px");
		$('#courseQueryButton').css("margin-bottom","9px");
		$('#_itemName').val('');
		$("#_itemTypeId").val("");		
		$("#_itemCategoryId").val("");
		$("#_itemids").val(ids);
		if(status!=null&&status!='')
			$("#userCourses_status").val(status);
			
		var courseNodes;
		$.ajax({
				async : false,
				cache:false,
				type: 'POST',
				url: comp.contextPath()+"/question/itemManage/comp/getItemJson.do",
				data:"ids="+ids,
				error: function () {
					/*扩展错误提示 */
					comp.message("\u8BF7\u6C42\u5931\u8D25\uFF0C\u8BF7\u7A0D\u540E\u518D\u8BD5!","error");
				},
				success:function(data){
					courseNodes = eval(data); 
				}
			});	
			
		var selectedCourseSet = {data:{},view:{showLine:false,selectedMulti: false,showIcon: false},
		edit:{removeTitle:"移除",enable:true,showRenameBtn:false,drag:{prev:true,next:true,inner:false}},callback:{onRemove:_courseRemove}};
				
		$.fn.zTree.init($("#selectedItem"), selectedCourseSet, courseNodes);	
		
		//ajaxform提交设置
		var ajaxFormOptions = {
            type: "POST",
            success: function(data){
            
          
                $('input[name="row_sel"]').each(function(){
		
			          var value=$(this).attr("value");
			          var obj=eval("["+value+"]");
			          var checkbox=$(this);
			          var courseTree = $.fn.zTree.getZTreeObj("selectedItem");
					  var courses =courseTree.getNodes();
					  $(courses).each(function(){
						  if($(this)[0].Id==obj[0].Id)							
						      checkbox.attr("checked",true);
					  });
			    });	
			    
			    $("#course-checkbox-all").attr("checked",
			    	$("input[name='row_sel']").length == $("input[name='row_sel']:checked").length
			    	&& $("input[name='row_sel']").length>0? true : false);
			    
			    	
			    $('#coursesTableDiv a[rel=popover]').each(function(){
			   	 	$(this).popover({trigger:'hover',html:true});
			    });
			    
			   
            },            
            error: function(){
                comp.message("题目查询请求失败，请稍后重试。","error");
            },
            beforeSubmit: function(formData, jqForm, options){
            	           	            	
            },
            target: '#coursesTableDiv'
        };
		
		$('#itemQuery').ajaxForm(ajaxFormOptions);		
		
	}
	
	function queryCourseSubmit(){
		var  questionNaireType = $("#paperCategory").val();
		if($('#userQuerypageNo').length>0)
			$('#userQuerypageNo').val('1');
		$('#itemQuery').submit();
	}
	//删除所有用户
	function _deleteAllCourses(){
	
		$('input[name="row_sel"]').attr("checked",false);
		$("#course-checkbox-all").attr("checked",false);
		var userTree = $.fn.zTree.getZTreeObj("selectedItem");
		var nodes = userTree.getNodes();
		
		$(nodes).each(function(){
			userTree.removeNode($(this)[0]);
		});

	}
</script>