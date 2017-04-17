<#if importFlag?? && exitCompanyinfos??>
	<form  id="comparePageQuery" action="${rc.contextPath}/job/companyInfo/opt-query/importCompareCompanyInfo.do" method="post">
		<div class="formSep">
			<div class="row-fluid">
				<span class="formTitle" style="color:red;">注意：以下数据为excel导入时和系统数据重复的记录，所选择的记录在重新导入时将被忽略，未选择的记录将被更新。</span>
				<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
					<thead>
						<tr>
							<th class="table_checkbox" rowspan="2" style="text-align:center;vertical-align:middle;">
							<input type="checkbox" name="select_rows" id="select_rows" class="select_rows" data-tableid="smpl_tbl" onclick="javascript:selectAll();"/>
							</th>
							<th width="45%" colspan="3" style="text-align:center;vertical-align:middle;">系统数据</th>
							<th width="45%" colspan="3" style="text-align:center;vertical-align:middle;">Excel数据</th>
						</tr>
						<tr>
							<th width="15%">学号</th>
							<th width="15%">学生姓名</th>
							<th width="15%">学院</th>
							<th width="15%">学号</th>
							<th width="15%">学生姓名</th>
							<th width="15%">学院</th>
						</tr>
					</thead>
					<tbody id="demo_list">
						<#list exitSchoolGoodStudents as e>
							<tr>
								<td style="text-align:center;vertical-align:middle;">
									<input type="checkbox" name="row_sel" id="${(e[0].studentId.id)!""}" class="select_row" onclick="javascript:selectSingle('${(e[0].studentId.id)!""}');"/>
								</td>
								<td class="autocut">${(e[0].studentId.id)!""?html}</td>
								<td class="autocut">${(e[0].studentId.name)!""?html}</td>
								<td class="autocut">${(e[0].college.name)!""?html}</td>
								
								<td class="autocut">${(e[1].studentId.id)!""?html}</td>
								<td class="autocut">${(e[1].studentId.name)!""?html}</td>
								<td class="autocut">${(e[1].college.name)!""?html}</td>
							</tr>
						</#list>
					</tbody>
				</table>
			</div>
		</div>
		<div class="formSep">
			<div class="row-fluid">
				<div class="span6">
					<p class="btnMargin">
						<button class="btn btn-info" type="button" onclick="javascript:submitImport();">
							确定导入
						</button>
					</p>
				</div>
			</div>
		</div>
		<input type="hidden" id="stuIds" name="stuIds" value="" />
	</form>
	<script type="text/javascript">
		var stuId = {};//用来存储忽略的学生学号
		//全选
		function selectAll(){
			var flag = $("#select_rows").prop("checked");
			$("input[name='row_sel']").each(function(){
				$(this).prop("checked",flag);
				var selectRowId = $(this).attr("id");
				if(flag){
					stuId[selectRowId] = selectRowId;
				}else{
					delete stuId[selectRowId];
				}
			});
		}
		//单选
		function selectSingle(rowId){
			var flag = true;
			$("input[name='row_sel']").each(function(){
				if(!$(this).prop("checked")){
					flag = false;
				}
			});
			$("#select_rows").prop("checked",flag);
			if($("#"+rowId).prop("checked")){
				stuId[rowId] = rowId;
			}else{
				delete stuId[rowId];
			}
		}
		//提交
		function submitImport(){
			comp.confirm("所选择的记录导入时将被忽略，确认导入吗？", function(flag) {
				if (flag){
					var stuIds = [];
					for(var key in stuId){
						stuIds.push(key);
					}
					$("#stuIds").val(stuIds.join());
					$("#stuIds").submit();
				}
			});
		}
	</script>
