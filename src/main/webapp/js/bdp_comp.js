/**
 * @author ll
 * @date 2013-8-31
 * @description component
 */
var compVar;
$(function() {
	$("input:text").blur(function() {
		/*if(this.value.indexOf("\"")>-1||this.value.indexOf("'")>-1||this.value.indexOf("<")>-1||this.value.indexOf(">")>-1){
			comp.message("\u7CFB\u7EDF\u5DF2\u7ECF\u81EA\u52A8\u5E2E\u60A8\u53BB\u9664\u975E\u6CD5\u5B57\u7B26('<>',\u524D\u540E\u7A7A\u683C,\u5355\u53CC\u5F15\u53F7)","info");
			this.value=this.value.replace(/\"/g,"").replace(/'/g,"");
			this.value=this.value.replace(/</g,"").replace(/>/g,"");
		}*/
		this.value=$.trim(this.value);
	});
	comp.validate.regRxp("uwsnumchar","^[0-9a-zA-Z_]*$", "\u53EA\u80FD\u5305\u62EC\u82F1\u6587\u5B57\u6BCD\u3001\u6570\u5B57\u548C\u4E0B\u5212\u7EBF");
	comp.validate.regRxp("uwsnumcharcn","^[\u0391-\uFFE50-9a-zA-Z_]*$", "\u53EA\u80FD\u5305\u62EC\u4E2D\u6587\u5B57\u3001\u82F1\u6587\u5B57\u6BCD\u3001\u6570\u5B57\u548C\u4E0B\u5212\u7EBF");
	comp.validate.regRxp("uwsnumcharcnspace","^[\u0391-\uFFE50-9a-zA-Z_ ]*$", "只能包括中文字、英文字母、数字和下划线");
	comp.validate.regRxp("uwsnumcharonly","^[0-9a-zA-Z]*$", "\u53EA\u80FD\u5305\u62EC\u82F1\u6587\u5B57\u6BCD\u3001\u6570\u5B57");
	comp.validate.regRxp("regphone","^13[0123456789]{1}[0-9]{8}|15[012356789]{1}[0-9]{8}|18[012356789]{1}[0-9]{8}$", "\u624B\u673A\u683C\u5F0F\u4E0D\u6B63\u786E");
	comp.validate.regRxp("regQq","^[1-9][0-9]{4,12}$", "QQ号码格式不正确");
	comp.validate.regRxp("regPost","^[0-9][0-9]{5}(?!\d)$", "邮编格式不正确");
	comp.validate.regRxp("isTelPhone","^0[0-9]{2,3}\-?([2-9][0-9]{6,8})+(\-[0-9]{1,4})?$", "格式不正确：区号-号码-分机号（可不填）");
	comp.validate.regRxp("isNumber","^[0-9]*$", "请填写数字");
	
	$("form input").keypress(function(e){  
        if(e.keyCode == 13) {
            e.preventDefault();  
        }  
    });
});

comp = {
		orgSingleSelect: function(treeId) {//treeId前端放置树的控件的id
			var url=this.contextPath()+"/user/comp/getOrgTree.do";
			var singleOrgNodes;
			var singleOrgSet = {
					data: {
						simpleData: {enable: true}
							},
					view: {
						dblClickExpand: true,
						selectedMulti: false
							}
				};
			$.ajax({
				async : false,
				cache:false,
				type: 'POST',
				dataType : "json",
				url: url,
				error: function () {
					/*扩展错误提示 */
					comp.message("\u8BF7\u6C42\u5931\u8D25\uFF0C\u8BF7\u7A0D\u540E\u518D\u8BD5!","error");
				},
				success:function(data){ 
					singleOrgNodes = data; 
				}
			});
			$.fn.zTree.init($("#"+treeId), singleOrgSet, singleOrgNodes);
		},
		orgMultiSelect: function(treeId) {
			var url=this.contextPath()+"/user/comp/getOrgTree.do";
			var MultiOrgNodes;
			var MultiOrgSet = {
					check: {
							enable: true,
							chkStyle : "checkbox",
							chkboxType: { "Y": "", "N": "" }
						},
					data: {
							simpleData: {enable: true}
						},
					view: {
							dblClickExpand: true,
							selectedMulti: false
						}
				};
				$.ajax({
					async : false,
					cache:false,
					type: 'POST',
					dataType : "json",
					url: url,
					error: function () {
						/*扩展错误提示 */
						comp.message("\u8BF7\u6C42\u5931\u8D25\uFF0C\u8BF7\u7A0D\u540E\u518D\u8BD5!","error");
					},
					success:function(data){
						MultiOrgNodes = data; 
					}
				});
				$.fn.zTree.init($("#"+treeId), MultiOrgSet, MultiOrgNodes);
		},
		//initTree参数说明：treeId:树组件id；url：获取树数据的后台连接；data：url带的参数；type：树的类型；onclick：节点单击事件；setting：自定义setting
		initTree:function(treeId,url,data,type,onclick,setting){
			var check = "";
			if(type=="radio"){
				check={chkStyle : "radio",radioType: "all",enable: true};
			}else if(type=="checkbox"){
				check={chkStyle : "checkbox",chkboxType: { "Y":"", "N": "" },enable: true};
			}else{
				check={enable: false};
			}
			if(setting==null||setting==""){
				var treeSet = {
					check:check,
					data: {simpleData: {enable: true},key:{title: "title"}},
					view: {dblClickExpand: true,selectedMulti: false},
					callback:{onClick:onclick}
					};
			}else{
				setings={data: {
					key: {
						title: "title"
					}				
				}};
				var treeSet = $.extend( true, {},setings,setting );
			}
			var treeNodes;
			$(function(){
				$.ajax({
					async : false,
					cache:false,
					type: 'POST',
					dataType : "json",
					url: url,
					data:data,
					error: function () {
						/*扩展错误提示 */
						comp.message("\u8BF7\u6C42\u5931\u8D25\uFF0C\u8BF7\u7A0D\u540E\u518D\u8BD5!","error");
					},
					success:function(data){
						treeNodes = data; 
					}
				});
				$.fn.zTree.init($("#"+treeId), treeSet, treeNodes);
			});
		},
		//returnTreeValue参数说明：type：输的类型无选择框和右选择框（选择框包括checkbox,radio）
		returnTreeValue:function(treeId,type){
			var treeObj = $.fn.zTree.getZTreeObj(treeId);
			var nodes=null;
			if(treeObj!=null){
				if(type==""||type==null){
					nodes = treeObj.getCheckedNodes(true);
				}else{
					nodes = treeObj.getSelectedNodes();
				}
			}
			return nodes;
		},
		getTreeObj:function(treeId){
			return $.fn.zTree.getZTreeObj(treeId);
		},
		//showModal参数说明divId：div的id;width：modal的宽度;position：modal的位置（上 右 下 左）
		showModal:function(divId,width,position){
			if(!width){
			}else{
				$('#'+divId).css("width",width);
			}
			if(!position){
			}else{
				$('#'+divId).css("margin",position);
			}
			$('#'+divId).modal({
				backdrop: "static",
				show:true
			});
		},
		hideModal:function(divId){
			$('#'+divId).modal('hide');
		},
		confirm:function(msg,function_){
			bootbox.setDefaults({locale: "zh_CN"}); 
			bootbox.confirm(msg,function_); 
		},
		message:function(msg,type,autoclose,position){//msg消息，type显示类型error警告,info信息
			type=type==null||type==""?"st-info":"st-"+type;
			autoclose=autoclose==null||autoclose==""?5000:autoclose;
			position=position==null||position==""?"top-right":position;
			$.sticky(msg, {autoclose : autoclose, position:position, type: type });
		},
		contextPath:function(){
			var curPath=window.document.location.href;//获取主机地址之后的目录，如： uimcardprj/share/meun.jsp
			var pathName=window.document.location.pathname;
			var pos=curPath.indexOf(pathName); //获取主机地址，如： http://localhost:8083
			var localhostPaht=curPath.substring(0,pos); //获取带"/"的项目名，如：/uimcardprj
			var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1); 
			var rootPath = localhostPaht+projectName;
			return rootPath;
		},
		getTimestamp:function(){
			return new Date().getTime();
		},
		validate:validate={
			regRxp:function(name,rule,message){//自定义正则校验
				jQuery.validator.addMethod(name, function(value, element) {
					value=$.trim(value);
					var charRe=new RegExp(rule);
					return this.optional(element) || (charRe.test(value));
					}, message);  
			},
			addRemote:function(name,url,data,message){//增加remote规则,后台ajax返回值为“true”通过，”false“不通过
				jQuery.validator.addMethod(name, function(value, element) {
					var optionalval = this.optional(element);
					var returnval;
					$.ajax({
							async : false,
							cache:false,
						    type: "post",               
						    dataType: "json",          
							url: url,
						    data:data,
						    success: function(msg){
						    	returnval = optionalval || (msg==true);
					   		}            
						});
						return returnval;
				}, message);  
			},
			addRule:function(name,func,message){//增加规则
				jQuery.validator.addMethod(name, func, message);  
			}
		},
		resetForm:function(form){
			$(':input','#'+form).not(':button, :submit, :reset, :hidden').val('').removeAttr('checked').removeAttr('selected');
		},
		clearForm:function(formId){ //清空操作按钮统一方法 添加class="notClear" 不置空当前项
			$(':input','#'+formId).not(':button, :submit, :reset, :hidden, .notClear').val('').removeAttr('checked').removeAttr('selected');
			$(':input','#'+formId).not(':button, :submit, :reset, :hidden, .notClear').val('').removeAttr('checked').removeAttr('selected');
			$(".emptySelect").each(function(){
				$(this).empty();
				$(this).append("<option value=''>请选择..</option>"); 
			});
		},
		compareDate:function(startTime,endTime) // 时间的大小比较  
		{
			var start=new Date(startTime.replace("-", "/").replace("-", "/"));
			var end=new Date(endTime.replace("-", "/").replace("-", "/"));
			if(end<start)
			 	return false;
			return true;
		},
		checkboxSelectValidator:function(boxname){
			var chk_value =[];    
			$('input[name="'+boxname+'"]:checked').each(function(){    
			   chk_value.push($(this).val());    
		    });    
			return (chk_value.length==0)?false:true;   
		},
		selectAllCheckbox:function(mainbox,boxname){
			 if (typeof($("#"+mainbox+"").attr("checked"))=='undefined'){
				 $("input[name='"+boxname+"']").removeAttr('checked');
			 }else{
				 $("input[name='"+boxname+"']").attr("checked",$("#"+mainbox+"").attr("checked"));
			 }
		},
		getCheckboxValue:function(boxname,selectedBox){
			$("#"+selectedBox).val("");
 			$("input[name='"+boxname+"']").each(  
				function(){
					if($(this).is(':checked')){
						if($("#"+selectedBox).val() == ""){
							
							$("#"+selectedBox).val($(this).val());
						}else{
							
							$("#"+selectedBox).val($("#"+selectedBox).val()+","+$(this).val());
						}
					}
			});
		},
		isNull:function(str){
			if($.trim(str).length<=0){
				return true;
			}else{
				return false;
			}
		},
		isNotNull:function(str){
			return !this.isNull(str);
		},
		isUndefine:function(str){
			if (typeof(str) == "undefined") { 
				return true;
			}else{
				return false;
			}
		},
		isValid:function(str){
			return (!this.isNull(str) && !this.isUndefine(str));
		},
		/**
		 * @objId  绑定事件的控件id
		 * @inputId 控制属性的控件id
		 */
		controlReadonly:function(objId,inputId){//控制单个控件的只读属性
			var attrValue = $("#"+inputId).attr("readonly");
			if(attrValue=="readonly"){
				$("#"+inputId).removeAttr("readonly");
			}else{
				$('#'+inputId).attr("readonly","readonly")
			}
		},
		/**
		 * @objId  绑定事件的控件id
		 * @inputId 控制属性的控件id
		 */
		controlDisabled:function(objId,inputId){//控制单个控件的禁用属性
			var attrValue = $("#"+inputId).attr("disabled");
			if(attrValue=="disabled"){
				$("#"+inputId).removeAttr("disabled");
			}else{
				$('#'+inputId).attr("disabled","disabled")
			}
		},		
		/**
		 * @objId  绑定事件的控件id
		 * @inputName 控制属性的控件name
		 */
		controlMulReadonly:function(objId,inputName){//控制一组控件的只读属性
			$("input[name='"+inputName+"']").each(function(){
				var attrValue = $(this).attr("readonly");
				if(attrValue=="readonly"){
					$(this).removeAttr("readonly");
				}else{
					$(this).attr("readonly","readonly")
				}
			  });
		},
		/**
		 * @objId  绑定事件的控件id
		 * @inputName 控制属性的控件name
		 */
		controlMulDisabled:function(objId,inputName){//控制一组控件的禁用属性
			$("input[name='"+inputName+"']").each(function(){
				var attrValue = $(this).attr("disabled");
				if(attrValue=="disabled"){
					$(this).removeAttr("disabled");
				}else{
					$(this).attr("disabled","disabled")
				}
			  });
		},
		controlMulSelectDisabled:function(objId,inputName){
			$("select[name='"+inputName+"']").each(function(){
				var attrValue = $(this).attr("disabled");
				if(attrValue=="disabled"){
					$(this).removeAttr("disabled");
				}else{
					$(this).attr("disabled","disabled")
				}
			 });
		},
		/**
		 * @objId  绑定事件的控件id
		 * @hiddenId 控制隐藏属性的隐藏控件id
		 */
		controlHidden:function(objId,hiddenId){//控制单个div的隐藏属性
			var hiddenValue = $("#"+hiddenId).val();
			if(hiddenValue=="hidden_"){
				$("#"+objId).show();
				$("#"+hiddenId).val("show_");
			}else if(hiddenValue=="show_"){
				$("#"+objId).hide();
				$("#"+hiddenId).val("hidden_");
			}
		},
		/**
		 * 为控件添加样式验证
		 * @pk 控件 id
		 * @flag 验证类型【warn：提醒，ok:通过】
		 */
		 cssValidate:function(pk,flag){
			if(flag=="warn"){
				$("#"+pk).css('fontWeight','bold');
		    	$("#"+pk).css('color','red');
			}else if(flag=="ok"){
				$("#"+pk).css('fontWeight','normal');
		    	$("#"+pk).css('color','black');
			}
		},
		/**
		 * 根据控件name获取值，拼接成字符串
		 * @inputName 下拉列表name
		 */
		getSlectValuesByName:function(inputName){
			var selectValue="";
			$("select[name='"+inputName+"']").each(function(){
				selectValue+=$(this).val()+',';
			 });
			var index=selectValue.lastIndexOf(",");
			return selectValue.substring(0,index);
		}
	};
(function($) {
	
	compDefault={//默认配置
			onkeyup: false,
			errorClass: 'error',
			validClass: 'valid',
			focusCleanup:true,
			focusInvalid:false,
			onfocusout:function(element, event){
				$("input:text").blur(function() {
					/*if(this.value.indexOf("\"")>-1||this.value.indexOf("'")>-1||this.value.indexOf("<")>-1||this.value.indexOf(">")>-1){
						comp.message("\u7CFB\u7EDF\u5DF2\u7ECF\u81EA\u52A8\u5E2E\u60A8\u53BB\u9664\u975E\u6CD5\u5B57\u7B26('<>',\u524D\u540E\u7A7A\u683C,\u5355\u53CC\u5F15\u53F7)","info");
						this.value=this.value.replace(/\"/g,"").replace(/'/g,"");
						this.value=this.value.replace(/</g,"").replace(/>/g,"");
					}*/
					this.value=$.trim(this.value);
				});
				if ( !this.checkable(element) && (element.name in this.submitted || !this.optional(element)) ) {
					this.element(element);
				}
			},
			highlight: function(element) {
				$(element).closest('div').addClass("f_error");
			},
			unhighlight: function(element) {
				$(element).closest('div').removeClass("f_error");
			},
		    errorPlacement: function(error, element) {
		        $(element).closest('div').append(error);
		    },
		    messages: {}
		};
	$.extend($.fn, {
		compValidate:function(options){//校验方法
			if ( $(this[0]).is('form')) {
					var settings = $.extend( true, {},compDefault, options );
					var validator=this.validate(settings);
					$.data(this[0],"compvalidator",validator);
					return validator;
				}else{
					
				}
		},
		compValidator:function(){//获取校验器
			if ( $(this[0]).is('form')) {
				return $.data(this[0],"compvalidator");
			}else{
				
			}
		},
		compReset:function(){//重置表单
			!this.compValidator()?"":this.compValidator().resetForm();
			$(this[0]).find("div").removeClass("f_error");
			this[0].reset();
			
		},
		compValid:function(){//直接验证表单
			return this.valid();
		}
	});
}(jQuery));

