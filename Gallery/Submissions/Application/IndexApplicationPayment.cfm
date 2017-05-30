<CFQUERY NAME="qCheckForCredit" DATASOURCE="photoeyecom">
	select 	PortfolioCredits from GalleryApplication where OrderID = #url.id#
</cfquery>	



<cfoutput>
<!--- <CFIF ISDEFINED("url.step") is false>
	<CFSET STEP=1>
	<CFSET id=0>
	<CFSET custnumber=0>
<CFELSE>
	<CFSET STEP=#url.step#>
	<CFSET custnumber=#url.id#>
</CFIF> --->

<CFIF ISDEFINED("url.id") is false>
	<CFSET custnumber=0>
<CFELSE>
	<CFSET custnumber=#url.id#>
</CFIF>



<cfif qCheckForCredit.PortfolioCredits gt 0>
<frameset cols="245,*" frameborder="0" border="0" framespacing="0" rows="*"> 
  <frame src="toc2.cfm?id=#Custnumber#" name="leftFrame" scrolling="auto" noresize>
  <frame src="Overview2.cfm?id=#Custnumber#" name="mainFrame" id="mainFrame" scrolling="Auto">
</frameset>
<noframes>
<cfinclude template="header.cfm">
 
<body bgcolor="##CCCC99"></body></html></noframes>
<cfelse>

<cfinclude template="header.cfm">

<body bgcolor="##FFF">
<table width="95%" height="36" border="0" bgcolor="white" align="center">
<tr>

    <td  width="95%" height="51" align="center"><img src="/images/photoeye_logo_magazine.png" width="196" height="100"</td>

</tr>
</table>

<table width="85%" align="center"><tr><td width="85%" align="center"><br><br>
<FONT color="black" face="verdana, arial, Helvetica, sans-serif" size="2">
Sorry, but you have already used all of your application credits.<br>If you would like to submit more work for review, please go through the <a href="applynow.html"><strong>application process</strong></a> again.</font>
</td></tr><tr><td align="center"><br><FONT color="black" face="verdana, arial, Helvetica, sans-serif" size="2">
Return to:
<br>
<strong><a href="http://www.photoeye.com/gallery/index.cfm" target="_top">photo-eye Gallery</a> | <a href="http://www.photoeye.com/indexbookstore.html" target="_top">photo-eye Bookstore</a></strong></font>
</td></tr></table>


</body></html>
</cfif>


</cfoutput>
<!--- Step=#Step#& --->

