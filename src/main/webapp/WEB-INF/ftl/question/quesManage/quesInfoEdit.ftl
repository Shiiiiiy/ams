<!DOCTYPE html>
<html lang="en">
	<title></title>
    <head>
        <script src="${rc.contextPath}/js/jquery.form.js"></script>
        <script src="${rc.contextPath}/js/common/cascadecommon.js"></script>
        <script language="javascript" type="text/javascript" src="/ams/lib/My97DatePicker/WdatePicker.js"></script>
    </head>
    <body>
        <div id="contentwrapper">
           <div class="main_content">
           	<h3 class="heading">问卷编辑</h3>
               <form  id="quesItemForm"  method="post">
               		<input id="id" name="id" type="hidden" value="${(questionInfo.id)!""}"/>	
               		<input id="commonTypeId" name="commonTypeId" type="hidden" value="${(commonTypeId)!""}"/>			
					<div class="row-fluid">
						<div class="span8">
							<div class="span2">
								<label>问卷名称<span class="f_req">*</span></label>
							</div>
							<div class="span10">
							<#if questionInfo.name??>
								<input id="name" name="name" value="${(questionInfo.name)!""}"/>
							<#else>
								<input id="name" name="name"/>
							</#if>
							</div>
						</div>
					</div>
					
					<div class="row-fluid">
					<div class="span8">
						<div class="span2">问卷类型<span class="f_req">*</span></div>
						<div class="span10">
							<select size="1" id="paperCategory" name="paperCategory" aria-controls="dt_gal" style="width:218px" onChange="changeType()">
								<option value="" />请选择..</option>
								<#if questionInfo.typeDic??>
									<#list categoryList as d>
										<#if d.id==questionInfo.typeDic.id>
											<option  value="${d.id}"/ selected="selected">${d.name?html}</option>
										<#else>
											<option  value="${d.id}"/>${d.name?html}</option>
										</#if>
									</#list>
								<#else>
									<#list categoryList as d>
											<option  value="${d.id}"/>${d.name?html}</option>
									</#list>
								</#if>
							</select>
						</div>
					</div>
					</div>
					
					<#if questionInfo.typeDic?? && questionInfo.typeDic.code=='QUES_COMMON'>
					<div class="row-fluid" id="isopenDiv" style="display:none">
					<#else>
					<div class="row-fluid" id="isopenDiv">
					</#if>
					<div class="span8">
						<div class="span2">是否公开<span class="f_req">*</span></div>
						<div class="span10">
								<input type="radio" id="isopen_y" name="isOpen" value="Y"  onclick="open_hiddenPaperUserDiv('none')"
									<#if questionInfo.isOpen?? && questionInfo.isOpen=='Y'>
										checked
									</#if>
								/>&nbsp;是
								<input type="radio" id="isopen_n" name="isOpen" value="N"  onclick="open_hiddenPaperUserDiv('')"
									<#if questionInfo.isOpen?? && questionInfo.isOpen=='N'>
										checked
									</#if>
								/>&nbsp;否
						</div>
					</div>
					</div>
					
					<div class="row-fluid">	
						<div class="span8">
							<div class="span2">备注</div>
							<div class="span10">
							<#if questionInfo.comments??>
								<textarea cols="80" rows="5" id="comments" name="comments">${(questionInfo.comments!"")?html}</textarea>
							<#else>
								<textarea cols="80" rows="5" id="comments" name="comments"></textarea>
							</#if>
							<font size="1" color="grey"  style="vertical-align:bottom; padding-bottom:10px">(不超过200字)</font>
							</div>
						</div>					
					</div>
					
				</form>
                	<div class="row-fluid">
						<div class="span12">
								<#if questionInfo.isOpen?? && questionInfo.isOpen=='Y' ||(questionInfo.typeDic?? && questionInfo.typeDic.code=='QUES_COMMON')>
								<div id="paperUserDiv"  style="display:none">
								<#else>
								<div id="paperUserDiv"  style="display:''">
								</#if>
								<!--<input type="button" class="btn btn-info" onclick="selectTeacherCheck()" value="选择教工"/> -->
								<!--<h5 class="heading"></h5>-->
								<#include "teacherSelectedList.ftl">
								<br/>
								<input type="button" class="btn btn-info" onclick="selectStudentByClassCheck()" value="选择学生"/>
								<h5 class="heading"></h5>
								<#include "stuSelectedList.ftl">
								</div>
								<br/>
								<input type="button" class="btn btn-info" onclick="selectItem('${questionInfo.id!""}')" value="新增题目"/>
								<div  id="itemOption">
									<#include "paperItemList.ftl">
								</div>
								<br/>
								<div class="btnLeft">
					              <button class="btn btn-info"  onclick="questInfoSave()">保 存</button>
					              <button class="btn btn-info"  onclick="questInfoEnable()">启 用</button>
					              <button class="btn btn-info"  onclick="cancel()">取 消</button>
					            </div>
						</div>
					</div>
                </div>
            </div>
		<script>
		
		     //开启、隐藏选人控件
			function open_hiddenPaperUserDiv(flag){
				if(comp.isNull(flag)){
					$("#paperUserDiv").show();
				}else if(flag=="none"){
					$("#paperUserDiv").hide();
				}
			}
		
			$("document").ready(function(){
				//获取公共问卷的Id
				var commonTypeId=$("#commonTypeId").val();
				//获取当前的问卷类型Id
				var paperCategory=$('#paperCategory option:selected').val();
				
				//如果当前是公共类型的问卷，就不做操作
				if(commonTypeId==paperCategory){
					$("#_itemCategoryId option").each(function (){
						$(this).show();
					});
					return;
				}
				
				//如果没有选中公共类型的问卷，就只保留公共和当前类型的选项
				$("#_itemCategoryId option").each(function (){
					var thisValue = $(this).val();
					if(thisValue==commonTypeId || thisValue==paperCategory){
						$(this).show();
					}else{
						$(this).hide();
					}
				});				
			});
						
		//当问卷类型发生改变时，题目选择框中的问题类型随之改变
			function changeType(){
				//获取公共问卷的Id
				var commonTypeId=$("#commonTypeId").val();
				//获取当前的问卷类型Id
				var paperCategory=$('#paperCategory option:selected').val();
				
				//如果当前是公共类型的问卷，就不做操作
				if(commonTypeId==paperCategory){
					shutdownSelector();
					$("#_itemCategoryId option").each(function (){
						$(this).show();
					});
					return;
				}else{
						openSelector();
				}
				
				//如果没有选中公共类型的问卷，就只保留公共和当前类型的选项
				$("#_itemCategoryId option").each(function (){
					var thisValue = $(this).val();
					if(thisValue==commonTypeId || thisValue==paperCategory){
						$(this).show();
					}else{
						$(this).hide();
					}
				});
				
			}
			
		  /**
		    * 关闭选人控件
		    */
		  function shutdownSelector(){
			//隐藏式否选中
			$("#isopenDiv").hide();
		    //隐藏选人控件
			open_hiddenPaperUserDiv('none');
			//选中公开
			$("#isopen_y").attr("checked","checked");
			$("#isopen_n").removeAttr("checked");
		  }
		  
		  /*
		    * 打开选人控件
		    */
		    function openSelector(){
		         //显示是否选中
		         $("#isopenDiv").show();
				//显示选人控件
				open_hiddenPaperUserDiv('');
		    }
		
		//表单验证
			var formValidator = $("#quesItemForm").compValidate({
				onkeyup: false,
				onfocusout: function(element) {if ($(element).val()) $(element).valid(); },
				debug:false,
				errorClass: 'error',
				validClass: 'valid',
				focusCleanup:true,
				focusInvalid:false,
					  rules:{
									name: { required:true,maxlength:50,
													remote:{
														type:"POST",
														url:"${rc.contextPath}/question/quesManage/opt-query/quesInfoCheck.do",
														data:{
																id:function(){return $('#id').val()},
																name:function(){return $('#name').val()}
															}
														}
													},
									paperCategory: {required:true},
									isOpen:{required:true},
									comments:{maxlength:200}
							   },
					   messages:{
								name:{required:'问卷名称不能为空',maxlength:'问卷名称长度不能超过50位',remote:$.format("问卷已存在,请重新输入问卷名称.")},
								paperCategory:{required:'问卷类型不能为空'},
								isOpen:{required:'是否公开不可为空'},
								comments:{maxlength:'备注太长【默认不超过200字符】'}
					}
				});
				
			//保存
				function questInfoSave(){
					if(formValidator.form()){
						if($("input[name='itemOptionIndex']").length>0){
							$("#quesItemForm").attr("action","${rc.contextPath}/question/quesManage/opt-add/savePaperInfo.do").submit();
						}else{
							comp.message("请选择题目","info");
						}
					}
				}
				
			//启用
				function questInfoEnable(){
					if(formValidator.form()){
						if($("input[name='itemOptionIndex']").length>0){
							comp.confirm("问卷启用后不可再编辑，是否启用 ?",function(r){if(r){
								$("#quesItemForm").attr("action","${rc.contextPath}/question/quesManage/opt-add/startPaperInfo.do").submit();
							}});
						}else{
							comp.message("请选择题目","info");
						}
					}
				}
		
			//取消
			function cancel(paperId){
				$.ajax({
					url:"${rc.contextPath}/question/quesManage/opt-modify/rollbackItem.do",
					async:false,
					cache:false,
					type:"POST",
					data:{paperId:$("#id").val()},
					success:function(msg){
						if('success'== msg){
		   					window.location.href="${rc.contextPath}/question/quesManage/opt-query/quesInfoQuery.do";
						}else if('error'== msg){
							comp.message("系统报错，请联系管理员 !","error");
						}
					}
				});
			}
				
		
		  //上移记录
		  function moveUp(id){
				$.ajax({
					url:"${rc.contextPath}/question/quesManage/opt-modify/moveUpItem.do",
					async:false,
					cache:false,
					type:"POST",
					data:{id:id},
					success:function(msg){
						if('success'== msg){
							comp.message("问题上移成功");
							var param={id:$("#id").val(),name:$("#name").val(),paperCategory:$("#paperCategory").val(),comments:$("#comments").val()};
		   					$("#paperItemList").load("${rc.contextPath}/question/quesManage/nsm/asynLoadQuestion.do",param,function(){});
						}else if('min'== msg){
							comp.message("无法继续上移");
						}else if('null'== msg){
							comp.message("当前问题不存在，请联系管理员 !","error");
						}else if('error'== msg){
							comp.message("系统报错，请联系管理员 !","error");
						}
					}
				});
		  }
		
		 //下移记录
		  function moveDown(id){
				$.ajax({
					url:"${rc.contextPath}/question/quesManage/opt-modify/moveDownItem.do",
					async:false,
					cache:false,
					type:"POST",
					data:{id:id},
					success:function(msg){
						if('success'== msg){
							comp.message("问题下移成功");
							var param={id:$("#id").val(),name:$("#name").val(),paperCategory:$("#paperCategory").val(),comments:$("#comments").val()};
		   					$("#paperItemList").load("${rc.contextPath}/question/quesManage/nsm/asynLoadQuestion.do",param,function(){});
						}else if('max'== msg){
							comp.message("无法继续下移");
						}else if('null'== msg){
							comp.message("当前问题不存在，请联系管理员 !","error");
						}else if('error'== msg){
							comp.message("系统报错，请联系管理员 !","error");
						}
					}
				});
		  }
		
		 //查看问题
		  function viewItem(id){
		 		comp.showModal("paperItemView","800px","-250px 0 0 -300px");
		 		$("#stmp_item").load("${rc.contextPath}/question/quesManage/nsm/viewItem.do?pk="+id);
		  }
		
		 //删除问题
		  function deleteItem(id){
				$.ajax({
					url:"${rc.contextPath}/question/quesManage/opt-modify/deleteItem.do",
					async:false,
					cache:false,
					type:"POST",
					data:{pk:id},
					success:function(msg){
						if('success'== msg){
							comp.message("问题删除成功");
							var param={id:$("#id").val(),name:$("#name").val(),paperCategory:$("#paperCategory").val(),comments:$("#comments").val()};
		   					$("#paperItemList").load("${rc.contextPath}/question/quesManage/nsm/asynLoadQuestion.do",param,function(){});
						}else if('error'== msg){
							comp.message("系统报错，请联系管理员 !","error");
						}
					}
				});
		  }

			//弹出题目多选控件
			function selectItem(paperId){
				var  questionNaireName = $("#name").val();
				var  paperType = $("#paperCategory").val();
				if(!comp.isNull(paperType) && !comp.isNull(paperType)){
					popItemPanel(paperId,paperType);
				}else{
					comp.message("请先完善问卷基本信息","error");
				}
			}
			
			/**
			  * 弹出题目选择控件
			  */
			function popItemPanel(paperId,paperType){
				$("#paperType").val(paperType);
				$.ajax({
					async :false,
					cache :false,
					timeout: 100000,
					type:"POST",
					url:"${rc.contextPath}/question/itemManage/opt-query/itemIdsQuery.do?paperId="+paperId+"&paperType="+paperType,
					error: function () {//请求失败处理函数
						comp.message("操作失败，请稍后再试","error");
						return;
					},
					success:function(data){ //请求成功后处理函数
						initValues(data,'NORMAL');
						queryCourseSubmit();
						comp.showModal("selectCoursesModal");
					}
				});
			}
			
			//获取选中的题目名称(多选)
			function getSelectedItem(itemIds,itemNames,itemCategoryTypes,itemTypes){
				comp.hideModal("selectCoursesModal");
				$.ajax({
					url:"${rc.contextPath}/question/questionInfo/opt-save/quesInfoSave.do",
					async:false,
					cache:false,
					type:"POST",
					data:{paperId:$("#id").val(),itIds:itemIds,itNames:itemNames,itCategoryTypes:itemCategoryTypes,itTypes:itemTypes},
					success:function(msg){
						if('success'== msg){
							var param={id:$("#id").val(),name:$("#name").val(),paperCategory:$("#paperCategory").val(),comments:$("#comments").val()};
		   					$("#paperItemList").load("${rc.contextPath}/question/quesManage/nsm/asynLoadQuestion.do",param,function(){});
						}
					}
				});
			}
			
			// 多选学生按照班级过滤
			function selectStudentByClassCheck()
			{
				  var selectedStuIds = $("#hiddenStuIds").val();
				_queryStudentByClassCheck(selectedStuIds,"");
			}
			
			//初始化学生信息
			function setClassStudentSelectCheckValue(studentIds,names)
			{
				$("#hiddenStuIds").val(studentIds);
				$.ajax({
					url:"${rc.contextPath}/question/quesWrite/opt-edit/initStudentInfo.do",
					async:false,
					cache:false,
					type:"POST",
					data:{paperId:$("#id").val(),studentIds:studentIds,stuNames:names},
					success:function(msg){
						if('success'== msg){
							var param = {studentIds:studentIds};
							$("#stuSelectedList").load("${rc.contextPath}/question/quesManage/nsm/asynLoadStuList.do",param,function(){});
						}else if('error'== msg){
							comp.message("系统错误，请联系管理员 !","error");
						}
					}
				});
			}
			
			// 多选教职工
			function selectTeacherCheck()
			{
				var selectedTeacherIds = $("#hiddenTeacherIds").val();
				_queryTeacherCheckAll(selectedTeacherIds);
			}
			
			//初始化教职工信息
			function setTeacherSelectValue(teacherIds,names)
			{
				$("#hiddenTeacherIds").val(teacherIds);
				$.ajax({
					url:"${rc.contextPath}/question/quesWrite/opt-edit/initTeacherInfo.do",
					async:false,
					cache:false,
					type:"POST",
					data:{paperId:$("#id").val(),teacherIds:teacherIds,teacherNames:names},
					success:function(msg){
						if('success'== msg){
							var param = {teacherIds:teacherIds};
							$("#teacherSelectedList").load("${rc.contextPath}/question/quesManage/nsm/asynLoadTeacherList.do",param,function(){});
						}else if('error'== msg){
							comp.message("系统错误，请联系管理员 !","error");
						}
					}
				});
			}
			
			function eisdResponse(r,s){
					var obj = eval("("+r+")");
					if(obj.success=="success"){
						if(obj.userType=="STUDENT"){
							var param = {pageNo:obj.pageNo,studentIds:${hiddenStuIds!"''"}};
							$("#stuSelectedList").load("${rc.contextPath}/question/quesManage/nsm/asynLoadStuList.do",param,function(){});
						}else if(obj.userType=="TEACHER"){
							var param = {pageNo:obj.pageNo,teacherIds:${hiddenTeacherIds!"''"}};
							$("#teacherSelectedList").load("${rc.contextPath}/question/quesManage/nsm/asynLoadTeacherList.do",param,function(){});
						}
					}
			}
        </script>
	<#include "/question/itemManage/comp/queryItemCheckbox.ftl">
	<#include "/comp/student/queryStudentByClassCheckBoxModal.ftl"> 
	<#include "/comp/teacher/queryTeacherCheckBoxModal.ftl">
	
	<div class="modal hide fade" id="paperItemView">
		<div class="modal-header">
			<button class="close" data-dismiss="modal">×</button>
			<h3 id="title1">题目查看</h3>
		</div>
		<div class="modal-body" id="stmp_item">
			<#include "paperItemView.ftl">
		</div>
		<div class="modal-footer">
		</div>
	</div>	
	</body>
</html>