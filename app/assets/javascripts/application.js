// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require polling
//= require faye
//= require messages
//= require app
//= require app.plugin
//= require ui-load
//= require ui-jp.config
//= require ui-jp
//= require ui-nav
//= require ui-toggle
//= require turbolinks
//= require_tree .
$(document).ready(function() {
	$('.circle').circleProgress({
    value: 0.8,
    fill: { gradient: ['#ff1e41', '#ff5f43'] }
	}).on('circle-animation-progress', function(event, progress) {
	    $(this).find('strong').html(parseInt(100 * progress) + '<i>%</i>');
	});

	// var height = $('#next-badge').height();
	// $("#earnings-to-date").css('height', height);
	// $("#current-badge").css('height', height);
	// $('.scrollable').scrollTop($(document).height()); 

	 $('html, body').scrollTop( $(document).height() );

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
       $('.scrollable').scrollTop($('.scrollable').height());  
    }
	});
});

























    
