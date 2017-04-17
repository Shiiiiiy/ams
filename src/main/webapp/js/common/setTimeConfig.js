/**
 * 时间设置通用设置 调用脚本
 */
timeConfig = {
	contextPath : function() {
		var curPath = window.document.location.href;
		var pathName = window.document.location.pathname;
		var pos = curPath.indexOf(pathName);
		var localhostPaht = curPath.substring(0, pos);
		var projectName = pathName.substring(0,pathName.substr(1).indexOf('/') + 1);
		var rootPath = localhostPaht + projectName;
		return rootPath;
	},
	setTime : function(code) 
	{
		comp.showModal("_timeConfigEditDiv","800px","-250px 0 0 -400px");
		$("#_time_config_body").load(this.contextPath() + "/common/config/nsm/timeConfigClientEdit.do",{"code":code},function(){});
	},
	_saveTimeConfig: function()
	{
		if($("#_timeConfigForm").compValidate().form())
		{
			$("#_timeConfigForm").ajaxSubmit({
		        type: 'post', 
		        url: this.contextPath() + '/common/config/opt-submit/ajaxSubmitTimeConfig.do', 
		        data:$("#_timeConfigForm").serialize(),
		        success: function(data)
		        {
		        	var jsonData = data.split(",");
		        	comp.hideModal("_timeConfigEditDiv");
		        	setConfigTimeValue(jsonData[0],jsonData[1],jsonData[2]);
		        }
		    });
		}
	}
}
