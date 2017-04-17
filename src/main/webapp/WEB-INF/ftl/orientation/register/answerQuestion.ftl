<!DOCTYPE html>
<html lang="en">
	<title></title>
    <head>
        <script src="${rc.contextPath}/js/jquery.form.js"></script>
         <script src="${rc.contextPath}/js/questionnaire/paper_check.js"></script>
        <script language="javascript" type="text/javascript" src="/ams/lib/My97DatePicker/WdatePicker.js"></script>
        <!--遮罩层-->
		<link rel="stylesheet" href="${rc.contextPath}/css/waiting.css" />
		<script src="${rc.contextPath}/js/common/mask.js"></script>
    <script> 
        //保存提交处理
		function submitSave(type){
			
			//直接跳转到上一页
			if(type=='upGo'){
				window.location.href="${rc.contextPath}/newstudent/register/editReport.do";
				return;
			}
			
			//直接跳转到上一页
			if(type=='upGoSumbit'){

				//提交的类型
				
				$("#type").val(type);
				
				//遮罩
				mask.showShade();
				
				//提交
       		    $('#paperEditForm').submit();
			}
			
		
			//处理的方式(上一页、保存、提交)
			//判断是否提交
			//if(type=='submit' || '${(status)!''}'=='submit'){
			if(type=='submit'){
			
				//from 提交
				var singleValidator = choiceItemValidator("singleItem");
       			var mulValidator = choiceItemValidator("mulItem");
       			var subValidator = answerItemValidator("subItem");
       			if(singleValidator && mulValidator && subValidator){
			
					//comp.confirm("提交的信息是不能进行修改的，是否要提交？", function(result) {
					comp.confirm("提交的采集信息在系统开放的时间是可以再次修改的(必填项是必须要输入的)，回答的问卷是不能修改的，是否要提交？", function(result) {
        			if(!result)	{
        				return;
        			}else{
        				$('#type').val(type);
        				
        				//遮罩
						mask.showShade();
						//from 提交
       					$('#paperEditForm').submit();
        			}
        		});
        		}else{
        			comp.message("请完成必答题 !","error");
        		}
        	}else{
        		//提交的类型
				$('#type').val(type);
				
				//判断如果问答题的回答时空，就给他赋值是空字符串
				answerNullVal();
				
				//遮罩
				mask.showShade();
				
				//提交
       		    $('#paperEditForm').submit();
						
			}
		}
		
		//初始化
		$("document").ready(function(){
		
			if("${(returnFlag)!""}"=="submitSuccess"){
		
				comp.message("提交成功！","info");
					//return ;
			}else{
			
				if("${(flag)!""}"=="saveSuccess"){
		
					comp.message("保存成功！","info");
					//return ;
				}
			
			}
			
			
			if("${(status)!""}"=="null"){
		
				comp.message("没有问卷！","info");
					//return ;
			}
			
			if("${(status)!""}"=="submit"){
				$("#paperEditForm input").attr("disabled",true);
				$("#paperEditForm textarea").attr("disabled",true);
				
				comp.message("此问卷已经提交！","info");
					//return ;
			}
			
			
			//判断当前时间是否在学校设定的范围内
			//if('${(isScope)!''}'!='1' ){
				//comp.message('${(isScope)!''}',"error");
				
				//$("#paperEditForm input").attr("disabled",true);
				//$("#paperEditForm textarea").attr("disabled",true);
				
			//}else{
				//if("${(status)!""}"=="submit" ){
					//comp.message("此问卷已经提交,在开放时间内还可以进行修改,修改后点击'下一页'、'保存'或'提交'按钮都可以！","info");
				//}
			
			//}
			
			
			//为非必答【问答题】添加初始化验证
					if($("input[name='subjectiveItem']").length>0){
									$("input[name='subjectiveItem']").each(function(){  
										var inputName=$(this).val();
										var textAreaValue = $("#"+inputName).val();
										if(comp.isNull(textAreaValue)){
											$("#"+inputName).val(' ');
										}
									});
							}
		});
		
	</script>
    </head>
    <body>
    
    <#include "/decorators/mask.ftl">
         <div id="contentwrapper">
           <div class="main_content">
             <div class="row-fluid">
	               <form  id="paperEditForm" name="paperEditForm" method="post" action="${rc.contextPath}/newstudent/register/saveQuestion.do">
	               <input type="hidden" id ="type" name="type" value="" />
	               
	               	<#if status !='null'>
	               	
						<div class="span12">
							<h2 class="heading"><div align="center">${qim.name!""}</div></h2>
							<div class="row-fluid">
								<div>
									<input type="hidden" id="question" name="questionNaireId" value="${qim.id!""}" />
									<input type="hidden" name="typeDic.id" value="${qim.typeDic.id!""}" />
								</div>
							</div>
							<#if singleItemList?? && (singleItemList?size&gt;0)>
							<h3 class="heading">一、单项选择题：</h3>
							<#list singleItemList as item>
								<div class="row-fluid">
									<div class="span4">&#12288;&#12288;&#12288;${item.quesSeqNum}、${item.itemName!""}
									<#if item?? && item.itemRequired.code=='Y'>
									<span class="f_req">*</span>
									<input type="hidden" name="singleItem" value="singleItem${item_index}"/>
									</#if>
									</div>
								</div>
								<#list singleQuesOptionList as option>
									<#if option.paperItemId==item.id>
									<div class="row-fluid">
										<div class="span1"></div>
										<div class="span11">
											<div class="autocut">
											<input type="radio"  id="singleItem${item_index}_${option_index}" name="singleItem${item_index}"
											onclick="selectSingleOption(this.id,'${item_index}','${option_index}','${singleQuesOptionList?size}')"
											<#if option.checked?? && option.checked="CHECKED">
												checked="${option.checked}"
											</#if>
											>&nbsp;&nbsp;${option.optionCode}、${option.optionName!""}</div>
											<#if option.checked?? && option.checked=="CHECKED">
												<input type="hidden" id="singleOption${item_index}_${option_index}" name="singleOption" value="true"/>
											<#else>
												<input type="hidden"  id="singleOption${item_index}_${option_index}" name="singleOption" value="false"/>
											</#if>
										</div>
									</div>
									<div class="row-fluid">
											<input type="hidden" name="singleQadms" 
											value="${option.questionNaire.id!""}${splitFlag}${option.paperItemId!""}${splitFlag}${option.itemType.id!""}${splitFlag}${option.itemName!""}${splitFlag}${option.id!""}${splitFlag}${option.seqnum!""}${splitFlag}${option.optionCode!""}${splitFlag}${option.optionName!""}${splitFlag}${option.answer!""}${splitFlag}${option.questionNaire.typeDic.code!""}${splitFlag}${option.itemSeq!""}${splitFlag}${option.itemTypeSeq!""}"/>
									</div>
									</#if>
								</#list>
							</#list>
							</#if>

							<div class="row-fluid"><div class="span12">&nbsp;</div></div>
							<#if mulItemList?? && (mulItemList?size&gt;0)>
							<h3 class="heading">二、不定项选择题：</h3>
							<#list mulItemList as item>
								<div class="row-fluid">
									<div class="span4">&#12288;&#12288;&#12288;${item.quesSeqNum}、${item.itemName!""}
									<#if item?? && item.itemRequired.code=='Y'>
									<span class="f_req">*</span>
									<input type="hidden" name="mulItem" value="mulItem${item_index}"/>
									</#if>
									</div>
								</div>
								<#list mulQuesOptionList as option>
								    <#if option.questionNaire.id==item.questionInfo.id && option.paperItemId==item.id>
									<div class="row-fluid">
										<div class="span1"></div>
										<div class="span11">
												<div class="autocut">
												<input type="checkbox" id="checkbox${item_index}_${option_index}" name="mulItem${item_index}"
												onclick="selectMulOption(this.id,'mulOption${item_index}_${option_index}')"
											<#if option.checked?? && option.checked=="CHECKED">
												checked="${option.checked}"
											</#if>
												>&nbsp;&nbsp;${option.optionCode}、${option.optionName!""}</div>
											<#if option.checked?? && option.checked="CHECKED">
												<input type="hidden" id="mulOption${item_index}_${option_index}" name="mulOption" value="true"/>
											<#else>
												<input type="hidden" id="mulOption${item_index}_${option_index}" name="mulOption" value="false"/>
											</#if>
										</div>
									</div>
									<div class="row-fluid">
											<input type="hidden" name="mulQadms" 
											value="${option.questionNaire.id!""}${splitFlag}${option.paperItemId!""}${splitFlag}${option.itemType.id!""}${splitFlag}${option.itemName!""}${splitFlag}${option.id!""}${splitFlag}${option.seqnum!""}${splitFlag}${option.optionCode!""}${splitFlag}${option.optionName!""}${splitFlag}${option.answer!""}${splitFlag}${option.questionNaire.typeDic.code!""}${splitFlag}${option.itemSeq!""}${splitFlag}${option.itemTypeSeq!""}"/>
									</div>
									</#if>
								</#list>
							</#list>
							</#if>
							
							<div class="row-fluid"><div class="span12">&nbsp;</div></div>
							<#if subItemList?? && (subItemList?size&gt;0)>
							<h3 class="heading">三、问答题：</h3>
							<#list subItemList as item>
									<div class="row-fluid">
										<div class="span4">&#12288;&#12288;&#12288;${item.quesSeqNum}、${item.itemName!""}
										<#if item?? && item.itemRequired.code=='Y'>
										<span class="f_req">*</span>
										<input type="hidden" name="subItem" value="subItem${item_index}"/>
										<#elseif item?? && item.itemRequired.code=='N'>
										<input type="hidden" name="subjectiveItem" value="subItem${item_index}"/>
										</#if>
										</div>
									</div>
								<#list subQuesAnswerList as option>
									<#if option.paperItemId==item.id>
									<div class="row-fluid">
										<div class="span1"></div>
										<div class="span11">
											<textarea id="subItem${item_index}" name="subItemAreas" cols="100" rows="6" class="span8" >${option.answer!""}</textarea>
											<font size="1" color="grey"  style="vertical-align:bottom; padding-bottom:10px">(不超过500字)</font>
										</div>
									</div>
									<div class="row-fluid">
											<input type="hidden" name="answerQadms" 
											value="${option.questionNaire.id!""}${splitFlag}${option.paperItemId!""}${splitFlag}${option.itemType.id!""}${splitFlag}${option.itemName!""}${splitFlag}${option.id!""}${splitFlag}${option.seqnum!""}${splitFlag}${option.optionCode!""}${splitFlag}${option.optionName!""}${splitFlag}${option.answer!"ok"}${splitFlag}${option.questionNaire.typeDic.code!""}${splitFlag}${option.itemSeq!""}${splitFlag}${option.itemTypeSeq!""}"/>
									</div>
									</#if>
								</#list>
							</#list>
							</#if>
							
							<#else>
				              	<h2 class="heading"><div align="center">没有填写的调查问卷，点击下面的提交按钮就可以把之前填写的信息提交到系统中！</div></h2>
				             </#if>
							
							<div class="row-fluid"><div class="span12">&nbsp;</div></div>
							<div class="btnCenter">
							
							  <#--根据状态来判断显示那些按钮-->
				              <#if qim?? && status !='submit' && status !='null' >
				              <#--<#if isScope=='1' >-->
				              	<a href="javascript:void(0)" class="btn btn-info"  onclick="submitSave('up');">上一页</a>
				              	<a href="javascript:void(0)" class="btn btn-info"  onclick="submitSave('save');">保 存</a>
				              	<a href="javascript:void(0)" class="btn btn-info"  onclick="submitSave('submit');">提交</a>
				              <#else>
				              	<#if status !='null'>
				              		
				              		<a href="javascript:void(0)" class="btn btn-info"  onclick="submitSave('upGo');">上一页</a>
				              	<#else>
				              		<a href="javascript:void(0)" class="btn btn-info"  onclick="submitSave('upGo');">上一页</a>
				              		<a href="javascript:void(0)" class="btn btn-info"  onclick="submitSave('upGoSumbit');">提交</a>
				    
				              	 </#if>
				              </#if>
				             
				             
				            </div>
				   </form>
			   </div>
            </div>
       </div>
       <script>
      		
      		//判断如果问答题的回答时空，就给他赋值是空字符串
      		function answerNullVal(){
      			if($("textarea[name='subItemAreas']").length>0){
      				$("textarea[name='subItemAreas']").each(function(){  
							if(comp.isNull($(this).val())){
								$(this).val(' ');
							}
						});
      			}
      		}
      		
       		
       		var formValidator = $("#paperEditForm").compValidate({
					rules:{
 						subItemAreas:{maxlength:500}
					},
					messages:{
						subItemAreas:{maxlength:'主观题答案太长【默认不超过500字符】'}
					}
			});
       		

    
       </script>
	</body>
</html>