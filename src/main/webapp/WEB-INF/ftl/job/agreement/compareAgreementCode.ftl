	
<#if importFlag?? && page??>
	<form id="comparePageQuery" action="${rc.contextPath}/job/agreement/opt-import/importConfirmData.do" method="post">
		<div class="formSep">
			<div class="row-fluid">
				<span class="formTitle" style="color:red;">注意：以下数据为excel导入时和数据库重复的记录，所选择的数据将不会被替换，未选择的记录将被替换。</span>
				<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
					<thead>
						<tr>
							<th class="table_checkbox" rowspan="2" style="text-align:center;vertical-align:middle;">
							<input type="checkbox" name="select_rows" id="select_rows" class="select_rows" data-tableid="smpl_tbl" onclick="javascript:selectAll();"/>
							</th>
							<th width="45%" colspan="3" style="text-align:center;vertical-align:middle;">数据库数据</th>
							<th width="45%" colspan="3" style="text-align:center;vertical-align:middle;">Excel数据</th>
						</tr>
						<tr>
							<th width="10%">姓名</th>
							<th width="10%">学号</th>
							<th width="15%">就业协议书编号</th>
							<th width="10%">姓名</th>
							<th width="10%">学号</th>
							<th width="15%">就业协议书编号</th>
						</tr>
					</thead>
					<tbody id="demo_list">
						<#list page.result as p>
							<tr>
							<td style="text-align:center;vertical-align:middle;">
								<input type="checkbox" name="row_sel" id="${(p[0].id)!""}" class="select_row" onclick="javascript:selectSingle('${(p[0].id)!""}');"/>
							</td>
							<td class="autocut">${(p[0].student.name)!""?html}</td>
							<td class="autocut">${(p[0].student.stuNumber)!""?html}</td>
							<td class="autocut">${(p[0].agreementCode)!""?html}</td>
							<td class="autocut">${(p[1].stuName)!""?html}</td>
							<td class="autocut">${(p[1].stuNumber)!""?html}</td>
							<td class="autocut">${(p[1].agreementCode)!""?html}</td>
							</tr>
						</#list>
					</tbody>
				</table>
			
			<div class="row-fluid">
				<div class="span6">
					<p class="btnMargin">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button class="btn btn-info" type="button" onclick="javascript:submitImport();">
							确定导入
						</button>
					</p>
				</div>
			</div>
		<input type="hidden" id="compareId" name="compareId" value="" />
		</div>
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
				console.info(id);
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
			comp.confirm("所选择的记录导入时将被不会更新，确认导入吗？", function(flag) {
				if (flag)
					jQuery("#comparePageQuery").submit();
			});
		}
		
		
	</script>
<#elseif importFlag?? && !(errorText??)>
	<span style="color:blue;font-size:15px">导入成功</span>
</#if>
