/* doLinks script */ 
function linkify(inputText, options) 
{		
	this.options = $.extend(this.options, options);	  
	inputText = inputText.replace(/\u200B/g, "");
	
	var replacePattern1 = /(src="|href="|">|\s>)?(https?|ftp):\/\/[-A-Z0-9+&@#\/%?=~_|!:,.;ï]*[-A-Z0-9+&@#\/%=~_|ï]/gim;
	var replacedText = inputText.replace(replacePattern1, function($0,$1){ return $1?$0:'<a class="url link" href="' + $0 + '"' + 'target="_blank"' + '>'+ $0+ '</a>';});
	
	var replacePattern2 = /(src="|href="|">|\s>|https?:\/\/|ftp:\/\/)?www\.[-A-Z0-9+&@#\/%?=~_|!:,.;ï]*[-A-Z0-9+&@#\/%=~_|ï]/gim;
	var replacedText = replacedText.replace(replacePattern2, function($0,$1){ return $1?$0:'<a class="url link" href="http://' + $0 + '"' + 'target="_blank"' + '>'+ $0+ '</a>';});
	
	var replacePattern3 = /([\.\w]+@[a-zA-Z_]+?\.[a-zA-Z]{2,6})/gim;
	var replacedText = replacedText.replace(replacePattern3, '<a class="url" href="mailto:$1">$1</a>');
	
	return replacedText;
}

$(function(){
	//Css according to character length
	var length = $(".logo").text().length;
	//alert(length);
	if(length<30)
		$(".logo").css({
			'font-size':"45px",
			'line-height':"70px"
			});
	else
		$(".logo").css("font-size","35px");
	
	$(".shift").each(function(){
		$('ul.shifted').append($(this).html());
		$(this).remove();
	});
	//Add See picture or See video
	$( ".more" ).each(function () {
		
		var $placeholder = $(this).find('a');		
		var urlpath = $placeholder.attr('href');
		
		if(typeof $.url(urlpath).param('fbid')!== 'undefined')
			$placeholder.find("span").text("See picture")+$placeholder.attr('target','_blank');
			
		if(typeof $.url(urlpath).param('v')!== 'undefined')
			$placeholder.find("span").text("See video")+$placeholder.attr('target','_blank');	
	
	});

	$(".full_post").each(function(i){
		var text = $(this).html();
		var my = linkify(text);
		
		$('.link').each(function(){
			var myText = $(this).text();
			
			arr = myText.split('/');
			if( typeof arr[1] === 'undefined' )
				domain = arr[0];
			else
				domain = arr[0]+'/'+arr[1]+'/'+arr[2];
			$(this).text(domain);
		});
		
		$(this).html(linkify(text));
		
	  });
	  
	  $( ".full_post" ).each( function (i) {
			var firsturl = $(this).find('.url').attr('href');
		if(typeof firsturl !== 'undefined'){
			firsturl.trim();
			
			if( firsturl.substring((firsturl.length - 1),(firsturl.length)) == '/' ){
				firsturl = firsturl.substring(0, firsturl.length - 1);
			}
			
			var secondurl = $(this).find('.fbcaption').find('a').attr('href');			
			if(typeof secondurl !== 'undefined') {
				secondurl.trim();
				if( secondurl.substring((secondurl.length - 1),(secondurl.length)) == '/' ){
					secondurl = secondurl.substring(0, secondurl.length - 1);
				}
					
			}
			
			if(firsturl == secondurl){
				$('.fbcaption').hide();
			}
			
		}
		});
	  
	  $('.label').text(function(i, text) {
		var t = $.trim(text);
		if (t.length > 15) {
			return $.trim(t).substring(0, 15) + "...";
		}
		return t;
	  });	  
	  	
	//$('.logo a').html($('.logo a').text().replace(/\s+/g, '<br/>'));

	var pull 	= $('#pull');
	menu 		= $('ul#nav ');
	menuHeight	= menu.height();
	$(pull).on('click', function(e) 
	{
		e.preventDefault();
		menu.slideToggle(300,function(){
			if(pull.text()=='Hide Navigation')
				pull.text('Navigation');
			else
				pull.text('Hide Navigation');
		});
	});
	$(window).resize(function(){
		var w = $(window).width();
		if(w > 320 && menu.is(':hidden')) {
			menu.removeAttr('style');
		}
	});
	
        
	var w = $(window).width();
	
	if(w < 768) 
		$('.shifted .nailthumb-container').nailthumb({width:220,height:200});			
	else if ( w > 768 && w < 1024) 
		$('.shifted .nailthumb-container').nailthumb({width:260,height:240});					
	else 
	{
		$('.shifted .nailthumb-container').nailthumb({width:320,height:240});
		$('.events .event-holder').nailthumb({width:200,height:150});
	}
		
	$(".tab_content").hide();
	$(".tab_content:first").show(); 
	
	$("h3.tab-title a").click(function() {
		$("h3.tab-title a").removeClass("active");
		$(this).addClass("active");
		$(".tab_content").hide();
		var activeTab = $(this).attr("rel"); 
		$("#"+activeTab).fadeIn(); 
	});
	
	$(".fancybox").fancybox({
	prevEffect	: 'none',
	nextEffect	: 'none',
	helpers     : {
			title: {
				type: 'inside'
			}
		}
	});
	
			  
});		

//Orientation change event 
$(window).bind('orientationchange', function(event) {
	
	var w = $(window).width();
	if(w < 769){
		$('.nailthumb-container').nailthumb({width:220,height:200});	
		$('.events .event-holder').nailthumb({width:200,height:150});}
		
	else if ( w > 768 && w < 1024) {
		$('.nailthumb-container').nailthumb({width:260,height:240});	
		$('.events .event-holder').nailthumb({width:200,height:150});}
						
	else {
		$('.nailthumb-container').nailthumb({width:320,height:240});	
		$('.events .event-holder').nailthumb({width:200,height:150});}
		
});


//Resize event
$(window).resize(function(){

	var w = $(window).width();
	if(w < 768){
		$('.shifted .nailthumb-container').nailthumb({width:220,height:200});
		$('.events .event-holder').nailthumb({width:200,height:150});}
		
	else if ( w > 768 && w < 1024) {
		$('.shifted .nailthumb-container').nailthumb({width:260,height:240});
		$('.events .event-holder').nailthumb({width:200,height:150});}
					
	else {
		$('.shifted .nailthumb-container').nailthumb({width:320,height:240});	
		$('.events .event-holder').nailthumb({width:200,height:150});}

});