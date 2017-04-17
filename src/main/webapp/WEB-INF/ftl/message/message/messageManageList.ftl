<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <link rel="stylesheet" href="${rc.contextPath}/css/bdp_comp.css" type="text/css" />
    <!-- My97DatePicker -->
    	<link rel="stylesheet" href="${rc.contextPath}/lib/My97DatePicker/skin/WdatePicker.css" />
		<script type="text/javascript" src="${rc.contextPath}/lib/My97DatePicker/WdatePicker.js"></script>
    </head>
    <body> 
		<div id="contentwrapper">
   		<div class="main_content">   
    	   <div class="row-fluid">	
    		<form  id="mesageInfoQuery" action="${rc.contextPath}/message/message/opt-query/listMessageInfo.do" method="post">
				<div class="span12">			
					<div class="row-fluid">
						<div class="span4">
							标题
							<input name="title" class="span7" value="${(messageInfo.title!"")?html}"/>
						 </div>
						 
						 <div class="span4">
							状态
							<select size="1" name="postState.id" aria-controls="dt_gal" class="span7">
								<option value=""  >请选择..</option>
								<#if listPostState??>
									<#list listPostState as ps>
										<#if messageInfo ?? && messageInfo.postState ?? && messageInfo.postState.id == ps.id>
											<option value="${ps.id}" selected="selected">${ps.name?html}</option>	
										<#else>
											<option value="${ps.id}" >${ps.name?html}</option>	
										</#if>
									</#list>
								</#if>
							</select>
						</div>
						<div class="span4">
							发布日期
							<#if messageInfo.startDate??>
								<input id="startDate" name="startDate" class="Wdate"
								 style="cursor:pointer;width: 85px;" onclick="WdatePicker({skin:'whyGreen', maxDate:'#F{$dp.$D(\'endDate\')||\'new Date()\'}'});"  value='${(messageInfo.startDate)?string("yyyy-MM-dd")}' />
							<#else>
								<input id="startDate" name="startDate" class="Wdate" 
								style="cursor:pointer;width: 85px;" onclick="WdatePicker({skin:'whyGreen', maxDate:'#F{$dp.$D(\'endDate\')||\'new Date()\'}'});"  value=""  />
							</#if>
							至
							<#if messageInfo.endDate??>
								<input id="endDate" name="endDate" class="Wdate"
								 style="cursor:pointer;width: 85px;" onclick="WdatePicker({skin:'whyGreen', minDate:'#F{$dp.$D(\'startDate\')}', maxDate:'newDate()'});"  value='${(messageInfo.endDate)?string("yyyy-MM-dd")}' />
							<#else>
								<input id="endDate" name="endDate" class="Wdate" 
								style="cursor:pointer;width: 85px;" onclick="WdatePicker({skin:'whyGreen', minDate:'#F{$dp.$D(\'startDate\')}', maxDate:'newDate()'});"  value="" />
							</#if>
						</div>
					</div> 
					<div class="row-fluid">
						<div class="span4">
							类型
							<select size="1" id="messageType" name="messageType.id" aria-controls="dt_gal" class="span7">
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
						<div class="span3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				              <input type="submit" class="btn btn-info" value="查 询"/>
				              <input type="button" class="btn btn-info"  onclick="comp.clearForm('mesageInfoQuery');" value="清 空"/>
			            </div>
					</div>
				</div>
			</form>
			
				<div class="row-fluid">
					<div class="span12">
						<h5 class="heading"></h5>
						<div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
						
					        <div class="row">
					            <div class="span10">
					                <div class="dt_actions">
					                    <div class="row-fluid">
				                    <button class="btn btn-info" type="button" id="addMessage-button">
				                   		 新 增
				                    </button>
				                    <button class="btn btn-info" type="button" id="postMessage-button">
				                   		发 布
				                    </button>
				                    <button class="btn btn-info" type="button" id="cancelMessage-button">
				                   		取消发布
				                    </button>
				                  </div>
				                </div>
				            </div>
				        </div>
						<table class="table table-bordered table-striped tablecut" id="smpl_tbl">
							<thead>
								<tr>
									<th width="5%"><input id="_totalSelect" type="checkbox" /></th>
									<th width="30%">标题</th>
									<th width="12%">类型</th>
									<th width="12%">创建日期</th>
									<th width="12%">发布日期</th>
									<th width="8%">状态</th>
									<th width="10%">操作</th>
								</tr>
							</thead>
							<tbody>
								<#if page??>	
									<#list page.result as p>
										<tr>
											<td class="autocut"><input name="messageCheck" value="${p.id}" type="checkbox" /></td>
											<td class="autocut"><a href="javascript:void(0);" onclick="viewNotice('${p.id}');" >${p.title!""}</a></td>
											<td class="autocut"><#if p.messageType??>${p.messageType.name}</#if></td>
											<td class="autocut"><#if p.createTime??>${(p.createTime!"")?string("yyyy-MM-dd")}</#if></td>
											<td class="autocut" id="${p.id}date"><#if p.postDate??>${(p.postDate!"")?string("yyyy-MM-dd")}</#if></td>
											<td class="autocut" id="${p.id}state"><#if p.postState??>${p.postState.name!""}</#if></td>
											<td>
												<a href="javascript:void(0);" onclick="viewNotice('${p.id}');" title="查看" ><i class="icon-list-alt"></i></a>
												<a href="${rc.contextPath}/message/message/opt-edit/editMessage.do?id=${p.id}" title="修改" id="${p.id}c" class="<#if p.postState?? && p.postState.code=="POSTED">hide</#if>"><i class="icon-edit"></i></a>
												<a href="#" id="${p.id}p" onClick="showModel('${p.id}')" title="发布" class="<#if p.postState?? && p.postState.code=="POSTED">hide</#if>"><i class="icon-eye-open"></i></a>
												<a href="#" id="${p.id}n" onClick="cancelPost('${p.id}')" title="取消发布" class="<#if p.postState?? && p.postState.code=="POSTED"><#else>hide</#if>"><i class="icon-eye-close"></i></a>
												<a href="#" onClick="delMessage('${p.id}', '${p.title!""}')" title="删除" id="${p.id}d" class="<#if p.postState?? && p.postState.code=="POSTED">hide</#if>"><i class="icon-trash"></i></a>
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
			
			
			function viewNotice(id)
			{
				comp.showModal("notice_view","800px","-250px 0 0 -350px");
				$("#notice_view_body").load("${rc.contextPath}/message/message/nsm/viewMessage.do?flag=view&id="+id);
			}
		
			//添加按钮
			$("#addMessage-button").click(function() {
				window.location.href="${rc.contextPath}/message/message/opt-add/editMessage.do";
			});
			
			var _messageId = "";
			//发布按钮
			function showModel(id) {
				_messageId = id;
				comp.showModal("_showModel");
			}
			
			
			//日期格式转为String类型的方法
			// 对Date的扩展，将 Date 转化为指定格式的String
			// 月(M)、日(d)、小时(h)、分(m)、秒(s)、季度(q) 可以用 1-2 个占位符， 
			// 年(y)可以用 1-4 个占位符，毫秒(S)只能用 1 个占位符(是 1-3 位的数字) 
			// 例子： 
			// (new Date()).Format("yyyy-MM-dd hh:mm:ss.S") ==> 2006-07-02 08:09:04.423 
			// (new Date()).Format("yyyy-M-d h:m:s.S")      ==> 2006-7-2 8:9:4.18 
			Date.prototype.Format = function (fmt) { 
				var o = {
					"M+": this.getMonth() + 1, //月份 
					"d+": this.getDate(), //日 
					"h+": this.getHours(), //小时 
					"m+": this.getMinutes(), //分 
					"s+": this.getSeconds(), //秒 
					"q+": Math.floor((this.getMonth() + 3) / 3), //季度 
					"S": this.getMilliseconds() //毫秒 
				};
				if (/(y+)/.test(fmt)) fmt = fmt.replace(RegExp.$1, (this.getFullYear() + "").substr(4 - RegExp.$1.length));
				for (var k in o)
				if (new RegExp("(" + k + ")").test(fmt)) fmt = fmt.replace(RegExp.$1, (RegExp.$1.length == 1) ? (o[k]) : (("00" + o[k]).substr(("" + o[k]).length)));
				return fmt;
			}
			
			
			//弹窗确定按钮
			function postMessage() {
				comp.hideModal("_showModel");
				var up;
				var red;
				
				if($("input[name='isUp']").attr("checked"))
					up = 1;
				else
					up = 0;
				if($("input[name='isRed']").attr("checked"))
					red = 1;
				else
					red = 0;
					
				$.ajax({
					async :false,
					cache :false,
					timeout: 100000,
					type:"POST",
					url:"${rc.contextPath}/message/message/nsm/postMessage.do",
					
					data:{ids:_messageId, isUp:up, isRed:red, isPost : "yes"},
					
					error: function () {
						comp.message("信息发布失败","error");
						return;
					},
					success:function(data) { 
						comp.message(data+"条信息发布成功","info");
						
						_id = _messageId.split(",");
						var dt = new Date().Format("yyyy-MM-dd");
						for(i=0; i<_id.length; i++) {
							if(_id[i]!="") {
								$("#"+_id[i]+"date").html(dt);
								$("#"+_id[i]+"state").html("已发布");
								
								$("#"+_id[i]+"n").removeClass();
								$("#"+_id[i]+"p").removeClass().addClass("hide");
								$("#"+_id[i]+"c").removeClass().addClass("hide");
								$("#"+_id[i]+"d").removeClass().addClass("hide");
								
								
							}
						}
						$("input[name='messageCheck']").attr("checked",false);
						$("#_totalSelect").attr("checked",false);
						return;  
					}
				});
			}
			
			//全选复选框
			jQuery("#_totalSelect").click(function(){
				if($("#_totalSelect").attr("checked")) {
					$("input[name='messageCheck']").attr("checked",true);
				}else {
					$("input[name='messageCheck']").attr("checked",false);
				}	
			});
			
			jQuery("input[name='messageCheck']").click(function() {
				$("#_totalSelect").attr("checked",false);
			});
			
			//批量发布按钮
			jQuery("#postMessage-button").click(function() {
				var ids="";
				$("input[name='messageCheck']").each(function() {
					if($(this).attr("checked"))
						ids = ids + "," + $(this).val();
				});
				_messageId = ids;
				if(ids=="" || ids==",") {
					comp.message("请选择要发布的信息！","error");
					return;
				}
				comp.showModal("_showModel");
			});
			
			//取消发布
			function cancelPost(id) {
				comp.confirm("确定要取消发布信息吗？", function(result) {
				if(!result)
					return;
					
					$.ajax({
						async :false,
						cache :false,
						timeout : 100000,
						type : "POST",
						url : "${rc.contextPath}/message/message/nsm/cancelMessage.do",
						data : {ids : id, isPost : "no"},
						error : function () {
							comp.message("取消发布信息失败","error");
							return;
						},
						success : function(data) {
							comp.message("取消发布信息成功","info");
							
							_id = id.split(",");
							
							for(i=0; i<_id.length; i++) {
								if(_id[i]!="") {
									$("#"+_id[i]+"date").html("");
									$("#"+_id[i]+"state").html("未发布");
									
									$("#"+_id[i]+"p").removeClass();
									$("#"+_id[i]+"c").removeClass();
									$("#"+_id[i]+"d").removeClass();
									$("#"+_id[i]+"n").removeClass().addClass("hide");
								}
							}
							$("input[name='messageCheck']").attr("checked",false);
							$("#_totalSelect").attr("checked",false);
							return;
						}
					});
					
				});			
			}
			
			//批量取消发布
			jQuery("#cancelMessage-button").click(function() {
				var ids="";
				$("input[name='messageCheck']").each(function() {
					if($(this).attr("checked"))
						ids = ids + "," + $(this).val();
				});
				_messageId = ids;
				
				if(ids=="" || ids==",") {
					comp.message("请选择要取消发布的信息！","error");
					return;
				}
				cancelPost(ids);
			});
			
			//删除
			function delMessage(id, title) {
				comp.confirm("确定要删除标题为 "+title+" 的信息吗？" , function(result) {
				if(!result)
					return;
					
					window.location.href="${rc.contextPath}/message/message/opt-del/deleteMessageInfo.do?id="+id;
				});					
			}
			
			/**
			//栏目随类型变化
			$("#messageType").change(function() {
				//迎新要有栏目，其他类型没有栏目
				if($("#messageType option:selected").attr("data-code")=="MESSAGE_ORIENTATION") {
					
					$("#columnControl").removeClass("hidden");
				}else {
					$("#messageColumn").val("");
					$("#columnControl").removeClass().addClass("span4 hidden");
				}
			});
			**/
			$("#mesageInfoQuery").compValidate({
				rules:{
					title:{maxlength:30}
				},
				messages:{
					title:{maxlength:'标题长度不超过30字'}
				
				}
			});
		</script>
	</body>
</html>