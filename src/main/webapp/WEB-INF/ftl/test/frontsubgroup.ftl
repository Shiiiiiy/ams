<html>
<title>form elements</title>
<head>
<!-- ajax form-->
	<script src="${rc.contextPath}/js/jquery.form.js"></script>
<!--date-->
	<script language="javascript" type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>	
<!-- multiselect -->
    <link rel="stylesheet" href="${rc.contextPath}/lib/multiselect/css/multi-select.css" />
	<script src="${rc.contextPath}/lib/multiselect/js/jquery.multi-select.min.js"></script>	
<!--javascript start-->
	<script>
//弹出编辑框
	 function popedit(){
		$("#frame1").attr("src","${rc.contextPath}/res2/popEdit.do");
	  	 $("#menuname").val('');
		 $("#menulink").val('');
		 $("#coment").val('');
		 comp.showModal('myModal1');
	 }
	 
//弹出编辑框回调方法
	 function popbakfun(){
	 	 comp.confirm("确定关闭？",function(r){
	 	 	if(r){
				$('#myModal1').modal('hide');
	 	 	}
	 	 });
	 }
//动态设置弹出框内容
	 function popdialog(){
		 $("#content").html("<font size='3'>您已经点击了弹出框组件</font>");
		 $("#title").html("提示");
		 comp.showModal('myModal3');
	 }
	function ttt(){
		alert("调用了‘modal('hide')’方法隐藏对话框");
			$('#myModal2').modal('hide');
			$('#myModal1').modal('hide');
			$('#myModal3').modal('hide');
		}
//ztree
	var setting = {
		check: {
				enable: false
			},
			data: {
				simpleData: {
					enable: true
				}
			}
	};

	var zNodes =[
		{ id:1, pId:0, name:"岗位 1", open:true},
		{ id:11, pId:1, name:"岗位 1-1", open:true},
		{ id:111, pId:11, name:"岗位 1-1-1"},
		{ id:112, pId:11, name:"岗位 1-1-2"},
		{ id:12, pId:1, name:"岗位 1-2", open:true},
		{ id:121, pId:12, name:"岗位 1-2-1"},
		{ id:122, pId:12, name:"岗位 1-2-2"},
		{ id:2, pId:0, name:"岗位 2", open:true},
		{ id:21, pId:2, name:"岗位 2-1"},
		{ id:22, pId:2, name:"岗位 2-2",checked:true,open:true},
		{ id:221, pId:22, name:"岗位 2-2-1"},
		{ id:222, pId:22, name:"岗位 2-2-2"},
		{ id:23, pId:2, name:"岗位 2-3"}
	];
//ajax ztree
	var setting1 = {
		check: {
					enable: true
				},
				data: {
					simpleData: {
						enable: true
					}
				}
	};
	var zTree;
	var Nodes;
	
	$(function(){
		$.ajax({
			async : false,
			cache:false,
			type: 'POST',
			dataType : "json",
			url: "${rc.contextPath}/comp/treeajax.do",//请求的action路径
			error: function () {//请求失败处理函数
				alert('请求失败');
			},
			success:function(data){ //请求成功后处理函数。  
				Nodes = data;   //把后台封装好的简单Json格式赋给treeNodes
			}
		});
		$.fn.zTree.init($("#tree"), setting1, Nodes);
	});
	
	function changeType(p){
		if(p.value=='p1'){
			comp.initTree("tree","${rc.contextPath}/comp/treeajax.do",null,"radio");
		}else{
			comp.initTree("tree","${rc.contextPath}/comp/treeajax.do",null,"checkbox");
		}
		
	}
//multiselect
	multiselect = {
		init: function(){
			$('#searchable-form').multiSelect({
				selectableHeader : '<input type="text" id="sh" autocomplete="off" placeholder="search" style="width:160px"/>',
				selectedHeader	 : '<a href="javascript:void(0)" id="sForm_deselect" class="btn">全部移除</a>'
			});
			$('#sForm_deselect').on('click', function(){
				$('#searchable-form').multiSelect('deselect_all');
				return false;
			});
			$('input#sh').quicksearch('#ms-searchable-form .ms-selectable li');
			$('#searchable-form').multiSelect();
		}
	};
	function selsubmit(){
		//comp.alert("name:"+$("select[name=countries[]] option[selected]").text()); 
		comp.confirm("确定提交",function(r){
			if(r){
				var v="";
			    $("select[name=countries[]] option[selected]").each(function() { if (v != '') { v += ',' } v += $(this).val() }); 
				$.sticky("name:"+$("select[name=countries[]] option[selected]").text()+" value:"+v, {autoclose : 5000, position: "top-right", type: "st-error" });
			}
		});
		
	}
//messageBox
		function message(){
		comp.message("提示111111","error",1000);
			//$.sticky("提示：您正在使用消息提示组件", {autoclose : 5000, position: "top-right", type: "st-error" });
		}
//初始化
	$("document").ready(function(){
		$("#frame1").load(function(){//用于iframe自适应高度
			$(this).height(0);
			//$(this).width(0);
			var mainheight = $(this).contents().find("body").height()+60;
		//	var mainwidth = $(this).contents().find("body").width()+160;
			$(this).height(mainheight);
			//$(this).width(mainwidth);
		});   
		//ztree
		$.fn.zTree.init($("#treeDemo"), setting, zNodes);
		//validate
		
		$(function(){
			$(".form_validation_reg").compValidate({
			rules:{
					reg_first_name:{required:true},
					reg_last_name: { 
						required: true
					},
					reg_days: { required: true, minlength: 2 },
					reg_gender: { required: true },
					reg_city: { required: true, minlength: 2 }
					}
				});
		});
        //multiselect
        multiselect.init();
	});
	var strRegex = "^[\u0391-\uFFE50-9a-zA-Z_]+$";
	//comp.validate.regRxp("ABC",strRegex,"dsdfsdf");
	function A(value, element) {
			var strRegex = "^[\u0391-\uFFE50-9a-zA-Z_]+$";
			var re=new RegExp(strRegex);
			return this.optional(element) || (re.test(value));
		}
	  comp.validate.addRule("ABC", A, "只能包括中文字、英文字母、数字和下划线");
//组织机构单选组件
	function popOrgSelect(){
		comp.orgSingleSelect("orgTree");
		comp.showModal('singleOrgModal');
	}
	
	function sure(){
		alert(comp.returnTreeValue("orgTree","1")[0].name);
		$('#singleOrgModal').modal('hide');
	}
//组织机构多选组件
	function popOrgSelect1(){
		comp.orgMultiSelect("MultiOrgTree");
		comp.showModal("MultiOrgModal");
	}
	function sure1(){
		var names="";
		for(var name in comp.returnTreeValue("MultiOrgTree")){
			names=comp.returnTreeValue("MultiOrgTree")[name].name+""+names;
		}
		alert(names);
		$('#MultiOrgModal').modal('hide');
	}
//岗位选择组件
	function getPositionTree(){
		var id=comp.returnTreeValue("orgPosTree","sel")[0].id;
		comp.initTree("positionTree","${rc.contextPath}/user/comp/getPositionTree.do",{orgId:id},"radio");
	}
	function popposgSelect(){
		comp.initTree("orgPosTree","${rc.contextPath}/user/comp/getOrgTree.do",null,null,getPositionTree);
		if(comp.getTreeObj("positionTree")!=null){
			comp.getTreeObj("positionTree").destroy();
		}
		comp.showModal('positionModal');
	}
	function sure2(){
		if(comp.returnTreeValue("positionTree")!=null){
			alert(comp.returnTreeValue("positionTree")[0].name);
		}else{return;}
		comp.validate.regexp("校验","abcdefgzz");
		$('#positionModal').modal('hide');
	}
	 </script>
</head>
<body>
<div id="contentwrapper">
    <div class="main_content">
<!-- main content -->
<!--data start-->
     <div class="row-fluid">
		<div class="span4"><div class="span3">时间日期:</div><div class="span8"><input type="text" id="time12" style="width:195px" onfocus="this.blur()"/></div><div class="span1"><a href="#"><img onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',skin:'whyGreen',el:$dp.$('time12')})" src="${rc.contextPath}/lib/My97DatePicker/skin/datePicker.gif" _fcksavedurl="${rc.contextPath}/lib/My97DatePicker/skin/datePicker.gif" width="22" height="28" align="absmiddle"></a></div> </div>
		<div class="span4"><div class="span2">日期:</div><div class="span9"><input type="text" onclick="WdatePicker({skin:'whyGreen'});" /></div></div>
	  	<div class="span4"><div class="span2">时间:</div><div class="span9"><input type="text" id="time1" onclick="WdatePicker({dateFmt:'HH:mm:ss',skin:'whyGreen'});" /></div></div>
	  </div>
	  <div class="row-fluid">
  		<div class="span4"><div class="span3">年:</div><div class="span9"><input type="text" id="time1" onclick="WdatePicker({dateFmt:'yyyy',skin:'whyGreen'});" /></div></div>
		<div class="span4"><div class="span2">月:</div><div class="span9"><input type="text" id="time1" onclick="WdatePicker({dateFmt:'MM',skin:'whyGreen'});" /></div></div>
		<div class="span4"><div class="span2">日:</div><div class="span9"><input type="text" id="time1" onclick="WdatePicker({dateFmt:'dd',skin:'whyGreen'});" /></div></div>
	  </div>
	  <div class="row-fluid">
		<div class="span4"><div class="span3">年月:</div><div class="span9"><input type="text" id="time1" onclick="WdatePicker({dateFmt:'yyyy-MM',skin:'whyGreen'});" /></div></div>
		<div class="span4"><div class="span2">月日年:</div><div class="span9"><input type="text" id="time1" onclick="WdatePicker({dateFmt:'MM/dd/yyyy',skin:'whyGreen'});" /></div></div>
	  </div>
<!--data end-->
	  <div class="row-fluid">
		  <div class="span12">
		  	<hr />
		  </div>
	  </div>
<!--pop start-->
	  <div class="modal hide fade" id="myModal1">
		<div class="modal-header">
			<button class="close" data-dismiss="modal">×</button>
			<h3 id="title1">弹出编辑框</h3>
		</div>
		<div class="modal-body">
			<#include "includpage.ftl">
		</div>
		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal">取消</a>
			<a href="#" class="btn btn-info" onclick="popbakfun()">确定</a>
		</div>
	</div>
    <div class="modal hide fade" id="singleOrgModal" style="width:350px;">
		<div class="modal-header">
			<button class="close" data-dismiss="modal">×</button>
			<h3>组织机构单选</h3>
		</div>
		<div class="modal-body">
			<div class="span3">
				<ul id="orgTree" class="ztree"></ul>
			</div>
		</div>
		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal">取消</a>
			<a href="#" class="btn btn-info" data-dismiss="modal" onclick="sure()">确定</a>
		</div>
	</div>
	
	<div class="modal hide" id="MultiOrgModal" style="width:350px;">
		<div class="modal-header">
			<button class="close" data-dismiss="modal">×</button>
			<h3>组织机构多选</h3>
		</div>
		<div class="modal-body">
			<div class="span3">
				<ul id="MultiOrgTree" class="ztree"></ul>
			</div>
		</div>
		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal">取消</a>
			<a href="#" class="btn btn-info" data-dismiss="modal" onclick="sure1()">确定</a>
		</div>
	</div>
<!--岗位选择-->	
	<div class="modal hide fade" id="positionModal">
		<div class="modal-header">
			<button class="close" data-dismiss="modal">×</button>
			<h3>岗位选择组件</h3>
		</div>
		<div class="modal-body">
			<div class="row-fluid">
				<div class="span6">
					<ul id="orgPosTree" class="ztree myztree"></ul>
				</div>
				<div class="span3">
					<ul id="positionTree" class="ztree myztree"></ul>
				</div>
			</div>
		</div>
		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal">取消</a>
			<a href="#" class="btn btn-info" data-dismiss="modal" onclick="sure2()">确定</a>
		</div>
	</div>
	<div class="modal hide fade" id="myModal3">
		<div class="modal-header">
			<button class="close" data-dismiss="modal">×</button>
			<h3 id="title">提示</h3>
		</div>
		<div class="modal-body">
			<p id="content">
			您正在使用的是提示框，请关闭
			</p>
		</div>
		<div class="modal-footer">
			<a href="#" class="btn" data-dismiss="modal">取消</a>
			<a href="#" class="btn btn-info" onclick="ttt()">确定</a>
		</div>
	</div>
	<div class="row-fluid">
	<!--	<div class="span2"><a data-toggle="modal" data-backdrop="static" href="#" onclick="popdialog()" class="btn">a标签onclick调用</a></div>
		<div class="span2"><a data-toggle="modal" data-backdrop="static" href="#myModal2" class="btn">a标签href调用</a></div>
		<div class="span2"><button type="button" data-toggle="modal" data-target="#myModal3">button属性标签调用</button></div>-->
		
		<div class="span2"><button type="button" class=" btn-info" data-toggle="modal" onclick="popdialog()">弹出提示框</button></div>
		<div class="span2"><button type="button" class=" btn-info" data-toggle="modal" onclick="popedit()">弹出编辑框</button></div>
<!--messageBox start-->
		<div class="span2"><button type="button" class=" btn-info" onclick="message()">消息提示组件</button></div>
<!--messageBox end-->
		<div class="span2"><button type="button" class=" btn-info" data-toggle="modal" onclick="popOrgSelect()">组织机构单选组件</button></div>
		<div class="span2"><button type="button" class=" btn-info" data-toggle="modal" onclick="popOrgSelect1()">组织机构多选组件</button></div>
		<div class="span2"><button type="button" class=" btn-info" data-toggle="modal" onclick="popposgSelect()">岗位选择组件</button></div>
	</div>
<!--pop end--> 
	 <div class="row-fluid">
		  <div class="span12">
		  	<hr />
		  </div>
	  </div>
<!--ztree start-->
	   <div class="row-fluid">
		    <div class="span6">
			   	<div class="row-fluid">
			   	静态树（前端静态数据）
			    </div>
			    <div class="row-fluid">
					<ul id="treeDemo" class="ztree myztree"></ul>
				</div>
			</div>
			<div class="span6">
				<div class="row-fluid">
			   	动态树（后台动态数据，调用方式分为同步和异步）
			    </div>
			    <div class="row-fluid">
					<ul id="tree" class="ztree myztree"></ul>
				</div>
				<div class="row-fluid">
					<div class="span2">
						<label class="uni-radio">
							<div class="span2">
								<input type="radio" value="p1" id="uni_r1a" name="uni_r" class="uni_style" onclick="changeType(this)"/>
							</div>
							<div class="span10">	
								单选
							</div>
						</label>
					</div>
					<div class="span2">
						<label class="uni-radio">
							<div class="span2">
								<input type="radio" checked="" value="p2" id="uni_r1b" name="uni_r" class="uni_style" onclick="changeType(this)"/>
							</div>
							<div class="span10">	
								复选
							</div>
						</label>
					</div>
			</div>
	   </div>
<!--ztree end-->
	    <div class="row-fluid">
		  <div class="span12">
		  	<hr />
		  </div>
	  </div>
<!--tab start-->
	  <div class="tabbable tabbable-bordered">
			<ul class="nav nav-tabs">
				<li class="active"><a href="#tab_br1" data-toggle="tab">tab页1</a></li>
				<li><a href="#tab_br2" data-toggle="tab">tab页2</a></li>
				<li><a href="#tab_br3" data-toggle="tab">tab页3</a></li>
				<li><a href="#tab_br4" data-toggle="tab">tab页4</a></li>
			</ul>
			<div class="tab-content">
				<div class="tab-pane active" id="tab_br1">
					<p>
						第一个tab页内容
					</p>
				</div>
				<div class="tab-pane" id="tab_br2">
					<p>
						第二个
					</p>
				</div>
				<div class="tab-pane" id="tab_br3">
					<p>
						示例：
						Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla et tellus felis, sit amet interdum tellus. Suspendisse sit amet scelerisque dui. Vivamus faucibus magna quis augue venenatis ullamcorper. Proin eget mauris eget orci lobortis luctus ac a sem. Curabitur feugiat, eros consectetur egestas iaculis,
					</p>
				</div>
				<div class="tab-pane" id="tab_br4">
					<p>
						<div class="row-fluid">
							<div class="span2">
								学号：
							</div>
							<div class="span10">
								<input type="text" id="xuehao" value=""/>
							</div>
						</div>
						<div class="row-fluid">
							<div class="span2">
								学号：
							</div>
							<div class="span10">
								<input/>
							</div>
						</div>
					</p>
				</div>
			</div>
		</div>
<!--tab end-->
	   <div class="row-fluid">
		  <div class="span12">
		  	<hr />
		  </div>
	  </div>
<!--validate start-->
<div class="formSep">
	<div class="row-fluid">
	  <form class="form_validation_reg">
			<div class="formSep">
				<div class="row-fluid">
					<div class="span4">
						<div class="span2">
							<label>姓名 <span class="f_req">*</span></label>
						</div>
						<div class="span10">
							<input type="text" name="reg_first_name" class="span12" />
						</div>
					</div>
					<div class="span4">
						<div class="span2">
							<label>全称<span class="f_req">*</span></label>
						</div>
						<div class="span10">
							<input type="text" name="reg_last_name" class="span12" />
						</div>
					</div>
				</div>
			</div>
			<div class="formSep">
				<div class="row-fluid">
					<div class="span4">
						<div class="span2">
							<label>城市 <span class="f_req">*</span></label>
						</div>
						<div class="span10">
							<input type="text" name="reg_city" class="span12" />
						</div>
					</div>
					<div class="span4">
						<div class="span2">
							<label>邮编</label>
						</div>
						<div class="span10">
							<input type="text" name="reg_zip" class="span12" />
						</div>
					</div>
				</div>
			</div>
			<div class="formSep">
				<div class="row-fluid">
					<div class="span4">
						<div class="span2">
							<label><span class="error_placement">星期</span> <span class="f_req">*</span></label>
						</div>
						<div class="span10">
							<label class="checkbox inline">
								<input type="checkbox" value="option1" name="reg_days" /> Monday
							</label>
							<label class="checkbox inline">
								<input type="checkbox" value="option2" name="reg_days" /> Tuesday
							</label>
							<label class="checkbox inline">
								<input type="checkbox" value="option3" name="reg_days" /> Wednesday
							</label>
							<label class="checkbox inline">
								<input type="checkbox" value="option4" name="reg_days" /> Thursday
							</label>
							<label class="checkbox inline">
								<input type="checkbox" value="option5" name="reg_days" /> Friday
							</label>
						</div>
					</div>
					<div class="span4">
						<div class="span2">
							<label><span class="error_placement">性别</span> <span class="f_req">*</span></label>
						</div>
						<div class="span10">
							<label class="radio inline">
								<input type="radio" value="option6" name="reg_gender" />
								男
							</label>
							<label class="radio inline">
								<input type="radio" value="option7" name="reg_gender" />
								女
							</label>
						</div>
					</div>
				</div>
			</div>
			<div class="form-actions">
				<button class="btn  btn-info" type="submit">保存</button>
				<button class="btn  btn-info">取消</button>
			</div>
		</form>
	</div>
</div>
<!--validate end-->
	<div class="row-fluid">
		 <div class="span12">
			<form id="searchable-form">
				<select name="countries[]" multiple="multiple" id="searchable-select">
					<option value="YXL">余兴龙</option> 
					<option value="WT">王涛</option>
					<option value="ZT">张涛</option>
					<option value="LDH">刘德华</option>
					<option value="LL">刘璐</option>
					<option value="WMC">王模昌</option>
					<option value="TJP">陶俊平</option>
					<option value="LSH">刘少华</option>
					<option value="LXQ">刘晓庆</option>
					<option value="LB">刘备</option>
				</select>
			</form>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span12">
			<button id="selbtn" onclick="selsubmit()" class="btn btn-info">提交</button>
		</div>
	</div>
	
	<div class="row-fluid">
		<div class="span12">
			<button onclick="selectUsers()" class="btn btn-info">选人</button>
			
			<input id="selectedUserHidden"  type="hidden" class="span6" value=""/>
			
		</div>
	</div>
		
	<div class="span3  ">
</div>
</div>
</div>


          
 

<!--人员选择 -->
<div class="modal hide fade" id="selectUserModal">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3>人员选择</h3>
	</div>
	<div class="modal-body" id="selectUserModalBody">
		<div class="row-fluid">
			<div class="span3">
				<ul id="selectUserOrgTree" class="ztree myztree"></ul>
			</div>
			<div class="span6">
				<div class="row-fluid">
						<div class="span12">
							
							<form  id="userQuery"  action="${rc.contextPath}/user/user/comp/queryUser.do" method="post">
							<select size="1" id="selectUserType" name="selectUserType" aria-controls="dt_gal"  class="span4">
								<option value="userName">人员名称</option>
								<option value="positionName">岗位名称</option>
								<option value="loginName">登录账号</option>
							</select>
							<input id="selectUserValue" name="selectUserValue" class="span6"  value=""/>
							<input id="orgId" name="orgId" type="hidden"/>							
							<input type="button" class="btn btn-info" id="userQueryButton" onclick="queryUserSubmit()" value="查 询"/>	
							</form>
							
						</div>
				</div>
				<div class="row-fluid">
					<div class="span12" id="usersTableDiv">
					</div>					
				</div>		
			</div>
			<div class="span3">
				<ul id="selectedUser" class="ztree myztree"></ul>
				<a href="###" class="btn btn-info" onclick="javascript:deleteAllUsers()">全部删除</a>
			</div>
		</div>
	</div>
	
	<div class="modal-footer">
		<a href="###" class="btn " data-dismiss="modal">取消</a>
		<a href="###" class="btn btn-info" data-dismiss="modal" onclick="getUsers()">确定</a>		
	</div>
</div>


<script>

	//
	$(function () {
		var selectedUserSet = {data:{},view:{showLine:false,selectedMulti: false,showIcon: false},
			edit:{enable:true,showRenameBtn:false,drag:{prev:true,next:true,inner:false}},callback:{onRemove:userRemove}};
		var userNodes = [];
		$.fn.zTree.init($("#selectedUser"), selectedUserSet, userNodes);		
		
	});
	//从用户购物车删除
	function userRemove(event, treeId, treeNode) {
	
		$('input[name="row_sel"]').each(function(){
		
	          var value=$(this).attr("value");
	          var obj=eval("["+value+"]");
	          if(obj[0].userId==treeNode.userId){
	          	$(this).attr("checked",false);
	          	$("#checkUserAll").attr("checked",false);
	          }
	    });		
	}
	
	//从table中移除购物车的用户
	function removeUserFromTable(value){
	
		var obj=eval("["+value+"]");
		var userTree = $.fn.zTree.getZTreeObj("selectedUser");
		var users =userTree.getNodes();
		$(users).each(function(){
			if($(this)[0].userId==obj[0].userId)
				userTree.removeNode($(this)[0]);
		  });
	}
	
	//从table中添加购物车的用户
	function addUserFromTable(value){
	
		var userTree = $.fn.zTree.getZTreeObj("selectedUser");
		var users =userTree.getNodes();
		var obj=eval("["+value+"]");
		var tag= true;
		$(users).each(function(){
			if($(this)[0].userId==obj[0].userId){
				tag=false;
				return;
				}
			
		  });
		if(tag)
			userTree.addNodes(null,eval("["+value+"]"));
	}
		
	function checkUserAll(obj) {

             $('input[name="row_sel"]').attr("checked",obj.checked);
             if($("#checkUserAll").attr("checked")!=null)
	             $('input[name="row_sel"]').each(function(){ 
	             	 addUserFromTable($(this).attr("value"));
	             });
	         else
	             $('input[name="row_sel"]').each(function(){ 
	             	 removeUserFromTable($(this).attr("value"));
	             });
             
      }
      
      function  onClickCheckbox(obj){
 			var $subBox = $("input[name='row_sel']");
        	$("#checkUserAll").attr("checked",$subBox.length == $("input[name='row_sel']:checked").length ? true : false);
        	if($(obj).attr("checked")!=null){
       			addUserFromTable($(obj).attr("value"));
        	}else{
        		removeUserFromTable($(obj).attr("value"));
        	}
		}
      
	//打开用户列表选择面板
	function selectUsers(){
		
		initValues();
		queryUserSubmit();		
		comp.showModal("selectUserModal");
	}
	//获取用户
	function getUsers(){
//		if(treeObj.getSelectedNodes().length==0){
//			comp.message("请选择一个用户在提交","error");
//			return;
//		}
		comp.hideModal("selectUserModal");
		alert("获取到的用户ID字符串："+getUserIds());
	}
	
	function getUserIds(){
	
		var treeObj = $.fn.zTree.getZTreeObj("selectedUser");
		var userids="";
		var i=0;
		$(treeObj.getNodes()).each(function(){
			if(i>0)
				userids+=",";
			userids+=$(this)[0].userId;						
			i++;			    
		 });		
		
		return userids;
	}
	
	function queryUsersByOrgId(event, treeId, treeNode){
		var treeObj = $.fn.zTree.getZTreeObj("selectUserOrgTree");
		var node = treeObj.getNodes()[0];
		if(treeObj.id!=node.id)//组机构根节点不传递 组织机构id给后台
			$("#orgId").val(treeNode.id);
		 
		$("#selectUserValue").val(""); 
		$('#userQuery').submit();
	}
	
	//打开面板数据初始化
	function initValues(){
	
		$('#selectUserModal').width(910).css("marginLeft","-450px").css("marginTop","-250px");
		$('#selectUserModalBody').css("max-height","320px");
		$('#selectUserOrgTree').width(200).height(300).css("margin-top","0px");
		$('#selectedUser').width(200).height(300).css("margin-top","0px");
		$('#userQueryButton').css("margin-bottom","9px");
		
		//初始化组织机构树
		  comp.initTree("selectUserOrgTree",comp.contextPath()+"/user/comp/getOrgTree.do",null,null,queryUsersByOrgId);
		//comp.orgSingleSelect("selectUserOrgTree");
		
		var treeObj = $.fn.zTree.getZTreeObj("selectUserOrgTree");
		var node = treeObj.getNodes()[0];
		treeObj.selectNode(node);		
		//$("#orgId").val(node.id); //初始化机构查询条件为根节点,不需要传值
		
		
		
		
		//用户ajaxform提交设置
		var ajaxFormOptions = {
            type: "POST",
            success: function(data){
            
          
                $('input[name="row_sel"]').each(function(){
		
			          var value=$(this).attr("value");
			          var obj=eval("["+value+"]");
			          var checkbox=$(this);
			         
					var userTree = $.fn.zTree.getZTreeObj("selectedUser");
					var users =userTree.getNodes();
					$(users).each(function(){
						if($(this)[0].userId==obj[0].userId)							
						    checkbox.attr("checked",true);
					 });
			    });	
			    $("#checkUserAll").attr("checked",
			    	$("input[name='row_sel']").length == $("input[name='row_sel']:checked").length
			    	&& $("input[name='row_sel']").length>0? true : false);
			    
			    	
			    $('#usersTableDiv a[rel=popover]').each(function(){
			   	 	$(this).popover({trigger:'hover',html:true});
			    });
			    
			   // .popover({selector:'a[rel=popover]',trigger:'hover',html:true});
            },            
            error: function(){
                comp.message("用户查询请求失败，请稍后重试。","error");
            },
            beforeSubmit: function(formData, jqForm, options){
            	           	            	
            },
            target: '#usersTableDiv'
        };
		
		$('#userQuery').ajaxForm(ajaxFormOptions);		
		
	}
	
	function queryUserSubmit(){
		if($('#userQuerypageNo').length>0)
			$('#userQuerypageNo').val('1');
		$('#userQuery').submit();
	}
	//删除所有用户
	function deleteAllUsers(){
	
		$('input[name="row_sel"]').attr("checked",false);
		$("#checkUserAll").attr("checked",false);
		var userTree = $.fn.zTree.getZTreeObj("selectedUser");
		var nodes = userTree.getNodes();
		
		$(nodes).each(function(){
			userTree.removeNode($(this)[0]);
		});

	}
	
</script>
</body>
</html>
