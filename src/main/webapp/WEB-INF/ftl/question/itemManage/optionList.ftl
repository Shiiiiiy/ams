<input type="hidden" id="optionSize" name="optionSize" value="${(optionSize)!""}"/>
<div class="formSep">
	<div class="row-fluid">
		<div role="grid" class="dataTables_wrapper form-inline" id="dt_gal_wrapper">	
			<div class="row">
	            <div class="span10">
	                <div class="dt_actions">
	                    <div class="row-fluid">
		                    <#if user_key.optMap??>
								<#if user_key.optMap['add']??>
									<button class="btn btn-info"   type="button" onclick="popedit('')" >
											新增选项
									</button>							
								</#if>
							</#if>	
	                    </div>
	                </div>
	            </div>
	        </div>
		<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
			<thead>
				<tr>
					<th class="head" align="center">选项顺序</th>
					<th  class='head'  align='center'>
									选项名称
					</th>
					<th  class='head' align='center'>
									选项链接
					</th>
					<#if user_key.optMap['update']?? || user_key.optMap['del']??>
						<th class='head' align='center'>操作</th>
					</#if>
				</tr>
			</thead>

			<tbody>
			<#if optionList??>	
				<#list optionList as p>
				<tr>
					<td class="autocut">${(p.seqNum!"")?html}</td>
					<td class="autocut">${(p.optionName!"")?html}</td>
			      	<td class="autocut">${(p.optionUrl?html)!""}</td>
					<#if user_key.optMap['update']?? || user_key.optMap['del']??>
					<td>
							<a href="###"  onclick="popedit('${(p.id?html)!""}')" class="sepV_a" title="修改"><i class="icon-edit"></i></a>
							<a href="###" onclick="delOption('${(p.id?html)!""}')" title="删除"><i class="icon-trash"></i></a>
							<a href="###"  onclick="moveUp('${p.id}')" class="sepV_a" title="上移"><i class="icon-circle-arrow-up"></i></a>
							<a href="###"  onclick="moveDown('${p.id}')" class="sepV_a" title="下移"><i class="icon-circle-arrow-down"></i></a>
						</td>
						</#if>
					</tr>
					</#list>
				 </#if> 
				</tbody>
			</table>
		</div>
	</div>	
</div>
<script>
	//删除选项
 	function delOption(optionId){
 		var itemId= $("#itemId").val();
 		comp.confirm("删除数据可能会造成系统其他业务功能无法正常使用，确认要删除？", function(result) {
	        	if(!result)
	        		return;  
	    		$.post("${rc.contextPath}/question/itemManage/opt-del/delQuesOption.do", {optionId:optionId,itemId:itemId}, function(data){
					 if(data=='success') {	
					 	comp.message(" 删除成功！","info");
						 var time=Date.parse(new Date());					    
						$("#itemOption").load("${rc.contextPath}/question/itemManage/nsm/optionList.do?id="+itemId+"&time="+time);
					 }else{
						 comp.message(" 删除失败！","error");
					 }	    			
				    
				   },"text");
			});
 	}
 	 //上移记录
	  function moveUp(id){
	  		var itemId= $("#itemId").val();
			$.ajax({
				url:"${rc.contextPath}/question/itemManage/opt-modify/moveUpItem.do",
				async:false,
				cache:false,
				type:"POST",
				data:{id:id},
				success:function(msg){
					if('success'== msg){
						comp.message("选项上移成功");
	   					var time=Date.parse(new Date());					    
						$("#itemOption").load("${rc.contextPath}/question/itemManage/nsm/optionList.do?id="+itemId+"&time="+time);
					}else if('min'== msg){
						comp.message("无法继续上移");
					}else if('null'== msg){
						comp.error("当前选项不存在，请联系管理员 !");
					}else if('error'== msg){
						comp.error("系统报错，请联系管理员 !");
					}
				}
			});
	  }
	
	 //下移记录
	  function moveDown(id){
	  		var itemId= $("#itemId").val();
			$.ajax({
				url:"${rc.contextPath}/question/itemManage/opt-modify/moveDownItem.do",
				async:false,
				cache:false,
				type:"POST",
				data:{id:id},
				success:function(msg){
					if('success'== msg){
						comp.message("选项下移成功");
						var time=Date.parse(new Date());					    
						$("#itemOption").load("${rc.contextPath}/question/itemManage/nsm/optionList.do?id="+itemId+"&time="+time);
					}else if('max'== msg){
						comp.message("无法继续下移");
					}else if('null'== msg){
						comp.error("当前选项不存在，请联系管理员 !");
					}else if('error'== msg){
						comp.error("系统报错，请联系管理员 !");
					}
				}
			});
	  }
</script>