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
					个人素质测评信息维护
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
			action="${rc.contextPath}/evaluation/evaluation/opt-update/saveEvaluation.do" >
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
				<th style="text-align:center;" colspan=${baseTypeList?size+3}>
				<!--th style="text-align:center;" colspan=${baseTypeList?size*2+3}-->
					${(yearDic.name!"")?html}学年  ${(termDic.name!"")?html} ${student.college.name!""?html}  ${student.major.majorName!""?html}专业  ${student.classId.className!""?html}班  综合素质测评${(monthDic.name!"")?html}记录表
				</th>
			</thead>
			<tbody>
				<tr>
					<td width="8%" rowspan="2">姓名</td>
					<td width="8%" rowspan="2">学号</td>
					<#list baseTypeList as c>
						<#if c.code=='INTELLECT'>
							<td width="8%" rowspan="2">${c.name?html}</td>
						<#else>
							<td width="20%">${c.name?html}</td>
						</#if>
					</#list>
					<td width="5%" rowspan="2">操作</td>
				</tr>
				<tr>
					<#list baseTypeList as c>
						<#if c.code=='INTELLECT'>
						<#else>
							<td >加减分事由</td>
						</#if>
					</#list>
				</tr>
				<tr>
					<td class='sss' rowspan=<#if detailList?size==0>1<#else>${detailList?size/baseTypeList?size}</#if>><input id="studentId" name="studentId"  type="hidden" value="${student.id}"/>${student.name!""?html}</td>
					<td class='sss' rowspan=<#if detailList?size==0>1<#else>${detailList?size/baseTypeList?size}</#if>>${student.stuNumber!""?html}</td>
					<#if (detailList?size>0)>
						<!--#list baseTypeList as c-->
						<#assign x=0,y=0>
						<#list detailList as d>
						<#assign x=x+1>
							<#if d.type.code=='INTELLECT'>
							<td>
								<#if (x<=baseTypeList?size)>
									
								</#if>
								
									<input id='ids' name='ids' type="hidden" value="${(d.id!"")?html}" class="span11">
									<input id='reasons' name='reasons' type="hidden" value="${(d.reason!"")?html}" class="span12">
									<input id='scores' name='scores'  type="hidden" value=""${(d.score!"")?html}"">
								</td>
							<#else>
								<td>
									<input id='ids' name='ids' type="hidden" value="${(d.id!"")?html}" class="span11">
									<input id='reasons' name='reasons' type="text" value="${(d.reason!"")?html}" title="" onBlur="inputClick(this)" onMouseOver="this.title=this.value;" maxlength="450" class="span12 test">
									<input id='scores' name='scores'  type="hidden" value=""${(d.score!"")?html}"">
								</td>
							</#if>
							<#if (x%baseTypeList?size)==0>
								<#if y!=0>
									<td>
										<a href="###" onclick="deleteCurrentRow(this,${y})" class="sepV_a" title="删除"><i class="icon-trash"></i></a>
									</td>
								<#else>
									<td>
									</td>
								</#if>
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
								<td></td>
								<input id='ids' name='ids'  type="hidden" value="" >
								<input id='reasons' name='reasons'  type="hidden" value="" >
								<input id='scores' name='scores'  type="hidden" value="">
							<#else>
								<td>
									<input id='ids' name='ids'  type="hidden" value="" class="span12">
									<input id='reasons' name='reasons'  type="text" value="" title="" onBlur="inputClick(this)" onMouseOver="this.title=this.value;" maxlength="450" class="span12 test">
									<input id='scores' name='scores'  type="hidden" value="">
								</td>
							</#if>
						</#list>
						<td> <#-- a href="###" onclick="deleteCurrentRow(this,0)" class="sepV_a" title="删除"><i class="icon-trash"></i></a--></td>
					</#if>
				</tr>
			</tbody>
		</table>
		</form>
							
		<div class="span6">
        	<p class="btnMargin">
        		<button class="btn btn-info" type="button" onclick="onSub('SAVE')">保 存</button>
        		<button class="btn btn-info" type="button" onclick="onSub('SUBMIT')">提 交</button>
        		<button class="btn" type="button" onclick="cancel()">取 消</button>
			</p>
		</div>
		<input name="check_error" id="check_error" type="hidden" value="true"/>
	</div>
	</div>
</div>
<script>
	function addRow(){
		var text=$('.sss');
        var rowspanNum=Number(text[text.length-1].getAttribute("rowspan"))+1;
		var $table = $('#smpl_tbl');
		var colNum = Number($('#typeNum').val());
        var tr = "<tr>";
        for(var i=0;i<colNum-1;i++){
        	tr += "<td><input id='ids' name='ids'  type='hidden' value='' class='span11'><input id='reasons' name='reasons'  type='text' value='' title='' onBlur='inputClick(this)' onMouseOver='this.title=this.value;' maxlength='450' class='span12 test'><input id='scores' name='scores'  type='hidden' value=''></td>";
    	} 
    	//单独处理  智育测评分 
    	tr += "<td><input id='ids' name='ids'  type='hidden' value='' class='span11'><input id='reasons' name='reasons'  type='hidden' value='' class='span11'><input id='scores' name='scores'  type='hidden' value=''></td>"; 
        tr += "<td><a href='###' onclick='javascript:deleteCurrentRow(this,-1);' class='sepV_a' title='删除'><i class='icon-trash'></i></a></td>";
        tr += "</tr>";
        $table.append(tr);
        $('.sss').attr("rowspan",rowspanNum);
	}
	
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
				$('.sss').attr("rowspan",rowspanNum);
				tbody.removeChild(tr);
			}); 
		}
	}
	
	function onSub(command){
		if($('#id').val()==""){
			var yearId=$('#yearId').val();
			var termId=$('#termId').val();
			var monthId=$('#monthId').val();
			if(checkRepeat()){
				comp.message("事由不能重复！","error");
				return;
			}
			$.post("${rc.contextPath}/evaluation/evaluation/opt-query/checkStuEvaluation.do", {yearId:yearId, termId:termId, monthId:monthId},
				function(data){
					if(data=="fail"){
						$("#evaluationForm").attr("action","${rc.contextPath}/evaluation/evaluation/opt-update/saveEvaluation.do?command="+command)
					  	mask.showShade();
					  	$('#evaluationForm').submit();
					}else if(data=="success"){
						comp.message("该测评月份已有记录不能再添加！");
					}
				}, "text");
		}else{
			var str="确认要修改？";
			if(command=="SUBMIT"){
				str="提交后不可修改，确定要提交吗？";
			}
			if(checkRepeat()){
				comp.message("事由不能重复！","error");
				return;
			}
			comp.confirm(str, function(result) {
            	if(!result){
            		return; 
				}
				$("#evaluationForm").attr("action","${rc.contextPath}/evaluation/evaluation/opt-update/saveEvaluation.do?command="+command)
			  	mask.showShade();
			  	$('#evaluationForm').submit();
			}); 
		}
	}
	
	function cancel(){
		window.location.href="${rc.contextPath}/evaluation/evaluation/opt-query/queryEvaluationList.do";
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
