<html>
<title>菜单管理</title>
<head>
<script type="text/javascript" src="${rc.contextPath}/lib/ztree/js/jquery.ztree.exhide-3.5.min.js"></script>
<script>
//-----------------------编辑区操作-----------------------------------------------------
//-初始化---------------
//菜单级别设置
			var varMenuLevel=3;
//树基本属性配置
			var setting = {
				view: {
					selectedMulti: false,
					dblClickExpand: true,
					showLine: true
				},
				data: {
					simpleData: {
						enable: true
						}
					},
				callback: {
					onClick: getChildMenuList
				}
			};
		//获取子菜单列表
		function getChildMenuList(e,treeId, Nodes){
			var treeObj = comp.getTreeObj("tree");
			//treeObj.expandNode(Nodes);//单击展开父节点
			var nodes = treeObj.getSelectedNodes();//选择的节点对象
			$("#menuTreeId").val(nodes[0].id);
			if(nodes[0].level!=3){
				$("#smpl_tbl").show();
				$("#addChildbtn").show();			
				$("#smpl_tbl").load("${rc.contextPath}/res/menuManage/nsm/childlist.do",{"pId":nodes[0].id,"level":nodes[0].level},function(){});
			}else{
				$("#smpl_tbl").hide();
				$("#addChildbtn").hide();
			}
		}
		 //初始化新增页面
		 function popAddWin_(){
		 	$(".addMenuForm").compReset();
			var treeObj = comp.getTreeObj("tree");
		 	var nodes = treeObj.getSelectedNodes();
		 	if (nodes.length == 0) {
				//$("#fathermenu").html("");
				comp.message("请选择一个节点进行操作","error");
				return;
			}
			if(nodes[0].level>=varMenuLevel){
				comp.message("该菜单已经是末级菜单，不能再增加下级！","error");
				return;
			}
		 	$("#fathermenu").html(nodes[0].name);
		 	if(nodes[0].level==varMenuLevel-1){
			 	$("#menuIconDiv").hide();
		 	}else{
		 		$("#menuIconDiv").show();
		 	}
		 	$("#iconShow").removeClass();
			comp.showModal('addModal');
		 }
		 //初始化编辑页面
		 function popEditWin(id){
			var treeObj = comp.getTreeObj("tree");
			var node = treeObj.getNodeByParam("id", id, null);
			var pnode=node.getParentNode();
		 	$("#hpid").val(id);
		 	$("#edittemp").load("${rc.contextPath}/res/menuManage/nsm/initEditMenu.do",{"id":id,"level":node.level,"fatherMenu":pnode.name},function(){
				initEditValidate();
				$(".addMenuForm").compReset();
				ob();
		 	});
			comp.showModal('editModal');
		 }
		 //初始调整页面
		 function popMoveWin(id){
		 $("#moveCurTreeId").val(id);
		 	var Nodes;	
			$.ajax({
				async : false,
				cache:false,
				type: 'POST',
				dataType : "json",
				url: "${rc.contextPath}/res/menuManage/initMenuTree.do",
				error: function () {//请求失败处理函数
					comp.message("请求失败，请稍后再试","error");
				},
				success:function(data){ //请求成功后处理函数。  
					Nodes = data;   //把后台封装好的简单Json格式赋给treeNodes
				}
			});
			$.fn.zTree.init($("#targetTree"), setting, Nodes);
			var treeObj = comp.getTreeObj("targetTree");
			var node = treeObj.getNodeByParam("id", id, null);
			treeObj.hideNode(node);
			comp.showModal("treeModal");
		 }
		 
		 //初始化菜单操作列表页面
		 var optTreesetting = {
			check: {
				enable: true
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			view:{
				showLine:false,
			}
		};
		//弹出显示菜单操作列表页面
		 function popMenuOptList(id){
		 	var Nodes;
			$.ajax({
				async : false,
				cache:false,
				type: 'POST',
				dataType : "json",
				url: "${rc.contextPath}/res/menuManage/initOptTree.do",
				data:{id:id},
				error: function () {//请求失败处理函数
					comp.message("请求失败，请稍后再试","error");
				},
				success:function(data){ //请求成功后处理函数。  
					Nodes = data;   //把后台封装好的简单Json格式赋给treeNodes
				}
			});
			$.fn.zTree.init($("#optTree"), optTreesetting, Nodes);
			$("#menuId").val(id);
			comp.showModal('optTreeModal');
		 }
//--操作-----------------------------
//增加节点
		function addTreeNode_(){
			var treeObj = comp.getTreeObj("tree");
			var nodes = treeObj.getSelectedNodes();
			var pnode = nodes[0];
			var treeNode;
			var menuname=$("#menuname").val();
			var menulink=$("#menulink").val();
			var comments=$("#comments").val();
			var menuname=$("#menuname").val();
			var classCode=$("#classCode").val();
			if($(".addMenuForm").compValidator().form()){
				var url="${rc.contextPath}/res/menuManage/addMenu.do";
				var data;
				if (pnode) { 
					data={menuname:menuname,menulink:menulink,comments:comments,pId:pnode.id,classCode:classCode};
				} else {//创建第一个根节点
					data={menuname:menuname,menulink:menulink,comments:comments,pId:null,classCode:classCode};
				}
				$.ajax({
					async :false,
					cache :false,
					timeout: 100000,
					type:"POST",
					url: url,
					data:data,
					error: function () {//请求失败处理函数
						comp.message("请求失败，请稍后再试","error");
						comp.hideModal('addModal');
						return;
					},
					success:function(data){ //请求成功后处理函数。  
						if (pnode) {
							treeNode = treeObj.addNodes(pnode, {id:(data), pId:pnode.id,name:(menuname)});
						} else {
							treeNode = treeObj.addNodes(null, {id:(data), pId:null,name:(menuname)});
						}
						treeObj.refresh();
						treeObj.selectNode(pnode);
						comp.hideModal('addModal');
						comp.message("菜单添加成功！");
						$("#smpl_tbl").load("${rc.contextPath}/res/menuManage/nsm/childlist.do",{"pId":nodes[0].id,"level":nodes[0].level},function(){});
					}
				});
			}
		}
		
//删除菜单
		function delTreeNode(id){
			var treeObj = comp.getTreeObj("tree");
			var node = treeObj.getNodeByParam("id", id, null);
			var pnode=node.getParentNode();
			comp.confirm("确定要删除"+node.name+"菜单",function(r){
				if(r){
					$.ajax({
						async :false,
						cache :false,
						dataType :"text",
						type:"POST",
						timeout: 100000,
						url: "${rc.contextPath}/res/menuManage/deleteMenu.do?id="+node.id,
						error: function () {//请求失败处理函数
							comp.message("请求失败，请稍后再试","error");
							return;
						},
						success:function(data){ //请求成功后处理函数。  
							treeObj.removeNode(node);
							comp.message("菜单删除成功！");
							$("#smpl_tbl").load("${rc.contextPath}/res/menuManage/nsm/childlist.do",{"pId":pnode.id,"level":pnode.level},function(){});
						}
					});
				}
			});
		}
//编辑菜单
		function editTreeNode(){
			var pId=$("#hpid").val();
			var treeObj = comp.getTreeObj("tree");
			var node = treeObj.getNodeByParam("id", pId, null);
			var pnode=node.getParentNode();
			var menuname=$("#menuname_").val();
			var menulink=$("#menulink_").val();
			var comments=$("#comments_").val();
			var classCode=$("#classCode_").val();
			
			if($(".editMenuForm").compValidator().form()){
				$.ajax({
					async :false,
					cache :false,
					timeout: 100000,
					type:"POST",
					url: "${rc.contextPath}/res/menuManage/editMenu.do",
					data:{menuname:menuname,menulink:menulink,comments:comments,id:node.id,classCode:classCode},
					error: function () {//请求失败处理函数
						comp.message("请求失败，请稍后再试","error");
						return;
					},
					success:function(data){ //请求成功后处理函数。  
						node.name=$("#menuname_").val();
						treeObj.updateNode(node);	
						comp.hideModal('editModal');
						comp.message("菜单信息修改成功！");
						$("#smpl_tbl").load("${rc.contextPath}/res/menuManage/nsm/childlist.do",{"pId":pnode.id,"level":pnode.level},function(){});
					}
				});
			}
		}
		
//上移
		function upTreeNode(id){
			var treeObj = comp.getTreeObj("tree");
			var node = treeObj.getNodeByParam("id", id, null);
			var pnode=node.getParentNode();
            if(node.isFirstNode){
           	 	comp.message("已移动到第一个节点，无法再次上移","error");
                return;
            }
            var preNode = node.getPreNode();
             $.ajax({
				async :false,
				cache :false,
				type:"POST",
				dataType :"text",
				timeout: 100000,
				url: "${rc.contextPath}/res/menuManage/upDownMenu.do",
				data:{sourceId:node.id,targetId:preNode.id},
				error: function () {//请求失败处理函数
					comp.message("请求失败，请稍后再试","error");
					return;
				},
				success:function(data){ //请求成功后处理函数。  
					treeObj.moveNode(preNode,node,"prev");
					$("#smpl_tbl").load("${rc.contextPath}/res/menuManage/nsm/childlist.do",{"pId":pnode.id,"level":pnode.level},function(){});
				}
			});
            
		}
//下移
		function downTreeNode(id){
		 	var treeObj = comp.getTreeObj("tree");
			var node = treeObj.getNodeByParam("id", id, null);
			var pnode=node.getParentNode();
            if(node.isLastNode){
            	comp.message("已移动到最后一个节点，无法再次下移","error");
                return;
            }
            var preNode = node.getNextNode();
	         $.ajax({
				async :false,
				cache :false,
				type:"POST",
				dataType :"text",
				timeout: 100000,
				url: "${rc.contextPath}/res/menuManage/upDownMenu.do",
				data:{sourceId:node.id,targetId:preNode.id},
				error: function () {//请求失败处理函数
					comp.message("请求失败，请稍后再试","error");
					return;
				},
				success:function(data){ //请求成功后处理函数。  
					treeObj.moveNode(preNode,node,"next");
					$("#smpl_tbl").load("${rc.contextPath}/res/menuManage/nsm/childlist.do",{"pId":pnode.id,"level":pnode.level},function(){});
				}
			});
        }
//调整
        function moveTreeNode(){
            var id=$("#moveCurTreeId").val();
        	var curObj = comp.getTreeObj("tree");//原对象
        	var targetObj = comp.getTreeObj("targetTree");//目标对象
        	var targetNodes = targetObj.getSelectedNodes();//目标菜单
        	var targetNode = curObj.getNodeByParam("id", targetNodes[0].id, null);//在原对象中找目标对象选择的菜单
        	var curNode = curObj.getNodeByParam("id", id, null);//原对象中的要调整的菜单
        	var pnode=curNode.getParentNode();
        	if(pnode.id==targetNode.id){
        		$('#treeModal').modal('hide');
        		comp.message("调整到原位置，不做处理","error");
        		return;
        	}
        	if(targetNode.id==curNode.id){//不能调整 到自身
        		$('#treeModal').modal('hide');
        		comp.message("不能调整到自身","error");
        		return;
        	}
        	if(targetNodes[0].level>=varMenuLevel){
        		comp.message("目标菜单已经是末级菜单，不能调整到其下级！","error");
				return;
			}
			if(isExistMenuName(curNode.name,targetNodes[0].id,null)=="false"){//同级菜单名称重复验证
				comp.message("同级菜单名称有重复，不能移动到该节点下","error");
				return;
			}
			if(judgyLevel(curNode.id,targetNodes[0].level)=="false"){//同级菜单名称重复验证
				comp.message("子菜单级别超过4级，不能移动到该节点下","error");
				return;
			}
			$.ajax({
				async :false,
				cache :false,
				dataType :"text",
				type:"POST",
				timeout: 100000,
				url: "${rc.contextPath}/res/menuManage/moveMenu.do",
				data:{sourceId:curNode.id,targetId:targetNode.id},
				error: function () {//请求失败处理函数
					comp.message("请求失败，请稍后再试","error");
					return;
				},
				success:function(data){ //请求成功后处理函数。  
					curObj.moveNode(targetNode, curNode, "inner");
	        		comp.hideModal('treeModal');
	        		comp.message("菜单调整成功！");
	        		$("#smpl_tbl").load("${rc.contextPath}/res/menuManage/nsm/childlist.do",{"pId":pnode.id,"level":pnode.level},function(){});
				}
			});
        }
//修改菜单对应操作
		function modifyOpt(){
			var treeObj = comp.getTreeObj("optTree");
			var nodes = treeObj.getCheckedNodes(true);
			var nodestr="";
			for(var i=0;i<nodes.length;i++){
				nodestr=nodestr+","+nodes[i].id;
			}
			nodestr=nodestr.substring(1);
			var menuId = $("#menuId").val();
			$.ajax({
				async :false,
				cache :false,
				dataType :"text",
				type:"POST",
				timeout: 100000,
				url: "${rc.contextPath}/res/menuManage/opt-update/updateOpt.do",
				data:{nodes:nodestr,menuId:menuId},
				error: function () {//请求失败处理函数
					comp.message("请求失败，请稍后再试","error");
					return;
				},
				success:function(data){ //请求成功后处理函数。  
					comp.message("菜单操作保存成功！");
	        		comp.hideModal('optTreeModal');
				}
			});
		}
//------------------------------common function-----------------------------------------------
//初始化树
	    function initTree(){
	  	  comp.initTree("tree","${rc.contextPath}/res/menuManage/initMenuTree.do",null,null,null,setting);
	    }
		//查看节点的同级索引
		function showIndex(){
			var treeObj = $.fn.zTree.getZTreeObj("tree");
			var nodes = treeObj.getSelectedNodes();
			if (nodes.length>0) {
				var index = treeObj.getNodeIndex(nodes[0]);
				alert(index);
				alert(nodes[0].id);
				alert(nodes[0].level);
			}
		}
//自定义校验规则
//add	
		var	url= "${rc.contextPath}/res/menuManage/judgyLink.do";
		var nurl="${rc.contextPath}/res/menuManage/judgyName.do";
		var aldata={link:function(){return $("#menulink").val();},parent:function(){return $("#menuTreeId").val();},id:null};
		var andata={name:function(){return $("#menuname").val();},parent:function(){return $("#menuTreeId").val();},id:null};
		comp.validate.addRemote("linkIsExsit",url,aldata,"菜单链接标识重复！");
		comp.validate.addRemote("menuNameIsExsit",nurl,andata,"同级菜单名称有重复");
		comp.validate.addRule("linkRule",function(value,element){//菜单连接是否符合规则
			if(value.substring(0,1)=='/'){
				value=value.substring(1);
			}
			if(value.charAt(value.length-1)=='/'){
				value=value.substring(0,value.length-1);
			}
			var str=value.split('/');
			var result="t";
			if(str.length<3){
				result="f"
			}
			return this.optional(element) || (result=='t');
		},"菜单链接不符合规范");
		comp.validate.addRule("illegalCode",function(value,element){//菜单连接是否包含非法字符
			var result="t";
			if(value.indexOf('//')>-1||value.indexOf('\\')>-1){
				result="f";					
			}
			return this.optional(element) || (result=='t');
		},"菜单链接包含非法字符('//'或'\\')");
		function initAddValidate(){
			$(".addMenuForm").compValidate({
				rules:{
					menuname: { required: true, 
								maxlength: 10,
								menuNameIsExsit:true,
								uwsnumcharcn:true
								},
					menulink: {
							   illegalCode:true,
							   linkRule:true,
					  		   linkIsExsit:true,
							   maxlength: 100
								},
					comments: {maxlength: 150}
						},
				messages:{
					menuname:{required:"菜单名称不能为空"}
					}
				});
		}
//edit	
		var eldata={link:function(){return $("#menulink_").val();},parent:function(){return $("#menuTreeId").val();},id:function(){return $("#hpid").val();}};
		var endata={name:function(){return $("#menuname_").val();},parent:function(){return $("#menuTreeId").val();},id:function(){return $("#hpid").val();}};	
		comp.validate.addRemote("linkIsExsit_",url,eldata,"菜单链接标识重复！");
		comp.validate.addRemote("menuNameIsExsit_",nurl,endata,"同级菜单名称有重复");
			
		function initEditValidate(){
		$(".editMenuForm").compValidate({
				rules:{
						menuname_: { required: true, 
									maxlength: 10,
									menuNameIsExsit_:true,
									uwsnumcharcn:true
								},
						menulink_: {
							   		illegalCode:true,
									linkRule:true,
					  		   		linkIsExsit_:true,
							   		maxlength: 100
								},
						comments_: {maxlength: 150}
					},
				messages:{
					menuname_:{required:"菜单名称不能为空"}
					}
				});
			}
		
		//校验菜单同级不能重名,调整时的校验
		function isExistMenuName(name,pId,id){
		var flag;
		$.ajax({
				async : false,
				cache:false,
				type:"POST",
				url: "${rc.contextPath}/res/menuManage/judgyName.do",
				data:{name:name,parent:pId,id:id},
				error: function () {
					comp.message("请求失败，请稍后再试!","error");
				},
				success:function(data){ //请求成功后处理函数。  
					flag = data;
				}
			});
			return flag;
		}
		//调整判断调整的菜单总级别是否大于4
		function judgyLevel(pid,plevel){
			var flag;
			$.ajax({
					async : false,
					cache:false,
					type:"POST",
					url: "${rc.contextPath}/res/menuManage/judgyLevel.do",
					data:{pid:pid,plevel:plevel},
					error: function () {
						comp.message("请求失败，请稍后再试!","error");
					},
					success:function(data){ //请求成功后处理函数。  
						flag = data;
					}
				});
			return flag;
		}
		function ob(){
			$("#iconShow_").removeClass();
			$("#iconShow_").addClass($("#classCode_").val());
		}
//页面加载初始化
	    $(function(){
			initTree();
			initAddValidate();
			$("#classCode").blur(function(){
				$("#iconShow").removeClass();
				$("#iconShow").addClass($("#classCode").val());
			});
		});
//--------------------------------------------------------------------------------
</script>
</head>
<body>
<div id="contentwrapper">
    <div class="main_content">
		<div class="container-fluid">
			<div class="row-fluid">
				<div class="span3">
					<div class="span12">
						<ul id="tree" class="ztree myztree"></ul>
					</div>
				</div>
				<div class="span9">
					<div class="row-fluid">
						 <button type="button" class="btn btn-info" id="addChildbtn" onclick="popAddWin_()">增加下级</button>
					<!-- <button type="button" class="btn btn-info" onclick="showIndex()">查看索引</button>-->
					</div>
					<div class="row-fluid">
						 <#include "menuchild.ftl">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>  
<!--增加菜单页面-->
<div class="modal hide fade" id="addModal">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3 id="title1">新增菜单</h3>
	</div>
	<div class="modal-body">
		<#include "addMenu.ftl">
	</div>
	<div class="modal-footer">
		<a href="#" class="btn" data-dismiss="modal">取消</a>
		<a href="#" class="btn btn-info" id="sure" onclick="addTreeNode_()">确认</a>
	</div>
</div>
<!--编辑菜单页面-->
<div class="modal hide fade" id="editModal">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3 id="title1">编辑菜单</h3>
	</div>
	<div class="modal-body">
		<p id="edittemp"></p>
	</div>
	<div class="modal-footer">
		<a href="#" class="btn" data-dismiss="modal">取消</a>
		<a href="#" class="btn btn-info" onclick="editTreeNode()">确认</a>
	</div>
</div>
<!--调整弹出目标树-->
<div class="modal hide fade myModal" id="treeModal">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3 id="title1">选择目标菜单</h3>
	</div>
	<div class="modal-body">
		<div class="span3">
			<ul id="targetTree" class="ztree"></ul>
		</div>
	</div>
	<div class="modal-footer">
		<a href="#" class="btn" data-dismiss="modal">取消</a>
		<a href="#" class="btn btn-info" onclick="moveTreeNode()">确认</a>
	</div>
</div>
<!--菜单操作树页面-->
<div class="modal hide fade myModal" id="optTreeModal">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3 id="title1">菜单操作列表</h3>
	</div>
	<div class="modal-body">
		<div class="span3">
			<ul id="optTree" class="ztree"></ul>
		</div>
	</div>
	<div class="modal-footer">
		<a href="#" class="btn" data-dismiss="modal">取消</a>
		<a href="#" class="btn btn-info" onclick="modifyOpt()">确认</a>
	</div>
</div>
<input type="hidden" id="moveCurTreeId">
<!--menuId 用于存放维护菜单操作时选择的菜单Id-->
<input type="hidden" id="menuId">
<!--menuTreeId选择的树对应的菜单ID-->
<input type="hidden" id="menuTreeId">
<!--选择的菜单ID-->
<input type="hidden" id="hpid" value="">
</body>
</html>
