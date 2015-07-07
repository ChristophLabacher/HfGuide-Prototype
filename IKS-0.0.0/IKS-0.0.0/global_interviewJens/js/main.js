$(document).ready(function(){
	var scrolling=true;
	var originX;
	slider1 = $('.bxslider1').bxSlider({touchEnabled:false,controls:false,pager:false,infiniteLoop: false});
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
					$("#indicatorActive").animate({width:"33%"});
				}	
				if(index==2){
					currentSlide=2;
					$("#indicatorActive").animate({width:"66%"});
				}
				if(index==3){
					currentSlide=3;
					$("#indicatorActive").animate({width:"105%"});
				}
		 }	
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
				case 1: absatz="INTERVIEW";
				break;
				case 2: absatz="INTERVIEW";
				break;	
				case 3: absatz="INTERVIEW";
				break;
				case 4: absatz="INTERVIEW";
				break;	
				case 5: absatz="INTERVIEW";
				break;
				case 6: absatz="KONTAKT";
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