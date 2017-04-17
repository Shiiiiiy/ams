<html>
<title>操作授权</title>
<head>
	<!--ztree-->
	<link rel="stylesheet" href="${rc.contextPath}/lib/uniform/Aristo/uniform.aristo.css" />
	<script src="${rc.contextPath}/lib/uniform/jquery.uniform.min.js"></script>
	<style>
		.myModal{
			width: 330px;
			/*margin: -250px 0 0 -450px;*/
			}
	</style>
	<script>
		//菜单级别设置
		var varMenuLevel=3;
		//树基本属性配置
		var setting = {
			view: {
				selectedMulti: false,
				dblClickExpand: false,
				showLine: true
			},
			data: {
				simpleData: {
					enable: true
				}
			},
			callback: {
				onClick: getAssignRoleList
			}
		};
		//获取子菜单列表
		function getAssignRoleList(e,treeId, Nodes){
			var treeObj = $.fn.zTree.getZTreeObj("tree");
			//treeObj.expandNode(Nodes);//单击展开父节点
			var nodes = treeObj.getSelectedNodes();//选择的节点对象
			if (nodes[0].isParent) {
				$.sticky("请选择叶子节点操作！", {autoclose : 5000, position: "top-right", type: "st-info" });
			} else {
				$("#menuRoleDiv").load("${rc.contextPath}/res/optAssign/opt-query/nsm/menuRoleList.do",{"menuId":nodes[0].id},function(){});
			}
		}
		function initTree(){
			comp.initTree("tree","${rc.contextPath}/res/optAssign/opt-query/initMenuTree.do",null,null,null,setting); 
	    }
	    $(function(){
			initTree();
		});
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
							 <#include "menuRoleList.ftl">
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
