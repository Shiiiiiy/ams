<div class="formSep">
	<div class="row-fluid">
		<div class="span6">
			<div class="span4">
	    		<span>名额限制</span>
			</div>
	    	<div class="span4">
				<div id="dt_gal_wrapper"  style="width:780px;" role="grid">
   					<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
   						<#if quotaInfoList??>	
   						<thead>
							<tr>
							<#list quotaInfoList as p>
								<th class="autocut" style="text-align: center">${p.academyId.name!""?html}</th>
							</#list>
							</tr>
						</thead>
   						<tbody>
						<tr>
							<#list quotaInfoList as p>
								<td class="autocut" style="text-align:center;padding:5px;padding-bottom:0px;">${p.num!""}&nbsp;</td>
							</#list>
						</tr>
   						</tbody>
   						 </#if> 
					</table>
				</div>
			</div>
		</div>
	</div>
</div>