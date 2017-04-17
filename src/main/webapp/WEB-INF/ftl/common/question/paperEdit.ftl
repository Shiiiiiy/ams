<!DOCTYPE html>
<html lang="en">
	<title></title>
    <head>
        <script src="${rc.contextPath}/js/jquery.form.js"></script>
        <script src="${rc.contextPath}/js/questionnaire/paper_check.js"></script>
        <script language="javascript" type="text/javascript" src="/ams/lib/My97DatePicker/WdatePicker.js"></script>
    </head>
    <body>
        <div id="contentwrapper">
           <div class="main_content">
             <div class="row-fluid">
	               <form  id="paperEditForm" name="paperEditForm" method="post">
	                    <@token/>
						<div class="span12">
							<h2 class="heading"><div align="center">调查问卷：${qim.name!""}</div></h2>
							<input type="hidden" name="questionNaireId" value="${qim.id!""}"/>
							<input type="hidden" name="typeDic.id" value="${qim.typeDic.id!""}"/>
							<input type="hidden" name="questionType" value="${questionType!""}"/>
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
											>&nbsp;&nbsp;${option.optionCode}、
												<#if option.optionUrl??>
													<a href="###" onclick="accessUrl('${option.optionUrl}')">${option.optionName!""}</a>
												<#else>
													${option.optionName!""}
												</#if>											
											</div>
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
												>&nbsp;&nbsp;${option.optionCode}、
													<#if option.optionUrl??>
														<a href="###" onclick="accessUrl('${option.optionUrl}')">${option.optionName!""}</a>
													<#else>
														${option.optionName!""}
													</#if>														
												</div>
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
							
							<div class="row-fluid"><div class="span12">&nbsp;</div></div>
							<div class="btnLeft">
				              <a href="javascript:void(0)" class="btn btn-info"  onclick="saveCurPaper()">保 存</a>
				              <a href="javascript:void(0)" class="btn btn-info"  onclick="submitCurPaper()">提交</a>
				              <a href="javascript:void(0)" class="btn btn-info"  onclick="javascript:window.history.back(-1);">取 消</a>
				            </div>
				   </form>
			   </div>
            </div>
       </div>
       <script>
      		
			$("document").ready(function(){
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
			
			var formValidator = $("#paperEditForm").compValidate({
					rules:{
 						subItemAreas:{maxlength:500}
					},
					messages:{
						subItemAreas:{maxlength:'主观题答案太长【默认不超过500字符】'}
					}
			});
       
       		
       		function saveCurPaper(){
       			var singleValidator = choiceItemValidator("singleItem");
       			var mulValidator = choiceItemValidator("mulItem");
       			var subValidator = answerItemValidator("subItem");
       			if(singleValidator && mulValidator && subValidator){
       				if(formValidator.form()){
		       			$("#paperEditForm").attr("action","${rc.contextPath}/common/question/opt-edit/saveCurPaper.do").submit();
       				}
       			}else{
       				comp.message("请完成必答题 !","error");
       			}
       		}
       		
       		function submitCurPaper(){
       			var singleValidator = choiceItemValidator("singleItem");
       			var mulValidator = choiceItemValidator("mulItem");
       			var subValidator = answerItemValidator("subItem");
       			if(singleValidator && mulValidator && subValidator){
       				if(formValidator.form()){
	       				$("#paperEditForm").attr("action","${rc.contextPath}/common/question/opt-edit/submitCurPaper.do").submit();
	       			}
       			}else{
       				comp.message("请完成必答题 !","error");
       			}
       		}
       		
       	//跳转到选项链接地址
       		function accessUrl(url){
       			window.open(""+url,"_blank");
       		}       
       </script>
	</body>
</html>