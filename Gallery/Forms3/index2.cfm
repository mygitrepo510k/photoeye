
    
    
        <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml">
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>photo-eye Gallery</title>
    
   <script language="javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script> 
    

    
    <script type="text/javascript">
    function winResized() {
    var $image=$('#image');
    if ($image.size()) {
    var ww=$(window).width();
    var wh=$(window).height();
    var iw=$image.width();
    var ih=$image.height();
    <!---var f=Math.max(ww/iw,wh/ih);--->
    var f=Math.min(ww/iw,wh/ih);
    var iwr=Math.round(iw*f);
    var ihr=Math.round(ih*f);
    $image.css({
    'position':'fixed',
    'width': iwr,
    'height': ihr,
    'left': (Math.round(ww-iwr)/2)+'px',
    'top': (Math.round(wh-ihr)/2)+'px'
    });
    }
    }
    $(window).load(function() {
    winResized();
    }).bind('resize',function() {
    winResized();
    });
    </script>
    
        <script type="text/javascript">
    var minMarginTopBottom=60;
    var minMarginLeftRight=100;
    var $image=null;
    var image_width=1;
    var image_height=1;
    function winResized() {
    if ($image) {
    var ww=$(window).width()-2*minMarginLeftRight;
    var wh=$(window).height()-2*minMarginTopBottom;	
    var f=Math.min(ww/image_width,wh/image_height);
    var iwr=Math.round(image_width*f);
    var ihr=Math.round(image_height*f);
    $image.css({
    'position':'fixed',
    'width': iwr,
    'height': ihr,
    'left': (minMarginLeftRight+(Math.round(ww-iwr)/2))+'px',
    'top': (minMarginTopBottom+(Math.round(wh-ihr)/2))+'px'
    });
    }
    }
    $(window).load(function() {
    $image=$('#image');
    image_width=$image.width();
    image_height=$image.height();
    winResized();
    $(window).bind('resize',function() {
    winResized();
    });
    });
    </script>
    
    <style type="text/css">
    body {
    padding:0;
    margin:0;
    }
    
    .menu {
    margin-left:70px;
    color: maroon;
    font-family: "Helvetica Neue";
    }
    
     .menu-items {
    margin-left:30px;
    color: #999;
    font-family: "Helvetica Neue";
    font-size:14px;
    
    }
    
    </style>
    
    </head>

    <body>
    <br>
    <div align="left">
    <div class="menu"> photo-eye Gallery <span class="menu-items"> Exhibitions </span> <span class="menu-items">Represented Artists </span>  <span class="menu-items">Photographer's Showcase </span> <span class="menu-items"> Schedule </span> <span class="menu-items"> Location </span> <span class="menu-items"> Contact </span></div>
    <img id="image" src="ranger.jpg" alt="test" style="position:absolute;left:-50000px;top:-50000px;" />
   </div>
       <div class="menu" style="clear:both;"> photo-eye Gallery <span class="menu-items"> Exhibitions </span> <span class="menu-items">Represented Artists </span>  <span class="menu-items">Photographer's Showcase </span> <span class="menu-items"> Schedule </span> <span class="menu-items"> Location </span> <span class="menu-items"> Contact </span></div>
   
    </body>
    </html>