<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script src="${rc.contextPath}/js/jquery.form.js"></script>
	<link rel="stylesheet" href="${rc.contextPath}/lib/My97DatePicker/skin/WdatePicker.css" />
	<script type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
  </head>
<body>
<div id="contentwrapper">
    <div class="main_content">   
				<h3 class="heading">学期配置</h3>
				<div class="row-fluid">
					<div class="span12">
						<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
			        	<div class="row">
				            <div class="span10">
				                <div class="dt_actions">
				                    <div class="row-fluid">
					                    <#if user_key.optMap??>
											<#if user_key.optMap['add']??>
						                         <button class="btn btn-info" type="button"  onclick="javascript:add('')">新 增</button>
											</#if>
										</#if>
				                    </div>
				                </div>
				            </div>
				        </div>
				        	
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
							<thead>
								<tr>
									<th width="6%">序号</th>
									<th width="10%">学年</th>
									<th width="10%">学期</th>
									<th width="15%">开始日期</th>
									<th width="15%">结束日期</th>
									<th width="10%">操作</th>
								</tr>
							</thead>
							<tbody>
							<#if termList??>	
								<#list termList as p>
								<tr>
									<td>${p_index+1}</td>
									<td class="autocut">${p.yearDic.name!""?html}</td>
									<td class="autocut">${p.termDic.name!""?html}</td>
									<td class="autocut">${(p.beginDate!"")?string("yyyy-MM-dd")}</td>
									<td class="autocut">${(p.endDate!"")?string("yyyy-MM-dd")}</td>
									<td>
										<a href="javascript:void(0);" onclick="add('${p.id!""}');" title="编辑"><i class="icon-edit"></i></a>
									</td>
								</tr>
								</#list>
							 </#if> 
							</tbody>
						</table>
					</div>
				</div>
			</div> 
		</div> 
	</div>
</div>

<#-- 新增 修改 弹出层 -->
<div class="modal hide fade" id="_termConfigEditDiv">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3 id="title1">学期设置</h3>
	</div>
	<div class="modal-body" id="_term_config_body">
		
	</div>
	<div class="modal-footer">
		<a href="javascript:void(0);" class="btn btn-info" onclick="saveInfo();">保存</a>
		<a href="javascript:void(0);" class="btn" data-dismiss="modal">关闭</a>
	</div>
</div>
<script>
// 新增 修改
function add(id)
{
	comp.showModal("_termConfigEditDiv","680px","-250px 0 0 -300px");
	$("#_term_config_body").empty();
	$("#_term_config_body").load("${rc.contextPath}/common/term/nsm/termConfigEdit.do",{"id":id},function(){});
}

// 保存 
function saveInfo()
{
	if($("#_termConfigForm").compValidate().form())
	{
		$("#_termConfigForm").ajaxSubmit({
	        type: 'post', 
	        url: '${rc.contextPath}/common/term/opt-submit/ajaxSubmitTermConfig.do', 
	        data:$("#_termConfigForm").serialize(),
	        success: function(data)
	        {
	        	if(data == "success")
	        	{
	        		comp.hideModal("_termConfigEditDiv");
	        		window.location.reload();
	        	}
	        	else if(data == "exist")
	        	{
	        		var term = $("#termId").find('option:selected').text();
	        		var year = $("#yearId").find('option:selected').text();
	        		comp.message(year+" "+term+" 的设置已经存在，请查调整保存!","info");
	        	}
	        }
	    });
	}
}

</script>
</body>
</html>