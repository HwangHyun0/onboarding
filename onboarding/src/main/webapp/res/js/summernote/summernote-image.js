/**
 * Copyright 2019 [nobsod | Mathieu Coingt].
 * Website: https://www.nobsod.fr
 * Email: dev@nobsod.fr
 * License: MIT
 *
 * Fork from summernote-audio : https://github.com/taalendigitaal/summernote-audio
 */
(function (factory) {
	/* Global define */
	if (typeof define === 'function' && define.amd) {
		// AMD. Register as an anonymous module.
		define(['jquery'], factory);
	} else if (typeof module === 'object' && module.exports) {
		// Node/CommonJS
		module.exports = factory(require('jquery'));
	} else {
		// Browser globals
		factory(window.jQuery);
	}
}(function ($) {
	$.extend($.summernote.options, {
		callbacks: {
	        onImageUpload : function(file, editor, welEditable){
	        	uploadSummernoteImageFile(file, this);
			}
		}
	});
}));

function uploadSummernoteImageFile(file, el) {
debugger;
	var data = new FormData();	
	data.append("file", file[0]);
	$.ajax({
	  	url: '/dcp/store/uploadImage.dcp',
	  	type: "POST",
	  	enctype: 'multipart/form-data',
	  	data: data,
	  	cache: false,
	  	contentType : false,
	  	processData : false,
		success : function(data) {
			debugger;
			if (data.isSuccess == true) {
				$(el).summernote('editor.insertImage', "/dcp/store/down.dcp?id=" + data.store.file_id);					
			} else {
				alert(data.msg);
			}
        },
        error : function(e) {
            console.log(e);
        }
	});
}
