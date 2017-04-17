<html>
 <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <!-- jQuery UI theme-->
        <link rel="stylesheet" href="${rc.contextPath}/lib/jquery-ui/css/Aristo/Aristo.css" />
        <script src="${rc.contextPath}/lib/jquery-ui/jquery-ui-1.8.20.custom.min.js"></script>
        <!-- animated progressbars -->
        <script src="${rc.contextPath}/js/bdp_fileupload.progressbar.js"></script>
        <!-- ajax form-->
		<script src="${rc.contextPath}/js/jquery.form.js"></script>
		<!-- bootstrap-fileupload -->	
		<link rel="stylesheet" href="${rc.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.min.css" />
		<style type="text/css">
			.table td,.table th{ 
			border:1px solid #cad9ea; 
			} 
		</style>
		<script>
		
		function onSub(){
			comp.confirm("确认要保存测评学期设置的信息吗？", function(result) {
            	if(!result){
            		return; 
				}
				mask.showShade();
			  	$('#evaluationTermForm').submit();
			}); 
		}
		
		function onClickCheckbox(obj, str){
			$("."+str).not($(obj)).each(function (){
			 	this.checked = false;
			});
		}
	 </script>
    </head>
<body>
<div id="contentwrapper">
    <div class="main_content">
    <div class="row-fluid">
    	<div class="row-fluid">
	   		 <div class="span12">
		    	<h3 class="heading">
					综合素质测评学期设置
				</h3>
	    	</div>
    	</div>
		
		<input name="errorText" id="errorText" type="hidden" value="${errorText!""}"/>
		<form  id="evaluationTermForm" class="form_validation_reg" method="post"
			action="${rc.contextPath}/evaluation/scoreSet/opt-query/saveEvaluationTerm.do" >
		<#--if evaluationScore?? && evaluationScore.id?? >
		<#else>
			<@token/>
		</#if-->
		<table class="table table-bordered table-striped tablecut"  id="smpl_tbl" style="align:center;width:70%;">
			<thead>
				<tr>
					<th width="20%">学期</th>
					<th width="80%">月份</th>
				</tr>
			</thead>
			<tbody>
				<#if termList ?? >
					<#list termList as d>
						<tr>
	    	            	<td>${d.name?html}</td>
	    	            	<td><#if monthList ??>
	    	            			<#if (evaluationTermList?size > 0)>
	    	            				<#list monthList as m>
											<input class="${m.id}" name="${d.id}" type="checkbox" value="${m.id}" onclick="onClickCheckbox(this,'${m.id}');"
											<#list evaluationTermList as n>
												<#if d.id==n.term.id && m.id==n.month.id>
												 checked
												 </#if>
											</#list>
											 />${m.name?html}&nbsp;&nbsp;
										</#list>
									<#else>
										<#list monthList as m>
											<input class="${m.id}" name="${d.id}" type="checkbox" value="${m.id}" onclick="onClickCheckbox(this,'${m.id}');"/>${m.name?html}&nbsp;&nbsp;
										</#list>
									</#if>
								</#if>
							</td>
	    	            </tr>
					</#list>
				</#if>
			</tbody>
		</table>
			
		</form>
							
		<div class="span6">
        	<p class="btnMargin">
        		<button class="btn btn-info" type="button" onclick="onSub()">保 存</button>
			</p>
		</div>
		<input name="check_error" id="check_error" type="hidden" value="true"/>
	</div>
	</div>
</div>

</body>
</html>
