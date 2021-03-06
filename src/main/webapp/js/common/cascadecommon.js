/**
 * 学院 专业 班级级联 查询方法
 */
cascade = {
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
	changeCollage : function(sroceId, targetId,emptyId,defaultVal) {
		if(emptyId!=null && emptyId!="")
			initOptions($("#" + emptyId),null,null);

		cascadeQuery(
				this.contextPath() + "/comp/opt-query/initCascadeMajor.do",
				sroceId, targetId, defaultVal);
	},
	changeMajor : function(sroceId, targetId, defaultVal) {
		cascadeQuery(
				this.contextPath() + "/comp/opt-query/initCascadeClass.do",
				sroceId, targetId, defaultVal);
	},
	changeCollageQueryClass : function(sroceId, targetId, defaultVal) {
		cascadeQuery(
				this.contextPath() + "/comp/opt-query/initCascadeClassByCollege.do",
				sroceId, targetId, defaultVal);
	}
}

function cascadeQuery(url, first, second, defaultValue) {
	$.ajax({
		url : url,
		async : false,
		cache : false,
		type : "POST",
		data : {
			key : $("#" + first).val()
		},
		dataType : "json",
		success : function(data) {
			initOptions($("#" + second), data, defaultValue);
		}
	});
}

var initOptions = function(selectObject, list, defaultValue) {
	if (selectObject != null && selectObject != undefined) {
		var option = selectObject.get(0).options;
		option.length = 0;
		// 添加一个空选项
		var nullOption = new Option("请选择..", "", false, false);
		option.add(nullOption);
		if (list != null && list != undefined && list != "[]") {
			var json = eval(list);
			for ( var i in json) {
				var item = json[i];
				if (item != null && item != undefined) {
					var value = item.id;
					var label = item.name;
					if (label != null && label != undefined && value != null
							&& value != undefined) {
						var isSelected = false;
						if (defaultValue == value) {
							isSelected = true;
						} else {
							isSelected = false;
						}
						var optionMajor = new Option(label, value, isSelected,
								isSelected);
						option.add(optionMajor);
					}
				}
			}
		}
	}
}