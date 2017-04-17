<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="${rc.contextPath}/css/bdp_comp.css" type="text/css">
    <!-- My97DatePicker -->
    	<link rel="stylesheet" href="${rc.contextPath}/lib/My97DatePicker/skin/WdatePicker.css" />
		<script type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
    </head>
    <body> 
		<div id="contentwrapper">
   		<div class="main_content">   
    	   <div class="row-fluid">	
    		<form  id="mesageInfoQuery" action="${rc.contextPath}/message/messageInfo/opt-query/listMessageInfo.do" method="post">
				<div class="span12">			
					<div class="row-fluid">
						<div class="span4">
							标题
							<input name="title" class="span7" value="${(messageInfo.title!"")?html}"/>
						 </div>
						 
						 <div class="span4">
							类型
							<select size="1" id="messageType" name="messageType.id" class="span7"  aria-controls="dt_gal" >
								<option value=""  >请选择..</option>
								<#if listMessageType??>
								<#list listMessageType as mt>
									<#if messageInfo ?? && messageInfo.messageType ?? && messageInfo.messageType.id == mt.id>
										<option value="${mt.id}" data-code="${mt.code?html}" selected="selected">${mt.name?html}</option>	
									<#else>
										<option value="${mt.id}" data-code="${mt.code?html}" >${mt.name?html}</option>	
									</#if>
								</#list>
								</#if>
							</select>
						</div>
						<div class="span4">
							发布日期
							<#if messageInfo.startDate??>
								<input id="startDate" name="startDate" class="Wdate"
								 style="cursor:pointer;width: 85px;" onclick="WdatePicker({skin:'whyGreen', maxDate:'#F{$dp.$D(\'endDate\')||\'new Date()\'}'});"  value='${(messageInfo.startDate!"")?string("yyyy-MM-dd")}' />
							<#else>
								<input id="startDate" name="startDate" class="Wdate" 
								style="cursor:pointer;width: 85px;" onclick="WdatePicker({skin:'whyGreen', maxDate:'#F{$dp.$D(\'endDate\')||\'new Date()\'}'});"  value=""  />
							</#if>
							至
							<#if messageInfo.endDate??>
								<input id="endDate" name="endDate" class="Wdate"
								 style="cursor:pointer;width: 85px;" onclick="WdatePicker({skin:'whyGreen', minDate:'#F{$dp.$D(\'startDate\')}', maxDate:'newDate()'});"  value='${(messageInfo.endDate!"")?string("yyyy-MM-dd")}' />
							<#else>
								<input id="endDate" name="endDate" class="Wdate" 
								style="cursor:pointer;width: 85px;" onclick="WdatePicker({skin:'whyGreen', minDate:'#F{$dp.$D(\'startDate\')}',maxDate:'newDate()'});"  value="" />
							</#if>
						</div>
					</div> 
		            <div class="btnCenter">
		              <input type="submit" class="btn btn-info" value="查 询"/>
		              <input type="button" class="btn btn-info"  onclick="comp.clearForm('mesageInfoQuery');" value="清 空"/>
		            </div>
				</div>
			</form>
			
				<div class="row-fluid">
					<div class="span12">
						<h5 class="heading"></h5>
						<div id="" class="dataTables_wrapper form-inline" role="grid">
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
							<thead>
								<tr>
									<th width="6%">序号</th>
									<th width="30%">标题</th>
									<th width="15%">类型</th>
									<th width="12%">创建日期</th>
									<th width="12%">发布日期</th>
									<th width="6%">操作</th>
								</tr>
							</thead>
							<tbody>
								<#if page??>	
									<#list page.result as p>
										<tr>
											<td class="autocut">${p_index+1}</td>
											<td class="autocut"><a href="javascript:void(0);" onclick="viewNotice('${p.id}');" >${p.title!""}</a></td>
											<td class="autocut"><#if p.messageType??>${p.messageType.name}</#if></td>
											<td class="autocut"><#if p.createTime??>${(p.createTime!"")?string("yyyy-MM-dd")}</#if></td>
											<td class="autocut" id="${p.id}date"><#if p.postDate??>${(p.postDate!"")?string("yyyy-MM-dd")}</#if></td>
											<td class="autocut">
												<a href="javascript:void(0);" onclick="viewNotice('${p.id}');"  title="查看"><i class="icon-list-alt"></i></a>
											</td>
										</tr>
									</#list>
								</#if>
							</tbody>
						</table>
						
					 	<#assign pageTagformId="mesageInfoQuery"/>
						<#include "/page.ftl" /> 
					</div>
				</div>
			</div> 
		</div> 
	</div>
</div>

<#-- 发布按钮弹窗 -->
<div class="modal hide fade" id="_showModel">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3 id="title1">置顶标红</h3>
	</div>
	<div class="modal-body " style="overflow:hidden" >
		<div class="span12 row-fluid">
			<div class="span4">
				<span class="formTitle">置顶</span>
				<input type="checkbox" class="span7" name="isUp" />
			</div>
			
			<div class="span4">
				<span class="formTitle">标红</span>
				<input type="checkbox" class="span7" id="" name="isRed" />
			</div>
		</div>
	</div>
	<div class="modal-footer">
		<a href="#" class="btn" data-dismiss="modal">关闭</a>
		<a href="#" class="btn btn-info" onclick="postMessage()">确定</a>
	</div>
</div>
<#-- 发布按钮弹窗 -->

<div class="modal hide fade" id="notice_view">
	<div class="modal-header">
		<button class="close" data-dismiss="modal">×</button>
		<h3 id="title1">公告信息查看</h3>
	</div>
	<div class="modal-body" id="notice_view_body">
		
	</div>
	<div class="modal-footer">
		<a href="#" class="btn" data-dismiss="modal">关闭</a>
	</div>
</div>

<#-- 脚本开始 -->
<script>
	/***
	//栏目随类型变化
	$("#messageType").change(function() {
		//迎新要有栏目，其他类型没有栏目
		if($("#messageType option:selected").attr("data-code")=="MESSAGE_ORIENTATION") {
			
			$("#columnControl").removeClass("hidden");
		}else {
			$("#messageColumn").val("");
			$("#columnControl").removeClass().addClass("span4 hidden");
		}
	});*/
	
	$("#mesageInfoQuery").compValidate({
		rules:{
			title:{maxlength:30}
		},
		messages:{
			title:{maxlength:'标题长度不超过30字'}
		}
	});
	
	
	function viewNotice(id)
	{
		comp.showModal("notice_view","800px","-250px 0 0 -350px");
		$("#notice_view_body").load("${rc.contextPath}/message/message/nsm/viewMessage.do?flag=view&id="+id);
	}
	
</script>
</body>
</html>