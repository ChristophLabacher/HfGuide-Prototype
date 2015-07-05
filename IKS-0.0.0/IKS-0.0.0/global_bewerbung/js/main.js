$(document).ready(function(){
	var scrolling=true;
	var originX;
	slider1 = $('.bxslider1').bxSlider({touchEnabled:false,pager:false,infiniteLoop: false});
	slider2 = $('.bxslider2').bxSlider({touchEnabled:false,controls:false,pager:false,infiniteLoop: false});
	slider3 = $('.bxslider3').bxSlider({touchEnabled:false,controls:false,pager:false,infiniteLoop: false});
	var currentSlide;
	//FULLPAGEJS
	$('#fullpage').fullpage({
		touchSensitivity: 15,
		keyboardScrolling: false,
		afterLoad: function( anchorLink, index, slideAnchor, slideIndex){
				if(index==1){
					currentSlide=1;
					$("#indicatorActive").animate({width:"50%"});
					$(".question").draggable({ 
						containment: "parent",  
						start: function(event,ui){
							originX=ui.position.left;
						},
						drag: function(event, ui){
							$.fn.fullpage.setAllowScrolling(false);	
						},
						stop: function(event,ui) {
							var current=$(this).attr("id");
							console.log(current);
							
							if(originX-ui.position.left>50){
								$(this).animate({left:"0px"});
							}
							if(originX-ui.position.left<-50){
								$(this).animate({left:"350px"});
							}
							$(".question").each(function() {
                                if($(this).attr("id")!=current){
									$(this).animate({left:"350px"});
								}
                            });
							$.fn.fullpage.setAllowScrolling(true);	
							console.log("LOS");
						}
					});
				}	
				if(index==2){
					currentSlide=2;
					$("#indicatorActive").animate({width:"105%"});
				}
		 }	
	});
	
	//MAGNIFYING
	var zoomSize = 125;				// Zoom Radius (Offset calculation. Standard size is at 100px circle)
	var touchOffset = 85;			// Manual Offset so that zoom window isn't on thumb
	var pageYOffset = zoomSize/2;
	var pageXOffset = (zoomSize/2);

	var pageYOffsetMobile = zoomSize/2;
	var pageXOffsetMobile = zoomSize/2;

	$('#base-image').bind('mousedown',function(e){
		$.fn.fullpage.setAllowScrolling(false);	
		e.preventDefault();
		var elementOffset = $(this).offset();	
		$('#zoom').css('top',event.pageY-pageYOffset-touchOffset);
		$('#zoom').css('left',event.pageX-pageXOffset);
		$('#zoom').css('background-position',(-(event.pageX - elementOffset.left - pageXOffset))+'px '+(-(event.pageY-elementOffset.top - pageYOffset))+'px');
		$("#zoom").css("display","block");
	});

	$('#base-image').bind('touchstart',function(e){
		$.fn.fullpage.setAllowScrolling(false);	
		var elementOffset = $(this).offset();
		var touch = e.originalEvent.touches[0] || e.originalEvent.changedTouches[0];
		$('#zoom').css('top',touch.pageY-pageYOffsetMobile-touchOffset);
		$('#zoom').css('left',touch.pageX-pageXOffsetMobile);
		$('#zoom').css('background-position',(-(event.pageX - elementOffset.left - pageXOffsetMobile))+'px '+(-(event.pageY - elementOffset.top - pageYOffsetMobile))+'px');
		$("#zoom").css("display","block");
		e.preventDefault();
	});

	// ZOOM MOVE
	$('#base-image').bind('mousemove',function(e){
		e.preventDefault();
		var elementOffset = $(this).offset();
		$('#zoom').css('top',event.pageY-pageYOffset-touchOffset);
		$('#zoom').css('left',event.pageX-pageXOffset);
		$('#zoom').css('background-position',(-(event.pageX - elementOffset.left - pageXOffset+30)*2)+'px '+(-(event.pageY-elementOffset.top - pageYOffset)*2)+'px');

	});
	
	$('#base-image').bind('touchmove',function(e){
		e.preventDefault();
		var elementOffset = $(this).offset();	
		var touch = e.originalEvent.touches[0] || e.originalEvent.changedTouches[0];
		$('#zoom').css('top',touch.pageY-pageYOffsetMobile-touchOffset);
		$('#zoom').css('left',touch.pageX-pageXOffsetMobile);

		$('#zoom').css('background-position',(-(event.pageX - elementOffset.left - pageXOffsetMobile+30)*2)+'px '+(-(event.pageY - elementOffset.top - pageYOffsetMobile)*2)+'px');
	});

	// ZOOM UP
	$('#zoom-container').bind('mouseup',function(e){
		$.fn.fullpage.setAllowScrolling(true);	
		$("#zoom").css("display","block");
	});

	$('#zoom-container').bind('touchend',function(e){
		$.fn.fullpage.setAllowScrolling(true);	
		$("#zoom").css("display","block");
		scrolling=true;
	});
	
	
	//NOTES
	var slideCount=0;
	var written=false;
	var limit=false;
	var typingTimer;                //timer identifier
	var doneTypingInterval = 500;  //time in ms, 5 second for example

	$("#footerIn").on("click",function(){
		$(".footerContainer").css({position:'absolute',bottom:'0px'});
		$("#footerIn").addClass("active");
		$(".save").addClass("active");
		document.getElementById("wordCount").innerHTML="SPEICHERN";	
		if(!written){
			$("#footerIn").html("");
		}
		
	});
	
	$("#footerIn").on("keypress",function (event) {
		written=true;
		if(limit&&event.keyCode!=8){
			return false;
		}
	});
	
	$("#footerIn").on("keydown",function(event){
		clearTimeout(typingTimer);
		if(limit&&event.keyCode!=8){
			return false;
		}
	});
	
	$("#footerIn").on("keyup",function(){
		var len = $("#footerIn").text().length;
		if(len<140){
			limit=false;
		}
		else{
			limit=true;	
		}
		console.log(len);
		
		document.getElementById("wordCount").innerHTML=len+"/140";
		
		clearTimeout(typingTimer);
    	typingTimer = setTimeout(doneTyping, doneTypingInterval);
	
	});
	
	function doneTyping(){
		document.getElementById("wordCount").innerHTML="SPEICHERN";	
	}
	
	$(".save").on("click",function(){
			slideCount++;
			document.getElementById("noteCount").innerHTML="NOTIZEN "+slideCount;
			var absatz;
			switch(currentSlide){
				case 1: absatz="MAPPE";
				break;
				case 2: absatz="KONTAKT";
				break;	
			}
			
			var now=new Date();
			var hour    = now.getHours();
    		var minute  = now.getMinutes();
			var n="";
			if(minute<9){n="0";}
			var textIn=document.getElementById("footerIn").innerHTML;  
			var target=$('<li class="level1">'+'<div class="header">'+'<div class="paragraph">'+absatz+'</div>'+'<div class="time">'+hour+":"+n+minute+" UHR"+'</div>'+'</div>'+'<div class="content">'+textIn+'</div>'+'</li>');  
			$('.bxslider3').append(target);
			target.animate({"opacity":"1"},500,"swing",function(){
				target.addClass("visible");
			});
  			slider3.reloadSlider();
			slider3.goToSlide(slideCount-1);	
			document.getElementById("footerIn").innerHTML="<p>NOTIZ VERFASSEN…</p>";	
			written=false;	
	});
	
	$("#footerIn").on("blur",function(){
		setTimeout(function() {
			var len = $("#footerIn").text().length;
			if(len==0){
				written=false;
			}
			if(!written){
				document.getElementById("footerIn").innerHTML="<p>NOTIZ VERFASSEN…</p>";
			}
			
			document.getElementById("wordCount").innerHTML="";
			$("#footerIn").removeClass("active");
			$(".save").removeClass("active");
		},500);
		$(".footerContainer").css({position:'fixed',bottom:'0px'});
	});
})