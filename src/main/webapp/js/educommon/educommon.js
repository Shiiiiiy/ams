function cascade(url,first,second,defaultValue) {
	$.ajax({
		url : url,
		async : false,
		cache : false,
		type : "POST",
		data : {
			key : $("#"+first).val()
		},
		dataType : "json",
		success : function(data) {
			initOptions($("#"+second), data,defaultValue);
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
						var optionMajor = new Option(label, value, isSelected,isSelected);
						option.add(optionMajor);
					}
				}
			}
		}
	}
}
