approve = {
	contextPath : function() {
		var curPath = window.document.location.href;// 获取主机地址之后的目录，如：
													// uimcardprj/share/meun.jsp
		var pathName = window.document.location.pathname;
		var pos = curPath.indexOf(pathName); // 获取主机地址，如：
												// http://localhost:8083
		var localhostPaht = curPath.substring(0, pos); // 获取带"/"的项目名，如：/uimcardprj
		var projectName = pathName.substring(0,
				pathName.substr(1).indexOf('/') + 1);
		var rootPath = localhostPaht + projectName;
		return rootPath;
	},
	showApproveComments:function(objectId){
		// 查看审核记录
		$("#approve-div-body").empty();
		comp.showModal("approve-div","720px","-250px 0 0 -350px");
		$("#approve-div-body").load(this.contextPath()+"/common/approve/nsm/viewApproveComments.do?id="+objectId+"&.temp="+Math.random());
	},
	showHis:function(objectId){
		// 查看审核记录
		$("#approve-his-div-body").empty();
		comp.showModal("approve-his-div","720px","-250px 0 0 -350px");
		$("#approve-his-div-body").load(this.contextPath()+"/apw/amsapprove/nsm/viewApproveHisory.do?id="+objectId+"&.temp="+Math.random());
	},
	applyApprove:function(ids,approveType){
	    if(!comp.isValid(ids)){
			comp.message("请选择要审批的记录");
		}else if(!comp.isValid(approveType)){
			comp.message("请指定审批类型【单次，批量】");
		}else{
	    	_initApplyApprovePanel(ids,approveType);
			comp.showModal("ams_approveHonor");
		}
    }
}