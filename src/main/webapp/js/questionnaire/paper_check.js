      		/**
       		  * 必填选择题验证
       		  * 验证通过：true，验证不通过：false
       		  */
			function choiceItemValidator(itemTypeName){
				if($("input[name='"+itemTypeName+"']").length>0){
						var flag=true;
						$("input[name='"+itemTypeName+"']").each(function(){  
							var requiredValue="";
							var inputName=$(this).val();
							$("input[name='"+inputName+"']").each(function(){  
								if($(this).attr("checked")=='checked'){
									requiredValue+=$(this).val();
								}
							});
							if(comp.isNull(requiredValue)){
								flag = false;
							}
						});
						return flag;
				}else{
					return true;
				}
			}
      		
       		/**
       		  * 必填问答题验证
       		  * 验证通过：true，验证不通过：false
       		  */
			function answerItemValidator(itemTypeName){
				if($("input[name='"+itemTypeName+"']").length>0){
					var flag=true;
						$("input[name='"+itemTypeName+"']").each(function(){  
							var inputName=$(this).val();
							var textAreaValue = $("#"+inputName).val();
							if(comp.isNull(textAreaValue)){
								flag = false;
							}
						});
						return flag;
				}else{
					return true;
				}
			}
			
      		
       		/**
       		  * 单选题选项处理
       		  *@param radioId			单选控件id
       		  *@param itemIndex		单选题目序号
       		  *@param itemIndex		单选题选项序号
       		  *@param itemIndex		单选题选项个数
       		  */
       		function selectSingleOption(radioId,itemIndex,optionIndex,optionsize){
       			var hiddenId = 'singleOption'+itemIndex+'_'+optionIndex;
       			for(var index=0;index<optionsize;index++){
       				var curOptionId = 'singleOption'+itemIndex+'_'+index;
       				if(hiddenId==curOptionId){//选中当前选项
       					$("#"+curOptionId).val("true");
       				}else{//取消选中
       					$("#"+curOptionId).val("false");
       				}
       			}
       		}
       		
       		/**
       		  * 多选题选项处理
       		  *@param checkboxId			多选题控件id
       		  *@param hiddenId				多选题选项隐藏控件id
       		  */
       		function selectMulOption(checkboxId,hiddenId){
       			//如果当前选项未选中，执行选中操作，并未隐藏域赋值【true】
       			if($("#"+checkboxId).attr("checked")=='checked'){
       				$("#"+hiddenId).val("true");
       			}else{//如果当前选项已选中，执行取消操作，并未隐藏域赋值【false】
       				$("#"+hiddenId).val("false");
       			}
       		}