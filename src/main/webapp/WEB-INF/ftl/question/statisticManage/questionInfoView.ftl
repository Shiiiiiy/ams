<!DOCTYPE html>
<html lang="en">
	<title></title>
    <head>
        <script src="${rc.contextPath}/js/jquery.form.js"></script>
        <script language="javascript" type="text/javascript" src="/ams/lib/My97DatePicker/WdatePicker.js"></script>
    </head>
    <body>
        <div id="contentwrapper">
           <div class="main_content">
           	<h3 class="heading">问卷查看</h3>
               <form  id="quesInfoAdd" action="${rc.contextPath}/question/questionInfo/opt-save/quesInfoSave.do" method="post">
               <input id="id" name="id" type="hidden" value="${(questionInfo.id)!""}"/>			
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
								<input  readOnly/>
							</#if>
						</div>
					</div>
					<div class="row-fluid">	
						<div class="span6">
							<span class="fromTitle">问卷备注</span>
							<textarea cols="80" rows="5" class="span10" id="comments" name="comments" readOnly>${(questionInfo.comments!"")?html}</textarea>
						</div>					
					</div>
				</form>
                	<div class="row-fluid">
						<div class="span12">
						<h5 class="heading"></h5>
							<div role="grid" class="dataTables_wrapper form-inline" id="dt_gal_wrapper">
								<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
									<thead>
										<tr>
											<th width="10%">序号</th>
											<th width="30%">问题名称</th>
											<th width="30%">问题类型</th>
											<th width="30%">题型</th>
										</tr>
									</thead>
									<tbody>
									<#if questionItemList??>	
									<#list questionItemList as p>
									<tr>
										<td>${p_index+1}</td>
										<td class="autocut">
											<a onclick="viewItem('${p.id}')" style="cursor: pointer" class="sepV_a" title="查看">${(p.itemName)!""}</a>
										</td>
										<td class="autocut"><#if p.itemCategory??>${(p.itemCategory.name)!""}</#if></td>
										<td class="autocut"><#if p.itemType??>${(p.itemType.name)!""}</#if></td>
									</tr>
									</#list>
								 </#if> 	
									</tbody>
								</table>
								<br/>
								<div class="row-fluid">
									<div class="span4">
										<div class="span2"></div>
										<div class="span10">
											 <button class="btn btn-info"  onclick="gotoList()">关 闭</button>
										</div>
									</div>
								</div>								
							</div>
						</div>
					</div>
						
                </div>
            </div>
			<script>
				     //取消
					function gotoList(){
						window.location.href="${rc.contextPath}/question/statisticManage/opt-query/quesStatisticQuery.do";
					}
				
				    //查看问题
				    function viewItem(id){
				 		comp.showModal("paperItemView","800px","-250px 0 0 -300px");
				 		$("#stmp_item").load("${rc.contextPath}/question/statisticManage/nsm/viewItem.do?pk="+id);
				    }
			</script>
		<div class="modal hide fade" id="paperItemView">
			<div class="modal-header">
				<button class="close" data-dismiss="modal">×</button>
				<h3 id="title1">题目查看</h3>
			</div>
			<div class="modal-body" id="stmp_item">
				<#include "quesItemView.ftl">
			</div>
			<div class="modal-footer">
			</div>
		</div>	
	</body>
</html>