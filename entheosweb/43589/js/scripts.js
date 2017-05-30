include("js/jquery.color.js");
include("js/jquery.easing.js");
include("js/jquery.mousewheel.js");
include("js/jquery.fancybox-1.3.4.pack.js");
include("js/uScroll.js");
include("js/googleMap.js");
include("js/superfish.js");
include("js/switcher.js");
include("js/jquery.cycle.all.min.js");
include("js/mouseMagnet.js");

function include(url) {
    document.write('<script src="' + url + '"></script>');
}
var MSIE = true, content;

function addAllListeners() {
	$('.slider>li>figure>a')
    .find('strong').css('top','200px').end()
    .hover(
        function(){
            if (!MSIE){
                $(this).children('.sitem_over').css({display:'block',opacity:'0'}).stop().animate({'opacity':1}).end() 
                .find('strong').css({'opacity':0}).stop().animate({'opacity':1,'top':'0'},350,'easeInOutExpo');
            } else { 
                $(this).children('.sitem_over').stop().show().end()
                .find('strong').stop().show().css({'top':'0'});
            }
        },
        function(){
            if (!MSIE){
                $(this).children('.sitem_over').stop().animate({'opacity':0},1000,'easeOutQuad',function(){$(this).children('.sitem_over').css({display:'none'})}).end()  
                .find('strong').stop().animate({'opacity':0,'top':'200px'},1000,'easeOutQuad');  
            } else {
                $(this).children('.sitem_over').stop().hide().end()
                .find('strong').stop().hide();
            }            
        }
    );
}

$(document).ready(ON_READY);
$(window).load(ON_LOAD);

function ON_READY() {
    /*SUPERFISH MENU*/   
    $('.menu #menu').superfish({
	   delay: 800,
	   animation: {
	       opacity: 'show'
	   },
       speed: 'slow',
       autoArrows: false,
       dropShadows: false
    });
}

function ON_LOAD(){
    MSIE = ($.browser.msie) && ($.browser.version <= 8);
    $('.spinner').fadeOut();
    
    if ($(".slider").length) {
        $('.slider').cycle({
            fx: 'fade',
            speed: 800,
    		timeout: 0,               
    		easing: 'easeInOutCubic',
    		cleartypeNoBg: true,
            rev:0,
            startingSlide: 0,
            wrap: true
  		})
    };
    var img = 0;
    $('.pagin>li>a').click(function (){
        $(this).parent().siblings().removeClass('active');
        $(this).parent().addClass('active');
        img = $(this).parent().index();
        $('.slider').cycle(img);
    })
    
	$('.slider>li>figure>a').attr('rel','appendix')
    .prepend('<span class="sitem_over"><strong></strong></span>')
    $('.slider>li>figure>a').fancybox({
        'transitionIn': 'elastic',
    	'speedIn': 500,
    	'speedOut': 300,
        'centerOnScroll': true,
        'overlayColor': '#000'
    });
        
    $('.scroll')
	.uScroll({			
		mousewheel:true,
        step: 100,
        lay:'outside'
	});
    
     var coords = [  {x : 0, y : 0},
                    {x : 185, y : 164},
                    {x : -70, y : 281},
                    {x : -172, y : 163},
                    {x : -201, y : -52},
                    {x : -142, y : -172},
                    {x : -93, y : -294},
                    {x : 168, y : -251},
                    {x : 185, y : -50},
                    {x : 268, y : 24},
                    {x : 268, y : 24},
    ];
    
    //content switch
    content = $('#content');
    content.tabs({
        show:0,
        preFu:function(_){
            _.li.css({'display':'none'});		
        },
        actFu:function(_){            
            if(_.curr){
                var _class =_.curr.attr('class');
                if (_class) {
                    _class = parseInt(_class[_class.length-1]);
                }
                if (!$.isNumeric(_class)) {
                    if (_.n >= 0){
                        _class = _.n;
                    }
                }
                content.stop(true).delay(500).animate({'left': coords[_class].x, 'top': coords[_class].y},500,'easeOutCubic')
                
                if (!MSIE){
                    _.curr.css({'opacity':'0','display':'block'}).stop(true).show().animate({'opacity':'1'},{duration:1000,easing:'easeOutCubic'});
                } else {
                    _.curr.css({'opacity':'0','display':'block'}).show().css({'opacity':'1'});
                }
            }
    		if(_.prev){
  		        if (!MSIE){
      		        _.prev.show().stop(true).animate({'opacity':'0'},{duration:500,easing:'easeInOutCubic',complete:function(){
                                if (_.prev){ _.prev.css({'display':'none'});}
                            }
    		              });
                } else {
                    _.prev.show().stop(true).css({'opacity':'0','display':'none'});
                }
            }           
  		}
    });
    var defColor = $('#menu>li>a').eq(0).css('color'); 
    var nav = $('.menu');
    nav.navs({
		useHash:true,
        defHash: '#!/page_home',
        hoverIn:function(li){
            if (!MSIE) {
                $('>span', li).stop().animate({opacity:1},500,'easeOutCubic');
                $('>strong',li).stop().animate({opacity:1},500,'easeOutCubic');
            } else {
                $('>span', li).stop().css({background:'#2c2c2c'});
                $('>strong',li).stop().css({display:'block'});
            }
        },
        hoverOut:function(li){
            if ((!li.hasClass('with_ul')) || (!li.hasClass('sfHover'))) {
                 if (!MSIE) {
                     $('>span', li).stop().animate({opacity:0},700,'easeOutCubic');
                     $('>strong',li).stop().animate({opacity:0},700,'easeOutCubic');
                } else {
                    $('>span', li).stop().css({background:'transparent'});
                    $('>strong',li).stop().css({display:'none'});
                }
            }
        }
    })
    .navs(function(n,_){
   	    $('#content').tabs(n);
        if (_.prevHash == '#!/page_mail') { 
            $('#form1 a').each(function (ind, el){
                if ($(this).attr('data-type') == 'reset') { $(this).trigger('click') }   
            })
        }
   	});
    
    setTimeout(function(){
        $('body').css({'overflow':'visible'});
    },300);    
    addAllListeners();
}