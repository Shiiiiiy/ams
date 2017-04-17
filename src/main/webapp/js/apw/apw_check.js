var resultsArray;
apw = {
		/**
		 * 流程是否可用
		 */
		isAccessProcess:function(processKey){
			var returnValue=false;
			$.ajax({
				url:comp.contextPath()+"/apw/amsapprove/opt-query/isAccessProcess.do",
				async:false,
				cache:false,
				type:"POST",
				data:{processKey:processKey},
				success:function(msg){
					var parsedJson = jQuery.parseJSON(msg); 
					if(parsedJson.resultFlag=="YES"){
						returnValue=true;
					}
				}
			});
			return returnValue;
		},
		
	/**
	 * 是否最后一个节点
	 */
	isFinalTask:function(objectId){
		var returnValue=false;
		$.ajax({
			url:comp.contextPath()+"/apw/amsapprove/opt-query/isFinalTask.do",
			async:false,
			cache:false,
			type:"POST",
			data:{objectId:objectId},
			success:function(msg){
				var parsedJson = jQuery.parseJSON(msg);
				returnValue=(parsedJson.resultFlag=="final");
			}
		});
		return returnValue;
	},
	
	/**
	* 	验证下一节点办理人
	 * @objectId  			业务主键
	 * @approveKey  	审批操作标志【INIT、PASS、NOT_PASS】
	 * @processKey  		流程定义key
	 * @suggest  				审批意见
	 */
	selectNextApprover: function(objectId,approveKey,processKey,suggest){
		$.ajax({
			url:comp.contextPath()+"/apw/amsapprove/opt-query/selectNextApprover.do",
			async:false,
			cache:false,
			type:"POST",
			data:{objectId:objectId,processKey:processKey},
			success:function(msg){
				if(apw.isAccessProcess(processKey)){
					var parsedJson = jQuery.parseJSON(msg); 
					if(parsedJson.resultFlag=="success"){
						var nextApproverArray = parsedJson.nextApproverList;
						if(nextApproverArray.length>=1){
							apw.nextApproverSelect("SINGLE",approveKey,objectId,parsedJson,suggest);
						}else if(nextApproverArray.length == 0){
							$.sticky("下一节点办理人不存在 !", {autoclose:5000, position:"top-right", type:"st-error"});
						}
					}else if(parsedJson.resultFlag=="deprecated"){
						comp.message("审批流已废弃 !","error");
					}
				}else{
					comp.message("当前流程定义未启用、不可发起 !","error");
				}
			}
		});
	},
	
	/**
	 * 选择下一节点办理人
	 * @objectId     						业务主键
	 * @contentArray     			待选择的待办人列表
	 * @approveKey     	  			审批操作标志【INIT、PASS、NOT_PASS】
	 * @processKey     	  			流程定义标志
	 * @suggest     	  					审批意见
	 */
	nextApproverSelect: function(approveType,approveKey,objectId,result,suggest){
		_initPanel(approveType,approveKey,objectId,result,suggest);
		comp.showModal("_selectApprover");
	},
	
	/**
	 * @objectId							业务主键
	 * @userId								下一节点办理人ID
	 * @approveKey					审批操作标志【INIT、PASS、NOT_PASS】
	 * @suggest                           审批意见
	 */
	saveCurSingleAction:function(approveType,objectId,userId,approveKey,suggest){
		if("INIT" == approveKey){
			doInitAction(objectId,userId);
		}else{
			apw.approveCurProcess(approveType,objectId,userId,approveKey,suggest);
		}
	},
	
	/**
	 * @approveType				审批类型
	 * @objectId							业务主键
	 * @userId								下一节点办理人ID
	 * @approveKey					审批操作标志【INIT、PASS、NOT_PASS】
	 * @suggest                           审批意见
	 */
	saveCurMulAction:function(selectedRadioIndex,approveType,objectId,userId,approveKey,approveStatus,processStatusCode,suggest){
		var newContentArray = new Array();
		var result = resultsArray[0];
		var contentArray=result.nextApproverList;
		$.each(contentArray, function(i, item){
			if(i==selectedRadioIndex){
				newContentArray[0] = contentArray[i];
			}
		});
		result.nextApproverList = newContentArray;
		resultsArray[0]=result;
		apw.initNextApprover_(approveType,objectId,userId,approveKey,approveStatus,processStatusCode);
	},
	
	/**
	 * 初始化发起的流程
	 * @url  						流程发起的业务请求路径
	 * @ objectId				业务主键
	 * @userId					下一节点办理人
	 */
	initCurProcess: function(url,objectId,userId){
		$.ajax({
			url:url,
			async:false,
			cache:false,
			type:'POST',
			data:{objectId:objectId,nextApproverId:userId},
			success: function(data){
				var parsedJson = jQuery.parseJSON(data); 
				if(parsedJson.resultFlag=="success"){
					apw.initNextApprover(userId,objectId);
				}else if(parsedJson.resultFlag=="deprecated"){
					comp.message("审批流已废弃 !","error");
				}else if(parsedJson.resultFlag=="error"){
					comp.message("系统异常，请联系管理员 !","error");
				}
		  }
		});
	},
	
	/**
	 * 初始化下一节点办理人
	 * @userId 								下一节点办理人
	 * @objectId  						业务主键ID
	 */
	initNextApprover: function(userId,objectId){
		$.ajax({
				url:comp.contextPath()+"/apw/amsapprove/opt-add/initNextApprover.do",
				async:false,
				cache:false,
				type:'POST',
				data:{userId:userId,objectId:objectId},
				success: function(data){
					var parsedJson = jQuery.parseJSON(data); 
					if(parsedJson.resultFlag=="success"){
						doAmsAction(userId,null,null,null);//执行业务系流程初始化统操作
					}else if(parsedJson.resultFlag=="deprecated"){
						comp.message("审批流已废弃 !","error");
					}
			  }
		}); 
	},
	
	/**
	 * 审批当前流程节点
	 * @url 									流程发起的业务请求路径
	 * @objectId							业务主键
	 * @userId								下一节点办理人
	 * @approveKey					审批操作标志【INIT、PASS、NOT_PASS】
	 * @suggest							流程审批意见
	 */
	approveCurProcess: function(approveType,objectId,userId,approveKey,suggest){
		var url="";
		if(approveKey=="PASS"){
			url=comp.contextPath()+"/apw/amsapprove/opt-add/doPass.do"
		}else if(approveKey=="NOT_PASS"){
			url=comp.contextPath()+"/apw/amsapprove/opt-add/doNotPass.do"
		}else if(approveKey=="REJECT"){
			url=comp.contextPath()+"/apw/amsapprove/opt-add/doReject.do"
		}
		
		$.ajax({
			url:url,
			async:false,
			cache:false,
			type:'POST',
			data:{objectId:objectId,userId:userId,suggest:suggest},
			success: function(data){
				var parsedJson = jQuery.parseJSON(data); 
				if(parsedJson.resultFlag=="success"){
					var nextApproverArray = parsedJson.nextApproverList;
					if(comp.isNull(userId)){
						doAmsAction('',approveKey,parsedJson.approveStatus,
								   parsedJson.processStatusCode);//执行业务系统审批操作
					}else{
						apw.initNextApprover_(approveType,objectId,userId,approveKey,
								parsedJson.approveStatus,parsedJson.processStatusCode);
					}
				}else if(parsedJson.resultFlag=="deprecated"){
					comp.message("审批流已废弃 !","error");
				}else if(parsedJson.resultFlag=="error"){
					comp.message("系统异常，请联系管理员 !","error");
				}
		  }
		}); 
	},
	
	/**
	 * 审批当前流程节点【先审批后选人】
	 * @objectIds						业务主键列表
	 * @approveKey					审批操作标志【PASS、NOT_PASS、REJECT】
	 * @suggest							流程审批意见
	 */
	mulApproveCurProcess: function(objectIds,approveKey,suggest){
			var url="";
			if(approveKey=="PASS"){
				url=comp.contextPath()+"/apw/amsapprove/opt-add/muldoPass.do"
			}else if(approveKey=="NOT_PASS"){
				url=comp.contextPath()+"/apw/amsapprove/opt-add/muldoNotPass.do"
			}else if(approveKey=="REJECT"){
				url=comp.contextPath()+"/apw/amsapprove/opt-add/muldoReject.do"
			}
			$.ajax({
				url:url,
				async:false,
				cache:false,
				type:'POST',
				data:{suggest:suggest,objectIdArray:objectIds,approveKey:approveKey},
				success: function(data){
					var parsedJson = jQuery.parseJSON(data); 
					if(parsedJson.resultFlag=="success"){
						resultsArray = parsedJson.results;
						if(approveKey=="PASS"){//【审批通过】执行业务操作
							if(parsedJson.results.length==1){//单次审核
								var result = parsedJson.results[0];
								var nextApproverArray = result.nextApproverList;
								if(nextApproverArray.length>=1 && result.processStatusCode=="APPROVEING"){
									apw.nextApproverSelect("MUL",approveKey,null,result,suggest);
								}else if(result.processStatusCode=="APPROVEING" && nextApproverArray.length == 0){
									apw.rollbackInstance(result.objectId,result.processKey,"下一节点办理人不存在 !");		
								}else{
									doMulAction(resultsArray);//【通过不需要选人时】执行业务系统操作
								}
							}else{
								doMulAction(resultsArray);//【通过不需要选人时】执行业务系统操作
							}
						}else{
							doMulAction(resultsArray);//【不通过、驳回】执行业务系统操作
						}
					}else if(parsedJson.resultFlag=="deprecated"){
						comp.error("审批流已废弃 !");
					}
			  }
		}); 
	},
	
	/**
	 * 初始化下一节点办理人
	 * @approveType 				审批类型【单次审批，批量审批】
	 * @objectId  						业务主键ID
	 * @userId 								下一节点办理人
	 * @approveKey 					审批操作【同意，不同意，驳回】
	 * @approveStatus 			流程审批状态
	 * @processStatusCode 	当前审批结果编码
	 * @resultsArray 				批量审批结果
	 */
	initNextApprover_: function(approveType,objectId,userId,approveKey,approveStatus,processStatusCode){
		$.ajax({
				url:comp.contextPath()+"/apw/amsapprove/opt-add/initNextApprover.do",
				async:false,
				cache:false,
				type:'POST',
				data:{userId:userId,objectId:objectId},
				success: function(data){
					var parsedJson = jQuery.parseJSON(data); 
					if(parsedJson.resultFlag=="success"){
						if("SINGLE"==approveType){
							doAmsAction(userId,approveKey,approveStatus,processStatusCode);//执行单次审批业务系统审批操作
						}else if("MUL"==approveType){
							doMulAction(resultsArray);//执行批量审批业务系统操作
						}
					}else if(parsedJson.resultFlag=="deprecated"){
						comp.message("审批流已废弃 !","error");
					}
			  }
		}); 
	},
	
	/**
	 * 回滚流程实例到上一步
	 * @objectId 			业务主键
	 * @processKey 	流程定义key
	 */
	rollbackInstance: function(objectId,processKey,message){
		$.ajax({
			url:comp.contextPath()+"/apw/amsapprove/opt-delete/rollback2LastStep.do",
			async:false,
			cache:false,
			type:"POST",
			data:{objectId:objectId,processKey:processKey},
			success:function(msg){
					if('success'== msg){
						if(!comp.isNull(message)){
							$.sticky(message, {autoclose:5000, position:"top-right", type:"st-error"});
						}
					}else if('error'== msg){
						comp.message("系统报错，请联系管理员 !","error");
					}
				}
			});
	},
	
	  /**
	   * 上移记录
	   */
		moveUp:function(id,flowDefineId){
			$.ajax({
				url:comp.contextPath()+"/apw/config/opt-modify/moveUpItem.do",
				async:false,
				cache:false,
				type:"POST",
				data:{id:id},
				success:function(msg){
					if('success'== msg){
					   comp.message("问题上移成功");
					   $("#configLoadList").load(comp.contextPath()+"/apw/config/nsm/getConfigurationList.do",{processId:flowDefineId},function(){});
					}else if('min'== msg){
						comp.message("无法继续上移");
					}else if('null'== msg){
						comp.message("当前问题不存在，请联系管理员 !","error");
					}else if('error'== msg){
						comp.message("系统报错，请联系管理员 !","error");
					}
				}
			});
		},

		 /**
		  * 下移记录
		  */
		moveDown:function(id,flowDefineId){
			$.ajax({
				url:comp.contextPath()+"/apw/config/opt-modify/moveDownItem.do",
				async:false,
				cache:false,
				type:"POST",
				data:{id:id},
				success:function(msg){
					if('success'== msg){
						comp.message("问题下移成功");
					   $("#configLoadList").load(comp.contextPath()+"/apw/config/nsm/getConfigurationList.do",{processId:flowDefineId},function(){});
					}else if('max'== msg){
						comp.message("无法继续下移");
					}else if('null'== msg){
						comp.message("当前问题不存在，请联系管理员 !","error");
					}else if('error'== msg){
						comp.message("系统报错，请联系管理员 !","error");
					}
				}
			});
		},
	  
	 	/**
	 	 * 删除记录
	 	 */
	    deleteItem: function(id,flowDefineId){
		$.ajax({
			url:comp.contextPath()+"/apw/config/opt-modify/deleteItem.do",
			async:false,
			cache:false,
			type:"POST",
			data:{pk:id},
			success:function(msg){
					if('success'== msg){
						comp.message("问题删除成功");
				  		$("#configLoadList").load(comp.contextPath()+"/apw/config/nsm/getConfigurationList.do",{processId:flowDefineId},function(){});
					}else if('error'== msg){
						comp.message("系统报错，请联系管理员 !","error");
					}
				}
			});
		},
		
		/**
		  * 为审批意见默认赋值
		  */
		fillDefaltMessage:function(msgId,defultMsg){
		    var curMsg = $.trim($("#"+msgId).val());
			if(comp.isNull(curMsg)){
				$("#"+msgId).val(defultMsg);
			}
		}
};