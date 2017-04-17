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
		function configNum(){
			var moralScoreSum=Number($('#MORALBASE_SCORE').val())+Number($('#MORALREWARD_SCORE').val()); //德育总分
			var cultureScoreSum=Number($('#CULTUREBASE_SCORE').val())+Number($('#CULTUREREWARD_SCORE').val());	//文化总分
			var capacityScoreSum=Number($('#CAPACITYBASE_SCORE').val())+Number($('#CAPACITYREWARD_SCORE').val());	//能力总分
			
			//判断输入框内容类型
			if((!configType($('#MORALBASE_SCORE').val(), "德育测评分基础分"))||(!configType($('#MORALREWARD_SCORE').val(), "德育测评分奖惩分"))
				||(!configType($('#CULTUREBASE_SCORE').val(), "文体测评分基础分"))	||(!configType($('#CULTUREREWARD_SCORE').val(), "文体测评分奖惩分"))
				||(!configType($('#CAPACITYBASE_SCORE').val(), "能力测评分基础分"))||(!configType($('#CAPACITYREWARD_SCORE').val(), "能力测评分奖惩分"))){
				return false;
			}
			
			//判断各总分
			if((!configSum(moralScoreSum, "德育"))||(!configSum(cultureScoreSum, "文体"))||(!configSum(capacityScoreSum, "能力"))){
				return false;
			}
			
			return true;
		}
		
		function configType(score, name){
			var regNumber=/^(((\d|[1-9]\d)(\.\d{1,2})?)|100|100.0|100.00)+$/i; //小于100的数字，带两位小数
			if(score==''){
				comp.message(name+"不能为空！");
				return false;
			}
			if(!regNumber.test(score)){
				comp.message(name+"类型不正确！只能是数字，可带两位小数。");
				return false;
			}
			return true;
		}
		
		function configSum(score, type){
			if(score>100){
				comp.message(type+"测评分总和不能大于100！");
				return false;
			}
			return true;
		}
		
		function onSub(){
			if(!configNum()){
				return;
			}else{
				var weigthSum=0;
				var flag=true;
				$('.WEIGHT').each(function(){
					if($(this).val()==''){
						comp.message("权重不能存在空值！");
						flag=false;
						return false;
					}
					weigthSum=weigthSum+Number($(this).val()); 
				}); 
				if(weigthSum == 1 && flag){
					var check_error=$("#check_error").val();
					if(check_error == "true"){
						if($('#scoreId').val()==""){
							$('#evaluationScoreForm').submit();
						}else{
							comp.confirm("确认要修改？", function(result) {
				            	if(!result){
				            		return; 
								}
								mask.showShade();
							  	$('#evaluationScoreForm').submit();
							}); 
						}
					}
				}else if(flag){
					comp.message("权重总和必须为1,请检查！");
					return;
				}
				
			}
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
					综合素质测评分数设置
				</h3>
	    	</div>
    	</div>
		
		<input name="errorText" id="errorText" type="hidden" value="${errorText!""}"/>
		<form  id="evaluationScoreForm" class="form_validation_reg" method="post"
			action="${rc.contextPath}/evaluation/scoreSet/opt-query/saveEvaluationScore.do" >
		<#if evaluationScore?? && evaluationScore.id?? >
		<#else>
			<@token/>
		</#if>
		<table class="table table-bordered table-striped tablecut"  id="smpl_tbl" style="align:center;width:60%;">
			<thead>
				<tr>
					<th>分数类型</th>
					<#list scoreTypeList as c>
						<th>${c.name?html}</th>
					</#list>
				</tr>
			</thead>
			<tbody>
				<#list baseTypeList as d>
					<tr>
						<td class="autocut">${d.name?html}</td>
						<#list scoreTypeList as c>
							<td class="autocut" style="padding:5px;padding-bottom:0px;">
								<#assign flag=true>
								<#list evaluationScoreList as b>
									<#if d.id==b.baseType.id && c.id==b.scoreType.id >
										<#assign flag=false>
										<#if d.code=='INTELLECT' && c.code!='WEIGHT'>
											<input id=${d.code}${c.id} name=${d.code}${c.id}  type="hidden" value="${b.id}" >
											<input id=${d.code}${c.code} name=${d.code}${c.code} class="span11 ${c.code}" value="${(b.score!"")?html}" readOnly/>
										<#else>
											<input id=${d.code}${c.id} name=${d.code}${c.id}  type="hidden" value="${b.id}">
											<input id=${d.code}${c.code} name=${d.code}${c.code} class="span11 ${c.code}" value="${(b.score!"")?html}" maxlength="5"/>
										</#if>
									</#if>
								</#list>
								<#if flag>
									<#if d.code=='INTELLECT' && c.code!='WEIGHT'>
										<input id=${d.code}${c.id} name=${d.code}${c.id}  type="hidden" value="">
										<input id=${d.code}${c.code} name=${d.code}${c.code} class="span11 ${c.code}" value="" readOnly/>
									<#else>
										<input id=${d.code}${c.id} name=${d.code}${c.id}  type="hidden" value="">
										<input id=${d.code}${c.code} name=${d.code}${c.code} class="span11 ${c.code}" value="" maxlength="5"/>
									</#if>
								</#if>
							</td>
						</#list>
					</tr>
				</#list>
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
