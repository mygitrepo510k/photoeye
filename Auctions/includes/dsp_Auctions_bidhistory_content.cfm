

<cfquery name="qGetAuctionAdmin" datasource="photoeyecom">
	Select * from AuctionAdmin where auctionid =1
</cfquery>

<cfquery name="qGetAuctionBids" datasource="photoeyecom">
	Select Max(bid) as Bid, Count(autoid) as Count from AuctionBids where auctionid = 1
</cfquery>

<CFSET xPage1="citation.cfm">

<!--- This is the auction id --->
<CFIF not IsDefined("url.ID")>
	<CFLOCATION URL="index.cfm">
</CFIF>

<cfquery name="qGetAuctionAdmin" datasource="photoeyecom">
	Select * from AuctionAdmin where auctionid = #url.id#
</cfquery>

<cfquery name="qGetAuctionBids" datasource="photoeyecom">
	Select Max(bid) as Bid, Count(autoid) as Count 
	from AuctionBids
	where auctionid = #url.id#
</cfquery>



<div align="center">
<table width="90%" border="0" align="center"">
	<tr>
    	<td  width="95%" align="center">

</td></tr></table>

</div>


<table width="800" align="center" cellpadding="0" cellspacing="0">
<tr height="40"><td></td></tr>
  <tr>
        <td align="center" class="Header"><font color="Black" face="Times, 'Times-Roman', serif" size="5">
A</font><font color="Black" face="Times, 'Times-Roman', serif" size="4">UCTION </FONT><font color="Black" size="5" face="Times, 'Times-Roman', serif">B</font><font color="Black" face="Times, 'Times-Roman', serif" size="4">ID </FONT><font color="Black" size="5" face="Times, 'Times-Roman', serif">H</font><font color="Black" face="Times, 'Times-Roman', serif" size="4">ISTORY</font></td>
  </tr></table>
  
  <!--- Intro --->
<table width="800" align="center" cellpadding="0" cellspacing="0">
<tr height="20"><td></td></tr>
  <tr>
    <td align="center" class="Example"></td>
  </tr></table>
  

<CFOUTPUT>
<table width="500" border="0" cellspacing="0" cellpadding="0" align="center">
	<tr><td align="center">
	
		<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">#qGetAuctionAdmin.Title#<br>
		<br>
		<div align="center">

		<!--- !!!! change back when we go live !!!! --->
	<!---<cfset currentDirectory = GetDirectoryFromPath(GetTemplatePath()) & "img\#url.id#">--->

		<cfset currentDirectory="C:\inetpub\wwwroot\Clients\photoeyecom\html\auctions\img\#url.id#">

		<cfdirectory directory="#currentDirectory#" action="list" name="dirQuery" filter="large.jpg" recurse="no">	

		<CFIF dirQuery.recordcount gt 0>
			
			<cfset xcatillus = 1>
			<!---<CFSET xPath = "img/#url.id#">--->
			<cfset xImageAddress=ExpandPath("/auctions/img/#url.id#/")>
			<cfset xImageNewAddress=ExpandPath("/auctions/img/#url.id#/")>
			<CFSET xHeight = "300">	
			<CFSET xWidth = "300">
			<CFSET xImage = "large">
			<cfset xImageFormat = "jpg">
			<cfset xId="AuctionId">
			<cfset xDbToUpdate="AuctionAdmin">
			<cfset xQueryName="qGetAuctionAdmin">
			<CFSET xAlt = "#qGetAuctionAdmin.Title#">
			<CFSET xQueryImageSizeList = "#qGetAuctionAdmin.ImageSizeList#">
			<CFSET xQueryActualImageSizeList = "#qGetAuctionAdmin.ImageActualSizeList#">
			
			<cfinclude template="/templates/GetImageInfo.cfm">
	
			<a href="#xPage1#?id=#url.id#">
			<img src="/auctions/img/#qGetAuctionAdmin.AuctionID#/#xBookImage#" width="#xBookWidth#" height="#xBookHeight#" alt="#xalt#" <CFIF qGetAuctionAdmin.SpineBorder is 1>border="1" style="border-color: #aBorderColor#; border-width: 1px; border-style: solid;"<CFELSE>border="0"</CFIF>></a>
	
		</CFIF>
	
		</div></td>
</tr><tr height="20"><td></td></tr></table>

<cfquery name="qGetBids" datasource="photoeyecom">
	Select * from AuctionBids where auctionid = #url.id# order by bid desc
</cfquery>


<CFIF qGetAuctionAdmin.EndAnnounced is 1>
	<DIV ALIGN="CENTER">
<CFIF qGetAuctionAdmin.PostAuctionSale gt 0>
	Post-Auction Sale:  <FONT COLOR="MAROON"><b>$#trim(NumberFormat(qGetAuctionAdmin.PostAuctionSale,"99,999"))#</B></FONT><BR>
<cfelseif qGetAuctionBids.bid lt qGetAuctionAdmin.Reserve>
	Reserve Not Met - <A HREF="mailto:auctions@photoeye.com?Subject=Post Auction Inquiry for #qGetAuctionAdmin.Title#">Item Still Available</A>
<BR>
<CFELSE>
	Auction Winner: <FONT COLOR="MAROON"><b>#qGetBids.NickName#</b></FONT>
</CFIF>
	<BR>
	Auction Ended: 
	<b>#TimeFormat(qGetAuctionAdmin.TimeEnd, "h:mm:ss")# 
	<CFIF DatePart("h", qGetAuctionAdmin.TimeEnd) lt 12>AM<CFELSE>PM</CFIF></b>
	 on <b>#DateFormat(qGetAuctionAdmin.TimeEnd, "mmmm d, yyyy")#</b>
	</DIV>
	<BR>
</CFIF>
</CFOUTPUT>
<table width="400" border="0" cellspacing="0" cellpadding="0" align="center">
<tr>
<td align="right" width="50" height="30" valign="top">
<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
<b>Bid $</b></font></td>

<td align="center" width="250" height="30" valign="top">
<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
<b>Bid Date/Time (MT)</b></font></td>

<td align="right" width="100" height="30" valign="top">
<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
<b>Name</b>&nbsp;&nbsp;&nbsp;</font></td>
</tr>
</table>





<CFSET LineCounter = 0> 

<cfoutput query="qGetBids">



<table width="400" border="0" cellspacing="0" cellpadding="0" align="center">

<CFIF LineCounter is 1>
	<tr bgcolor="##DDDDDD">
<CFELSE>
	<TR bgcolor="##EEEEEE">
</CFIF> 

<td align="right" width="50">
<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
<b>$#trim(NumberFormat(Bid,"999,999"))#</b>
</td>
<td align="center" width="250">
<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
<b>#DateFormat(DateTime-CreateTimeSpan(0,2,0,0), "MMM D")#&nbsp;&nbsp;#TimeFormat(DateTime-CreateTimeSpan(0,2,0,0), "H:MM:SS")# </b>
</td>
<td align="right" width="100">
<font color="Black" face="Verdana, Arial, Helvetica, sans-serif" size="2">
<b>#nickname#</b>&nbsp;&nbsp;&nbsp;
</td>
</tr>


	<cfif LineCounter is 0>
 		<CFSET LineCounter = 1>
	<cfelse>
		<CFSET LineCounter = 0>
	</cfif>

</cfoutput>

<!--- Estimated Value --->
<CFOUTPUT>
<TR><TD COLSPAN="3">
<BR>
<CFIF qGetAuctionAdmin.Est_Low gt 0 or qGetAuctionAdmin.Est_High gt 0><b><font color="Maroon" face="Verdana, Arial, Helvetica, sans-serif" size="1"><A HREF="/auctions/AuctionEstimateInfo.cfm">Estimate:</A> $<CFIF qGetAuctionAdmin.Est_Low gt 0>#trim(NumberFormat(qGetAuctionAdmin.Est_Low,"99,999"))#</CFIF><CFIF qGetAuctionAdmin.Est_Low gt 0 and qGetAuctionAdmin.Est_High gt 0>&nbsp;&ndash;&nbsp;</CFIF><CFIF qGetAuctionAdmin.Est_High gt 0>$#trim(NumberFormat(qGetAuctionAdmin.Est_High,"99,999"))#</CFIF></FONT></b><BR></CFIF>
</TD></TR>
</CFOUTPUT>
</table>
<br>
<table align="center"><tr><td align="center">
	  <FORM>
<INPUT TYPE="Button" class="input_button" OnClick="javascript:history.back()" VALUE="Return to Auction" Class="input_button">
</FORM></td></tr>
</table>
