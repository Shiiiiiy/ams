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
           	<h3 class="heading">问卷查看</h3>
               <form  id="quesItemForm"  method="post">
               		<input id="id" name="id" type="hidden" value="${(questionInfo.id)!""}"/>	
               		<input id="commonTypeId" name="commonTypeId" type="hidden" value="${(commonTypeId)!""}"/>			
					<div class="row-fluid">
						<div class="span6">
							<span class="formTitle">问卷名称</span>
							<input id="name" class="span10" name="name" value="${(questionInfo.name)!""}" readOnly/>
						</div>
						<div class="span4">
							<span class="formTitle">问卷类型</span>
							<#if questionInfo.typeDic??>
								<input class="span6" value="${questionInfo.typeDic.name!""}" readOnly/>
							<#else>
								<input class="span6" readOnly/>
							</#if>
						</div>
					</div>
					<div class="row-fluid">
						<div class="span6">
							<span class="formTitle">问卷备注</span>
							<textarea cols="80" rows="5" class="span10" id="comments" name="comments" readOnly>${(questionInfo.comments!"")?html}</textarea>
						</div>		
						<div class="span4">
							<span class="formTitle">是否公开</span>
							<#if questionInfo.isOpen?? && questionInfo.isOpen=='Y'>
								<input class="span6" value="是" readOnly/>
							</#if>
							<#if questionInfo.isOpen?? && questionInfo.isOpen=='N'>
								<input class="span6" value="否" readOnly/>
							</#if>
						</div>
					</div>
				</form>
                	<div class="row-fluid">
						<div class="span12">
								<div  id="itemOption">
									<#include "paperItemListView.ftl">
								</div>
								
								<#if questionInfo.isOpen?? && questionInfo.isOpen=='Y'>
								<div id="paperUserDiv"  style="display:none">
								<#else>
								<div id="paperUserDiv"  style="display:''">
								</#if>
								<h5 class="heading"></h5>
								<!--<#include "teacherSelectedList.ftl">-->
								<h5 class="heading"></h5>
								<#include "stuSelectedList.ftl">
								</div>
								
								<br/>
								
							<div class="row-fluid span6">
								<div class="span1"></div>
								<div class="span6">
									 <button class="btn btn-info"  onclick="gotoList()">返回</button>
								</div>
				            </div>
						</div>
					</div>
                </div>
            </div>
		<script>
			//取消
			function gotoList(){
				window.location.href="${rc.contextPath}/question/quesManage/opt-query/quesInfoQuery.do";
			}
		
		    //查看问题
		    function viewItem(id){
		 		comp.showModal("paperItemView","800px","-250px 0 0 -300px");
		 		$("#stmp_item").load("${rc.contextPath}/question/quesManage/nsm/viewItem.do?pk="+id);
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