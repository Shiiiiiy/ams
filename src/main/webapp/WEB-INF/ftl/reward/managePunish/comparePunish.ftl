<#if importFlag?? && page??>
<form  id="comparePageQuery" action="${rc.contextPath}/reward/managepunish/opt-query/importData.do" method="post">
	<div class="formSep">
		<div class="row-fluid">
			<span class="formTitle" style="color:red;">注意：以下数据为excel导入时和数据库重复的记录，所选择的记录在重新导入时将被忽略，未选择的记录将被更新。</span>
			<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
				<thead>
					<tr>
						<th class="table_checkbox" rowspan="2" style="text-align:center;vertical-align:middle;">
						<input type="checkbox" name="select_rows" id="select_rows" class="select_rows" data-tableid="smpl_tbl" onclick="javascript:selectAll();"/>
						</th>
						<th width="45%" colspan="4" style="text-align:center;vertical-align:middle;">数据库数据</th>
						<th width="45%" colspan="4" style="text-align:center;vertical-align:middle;">Excel数据</th>
					</tr>
					<tr>
						<th width="10%">姓名</th>
						<th width="10%">学号</th>
						<th width="15%">处分名称</th>
						<th width="15%">处分文号</th>
						<th width="10%">姓名</th>
						<th width="10%">学号</th>
						<th width="15%">处分名称</th>
						<th width="15%">处分文号</th>
					</tr>
				</thead>
				<tbody id="demo_list">
					<#list page.result as p>
						<tr>
							<td style="text-align:center;vertical-align:middle;">
								<input type="checkbox" name="row_sel" id="${(p[0].id)!""}" class="select_row" onclick="javascript:selectSingle('${(p[0].id)!""}');"/>
							</td>
							<td class="autocut">${(p[0].stuId.name)!""?html}</td>
							<td class="autocut">${(p[0].stuId.id)!""?html}</td>
							<td class="autocut">${(p[0].punish.name)!""?html}</td>
							<td class="autocut">${(p[0].punishNum)!""?html}</td>
							<td class="autocut">${(p[0].stuId.name)!""?html}</td>
							<td class="autocut">${(p[0].stuId.id)!""?html}</td>
							<td class="autocut">${(p[1].punish.name)!""?html}</td>
							<td class="autocut">${(p[1].punishNum)!""?html}</td>
						</tr>
					</#list>
				</tbody>
			</table>
			<div class="row-fluid">
				<div class="span12">
					<div class="span4">
						<div class="dataTables_info" id="dt_gal_info">
							<#assign hNext=false />
							<#if ((page.currentPageNo*page.pageSize)>=page.totalCount)>
								<#assign hNext=false />
							<#else>
								<#assign hNext=true />
							</#if>
						</div>
					</div>
					<div class="span8">
						<div class="dataTables_paginate paging_bootstrap pagination">
							<ul id="inspect_page">
								<li class="disabled">
									<a href="javascript:void(0);" >共${page.totalPageCount}页</a>
								</li>
								<#if page.currentPageNo==1>
									<li class="prev disabled">
										<a href="javascript:void(0);" >&lt;上一页</a>
									</li>
								<#else>
									<li class="prev">
										<a href="javascript:void(0);" onclick="gotoInspectPage('${page.previousPageNo}')">&lt;上一页</a>
									</li>
								</#if>
								<#if hNext >
									<li class="next">
										<a href="javascript:void(0);" onclick="gotoInspectPage('${page.nextPageNo}')">下一页 &gt; </a>
									</li>
								<#else>
									<li class="next disabled">
										<a href="javascript:void(0);" >下一页 &gt; </a>
									</li>
								</#if>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="formSep">
		<div class="row-fluid">
			<div class="span6">
				<p class="btnMargin">
					<button class="btn btn-info" type="button" onclick="javascript:submitImport();" >
						确定导入
					</button>
				</p>
			</div>
		</div>
	</div>
	<input type="hidden" id="compareId" name="compareId" value="" />
</form>
<script type="text/javascript">
	var compareObj = {};

	function contains(id){
		for(var key in compareObj){
			if(key == id)
				return true;
		}
		return false;
	}
	
	function selectAll() {
		var checked = jQuery("#select_rows").prop("checked");
		jQuery("input[name='row_sel']").each(function() {
			jQuery(this).prop("checked", checked);
			var id = jQuery(this).attr("id");
			if (checked) {
				compareObj[id] = id;
			} else {
				delete compareObj[id];
			}
		});
	}

	function selectSingle(id) {
		var flag = true;
		jQuery("input[name='row_sel']").each(function() {
			if (!jQuery(this).prop("checked")) {
				flag = false;
			}
		});
		jQuery("#select_rows").prop("checked", flag);
		var checked = jQuery("#" + id).prop("checked");
		if (checked) {
			compareObj[id] = id;
		} else {
			delete compareObj[id];
		}
	}

	function submitImport() {
		var array = [];
		for (var key in compareObj) {
			array.push(key);
		}
		jQuery("#compareId").val(array.join());
		comp.confirm("所选择的记录导入时将被忽略，确认导入吗？", function(flag) {
			if (flag)
				jQuery("#comparePageQuery").submit();
		});
	}
	
	function gotoInspectPage(page) {
		jQuery.getJSON("${rc.contextPath}/reward/managepunish/opt-query/comparePunish.do",
			{
				"pageNo":page
			},function(data){
				jQuery("#demo_list").empty();
				var result = data.result;
				jQuery.each(result, function(i, item) {
					var flag = contains(item.id);
					var html = "<tr>"
							+"	<td style='text-align:center;vertical-align:middle;'><input type='checkbox' name='row_sel' id='"+item.id+"' class='select_row' onclick='javascript:selectSingle(\""+item.id+"\");' "+(flag?"checked":"")+"/></td>"
							+"	<td class='autocut'>"+item.stuName+"</td>"
							+"	<td class='autocut'>"+item.stuId+"</td>"
							+"	<td class='autocut'>"+item.punish+"</td>"
							+"	<td class='autocut'>"+item.punishNum+"</td>"
							+"	<td class='autocut'>"+item.xlsStuName+"</td>"
							+"	<td class='autocut'>"+item.xlsStuId+"</td>"
							+"	<td class='autocut'>"+item.xlsPunish+"</td>"
							+"	<td class='autocut'>"+item.xlsPunishNum+"</td>"
							+"</tr>";
					jQuery("#demo_list").append(html);
				});
			
				var page = data.page;
				jQuery("#inspect_page").empty();
				var pageHTML = '<li class="disabled">'
							  +' <a href="javascript:void(0);" >共'+page.totalPageCount+'页</a>'
							  +'</li>';
				if(page.currentPageNo == 1)
					pageHTML += '<li class="prev disabled">'
							   +' <a href="javascript:void(0);" >&lt;上一页</a>'
							   +'</li>';
				else
					pageHTML += '<li class="prev">'
							   +'	<a href="javascript:void(0);" onclick="gotoInspectPage(\''+page.previousPageNo+'\')">&lt;上一页</a>'
							   +'</li>';
							
				if((page.currentPageNo*page.pageSize)>=page.totalCount)
					pageHTML += '<li class="next disabled">'
							   +'	<a href="javascript:void(0);" >下一页 &gt; </a>'
							   +'</li>';
				else
					pageHTML += '<li class="next">'
								+'	<a href="javascript:void(0);" onclick="gotoInspectPage(\''+page.nextPageNo+'\')">下一页 &gt; </a>'
								+'</li>';
				jQuery("#inspect_page").append(pageHTML);
		});
	}
</script>
<#elseif importFlag?? && !(errorText??)>
	<span style="color:blue;font-size:15px">导入成功</span>
</#if>
