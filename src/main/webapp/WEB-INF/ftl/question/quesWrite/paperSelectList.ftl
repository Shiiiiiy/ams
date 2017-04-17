	<div class="row-fluid">
	   <form  id="paperListForm" action="${rc.contextPath}/question/quesSelect/nsm/quesSelectQuery.do" method="post">
		<div class="span12">
			<div role="grid" class="dataTables_wrapper form-inline" id="dt_gal_wrapper">
				<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
					<thead>
						<tr>
							<th width="4%"></th>
							<th width="24%">问卷名称</th>
							<th width="24%">问卷类型</th>
							<th width="24%">问卷状态</th>
							<th width="24%">启用日期</th>
						</tr>
					</thead>
					<tbody>
					<#if page??>	
					<#list page.result as p>
						<tr>
							<td><input type="radio" name="accessPaper" value="${p.id!""}"/></td>
							<td class="autocut">${(p.name)!""}</td>
							<td class="autocut"><#if p.typeDic??>${(p.typeDic.name)!""}</#if></td>
							<td class="autocut"><#if p.statusDic??>${(p.statusDic.name)!""}</#if></td>
							<td class="autocut">${(p.releaseDate)!""}</td>
						</tr>
						</#list>
					 </#if> 	
					</tbody>
				</table>
			</div>
		</div>
		</form>
	</div>	
	<div class="modal-footer">
		<a href="###" class="btn btn-info" data-dismiss="modal" onclick="initSelectedPaper()">确定</a>		
	</div>

