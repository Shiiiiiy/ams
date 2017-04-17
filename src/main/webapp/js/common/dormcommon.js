/**
 * 楼，层，舍 查询方法
 */
cascadeDorm = {
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
	changeDormBuilding : function(sroceId, targetId,emptyId,defaultVal) {
		if(emptyId!=null && emptyId!="")
			initOptions($("#" + emptyId),null,null);

		cascadeQuery(
				this.contextPath() + "/comp/opt-query/initCascadeFloor.do",
				sroceId, targetId, defaultVal);
	},
	changeDormFloor : function(key1,key2, targetId) {
		cascadeQuery1(
				this.contextPath() + "/dorm/dormInfo/opt-query/initCascadeDormNo.do",
				key1,key2,targetId);
	},
	getDormBuilding : function(sroceId, targetId,emptyId,defaultVal) {
		if(emptyId!=null && emptyId!="")
			initOptions($("#" + emptyId),null,null);

		cascadeQuery(
				this.contextPath() + "/dorm/dormBuilding/opt-query/initCascadeFloor.do",
				sroceId, targetId, defaultVal);
	},
	getDormFloor : function(key1, key2, targetId) {
		cascadeQuery1(
				this.contextPath() + "/dorm/dormBuilding/opt-query/initCascadeDormNo.do",
				key1, key2, targetId);
	},
	getDormByFloor : function(key1, key2, key3, targetId) {
		cascadeQueryDorm(
				this.contextPath() + "/dorm/dormAdjust/opt-query/initCascadeDorm.do",
				key1, key2, key3, targetId);
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

function cascadeQuery1(url, key1, key2, targetId, defaultValue) {
	$.ajax({
		url : url,
		async : false,
		cache : false,
		type : "POST",
		data : {
			dormBuildingId : $("#" + key1).val(),
			dormFloor : $("#" + key2).val()
		},
		dataType : "json",
		success : function(data) {
			initOptions($("#" + targetId), data, defaultValue);
		}
	});
}

function cascadeQueryDorm(url, key1, key2, key3, targetId, defaultValue) {
	$.ajax({
		url : url,
		async : false,
		cache : false,
		type : "POST",
		data : {
			'dormBuilding.id' : $("#" + key1).val(),
			'dormFloor' : $("#" + key2).val(),
			'gender.id' : $("#" + key3).val()
		},
		dataType : "json",
		success : function(data) {
			initOptions($("#" + targetId), data, defaultValue);
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