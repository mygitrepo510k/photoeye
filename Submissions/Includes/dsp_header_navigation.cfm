 

<style>
div#submenu {
	width: 100%;
	height: 63px;
}

div#submenu #submenuContent {
	width: 1233px;
	margin: 0 auto;
}

#submenuContent > ul {
/* 	margin-top: 13px; */
}

#submenuContent ul, #submenuContent > ul > li {
	list-style-type: none;
	float: left;
}

#submenuContent > ul > li {
	margin-right: 8px;
	height: 33px;
	position: relative;
}

#submenuContent ul ul, #submenuContent > ul > li:hover > a,
#submenuContent > ul > li.active > a, #submenuContent > ul > li > a:hover {
	display: block;
	float: left;
	height: 31px;
    line-height: 33px;
	background: #fbfbfb;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0, rgb(240,240,240)), color-stop(1, rgb(254,254,254)));
	background: -moz-linear-gradient(center top, rgb(240,240,240) 0%, rgb(254,254,254) 100%);
	border: 1px solid #babbbb;
	color: #262626;
	-moz-border-radius: 5px;
	border-radius: 5px;
	-webkit-border-radius: 5px;
	padding: 0 8px;
	-moz-box-shadow: inset 1px 1px 3px #d9d9d9;
	box-shadow: inset 1px 1px 3px #d9d9d9;
	-webkit-box-shadow: inset 1px 1px 3px #d9d9d9;
	text-decoration: none;
	text-shadow: 1px 1px 0px #fff;
}

#submenuContent ul ul {
    height: auto;
    line-height: 16px;
    opacity: 0.9;
    filter: alpha(opacity = 90);
}

#submenuContent ul ul li a:hover {
	background: #c6e5fc;
/*
	border-radius: 5px;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
*/
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0, rgb(146,191,230)), color-stop(1, rgb(209,237,252)));
	background: -moz-linear-gradient(center top, rgb(146,191,230) 0%, rgb(209,237,252) 100%);
	box-shadow: inset 1px 1px 3px #d9d9d9;
	-moz-box-shadow: inset 1px 1px 3px #d9d9d9;
	-webkit-box-shadow: inset 1px 1px 3px #d9d9d9;
}

/* 	background: #ffffcc;
/*
	border-radius: 5px;
	-moz-border-radius: 5px;
	-webkit-border-radius: 5px;
*/
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0, rgb(240,240,180)), color-stop(1, rgb(254,254,180)));
	background: -moz-linear-gradient(center top, rgb(240,240,180) 0%, rgb(254,254,180) 100%); 
	*/

#submenuContent > ul > li#articles_tab > a:hover,
#submenuContent li#articles_tab:hover > a {
	position: relative;
    border-bottom: 0px solid transparent;
    z-index: 101; /* above ul ul */
    border-radius: 5px 5px 0 0;
    -webkit-border-radius: 5px 5px 0 0;
    -moz-border-radius: 5px 5px 0 0;
}

#submenuContent > ul > li > a {
	display: block;
	float: left;
	height: 33px;
	line-height: 35px;
	font-size: 13px;
	font-family: Myriad Pro Black, Arial;
	font-weight: 800;
	color: #262626;
	padding: 0 9px;
	text-transform: uppercase;
	text-decoration: none;
	text-shadow: 1px 1px 0px #fff;
	outline: none;
}

#submenuContent > ul > li > a:active {
	margin-top: 1px;
}

/* hover menu */
#submenuContent ul ul {
  	display: none;
  	padding: 0;
  	width: 160px;
  	position: absolute;
  	z-index: 100;
  	top: 31px;
	-moz-border-radius-topleft: 0px;
	border-top-left-radius: 0px;
	-webkit-border-top-left-radius: 0px;
	background: #fbfbfb;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0, rgb(250,250,250)), color-stop(1, rgb(254,254,254)));
	background: -moz-linear-gradient(center top, rgb(250,250,250) 0%, rgb(254,254,254) 100%);
	-moz-box-shadow: inset 1px -3px 3px #d9d9d9;
	box-shadow: inset 1px -3px 3px #d9d9d9;
	-webkit-box-shadow: inset 1px -3px 3px #d9d9d9;
}

#submenuContent li:hover ul {
  	display: block;
} 

#submenuContent > ul > ul > li {
	float: none;
}

#submenuContent ul ul li a {
	display: block;
	float: none;
	font-size: 12px;
	font-family: Myriad Pro, Arial;
	font-weight: 600;
/* 	color: #262626; */
	padding: 7px 9px 7px 20px;
	text-transform: uppercase;
	text-decoration: none;
	text-shadow: 1px 1px 0px #fff;
	outline: none;
	border-bottom: 1px solid #e1e1e1;
	background: transparent url('../images/arrows.png') no-repeat 9px 11px;
}

#submenuContent ul ul li a:hover {
    color: #000;
    background-position: 9px -89px;
}

#submenuContent ul ul li:last-child a {
    border: none;	
}

 /*
span {
	border-right: 1px solid #aaa;
	display: block;
	float: left;
	padding: 0 16px;
    font-family: Arial;
    font-size: 14px;
    font-weight: bold;
}
*/

		
#submenuContent ul li photoeye_network  {
	width: 115px;
	border: 0px;
}

	
/* HERE IT IS! */
#submenuContent ul li#bookstore a {
	color: #3f526f;
	font-size: 12px;
}

/* menu contents */
#submenuContent ul li#bookstore ul li a {
	color: #3f526f;
	font-size: 12px;
}
		
#submenuContent ul li#gallery a, #submenuContent ul li#gallery ul li a    {
    color: #998756;
    font-size: 12px;
    }

/* menu contents */
#submenuContent ul li#gallery ul li a {
	color: #998756;
    font-size: 12px;
}

#submenuContent ul li#auctions a, #submenuContent ul li#auctions ul li a    {
    color: #9d4922;
    font-size: 12px;
    }

/* menu contents */
#submenuContent ul li#auctions ul li a {
	color: #9d4922;
    font-size: 12px;
}


#submenuContent ul li#magazine a, #submenuContent ul li#magazine ul li a    {
    color: #680000;
    font-size: 12px;
    }
    
/* menu contents */
#submenuContent ul li#magazine ul li a {
	color: #680000;
    font-size: 12px;
}


#submenuContent ul li#editions a, #submenuContent ul li#editions ul li a    {
    color: #680000;
   	font-size: 12px;
    }
    
    
/* menu contents */
#submenuContent ul li#editions ul li a {
	color: #680000;
    font-size: 12px;
}


#submenuContent ul li#guide a, #submenuContent ul li#guide ul li a    {
    color: #45643f;
    font-size: 12px;
    }
    
/* menu contents */
#submenuContent ul li#guide ul li a {
	color: #45643f;
    font-size: 12px;
}

#submenuContent ul li#visualserver a, #submenuContent ul li#visualserver ul li a    {
    color: #767cc6;
    font-size: 12px;
    }
    
/* menu contents */
#submenuContent ul li#visualserver ul li a {
	color: #767cc6;
    font-size: 12px;
}

#submenuContent ul li#newsletters a, #submenuContent ul li#newsletters ul li a    {
    color: #594178;
    font-size: 12px;
 
    }
    
/* menu contents */
#submenuContent ul li#newsletters ul li a {
	color: #594178;
    font-size: 12px;
 
}


    
#submenuContent ul   li blog   {
    color: #e35d00;
    }
    

    
#submenuContent ul  li visual a {
    color: Maroon;   
    }
    
#submenuContent ul   li  strong   {
    color: #333;
    }

#submenuContent ul   li  hover strong   {
    color:  #0066cc;
    }
    
#submenuContent ul li#photoeye_network ul li a {
	color: #594178;
    font-size: 12px;
	border: 0px;
		}
		
/*
#submenuContent ul li {
	border-right: 1px solid #333;
}

#submenuContent ul li li {
	border-right: none;
}
*/


</style>
<div id='header_navigator' style="margin-top:0px;">
<div id='submenu'>
<div id='submenuContent' style="width:990px;">
<ul>
<cfoutput>
<li id='photoeye_network'><a href="http://www.photoeye.com/" target="_blank" ><img src="/#application.root#/images/new-header-mockup.png" style="border:0;"></a> 

<ul>
<li><a href="http://www.photoeye.com">photoeye.com</a></li>
<li><a href="http://www.artphotoindex.com">ArtPhotoIndex.com</a></li>
<li><a href="http://www.visualserver.com">VisualServer.com</a></li>

<li><a href="http://www.photobistro.com">PhotoBistro.com</a></li>
</ul></cfoutput>
</li>

<li id='bookstore'><a href="http://www.photoeye.com/bookstore" target="_blank" >Bookstore</a> 
<ul>
<li><a href="http://www.photoeye.com">Home</a></li>
<li><a href="http://blog.photoeye.com/search/label/Books">Blog</a></li>
<li><a href="http://www.photoeye.com/bookstore/bestsellers.cfm">Bestsellers</a></li>
<li><a href="http://www.photoeye.com/bookstore/365_calendar.cfm">365 A Book A Day</a></li>
<li><a href="http://www.photoeye.com/bookstore/365_calendar.cfm">365 A Book A Day</a></li>
<li><a href="http://www.photoeye.com/magazine_admin/index.cfm/bestbooks.2010">2010 Best Books</a></li>

<li><a href="http://www.photoeye.com/bookstore/newarrivals.cfm">New Arrivals</a></li>
<li><a href="http://www.photoeye.com/bookstore/deepdiscounts.cfm">Deep Discounts</a></li>
<li><a href="http://www.photoeye.com/bookstore/signedbooks.cfm">Signed Books</a></li>
<li><a href="http://www.photoeye.com/bookstore/limitedEditions.cfm">Limited Editions</a></li>
<li><a href="http://www.photoeye.com/bookstore/videos.cfm">Videos</a></li>

</ul>
</li>
<li id='magazine'>
<a href="http://www.photoeye.com/magazine" target="_blank">Magazine</a>
<ul>
<li><a href="http://www.photoeye.com/magazine/">Home</a></li>
<li><a href="http://blog.photoeye.com/search/label/Books">Blog</a></li>
<li><a href="http://www.photoeye.com/magazine/articles">Articles</a></li>
<li><a href="http://www.photoeye.com/magazine/reviews">Archived Reviews</a></li>
<li><a href="http://www.photoeye.com/magazine_admin/index.cfm/bestbooks.2010">Best of 2010</a></li>
<li><a href="http://www.photoeye.com/magazine_admin/index.cfm/bestbooks.2009">Best of 2009</a></li>
<li><a href="http://www.photoeye.com/magazine/Bestof2008/2/">Best of 2008</a></li>
<li><a href="http://www.photoeye.com/magazine/archives">Archives</a></li>
</ul>
</li>
<li id='gallery'><a href="http://www.photoeye.com/gallery" target="_blank">Gallery</a> 
<ul>
<li><a href="http://www.photoeye.com/gallery">Home</a></li>
<li><a href="http://blog.photoeye.com/search/label/Gallery">Blog</a></li>
<li><a href="http://www.photoeye.com/gallery/representedartists/index.cfm">photo-eye Gallery - Santa Fe</a></li>
<li><a href="http://www.photoeye.com/gallery/photoshowcase/index.cfm">Photographer's Showcase(tm)</a></li>

<li><a href="http://www.photobistro.com">PhotoBistro</a></li>
<li><a href="http://www.photoeye.com/gallery/MagnumArtists/index.cfm">Magnum Photos</a></li>
<li><a href="http://fotofestbeijing.visualserver.com/">Fotofest Beijing</a></li>
</ul>
</li>

<li id='auctions'><a href="http://www.photoeye.com/auctions" target="_blank">Auctions</a>  
<ul>
<li><a href="http://www.photoeye.com/auctions">Current Auctions</a></li>
<li><a href="http://www.photoeye.com/auctions/AvailPostAuction.cfm?st=1">Still Available</a></li>
<li><a href="http://www.photoeye.com/auctions/AuctionFAQ.cfm">FAQs</a></li>
<li><a href="http://www.photoeye.com/auctions/AuctionInfo.cfm">Consign Material</a></li>

</ul>
</li>

<li id='editions'><a href="http://www.photoeye.com/editions" target="_blank">Editions</a> 
<ul>
<li><a href="http://www.photoeye.com/editions">Home</a></li>
<li><a href="http://www.photoeyeeditions.com/Index.cfm/artist.show/id/3">Carla van de Puttelaar</a></li>
<li><a href="http://www.photoeyeeditions.com/Index.cfm/artist.show/id/2">Hiroshi Watanabe</a></li>

<li><a href="http://www.photoeyeeditions.com/Index.cfm/artist.show/id/1">David Trautrimas</a></li>

</ul>
</li>



<!---<li id='guide'><a href="http://www.photoeye.com/guide" target="_blank">USA Guide</a> 
<ul>
<li><a href="http://www.photoeye.com/guide">Home</a></li>
<li><a href="http://www.photoeye.com/guide/index2.cfm?Sort=2&Page=5&State=All&Country=All">Galleries</a></li>
<li><a href="http://www.photoeye.com/guide/index2.cfm?Sort=2&Page=7&State=EntireCountry&Country=All">Museums</a></li>
<li><a href="http://www.photoeye.com/guide/index2.cfm?Sort=2&Page=2&State=EntireCountry&Country=All">Book Publishers</a></li>
<li><a href="http://www.photoeye.com/guide/index2.cfm?Sort=2&Page=1&State=EntireCountry&Country=All">Associations</a></li>
<li><a href="http://www.photoeye.com/guide/index2.cfm?Sort=2&Page=13&State=EntireCountry&Country=All">Festivals/Symposiums</a></li>
<li><a href="http://www.photoeye.com/guide/index2.cfm?Sort=2&Page=4&State=All&Country=All">Grants/Awards</a></li>
<li><a href="http://www.photoeye.com/guide/index2.cfm?Sort=2&Page=8&State=EntireCountry&Country=All">Periodicals</a></li>
<li><a href="http://www.photoeye.com/guide/index2.cfm?Sort=2&Page=9&State=EntireCountry&Country=All">Residencies</a></li>
<li><a href="http://www.photoeye.com/guide/index2.cfm?Sort=2&Page=6&State=EntireCountry&Country=All">Schools/Universities</a></li>
<li><a href="http://www.photoeye.com/guide/index2.cfm?Sort=2&Page=10&State=EntireCountry&Country=All">Workshops</a></li>
</ul>
</li>--->

<li id='VisualServer'><a href="http://www.visualserver.com" target="_blank">VisualServer</a>
<ul>
<li><a href="http://www.visualserver.com">Home</a></li>
<li><a href="http://www.visualserver.com/VS/Features.cfm">Features</a></li>
<li><a href="http://www.visualserver.com/VS/FAQs.cfm">FAQs</a></li>

<li><a href="http://www.visualserver.com/VS/Examples.cfm">Examples</a></li>
<li><a href="http://www.visualserver.com/VS/Prices.cfm">Prices</a></li>
<li><a href="http://www.visualserver.com/VS/Urchin.cfm">Stats</a></li>
<li><a href="http://www.visualserver.com/VS/Demos.cfm">Demos</a></li>
<li><a href="http://www.visualserver.com/VS/Marketing.cfm">Marketing</a></li>
<li><a href="http://www.visualserver.com/VS/Free_Trial.cfm">Free Trial</a></li>
<li><a href="http://www.visualserver.com/VS/Purchase.cfm">Purchase</a></li>
</ul>
</li>


<li id='Newsletters'><a href="http://www.photoeye.com/emailnewsletter" target="_blank">Newsletters</a> 
<ul>
<li><a href="http://www.photoeye.com/emailnewsletter">Signup</a></li>
<li><a href="http://www.photoeye.com/emailnewsletter">Archive</a></li>
</ul>
</li>

</ul>
</div>
</div>

</div>
</center>