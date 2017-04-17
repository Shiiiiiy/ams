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
			.table td,.table th{ border:1px solid #ddd; } 
			.table tbody tr:hover td, .table tbody tr:hover th {background-color:#fff;}
		</style>
    </head>
<body>
<div id="contentwrapper">
    <div class="main_content">
    <div class="row-fluid">
    	<div class="row-fluid">
	   		 <div class="span12">
		    	<h3 class="heading">
					素质测评信息维护
				</h3>
	    	</div>
    	</div>
    	
        <div id="dt_gal_wrapper" class="dataTables_wrapper form-inline" role="grid">
        <div class="row">
            <div class="span10">
                <div class="dt_actions">
                    <div class="row-fluid">
	                    <button class="btn btn-info"  onclick="addRow()">新 增</button>	
                    </div>
                </div>
            </div>
        </div>
        
		<input name="errorText" id="errorText" type="hidden" value="${errorText!""}"/>
		<form  id="evaluationForm" class="form_validation_reg" method="post"
			action="${rc.contextPath}/evaluation/score/opt-update/updateEvaluationDetail.do" >
		<#if evaluationScore?? && evaluationScore.id?? >
		<#else>
			<@token/>
		</#if>
		<input id="id" name="id"  type="hidden" value="${evaluation.id!""?html}">
		<input id="yearId" name="yearId"  type="hidden" value="${(yearDic.id!"")?html}">
		<input id="termId" name="termId"  type="hidden" value="${(termDic.id!"")?html}">
		<input id="monthId" name="monthId"  type="hidden" value="${(monthDic.id!"")?html}">
		<input id="typeNum" name="typeNum"  type="hidden" value="${baseTypeList?size}">
		<table class="table table-bordered" id="smpl_tbl" >
			<thead>
				<th style="text-align:center;" colspan=${(baseTypeList?size-1)*2+4}>
					${(yearDic.name!"")?html}学年  ${(termDic.name!"")?html} ${student.college.name!""?html}  ${student.major.majorName!""?html}专业  ${student.classId.className!""?html}班  综合素质测评${(monthDic.name!"")?html}记录表
				</th>
			</thead>
			<tbody>
				<tr>
					<td width="7%" rowspan=2>姓名</td>
					<td width="8%" rowspan=2>学号</td>
					<#list baseTypeList as c>
						<#if c.code=='INTELLECT'>
							<td width="8%" rowspan=2>${c.name?html}</td>
						<#else>
							<td width="24%" colspan=2>${c.name?html}</td>
						</#if>
					</#list>
					<td width="5%" rowspan=2>操作</td>
				</tr>
				<tr>
					<#list baseTypeList as c>
						<#if c.code=='INTELLECT'>
						<#else>
							<td width="16%">加减分事由</td>
							<td width="8%">分数</td>
						</#if>
					</#list>
				</tr>
				<tr>
					<td class='sss' rowspan=<#if detailList?size==0>2<#else>${detailList?size/baseTypeList?size+1}</#if>><input id="studentId" name="studentId"  type="hidden" value="${student.id}"/>${student.name!""?html}</td>
					<td class='sss' rowspan=<#if detailList?size==0>2<#else>${detailList?size/baseTypeList?size+1}</#if>>${student.stuNumber!""?html}</td>
					<#if (detailList?size>0)>
						<!--#list baseTypeList as c-->
						<#assign x=0,y=0>
						<#list detailList as d>
						<#assign x=x+1>
							<#if d.type.code=='INTELLECT'>
							<td>
								<#if (x<=baseTypeList?size)>
									<input id='intellectScoreSum' name='intellectScoreSum'  type="hidden" value="" class="span11" readonly="readonly">
								</#if>
								
									<input id='ids' name='ids' type="hidden" value="${(d.id!"")?html}" class="span11">
									<input id='reasons' name='reasons' type="hidden" value="${(d.reason!"")?html}" class="span11">
									<input id='scores' name='scores' type="hidden" value="${(d.score!"")?html}" class="span11">
								</td>
							<#else>
								<td>
									<input id='ids' name='ids' type="hidden" value="${(d.id!"")?html}" class="span11">
									<input id='reasons' name='reasons' type="text" value="${(d.reason!"")?html}" title="" onBlur="inputClick(this)" onMouseOver="this.title=this.value;" maxlength="450" class="span11 test">
								</td>
								<td>
									<input id='scores' name='scores' type="text" value="${(d.score!"")?html}" onkeyup="JHshNumberText(this);" maxlength="5" class="NumDecText span11 col${x%baseTypeList?size}" onBlur="changeAll(${x%baseTypeList?size})">
								</td>
							</#if>
							<#if (x%baseTypeList?size)==0>
								<td> 
								<#if y!=0>
									<a href="###" onclick="deleteCurrentRow(this,${y})" class="sepV_a" title="删除"><i class="icon-trash"></i></a>
								</#if>
								</td>
								<#if (x+1<detailList?size)>
									</tr>
									<tr>
								</#if>
								<#assign y=y+1>
							</#if>
						</#list>
						<!--/#list-->
					<#else>
						<#list baseTypeList as c>
							<#if c.code=='INTELLECT'>
								<td><input id='intellectScoreSum' name='intellectScoreSum'  type="hidden" value="" class="span11" readonly="readonly"></td>
								<input id='ids' name='ids'  type="hidden" value="" class="span11">
								<input id='reasons' name='reasons'  type="hidden" value="" class="span11">
								<input id='scores' name='scores' type="hidden" value="${(d.score!"")?html}" class="span11">
							<#else>
								<td>
									<input id='ids' name='ids'  type="hidden" value="" class="span11">
									<input id='reasons' name='reasons'  type="text" value="" title="" onBlur="inputClick(this)" onMouseOver="this.title=this.value;" maxlength="450" class="span11 test">
								</td>
								<td>
									<input id='scores' name='scores' type="text" value="" onkeyup="JHshNumberText(this);" maxlength="5" class="NumDecText span11 col1" onBlur="changeAll(1)">
								</td>
							</#if>
						</#list>
						<td> <#--a href="###" onclick="deleteCurrentRow(this,0)" class="sepV_a" title="删除"><i class="icon-trash"></i></a--></td>
					</#if>
				</tr>
				<tr>
					<#list baseTypeList as c>
						<#if c.code=='INTELLECT'>
							<td><!--测评总分--></td>
						<#else>
							<#list evaluationScoreList as d>
								<#if c.code==d.baseType.code>
								<#list scoreTypeList as t>
									<#if d.scoreType.code==t.code>
										<input id='${t.code}${c_index+1}' name='${t.code}${c_index+1}'  type='hidden' value='${(d.score!"")?html}' >
									</#if>
								</#list>
								</#if>
							</#list>
							<#if c.code=='MORAL'>
								<td >奖惩分</td>
								<td ><input id='scores${c_index+1}' name='moralScoreSum'  type='text' value='${evaluation.moralScoreSum?default(0)}' class='span11 scoreSum' readonly="readonly"></td>
							</#if>
							<#if c.code=='CAPACITY'>
								<td >奖惩分</td>
								<td ><input id='scores${c_index+1}' name='capacityScoreSum'  type='text' value='${evaluation.capacityScoreSum?default(0)}' class='span11 scoreSum' readonly="readonly"></td>
							</#if>
							<#if c.code=='CULTURE'>
								<td >奖惩分</td>
								<td ><input id='scores${c_index+1}' name='cultrueScoreSum'  type='text' value='${evaluation.cultrueScoreSum?default(0)}' class='span11 scoreSum' readonly="readonly"></td>
							</#if>
						</#if>
					</#list>
					<td ><!--input id='sumScores' name='sumScores'  type='text' value='${evaluation.scoreSum!""?html}' class='span11' readonly="readonly"--></td>
				</tr>
			</tbody>
		</table>
		<#if nextEvaluationId??>
			<input id='nextEvaluationId' name='nextEvaluationId'  type="hidden" value="${nextEvaluationId}" class="span11">
		</#if>
		</form>
							
		<div class="span6">
        	<p class="btnMargin">
        	<#if nextEvaluationId??>
        		<button class="btn btn-info" type="button" onclick="onSub('TO_CONFIRMED','${nextEvaluationId}')">提 交</button>
        		<button class="btn btn-info" type="button" onclick="nextEvaluation('TO_CONFIRMED','${nextEvaluationId}')">下一个</button>
        	<#else>
        		<button class="btn btn-info" type="button" onclick="onSub('TO_CONFIRMED','')">提 交</button>
        	</#if>
        		<button class="btn" type="button" onclick="cancel()">取 消</button>
			</p>
		</div>
		<input name="check_error" id="check_error" type="hidden" value="true"/>
	</div>
	</div>
</div>
<script>
	//添加行
	function addRow(){
		var text=$('.sss');
        var rowspanNum=Number(text[text.length-1].getAttribute("rowspan"))+1;
		var $table = $('#smpl_tbl');
		var colNum = Number($('#typeNum').val());
        var tr = "<tr>";
        for(var i=0;i<colNum-1;i++){
        	tr += "<td><input id='ids' name='ids'  type='hidden' value='' class='span11'><input id='reasons' name='reasons'  type='text' value='' title='' onBlur='inputClick(this)' onMouseOver='this.title=this.value;' maxlength='450' class='span11 test'></td>"+
    			"<td><input id='scores' name='scores'  type='text' value='' onkeyup='JHshNumberText(this);' maxlength='5' class='NumDecText span11 col"+(i+1)+"' onBlur='changeAll("+(i+1)+")'></td>";
    	} 
    	//单独处理  智育测评分 
    	tr += "<td><input id='ids' name='ids'  type='hidden' value='' class='span11'><input id='reasons' name='reasons'  type='hidden' value='' class='span11'><input id='scores' name='scores'  type='hidden' value='' class='span11'></td>"; 
        tr += "<td><a href='###' onclick='javascript:deleteCurrentRow(this,-1);' class='sepV_a' title='删除'><i class='icon-trash'></i></a></td>";
        tr += "</tr>";
        $("#smpl_tbl tr").eq(-2).after(tr);//倒数第二行后追加行
        //$table.append(tr);
        $('.sss').attr("rowspan",rowspanNum);
	}
	//删除行
	function deleteCurrentRow(obj, row){
		if(row==0){
			comp.message("第一行不能删除！");
		}else{
			comp.confirm("确认要删除这行事由？", function(result) {
            	if(!result){
            		return; 
				}
			  	var tr=obj.parentNode.parentNode;
				var tbody=tr.parentNode;
				var text=$('.sss');
				var rowspanNum=Number(text[text.length-1].getAttribute("rowspan"))-1;
				
				var colNum = Number($('#typeNum').val());
				$('.sss').attr("rowspan",rowspanNum);
				tbody.removeChild(tr);
				//更新总分
				for(var i=0;i<colNum;i++){
					changeAll(i);
				}
			}); 
		}
	}
	//提交
	function onSub(command, nextEvaluationId){
		var tip="";
		if(""==nextEvaluationId){
			tip="是否确认提交?";
		}else{
			tip="是否确认提交并跳转到下一个?";
		}
		if(checkRepeat()){
			comp.message("事由不能重复！","error");
			return;
		}
		comp.confirm(tip, function(result){
        	if(!result){
        		return; 
			}
			$("#evaluationForm").attr("action","${rc.contextPath}/evaluation/score/opt-update/updateEvaluationDetail.do?command="+command)
		  	mask.showShade();
		  	$('#evaluationForm').submit();
		});
	}
	
	function nextEvaluation(command, nextEvaluationId){
		if(checkRepeat()){
			comp.message("事由不能重复！","error");
			return;
		}
		comp.confirm("要提交当前数据？", function(result){
        	if(result){
	        	$("#evaluationForm").attr("action","${rc.contextPath}/evaluation/score/opt-update/updateEvaluationDetail.do?command="+command)
			  	mask.showShade();
			  	$('#evaluationForm').submit();
			}else{
				window.location.href="${rc.contextPath}/evaluation/score/opt-update/editEvaluationInfo.do?id="+nextEvaluationId; 
			}
		});
	}
	
	//取消
	function cancel(){
		window.location.href="${rc.contextPath}/evaluation/score/opt-query/queryEvaluationList.do";
	}
	
	function changeAll(num) { 
		var sumValue = 0;//奖惩分
		
		$('.col'+num).each(function(){
			sumValue += Number($(this).val()); 
		});
		$('#scores'+num).val(Number(sumValue).toFixed(2));
	} 
	
	function JHshNumberText(obj){ 
		var fa=""; 
		if(obj.value.substring(0,1)=="-"){ 
			fa="-"; 
		}
		var str=(obj.value.replace(/[^0-9.]/g,'')).replace(/[.][0-9]*[.]/, '.'); 
		if(str.substring(0,1)=="."){ 
			str="0"+str; 
		}
		
		obj.value=fa+str; 
		if(str.toString().split(".")[1].length>2){
			str=Number(str).toFixed(2);
		}
		obj.value=fa+str; 
	} 
	
	function inputClick(obj){
		 var i = $(obj).val();
		 $(".test").not($(obj)).each(function (){
			 if ($(this).val() == i && $(this).val() != "") {
			 	comp.message("事由不能重复！","error");
			 	//setTimeout(function () { $(obj).focus(); }, 0);
			}
		});
	}
	
	function checkRepeat(){
		var arr = [];
		$(".test").each(function (){
			if ($(this).val() != "") {
				arr.push($(this).val());
			}
		});
		
		if( arr.length==$.unique( arr ).length ){
	        return false;
	    }else{
	        return true;
	    }
	}
 </script>
</body>
</html>
