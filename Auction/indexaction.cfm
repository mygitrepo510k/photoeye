
<cfif len(trim(form.email)) GT 0>
	<cfquery name="qInsertEmail" datasource="photoeyecom">
		Insert into AuctionNotify (email) values ('#trim(form.email)#')
	</cfquery>
</cfif>



<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
	<title>photo-eye | Auctions</title>
</head>

<body bgcolor="White" link="#0000FF" vlink="#000080">

<div align="center"><center>

<table width="580" height="36" border="0" bgcolor="Black" align="center">
<tr>

    <td  width="90%" height="51" align="center"><img src="../img/ExploreArtPhotographyLogo.gif" width="384" height="84"></td>

</tr>
</table>


<table width="580" height="36" border="0" bgcolor="white" align="center">
<tr><td>
<br>
  <p align="center"><font face="verdana, arial, helvetica, sans-serif" size="3" color="Black"><strong>p h o t o - e y e &nbsp;&nbsp;&nbsp; A U C T I O N S</strong><br></font>
				 <img src="../img/Redlinetoc.gif" width="400" height="1" alt="" border="0"> <br><br><font face="verdana, arial, helvetica, sans-serif" size="2" color="Black"> <br> Thank you! <br>
<br>
We will notify you when our first Auction is ready to go!
<br>
<br>
			<b>Return to photo-eye<br><br><a href="../indexbookstore.html">Bookstore</a> </b>- <b><a href="../Gallery/index.cfm">Galleries</a></b></font></p>

</td>

</tr>
</table>
</center></div>
</body>
</html>