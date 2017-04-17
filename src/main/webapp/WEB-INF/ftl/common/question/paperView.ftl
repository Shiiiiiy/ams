<!DOCTYPE html>
<html lang="en">
    <body>
        <div id="contentwrapper">
           <div class="main_content">
             <div class="row-fluid">
						<div class="span12">
							<h2 class="heading"><div align="center">问卷调查：${qim.name!""}</div></h2>
							<#if singleItemList?? && (singleItemList?size&gt;0)>
							<h3 class="heading">一、单项选择题：</h3>
							<#list singleItemList as item>
								<div class="row-fluid">
									<div class="span4">&#12288;&#12288;&#12288;${item.quesSeqNum}、${item.itemName!""}</div>
								</div>
								<#list singleQuesOptionList as option>
									<#if option.paperItemId==item.id>
									<div class="row-fluid">
										<div class="span1"></div>
										<div class="span11">
											<div class="autocut">
											<input type="radio"  id="singleItem${item_index}_${option_index}" name="singleItem${item_index}"
											<#if option.checked?? && option.checked="CHECKED">
												checked="${option.checked}"
											</#if> disabled="disabled"
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
									<div class="span4">&#12288;&#12288;&#12288;${item.quesSeqNum}、${item.itemName!""}</div>
								</div>
								<#list mulQuesOptionList as option>
								    <#if option.questionNaire.id==item.questionInfo.id && option.paperItemId==item.id>
									<div class="row-fluid">
										<div class="span1"></div>
										<div class="span11">
												<div class="autocut">
												<input type="checkbox" id="checkbox${item_index}_${option_index}" name="mulItem${item_index}"
											<#if option.checked?? && option.checked=="CHECKED">
												checked="${option.checked}"
											</#if>  disabled="disabled"
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
										<div class="span4">&#12288;&#12288;&#12288;${item.quesSeqNum}、${item.itemName!""}</div>
									</div>
								<#list subQuesAnswerList as option>
									<#if option.paperItemId==item.id>
									<div class="row-fluid">
										<div class="span1"></div>
										<div class="span11">
											<textarea name="subOption" cols="100" rows="6" class="span8" readOnly>${option.answer!""}</textarea>
										</div>
									</div>
									<div class="row-fluid">
											<input type="hidden" name="answerQadms" 
											value="${option.questionNaire.id!""}${splitFlag}${option.paperItemId!""}${splitFlag}${option.itemType.id!""}${splitFlag}${option.itemName!""}${splitFlag}${option.id!""}${splitFlag}${option.seqnum!""}${splitFlag}${option.optionCode!""}${splitFlag}${option.optionName!""}${splitFlag}${option.answer!""}${splitFlag}${option.questionNaire.typeDic.code!""}${splitFlag}${option.itemSeq!""}${splitFlag}${option.itemTypeSeq!""}"/>
									</div>
									</#if>
								</#list>
							</#list>
							</#if>
							
							<div class="row-fluid"><div class="span12">&nbsp;</div></div>
							<div class="btnLeft">
				              <button class="btn btn-info"  onclick="javascript:window.close();">关  闭</button>
				            </div>
			   </div>
            </div>
       </div>
       <script>
   		function accessUrl(url){
   			window.open(""+url,"_blank");
   		}
       </script>
	</body>
</html>