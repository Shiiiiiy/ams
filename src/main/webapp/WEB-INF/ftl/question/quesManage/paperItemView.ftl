<div id="configContext" style="position:relative;">
	<div class="row-fluid">
		<div class="span2">问题名称:</div>
		<div class="span8"><#if itemName??>${itemName!""}</#if></div>
	</div><br>
	<div class="row-fluid">
		<div class="span2">题型:</div>
		<div class="span8"><#if itemTypeName??>${itemTypeName!""}</#if></div>
	</div><br>
	<#if quesOptionList??>	
	<div class="row-fluid"  id="item001">
		<div class="span12">
			<div role="grid" class="dataTables_wrapper form-inline" id="itemOption">
				<table class="table table-bordered table-striped tablecut" id="optionTable">
					<thead>
						<tr>
							<th width="8%">选项</th>
							<th><div align="center">答案选项</div></th>
						</tr>
					</thead>
					<tbody>
						<#list quesOptionList as option>
							<tr>
								<td>${option.optionCode!""}</td>
								<td>${option.optionName!""}</td>
							</tr>
						</#list>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	</#if> 	
</div>
<script>
</script>