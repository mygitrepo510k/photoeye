<!---Photo-Eye Dynamic Software--->
<!---Written by Rixon G. Reed--->
<!---© photo-eye books & prints, 2001. All Rights Reserved.--->


<!-----------------DO NOT ERASE THIS!!!!!!!!!!!!--------------->
<CFIF ParameterExists(URL.PID)> 

<CFCOOKIE NAME="CJ_PID" 
           VALUE=#URL.PID#>
<CFCOOKIE NAME="CJ_AID" 
           VALUE=#URL.AID#>
</CFIF>
<!-----------------DO NOT ERASE THIS!!!!!!!!!!!!--------------->

<cfset ImageNumber = 1>
<cfset ImagePosition = 1>
<cfset FirstTime = 1>
<cfset rowcount =1 >
<cfset imgbeginType1=RAND()>


<CFQUERY NAME="qGetPhoto"  DATASOURCE="photoeyecom">
SELECT DISTINCT TOP 1 G.SubDirectory as SubDirectory, G.Firstname as Firstname, p.ImgQty as ImageQTy, G.Lastname as Lastname, G.Gallery as Gallery, G.Custnumber as Custnumber, 
    P.Subdirectory as Portfolio, D.GeneralRandomNo
FROM GallerySetup AS G,  GalleryDefaultPhotos as D, GalleryPortfolio as P
WHERE   G.Custnumber = P.Custnumber and G.Custnumber = D.Custnumber AND P.Subdirectory = D.Subdirectory AND P.ImgQty>0 AND D.GeneralRandomNo>#imgbeginType1# AND P.SHOWCASEOK=1 
ORDER BY D.GeneralRandomNo
</cfquery>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN"><html><head>

<meta name="DESCRIPTION"
content="The world's foremost online photography bookstore featuring over 10,000 books pertaining to all types of photography, secure ordering, a powerful full-text search engine, catalogue browsing, new arrivals, bestsellers, out-of-print, indexing, what's new, interactive forums, and contemporary gallery">

<meta name="KEYWORDS" content="photography bookstore photo-eye photoeye photography photo book books bookstore book store gallery art nudes erotic out-of-print out of print op o.p. jock sturges sally mann paul caponigro walter chappell ted kuykendall debbie fleming caffery james ware pitts mark klett terri weifenbach david gibson edward ranney laurent millet">



	<title>photo-eye books &amp; prints | fine photography books and art photography gallery</title>




</head>
<cfoutput>
<body bgcolor="##333333" text="White" link="Yellow" vlink="Yellow" alink="Red" topmargin=10>
<div align="center">
<table width="400" align="center"><tr><td bgcolor="Black">
<img src="Gallery/PhotoShowcase/SharedImages/ExploreArtPhotographyLogo.gif" width="384" height="84" alt="Enter Gallery" border="0"></td></tr></table>
  <table width="400" border="0" cellpadding="0"><tr><td colspan="3" align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="2" color="Yellow"><b>Introducing our New Online Galleries!<br><br></b></font></td></tr>
    <tr> 
      <td colspan="3" align="center"><a href="Gallery/index925.html" target="_parent"><img src="Gallery/#qGetPhoto.Gallery#/Artists/#qGetPhoto.Subdirectory#/#qGetPhoto.Portfolio#/Images_Medium/Image1.jpg" border="0"></a><br>
         <font color="Silver" face="verdana, arial, Helvetica, sans-serif" size="1">&copy; 
        #qGetPhoto.Firstname# #qGetPhoto.Lastname#<br>
					 <cfset ArtistGallery =''>
	 <cfif UCASE(qGetPhoto.Gallery) is 'REPRESENTEDARTISTS'>
	 	<cfset ArtistGallery = 'photo-eye Santa Fe - Represented Artist'>
	 <cfelseif UCASE(qGetPhoto.Gallery) is 'PHOTOSHOWCASE'>
			<cfset ArtistGallery = "Photographer's Showcase Artist">		
	 <cfelseif UCASE(qGetPhoto.Gallery) is 'MAGNUMARTISTS'>
	 	<cfset ArtistGallery = 'Magnum Photos Artist'>
     </cfif> #ArtistGallery#</font>
        <p align="center"><font color="White" face="verdana, arial, Helvetica, sans-serif" size="1">The Photographer's Showcase<br>Magnum Photos Collector's Prints<br>photo-eye Gallery Santa Fe - Represented Artists<br>
          &nbsp; </font></p></td></tr>
  </table>
  <table width="375" border="0" height="253">
    <tr align="center" valign="middle"> 
      <td width="200" height="190"> 
        <div align="center"><a href="indexbookstore.html"><img src="Img/IndexPage/101books.jpg" width="123" height="150" alt="Enter Bookstore" border="0"></a></div></td><td width="200" height="190" align="center"> 
        <a href="indexbookstore.html"><img src="Img/IndexPage/havana.jpg" width="123" height="150" alt="Enter Bookstore" border="0"></a></td></tr>
    <tr> 
      <td width="200" height="15"> 
        <div align="center"><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="##FF0000"><b>Now 
          Shipping!</b></font><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><br>
          Andrew Roth:<br>
          The Book of 101 Books<br>
          <br>
          <a href="indexbookstore.html">Enter Bookstore</a></font></b></td><td width="200" height="15" align="center">
        <b><font face="Verdana, Arial, Helvetica, sans-serif" size="1" color="##FF0000"><b>Now 
          Shipping!</b></font><b><font face="Verdana, Arial, Helvetica, sans-serif" size="1"><br>
          Robert Polidori:<br>
          Havana<br>
          <br>
          <a href="indexbookstore.html">Enter Bookstore</a></font></b></b></div></td></tr>
  </table>
  <table width="594">
    <tr align="center"> 
      <td> 
        <div align="center"> <img src="img/yellow(2)pointsleft.gif" width="1" height="1" alt="" border="0"> 
<img src="Gallery/ShowTitles/Gibson_FranceSpain/picture.jpg" width=1 height=1 alt="" border="0">
<img src="Gallery/ShowTitles/Gibson_FranceSpain/Text.jpg" width=1 height=1 alt="" border="0">
        <img src="Gallery/ShowThumbs/klett_2000midjuly.jpg" width=1 height=1 alt="" border="0">
		<img src="Gallery/ShowTitles/enter_over.jpg" width=1 height=1 alt="" border="0">
          <img src="img/CheckOut_Over.gif" width=1 height=1 alt="" border="0"> 
          <img src="img/OrderDetails_Over.gif" width=1 height=1 alt="" border="0"> 
          <img src="img/photoeyebooks&amp;printsonline.gif" width=1 height=1 alt="" border="0"> 
          <img src="img/photoeye4a.gif" width=1 height=1 alt="" border="0"> <img src="Img/GIF/70DiscountYellowBigffffcc.gif" width="1" height="1" alt="" border="0"> 
          <img src="img/GIF/NewGo2.gif" width=1 height=1 alt="" border="0"><br>
          <img src="Img/yellow(2)pointsleftred.gif" width="1" height="1" alt="" border="0">
		<br><font color="##333333" size="1">  
          Photography Books and Photography Gallery including Jock Sturges - Sally 
          Mann - Keith Carter - Linda Connor - Pentti Sammallahti - Terri Weifenbach 
          - Volker Seding - Imogen Cunningham and Photo Books by Robert Frank 
          - Lee Friedlander - Diane Arbus - Joel-Peter Witkin - Walter Chappell 
          - Ted Kuykendall - Debbie Fleming Caffery - James Ware Pitts - Mark Klett - David Gibson - Edward Ranney - Laurent Millet</font></div>
</td></tr></table>

</div>
</body>
</cfoutput>
</html>
