<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<title>photo-eye | Auctions</title>
<link href="images/favicon.ico" rel="shortcut icon"/>

<script type="text/javascript" src="/global/includes/prototype.js"></script>
<script type="text/javascript">

function PELogoHover(logotoggle) {
	logovar = document.getElementById("PElogo");
	if (logotoggle == "on") {
		logovar.src = "../global/images/PElogosmall2.jpg";
	}
	else {
		logovar.src = "../global/images/PElogosmall.jpg";
	}
}
<!--
  if(window.attachEvent)
    window.attachEvent("onload",setListeners);

  function setListeners(){
    inputList = document.getElementsByTagName("INPUT");
    for(i=0;i<inputList.length;i++){
      inputList[i].attachEvent("onpropertychange",restoreStyles);
      inputList[i].style.backgroundColor = "";
    }
    selectList = document.getElementsByTagName("SELECT");
    for(i=0;i<selectList.length;i++){
      selectList[i].attachEvent("onpropertychange",restoreStyles);
      selectList[i].style.backgroundColor = "";
    }
  }

  function restoreStyles(){
    if(event.srcElement.style.backgroundColor != "")
      event.srcElement.style.backgroundColor = "";
  }//-->

</script>
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-15150870-4']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
<link href="../global/css/global.css" rel="stylesheet" type="text/css" />
<link href="css/auctions.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="/global/js/revealer.js?2262010"></script>
</head>

<body id="AuctionsBody">
<!--[if IE]>  
<div id="IEroot">
<![endif]-->
<div class="ContainAll">



<div style="position:absolute;top:-5000px;visibility:hidden;">
	<img src="/global/images/top_logo_account.gif" />
	<img src="/global/images/top_logo_auctions.gif" />
	<img src="/global/images/top_logo_bookstore.gif" />
	<img src="/global/images/top_logo_gallery.gif" />
	<img src="/global/images/top_logo_guide.gif" />
	<img src="/global/images/top_logo_magazine.gif" />
	<img src="/global/images/top_logo_newsletters.gif" />
	<img src="/global/images/top_logo_visualserver.gif" />
</div>

<script type="text/javascript">
function top_logo_swap(onoff, division){
	if(onoff === 1){
		var fullsrc = "/global/images/top_logo_"+(division+".gif");
		top_logo.src = fullsrc;
	}
	if(onoff === 0){
		top_logo.src = currentdivision;
	}
}
</script>


<div class="MenuHead">
		<!--<div class="Head1">
           <div style="height:11px;"></div>
			<span class="MenuItem1">Your Account</span><span class="MenuItem1"> View Order (8)</span><span class="MenuItem1">Wish List</span>
		</div>-->
        <div class="Head2">
            <div class="MenuHolder" id="MHlogo"><a href="/Index.cfm"><span onmouseover="PELogoHover('on')" onmouseout="PELogoHover('off')" class="PhotoEye"><img src="/global/images/PElogosmall.jpg" id="PElogo"/></span></a></div><div class="MenuHolder" id="MH2"><span class="MenuItem2" style="position:relative;top:6px;background:none;"><a href="/Index.cfm"><img id="top_logo" width="20" height="20" src="/global/images/top_logo_
			
			
					auctions
				.gif" /></a></span><span class="MenuItem2" id="API" onmouseover="top_logo_swap(1,'bookstore')" onmouseout="top_logo_swap(0,0)"><a href="http://www.artphotoindex.com" target="_blank">Art Photo Index</a> </span><span class="MenuItem2" id="Books" onmouseover="top_logo_swap(1,'bookstore')" onmouseout="top_logo_swap(0,0)"><a href="/bookstore/">Bookstore</a> </span><span class="MenuItem2" id="Gallery" onmouseover="top_logo_swap(1,'gallery')" onmouseout="top_logo_swap(0,0)"><a href="/gallery/">Gallery</a> </span><span class="MenuItem2" id="Auctions" onmouseover="top_logo_swap(1,'auctions')" onmouseout="top_logo_swap(0,0)"><a href="/auctions/">Auctions</a> </span><span class="MenuItem2" id="Mag" onmouseover="top_logo_swap(1,'magazine')" onmouseout="top_logo_swap(0,0)"><a href="http://blog.photoeye.com">Blog</a> </span><span class="MenuItem2" id="Editions" onmouseover="top_logo_swap(1,'magazine')" onmouseout="top_logo_swap(0,0)"><a href="/editions/">Editions</a> </span><span class="MenuItem2" id="VisualServer" onmouseover="top_logo_swap(1,'visualserver')" onmouseout="top_logo_swap(0,0)" style="background:none;"><a href="/visualserver/">VisualServer</a></span></div>

 



<script type="text/javascript">

var top_logo = document.getElementById('top_logo');
var currentdivision = top_logo.src;

</script>

	<div class="MenuHolder" id="MH4"><span class="MenuItem2" id="Name" style="background:none;">
	&nbsp;</span>	 
		



	 	
	<span class="MenuItem2" id="Order"><a href="/templates/ViewOrder.cfm">View Order</a></span><span class="MenuItem2" id="Order"><a href="/templates/Wishlist.cfm">Wish List</a></span><span class="MenuItem2" id="Account" style="background:none;"><a href="/account/index.cfm?xAcct=1">Your Account</a></span></div>
        </div>	


</div>

<div class="DivisionMenu">
   	  <div class="DivisionMenuTop">
		<div class="DivisionMenuLeft"><div class="FL1"><a href="index.cfm"><img src="Images/logotransAUCTIONS.gif" /></a></div>
       	</div>
        	<div class="DivisionMenuRight"><div class="FL2" id="NoBorderLeft"><a href="index.cfm">LIVE AUCTIONS</a></div><div class="FL5"><img src="../global/images/menudot.gif" /></div><div class="FL2" id="NoBorderLeft"><a href="index.cfm?view=pastauctions">PAST AUCTIONS</a></div><div class="FL5"><img src="../global/images/menudot.gif" /></div><div class="FL2" id="NoBorderLeft"><a href="auctioninfo.cfm">CONSIGN</a></div><div class="FL5"><img src="../global/images/menudot.gif" /></div>
<div class="FL2"><a href="auctionFAQ.cfm">F.A.Q</a></div>
	
			
			
       	</div>
    </div>
</div>


<div class="MainArea">
    <div class="MASearch">
    <div class="BScontain"><div class="BSsearch">
	
	<div style="float: left; margin-left: 25px; margin-top: 3px; color: ##fafafa; text-transform: uppercase; font-size: 11px; letter-spacing: 1px;display:inline;"><a style="color:#fafafa;" href="inquiries.cfm">inquiries</a><span style="margin-left:5px;margin-right:5px;"><img src="/global/images/rssdot.gif" width="11"/></span><a style="color:#fafafa;" href="comments.cfm">comments</a><span style="margin-left:5px;margin-right:5px;"><img src="/global/images/rssdot.gif" width="11"/></span><a style="color:#fafafa;" href="/emailnewsletter/">newsletter</a></div>

<form name="searchFrm" method="post" action="AuctionSearchResults.cfm">
	
        	  <div class="BSsearchTop"><div class="BSsearchInput" ><input name="SearchInput" type="text" class="input_text" id="BSInput" style="FONT-FAMILY: Arial, Helvetica, sans-serif;FONT-SIZE: 13px" onFocus="if(this.value=='Search Auctions...')this.value='';" value="Search Auctions..." size="55" MAXLENGTH="150"></div>
				<div class="BSsearchSelect"><!--<select name="SearchField"  style="FONT-FAMILY: Arial, Helvetica, sans-serif;FONT-SIZE: 10px">
                <option value="Abstract">Keyword</option>

               <option value="Title">Title</option>
				  
                <option value="Authors">Author</option>
 
                <option value="Publisher">Publisher</option>
							
				<option value="Abstract">ISBN#</option>
				

				</select>--></div>
                <div class="BSsearchSelect"><!--<select name="SearchField"  style="FONT-FAMILY: Arial, Helvetica, sans-serif;FONT-SIZE: 10px">
                <option value="PEdatabase">In photo-eye's database</option>
                
				<option value="AZdatabase">In Amazon's database</option>
				

				</select>--></div>
                <div class="BSsearchButton"><input name="btnSearch" type="image" style="font-family:'Trebuchet MS', Arial, Helvetica, sans-serif;font-size:13px;width:auto;height:auto;" value="Search" src="../global/images/submit.gif" /></div></div></div></div></div>

</form>

                  

<div class="MALeft">
      	<!--<div class="Title">-->  




<table width="850" align="center" cellpadding="0" cellspacing="0">
<tr height="10"><td></td></tr>
<tr>
	<td align="center">
	<font color="#333" face="Verdana, Arial, Helvetica, sans-serif" size="2">

	
	
		<br><font face="Verdana, Arial, Helvetica, sans-serif" size="3" color="#333"><b>Welcome to photo-eye Auctions!</b><br /><br></font>
	<div align="left">
	
								 						
							
									</div> 
							 
	<br>
	
		
		<div align="left">


	<div align="center"><iframe style="border:none" src="http://files.photosnack.com/iframejs/embed.html?hash=pdkm2pck&t=1406379066" width="720" height="480" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true" ></iframe></div>  


	
	


<span style="font-size:14px; line-height:20px; color:#666">  





<br>


<br />
Alexey Brodovitch's legendary 1945 book <i>Ballet</i>, of which it is thought only a few hundred were printed, is among the most radical, futuristic and 'disruptive' photobooks of the twentieth century. Brodovitch "spat in the face of technique and pointed out a new way in which photographers could work," wrote Kerry William Purcell in a 2002 monograph. Also on the block this week, a gorgeous copy of Ken Domon's seminal 1958 account of the aftermath of the Hiroshima atomic bomb blast (with a stellar example of the Joan Miro designed jacket). 
<br /><br />
Also on the block: <br />
ÀÁÂÃÄÅÆÇÈÉÊËÌçèéêëìíîïðñòóôõö÷øùúûüý 
Pekka Turunen: <i>Against the Wall: LypÃ¶, Tilkkanen, MÃ¶rsky and I</i><br />
Post-Provoke style meets youthful rebellion in Mikio Tobara's <i>Document Miseinen [Document Teenagers]</i><br />
Chris Killip: <i>Here Comes Everybody (limited edition with print, inscribed)</i><br />
Peter Hujar: <i>Portaits in Life and Death</i> (hardbound)<br />



<br>  
Thanks so much for looking!
<br><br>
All books shown in the Post-Auction Sale Inventory are available at the low opening bid prices shown! 
<br /><br />
For expert advise on building your collection, 'de-acquisitioning' an existing one, or just finding fresh inspiration to jump start the look of your next project, contact Eric Miles, <a href="mailto:eric@photoeye.com">eric@photoeye.com</a>, Director of Rare Books & Online Auctions <br /><br />




 
Read our <a href="http://www.photoeye.com/auctions/auctionFAQ.cfm">F.A.Q.s</a>.  </font><br><!-- AddThis Button BEGIN -->
 
	<br><div class="addthis_toolbox addthis_default_style" 
	 addthis:url="http://vimeo.com/96972013" >
	<a class="addthis_button_preferred_1"></a>
	<a class="addthis_button_preferred_2"></a>
	<a class="addthis_button_preferred_3"></a>
	<a class="addthis_button_preferred_4"></a>
	<a class="addthis_button_compact"></a>
	<a class="addthis_counter addthis_bubble_style"></a>
	</div><script type="text/javascript" src="http://s7.addthis.com/js/300/addthis_widget.js#pubid=ra-4eedfea006dcdc6b"></script></p> 

</div>

	


</td></tr>
	 
	</font>
	</td>
</tr>


</table>
  


	
	<table width = "800" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr bordercolor="White">
	<td align="left"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="Black"> </td>
 
	</tr>
</table>
	<br>
	
		<table width = "850" cellspacing="0" cellpadding="5" align="center" border="1">
	<tr bordercolor="White" height="10" bgcolor="#ffffff"><td colspan="1" align="left"  style="vertical-align:middle;"><span style="padding-top:0px;">
		<span style="align:left"><b><a href="mailto:info@photoeye.com?Subject=Consignments">Consign to photo-eye Auctions</a></b></span><br>
		photo-eye Auctions provides expert photobook search service, appraisal of libraries and photo collections and consulting for all of your library and photography collecting needs. 
</font></span></td></tr></table>
		<br>

	<table width = "850" cellspacing="0" cellpadding="5" align="center" border="1">
	<tr bordercolor="White" height="10" bgcolor="#ffffff"><td colspan="1" align="center"  style="vertical-align:middle;"><span style="padding-top:0px;">
		<b><a href="login.cfm?Auction=1&nobid=1">Login or Register</a></b> to bid | <b><a href="AuctionInfo.cfm">Consign</a></b> auction items
</font></span></td></tr></table>
		<br>
<table width = "850" cellspacing="0" cellpadding="5" align="center" border="1">	 
	<tr bordercolor="White" bgcolor="#dddddd">
		
		<td align="center"><font color="maroon" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Items Open for Bids</b></font>&nbsp;&nbsp;&nbsp;</td>
		<td colspan="1" width="150" style="vertical-align:top"><span style="vertical-align:top"><input name="" type="button" class="input_button"  style="margin-bottom:10px;" id="Auctions_Input" onclick="javascript:window.location.href='index.cfm'" value="Refresh Bids / Clock" /></span></td>
		<td align="center" width="155"><font color="maroon" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Starting or<br>High Bid</b></font></td>
		<td align="center" width="25"><font color="maroon" face="Verdana, Arial, Helvetica, sans-serif" size="2"><b>Bids</b></font></td>
	</tr>
	</table>
	
	
	
		<table width="850" border="0" cellspacing="0" cellpadding="5" align="center">
			
		
			&nbsp;
			<tr bgcolor="#eeeeee">
		
		<td align="left" width="600" valign="top" style="padding-top:20px; padding-bottom:20px;">
		
				
            
				<a href="citation.cfm?id=8427">
				<img src="/auctions/img/8427/large_H300xW300.jpg" width="300~" height="115" alt="Go to this Auction" style="float:right; margin:5px 15px 0 5px;border:1px solid #999;" ></a>
			
			
			
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			<b><a href="Citation.cfm?id=8427">Alexey Brodovitch: Ballet (1945 1st Edition!)</a></b><br><br>
				"One of the most cinematic and dynamic photobooks ever published.... Ballet, published in 1945 by J.J. Augustin in New York, has become a photobook legend for two reasons. Firstly, only a few hundred  . . . <div style="margin-top:5px;"><a href="Citation.cfm?id=8427"><font color="blue" size="2" >[bid or read more]</font></a> <br><br><!-- AddThis Button BEGIN -->
<div class="addthis_toolbox addthis_default_style " 
	addthis:url="http://www.photoeye.com/auctions/citation.cfm?id=8427" 
	addthis:title="Alexey Brodovitch: Ballet (1945 1st Edition!)">
<a class="addthis_button_preferred_1"></a>
<a class="addthis_button_preferred_2"></a>
<a class="addthis_button_preferred_3"></a>
<a class="addthis_button_preferred_4"></a>
<a class="addthis_button_compact"></a>
<a class="addthis_counter addthis_bubble_style"></a>
</div><script type="text/javascript" src="http://s7.addthis.com/js/300/addthis_widget.js#pubid=ra-4eedfea006dcdc6b"></script>
</div>

			

			
			
		</td>
		

	
		
		<td align="right" width="100" valign="top" style="padding-top:20px; padding-bottom:20px;">
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			
					<span style="margin-right:10px;"><font color="green" face="Verdana, Arial, Helvetica, sans-serif" size="3"><b>$5495</b></font></span>	
				
			</font>
			
			
				<table cellpadding="3" cellspacing="3" border="0" align="center">
				<tr>
				
					<td align="right" width="30">
						<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
						5d
						
						</font>
					</td>
					<td align="right">
						<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
						1h
						
						</font>
					</td>
					<td align="right">
						<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">	
						41m
						
						
						</font>
					</td>
				
				</tr>
				<tr><td colspan="3" align="right"><a href="Citation.cfm?id=8427"><font color="blue" size="2">[bid]</font></a> 
</td></tr>
				</table>
				
			
			
								<table cellpadding="3" cellspacing="3" border="0" align="right">
					<tr>
												
						<td align="center">
							<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
							
									<a href="/bookstore/mShowDetailsbycat.cfm?Catalog=PI146"><img src="/img/P/PI/PI146/PI146_H50xW50.jpg" width="42" height="50" alt="The Photo Book" border="1" style="border-color: Silver; border-width: 1px; border-style: solid;"></a>
									
																							
									<a href="/bookstore/mShowDetailsbycat.cfm?Catalog=PK676"><img src="/img/P/PK/PK676/PK676_H50xW50.jpg" width="42" height="50" alt="The Book of 101 Books" border="1" style="border-color: Silver; border-width: 1px; border-style: solid;"></a>
								
									<a href="/bookstore/mShowDetailsbycat.cfm?Catalog=zc553"><img src="/img/Z/ZC/ZC553/ZC553_H50xW50.jpg" width="42" height="50" alt="The Open Book" border="1" style="border-color: Silver; border-width: 1px; border-style: solid;"></a>							
								
							</font>
						</td>
					</tr>
					</table>
		</td>	


		<td align="center" width="45" valign="top"  style="padding-top:20px; padding-bottom:20px;">
			<font color="GREEN" face="Verdana, Arial, Helvetica, sans-serif" size="3"><B>
			
			</B></font>
		</td>

		
			
			
			
				
		</tr>
		</table>
	
		
	
		<table width="850" border="0" cellspacing="0" cellpadding="5" align="center">
			
		
		&nbsp;
			<tr bgcolor="#F4F1E1">
		
			<td align="left" valign="top" style="padding-top:20px; padding-bottom:20px;" width="600" colspan="2">
		

            
            
            
				<a href="citation.cfm?id=8438">
				<img src="/auctions/img/8438/large_H300xW300.jpg" width="216~" height="300" alt="Go to this Auction"  style=" float:left;margin:5px 15px 0 15px;border:1px solid #999" /></a>
			
			
			
		
		
		
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			<b><a href="Citation.cfm?id=8438">Pekka Turunen: Against the Wall: Lypö, Tilkkanen, Mörsky and I </a></b><br><br>
			Cited in <a href=http://tinyurl.com/oeks38h>Parr/Badger, The History of the Photobook, vol. II</a>. "Finnish society became urbanised more rapidly than almost any other in Europe. Just fifty years ago  . . . <div style="margin-top:5px;"><a href="Citation.cfm?id=8438"><font color="blue" size="2" >[bid or read more]</font></a> <br><br><!-- AddThis Button BEGIN -->
<div class="addthis_toolbox addthis_default_style " 
	addthis:url="http://www.photoeye.com/auctions/citation.cfm?id=8438" 
	addthis:title="Pekka Turunen: Against the Wall: Lypö, Tilkkanen, Mörsky and I ">
<a class="addthis_button_preferred_1"></a>
<a class="addthis_button_preferred_2"></a>
<a class="addthis_button_preferred_3"></a>
<a class="addthis_button_preferred_4"></a>
<a class="addthis_button_compact"></a>
<a class="addthis_counter addthis_bubble_style"></a>
</div><script type="text/javascript" src="http://s7.addthis.com/js/300/addthis_widget.js#pubid=ra-4eedfea006dcdc6b"></script>
</div>

			
		</td>
		
		
		
		<td align="right" width="100" valign="top" style="padding-top:20px; padding-bottom:20px;">
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			
					<span style="margin-right:10px;"><font color="green" face="Verdana, Arial, Helvetica, sans-serif" size="3"><b>$1245</b></font></span>	
				
			</font>
			
			
				<table cellpadding="3" cellspacing="3" border="0" align="center">
				<tr>
				
					<td align="right" width="30">
						<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
						5d
						
						</font>
					</td>
					<td align="right">
						<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
						1h
						
						</font>
					</td>
					<td align="right">
						<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">	
						51m
						
						
						</font>
					</td>
				
				</tr>
				<tr><td colspan="3" align="right"><a href="Citation.cfm?id=8438"><font color="blue" size="2">[bid]</font></a> 
</td></tr>
				</table>
				
			
			
								<table cellpadding="3" cellspacing="3" border="0" align="right">
					<tr>
												
						<td align="center">
							<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
							
									<a href="/bookstore/mShowDetailsbycat.cfm?Catalog=PI146"><img src="/img/P/PI/PI146/PI146_H50xW50.jpg" width="42" height="50" alt="The Photo Book" border="1" style="border-color: Silver; border-width: 1px; border-style: solid;"></a>
									
							</font>
						</td>
					</tr>
					</table>
		</td>	


		<td align="center" width="45" valign="top"  style="padding-top:20px; padding-bottom:20px;">
			<font color="GREEN" face="Verdana, Arial, Helvetica, sans-serif" size="3"><B>
			
			</B></font>
		</td>

		
			
			
			
				
		</tr>
		</table>
	
		
	
		<table width="850" border="0" cellspacing="0" cellpadding="5" align="center">
			
		
			&nbsp;
			<tr bgcolor="#eeeeee">
		
		<td align="left" width="600" valign="top" style="padding-top:20px; padding-bottom:20px;">
		
				
            
				<a href="citation.cfm?id=8434">
				<img src="/auctions/img/8434/large_H300xW300.jpg" width="219~" height="300" alt="Go to this Auction" style="float:right; margin:5px 15px 0 5px;border:1px solid #999;" ></a>
			
			
			
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			<b><a href="Citation.cfm?id=8434"> 	Ken Domon: Hiroshima (1958, First Edition)</a></b><br><br>
				Along with Kikuji Kawada's Chizu [The Map], (1965), Shomei Tomatsu's Nagasaki 11:02 (1966) and Domon's 1961 collaboration with Tomatsu, Hiroshima-Nagasaki Document, this book remains one of the most i . . . <div style="margin-top:5px;"><a href="Citation.cfm?id=8434"><font color="blue" size="2" >[bid or read more]</font></a> <br><br><!-- AddThis Button BEGIN -->
<div class="addthis_toolbox addthis_default_style " 
	addthis:url="http://www.photoeye.com/auctions/citation.cfm?id=8434" 
	addthis:title=" 	Ken Domon: Hiroshima (1958, First Edition)">
<a class="addthis_button_preferred_1"></a>
<a class="addthis_button_preferred_2"></a>
<a class="addthis_button_preferred_3"></a>
<a class="addthis_button_preferred_4"></a>
<a class="addthis_button_compact"></a>
<a class="addthis_counter addthis_bubble_style"></a>
</div><script type="text/javascript" src="http://s7.addthis.com/js/300/addthis_widget.js#pubid=ra-4eedfea006dcdc6b"></script>
</div>

			

			
			
		</td>
		

	
		
		<td align="right" width="100" valign="top" style="padding-top:20px; padding-bottom:20px;">
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			
					<span style="margin-right:10px;"><font color="green" face="Verdana, Arial, Helvetica, sans-serif" size="3"><b>$1295</b></font></span>	
				
			</font>
			
			
				<table cellpadding="3" cellspacing="3" border="0" align="center">
				<tr>
				
					<td align="right" width="30">
						<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
						5d
						
						</font>
					</td>
					<td align="right">
						<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
						1h
						
						</font>
					</td>
					<td align="right">
						<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">	
						56m
						
						
						</font>
					</td>
				
				</tr>
				<tr><td colspan="3" align="right"><a href="Citation.cfm?id=8434"><font color="blue" size="2">[bid]</font></a> 
</td></tr>
				</table>
				
			
			
								<table cellpadding="3" cellspacing="3" border="0" align="right">
					<tr>
												
						<td align="center">
							<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
							
							</font>
						</td>
					</tr>
					</table>
		</td>	


		<td align="center" width="45" valign="top"  style="padding-top:20px; padding-bottom:20px;">
			<font color="GREEN" face="Verdana, Arial, Helvetica, sans-serif" size="3"><B>
			
			</B></font>
		</td>

		
			
			
			
				
		</tr>
		</table>
	
		
	
		<table width="850" border="0" cellspacing="0" cellpadding="5" align="center">
			
		
		&nbsp;
			<tr bgcolor="#F4F1E1">
		
			<td align="left" valign="top" style="padding-top:20px; padding-bottom:20px;" width="600" colspan="2">
		

            
            
            
				<a href="citation.cfm?id=8432">
				<img src="/auctions/img/8432/large_H300xW300.jpg" width="244~" height="300" alt="Go to this Auction"  style=" float:left;margin:5px 15px 0 15px;border:1px solid #999" /></a>
			
			
			
		
		
		
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			<b><a href="Citation.cfm?id=8432">Mikio Tobara: Document Miseinen [Document Teenagers]     </a></b><br><br>
			A classic document of youthful rebellion that should be included alongside iconic photobooks by Larry Clark (Teenage Lust & Tulsa); Jim Goldberg (Raised by Wolves) and, more recently, Corinne Day (Dia  . . . <div style="margin-top:5px;"><a href="Citation.cfm?id=8432"><font color="blue" size="2" >[bid or read more]</font></a> <br><br><!-- AddThis Button BEGIN -->
<div class="addthis_toolbox addthis_default_style " 
	addthis:url="http://www.photoeye.com/auctions/citation.cfm?id=8432" 
	addthis:title="Mikio Tobara: Document Miseinen [Document Teenagers]     ">
<a class="addthis_button_preferred_1"></a>
<a class="addthis_button_preferred_2"></a>
<a class="addthis_button_preferred_3"></a>
<a class="addthis_button_preferred_4"></a>
<a class="addthis_button_compact"></a>
<a class="addthis_counter addthis_bubble_style"></a>
</div><script type="text/javascript" src="http://s7.addthis.com/js/300/addthis_widget.js#pubid=ra-4eedfea006dcdc6b"></script>
</div>

			
		</td>
		
		
		
		<td align="right" width="100" valign="top" style="padding-top:20px; padding-bottom:20px;">
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			
					<span style="margin-right:10px;"><font color="green" face="Verdana, Arial, Helvetica, sans-serif" size="3"><b>$675</b></font></span>	
				
			</font>
			
			
				<table cellpadding="3" cellspacing="3" border="0" align="center">
				<tr>
				
					<td align="right" width="30">
						<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
						5d
						
						</font>
					</td>
					<td align="right">
						<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
						2h
						
						</font>
					</td>
					<td align="right">
						<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">	
						1m
						
						
						</font>
					</td>
				
				</tr>
				<tr><td colspan="3" align="right"><a href="Citation.cfm?id=8432"><font color="blue" size="2">[bid]</font></a> 
</td></tr>
				</table>
				
			
			
								<table cellpadding="3" cellspacing="3" border="0" align="right">
					<tr>
												
						<td align="center">
							<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
							
							</font>
						</td>
					</tr>
					</table>
		</td>	


		<td align="center" width="45" valign="top"  style="padding-top:20px; padding-bottom:20px;">
			<font color="GREEN" face="Verdana, Arial, Helvetica, sans-serif" size="3"><B>
			
			</B></font>
		</td>

		
			
			
			
				
		</tr>
		</table>
	
		
	
		<table width="850" border="0" cellspacing="0" cellpadding="5" align="center">
			
		
			&nbsp;
			<tr bgcolor="#eeeeee">
		
		<td align="left" width="600" valign="top" style="padding-top:20px; padding-bottom:20px;">
		
				
            
				<a href="citation.cfm?id=8428">
				<img src="/auctions/img/8428/large_H300xW300.jpg" width="269~" height="300" alt="Go to this Auction" style="float:right; margin:5px 15px 0 5px;border:1px solid #999;" ></a>
			
			
			
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			<b><a href="Citation.cfm?id=8428">Peter Hujar: Portaits in Life and Death (Hardbound)</a></b><br><br>
				<br>"The overall effect of [Peter Hujar: Portaits in Life and Death ] was stunning and eerie. Every portrait whispered of transitory presence, mystery and oblivion."--Antony Hegarty (of Antony & the J . . . <div style="margin-top:5px;"><a href="Citation.cfm?id=8428"><font color="blue" size="2" >[bid or read more]</font></a> <br><br><!-- AddThis Button BEGIN -->
<div class="addthis_toolbox addthis_default_style " 
	addthis:url="http://www.photoeye.com/auctions/citation.cfm?id=8428" 
	addthis:title="Peter Hujar: Portaits in Life and Death (Hardbound)">
<a class="addthis_button_preferred_1"></a>
<a class="addthis_button_preferred_2"></a>
<a class="addthis_button_preferred_3"></a>
<a class="addthis_button_preferred_4"></a>
<a class="addthis_button_compact"></a>
<a class="addthis_counter addthis_bubble_style"></a>
</div><script type="text/javascript" src="http://s7.addthis.com/js/300/addthis_widget.js#pubid=ra-4eedfea006dcdc6b"></script>
</div>

			

			
			
		</td>
		

	
		
		<td align="right" width="100" valign="top" style="padding-top:20px; padding-bottom:20px;">
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			
					<span style="margin-right:10px;"><font color="green" face="Verdana, Arial, Helvetica, sans-serif" size="3"><b>$795</b></font></span>	
				
			</font>
			
			
				<table cellpadding="3" cellspacing="3" border="0" align="center">
				<tr>
				
					<td align="right" width="30">
						<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
						5d
						
						</font>
					</td>
					<td align="right">
						<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
						2h
						
						</font>
					</td>
					<td align="right">
						<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">	
						6m
						
						
						</font>
					</td>
				
				</tr>
				<tr><td colspan="3" align="right"><a href="Citation.cfm?id=8428"><font color="blue" size="2">[bid]</font></a> 
</td></tr>
				</table>
				
			
			
								<table cellpadding="3" cellspacing="3" border="0" align="right">
					<tr>
												
						<td align="center">
							<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
							
							</font>
						</td>
					</tr>
					</table>
		</td>	


		<td align="center" width="45" valign="top"  style="padding-top:20px; padding-bottom:20px;">
			<font color="GREEN" face="Verdana, Arial, Helvetica, sans-serif" size="3"><B>
			
			</B></font>
		</td>

		
			
			
			
				
		</tr>
		</table>
	
		
	
		<table width="850" border="0" cellspacing="0" cellpadding="5" align="center">
			
		
		&nbsp;
			<tr bgcolor="#F4F1E1">
		
			<td align="left" valign="top" style="padding-top:20px; padding-bottom:20px;" width="600" colspan="2">
		

            
            
            
				<a href="citation.cfm?id=8430">
				<img src="/auctions/img/8430/large_H300xW300.jpg" width="273~" height="300" alt="Go to this Auction"  style=" float:left;margin:5px 15px 0 15px;border:1px solid #999" /></a>
			
			
			
		
		
		
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			<b><a href="Citation.cfm?id=8430">     Alessandra Sanguinetti: On the Sixth Day. Photographs (SIGNED) </a></b><br><br>
			"Alessandra Sanguinetti’s vivid photographs depicting the coexistence of people and animals might at first sight seem brutal, images to be viewed quickly and erased from the memory. But that would be   . . . <div style="margin-top:5px;"><a href="Citation.cfm?id=8430"><font color="blue" size="2" >[bid or read more]</font></a> <br><br><!-- AddThis Button BEGIN -->
<div class="addthis_toolbox addthis_default_style " 
	addthis:url="http://www.photoeye.com/auctions/citation.cfm?id=8430" 
	addthis:title="     Alessandra Sanguinetti: On the Sixth Day. Photographs (SIGNED) ">
<a class="addthis_button_preferred_1"></a>
<a class="addthis_button_preferred_2"></a>
<a class="addthis_button_preferred_3"></a>
<a class="addthis_button_preferred_4"></a>
<a class="addthis_button_compact"></a>
<a class="addthis_counter addthis_bubble_style"></a>
</div><script type="text/javascript" src="http://s7.addthis.com/js/300/addthis_widget.js#pubid=ra-4eedfea006dcdc6b"></script>
</div>

			
		</td>
		
		
		
		<td align="right" width="100" valign="top" style="padding-top:20px; padding-bottom:20px;">
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			
					<span style="margin-right:10px;"><font color="green" face="Verdana, Arial, Helvetica, sans-serif" size="3"><b>$265</b></font></span>	
				
			</font>
			
			
				<table cellpadding="3" cellspacing="3" border="0" align="center">
				<tr>
				
					<td align="right" width="30">
						<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
						5d
						
						</font>
					</td>
					<td align="right">
						<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
						2h
						
						</font>
					</td>
					<td align="right">
						<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">	
						11m
						
						
						</font>
					</td>
				
				</tr>
				<tr><td colspan="3" align="right"><a href="Citation.cfm?id=8430"><font color="blue" size="2">[bid]</font></a> 
</td></tr>
				</table>
				
			
			
								<table cellpadding="3" cellspacing="3" border="0" align="right">
					<tr>
												
						<td align="center">
							<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
							
									<a href="/bookstore/mShowDetailsbycat.cfm?Catalog=PI146"><img src="/img/P/PI/PI146/PI146_H50xW50.jpg" width="42" height="50" alt="The Photo Book" border="1" style="border-color: Silver; border-width: 1px; border-style: solid;"></a>
									
							</font>
						</td>
					</tr>
					</table>
		</td>	


		<td align="center" width="45" valign="top"  style="padding-top:20px; padding-bottom:20px;">
			<font color="GREEN" face="Verdana, Arial, Helvetica, sans-serif" size="3"><B>
			
			</B></font>
		</td>

		
			
			
			
				
		</tr>
		</table>
	
		
	
		<table width="850" border="0" cellspacing="0" cellpadding="5" align="center">
			
		
			&nbsp;
			<tr bgcolor="#eeeeee">
		
		<td align="left" width="600" valign="top" style="padding-top:20px; padding-bottom:20px;">
		
				
            
				<a href="citation.cfm?id=8420">
				<img src="/auctions/img/8420/large_H300xW300.jpg" width="300~" height="218" alt="Go to this Auction" style="float:right; margin:5px 15px 0 5px;border:1px solid #999;" ></a>
			
			
			
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			<b><a href="Citation.cfm?id=8420">Chris Killip: Here Comes Everybody (Limited Edition with Print, INSCRIBED) </a></b><br><br>
				"Anarchic and provocative to the last, Killip is a true original and a genuine free thinker."--The British Journal of Photography <br>"'Here Comes Everybody' is a phrase that echoes repeatedly in Jame . . . <div style="margin-top:5px;"><a href="Citation.cfm?id=8420"><font color="blue" size="2" >[bid or read more]</font></a> <br><br><!-- AddThis Button BEGIN -->
<div class="addthis_toolbox addthis_default_style " 
	addthis:url="http://www.photoeye.com/auctions/citation.cfm?id=8420" 
	addthis:title="Chris Killip: Here Comes Everybody (Limited Edition with Print, INSCRIBED) ">
<a class="addthis_button_preferred_1"></a>
<a class="addthis_button_preferred_2"></a>
<a class="addthis_button_preferred_3"></a>
<a class="addthis_button_preferred_4"></a>
<a class="addthis_button_compact"></a>
<a class="addthis_counter addthis_bubble_style"></a>
</div><script type="text/javascript" src="http://s7.addthis.com/js/300/addthis_widget.js#pubid=ra-4eedfea006dcdc6b"></script>
</div>

			

			
			
		</td>
		

	
		
		<td align="right" width="100" valign="top" style="padding-top:20px; padding-bottom:20px;">
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			
					<span style="margin-right:10px;"><font color="green" face="Verdana, Arial, Helvetica, sans-serif" size="3"><b>$265</b></font></span>	
				
			</font>
			
			
				<table cellpadding="3" cellspacing="3" border="0" align="center">
				<tr>
				
					<td align="right" width="30">
						<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
						5d
						
						</font>
					</td>
					<td align="right">
						<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
						2h
						
						</font>
					</td>
					<td align="right">
						<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">	
						16m
						
						
						</font>
					</td>
				
				</tr>
				<tr><td colspan="3" align="right"><a href="Citation.cfm?id=8420"><font color="blue" size="2">[bid]</font></a> 
</td></tr>
				</table>
				
			
			
								<table cellpadding="3" cellspacing="3" border="0" align="right">
					<tr>
												
						<td align="center">
							<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
							
							</font>
						</td>
					</tr>
					</table>
		</td>	


		<td align="center" width="45" valign="top"  style="padding-top:20px; padding-bottom:20px;">
			<font color="GREEN" face="Verdana, Arial, Helvetica, sans-serif" size="3"><B>
			
			</B></font>
		</td>

		
			
			
			
				
		</tr>
		</table>
	
		
	
		<table width="850" border="0" cellspacing="0" cellpadding="5" align="center">
			
		
		&nbsp;
			<tr bgcolor="#F4F1E1">
		
			<td align="left" valign="top" style="padding-top:20px; padding-bottom:20px;" width="600" colspan="2">
		

            
            
            
				<a href="citation.cfm?id=8431">
				<img src="/auctions/img/8431/large_H300xW300.jpg" width="232~" height="300" alt="Go to this Auction"  style=" float:left;margin:5px 15px 0 15px;border:1px solid #999" /></a>
			
			
			
		
		
		
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			<b><a href="Citation.cfm?id=8431">Halil (ed.): A Cloud of Black Smoke: Photographs From Turkey 1968-72 (SIGNED)    </a></b><br><br>
			Winner of the Discovery Award (Prix de la decouverte) at the Rencontres d'Arles Fotofestival. Included in Parr & Badger, <a href=http://tinyurl.com/n6z3aq6>The Photobook: A History. Volume III</a> <br  . . . <div style="margin-top:5px;"><a href="Citation.cfm?id=8431"><font color="blue" size="2" >[bid or read more]</font></a> <br><br><!-- AddThis Button BEGIN -->
<div class="addthis_toolbox addthis_default_style " 
	addthis:url="http://www.photoeye.com/auctions/citation.cfm?id=8431" 
	addthis:title="Halil (ed.): A Cloud of Black Smoke: Photographs From Turkey 1968-72 (SIGNED)    ">
<a class="addthis_button_preferred_1"></a>
<a class="addthis_button_preferred_2"></a>
<a class="addthis_button_preferred_3"></a>
<a class="addthis_button_preferred_4"></a>
<a class="addthis_button_compact"></a>
<a class="addthis_counter addthis_bubble_style"></a>
</div><script type="text/javascript" src="http://s7.addthis.com/js/300/addthis_widget.js#pubid=ra-4eedfea006dcdc6b"></script>
</div>

			
		</td>
		
		
		
		<td align="right" width="100" valign="top" style="padding-top:20px; padding-bottom:20px;">
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			
					<span style="margin-right:10px;"><font color="green" face="Verdana, Arial, Helvetica, sans-serif" size="3"><b>$225</b></font></span>	
				
			</font>
			
			
				<table cellpadding="3" cellspacing="3" border="0" align="center">
				<tr>
				
					<td align="right" width="30">
						<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
						5d
						
						</font>
					</td>
					<td align="right">
						<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
						2h
						
						</font>
					</td>
					<td align="right">
						<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">	
						31m
						
						
						</font>
					</td>
				
				</tr>
				<tr><td colspan="3" align="right"><a href="Citation.cfm?id=8431"><font color="blue" size="2">[bid]</font></a> 
</td></tr>
				</table>
				
			
			
								<table cellpadding="3" cellspacing="3" border="0" align="right">
					<tr>
												
						<td align="center">
							<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
							
									<a href="/bookstore/mShowDetailsbycat.cfm?Catalog=PI146"><img src="/img/P/PI/PI146/PI146_H50xW50.jpg" width="42" height="50" alt="The Photo Book" border="1" style="border-color: Silver; border-width: 1px; border-style: solid;"></a>
									
							</font>
						</td>
					</tr>
					</table>
		</td>	


		<td align="center" width="45" valign="top"  style="padding-top:20px; padding-bottom:20px;">
			<font color="GREEN" face="Verdana, Arial, Helvetica, sans-serif" size="3"><B>
			
			</B></font>
		</td>

		
			
			
			
				
		</tr>
		</table>
	
		
	
		<table width="850" border="0" cellspacing="0" cellpadding="5" align="center">
			
		
			&nbsp;
			<tr bgcolor="#eeeeee">
		
		<td align="left" width="600" valign="top" style="padding-top:20px; padding-bottom:20px;">
		
				
            
				<a href="citation.cfm?id=8436">
				<img src="/auctions/img/8436/large_H300xW300.jpg" width="300~" height="118" alt="Go to this Auction" style="float:right; margin:5px 15px 0 5px;border:1px solid #999;" ></a>
			
			
			
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			<b><a href="Citation.cfm?id=8436">Luigi Ghirri: It's Beautiful Here, Isn't It    </a></b><br><br>
				"[Ghirri has] a restless and playful imagination--one that regarded photography as 'a great adventure in thinking and looking.' Ghirri teases the idea of landscape with images of toy houses in a net b . . . <div style="margin-top:5px;"><a href="Citation.cfm?id=8436"><font color="blue" size="2" >[bid or read more]</font></a> <br><br><!-- AddThis Button BEGIN -->
<div class="addthis_toolbox addthis_default_style " 
	addthis:url="http://www.photoeye.com/auctions/citation.cfm?id=8436" 
	addthis:title="Luigi Ghirri: It's Beautiful Here, Isn't It    ">
<a class="addthis_button_preferred_1"></a>
<a class="addthis_button_preferred_2"></a>
<a class="addthis_button_preferred_3"></a>
<a class="addthis_button_preferred_4"></a>
<a class="addthis_button_compact"></a>
<a class="addthis_counter addthis_bubble_style"></a>
</div><script type="text/javascript" src="http://s7.addthis.com/js/300/addthis_widget.js#pubid=ra-4eedfea006dcdc6b"></script>
</div>

			

			
			
		</td>
		

	
		
		<td align="right" width="100" valign="top" style="padding-top:20px; padding-bottom:20px;">
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			
					<span style="margin-right:10px;"><font color="green" face="Verdana, Arial, Helvetica, sans-serif" size="3"><b>$250</b></font></span>	
				
			</font>
			
			
				<table cellpadding="3" cellspacing="3" border="0" align="center">
				<tr>
				
					<td align="right" width="30">
						<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
						5d
						
						</font>
					</td>
					<td align="right">
						<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
						2h
						
						</font>
					</td>
					<td align="right">
						<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">	
						36m
						
						
						</font>
					</td>
				
				</tr>
				<tr><td colspan="3" align="right"><a href="Citation.cfm?id=8436"><font color="blue" size="2">[bid]</font></a> 
</td></tr>
				</table>
				
			
			
								<table cellpadding="3" cellspacing="3" border="0" align="right">
					<tr>
												
						<td align="center">
							<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
							
							</font>
						</td>
					</tr>
					</table>
		</td>	


		<td align="center" width="45" valign="top"  style="padding-top:20px; padding-bottom:20px;">
			<font color="GREEN" face="Verdana, Arial, Helvetica, sans-serif" size="3"><B>
			
			</B></font>
		</td>

		
			
			
			
				
		</tr>
		</table>
	
		
	
		<table width="850" border="0" cellspacing="0" cellpadding="5" align="center">
			
		
		&nbsp;
			<tr bgcolor="#F4F1E1">
		
			<td align="left" valign="top" style="padding-top:20px; padding-bottom:20px;" width="600" colspan="2">
		

            
            
            
				<a href="citation.cfm?id=8437">
				<img src="/auctions/img/8437/large_H300xW300.jpg" width="294~" height="300" alt="Go to this Auction"  style=" float:left;margin:5px 15px 0 15px;border:1px solid #999" /></a>
			
			
			
		
		
		
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			<b><a href="Citation.cfm?id=8437">Kenneth Anger: Hollywood Babylon (1959 1st Edition!)     </a></b><br><br>
			The true first edition of this underground classic by legendary avant-garde filmmaker Kenneth Anger. Hollywood Babylon was first published in French in 1959 and a U.S. version finally appeared in 1965  . . . <div style="margin-top:5px;"><a href="Citation.cfm?id=8437"><font color="blue" size="2" >[bid or read more]</font></a> <br><br><!-- AddThis Button BEGIN -->
<div class="addthis_toolbox addthis_default_style " 
	addthis:url="http://www.photoeye.com/auctions/citation.cfm?id=8437" 
	addthis:title="Kenneth Anger: Hollywood Babylon (1959 1st Edition!)     ">
<a class="addthis_button_preferred_1"></a>
<a class="addthis_button_preferred_2"></a>
<a class="addthis_button_preferred_3"></a>
<a class="addthis_button_preferred_4"></a>
<a class="addthis_button_compact"></a>
<a class="addthis_counter addthis_bubble_style"></a>
</div><script type="text/javascript" src="http://s7.addthis.com/js/300/addthis_widget.js#pubid=ra-4eedfea006dcdc6b"></script>
</div>

			
		</td>
		
		
		
		<td align="right" width="100" valign="top" style="padding-top:20px; padding-bottom:20px;">
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			
					<span style="margin-right:10px;"><font color="green" face="Verdana, Arial, Helvetica, sans-serif" size="3"><b>$195</b></font></span>	
				
			</font>
			
			
				<table cellpadding="3" cellspacing="3" border="0" align="center">
				<tr>
				
					<td align="right" width="30">
						<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
						5d
						
						</font>
					</td>
					<td align="right">
						<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
						2h
						
						</font>
					</td>
					<td align="right">
						<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">	
						41m
						
						
						</font>
					</td>
				
				</tr>
				<tr><td colspan="3" align="right"><a href="Citation.cfm?id=8437"><font color="blue" size="2">[bid]</font></a> 
</td></tr>
				</table>
				
			
			
								<table cellpadding="3" cellspacing="3" border="0" align="right">
					<tr>
												
						<td align="center">
							<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
							
							</font>
						</td>
					</tr>
					</table>
		</td>	


		<td align="center" width="45" valign="top"  style="padding-top:20px; padding-bottom:20px;">
			<font color="GREEN" face="Verdana, Arial, Helvetica, sans-serif" size="3"><B>
			
			</B></font>
		</td>

		
			
			
			
				
		</tr>
		</table>
	
		 
			<br>
			<table height="60" align="center">
			<tr>
				<td>
					<table height="40" width="850" border="1" cellspacing="0" cellpadding="5" align="center" bordercolor="white" bgcolor="#dddddd">	
					<tr bordercolor="maroon">
						<td align="center" class="Global_Font"><font color="black">Bidding for the following items has ended; they can now be purchased at the prices shown.</font></td>
					</tr>
					</table>
				</td>
			</tr>
			</table>
			
	
		<table width="850" border="0" cellspacing="0" cellpadding="5" align="center">
			
		
			&nbsp;
			<tr bgcolor="#eeeeee">
		
		<td align="left" width="600" valign="top" style="padding-top:20px; padding-bottom:20px;">
		
				
            
				<a href="citation.cfm?id=8425">
				<img src="/auctions/img/8425/large_H200xW200.jpg" width="200" height="131" alt="Go to this Auction" style="float:right; margin:5px 15px 0 5px;border:1px solid #999;" ></a>
			
			
			
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			<b><a href="Citation.cfm?id=8425">Wolfgangs Tillmans: (Phaidon Contemporary Artists Series) + Neue Welt (BOTH SIGNED)     </a></b><br><br>
				"Over the period of more than two decades, Wolfgang Tillmans has explored the medium of photo-imaging with greater range than any other artist of his generation. From snapshots of his friends to abstr  . . . <div style="margin-top:5px;"><a href="Citation.cfm?id=8425"><font color="blue" size="2">[bid or read more]</font></a> <br><br><!-- AddThis Button BEGIN -->
<div class="addthis_toolbox addthis_default_style " 
	addthis:url="http://www.photoeye.com/auctions/citation.cfm?id=8425" 
	addthis:title="Wolfgangs Tillmans: (Phaidon Contemporary Artists Series) + Neue Welt (BOTH SIGNED)     ">
<a class="addthis_button_preferred_1"></a>
<a class="addthis_button_preferred_2"></a>
<a class="addthis_button_preferred_3"></a>
<a class="addthis_button_preferred_4"></a>

<a class="addthis_button_compact"></a>
<a class="addthis_counter addthis_bubble_style"></a>
</div><script type="text/javascript" src="http://s7.addthis.com/js/300/addthis_widget.js#pubid=ra-4eedfea006dcdc6b"></script>
</div>
			

			
			
		</td>
		

	
		
		<td align="right" width="100" valign="top" style="padding-top:20px; padding-bottom:20px;">
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			 
					<span style="margin-right:10px;"><font color="Green" face="Verdana, Arial, Helvetica, sans-serif" size="3">$175</font>	</span>		
			
			</font>
			
			 
				<br><br><a href="mailto:auctions@photoeye.com?Subject=Post Auction Inquiry for Wolfgangs Tillmans: (Phaidon Contemporary Artists Series) + Neue Welt (BOTH SIGNED)     "><font color="Blue" face="Verdana, Arial, Helvetica, sans-serif" size="2">Inquire to<br>Buy it Now</font></a> 
			
			
								<table cellpadding="3" cellspacing="3" border="0" align="right">
					<tr>
												
						<td align="center">
							<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
							
							</font>
						</td>
					</tr>
					</table>
		</td>	


		<td align="center" width="45" valign="top"  style="padding-top:20px; padding-bottom:20px;">
			<font color="GREEN" face="Verdana, Arial, Helvetica, sans-serif" size="3"><B>
			
			</B></font>
		</td>

		
			
			
			
				
		</tr>
		</table>
	
		
	
		<table width="850" border="0" cellspacing="0" cellpadding="5" align="center">
			
		
		&nbsp;
			<tr bgcolor="#F4F1E1">
		
			<td align="left" valign="top" style="padding-top:20px; padding-bottom:20px;" width="600" colspan="2">
		

            
            
            
				<a href="citation.cfm?id=8421">
				<img src="/auctions/img/8421/large_H200xW200.jpg" width="170" height="200" alt="Go to this Auction"  style=" float:left;margin:5px 15px 0 15px;border:1px solid #999" /></a>
			
			
			
		
		
		
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			<b><a href="Citation.cfm?id=8421"> Josef Koudelka: Respekt (1968 Prague Invasion Photos!)   </a></b><br><br>
			"In 1968, Josef Koudelka was a thirty-year-old acclaimed theater photographer who never photographed a news event. That all changed on the night of August 21, when Warsaw Pact tanks invaded the city o  . . . <div style="margin-top:5px;"><a href="Citation.cfm?id=8421"><font color="blue" size="2">[bid or read more]</font></a> <br><br><!-- AddThis Button BEGIN -->
<div class="addthis_toolbox addthis_default_style " 
	addthis:url="http://www.photoeye.com/auctions/citation.cfm?id=8421" 
	addthis:title=" Josef Koudelka: Respekt (1968 Prague Invasion Photos!)   ">
<a class="addthis_button_preferred_1"></a>
<a class="addthis_button_preferred_2"></a>
<a class="addthis_button_preferred_3"></a>
<a class="addthis_button_preferred_4"></a>
<a class="addthis_button_compact"></a>
<a class="addthis_counter addthis_bubble_style"></a>
</div>
<script type="text/javascript" src="http://s7.addthis.com/js/300/addthis_widget.js#pubid=ra-4eedfea006dcdc6b"></script>
<!-- AddThis Button END --></div>
			
		</td>
		
		
		
		<td align="right" width="100" valign="top" style="padding-top:20px; padding-bottom:20px;">
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			 
					<span style="margin-right:10px;"><font color="Green" face="Verdana, Arial, Helvetica, sans-serif" size="3">$495</font>	</span>		
			
			</font>
			
			 
				<br><br><a href="mailto:auctions@photoeye.com?Subject=Post Auction Inquiry for  Josef Koudelka: Respekt (1968 Prague Invasion Photos!)   "><font color="Blue" face="Verdana, Arial, Helvetica, sans-serif" size="2">Inquire to<br>Buy it Now</font></a> 
			
			
								<table cellpadding="3" cellspacing="3" border="0" align="right">
					<tr>
												
						<td align="center">
							<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
							
							</font>
						</td>
					</tr>
					</table>
		</td>	


		<td align="center" width="45" valign="top"  style="padding-top:20px; padding-bottom:20px;">
			<font color="GREEN" face="Verdana, Arial, Helvetica, sans-serif" size="3"><B>
			
			</B></font>
		</td>

		
			
			
			
				
		</tr>
		</table>
	
		
	
		<table width="850" border="0" cellspacing="0" cellpadding="5" align="center">
			
		
			&nbsp;
			<tr bgcolor="#eeeeee">
		
		<td align="left" width="600" valign="top" style="padding-top:20px; padding-bottom:20px;">
		
				
            
				<a href="citation.cfm?id=8423">
				<img src="/auctions/img/8423/large_H200xW200.jpg" width="119" height="200" alt="Go to this Auction" style="float:right; margin:5px 15px 0 5px;border:1px solid #999;" ></a>
			
			
			
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			<b><a href="Citation.cfm?id=8423">Josef Koudelka: Lime</a></b><br><br>
				"[In his photographs of Limestone quarries] Koudelka gives full reign to these tendencies to make brooding pictures that emphasize the quarrying of limestone not as rape, but as a noble and civilizing  . . . <div style="margin-top:5px;"><a href="Citation.cfm?id=8423"><font color="blue" size="2">[bid or read more]</font></a> <br><br><!-- AddThis Button BEGIN -->
<div class="addthis_toolbox addthis_default_style " 
	addthis:url="http://www.photoeye.com/auctions/citation.cfm?id=8423" 
	addthis:title="Josef Koudelka: Lime">
<a class="addthis_button_preferred_1"></a>
<a class="addthis_button_preferred_2"></a>
<a class="addthis_button_preferred_3"></a>
<a class="addthis_button_preferred_4"></a>

<a class="addthis_button_compact"></a>
<a class="addthis_counter addthis_bubble_style"></a>
</div><script type="text/javascript" src="http://s7.addthis.com/js/300/addthis_widget.js#pubid=ra-4eedfea006dcdc6b"></script>
</div>
			

			
			
		</td>
		

	
		
		<td align="right" width="100" valign="top" style="padding-top:20px; padding-bottom:20px;">
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			 
					<span style="margin-right:10px;"><font color="Green" face="Verdana, Arial, Helvetica, sans-serif" size="3">$395</font>	</span>		
			
			</font>
			
			 
				<br><br><a href="mailto:auctions@photoeye.com?Subject=Post Auction Inquiry for Josef Koudelka: Lime"><font color="Blue" face="Verdana, Arial, Helvetica, sans-serif" size="2">Inquire to<br>Buy it Now</font></a> 
			
			
								<table cellpadding="3" cellspacing="3" border="0" align="right">
					<tr>
												
						<td align="center">
							<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
							
							</font>
						</td>
					</tr>
					</table>
		</td>	


		<td align="center" width="45" valign="top"  style="padding-top:20px; padding-bottom:20px;">
			<font color="GREEN" face="Verdana, Arial, Helvetica, sans-serif" size="3"><B>
			
			</B></font>
		</td>

		
			
			
			
				
		</tr>
		</table>
	
		
	
		<table width="850" border="0" cellspacing="0" cellpadding="5" align="center">
			
		
		&nbsp;
			<tr bgcolor="#F4F1E1">
		
			<td align="left" valign="top" style="padding-top:20px; padding-bottom:20px;" width="600" colspan="2">
		

            
            
            
				<a href="citation.cfm?id=8418">
				<img src="/auctions/img/8418/large_H200xW200.jpg" width="200" height="159" alt="Go to this Auction"  style=" float:left;margin:5px 15px 0 15px;border:1px solid #999" /></a>
			
			
			
		
		
		
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			<b><a href="Citation.cfm?id=8418">Sophie Ristelhueber (and François Hers): Intérieurs</a></b><br><br>
			The first book by photographer Sophie Ristelhueber (best known for <a href=http://www.moma.org/interactives/exhibitions/1996/newphoto12/sophie.ristelhueber.html>Fait</a>)  was a collaboration with fut  . . . <div style="margin-top:5px;"><a href="Citation.cfm?id=8418"><font color="blue" size="2">[bid or read more]</font></a> <br><br><!-- AddThis Button BEGIN -->
<div class="addthis_toolbox addthis_default_style " 
	addthis:url="http://www.photoeye.com/auctions/citation.cfm?id=8418" 
	addthis:title="Sophie Ristelhueber (and François Hers): Intérieurs">
<a class="addthis_button_preferred_1"></a>
<a class="addthis_button_preferred_2"></a>
<a class="addthis_button_preferred_3"></a>
<a class="addthis_button_preferred_4"></a>
<a class="addthis_button_compact"></a>
<a class="addthis_counter addthis_bubble_style"></a>
</div>
<script type="text/javascript" src="http://s7.addthis.com/js/300/addthis_widget.js#pubid=ra-4eedfea006dcdc6b"></script>
<!-- AddThis Button END --></div>
			
		</td>
		
		
		
		<td align="right" width="100" valign="top" style="padding-top:20px; padding-bottom:20px;">
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			 
					<span style="margin-right:10px;"><font color="Green" face="Verdana, Arial, Helvetica, sans-serif" size="3">$295</font>	</span>		
			
			</font>
			
			 
				<br><br><a href="mailto:auctions@photoeye.com?Subject=Post Auction Inquiry for Sophie Ristelhueber (and François Hers): Intérieurs"><font color="Blue" face="Verdana, Arial, Helvetica, sans-serif" size="2">Inquire to<br>Buy it Now</font></a> 
			
			
								<table cellpadding="3" cellspacing="3" border="0" align="right">
					<tr>
												
						<td align="center">
							<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
							
							</font>
						</td>
					</tr>
					</table>
		</td>	


		<td align="center" width="45" valign="top"  style="padding-top:20px; padding-bottom:20px;">
			<font color="GREEN" face="Verdana, Arial, Helvetica, sans-serif" size="3"><B>
			
			</B></font>
		</td>

		
			
			
			
				
		</tr>
		</table>
	
		
	
		<table width="850" border="0" cellspacing="0" cellpadding="5" align="center">
			
		
			&nbsp;
			<tr bgcolor="#eeeeee">
		
		<td align="left" width="600" valign="top" style="padding-top:20px; padding-bottom:20px;">
		
				
            
				<a href="citation.cfm?id=8426">
				<img src="/auctions/img/8426/large_H200xW200.jpg" width="200" height="118" alt="Go to this Auction" style="float:right; margin:5px 15px 0 5px;border:1px solid #999;" ></a>
			
			
			
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			<b><a href="Citation.cfm?id=8426"> Roe Etheridge: Le Luxe (SIGNED) + Orange Grove  </a></b><br><br>
				<i>Le Luxe</i> is included in Parr/Badger, <a href=http://tinyurl.com/d774jm8>The Photobook: A History, vol. III. </a><br>
Now in it's second printing, it was selected as one of the Best Books of 201  . . . <div style="margin-top:5px;"><a href="Citation.cfm?id=8426"><font color="blue" size="2">[bid or read more]</font></a> <br><br><!-- AddThis Button BEGIN -->
<div class="addthis_toolbox addthis_default_style " 
	addthis:url="http://www.photoeye.com/auctions/citation.cfm?id=8426" 
	addthis:title=" Roe Etheridge: Le Luxe (SIGNED) + Orange Grove  ">
<a class="addthis_button_preferred_1"></a>
<a class="addthis_button_preferred_2"></a>
<a class="addthis_button_preferred_3"></a>
<a class="addthis_button_preferred_4"></a>

<a class="addthis_button_compact"></a>
<a class="addthis_counter addthis_bubble_style"></a>
</div><script type="text/javascript" src="http://s7.addthis.com/js/300/addthis_widget.js#pubid=ra-4eedfea006dcdc6b"></script>
</div>
			

			
			
		</td>
		

	
		
		<td align="right" width="100" valign="top" style="padding-top:20px; padding-bottom:20px;">
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			 
					<span style="margin-right:10px;"><font color="Green" face="Verdana, Arial, Helvetica, sans-serif" size="3">$395</font>	</span>		
			
			</font>
			
			 
				<br><br><a href="mailto:auctions@photoeye.com?Subject=Post Auction Inquiry for  Roe Etheridge: Le Luxe (SIGNED) + Orange Grove  "><font color="Blue" face="Verdana, Arial, Helvetica, sans-serif" size="2">Inquire to<br>Buy it Now</font></a> 
			
			
								<table cellpadding="3" cellspacing="3" border="0" align="right">
					<tr>
												
						<td align="center">
							<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
							
							</font>
						</td>
					</tr>
					</table>
		</td>	


		<td align="center" width="45" valign="top"  style="padding-top:20px; padding-bottom:20px;">
			<font color="GREEN" face="Verdana, Arial, Helvetica, sans-serif" size="3"><B>
			
			</B></font>
		</td>

		
			
			
			
				
		</tr>
		</table>
	
		
	
		<table width="850" border="0" cellspacing="0" cellpadding="5" align="center">
			
		
		&nbsp;
			<tr bgcolor="#F4F1E1">
		
			<td align="left" valign="top" style="padding-top:20px; padding-bottom:20px;" width="600" colspan="2">
		

            
            
            
				<a href="citation.cfm?id=8419">
				<img src="/auctions/img/8419/large_H200xW200.jpg" width="144~" height="200" alt="Go to this Auction"  style=" float:left;margin:5px 15px 0 15px;border:1px solid #999" /></a>
			
			
			
		
		
		
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			<b><a href="Citation.cfm?id=8419">(Ginger Gordon/Anthon Beeke) Virgin Sperm Dancer (True First Edition)</a></b><br><br>
			Included in Parr/Badger, The Photobook: <a href=http://tinyurl.com/lur795v>A History, vol. III.</a> 'Virgin Sperm Dancer' was issued as a special edition of Amsterdam based sex magazine Suck. An iconi  . . . <div style="margin-top:5px;"><a href="Citation.cfm?id=8419"><font color="blue" size="2">[bid or read more]</font></a> <br><br><!-- AddThis Button BEGIN -->
<div class="addthis_toolbox addthis_default_style " 
	addthis:url="http://www.photoeye.com/auctions/citation.cfm?id=8419" 
	addthis:title="(Ginger Gordon/Anthon Beeke) Virgin Sperm Dancer (True First Edition)">
<a class="addthis_button_preferred_1"></a>
<a class="addthis_button_preferred_2"></a>
<a class="addthis_button_preferred_3"></a>
<a class="addthis_button_preferred_4"></a>
<a class="addthis_button_compact"></a>
<a class="addthis_counter addthis_bubble_style"></a>
</div>
<script type="text/javascript" src="http://s7.addthis.com/js/300/addthis_widget.js#pubid=ra-4eedfea006dcdc6b"></script>
<!-- AddThis Button END --></div>
			
		</td>
		
		
		
		<td align="right" width="100" valign="top" style="padding-top:20px; padding-bottom:20px;">
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			 
					<span style="margin-right:10px;"><font color="Green" face="Verdana, Arial, Helvetica, sans-serif" size="3">$265</font>	</span>		
			
			</font>
			
			 
				<br><br><a href="mailto:auctions@photoeye.com?Subject=Post Auction Inquiry for (Ginger Gordon/Anthon Beeke) Virgin Sperm Dancer (True First Edition)"><font color="Blue" face="Verdana, Arial, Helvetica, sans-serif" size="2">Inquire to<br>Buy it Now</font></a> 
			
			
								<table cellpadding="3" cellspacing="3" border="0" align="right">
					<tr>
												
						<td align="center">
							<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
							
							</font>
						</td>
					</tr>
					</table>
		</td>	


		<td align="center" width="45" valign="top"  style="padding-top:20px; padding-bottom:20px;">
			<font color="GREEN" face="Verdana, Arial, Helvetica, sans-serif" size="3"><B>
			
			</B></font>
		</td>

		
			
			
			
				
		</tr>
		</table>
	
		
	
		<table width="850" border="0" cellspacing="0" cellpadding="5" align="center">
			
		
			&nbsp;
			<tr bgcolor="#eeeeee">
		
		<td align="left" width="600" valign="top" style="padding-top:20px; padding-bottom:20px;">
		
				
            
				<a href="citation.cfm?id=8417">
				<img src="/auctions/img/8417/large_H200xW200.jpg" width="160" height="200" alt="Go to this Auction" style="float:right; margin:5px 15px 0 5px;border:1px solid #999;" ></a>
			
			
			
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			<b><a href="Citation.cfm?id=8417">Terry Richardson: Lady Gaga (SIGNED by Lady Gaga) </a></b><br><br>
				"In this book of original, behind-the-scenes photographs, acclaimed photographer Terry Richardson follows superstar Lady Gaga during one year of her life, from Lollapalooza through the final show of h  . . . <div style="margin-top:5px;"><a href="Citation.cfm?id=8417"><font color="blue" size="2">[bid or read more]</font></a> <br><br><!-- AddThis Button BEGIN -->
<div class="addthis_toolbox addthis_default_style " 
	addthis:url="http://www.photoeye.com/auctions/citation.cfm?id=8417" 
	addthis:title="Terry Richardson: Lady Gaga (SIGNED by Lady Gaga) ">
<a class="addthis_button_preferred_1"></a>
<a class="addthis_button_preferred_2"></a>
<a class="addthis_button_preferred_3"></a>
<a class="addthis_button_preferred_4"></a>

<a class="addthis_button_compact"></a>
<a class="addthis_counter addthis_bubble_style"></a>
</div><script type="text/javascript" src="http://s7.addthis.com/js/300/addthis_widget.js#pubid=ra-4eedfea006dcdc6b"></script>
</div>
			

			
			
		</td>
		

	
		
		<td align="right" width="100" valign="top" style="padding-top:20px; padding-bottom:20px;">
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			 
					<span style="margin-right:10px;"><font color="Green" face="Verdana, Arial, Helvetica, sans-serif" size="3">$265</font>	</span>		
			
			</font>
			
			 
				<br><br><a href="mailto:auctions@photoeye.com?Subject=Post Auction Inquiry for Terry Richardson: Lady Gaga (SIGNED by Lady Gaga) "><font color="Blue" face="Verdana, Arial, Helvetica, sans-serif" size="2">Inquire to<br>Buy it Now</font></a> 
			
			
								<table cellpadding="3" cellspacing="3" border="0" align="right">
					<tr>
												
						<td align="center">
							<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
							
							</font>
						</td>
					</tr>
					</table>
		</td>	


		<td align="center" width="45" valign="top"  style="padding-top:20px; padding-bottom:20px;">
			<font color="GREEN" face="Verdana, Arial, Helvetica, sans-serif" size="3"><B>
			
			</B></font>
		</td>

		
			
			
			
				
		</tr>
		</table>
	
		
	
		<table width="850" border="0" cellspacing="0" cellpadding="5" align="center">
			
		
		&nbsp;
			<tr bgcolor="#F4F1E1">
		
			<td align="left" valign="top" style="padding-top:20px; padding-bottom:20px;" width="600" colspan="2">
		

            
            
            
				<a href="citation.cfm?id=8354">
				<img src="/auctions/img/8354/large_H200xW200.jpg" width="200" height="124" alt="Go to this Auction"  style=" float:left;margin:5px 15px 0 15px;border:1px solid #999" /></a>
			
			
			
		
		
		
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			<b><a href="Citation.cfm?id=8354">Susan Meiselas: Pandora’s Box (SIGNED, Limited Edition)</a></b><br><br>
			"According to Greek myth, Pandora was given a box by Zeus and instructed never to open it. She could not restrain her curiosity, however, and did just that, releasing into the world all of the sufferi  . . . <div style="margin-top:5px;"><a href="Citation.cfm?id=8354"><font color="blue" size="2">[bid or read more]</font></a> <br><br><!-- AddThis Button BEGIN -->
<div class="addthis_toolbox addthis_default_style " 
	addthis:url="http://www.photoeye.com/auctions/citation.cfm?id=8354" 
	addthis:title="Susan Meiselas: Pandora’s Box (SIGNED, Limited Edition)">
<a class="addthis_button_preferred_1"></a>
<a class="addthis_button_preferred_2"></a>
<a class="addthis_button_preferred_3"></a>
<a class="addthis_button_preferred_4"></a>
<a class="addthis_button_compact"></a>
<a class="addthis_counter addthis_bubble_style"></a>
</div>
<script type="text/javascript" src="http://s7.addthis.com/js/300/addthis_widget.js#pubid=ra-4eedfea006dcdc6b"></script>
<!-- AddThis Button END --></div>
			
		</td>
		
		
		
		<td align="right" width="100" valign="top" style="padding-top:20px; padding-bottom:20px;">
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			 
					<span style="margin-right:10px;"><font color="Green" face="Verdana, Arial, Helvetica, sans-serif" size="3">$295</font>	</span>		
			
			</font>
			
			 
				<br><br><a href="mailto:auctions@photoeye.com?Subject=Post Auction Inquiry for Susan Meiselas: Pandora’s Box (SIGNED, Limited Edition)"><font color="Blue" face="Verdana, Arial, Helvetica, sans-serif" size="2">Inquire to<br>Buy it Now</font></a> 
			
			
								<table cellpadding="3" cellspacing="3" border="0" align="right">
					<tr>
												
						<td align="center">
							<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
							
							</font>
						</td>
					</tr>
					</table>
		</td>	


		<td align="center" width="45" valign="top"  style="padding-top:20px; padding-bottom:20px;">
			<font color="GREEN" face="Verdana, Arial, Helvetica, sans-serif" size="3"><B>
			
			</B></font>
		</td>

		
			
			
			
				
		</tr>
		</table>
	
		
	
		<table width="850" border="0" cellspacing="0" cellpadding="5" align="center">
			
		
			&nbsp;
			<tr bgcolor="#eeeeee">
		
		<td align="left" width="600" valign="top" style="padding-top:20px; padding-bottom:20px;">
		
				
            
				<a href="citation.cfm?id=8404">
				<img src="/auctions/img/8404/large_H200xW200.jpg" width="200" height="200" alt="Go to this Auction" style="float:right; margin:5px 15px 0 5px;border:1px solid #999;" ></a>
			
			
			
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			<b><a href="Citation.cfm?id=8404">Andreas Gursky (2010 Gagosian Catalogue, 2 Vols. in Slipcase) </a></b><br><br>
				"This magnificent set of slip-cased books captures the grandness and lushness of epic photographer Andreas Gursky's Oceans series of 2010, currently featured in tandem with his newest body of work, Ba  . . . <div style="margin-top:5px;"><a href="Citation.cfm?id=8404"><font color="blue" size="2">[bid or read more]</font></a> <br><br><!-- AddThis Button BEGIN -->
<div class="addthis_toolbox addthis_default_style " 
	addthis:url="http://www.photoeye.com/auctions/citation.cfm?id=8404" 
	addthis:title="Andreas Gursky (2010 Gagosian Catalogue, 2 Vols. in Slipcase) ">
<a class="addthis_button_preferred_1"></a>
<a class="addthis_button_preferred_2"></a>
<a class="addthis_button_preferred_3"></a>
<a class="addthis_button_preferred_4"></a>

<a class="addthis_button_compact"></a>
<a class="addthis_counter addthis_bubble_style"></a>
</div><script type="text/javascript" src="http://s7.addthis.com/js/300/addthis_widget.js#pubid=ra-4eedfea006dcdc6b"></script>
</div>
			

			
			
		</td>
		

	
		
		<td align="right" width="100" valign="top" style="padding-top:20px; padding-bottom:20px;">
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			 
					<span style="margin-right:10px;"><font color="Green" face="Verdana, Arial, Helvetica, sans-serif" size="3">$295</font>	</span>		
			
			</font>
			
			 
				<br><br><a href="mailto:auctions@photoeye.com?Subject=Post Auction Inquiry for Andreas Gursky (2010 Gagosian Catalogue, 2 Vols. in Slipcase) "><font color="Blue" face="Verdana, Arial, Helvetica, sans-serif" size="2">Inquire to<br>Buy it Now</font></a> 
			
			
								<table cellpadding="3" cellspacing="3" border="0" align="right">
					<tr>
												
						<td align="center">
							<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
							
							</font>
						</td>
					</tr>
					</table>
		</td>	


		<td align="center" width="45" valign="top"  style="padding-top:20px; padding-bottom:20px;">
			<font color="GREEN" face="Verdana, Arial, Helvetica, sans-serif" size="3"><B>
			
			</B></font>
		</td>

		
			
			
			
				
		</tr>
		</table>
	
		
	
		<table width="850" border="0" cellspacing="0" cellpadding="5" align="center">
			
		
		&nbsp;
			<tr bgcolor="#F4F1E1">
		
			<td align="left" valign="top" style="padding-top:20px; padding-bottom:20px;" width="600" colspan="2">
		

            
            
            
				<a href="citation.cfm?id=8406">
				<img src="/auctions/img/8406/large_H200xW200.jpg" width="200" height="138" alt="Go to this Auction"  style=" float:left;margin:5px 15px 0 15px;border:1px solid #999" /></a>
			
			
			
		
		
		
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			<b><a href="Citation.cfm?id=8406">Mike Mandel: Untitled (Baseball-Photographer Trading Cards), Complete Set of 135    </a></b><br><br>
			"In 1974, just a year before Mike Mandel and Larry Sultan, classmates at the San Francisco Art Institute, were awarded a grant by the National Endowment for the Arts to pursue what eventually became t  . . . <div style="margin-top:5px;"><a href="Citation.cfm?id=8406"><font color="blue" size="2">[bid or read more]</font></a> <br><br><!-- AddThis Button BEGIN -->
<div class="addthis_toolbox addthis_default_style " 
	addthis:url="http://www.photoeye.com/auctions/citation.cfm?id=8406" 
	addthis:title="Mike Mandel: Untitled (Baseball-Photographer Trading Cards), Complete Set of 135    ">
<a class="addthis_button_preferred_1"></a>
<a class="addthis_button_preferred_2"></a>
<a class="addthis_button_preferred_3"></a>
<a class="addthis_button_preferred_4"></a>
<a class="addthis_button_compact"></a>
<a class="addthis_counter addthis_bubble_style"></a>
</div>
<script type="text/javascript" src="http://s7.addthis.com/js/300/addthis_widget.js#pubid=ra-4eedfea006dcdc6b"></script>
<!-- AddThis Button END --></div>
			
		</td>
		
		
		
		<td align="right" width="100" valign="top" style="padding-top:20px; padding-bottom:20px;">
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			 
					<span style="margin-right:10px;"><font color="Green" face="Verdana, Arial, Helvetica, sans-serif" size="3">$2865</font>	</span>		
			
			</font>
			
			 
				<br><br><a href="mailto:auctions@photoeye.com?Subject=Post Auction Inquiry for Mike Mandel: Untitled (Baseball-Photographer Trading Cards), Complete Set of 135    "><font color="Blue" face="Verdana, Arial, Helvetica, sans-serif" size="2">Inquire to<br>Buy it Now</font></a> 
			
			
								<table cellpadding="3" cellspacing="3" border="0" align="right">
					<tr>
												
						<td align="center">
							<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
							
							</font>
						</td>
					</tr>
					</table>
		</td>	


		<td align="center" width="45" valign="top"  style="padding-top:20px; padding-bottom:20px;">
			<font color="GREEN" face="Verdana, Arial, Helvetica, sans-serif" size="3"><B>
			
			</B></font>
		</td>

		
			
			
			
				
		</tr>
		</table>
	
		
	
		<table width="850" border="0" cellspacing="0" cellpadding="5" align="center">
			
		
			&nbsp;
			<tr bgcolor="#eeeeee">
		
		<td align="left" width="600" valign="top" style="padding-top:20px; padding-bottom:20px;">
		
				
            
				<a href="citation.cfm?id=8402">
				<img src="/auctions/img/8402/large_H200xW200.jpg" width="200" height="71" alt="Go to this Auction" style="float:right; margin:5px 15px 0 5px;border:1px solid #999;" ></a>
			
			
			
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			<b><a href="Citation.cfm?id=8402"> Florian van Roekel: How Terry Likes His Coffee. A Photo Odyssey into Office Life  </a></b><br><br>
				One of Martin Parr's <a href=http://tinyurl.com/3pe4gbg>Best Books of the Decade</a>! <br>
"In How Terry likes his Coffee I examined the consequences of professionalization on the way we cope with re  . . . <div style="margin-top:5px;"><a href="Citation.cfm?id=8402"><font color="blue" size="2">[bid or read more]</font></a> <br><br><!-- AddThis Button BEGIN -->
<div class="addthis_toolbox addthis_default_style " 
	addthis:url="http://www.photoeye.com/auctions/citation.cfm?id=8402" 
	addthis:title=" Florian van Roekel: How Terry Likes His Coffee. A Photo Odyssey into Office Life  ">
<a class="addthis_button_preferred_1"></a>
<a class="addthis_button_preferred_2"></a>
<a class="addthis_button_preferred_3"></a>
<a class="addthis_button_preferred_4"></a>

<a class="addthis_button_compact"></a>
<a class="addthis_counter addthis_bubble_style"></a>
</div><script type="text/javascript" src="http://s7.addthis.com/js/300/addthis_widget.js#pubid=ra-4eedfea006dcdc6b"></script>
</div>
			

			
			
		</td>
		

	
		
		<td align="right" width="100" valign="top" style="padding-top:20px; padding-bottom:20px;">
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			 
					<span style="margin-right:10px;"><font color="Green" face="Verdana, Arial, Helvetica, sans-serif" size="3">$595</font>	</span>		
			
			</font>
			
			 
				<br><br><a href="mailto:auctions@photoeye.com?Subject=Post Auction Inquiry for  Florian van Roekel: How Terry Likes His Coffee. A Photo Odyssey into Office Life  "><font color="Blue" face="Verdana, Arial, Helvetica, sans-serif" size="2">Inquire to<br>Buy it Now</font></a> 
			
			
								<table cellpadding="3" cellspacing="3" border="0" align="right">
					<tr>
												
						<td align="center">
							<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
							
							</font>
						</td>
					</tr>
					</table>
		</td>	


		<td align="center" width="45" valign="top"  style="padding-top:20px; padding-bottom:20px;">
			<font color="GREEN" face="Verdana, Arial, Helvetica, sans-serif" size="3"><B>
			
			</B></font>
		</td>

		
			
			
			
				
		</tr>
		</table>
	
		
	
		<table width="850" border="0" cellspacing="0" cellpadding="5" align="center">
			
		
		&nbsp;
			<tr bgcolor="#F4F1E1">
		
			<td align="left" valign="top" style="padding-top:20px; padding-bottom:20px;" width="600" colspan="2">
		

            
            
            
				<a href="citation.cfm?id=8400">
				<img src="/auctions/img/8400/large_H200xW200.jpg" width="143" height="200" alt="Go to this Auction"  style=" float:left;margin:5px 15px 0 15px;border:1px solid #999" /></a>
			
			
			
		
		
		
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			<b><a href="Citation.cfm?id=8400">Tiane Doan na Champassak: Looters (SIGNED, Limited Edition, 1/150)</a></b><br><br>
			Selected as one of the Best Books of 2011 by <a href=http://tinyurl.com/mxwtbb9>Martin Parr</a>; also included in Parr/Badger, <a href=http://tinyurl.com/l38qc7l>The Photobook: A History, vol. III</a>  . . . <div style="margin-top:5px;"><a href="Citation.cfm?id=8400"><font color="blue" size="2">[bid or read more]</font></a> <br><br><!-- AddThis Button BEGIN -->
<div class="addthis_toolbox addthis_default_style " 
	addthis:url="http://www.photoeye.com/auctions/citation.cfm?id=8400" 
	addthis:title="Tiane Doan na Champassak: Looters (SIGNED, Limited Edition, 1/150)">
<a class="addthis_button_preferred_1"></a>
<a class="addthis_button_preferred_2"></a>
<a class="addthis_button_preferred_3"></a>
<a class="addthis_button_preferred_4"></a>
<a class="addthis_button_compact"></a>
<a class="addthis_counter addthis_bubble_style"></a>
</div>
<script type="text/javascript" src="http://s7.addthis.com/js/300/addthis_widget.js#pubid=ra-4eedfea006dcdc6b"></script>
<!-- AddThis Button END --></div>
			
		</td>
		
		
		
		<td align="right" width="100" valign="top" style="padding-top:20px; padding-bottom:20px;">
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			 
					<span style="margin-right:10px;"><font color="Green" face="Verdana, Arial, Helvetica, sans-serif" size="3">$295</font>	</span>		
			
			</font>
			
			 
				<br><br><a href="mailto:auctions@photoeye.com?Subject=Post Auction Inquiry for Tiane Doan na Champassak: Looters (SIGNED, Limited Edition, 1/150)"><font color="Blue" face="Verdana, Arial, Helvetica, sans-serif" size="2">Inquire to<br>Buy it Now</font></a> 
			
			
								<table cellpadding="3" cellspacing="3" border="0" align="right">
					<tr>
												
						<td align="center">
							<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
							
							</font>
						</td>
					</tr>
					</table>
		</td>	


		<td align="center" width="45" valign="top"  style="padding-top:20px; padding-bottom:20px;">
			<font color="GREEN" face="Verdana, Arial, Helvetica, sans-serif" size="3"><B>
			
			</B></font>
		</td>

		
			
			
			
				
		</tr>
		</table>
	
		
	
		<table width="850" border="0" cellspacing="0" cellpadding="5" align="center">
			
		
			&nbsp;
			<tr bgcolor="#eeeeee">
		
		<td align="left" width="600" valign="top" style="padding-top:20px; padding-bottom:20px;">
		
				
            
				<a href="citation.cfm?id=8399">
				<img src="/auctions/img/8399/large_H200xW200.jpg" width="148" height="200" alt="Go to this Auction" style="float:right; margin:5px 15px 0 5px;border:1px solid #999;" ></a>
			
			
			
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			<b><a href="Citation.cfm?id=8399">Robert Frank: Lines of My Hand (1972 First Edition)--with 'New York City, 1948' Cover</a></b><br><br>
				As Parr and Badger write, "Everything [Frank] does is a diary, a confession." The books retrospective tone is summed up in opening lines contained in the 1989 edition:<br>
<i>I am looking back into a  . . . <div style="margin-top:5px;"><a href="Citation.cfm?id=8399"><font color="blue" size="2">[bid or read more]</font></a> <br><br><!-- AddThis Button BEGIN -->
<div class="addthis_toolbox addthis_default_style " 
	addthis:url="http://www.photoeye.com/auctions/citation.cfm?id=8399" 
	addthis:title="Robert Frank: Lines of My Hand (1972 First Edition)--with 'New York City, 1948' Cover">
<a class="addthis_button_preferred_1"></a>
<a class="addthis_button_preferred_2"></a>
<a class="addthis_button_preferred_3"></a>
<a class="addthis_button_preferred_4"></a>

<a class="addthis_button_compact"></a>
<a class="addthis_counter addthis_bubble_style"></a>
</div><script type="text/javascript" src="http://s7.addthis.com/js/300/addthis_widget.js#pubid=ra-4eedfea006dcdc6b"></script>
</div>
			

			
			
		</td>
		

	
		
		<td align="right" width="100" valign="top" style="padding-top:20px; padding-bottom:20px;">
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			 
					<span style="margin-right:10px;"><font color="Green" face="Verdana, Arial, Helvetica, sans-serif" size="3">$2995</font>	</span>		
			
			</font>
			
			 
				<br><br><a href="mailto:auctions@photoeye.com?Subject=Post Auction Inquiry for Robert Frank: Lines of My Hand (1972 First Edition)--with 'New York City, 1948' Cover"><font color="Blue" face="Verdana, Arial, Helvetica, sans-serif" size="2">Inquire to<br>Buy it Now</font></a> 
			
			
								<table cellpadding="3" cellspacing="3" border="0" align="right">
					<tr>
												
						<td align="center">
							<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
							
							</font>
						</td>
					</tr>
					</table>
		</td>	


		<td align="center" width="45" valign="top"  style="padding-top:20px; padding-bottom:20px;">
			<font color="GREEN" face="Verdana, Arial, Helvetica, sans-serif" size="3"><B>
			
			</B></font>
		</td>

		
			
			
			
				
		</tr>
		</table>
	
		
	
		<table width="850" border="0" cellspacing="0" cellpadding="5" align="center">
			
		
		&nbsp;
			<tr bgcolor="#F4F1E1">
		
			<td align="left" valign="top" style="padding-top:20px; padding-bottom:20px;" width="600" colspan="2">
		

            
            
            
				<a href="citation.cfm?id=8372">
				<img src="/auctions/img/8372/large_H200xW200.jpg" width="155" height="200" alt="Go to this Auction"  style=" float:left;margin:5px 15px 0 15px;border:1px solid #999" /></a>
			
			
			
		
		
		
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			<b><a href="Citation.cfm?id=8372"> 	Grace Coddington: Grace: Thirty Years of Fashion at Vogue [Work by Numerous Photographers]--SIGNED</a></b><br><br>
			"Grace Coddington's work has danced along the cutting edge of fashion for over 30 years. Abandoning a highly lucrative career as a leading model on the sixties London scene alongside such swinging con  . . . <div style="margin-top:5px;"><a href="Citation.cfm?id=8372"><font color="blue" size="2">[bid or read more]</font></a> <br><br><!-- AddThis Button BEGIN -->
<div class="addthis_toolbox addthis_default_style " 
	addthis:url="http://www.photoeye.com/auctions/citation.cfm?id=8372" 
	addthis:title=" 	Grace Coddington: Grace: Thirty Years of Fashion at Vogue [Work by Numerous Photographers]--SIGNED">
<a class="addthis_button_preferred_1"></a>
<a class="addthis_button_preferred_2"></a>
<a class="addthis_button_preferred_3"></a>
<a class="addthis_button_preferred_4"></a>
<a class="addthis_button_compact"></a>
<a class="addthis_counter addthis_bubble_style"></a>
</div>
<script type="text/javascript" src="http://s7.addthis.com/js/300/addthis_widget.js#pubid=ra-4eedfea006dcdc6b"></script>
<!-- AddThis Button END --></div>
			
		</td>
		
		
		
		<td align="right" width="100" valign="top" style="padding-top:20px; padding-bottom:20px;">
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			 
					<span style="margin-right:10px;"><font color="Green" face="Verdana, Arial, Helvetica, sans-serif" size="3">$1865</font>	</span>		
			
			</font>
			
			 
				<br><br><a href="mailto:auctions@photoeye.com?Subject=Post Auction Inquiry for  	Grace Coddington: Grace: Thirty Years of Fashion at Vogue [Work by Numerous Photographers]--SIGNED"><font color="Blue" face="Verdana, Arial, Helvetica, sans-serif" size="2">Inquire to<br>Buy it Now</font></a> 
			
			
								<table cellpadding="3" cellspacing="3" border="0" align="right">
					<tr>
												
						<td align="center">
							<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
							
							</font>
						</td>
					</tr>
					</table>
		</td>	


		<td align="center" width="45" valign="top"  style="padding-top:20px; padding-bottom:20px;">
			<font color="GREEN" face="Verdana, Arial, Helvetica, sans-serif" size="3"><B>
			
			</B></font>
		</td>

		
			
			
			
				
		</tr>
		</table>
	
		
	
		<table width="850" border="0" cellspacing="0" cellpadding="5" align="center">
			
		
			&nbsp;
			<tr bgcolor="#eeeeee">
		
		<td align="left" width="600" valign="top" style="padding-top:20px; padding-bottom:20px;">
		
				
            
				<a href="citation.cfm?id=8392">
				<img src="/auctions/img/8392/large_H200xW200.jpg" width="200~" height="99" alt="Go to this Auction" style="float:right; margin:5px 15px 0 5px;border:1px solid #999;" ></a>
			
			
			
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			<b><a href="Citation.cfm?id=8392">Masahisa Fukase: The Solitude of Ravens (2008 Reprint)</a></b><br><br>
				<a href=http://www.theguardian.com/artanddesign/2010/may/24/masahisa-fukase-ravens-photobook>Masahisa Fukase's Ravens: the best photobook of the past 25 years?</a>--Sean O'Hagen, The Guardian, 2010<br  . . . <div style="margin-top:5px;"><a href="Citation.cfm?id=8392"><font color="blue" size="2">[bid or read more]</font></a> <br><br><!-- AddThis Button BEGIN -->
<div class="addthis_toolbox addthis_default_style " 
	addthis:url="http://www.photoeye.com/auctions/citation.cfm?id=8392" 
	addthis:title="Masahisa Fukase: The Solitude of Ravens (2008 Reprint)">
<a class="addthis_button_preferred_1"></a>
<a class="addthis_button_preferred_2"></a>
<a class="addthis_button_preferred_3"></a>
<a class="addthis_button_preferred_4"></a>

<a class="addthis_button_compact"></a>
<a class="addthis_counter addthis_bubble_style"></a>
</div><script type="text/javascript" src="http://s7.addthis.com/js/300/addthis_widget.js#pubid=ra-4eedfea006dcdc6b"></script>
</div>
			

			
			
		</td>
		

	
		
		<td align="right" width="100" valign="top" style="padding-top:20px; padding-bottom:20px;">
			<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
			 
					<span style="margin-right:10px;"><font color="Green" face="Verdana, Arial, Helvetica, sans-serif" size="3">$595</font>	</span>		
			
			</font>
			
			 
				<br><br><a href="mailto:auctions@photoeye.com?Subject=Post Auction Inquiry for Masahisa Fukase: The Solitude of Ravens (2008 Reprint)"><font color="Blue" face="Verdana, Arial, Helvetica, sans-serif" size="2">Inquire to<br>Buy it Now</font></a> 
			
			
								<table cellpadding="3" cellspacing="3" border="0" align="right">
					<tr>
												
						<td align="center">
							<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
							
							</font>
						</td>
					</tr>
					</table>
		</td>	


		<td align="center" width="45" valign="top"  style="padding-top:20px; padding-bottom:20px;">
			<font color="GREEN" face="Verdana, Arial, Helvetica, sans-serif" size="3"><B>
			
			</B></font>
		</td>

		
			
			
			
				
		</tr>
		</table>
	
		
	
	<br>
    <center>
	<table cellpadding="20" bgcolor="#F2DF9F" align="center">
	<tr>
		<td align="center">
			
			<a href="AvailPostAuction.cfm?st=1"><B>View</b></a> the Entire Inventory Available for Post-Auction Sale
		</td>
	</tr>
	</table>
    </center>
	<br>
	 
	View all 4739<b> <a href="index.cfm?View=PastAuctions">Past Auctions</a></b>

	


<br><br>


   </div>
   </div>     
<div class="DivisionMenu">
   	  <div class="DivisionMenuTop" id="DivisionMenuBottom">
			

<div id="Jump_Top" style="display:none;"><img src="/global/images/jump_auctions.gif" onmousedown="button_down()" onmouseup="goTop()" /></div>
<script type="text/javascript">
var clientH;
var scrollingto;

function needs_padding(){
 
	elem = $$('div.MainArea');
	if(elem[0].getHeight() > 501){
		elem[0].setStyle({padding:'0 0 50px 0'});
		return;
	}
	else return;
}

function has_scrollbar(){

	elem = $$('div.ContainAll');
	if(screen.availHeight < elem[0].clientHeight)
		$('Jump_Top').show();
	else
		return;
	clientH = elem[0].clientHeight;
	scrollingto = clientH;
}

function button_down(){
	$('Jump_Top').setStyle({position:'relative',
							left:'1px',
							top:'1px'});
}
var skip = 0;

function goTop(){
	if(skip != 1){
		$('Jump_Top').setStyle({left:'0',
								top:'0'});
		skip = 1;
		scrollingtomath = (scrollingto/10);
	}
	if (scrollingto > scrollingtomath){
		scrollingto = (scrollingto-scrollingtomath);
		window.scrollTo(0,scrollingto);
		var t = setTimeout('goTop()',10);
	}
	else {
		window.scrollTo(0,0);
		scrollingto = clientH;
		skip = 0;
	}
}

needs_padding();
has_scrollbar();
</script>
    	</div>
    <div style="height:15px"></div>
	
    <div style="height:50px">
    	<span class="MenuItem2"><a style="cursor:text">&copy; photo-eye, 2014. All Rights Reserved</a></span>
    	<span class="MenuItem2"><a href="/Templates/copyrights.cfm">Copyrights-Trademarks</a></span>
    	<span class="MenuItem2"><a href="/Templates/privacypolicy.cfm">Privacy Policy</a></span>
    
    	<span class="MenuItem2"><a href="/Templates/contactus.cfm">Staff/Hours/Santa Fe Location</a></span>
    	<span class="MenuItem2"><a style="cursor:text">800.227.6941</a></span>
    	<span class="MenuItem2" style="background:none;"><a href="mailto:info@photoeye.com?Subject=General Question">info@photoeye.com</a></span>
    </div>
</div>
</div>
<!--[if IE]>  
</div>  
<![endif]-->

	





</body>
</html>
