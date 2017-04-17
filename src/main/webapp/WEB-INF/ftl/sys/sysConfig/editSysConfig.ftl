<html>
<head>
	<!-- ajax form-->
	<script src="${rc.contextPath}/js/jquery.form.js"></script>
    <!-- bootstrap-fileupload -->	
	<link rel="stylesheet" href="${rc.contextPath}/lib/bootstrap-fileupload/bootstrap-fileupload.min.css" />
	
<script type="text/javascript">
<!--

$("document").ready(function(){
		 
         $(".form_validation_reg").compValidate({
				rules:{     
						USER_PASSWORD: {required:true,rangelength:[8,16]},
						//SYSTEM_NAME:{required:true,maxlength:12,messages:{required:'系统名称不能为空'}},
						COPYRIGHT_INFO:{required:true,maxlength:100}
					},
					messages:{
						USER_PASSWORD:{required:'用户密码设置不能为空'},
						COPYRIGHT_INFO:{required:'版权信息不能为空'}
					}
				});
		
		$('#fileUpload').ajaxForm({
			target: '#resultsDiv'
		});
		
		
   		 <#if uploadFile ?? && uploadFile.id?? >
			//$("#fileuploadDiv").addClass('fileupload-exists').removeClass('fileupload-new');
		</#if>
	
});



!function ($) {

  "use strict"; // jshint ;_

 /* FILEUPLOAD PUBLIC CLASS DEFINITION
  * ================================= */

  var Fileupload = function (element, options) {
    this.$element = $(element)   
    
    this.type = this.$element.data('uploadtype') || (this.$element.find('.thumbnail').length > 0 ? "image" : "file")
      
    this.$input = this.$element.find(':file')
    if (this.$input.length === 0) return

    this.name = this.$input.attr('name') || options.name

    this.$hidden = this.$element.find('input[type=hidden][name="'+this.name+'"]')
    if (this.$hidden.length === 0) {
      this.$hidden = $('<input type="hidden" />')
      this.$element.prepend(this.$hidden)
    }

    this.$preview = this.$element.find('.fileupload-preview')
    var height = this.$preview.css('height')
    if (this.$preview.css('display') != 'inline' && height != '0px' && height != 'none') this.$preview.css('line-height', height)

    this.original = {
      'exists': this.$element.hasClass('fileupload-exists'),
      'preview': this.$preview.html(),
      'hiddenVal': this.$hidden.val()
    }
    
    this.$remove = this.$element.find('[data-dismiss="fileupload"]')

    this.$element.find('[data-trigger="fileupload"]').on('click.fileupload', $.proxy(this.trigger, this))

    this.listen()
  }
  
  Fileupload.prototype = {
    
    listen: function() {
      this.$input.on('change.fileupload', $.proxy(this.change, this))
      $(this.$input[0].form).on('reset.fileupload', $.proxy(this.reset, this))
      if (this.$remove) this.$remove.on('click.fileupload', $.proxy(this.clear, this))
    },
    
    change: function(e, invoked) {
      if (invoked === 'clear') return    
      var file = e.target.files !== undefined ? e.target.files[0] : (e.target.value ? { name: e.target.value.replace(/^.+\\/, '') } : null)     
      if (!file) {
        this.clear()
        return
      }
      this.$hidden.val('')
      this.$hidden.attr('name', '')
      this.$input.attr('name', this.name)

	if(typeof FileReader == "undefined"){
	  /*定制内容*/
        $('#fileUpload').submit();
	}	
      else if (this.type === "image" && this.$preview.length > 0 && (typeof file.type !== "undefined" ? file.type.match('image.*') : file.name.match(/\.(gif|png|jpe?g)$/i)) && typeof FileReader !== "undefined") {
        
        var reader = new FileReader()
        var preview = this.$preview
        var element = this.$element

        reader.onload = function(e) {
          preview.html('<img src="' + e.target.result + '" ' + (preview.css('max-height') != 'none' ? 'style="max-height: ' + preview.css('max-height') + ';"' : '') + ' />')
          element.addClass('fileupload-exists').removeClass('fileupload-new');
        }

        reader.readAsDataURL(file);
         /*定制内容*/
        $('#fileUpload').submit();
        
      } else {
        this.$preview.text(file.name)
        this.$element.addClass('fileupload-exists').removeClass('fileupload-new');
      }
    },

    clear: function(e) {
      this.$hidden.val('');
      this.$hidden.attr('name', this.name);
      this.$input.attr('name', '');

      //ie8+ doesn't support changing the value of input with type=file so clone instead
      if (navigator.userAgent.match(/msie/i)){ 
          var inputClone = this.$input.clone(true);
          this.$input.after(inputClone);
          this.$input.remove();
          this.$input = inputClone;
      }else{
          this.$input.val('')
      }

      this.$preview.html('')
      this.$element.addClass('fileupload-new').removeClass('fileupload-exists')

      if (e) {
        this.$input.trigger('change', [ 'clear' ])
        e.preventDefault()
      }
    },
    
    reset: function(e) {
      this.clear()
      
      this.$hidden.val(this.original.hiddenVal)
      this.$preview.html(this.original.preview)
      
      if (this.original.exists) this.$element.addClass('fileupload-exists').removeClass('fileupload-new')
       else this.$element.addClass('fileupload-new').removeClass('fileupload-exists')
    },
    
    trigger: function(e) {
      this.$input.trigger('click')
      e.preventDefault()
    }
  }

  
 /* FILEUPLOAD PLUGIN DEFINITION
  * =========================== */

  $.fn.fileupload = function (options) {
    return this.each(function () {
      var $this = $(this)
      , data = $this.data('fileupload')
      if (!data) $this.data('fileupload', (data = new Fileupload(this, options)))
      if (typeof options == 'string') data[options]()
    })
  }

  $.fn.fileupload.Constructor = Fileupload


 /* FILEUPLOAD DATA-API
  * ================== */

  $(document).on('click.fileupload.data-api', '[data-provides="fileupload"]', function (e) {
    var $this = $(this)
    if ($this.data('fileupload')) return
    $this.fileupload($this.data())
      
    var $target = $(e.target).closest('[data-dismiss="fileupload"],[data-trigger="fileupload"]');
    if ($target.length > 0) {
      $target.trigger('click.fileupload')
      e.preventDefault()
    }
  })

}(window.jQuery);






    
  	
//-->
</script>
	
</head>
<body>

<div id="contentwrapper">
    <div class="main_content">
 		<div class="row-fluid">
 		<!--
     	<h3 class="heading">系统配置</h3>
     	-->
      <form  id="sysConfigForm" class="form_validation_reg" action="${rc.contextPath}/sys/sysConfig/opt-update/submitSysConfig.do" method="post">
      
      <div class="formSep">
      		<div class="row-fluid">
      		<div class="span8">
      		  	<div class="span2">
        			<span class="formTitle">密码设置</span><span class="formRed">*</span>
        	 	</div>
           	  	<div class="span10">
       				<input name="USER_PASSWORD"  value="${(userPassword.value!"")?html}"/>
					
		        		<div class="alert alert-warning">
		        		<strong>说明</strong> 
		        			该设置是系统管理员重置用户密码时，默认使用的密码。
		        		</div>
		        		
        		</div> 
        	</div>   
        	</div>     	
       </div> 
      <!--
      <div class="formSep">
      		<div class="row-fluid">
      		<div class="span8">
      		  	<div class="span2">
        			<span class="formTitle">系统名称</span><span class="formRed">*</span>
        	 	</div>
           	  	<div class="span10">
       				<input name="SYSTEM_NAME"  value="${(systemName.value!"")?html}"/>
        		</div>
        	</div>
        	</div>
       </div> 
      
      <div class="formSep">
      	<div class="row-fluid">
      	<div class="span8">
      		<div class="span2">
         		<span class="formTitle">版权信息</span><span class="formRed">*</span>
        	</div>
           	<div class="span10">
         		<textarea class="span12" rows="5" cols="12" name="COPYRIGHT_INFO">${(copyRight.value!"")?html}</textarea>										
      		</div>
      	</div>
      </div>
      </div>
      --> 
      </form>
      <!--
    <form  id="fileUpload"  action="${rc.contextPath}/sys/sysConfig/singleFileUpload.do" method="post"  enctype="multipart/form-data">
    	 <input type="hidden" name="objectId" value="${(logo.id)!""}"/>
		 <input type="hidden" name="allowedExt" value="jpg,png,img,gif"/>
		 <input type="hidden" name="maxSize" value="2097152"/> 2M
		 <input type="hidden" name="TEMP_FILE" value="SYSCONFIG_FILE_SESSION_KEY"/> 临时文件存放sessionkey  
		 
      <div class="formSep"> 
      	<div class="row-fluid">
      	<div class="span8">
      		<div class="span2">
                <span class="formTitle">系统图标</span><span class="formRed">*</span>
        	</div>
        	<div class="span10">
        	
        			<div id="fileuploadDiv" class="fileupload fileupload-new" data-provides="fileupload">
				    <div class="fileupload-new thumbnail" style="width: 200px; height: 150px;">
				        <#if uploadFile ?? && uploadFile.id?? >
							<img src="${rc.contextPath}/sys/sysConfig/file.do?id=${uploadFile.id}"/>
						</#if>
				    </div>
				    <div class="fileupload-preview fileupload-exists thumbnail" style="max-width: 200px; max-height: 150px; line-height: 20px;">
				    </div>
				    <div>
				        <span class="btn btn-file">
				            <span class="fileupload-new">
				               	 选择图片
				            </span>
				            
				            <span class="fileupload-exists">
				                                                          选择图片
				            </span>
				            
				            <input type="file" name="file"/>
				        </span>
				       
				    </div>
				    <div id="resultsDiv"></div>
				</div>        	
        	
        		<div class="alert alert-warning">
        		<strong>注意!</strong> 
        			本地图片预览功能仅在 IE10+, FireFox3.6+, Chrome6.0+版本的浏览器中使用，其余版本浏览器，该图片预览功能将用文件名称替代。
        		</div>
					
				</div>
			</div>
			</div>
		</div>
      </div>
      </form>
      -->
	  <div class="span6">
	        	<p class="btnMargin"><!--
	                <a class="btn btn-info"  onclick="javascript:$('#fileUpload').submit();">上传</a>
	                -->
					<button class="btn btn-info" onclick="javascript:$('#sysConfigForm').submit();">保 存</button>
			    </p>
	  </div>    
		</div>
	</div>
</div>

</body>
</html>
