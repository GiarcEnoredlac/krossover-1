$(document).ready(function() {
	$('.scrollable').scrollTop($('.media-list').height());  

	var padderHeightFunc = function() {
		var browserHeight   = $(document).height();
		var mediaListHeight = $(".media-list").height();
		var padderHeight    = browserHeight - mediaListHeight - 190;

	 	$("#display_padder").css('height', padderHeight);
	}

	padderHeightFunc();

	$( window ).resize(function() {
		padderHeightFunc();
 	});

 	$('.form-control').keyup(function(e) {
    if(e.which == 13) {
       padderHeightFunc();
       $('.scrollable').scrollTop($('.media-list').height());  
    }
	});
});
